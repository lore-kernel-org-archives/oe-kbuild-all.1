Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9171FFC4B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738792367; cv=none; b=Oko8SwZ3+V0Ev4Z9dk5GH83Z9tZaYuM8nmnVBN5vcwK2JBmaZmo4NpIn3HS7B1EjECZ4UWIWDAVoj/W9sSj3aPjid4oM8uZx8xRzMynQzloWpEnqWh5oL0ibRVtox5VmhTZXWIi9setTrYelcUcM5EHaANBpG4+EH8C8pLNMJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738792367; c=relaxed/simple;
	bh=WbEuz3amGp+JdcO4H3ZXX+HuWIatzgWsEJXhLU8jAUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLF7bNCFgj4fXIbhRkJQ0XdCYYRw65vxc/Mipf9azcWHq3tHyoizSiNErf9p1x3hajs5qlt39q6RKAJegS/htbXcjUzuuLokl3YmaJn+CtO8ryRrTN+DHnvPPut6hNMV2YuBrFIC1Zp+rod0f8OZ8Ulo5y5izfZnIX/beKfV1XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBEbVZvU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBEbVZvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738792366; x=1770328366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbEuz3amGp+JdcO4H3ZXX+HuWIatzgWsEJXhLU8jAUo=;
  b=YBEbVZvUGerURN4d5I3q/VVZWjCN3I2M5s7BfGxYtgx2WA9JFnhwWEc+
   bQO9zenRGObAeRtpEAvTRibRxQ5/JQg+x2iQn7qUpp1ICDM9ElpHwFhbZ
   WhHusJ9LegzAFt44sis+k0lXzsPUtCMF1P+KsaybBZV5qRxqerCfuLtui
   X5BydL2QdXJfSzMdfimDGINxWlzvrtTEzVkLONcpxPco/ICF8UGEHjwCd
   T+GHpt50BUTuBukVsFODm8Oq7atus7CerIUzdTFLF1pkQCH+GuJBG8qBQ
   AnU9BAtof3wXCixJvnY1FlvIN8nHaODE56q3JiVi7RIh9j231kFBoEaHe
   g==;
X-CSE-ConnectionGUID: vuGRkY5sR9iV55YK79VnMw==
X-CSE-MsgGUID: 3aFDCRRLQI6jfS6IwdMgig==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43301890"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="43301890"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 13:52:45 -0800
X-CSE-ConnectionGUID: utK+r5H5T061hmvXl19YxQ==
X-CSE-MsgGUID: DsLO2eRsTVWs7LOga+8jcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141910078"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 13:52:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfnK5-000w6x-2c;
	Wed, 05 Feb 2025 21:52:41 +0000
Date: Thu, 6 Feb 2025 05:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 19/21] mm/kfence/core.c:462:15: warning:
 calling function 'metadata_to_pageaddr' requires holding raw_spinlock
 'meta->lock' exclusively
