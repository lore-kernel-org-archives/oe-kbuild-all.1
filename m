Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161BA2771B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780139752; cv=none; b=nGUDWvZ8SOFQReytbcN7a2xef4Cwfap5rWCtU4PrmWoWi0cmXA6cC5Xgwyg6wicxcjo0TpHOfb9v6d+9LNUtENXlIlvQrG/7E/oLky11XUs4Bq0j7KfBpGOcqByHQEG142uuXFYEyp8yOiwtx7IKwH2bq835bs+bCik9ZCz48og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780139752; c=relaxed/simple;
	bh=2qPNBDIuJ7lOxE97ut5zRAJ4MPc7ofY1BDKZ6t39gPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JSSklqVtkOIIifZgWe2tyZpfZAKMm6sUz3jObNbQhrAuA9kMVrg1se95HY2ccJzyjqYJXEXSt/fJhJHQDgPX6tXHNDSQ2QRVz7IOZh1T5xnBpUk+7h0emfLFp3426l7X2SGCONAvVFERzIEpgD0gE7jWLR1cctjmP78isR0XOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgAi8U80; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgAi8U80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780139750; x=1811675750;
  h=date:from:to:cc:subject:message-id;
  bh=2qPNBDIuJ7lOxE97ut5zRAJ4MPc7ofY1BDKZ6t39gPU=;
  b=hgAi8U80Yw638MxWVX7m0PAJKByz5o4UwCfVfLRqrrFa0RwtJLwyiWyF
   w4BEL8OuTynUFwdAVeuD9uRQYbgm/oGQ4CCjglE3XxtitaW0r50xFPmG5
   zelGIRccKarXb4iQK6LH01dGOYuwju8ghlnj99Vt/x/Fyr6SvCa0SROEg
   RhHIree09lyiV8EipE0SgY1zfROCUcnU7Du+rtbLo+SzU7E84opBPZBD0
   uzkvexkTXsWxekwX4wOesVx+0lfmVTvtXuuHLoMpzDXL4JAWSUTK6AL1m
   JrXcANgPwSHo5/RbyWqgxsfVrV+2TMMNOwV7Qr5bffWkDpKBPyuUJfl3S
   g==;
X-CSE-ConnectionGUID: 8C4+EKZsSByXIh5+9H949Q==
X-CSE-MsgGUID: rBTRfoJdTjyvkk5NDbTYfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80006649"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="80006649"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 04:15:49 -0700
X-CSE-ConnectionGUID: IhqRcqZDQ0iaclqDRgrKFg==
X-CSE-MsgGUID: 5FtPQzU5Sb6htMQnVBkOfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="281206596"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 May 2026 04:15:48 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTHfN-00000000177-464p;
	Sat, 30 May 2026 11:15:45 +0000
Date: Sat, 30 May 2026 13:15:35 +0200
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/slub.c:3294:undefined reference to
 `bpf_arena_alloc_slab_page'
Message-ID: <202605301356.vzNmh7n7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/slab-Introduce-kmem_cache_alloc_nolock/20260530-042829
head:   b982f7b0c5e909216bc21f0b35732052b86c3d25
commit: d73008dbe4eabe4199725e8998d24765c956b4a8 bpf,slab: Add slub-backed allocator for bpf_arena
date:   15 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260530/202605301356.vzNmh7n7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301356.vzNmh7n7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301356.vzNmh7n7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/slub.o: in function `alloc_slab_page':
>> mm/slub.c:3294:(.text+0x4eda): undefined reference to `bpf_arena_alloc_slab_page'
>> ld: mm/slub.c:3294:(.text+0x5134): undefined reference to `bpf_arena_alloc_slab_page'
   ld: mm/slub.o: in function `__free_slab':
>> mm/slub.c:3567:(.text+0x6663): undefined reference to `bpf_arena_free_slab_page'


vim +3294 mm/slub.c

  3280	
  3281	/*
  3282	 * Slab allocation and freeing
  3283	 */
  3284	static inline struct slab *alloc_slab_page(struct kmem_cache *s, gfp_t flags,
  3285						   int node,
  3286						   struct kmem_cache_order_objects oo,
  3287						   bool allow_spin)
  3288	{
  3289		struct page *page;
  3290		struct slab *slab;
  3291		unsigned int order = oo_order(oo);
  3292	
  3293		if (unlikely(s->bpf_arena))
> 3294			return bpf_arena_alloc_slab_page(s->bpf_arena, flags, node, allow_spin);
  3295	
  3296		if (unlikely(!allow_spin))
  3297			page = alloc_frozen_pages_nolock(0/* __GFP_COMP is implied */,
  3298									  node, order);
  3299		else if (node == NUMA_NO_NODE)
  3300			page = alloc_frozen_pages(flags, order);
  3301		else
  3302			page = __alloc_frozen_pages(flags, order, node, NULL);
  3303	
  3304		if (!page)
  3305			return NULL;
  3306	
  3307		__SetPageSlab(page);
  3308		slab = page_slab(page);
  3309		if (page_is_pfmemalloc(page))
  3310			slab_set_pfmemalloc(slab);
  3311	
  3312		return slab;
  3313	}
  3314	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
