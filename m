Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78110977
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 21:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688766975; x=1720302975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4XhhT6PdOxr2KpMl+vawQXCKoInZnbWuoDeKxdYaRo=;
  b=etFblk+hR7NacBo+WpiWotTQNcmt7N+d98aMfJE48M9ZLqyBTufuLUL9
   JVqCBRnEPVvfCRcrUN2avwzRWyzzqnlgiTfB656m/fEV/GkqyE2N7ABUk
   8OZ0aVhmIzmGZVusiXyxWl+W3NMGnfDHVfMYzZoJyJ0cDYbbhpGFB5iOK
   d054qRXdy/ovNqZhrOQfGeTwPX2vJWosJNoyWl0jhN7tkskOOE584X9JU
   LC9Nes8bOd1SM3aczAzdcBfaLxtou61jir5CU6tD9HSzz9KWEfH+n0gCw
   Ieno5tPceHnf3eaygclRZCCAy3D8Sbik2RrGrNV/ZV7U44NKohHEoQU/0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="343578167"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="343578167"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="714168195"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="714168195"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Jul 2023 14:56:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHtQw-0002KM-2R;
	Fri, 07 Jul 2023 21:56:10 +0000
Date: Sat, 8 Jul 2023 05:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mukul Joshi <mukul.joshi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Subject: [agd5f:drm-next 22/46]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:868:1: warning: the frame size of
 1184 bytes is larger than 1024 bytes
Message-ID: <202307080505.V12qS0oz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   3de4536fe42d097d64343bb7013035863005de10
commit: 9041b53a59d77039c69fa61be8575fa232cd3bcd [22/46] drm/amdkfd: Use KIQ to unmap HIQ
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230708/202307080505.V12qS0oz-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080505.V12qS0oz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080505.V12qS0oz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c: In function 'amdgpu_amdkfd_unmap_hiq':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:868:1: warning: the frame size of 1184 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     868 | }
         | ^


vim +868 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c

   833	
   834	int amdgpu_amdkfd_unmap_hiq(struct amdgpu_device *adev, u32 doorbell_off,
   835				    u32 inst)
   836	{
   837		struct amdgpu_kiq *kiq = &adev->gfx.kiq[inst];
   838		struct amdgpu_ring *kiq_ring = &kiq->ring;
   839		struct amdgpu_ring_funcs ring_funcs;
   840		struct amdgpu_ring ring;
   841		int r = 0;
   842	
   843		if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
   844			return -EINVAL;
   845	
   846		memset(&ring, 0x0, sizeof(struct amdgpu_ring));
   847		memset(&ring_funcs, 0x0, sizeof(struct amdgpu_ring_funcs));
   848	
   849		ring_funcs.type = AMDGPU_RING_TYPE_COMPUTE;
   850		ring.doorbell_index = doorbell_off;
   851		ring.funcs = &ring_funcs;
   852	
   853		spin_lock(&kiq->ring_lock);
   854	
   855		if (amdgpu_ring_alloc(kiq_ring, kiq->pmf->unmap_queues_size)) {
   856			spin_unlock(&kiq->ring_lock);
   857			return -ENOMEM;
   858		}
   859	
   860		kiq->pmf->kiq_unmap_queues(kiq_ring, &ring, RESET_QUEUES, 0, 0);
   861	
   862		if (kiq_ring->sched.ready && !adev->job_hang)
   863			r = amdgpu_ring_test_helper(kiq_ring);
   864	
   865		spin_unlock(&kiq->ring_lock);
   866	
   867		return r;
 > 868	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
