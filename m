Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918A15A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 01:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681869084; x=1713405084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZOsQ3TDCNgDFsX7cO8Evg8y8yaEBpBFtApi34Dc3CLM=;
  b=F+2kD3kp+JBMHTfnK2XbZSy+rD6gIqguvdohirmxI/M/KRBG/QrIlHp6
   jJouRUuP8mzIZOcIg0+10p1rtjc+AF/4BsPCVWG0h9lXkeV7i2t0AcUZK
   8IVC2JdVF4uPLXuhuEfn5NpUswxrkvHGFm9k2LTsQg6kTmVOXtooxkYi9
   Bzh+RASd4vp/sWJk2qI6lhz6nU4HFtK7akU1O/Jx58IiadxBMfot/AlBO
   uAedkZI4NHd0d4ryCa1V0qoRXKiJuESZ+oAO7seuUKkJIkLDpeU60C6nX
   OP9lI9Fo8SjTI80+RrGhw0wGbg4rHAKlI3NbKrlk9VKToaF10LFBB0ZKB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334134833"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="334134833"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 18:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802761934"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="802761934"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2023 18:51:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1powyf-000eLx-2i;
	Wed, 19 Apr 2023 01:51:21 +0000
Date: Wed, 19 Apr 2023 09:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Le Ma <le.ma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 61/67]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:451:16: warning: variable 'j' set
 but not used
Message-ID: <202304190956.FYlPg0iH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   86b20703e4c5a3c39891def0a68e7438aeca9db9
commit: def799c6596d078112095c24c25e162cb5102d90 [61/67] drm/amdgpu: add multi-xcc support to amdgpu_gfx interfaces (v4)
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304190956.FYlPg0iH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout def799c6596d078112095c24c25e162cb5102d90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190956.FYlPg0iH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_mqd_sw_fini':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:451:16: warning: variable 'j' set but not used [-Wunused-but-set-variable]
     451 |         int i, j;
         |                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_disable_kcq':
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:486:13: warning: variable 'j' set but not used [-Wunused-but-set-variable]
     486 |         int j;
         |             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_enable_kcq':
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:529:19: warning: variable 'j' set but not used [-Wunused-but-set-variable]
     529 |         int r, i, j;
         |                   ^


vim +/j +451 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

   447	
   448	void amdgpu_gfx_mqd_sw_fini(struct amdgpu_device *adev, int xcc_id)
   449	{
   450		struct amdgpu_ring *ring = NULL;
 > 451		int i, j;
   452		struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
   453	
   454		if (adev->asic_type >= CHIP_NAVI10 && amdgpu_async_gfx_ring) {
   455			for (i = 0; i < adev->gfx.num_gfx_rings; i++) {
   456				ring = &adev->gfx.gfx_ring[i];
   457				kfree(adev->gfx.me.mqd_backup[i]);
   458				amdgpu_bo_free_kernel(&ring->mqd_obj,
   459						      &ring->mqd_gpu_addr,
   460						      &ring->mqd_ptr);
   461			}
   462		}
   463	
   464		for (i = 0; i < adev->gfx.num_compute_rings; i++) {
   465			j = i + xcc_id * adev->gfx.num_compute_rings;
   466			ring = &adev->gfx.compute_ring[i];
   467			kfree(adev->gfx.mec.mqd_backup[i]);
   468			amdgpu_bo_free_kernel(&ring->mqd_obj,
   469					      &ring->mqd_gpu_addr,
   470					      &ring->mqd_ptr);
   471		}
   472	
   473		ring = &kiq->ring;
   474		kfree(kiq->mqd_backup);
   475		kfree(adev->gfx.mec.mqd_backup[AMDGPU_MAX_COMPUTE_RINGS]);
   476		amdgpu_bo_free_kernel(&ring->mqd_obj,
   477				      &ring->mqd_gpu_addr,
   478				      &ring->mqd_ptr);
   479	}
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
