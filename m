Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36301136658
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730023087; cv=none; b=WfDxp4YacdEf86E0l/5tV/qyWPPbMMFITow+dxIILdEreS5uwz4zFcxOZ0gwa/7O8VKh6q+488NlbP+tXYw6Co+VqOG4mJZyJ4urOdEv5bATOZxC3D7xUGmT3SEkeBpfnfh8tUl1U2yKlC5rYFCPodmnta/KSQRdETfNc5TtZMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730023087; c=relaxed/simple;
	bh=ub6t4/EOCrpwlqEfuLTvoJak6Ljlir+O2gUXQRnARXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTAuMiYBawwjptMbP0biAEgoLxDBfk5N+YNfIvLyELxLOjX13G6rPqEmJJ7EDujVt9t1QhLGl5XLUxEq35yfJfJjB4KNEdEM20hiSbnspSNTTEtsmrK815mvGaVjeM6uC7d25YJNJhWmcVM+M5nu/ph6TZVqhvuMnyxtRCr1oNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8Qgv5IU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8Qgv5IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730023085; x=1761559085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ub6t4/EOCrpwlqEfuLTvoJak6Ljlir+O2gUXQRnARXQ=;
  b=k8Qgv5IUs6o8HWp0qBEPQITQ+Z1VOshpiSBeypYDwOgdiF0leMCU1Cgq
   XjPEmuACYlcLnWBOql68JBeegC3l2GLVszG5J7CWLpf/7ZCZnKvm+KjME
   h2kn4BjQ561CmTlkS1sfjqUmOHT3nECqG8hLFZeH2c6HqLYIeILEnWhVP
   iuoIBhwNOmE80je32YtXJGfEEioCKOQCWZaqoR29pGdg2hIoCYH2zXwG5
   pj2dplKcaRrAzWxtpqUJXUy0E+KQ2RmwKMG9Nyva20bjrvejcsOKX6RQN
   ekYy64piCp6BONoRGBAs804iN5Xm6VgqRidV/BLpdbras8I1wXzjHAVQd
   Q==;
X-CSE-ConnectionGUID: wVSrJzBdQHa/SrFH31SBTw==
X-CSE-MsgGUID: dYiu7wc4T3eAgrzhF43SrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="17272170"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="17272170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 02:58:02 -0700
X-CSE-ConnectionGUID: jsddbNqTQ6uY42ht+nmo1w==
X-CSE-MsgGUID: hCAKgQiZQc6/xirkFoaGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81371173"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2024 02:58:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5023-000abi-1P;
	Sun, 27 Oct 2024 09:57:59 +0000
Date: Sun, 27 Oct 2024 17:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15026/23866]
 arch/arm64/mm/init.c:790:17: error: 'pmu_nmi_enable' undeclared; did you
 mean 'perf_pmu_enable'?
Message-ID: <202410271711.fq8r9NpJ-lkp@intel.com>
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
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 0c40cea7cfc2d1d9762e6fbbb531a43e6dac95ca [15026/23866] NMI: Enable arm-pmu interrupt as NMI in Acensed.
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271711.fq8r9NpJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271711.fq8r9NpJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271711.fq8r9NpJ-lkp@intel.com/

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
