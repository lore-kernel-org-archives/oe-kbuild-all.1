Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA51F17B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P90igGHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702058057; x=1733594057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCHte8bmYBS8picSFrflGKAueMkdMi2MwMQHX/kl5CM=;
  b=P90igGHi4tZ4szmgUREhBvAgd3u+dc9AwBLc6AXOdDq1FCVA9mMjn/se
   3UJYVM1megqg7yxJ8gEoKtfnX67UhpQEjZSwIg+R3U4p/rmsGKNdtMhcK
   HxUjokbhdc+bOP7rRPSTqSUVxl6JojI+UlOBR2sV9AyTXHa5oxnvqLAx/
   OO//n2JaIkExLKcpD0eNHUIINFQhoYu6Ot+fp7pFcy2tHwlwHDIpiwto3
   ZJbWS3UqiwRBqfYR4LJiW41emb5OENGXcBdkrEpGd/eJxWcSEQywTUi1F
   4LlQKhSr99cM4av61YrGFlF2Zk+xUTtvbkg6IjTpyG9Jh4NdGoFrDpPMC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="13138157"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="13138157"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 09:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890203473"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="890203473"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2023 09:54:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBf3D-000E99-33;
	Fri, 08 Dec 2023 17:54:11 +0000
Date: Sat, 9 Dec 2023 01:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: drivers/net/dsa/sja1105/sja1105.o: warning: objtool:
 sja1105_fast_age() falls through to next function sja1105_setup.cold()
Message-ID: <202312090101.IgQIACgf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   11 months ago
config: x86_64-buildonly-randconfig-003-20230911 (https://download.01.org/0day-ci/archive/20231209/202312090101.IgQIACgf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090101.IgQIACgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090101.IgQIACgf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/sja1105/sja1105.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105_setup.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
