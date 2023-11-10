Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A03B7B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 20:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UR24y3Hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699648701; x=1731184701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXRiMpTD/JDelI8e4R6j2iXu2EgOSM7EPmR+vn8rI/Y=;
  b=UR24y3HyuJ24EFLWPYiZQL0rPe9MZucYVHYyt2oKvazOaFco7tiMvSUg
   xzeqxFsYY/rwMxS/mQa1aWC+YDS5d3J+Wz1Mu1RQqf1iDPQihO8c2mBF4
   8yyJYQUVSfUIsHV+bFdK424WJ7SdstHPhzmLqRqdkKM8O7RhgAd25DXR3
   er+AAogQZTcKazMyUcEX3CuOFtDNjsYJyWIrGthKOLHuOhpVEUq8yisw4
   I6c67kjeo7JTRvsXhgGns5Dg3ixvNXdF+6AG1YhpmNhlCp6niXs0kO3s2
   wRSgyvbkXXrYEUbJcmuVNEqYrXPqGlm+dgYJQU8krDYUr+d/dZpISN/Gq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="393103212"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="393103212"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 12:38:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11560457"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2023 12:38:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1YGf-0009sk-1B;
	Fri, 10 Nov 2023 20:38:17 +0000
Date: Sat, 11 Nov 2023 04:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Luben Tuikov <ltuikov89@gmail.com>
Subject: [agd5f:drm-next-6.7 65/67]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:237: warning: Function parameter or
 member 'ring' not described in 'amdgpu_vce_entity_init'
Message-ID: <202311110442.U0sUJbo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.7
head:   8473bfdcb5b1a32fd05629c4535ccacd73bc5567
commit: 037b98a2312e2587163de14afae8ae1b64b67dda [65/67] drm/amdgpu: move UVD and VCE sched entity init after sched init
config: loongarch-randconfig-002-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110442.U0sUJbo8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110442.U0sUJbo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110442.U0sUJbo8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:237: warning: Function parameter or member 'ring' not described in 'amdgpu_vce_entity_init'
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:405: warning: Function parameter or member 'ring' not described in 'amdgpu_uvd_entity_init'


vim +237 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c

d38ceaf99ed015 Alex Deucher 2015-04-20  228  
20acbed47d30ef Emily Deng   2018-08-13  229  /**
20acbed47d30ef Emily Deng   2018-08-13  230   * amdgpu_vce_entity_init - init entity
20acbed47d30ef Emily Deng   2018-08-13  231   *
20acbed47d30ef Emily Deng   2018-08-13  232   * @adev: amdgpu_device pointer
20acbed47d30ef Emily Deng   2018-08-13  233   *
037b98a2312e25 Alex Deucher 2023-11-08  234   * Initialize the entity used for handle management in the kernel driver.
20acbed47d30ef Emily Deng   2018-08-13  235   */
037b98a2312e25 Alex Deucher 2023-11-08  236  int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
20acbed47d30ef Emily Deng   2018-08-13 @237  {
037b98a2312e25 Alex Deucher 2023-11-08  238  	if (ring == &adev->vce.ring[0]) {
037b98a2312e25 Alex Deucher 2023-11-08  239  		struct drm_gpu_scheduler *sched = &ring->sched;
20acbed47d30ef Emily Deng   2018-08-13  240  		int r;
20acbed47d30ef Emily Deng   2018-08-13  241  
b3ac17667f115e Nirmoy Das   2019-12-05  242  		r = drm_sched_entity_init(&adev->vce.entity, DRM_SCHED_PRIORITY_NORMAL,
b3ac17667f115e Nirmoy Das   2019-12-05  243  					  &sched, 1, NULL);
20acbed47d30ef Emily Deng   2018-08-13  244  		if (r != 0) {
20acbed47d30ef Emily Deng   2018-08-13  245  			DRM_ERROR("Failed setting up VCE run queue.\n");
20acbed47d30ef Emily Deng   2018-08-13  246  			return r;
20acbed47d30ef Emily Deng   2018-08-13  247  		}
037b98a2312e25 Alex Deucher 2023-11-08  248  	}
20acbed47d30ef Emily Deng   2018-08-13  249  
20acbed47d30ef Emily Deng   2018-08-13  250  	return 0;
20acbed47d30ef Emily Deng   2018-08-13  251  }
20acbed47d30ef Emily Deng   2018-08-13  252  

:::::: The code at line 237 was first introduced by commit
:::::: 20acbed47d30efbf14e5aecc5ec5e5f152db7810 drm/amdgpu/vce: VCE entity initialization relies on ring initializtion

:::::: TO: Emily Deng <Emily.Deng@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
