Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43332174E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684791864; x=1716327864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cN05v2CZLEnqCYMvXA+sHIrrmEdlBXrBbGAojJW2Fes=;
  b=Z2wxEYHnJvEh53lB0BU2S7BEQOAre/iEbgM4KAMUmwR2APeoDzGjO6e3
   2LCcq0t9QUvD3h0mNeoCjkIp2a8V29cUeVHm4IPaPCkeaH1sSHBOpDQjX
   In7TR4nNg7gGD1xp7jhworYegiB8yhZJT+9uJMHF7mIl1q7FsXWSW6dCJ
   nzUuPpFTUg+PLs17dDHJFq+oRqrrYBhW7rbx5Ycusa7foffJhF9n7sWe/
   i444BSRSXN+dcGOWBE8drRL2orp8DvRN3uch+KWHJ761cmBO7oYTA41Y2
   HEcIKN1zLjfRoXuc6ZIRBGmu91zeMbmSnMnvHnn0+dAOeZq3iLtxg9pPL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="355400889"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="355400889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 14:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="950264145"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="950264145"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 May 2023 14:44:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1DKG-000DDB-1L;
	Mon, 22 May 2023 21:44:20 +0000
Date: Tue, 23 May 2023 05:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shiwu Zhang <shiwu.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>
Subject: [linux-next:master 2819/3918]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:614 amdgpu_gfx_enable_kcq() warn:
 inconsistent indenting
