Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFA465ECF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="kkuxpK+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DdZmsRXOLrsoodS4ETKfoRiSA07z35X21HpYjdvghg=;
  b=kkuxpK+Kp6EAPx/V5lOQmeqKtZwi41ObdM9JxF5fKOORjIaojfYmrdKM
   0Ces5cy4s7QKamrM3ogO53zzdRqw9sO1HgOSo/7LF1Q2t74ESgISGEs8x
   gl4jjsAygALrJRssvHVgE/VD9THMKbxWGWrWdj1/9KjNgkQ03ak8eXeRZ
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,276,1695679200"; 
   d="scan'208";a="74468187"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:33:34 +0100
Date: Thu, 14 Dec 2023 18:33:34 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Vincent Guittot <vincent.guittot@linaro.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:sched/system-pressure 5/11] drivers/acpi/cppc_acpi.c:1783:13-14:
 WARNING opportunity for max() (fwd)
Message-ID: <alpine.DEB.2.22.394.2312141833130.3217@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Fri, 15 Dec 2023 01:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vincent-guittot:sched/system-pressure 5/11]
    drivers/acpi/cppc_acpi.c:1783:13-14: WARNING opportunity for max()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vincent Guittot <vincent.guittot@linaro.org>

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/system-pressure
head:   5844548bc216fd4d47bc8b20f0ff22ac4b14d48d
commit: 3c697464bdc4ede5507ebb0f43112b31cb07a3d9 [5/11] cpufreq/cppc: Move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20231214 (https://download.01.org/0day-ci/archive/20231215/202312150148.V2p83vod-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150148.V2p83vod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312150148.V2p83vod-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/cppc_acpi.c:1783:13-14: WARNING opportunity for max()

vim +1783 drivers/acpi/cppc_acpi.c

3c697464bdc4ed Vincent Guittot 2023-09-18  1772
3c697464bdc4ed Vincent Guittot 2023-09-18  1773  /* Callback function used to retrieve the max frequency from DMI */
3c697464bdc4ed Vincent Guittot 2023-09-18  1774  static void cppc_find_dmi_mhz(const struct dmi_header *dm, void *private)
3c697464bdc4ed Vincent Guittot 2023-09-18  1775  {
3c697464bdc4ed Vincent Guittot 2023-09-18  1776  	const u8 *dmi_data = (const u8 *)dm;
3c697464bdc4ed Vincent Guittot 2023-09-18  1777  	u16 *mhz = (u16 *)private;
3c697464bdc4ed Vincent Guittot 2023-09-18  1778
3c697464bdc4ed Vincent Guittot 2023-09-18  1779  	if (dm->type == DMI_ENTRY_PROCESSOR &&
3c697464bdc4ed Vincent Guittot 2023-09-18  1780  	    dm->length >= DMI_ENTRY_PROCESSOR_MIN_LENGTH) {
3c697464bdc4ed Vincent Guittot 2023-09-18  1781  		u16 val = (u16)get_unaligned((const u16 *)
3c697464bdc4ed Vincent Guittot 2023-09-18  1782  				(dmi_data + DMI_PROCESSOR_MAX_SPEED));
3c697464bdc4ed Vincent Guittot 2023-09-18 @1783  		*mhz = val > *mhz ? val : *mhz;
3c697464bdc4ed Vincent Guittot 2023-09-18  1784  	}
3c697464bdc4ed Vincent Guittot 2023-09-18  1785  }
3c697464bdc4ed Vincent Guittot 2023-09-18  1786

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
