Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9432D033
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Xnel6NkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nAkWiQtXa9kt+ivIVcZPDeOMWxEMs6zxXitEh1wqH4=;
  b=Xnel6NkPAEZ5VOoybYVJoeSEdYbSfKgXEV4uvGQzp1tP1t+poLwj/1bt
   5vh7dWynde1T0Vnoj3FvzSkIO1xcuRAaapZNPTDmlXsrWdmKHIF49KmLv
   r9B3DcpQb/iRBOEBt9r9GLAJOHU3hUqEPyxxZN6wB1kDpn2RQKmnsMM3R
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,255,1695679200"; 
   d="scan'208";a="73589937"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 14:05:00 +0100
Date: Wed, 6 Dec 2023 14:04:59 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@kernel.org>, 
    Chi-hsien Lin <chi-hsien.lin@cypress.com>, Ian Lin <ian.lin@infineon.com>
cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:116:6-9:
 WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
Message-ID: <4b2b846e-bdd3-e2ef-da1b-ff99a528190@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

Please check on whether the array of size 1 is supposed to be a flexible
array, ie [].

julia

---------- Forwarded message ----------
Date: Wed, 6 Dec 2023 20:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:116:6-9:
    WARNING use flexible-array member instead
    (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-
    and-one-element-arrays)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Wright Feng <wright.feng@cypress.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: "Chi-hsien Lin" <chi-hsien.lin@cypress.com>
CC: Ian Lin <ian.lin@infineon.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 6c04deae1438e5df59fc4848795248fc34961f51 brcmfmac: Add dump_survey cfg80211 ops for HostApd AutoChannelSelection
date:   1 year, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: csky-randconfig-r053-20231201 (https://download.01.org/0day-ci/archive/20231206/202312062022.N0mzFcPn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312062022.N0mzFcPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312062022.N0mzFcPn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:116:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +116 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

6c04deae1438e5 Wright Feng 2022-09-28  112
6c04deae1438e5 Wright Feng 2022-09-28  113  struct cca_stats_n_flags {
6c04deae1438e5 Wright Feng 2022-09-28  114  	u32 msrmnt_time; /* Time for Measurement (msec) */
6c04deae1438e5 Wright Feng 2022-09-28  115  	u32 msrmnt_done; /* flag set when measurement complete */
6c04deae1438e5 Wright Feng 2022-09-28 @116  	char buf[1];
6c04deae1438e5 Wright Feng 2022-09-28  117  };
6c04deae1438e5 Wright Feng 2022-09-28  118

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
