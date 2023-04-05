Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA27F8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680677823; x=1712213823;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xQVmzZm+I/9iNm9KWsKsO41wYj+UBZ4LQSOkJEbvBxo=;
  b=SwEx5sLuShY7wMXYvsKc5qtk3ZAgSio0LTW3aOQXT3PmbdPdzaN+yAZS
   bD/RQXolcIh/N96SALnC7X349vanrWMfo+dU7kD4LYNEqm2EPsCpnOAqT
   HQLHWLyQWqUnrYm7EOnhYRzgm704aq3e/dIIZcurhoFYJqu9wvw8fGB28
   mEafiCKKwCdS0BcuWcljS3I/zJTN+JKbQ+M1l2iCVhOWifiHPfFRwYj4Q
   vIhhV/EFolldRA42FQKkCDEdjpqk2arCpOadyFd4fNh87aoEzQhPz9DLR
   0fhlirVo4UyqQHuOGCd3z0nCCRPgtFdMQDxiLHN+NXhqikr6MY1lxjTAb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322768789"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="322768789"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 23:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686646225"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="686646225"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Apr 2023 23:57:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjx4m-000QNE-39;
	Wed, 05 Apr 2023 06:57:00 +0000
Date: Wed, 5 Apr 2023 14:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 123/124]
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:130:27: warning: variable 'hw_fence'
 set but not used
Message-ID: <202304051406.5gV4sdVR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7379ec723197b418f1f4f8b77bd497e4c552aa73
commit: 1f3bc0150abc9709207bf9bb3ecbb67004cc400c [123/124] drm/amdgpu: fix amdgpu_job_free_resources v2
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230405/202304051406.5gV4sdVR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=1f3bc0150abc9709207bf9bb3ecbb67004cc400c
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 1f3bc0150abc9709207bf9bb3ecbb67004cc400c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051406.5gV4sdVR-lkp@intel.com/

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
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  138  	/* Check if any fences where initialized */
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  139  	if (job->base.s_fence && job->base.s_fence->finished.ops)
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  140  		f = &job->base.s_fence->finished;
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  141  	else if (job->hw_fence.ops)
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  142  		f = &job->hw_fence;
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  143  	else
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  144  		f = NULL;
1f3bc0150abc97 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König 2023-01-12  145  
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
