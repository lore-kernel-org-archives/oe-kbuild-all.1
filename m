Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AD81D695
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krFG18Kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699047298; x=1730583298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xvtcNs5g7UwHiNQjL1gg+wHUfnqV8W0f7NJCc49sSnM=;
  b=krFG18KqJKzb9ua49ZptWpFBqrilQoRxdGWCD2XYzA2mxMglleI2yWE5
   cosnvWPNIHY3p7H9WSq/MbtFtD0QVxezginwEcaklHoCEcABcS4ROm9EI
   Fg8Acj+0ck4ZfLY7TGIAwGM2XgyrddwkmPE1HmTfvuLWBmgfB+NgkW8vc
   s5KK8z+4ukqvqZZvRCiC/d0FBwV8/foQRxJdWhWiY8pA+mps6L7FwcVV6
   RIcG2TEs/llZwpuoSiafBHEuTn1rEOg8mgWPK7g6pAPDtT1oUWvC8KxRN
   H/YKeKF9mQWOM88REiY02/pfTrAEoSM7AMoRwX6q+2w1rSxozI++80H8q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388851804"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="388851804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 14:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="9863024"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 14:34:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz1ob-0002xw-3B;
	Fri, 03 Nov 2023 21:34:53 +0000
Date: Sat, 4 Nov 2023 05:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: [drm-xe:oak/drm-evictable-lru 8/11]
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: error:
 'VMW_PL_SYSTEM' undeclared; did you mean 'TTM_PL_SYSTEM'?
Message-ID: <202311040523.0e7IuFDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: 5c7ab6e4b1aea6c20a00aeb0110f82696d5840e3 [8/11] drm: Initialize drm lru manager
config: loongarch-randconfig-002-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040523.0e7IuFDX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040523.0e7IuFDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040523.0e7IuFDX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function 'amdgpu_preempt_mgr_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: error: 'VMW_PL_SYSTEM' undeclared (first use in this function); did you mean 'TTM_PL_SYSTEM'?
     121 |         ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[VMW_PL_SYSTEM]);
         |                                                             ^~~~~~~~~~~~~
         |                                                             TTM_PL_SYSTEM
   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: note: each undeclared identifier is reported only once for each function it appears in


vim +121 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c

    92	
    93	/**
    94	 * amdgpu_preempt_mgr_init - init PREEMPT manager and DRM MM
    95	 *
    96	 * @adev: amdgpu_device pointer
    97	 *
    98	 * Allocate and initialize the GTT manager.
    99	 */
   100	int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
   101	{
   102		struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
   103		struct drm_device *drm = adev_to_drm(adev);
   104		int ret;
   105	
   106		man->use_tt = true;
   107		man->func = &amdgpu_preempt_mgr_func;
   108	
   109		ttm_resource_manager_init(man, &adev->mman.bdev, (1 << 30));
   110	
   111		ret = device_create_file(adev->dev, &dev_attr_mem_info_preempt_used);
   112		if (ret) {
   113			DRM_ERROR("Failed to create device file mem_info_preempt_used\n");
   114			return ret;
   115		}
   116	
   117		ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT, man);
   118		ttm_resource_manager_set_used(man, true);
   119	
   120		drm_lru_mgr_init(&drm->lru_mgr[AMDGPU_PL_PREEMPT], (1 << 30), &drm->lru_lock);
 > 121		ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[VMW_PL_SYSTEM]);
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