Message-ID: <202305230552.WOByQyYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f258af06b6268be8e960f63c3f66e88bdbbbdb0
commit: 96c998bc80bee7d6dd0cf001e33f4ccbd82723f8 [2819/3918] drm/amdgpu: enable the ring and IB test for slave kcq
config: s390-randconfig-m031-20230522 (https://download.01.org/0day-ci/archive/20230523/202305230552.WOByQyYa-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305230552.WOByQyYa-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:614 amdgpu_gfx_enable_kcq() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:133 amdgpu_gfx_parse_disable_cu() warn: potential spectre issue 'mask' [w]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1223 amdgpu_gfx_set_compute_partition() warn: was && intended here instead of ||?

vim +614 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

3ab6fe4b28a661 Likun Gao     2019-10-24  570  
def799c6596d07 Le Ma         2022-05-24  571  int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
849aca9f9c033a Hawking Zhang 2019-03-05  572  {
def799c6596d07 Le Ma         2022-05-24  573  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
def799c6596d07 Le Ma         2022-05-24  574  	struct amdgpu_ring *kiq_ring = &kiq->ring;
849aca9f9c033a Hawking Zhang 2019-03-05  575  	uint64_t queue_mask = 0;
def799c6596d07 Le Ma         2022-05-24  576  	int r, i, j;
849aca9f9c033a Hawking Zhang 2019-03-05  577  
849aca9f9c033a Hawking Zhang 2019-03-05  578  	if (!kiq->pmf || !kiq->pmf->kiq_map_queues || !kiq->pmf->kiq_set_resources)
849aca9f9c033a Hawking Zhang 2019-03-05  579  		return -EINVAL;
849aca9f9c033a Hawking Zhang 2019-03-05  580  
849aca9f9c033a Hawking Zhang 2019-03-05  581  	for (i = 0; i < AMDGPU_MAX_COMPUTE_QUEUES; ++i) {
def799c6596d07 Le Ma         2022-05-24  582  		if (!test_bit(i, adev->gfx.mec_bitmap[xcc_id].queue_bitmap))
849aca9f9c033a Hawking Zhang 2019-03-05  583  			continue;
849aca9f9c033a Hawking Zhang 2019-03-05  584  
849aca9f9c033a Hawking Zhang 2019-03-05  585  		/* This situation may be hit in the future if a new HW
849aca9f9c033a Hawking Zhang 2019-03-05  586  		 * generation exposes more than 64 queues. If so, the
849aca9f9c033a Hawking Zhang 2019-03-05  587  		 * definition of queue_mask needs updating */
849aca9f9c033a Hawking Zhang 2019-03-05  588  		if (WARN_ON(i > (sizeof(queue_mask)*8))) {
849aca9f9c033a Hawking Zhang 2019-03-05  589  			DRM_ERROR("Invalid KCQ enabled: %d\n", i);
849aca9f9c033a Hawking Zhang 2019-03-05  590  			break;
849aca9f9c033a Hawking Zhang 2019-03-05  591  		}
849aca9f9c033a Hawking Zhang 2019-03-05  592  
5c180eb910df3c Yong Zhao     2020-03-04  593  		queue_mask |= (1ull << amdgpu_queue_mask_bit_to_set_resource_bit(adev, i));
849aca9f9c033a Hawking Zhang 2019-03-05  594  	}
849aca9f9c033a Hawking Zhang 2019-03-05  595  
849aca9f9c033a Hawking Zhang 2019-03-05  596  	DRM_INFO("kiq ring mec %d pipe %d q %d\n", kiq_ring->me, kiq_ring->pipe,
849aca9f9c033a Hawking Zhang 2019-03-05  597  							kiq_ring->queue);
def799c6596d07 Le Ma         2022-05-24  598  	spin_lock(&kiq->ring_lock);
849aca9f9c033a Hawking Zhang 2019-03-05  599  	r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size *
849aca9f9c033a Hawking Zhang 2019-03-05  600  					adev->gfx.num_compute_rings +
849aca9f9c033a Hawking Zhang 2019-03-05  601  					kiq->pmf->set_resources_size);
849aca9f9c033a Hawking Zhang 2019-03-05  602  	if (r) {
849aca9f9c033a Hawking Zhang 2019-03-05  603  		DRM_ERROR("Failed to lock KIQ (%d).\n", r);
506fe17d2c25a5 Dan Carpenter 2023-05-03  604  		spin_unlock(&kiq->ring_lock);
849aca9f9c033a Hawking Zhang 2019-03-05  605  		return r;
849aca9f9c033a Hawking Zhang 2019-03-05  606  	}
849aca9f9c033a Hawking Zhang 2019-03-05  607  
712ce872213c1d Jack Xiao     2020-06-16  608  	if (adev->enable_mes)
712ce872213c1d Jack Xiao     2020-06-16  609  		queue_mask = ~0ULL;
712ce872213c1d Jack Xiao     2020-06-16  610  
849aca9f9c033a Hawking Zhang 2019-03-05  611  	kiq->pmf->kiq_set_resources(kiq_ring, queue_mask);
def799c6596d07 Le Ma         2022-05-24  612  	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
def799c6596d07 Le Ma         2022-05-24  613  		j = i + xcc_id * adev->gfx.num_compute_rings;
66daccde429611 Le Ma         2021-12-01 @614  			kiq->pmf->kiq_map_queues(kiq_ring,
96c998bc80bee7 Shiwu Zhang   2022-06-03  615  						 &adev->gfx.compute_ring[j]);
def799c6596d07 Le Ma         2022-05-24  616  	}
849aca9f9c033a Hawking Zhang 2019-03-05  617  
849aca9f9c033a Hawking Zhang 2019-03-05  618  	r = amdgpu_ring_test_helper(kiq_ring);
def799c6596d07 Le Ma         2022-05-24  619  	spin_unlock(&kiq->ring_lock);
849aca9f9c033a Hawking Zhang 2019-03-05  620  	if (r)
849aca9f9c033a Hawking Zhang 2019-03-05  621  		DRM_ERROR("KCQ enable failed\n");
849aca9f9c033a Hawking Zhang 2019-03-05  622  
849aca9f9c033a Hawking Zhang 2019-03-05  623  	return r;
849aca9f9c033a Hawking Zhang 2019-03-05  624  }
849aca9f9c033a Hawking Zhang 2019-03-05  625  

:::::: The code at line 614 was first introduced by commit
:::::: 66daccde429611530db82605c197be01adadb389 drm/amdgpu: add master/slave check in init phase

:::::: TO: Le Ma <le.ma@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
