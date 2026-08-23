Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0493D1A8F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787490085; cv=none; b=esTVnOuhmX441khlz49EilhYc75mdAwHVCm1pMF2LMPXCnWUxHjo06vPvMbR6nyEJ8pnCukwT9+Wtn0S8zD4x44SEB+30eSt8gd2+XQvJqu40jirPZArDM5iyiiw5YX+hsr81GLqj0ZBKVqmK7eWSy54YQj8Xk+BV5fTYRTZqAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787490085; c=relaxed/simple;
	bh=14KpMjjgZyOCgOG6AgsEjp9fu5JymD9BTvKRILT6NjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dizTK5BxlQjvtycx/W27VIFMhfAKEFgyy8ySo1ZeeSv18quG4SVbLh8jd4chRBLWTKHQ7hKXIaPbO1mcFDaR0h4WnM9uU7E6bYZb02KQR5aQP4cbMh+BGaWzRj1o/oEkZQ75ECjm50hUmWXjSK7fJEkFP70LI0k2fP4w5aHM4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcZ24Kik; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcZ24Kik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787490083; x=1819026083;
  h=date:from:to:cc:subject:message-id;
  bh=14KpMjjgZyOCgOG6AgsEjp9fu5JymD9BTvKRILT6NjA=;
  b=ZcZ24KikuUflm+LvgHZ0iPxSY+DqkkoToKWA/sZCBlN82ncyRBBYkEse
   y/EOD58T3yy6Ioz2QJHdRhgDkhxDnfwLKJY+l3Gt5Zw5E4H2Hk+trFcXK
   O549jb7Su6Dk1unD7/xjgBlWExqPrdNbXvEC40zeHRZd2GDxJe4NjzJ+Y
   InZJj5HEZWJYvlXolfs1jS9gaBTNcbWwxD3/gh8bDM19L07EkLFBC45zB
   FRU22riGOWwfGU+JuJxcvgyn/k8xP9gYPgCnWy/ebNl0u9CsTUOmGKVD+
   OrwuQEOeXGDSWruGyqNNoprFCJG0vm4gUhi9ZUw526Oz9M94lmZIzQHdR
   Q==;
X-CSE-ConnectionGUID: e7sRqE7cRhqBzJo+Knr2kg==
X-CSE-MsgGUID: y8iqbLkdSjiHpzYj5f51Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="105338670"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="105338670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:01:21 -0700
X-CSE-ConnectionGUID: eJF4UqDJRi++BPL6akOXZg==
X-CSE-MsgGUID: Jre1ENOTQB2FxS5uiGijSQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Aug 2026 06:01:18 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wy7p6-0000000009r-2hGx;
	Sun, 23 Aug 2026 13:01:16 +0000
Date: Sun, 23 Aug 2026 21:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:ualink 125/183]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2901:31: warning: left shift count
 >= width of type
