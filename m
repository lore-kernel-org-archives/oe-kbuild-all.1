Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BB8BE0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680793646; x=1712329646;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q9G/tE5KJaXy6X8N9NcK3YTRehThk7kpPp0GrBFxgCQ=;
  b=VM2cz9/3rUImgM00NTjTPGBhb7bG4a2OJkj4zoHvgbH/wcwmliIE/byK
   kZ5gP1seG7nGUnF38jM9Cu3bor1LpfaynV2TqnAxMBvu3BbUtPx8gcpkq
   rw5jMBEfsMfE7FatJbk65JEv9PFZQRk0yH0Hnbt/qx45SxeFsIGM2ze25
   Sgby0NN+OdVsYi4h1OjdaXZzGSUfRpo6VyGD0Otl1z+/0YA7xH1HyibU9
   /meryKxX+8Z9sMZ4RuM8EOsgGnhv9DrvZi8NVbU0nLt2CouAZ2jpdgeOa
   ZpgwzVCZGKZgR52Iute2GpaVXltMc4plqjKfwCx2+aTM21E61MZFb4Itt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341489194"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="341489194"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 08:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="811041158"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="811041158"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2023 08:07:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkRCR-000RSa-2z;
	Thu, 06 Apr 2023 15:06:55 +0000
Date: Thu, 6 Apr 2023 23:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-stable-rc:queue/5.15 23/24]
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:130:27: warning: variable 'hw_fence'
 set but not used
Message-ID: <202304062305.JmYJlD94-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   10e14d35d2d3abd017c3f2a70a67cc3786f0b25f
commit: 9123d2a97994f77e84e8ebaed5dad9746d79f77c [23/24] drm/amdgpu: fix amdgpu_job_free_resources v2
config: alpha-randconfig-r036-20230403 (https://download.01.org/0day-ci/archive/20230406/202304062305.JmYJlD94-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=9123d2a97994f77e84e8ebaed5dad9746d79f77c
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 9123d2a97994f77e84e8ebaed5dad9746d79f77c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062305.JmYJlD94-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c: In function 'amdgpu_job_free_resources':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:130:27: warning: variable 'hw_fence' set but not used [-Wunused-but-set-variable]
     130 |         struct dma_fence *hw_fence;
         |                           ^~~~~~~~


vim +/hw_fence +130 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

d71518b5aa7c9c drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c Christian König 2016-02-01  125  
a5fb4ec29c74a1 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2016-06-29  126  void amdgpu_job_free_resources(struct amdgpu_job *job)
50838c8cc413de drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c Christian König 2016-02-03  127  {
a1917b73d89e88 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2018-07-13  128  	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
f54d1867005c33 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Chris Wilson    2016-10-25  129  	struct dma_fence *f;
c530b02f39850a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Jack Zhang      2021-05-12 @130  	struct dma_fence *hw_fence;
1ab0d211f3b814 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2016-05-18  131  	unsigned i;
1ab0d211f3b814 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2016-05-18  132  
c530b02f39850a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Jack Zhang      2021-05-12  133  	if (job->hw_fence.ops == NULL)
c530b02f39850a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Jack Zhang      2021-05-12  134  		hw_fence = job->external_hw_fence;
c530b02f39850a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Jack Zhang      2021-05-12  135  	else
c530b02f39850a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Jack Zhang      2021-05-12  136  		hw_fence = &job->hw_fence;
50838c8cc413de drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c Christian König 2016-02-03  137  
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  138  	/* Check if any fences where initialized */
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  139  	if (job->base.s_fence && job->base.s_fence->finished.ops)
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  140  		f = &job->base.s_fence->finished;
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  141  	else if (job->hw_fence.ops)
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  142  		f = &job->hw_fence;
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  143  	else
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  144  		f = NULL;
9123d2a97994f7 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  145  
50838c8cc413de drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c Christian König 2016-02-03  146  	for (i = 0; i < job->num_ibs; ++i)
a1917b73d89e88 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2018-07-13  147  		amdgpu_ib_free(ring->adev, &job->ibs[i], f);
d71518b5aa7c9c drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c Christian König 2016-02-01  148  }
d71518b5aa7c9c drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c Christian König 2016-02-01  149  

:::::: The code at line 130 was first introduced by commit
:::::: c530b02f39850a639b72d01ebbf7e5d745c60831 drm/amd/amdgpu embed hw_fence into amdgpu_job

:::::: TO: Jack Zhang <Jack.Zhang1@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
