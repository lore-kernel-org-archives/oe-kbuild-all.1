Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D230499A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219496; cv=none; b=bL23a3mdDPa6CPzS5rqljsX5a71yPkTznmx2sR+bcJFdiisnZmP2rGr/JJOvg1J/HEnQTLyt8ockebqjsXNyjcfb1qRGiDAts+kc274k8soVODDNbK5gLF8qNYEntFSiZxwfdmaY9HYltk/9I2k1wtrduwI9JQlu093cHEdKZDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219496; c=relaxed/simple;
	bh=E5qHEE0Nc+YvwvnvUqtRzS4QBQ18IRyhEMP8zGqVBLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oopa2r2Wd6LGEfwa1tKLswg6bfneXN0d4C2dIjVhEyong3KDLPN7q76oKDkyNHQbL3MO8IN/RieTTDOM7d2bCFvp16K+s+PoMkz3gKII8jcuiTQeh9nePPEPRbCxTYwCk/KFTWVSgFpbzZb+LA33NLPx0caIsVn65S0X+sEAGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXbiMODa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXbiMODa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787219492; x=1818755492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5qHEE0Nc+YvwvnvUqtRzS4QBQ18IRyhEMP8zGqVBLE=;
  b=FXbiMODaWdMXRXsjn5JAzXsrobVZ/GNzKEudNMBwQMowAyKWdCBcG6tH
   quP6ITrRxJyRXRH+XloGOWpGAcS+EB5JzLf8Ddokv5zb/120dAYxuxcwQ
   PLqWI5tEwILcf5CjTf3SCMBTGefr4zuzQnreTppGTTNRjegwx4f6w+3fz
   SDUSW2w8UQxTXNwr2x/57XyTJvxlzQE49CD7IuJL4H13bpFoALyzD+Aej
   IlBNSBfoSxYR5MkVrScVTk+OCERYSwLEcIaQr73/ntfzsTe3Jt6WIf39a
   YpbQSHw7mnNXVOExrLr1fZ6Q4xB2OXNxz+u7uAmHsNcKH2G+dhZ52TWB6
   A==;
X-CSE-ConnectionGUID: dqyNH633TTSH0++tQF0/Mw==
X-CSE-MsgGUID: XqLlacuNSnenlm/hiI6tvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87955999"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87955999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:51:30 -0700
X-CSE-ConnectionGUID: DQw8gIJbQ0OE1QgST5+NRw==
X-CSE-MsgGUID: NjqPPfpsTYmwDAmnZTlggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="295866153"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Aug 2026 02:51:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwzQk-00000000ibZ-1hlo;
	Thu, 20 Aug 2026 09:51:26 +0000
Date: Thu, 20 Aug 2026 17:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Cesar <leonardocesar@usp.br>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:2730
 amdgpu_gfx_ring_preempt_ib() warn: inconsistent indenting
Message-ID: <202608201722.iyZwpR07-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: dc0d6fdfa5b6ab36ddaa774265261336c3e7dbae drm/amdgpu: deduplicate ring preempt ib function
date:   4 months ago
config: i386-randconfig-141-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201722.iyZwpR07-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dc0d6fdfa5b6 ("drm/amdgpu: deduplicate ring preempt ib function")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201722.iyZwpR07-lkp@intel.com/

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
