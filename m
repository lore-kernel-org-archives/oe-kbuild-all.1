Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E7C3596F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766686; cv=none; b=YGfg+GS5KzcdxK81rMZzH+4Y/34HUpPpUj9tzu8i7FVu/JhGL1mc/03b+QalxLMYG4AntqMJKO/Ftlm0zMxFdlmGQllDu+yxN8Bvxxf4RZ4j8I28HxDpyalSoQYKLyDPUpeZuI2O/Fhi3quuMMIkmLDdxKgoaYMdmoCoy2HHV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766686; c=relaxed/simple;
	bh=SqahcglLALPan8PdkMc9Lemdz/22PGGZjbxapNnYWKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6ay9vnp+f93wpTW6IJW2FSZxKzqkZwwDYRu+kYdl87NSYLxbBNTF4Znfdp/yw3X6+hltzZVTOfyjR9tsj8GJ3y2YQB83tf3VFF1m1/qGhzFzzYCSh92Y6PeVaKv2QhQ+vWSWhDsaWjRfxRmxl9czq0oSOpCgk4qBV2Rv3axkIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaMFSdm5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaMFSdm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761766686; x=1793302686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqahcglLALPan8PdkMc9Lemdz/22PGGZjbxapNnYWKY=;
  b=YaMFSdm5L60og6cUggkaf5b0/ka3clE17mGciSVKR9pBU/LrYTVv2ZXW
   hDtVqxhzMbEg5Mrr9tVldA94JMk6LC1VZ90/OWw/EmbgVVfRvTI56OROz
   LCxKVDxWPpMrtH8eaMDN7kL+z7ht/nBC4J1Fp9Bd3LxSuGDAGz3AQkHR0
   YaHlvCSQhWSvzuQG0GUAKcNaZ+f7zue+nAGV87CAB5fNrA14/z+mbjdh2
   T+Q85x61HPZf7INNgk6+wqmPyzqRYxWkDEoPgFA5zc9wQCILIPA0ga9Ll
   3HZyFYKG/XtVlEAE+PVIWLOiWxfetHPMU13+o9aQR65tkcMolwSAXhbIk
   A==;
X-CSE-ConnectionGUID: j0eA3bAJS+SIMgGwG9QH2A==
X-CSE-MsgGUID: WpIzfmneSZS7u0JhzHcX/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63831021"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63831021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 12:38:05 -0700
X-CSE-ConnectionGUID: wILrJLHAQUeO47gn/besxw==
X-CSE-MsgGUID: M6VD2OOhQqyDJEkC9OhDzQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 12:38:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEBzO-000L6d-2Q;
	Wed, 29 Oct 2025 19:37:53 +0000
Date: Thu, 30 Oct 2025 03:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1739/1739] mm/page_alloc.c:4648:27:
 sparse: sparse: invalid assignment: &=
Message-ID: <202510300315.AULNBBrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1afc352b4572c02bd3b5c9195481f393af060e44
commit: 875ffd41499ee5a3512da409cbd4c2ffd32b3cfa [1739/1739] mm: Do limit checking after memory allocation for memory reliable
config: arm64-randconfig-r121-20250728 (https://download.01.org/0day-ci/archive/20251030/202510300315.AULNBBrr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300315.AULNBBrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300315.AULNBBrr-lkp@intel.com/

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
