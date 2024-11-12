Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006472170DD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731446835; cv=none; b=YkCeStb8KIVUQMTcfMuGUn8FFZ2WESAXzJjFtLIbRmyCC5OKtcaWcvasZZ+8NrxschfPgRdXCP+bg+wyrWKlJR/FiIXAc01iOor0h5sPA5Q02N1EYVMCbMCcoc9VB3l4KqiAH29cNsfbksUdt0eTrMv3t6kkDMezRwdRw0jFdTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731446835; c=relaxed/simple;
	bh=pGL3qLDlWDQOjUA8hjs4x+ToJqZbiBUEZRsQQTIQgW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKEETE1MtJX2EicnpO1zJ393AtOeDXAkCTF0xohIyy42woWnMyCqn9nuGQfpP0QpOVaGvMwd8Gbd2Cz89stwdEG0vrFlc71a8OE2w+PQqW+0SqGptsCrXgJ2gpcd0bu15OGweTMM4ZhkfaNO4c4nPU4+GTR3CmILk0t6Bmc0IkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlQgOisK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlQgOisK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731446833; x=1762982833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGL3qLDlWDQOjUA8hjs4x+ToJqZbiBUEZRsQQTIQgW8=;
  b=DlQgOisKBN0XlfJoWg7Fz90Km+0H20hz/pmPZXGKX5hdCSHm1zo19+l6
   UAt5Bz/GGUeSq9kvsd1pTd9d8lhvOiPecVeg8lLEl3kR2quKF1tVvBxhs
   ajy02NLJ9iwNySoMKFX7yGm/HXkLbcTcoU+2JXLVNXOshhpCkxIqux2Tr
   tutIVzEX9RMxW2m1NLZJ/7BofnJylw89lXcxQHBuAESrAU/BtDbYGDvrF
   4zbfeLmA6uQhCgS78phaxeS8LBM2/H/KRGvyO0PPM/puuid5OBWHfmxWp
   Wp//qzNFBRyI7vU2iSi7wo3iqCVrZC3wTG56HlF/D+Vthw/DvLv4IP+H5
   A==;
X-CSE-ConnectionGUID: +U1dLhpbSDqTIOafCnS/QQ==
X-CSE-MsgGUID: mQko1g8ESRqwlzSD9KwYxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31480759"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31480759"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 13:27:12 -0800
X-CSE-ConnectionGUID: yG+jp4hARZq1WBCWZSZeRw==
X-CSE-MsgGUID: yvUOm93BSyu+IC8O8Sl42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="91702126"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2024 13:27:11 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAyPl-0001kI-0f;
	Tue, 12 Nov 2024 21:27:09 +0000
Date: Wed, 13 Nov 2024 05:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1290/1290] arch/arm64/mm/init.c:790:17:
 error: 'pmu_nmi_enable' undeclared; did you mean 'perf_pmu_enable'?
Message-ID: <202411130527.FCTcx7wa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58ec866c31299a4b0d63a01cb026877c5f85e4d9
commit: 0c40cea7cfc2d1d9762e6fbbb531a43e6dac95ca [1290/1290] NMI: Enable arm-pmu interrupt as NMI in Acensed.
config: arm64-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130527.FCTcx7wa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130527.FCTcx7wa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130527.FCTcx7wa-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_all_features':
   arch/arm64/mm/init.c:787:17: error: 'mem_sleep_current' undeclared (first use in this function)
     787 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:787:17: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/mm/init.c:790:17: error: 'pmu_nmi_enable' undeclared (first use in this function); did you mean 'perf_pmu_enable'?
     790 |                 pmu_nmi_enable = true;
         |                 ^~~~~~~~~~~~~~
         |                 perf_pmu_enable


vim +790 arch/arm64/mm/init.c

   774	
   775	void ascend_enable_all_features(void)
   776	{
   777		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   778			enable_mmap_dvpp = 1;
   779	
   780		if (IS_ENABLED(CONFIG_ASCEND_IOPF_HIPRI))
   781			enable_iopf_hipri = 1;
   782	
   783		if (IS_ENABLED(CONFIG_ASCEND_CHARGE_MIGRATE_HUGEPAGES))
   784			enable_charge_mighp = 1;
   785	
   786		if (IS_ENABLED(CONFIG_SUSPEND))
   787			mem_sleep_current = PM_SUSPEND_ON;
   788	
   789		if (IS_ENABLED(CONFIG_PMU_WATCHDOG))
 > 790			pmu_nmi_enable = true;
   791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