Message-ID: <202608232003.BmLOg5dv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ualink
head:   67bd1d6d1b25ea1f893a76fffd13dd6335d297d0
commit: 25e0f08e1877bf453c1ad49086dda2ed562325d2 [125/183] drm/amdgpu: Add UALink cross-GPU TLB shootdown and remote interrupt
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260823/202608232003.BmLOg5dv-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608232003.BmLOg5dv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608232003.BmLOg5dv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: In function 'amdgpu_ualink_gart_map':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2073:26: error: assignment to 'dma_addr_t *' {aka 'unsigned int *'} from incompatible pointer type 'u64 *' {aka 'long long unsigned int *'} [-Wincompatible-pointer-types]
    2073 |                 dma_addr = &npa;
         |                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: In function 'amdgpu_ualink_get_wb_addr':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2669:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2669 |                 wb = (u64)remote->rb_cpu_addr + rb_size * remote->num_accel;
         |                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2673:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2673 |                 wb = (u64)remote->rptr_cpu_addr;
         |                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2683:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2683 |         *wb_cpu = (struct amdgpu_ualink_wb *)(wb + offset);
         |                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: In function 'amdgpu_ualink_peer_remote_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2901:31: warning: left shift count >= width of type [-Wshift-count-overflow]
    2901 |                 npa = 0xFFFUL << 40 | (u64)dst_accel_id << 30;
         |                               ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2939:13: warning: 'amdgpu_ualink_peer_remote_fini' defined but not used [-Wunused-function]
    2939 | static void amdgpu_ualink_peer_remote_fini(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2813:12: warning: 'amdgpu_ualink_peer_remote_init' defined but not used [-Wunused-function]
    2813 | static int amdgpu_ualink_peer_remote_init(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2779:12: warning: 'amdgpu_ualink_remote_interrupt' defined but not used [-Wunused-function]
    2779 | static int amdgpu_ualink_remote_interrupt(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2738:12: warning: 'amdgpu_ualink_remote_shootdown' defined but not used [-Wunused-function]
    2738 | static int amdgpu_ualink_remote_shootdown(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2144:12: warning: 'amdgpu_ualink_metadata_init' defined but not used [-Wunused-function]
    2144 | static int amdgpu_ualink_metadata_init(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2029:13: warning: 'amdgpu_ualink_sdma_entities_fini' defined but not used [-Wunused-function]
    2029 | static void amdgpu_ualink_sdma_entities_fini(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1996:12: warning: 'amdgpu_ualink_sdma_entities_init' defined but not used [-Wunused-function]
    1996 | static int amdgpu_ualink_sdma_entities_init(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1840:12: warning: 'amdgpu_ualink_metadata_npa_mapping' defined but not used [-Wunused-function]
    1840 | static int amdgpu_ualink_metadata_npa_mapping(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1718:13: warning: 'amdgpu_ualink_metadata_npa_unmapping' defined but not used [-Wunused-function]
    1718 | static void amdgpu_ualink_metadata_npa_unmapping(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2901 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c

  2803	
  2804	/**
  2805	 * amdgpu_ualink_peer_remote_init - Initialize remote peer GPU connections
  2806	 * @adev: amdgpu device pointer
  2807	 *
  2808	 * Sets up ring buffers, GART mappings, and control structures for
  2809	 * communicating with remote GPUs in the fabric.
  2810	 *
  2811	 * Return: 0 on success, negative error code on failure
  2812	 */
  2813	static int amdgpu_ualink_peer_remote_init(struct amdgpu_device *adev)
  2814	{
  2815		u32 rb_pages = AMDGPU_UALINK_RB_SIZE >> AMDGPU_GPU_PAGE_SHIFT;
  2816		struct amdgpu_ualink_remote *remote = to_remote(adev);
  2817		struct amdgpu_bo *bo = remote->ring_bo;
  2818		struct amdgpu_ualink_peer *peer;
  2819		struct amdgpu_ualink_ring *interrupt;
  2820		struct amdgpu_ualink_ring *shootdown;
  2821		u32 src_accel_id = ualink_accel_id(adev);
  2822		u32 dst_accel_id;
  2823		u64 npa, flags;
  2824		int r = 0;
  2825	
  2826		/* NPA mapping PTE flags VSCT = 0011 */
  2827		flags = amdgpu_ttm_tt_pte_flags(adev, bo->tbo.ttm, bo->tbo.resource);
  2828		flags |= AMDGPU_PTE_SNOOPED | AMDGPU_PTE_PRT_GFX12 | AMDGPU_PTE_BUS_ATOMICS;
  2829		flags &= ~AMDGPU_PTE_VALID;
  2830		/* PTE.X=0 turn off RPC checks for RBs, wptr and doorbell NPA address */
  2831		flags &= ~AMDGPU_PTE_EXECUTABLE;
  2832	
  2833		dev_dbg(adev->dev, "src_accel_id %u gart mapping flags 0x%llx\n",
  2834			src_accel_id, flags);
  2835	
  2836		for_each_set_bit(dst_accel_id, remote->active_accel_bits, AMDGPU_UALINK_ACCEL_MAX) {
  2837			if (dst_accel_id == src_accel_id)
  2838				continue;
  2839	
  2840			dev_dbg(adev->dev, "peer_remote to dst_accel_id %u\n", dst_accel_id);
  2841	
  2842			peer = &remote->peer[dst_accel_id];
  2843			mutex_init(&peer->lock);
  2844	
  2845			interrupt = &peer->interrupt;
  2846			shootdown = &peer->shootdown;
  2847	
  2848			/* ring buffer npa gart mapping */
  2849			npa = amdgpu_ualink_gart_npa_addr(adev, RB_TYPE_REMOTE_INTERRUPT,
  2850							   src_accel_id, dst_accel_id);
  2851			r = amdgpu_ualink_gart_map(adev, rb_pages, npa, &interrupt->mm_node_rb, flags);
  2852			if (r)
  2853				break;
  2854			interrupt->rb_npa_gart = adev->gmc.gart_start +
  2855						 (interrupt->mm_node_rb.start << AMDGPU_GPU_PAGE_SHIFT);
  2856	
  2857			dev_dbg(adev->dev, "rb npa 0x%llx mapped on gart 0x%llx\n",
  2858				npa, interrupt->rb_npa_gart);
  2859	
  2860			/* tlb invalidate ring buffer npa gart mapping */
  2861			npa = amdgpu_ualink_gart_npa_addr(adev, RB_TYPE_TLB_INV, src_accel_id,
  2862							  dst_accel_id);
  2863			r = amdgpu_ualink_gart_map(adev, rb_pages, npa, &shootdown->mm_node_rb, flags);
  2864			if (r)
  2865				break;
  2866			shootdown->rb_npa_gart = adev->gmc.gart_start +
  2867						 (shootdown->mm_node_rb.start << AMDGPU_GPU_PAGE_SHIFT);
  2868	
  2869			dev_dbg(adev->dev, "tlb rb npa 0x%llx mapped on gart 0x%llx\n",
  2870				npa, shootdown->rb_npa_gart);
  2871	
  2872			/* wptr npa gart mapping */
  2873			npa = amdgpu_ualink_gart_npa_addr(adev, RB_TYPE_TAILPTR, src_accel_id,
  2874							  dst_accel_id);
  2875			r = amdgpu_ualink_gart_map(adev, 1, npa, &interrupt->mm_node_wptr, flags);
  2876			if (r)
  2877				break;
  2878	
  2879			interrupt->wptr_npa_gart = adev->gmc.gart_start +
  2880						   (interrupt->mm_node_wptr.start << AMDGPU_GPU_PAGE_SHIFT)
  2881						    + ualink_wptr_offset(adev, src_accel_id);
  2882			shootdown->wptr_npa_gart = adev->gmc.gart_start +
  2883						   (interrupt->mm_node_wptr.start << AMDGPU_GPU_PAGE_SHIFT)
  2884						    + ualink_tlb_wptr_offset(adev, src_accel_id);
  2885	
  2886			dev_dbg(adev->dev, "rb wptr npa 0x%llx on gart 0x%llx, tlb wptr on gart 0x%llx\n",
  2887				npa, interrupt->wptr_npa_gart, shootdown->wptr_npa_gart);
  2888	
  2889			/*
  2890			 * doorbell npa gart mapping, doorbell NPA address coding
  2891			 *
  2892			 * ReqAddr[51:40] = 0xFFF
  2893			 * ReqAddr[39:30] = GPU accel_id
  2894			 * ReqAddr[29:12] = 18'h00000
  2895			 * ReqAddr[11:8]  = Random value
  2896			 * ReqAddr[7:6]   = PMI Index
  2897			 *     0 - PMI0 Remote Interrupt
  2898			 *     1 - PMI1 Remote TLB Shootdown
  2899			 * ReqAddr[5:0]   = 6'h0
  2900			 */
> 2901			npa = 0xFFFUL << 40 | (u64)dst_accel_id << 30;
  2902			r = amdgpu_ualink_gart_map(adev, 1, npa, &interrupt->mm_node_doorbell, flags);
  2903			if (r)
  2904				break;
  2905	
  2906			interrupt->doorbell_npa_gart = adev->gmc.gart_start +
  2907				(interrupt->mm_node_doorbell.start << AMDGPU_GPU_PAGE_SHIFT);
  2908	
  2909			dev_dbg(adev->dev, "rb doorbell npa 0x%llx mapped on gart 0x%llx\n",
  2910				npa, interrupt->doorbell_npa_gart);
  2911	
  2912			shootdown->doorbell_npa_gart = adev->gmc.gart_start+
  2913				(interrupt->mm_node_doorbell.start << AMDGPU_GPU_PAGE_SHIFT) + (1 << 6);
  2914	
  2915			dev_dbg(adev->dev, "tlb doorbell npa 0x%llx mapped on gart 0x%llx\n",
  2916				npa, shootdown->doorbell_npa_gart);
  2917	
  2918			interrupt->rb_size = AMDGPU_UALINK_RB_SIZE / 64;
  2919			interrupt->wptr = 0;
  2920			interrupt->rptr = 0;
  2921			interrupt->seq = 0;
  2922	
  2923			shootdown->rb_size = AMDGPU_UALINK_RB_SIZE / 64;
  2924			shootdown->wptr = 0;
  2925			shootdown->rptr = 0;
  2926			shootdown->seq = 0;
  2927		}
  2928	
  2929		dev_dbg(adev->dev, "peer remote init done r=%d\n", r);
  2930		return r;
  2931	}
  2932	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
