Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FE424A09
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228010; cv=none; b=If6cwMmcDlETxiGibR0jMTjVRS4KABRob3Ij/oi6206xGvqGjShHwSpLwuMVHyhGvNkeBJ7hK8/BRWlTvrKNy9dquUxdeIACszfMczk/shHQKrw/uWyoQtV3SUB4x4kj911ij3zWuFrEQkK9Opl2Y3vWzvHX5xAFBvnCONWjjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228010; c=relaxed/simple;
	bh=BquyEB7BLKyEZMAsmocqveCcP6w0u/CD9uTXRZacHSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uaUiKeyISsplp2+zzmFzd+jrwatYVqJnlUjpQbDFJD8PER61x+SNSsuJog5sUveUgAFepWIh/9Ni48/10YuOANgJ+di6aadVgDv1tzP7u0NtVjXRdY2JeNOSRfmJr1A0Iertd1vKAKKOLQWWzu9Ril27+5iU3a0Iyx4GxZaeEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7IPmcem; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7IPmcem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707228009; x=1738764009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BquyEB7BLKyEZMAsmocqveCcP6w0u/CD9uTXRZacHSI=;
  b=C7IPmcemDONpxNOQ0WcCw8NXM6Zsn48TsBEEmifQdb7bZYnJAc0nwhnr
   BwW5iv4G8xBfrND1+7gMIk3HUNtvJJvkoCFTIhh8poEkgB1jPU/59QG5z
   1jRcIGsceFs8prKPrlZUxS/OaltFwk5XECAooWRrRzWa2VMkLZiPfSpWU
   1Q+ppRWLbn+jyPfqGdhrMdNGEuxVdIiJj+nXvVhRD5wqwxrOwDWIbExAy
   yOvC8wdmvSKEEX0weH0vVQLlz8aNK4iwWfs9W7o2jaOv+JUMJViMOnW9v
   gN1lDYci3YxJ9jEw8Mas+qax6NoO3Dus9pFLnNI0Sb/cx9iwBgfhZ6H3i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="23223395"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="23223395"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:00:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1345509"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Feb 2024 06:00:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXLzY-0001RY-0I;
	Tue, 06 Feb 2024 14:00:04 +0000
Date: Tue, 6 Feb 2024 21:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15026/21616]
 arch/arm64/mm/init.c:790:17: error: 'pmu_nmi_enable' undeclared; did you
 mean 'perf_pmu_enable'?
Message-ID: <202402062148.BWGcSjzi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 0c40cea7cfc2d1d9762e6fbbb531a43e6dac95ca [15026/21616] NMI: Enable arm-pmu interrupt as NMI in Acensed.
config: arm64-randconfig-001-20240205 (https://download.01.org/0day-ci/archive/20240206/202402062148.BWGcSjzi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062148.BWGcSjzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062148.BWGcSjzi-lkp@intel.com/

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