Message-ID: <202502060558.8DhPNdwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   a0d770da40bf833f1f658fc84741c8f3fee2a385
commit: 9d248937bc5b8446bd9af84f6f11329dc6985d95 [19/21] kfence: Enable capability analysis
config: i386-buildonly-randconfig-004-20250206 (https://download.01.org/0day-ci/archive/20250206/202502060558.8DhPNdwn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060558.8DhPNdwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060558.8DhPNdwn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kfence/core.c:462:15: warning: calling function 'metadata_to_pageaddr' requires holding raw_spinlock 'meta->lock' exclusively [-Wthread-safety-analysis]
     462 |         meta->addr = metadata_to_pageaddr(meta);
         |                      ^
>> mm/kfence/core.c:484:2: warning: calling function 'metadata_update_state' requires holding raw_spinlock 'meta->lock' exclusively [-Wthread-safety-analysis]
     484 |         metadata_update_state(meta, KFENCE_OBJECT_ALLOCATED, stack_entries, num_stack_entries);
         |         ^
>> mm/kfence/core.c:488:8: warning: writing variable 'alloc_stack_hash' requires holding raw_spinlock '&kfence_metadata::lock' exclusively [-Wthread-safety-analysis]
     488 |         meta->alloc_stack_hash = alloc_stack_hash;
         |               ^
>> mm/kfence/core.c:489:2: warning: releasing raw_spinlock 'meta->lock' that was not held [-Wthread-safety-analysis]
     489 |         raw_spin_unlock_irqrestore(&meta->lock, flags);
         |         ^
   include/linux/spinlock.h:283:3: note: expanded from macro 'raw_spin_unlock_irqrestore'
     283 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^
   4 warnings generated.


vim +462 mm/kfence/core.c

0ce20dd840897b Alexander Potapenko 2021-02-25  419  
a9ab52bbcb52df Marco Elver         2021-11-05  420  static void *kfence_guarded_alloc(struct kmem_cache *cache, size_t size, gfp_t gfp,
08f6b10630f284 Marco Elver         2021-11-05  421  				  unsigned long *stack_entries, size_t num_stack_entries,
08f6b10630f284 Marco Elver         2021-11-05  422  				  u32 alloc_stack_hash)
0ce20dd840897b Alexander Potapenko 2021-02-25  423  {
0ce20dd840897b Alexander Potapenko 2021-02-25  424  	struct kfence_metadata *meta = NULL;
0ce20dd840897b Alexander Potapenko 2021-02-25  425  	unsigned long flags;
8dae0cfed57357 Vlastimil Babka     2021-11-03  426  	struct slab *slab;
0ce20dd840897b Alexander Potapenko 2021-02-25  427  	void *addr;
8032bf1233a746 Jason A. Donenfeld  2022-10-09  428  	const bool random_right_allocate = get_random_u32_below(2);
327b18b7aaed5d Jason A. Donenfeld  2022-06-09  429  	const bool random_fault = CONFIG_KFENCE_STRESS_TEST_FAULTS &&
8032bf1233a746 Jason A. Donenfeld  2022-10-09  430  				  !get_random_u32_below(CONFIG_KFENCE_STRESS_TEST_FAULTS);
0ce20dd840897b Alexander Potapenko 2021-02-25  431  
0ce20dd840897b Alexander Potapenko 2021-02-25  432  	/* Try to obtain a free object. */
0ce20dd840897b Alexander Potapenko 2021-02-25  433  	raw_spin_lock_irqsave(&kfence_freelist_lock, flags);
0ce20dd840897b Alexander Potapenko 2021-02-25  434  	if (!list_empty(&kfence_freelist)) {
0ce20dd840897b Alexander Potapenko 2021-02-25  435  		meta = list_entry(kfence_freelist.next, struct kfence_metadata, list);
0ce20dd840897b Alexander Potapenko 2021-02-25  436  		list_del_init(&meta->list);
0ce20dd840897b Alexander Potapenko 2021-02-25  437  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  438  	raw_spin_unlock_irqrestore(&kfence_freelist_lock, flags);
9a19aeb5665068 Marco Elver         2021-11-05  439  	if (!meta) {
9a19aeb5665068 Marco Elver         2021-11-05  440  		atomic_long_inc(&counters[KFENCE_COUNTER_SKIP_CAPACITY]);
0ce20dd840897b Alexander Potapenko 2021-02-25  441  		return NULL;
9a19aeb5665068 Marco Elver         2021-11-05  442  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  443  
0ce20dd840897b Alexander Potapenko 2021-02-25  444  	if (unlikely(!raw_spin_trylock_irqsave(&meta->lock, flags))) {
0ce20dd840897b Alexander Potapenko 2021-02-25  445  		/*
0ce20dd840897b Alexander Potapenko 2021-02-25  446  		 * This is extremely unlikely -- we are reporting on a
0ce20dd840897b Alexander Potapenko 2021-02-25  447  		 * use-after-free, which locked meta->lock, and the reporting
0ce20dd840897b Alexander Potapenko 2021-02-25  448  		 * code via printk calls kmalloc() which ends up in
0ce20dd840897b Alexander Potapenko 2021-02-25  449  		 * kfence_alloc() and tries to grab the same object that we're
0ce20dd840897b Alexander Potapenko 2021-02-25  450  		 * reporting on. While it has never been observed, lockdep does
0ce20dd840897b Alexander Potapenko 2021-02-25  451  		 * report that there is a possibility of deadlock. Fix it by
0ce20dd840897b Alexander Potapenko 2021-02-25  452  		 * using trylock and bailing out gracefully.
0ce20dd840897b Alexander Potapenko 2021-02-25  453  		 */
0ce20dd840897b Alexander Potapenko 2021-02-25  454  		raw_spin_lock_irqsave(&kfence_freelist_lock, flags);
0ce20dd840897b Alexander Potapenko 2021-02-25  455  		/* Put the object back on the freelist. */
0ce20dd840897b Alexander Potapenko 2021-02-25  456  		list_add_tail(&meta->list, &kfence_freelist);
0ce20dd840897b Alexander Potapenko 2021-02-25  457  		raw_spin_unlock_irqrestore(&kfence_freelist_lock, flags);
0ce20dd840897b Alexander Potapenko 2021-02-25  458  
0ce20dd840897b Alexander Potapenko 2021-02-25  459  		return NULL;
0ce20dd840897b Alexander Potapenko 2021-02-25  460  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  461  
0ce20dd840897b Alexander Potapenko 2021-02-25 @462  	meta->addr = metadata_to_pageaddr(meta);
0ce20dd840897b Alexander Potapenko 2021-02-25  463  	/* Unprotect if we're reusing this page. */
0ce20dd840897b Alexander Potapenko 2021-02-25  464  	if (meta->state == KFENCE_OBJECT_FREED)
0ce20dd840897b Alexander Potapenko 2021-02-25  465  		kfence_unprotect(meta->addr);
0ce20dd840897b Alexander Potapenko 2021-02-25  466  
0ce20dd840897b Alexander Potapenko 2021-02-25  467  	/*
0ce20dd840897b Alexander Potapenko 2021-02-25  468  	 * Note: for allocations made before RNG initialization, will always
0ce20dd840897b Alexander Potapenko 2021-02-25  469  	 * return zero. We still benefit from enabling KFENCE as early as
0ce20dd840897b Alexander Potapenko 2021-02-25  470  	 * possible, even when the RNG is not yet available, as this will allow
0ce20dd840897b Alexander Potapenko 2021-02-25  471  	 * KFENCE to detect bugs due to earlier allocations. The only downside
0ce20dd840897b Alexander Potapenko 2021-02-25  472  	 * is that the out-of-bounds accesses detected are deterministic for
0ce20dd840897b Alexander Potapenko 2021-02-25  473  	 * such allocations.
0ce20dd840897b Alexander Potapenko 2021-02-25  474  	 */
327b18b7aaed5d Jason A. Donenfeld  2022-06-09  475  	if (random_right_allocate) {
0ce20dd840897b Alexander Potapenko 2021-02-25  476  		/* Allocate on the "right" side, re-calculate address. */
0ce20dd840897b Alexander Potapenko 2021-02-25  477  		meta->addr += PAGE_SIZE - size;
0ce20dd840897b Alexander Potapenko 2021-02-25  478  		meta->addr = ALIGN_DOWN(meta->addr, cache->align);
0ce20dd840897b Alexander Potapenko 2021-02-25  479  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  480  
0ce20dd840897b Alexander Potapenko 2021-02-25  481  	addr = (void *)meta->addr;
0ce20dd840897b Alexander Potapenko 2021-02-25  482  
0ce20dd840897b Alexander Potapenko 2021-02-25  483  	/* Update remaining metadata. */
a9ab52bbcb52df Marco Elver         2021-11-05 @484  	metadata_update_state(meta, KFENCE_OBJECT_ALLOCATED, stack_entries, num_stack_entries);
0ce20dd840897b Alexander Potapenko 2021-02-25  485  	/* Pairs with READ_ONCE() in kfence_shutdown_cache(). */
0ce20dd840897b Alexander Potapenko 2021-02-25  486  	WRITE_ONCE(meta->cache, cache);
0ce20dd840897b Alexander Potapenko 2021-02-25  487  	meta->size = size;
08f6b10630f284 Marco Elver         2021-11-05 @488  	meta->alloc_stack_hash = alloc_stack_hash;
49332956227adb Marco Elver         2021-11-05 @489  	raw_spin_unlock_irqrestore(&meta->lock, flags);
08f6b10630f284 Marco Elver         2021-11-05  490  
49332956227adb Marco Elver         2021-11-05  491  	alloc_covered_add(alloc_stack_hash, 1);
0ce20dd840897b Alexander Potapenko 2021-02-25  492  
8dae0cfed57357 Vlastimil Babka     2021-11-03  493  	/* Set required slab fields. */
9d248937bc5b84 Marco Elver         2025-01-09  494  	slab = virt_to_slab(addr);
8dae0cfed57357 Vlastimil Babka     2021-11-03  495  	slab->slab_cache = cache;
8dae0cfed57357 Vlastimil Babka     2021-11-03  496  	slab->objects = 1;
0ce20dd840897b Alexander Potapenko 2021-02-25  497  
0ce20dd840897b Alexander Potapenko 2021-02-25  498  	/* Memory initialization. */
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  499  	set_canary(meta);
0ce20dd840897b Alexander Potapenko 2021-02-25  500  
0ce20dd840897b Alexander Potapenko 2021-02-25  501  	/*
0ce20dd840897b Alexander Potapenko 2021-02-25  502  	 * We check slab_want_init_on_alloc() ourselves, rather than letting
0ce20dd840897b Alexander Potapenko 2021-02-25  503  	 * SL*B do the initialization, as otherwise we might overwrite KFENCE's
0ce20dd840897b Alexander Potapenko 2021-02-25  504  	 * redzone.
0ce20dd840897b Alexander Potapenko 2021-02-25  505  	 */
0ce20dd840897b Alexander Potapenko 2021-02-25  506  	if (unlikely(slab_want_init_on_alloc(gfp, cache)))
0ce20dd840897b Alexander Potapenko 2021-02-25  507  		memzero_explicit(addr, size);
0ce20dd840897b Alexander Potapenko 2021-02-25  508  	if (cache->ctor)
0ce20dd840897b Alexander Potapenko 2021-02-25  509  		cache->ctor(addr);
0ce20dd840897b Alexander Potapenko 2021-02-25  510  
327b18b7aaed5d Jason A. Donenfeld  2022-06-09  511  	if (random_fault)
0ce20dd840897b Alexander Potapenko 2021-02-25  512  		kfence_protect(meta->addr); /* Random "faults" by protecting the object. */
0ce20dd840897b Alexander Potapenko 2021-02-25  513  
0ce20dd840897b Alexander Potapenko 2021-02-25  514  	atomic_long_inc(&counters[KFENCE_COUNTER_ALLOCATED]);
0ce20dd840897b Alexander Potapenko 2021-02-25  515  	atomic_long_inc(&counters[KFENCE_COUNTER_ALLOCS]);
0ce20dd840897b Alexander Potapenko 2021-02-25  516  
0ce20dd840897b Alexander Potapenko 2021-02-25  517  	return addr;
0ce20dd840897b Alexander Potapenko 2021-02-25  518  }
0ce20dd840897b Alexander Potapenko 2021-02-25  519  

:::::: The code at line 462 was first introduced by commit
:::::: 0ce20dd840897b12ae70869c69f1ba34d6d16965 mm: add Kernel Electric-Fence infrastructure

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
