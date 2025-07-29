Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677122539D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 21:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753825396; cv=none; b=k3ydJVQvTDyNphDvWY+5vHKn6PbemrlASGyflTc4k+Trr/Cns60fEKgt+xPi1Omr/RPXQeBeCac4FJdGseGaiy19GiX3wAn16dHh6WDQuyooYMwHcuFrJGCkeooi4M/MEJ12ZzDQuBRQsDt7f8GvQTUihTm6iJEZk1hzH/0mMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753825396; c=relaxed/simple;
	bh=iuZQgk1ICQ1nW3U9KVTT5HmVOogqrWwwVqAlLRXpEg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDdK9MOuYohdel42nvh+kFK3LDe2UbuJihbqLQIvDy7qIZWLY3vMqgph+5PpLTU8/vLhnNwuLYLo3fIzn93ZQJT7zgB72F5Nkq/wMi2t1NHs7evD8EMSW0RiMWdHCHADfxx+Lw7nLnObvFEzG1EM6mG54WlbRTfkCTktjogqQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/uLRjSX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/uLRjSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753825395; x=1785361395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iuZQgk1ICQ1nW3U9KVTT5HmVOogqrWwwVqAlLRXpEg0=;
  b=X/uLRjSXH/mHlm+B+he/3fjYeMJ9F8+FuZwoVExBaOg5usrBzJ0SnmbK
   0K2HB5Fc3S5gpXR3gZ9GFg3rLi/ewl0R9cCLL8oJl/x4tdktx4iiQWijv
   KABPQfyXydUTQ2pE5aC5sHu1+HueroDnoJABTKrXWZ4I72FGeeh76ozel
   y2jmYKknGvB8+R8zkopbLav1gZrNPkt6GTM1CSWy52s1yd+uK9oNxynvc
   YlSDLjexVP/zBtwzRq6rbLPUhxa0Ji3SIqBBDCV2UUx94rmRM5tybjmbS
   saG8XFzOsmWz7L5BRFOxLswHmNRlch0V5h9NEC+ejQz3GfS9l6xo32R3G
   A==;
X-CSE-ConnectionGUID: J3UmwhHrQn6UheaVKAPvJQ==
X-CSE-MsgGUID: tFG60Yf4Qei3X5vXHyCdcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81555811"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="81555811"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 14:43:12 -0700
X-CSE-ConnectionGUID: zZHpWEFDR7W6/x1K4akpwQ==
X-CSE-MsgGUID: Y01lMAuPTbS5ffqLZ70aFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163591727"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 14:43:11 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugs6H-0001ii-14;
	Tue, 29 Jul 2025 21:43:09 +0000
Date: Wed, 30 Jul 2025 05:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1739/1739] mm/page_alloc.c:4648:27:
 sparse: sparse: invalid assignment: &=
Message-ID: <202507300533.PUdLd0KT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   859de5033e15abefcf19935429e6478be97d889a
commit: 875ffd41499ee5a3512da409cbd4c2ffd32b3cfa [1739/1739] mm: Do limit checking after memory allocation for memory reliable
config: arm64-randconfig-r121-20250728 (https://download.01.org/0day-ci/archive/20250730/202507300533.PUdLd0KT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250730/202507300533.PUdLd0KT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300533.PUdLd0KT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c:141:1: sparse: sparse: symbol '__pcpu_scope_pcpu_drain' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:4648:27: sparse: sparse: invalid assignment: &=
   mm/page_alloc.c:4648:27: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4648:27: sparse:    right side has type int
   In file included from mm/page_alloc.c:70:
   mm/page_alloc.c: In function 'deferred_init_memmap':
   include/linux/ktask.h:123:21: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct deferred_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
      .kc_thread_func = (ktask_thread_func)(thread_func),      15-                     ^
   include/linux/ktask.h:139:3: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
      KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) 18-   ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1730:3: note: in expansion of macro 'DEFINE_KTASK_CTL'
      DEFINE_KTASK_CTL(ctl, deferred_init_chunk, &args,
      ^~~~~~~~~~~~~~~~
   include/linux/ktask.h:123:21: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct deferred_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
      .kc_thread_func = (ktask_thread_func)(thread_func),      24-                     ^
   include/linux/ktask.h:139:3: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
      KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) 27-   ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1746:3: note: in expansion of macro 'DEFINE_KTASK_CTL'
      DEFINE_KTASK_CTL(ctl, deferred_free_chunk, &args,
      ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:3083: warning: Function parameter or member 'mt' not described in '__putback_isolated_page'

vim +4648 mm/page_alloc.c

  4606	
  4607	/*
  4608	 * return true means memory allocation need retry and flag ___GFP_RELIABILITY
  4609	 * must be cleared.
  4610	 */
  4611	static inline bool check_after_alloc(gfp_t *gfp_mask, unsigned int order,
  4612					     int preferred_nid, nodemask_t *nodemask,
  4613					     struct page **_page)
  4614	{
  4615		if (!mem_reliable_is_enabled())
  4616			return false;
  4617	
  4618		if (!(*gfp_mask & ___GFP_RELIABILITY))
  4619			return false;
  4620	
  4621		if (!*_page)
  4622			goto out_retry;
  4623	
  4624		if (*gfp_mask & __GFP_NOFAIL)
  4625			goto out;
  4626	
  4627		/* check water mark, reserver mirrored mem for kernel */
  4628		if (!mem_reliable_watermark_ok(1 << order))
  4629			goto out_free_page;
  4630	
  4631		/* percpu counter is not initialized, ignore limit check */
  4632		if (!mem_reliable_counter_initialized())
  4633			goto out;
  4634	
  4635		/* spcial user task, systemd is limited by task_reliable_limit */
  4636		if (((current->flags & PF_RELIABLE) || is_global_init(current)) &&
  4637		    !reliable_mem_limit_check(1 << order))
  4638			goto out_free_page;
  4639	
  4640		goto out;
  4641	
  4642	out_free_page:
  4643		__free_pages(*_page, order);
  4644		*_page = NULL;
  4645	
  4646	out_retry:
  4647		if (reliable_allow_fb_enabled() || is_global_init(current)) {
> 4648			*gfp_mask &= ~___GFP_RELIABILITY;
  4649			return true;
  4650		}
  4651	
  4652		if (*gfp_mask & (__GFP_NORETRY | __GFP_RETRY_MAYFAIL | __GFP_THISNODE))
  4653			goto out;
  4654	
  4655		/* Coredumps can quickly deplete all memory reserves */
  4656		if (current->flags & PF_DUMPCORE)
  4657			goto out;
  4658		/* The OOM killer will not help higher order allocs */
  4659		if (order > PAGE_ALLOC_COSTLY_ORDER)
  4660			goto out;
  4661	
  4662		/* oom here */
  4663		mem_reliable_out_of_memory(*gfp_mask, order, preferred_nid,
  4664					nodemask);
  4665	out:
  4666		return false;
  4667	}
  4668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
