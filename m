Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23B2836A6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229544; cv=none; b=IYwRsATSPmWawZYUl5XCtt8ZzK7kiWApqZmetz7OJcCc0co6ACN1hws3FUFcAoM3diVfQflKkM7MKym0ZSgtQxfFaIm1gs+iphynRa8SIkOD2jJgmygRKNw4tT4qjkrYk+OslzIwsCLKbY+0UwFNxzo77HF/C/mQdt4lJfoKqkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229544; c=relaxed/simple;
	bh=mohFPHez5ZVBF6UFB5Gxive4AN0npJZxkfF9c+344Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KJmxolGb8n2vcdwGkcOEu74yvQ39hZAQHtgo+ZNr0SoUfFjxFLHniqbUhuj+DGRUgke/c11tODurly/jR36Fus+/jruFFuTHhEEtVTrSuRVUD0B8uMvos7RpuEEyyq9zh+i90YAfCF++RKa4Heg0SiILu8N6lEeci2lCw0N+dio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjDIYVSC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjDIYVSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778229543; x=1809765543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mohFPHez5ZVBF6UFB5Gxive4AN0npJZxkfF9c+344Y0=;
  b=MjDIYVSCZNREwAjul+hk0UT6AQJ1jiJPkecCZfCEvzIvFizLGGA9c4sR
   KHnp9oKmHyBOCu+svGAFDT6k5R7tsBZCqTLNib3PiNXi0+h/2dR4Bolbm
   vmPfwzfn5AdPoN2Dq8dISvqyfcdRcMESCKVBL6G7u3o5es3nsJ9VTCN2G
   dnnHC4Xm7dAkXFQISnTUnmkvDwzj22rS/hijE9AqCRF0rrVHkvx4O2NEp
   saQDG7EIwzVMRRN4HfuzTmYzgaLJwJl1CAUD4raA7Mkurl6tzewO4ggoh
   Wu+UVuJSafPfjmfnFgOcYTns6Ce6oTmzWbROBO63vBhsDqG09bshmz8F/
   Q==;
X-CSE-ConnectionGUID: lNUetxCyRHSmlnV/nWFvkw==
X-CSE-MsgGUID: Ve8DCn99SnqAL49hbmgmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79213539"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79213539"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 01:38:57 -0700
X-CSE-ConnectionGUID: UWyej+SfQ+utjJqzqAS+jQ==
X-CSE-MsgGUID: 9eaZi9sTRBGhgxTjVXDZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="274829045"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2026 01:38:56 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLGjU-0000000003R-2Rgw;
	Fri, 08 May 2026 08:38:52 +0000
Date: Fri, 08 May 2026 16:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Cesar <leonardocesar@usp.br>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [linux-next:master 3349/4176]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2730 amdgpu_gfx_ring_preempt_ib()
 warn: inconsistent indenting
Message-ID: <202605081621.Euvx7ORX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: dc0d6fdfa5b6ab36ddaa774265261336c3e7dbae [3349/4176] drm/amdgpu: deduplicate ring preempt ib function
config: mips-randconfig-r071-20260506 (https://download.01.org/0day-ci/archive/20260508/202605081621.Euvx7ORX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081621.Euvx7ORX-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2730 amdgpu_gfx_ring_preempt_ib() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:451 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:463 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:464 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:492 amdgpu_gfx_mqd_sw_fini() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:493 amdgpu_gfx_mqd_sw_fini() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:566 amdgpu_gfx_disable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:588 amdgpu_gfx_disable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:617 amdgpu_gfx_disable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:641 amdgpu_gfx_disable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:700 amdgpu_gfx_mes_enable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:758 amdgpu_gfx_enable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:790 amdgpu_gfx_enable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:815 amdgpu_gfx_enable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1716 amdgpu_gfx_run_cleaner_shader() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max

vim +2730 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

  2688	
  2689	int amdgpu_gfx_ring_preempt_ib(struct amdgpu_ring *ring)
  2690	{
  2691		struct amdgpu_device *adev = ring->adev;
  2692		struct amdgpu_kiq *kiq = &adev->gfx.kiq[0];
  2693		struct amdgpu_ring *kiq_ring = &kiq->ring;
  2694		unsigned long flags;
  2695		int i;
  2696	
  2697		if (adev->enable_mes)
  2698			return -EINVAL;
  2699	
  2700		if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
  2701			return -EINVAL;
  2702	
  2703		spin_lock_irqsave(&kiq->ring_lock, flags);
  2704	
  2705		if (amdgpu_ring_alloc(kiq_ring, kiq->pmf->unmap_queues_size)) {
  2706			spin_unlock_irqrestore(&kiq->ring_lock, flags);
  2707			return -ENOMEM;
  2708		}
  2709	
  2710		/* assert preemption condition */
  2711		amdgpu_ring_set_preempt_cond_exec(ring, false);
  2712	
  2713		/* assert IB preemption, emit the trailing fence */
  2714		kiq->pmf->kiq_unmap_queues(kiq_ring, ring, PREEMPT_QUEUES_NO_UNMAP,
  2715						ring->trail_fence_gpu_addr,
  2716						++ring->trail_seq);
  2717		amdgpu_ring_commit(kiq_ring);
  2718	
  2719		spin_unlock_irqrestore(&kiq->ring_lock, flags);
  2720	
  2721		/* poll the trailing fence */
  2722		for (i = 0; i < adev->usec_timeout; i++) {
  2723			if (ring->trail_seq ==
  2724				le32_to_cpu(*(ring->trail_fence_cpu_addr)))
  2725				break;
  2726			udelay(1);
  2727		}
  2728	
  2729		/* deassert preemption condition */
> 2730	    amdgpu_ring_set_preempt_cond_exec(ring, true);
  2731	
  2732		if (i >= adev->usec_timeout) {
  2733			DRM_ERROR("ring %d failed to preempt ib\n", ring->idx);
  2734			return -EINVAL;
  2735		}
  2736	
  2737		return 0;
  2738	}
  2739	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
