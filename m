Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D0215043
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738791107; cv=none; b=tfTt7aMY4PWzDJqasgQt0BrxZxQjcl1B2RYgo9MEKapUkoDOtBohv98jdGPS5RAywA0Gm0JbqrI2eX/rwpCcMDy2efIufabfMWIeYpAV1t0RdsFLpSIkmTBqNHz3T+0AsALWAyfyME4+6ZiJtVwO2O7gabeadsG81U6/vtpGWME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738791107; c=relaxed/simple;
	bh=YauuaYogXDMEnyaPXuDatUUCFM7ku1BVJnFi9jt3Vzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/znsVHqOaRTw8SKLRvjqwuDsUuaCKudiGbyYqL66jCCgoa8bw9JXNMWXfmgkcDC/7gKW0tnItFK+eJg8BSUU1FLut6rSHGNoiTngQiUywjh8y/pas9lmx8eXSLk5ecZkaOtfSjWE0AnKPtxJiiRqUxx6nfMpMxrvyxHDjBILW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhOo3X2t; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhOo3X2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738791105; x=1770327105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YauuaYogXDMEnyaPXuDatUUCFM7ku1BVJnFi9jt3Vzg=;
  b=XhOo3X2t3C8kcerL4KCkg+dgU/Mx+aU7Qr6K06tynPPbCZTrbMqPbgYb
   STCYZvs0k8uu/LMGnz12ZIBtqL4H6sdGH6x6POFS++yJsUBmv/FXZJvRy
   G7CUpVJyC9A5ah5WlOkWbFmXUjQ8R2v8b5y2aw6vUQWGjM8QbtdvUXV4V
   qaRtowaCJNDh0SkbWEyeJBq8U9VIF2qrY+BpTkAqTDXqgwjxu0B5Ckjka
   lLUAqWumFoiARNk4lPXI5LeCbWFQwlk0OJ9GRhdF7cebez1uTMfCz8m0G
   yKdNBbi7CXzMkXHrPrTIeali9iEUSC32lGb240HovyHE5eSSV6Qv+FQ+d
   w==;
X-CSE-ConnectionGUID: LcuSPNprR4G09BU2czeQaw==
X-CSE-MsgGUID: 5edJSnuSTXGVo+wDkK2dsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39272429"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39272429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 13:31:44 -0800
X-CSE-ConnectionGUID: lSUKfg4HRpW7c+hv9MrLrQ==
X-CSE-MsgGUID: GSfSgRCXToq8jpD9Au9Rvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110997733"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 13:31:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfmzj-000w5v-2V;
	Wed, 05 Feb 2025 21:31:39 +0000
Date: Thu, 6 Feb 2025 05:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 21/21] lib/stackdepot.c:649:8: warning:
 acquiring raw_spinlock 'pool_lock' that is already held
Message-ID: <202502060536.ikPlRo0U-lkp@intel.com>
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
commit: a0d770da40bf833f1f658fc84741c8f3fee2a385 [21/21] stackdepot: Enable capability analysis
config: i386-buildonly-randconfig-001-20250206 (https://download.01.org/0day-ci/archive/20250206/202502060536.ikPlRo0U-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060536.ikPlRo0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060536.ikPlRo0U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/stackdepot.c:649:8: warning: acquiring raw_spinlock 'pool_lock' that is already held [-Wthread-safety-analysis]
     649 |                 if (!raw_spin_trylock_irqsave(&pool_lock, flags))
         |                      ^
   include/linux/spinlock.h:298:2: note: expanded from macro 'raw_spin_trylock_irqsave'
     298 |         __cond_lock(lock, ({                            \
         |         ^
   include/linux/compiler-capability-analysis.h:170:28: note: expanded from macro '__cond_lock'
     170 | # define __cond_lock(x, c)      __try_acquire_cap(x, c)
         |                                 ^
   lib/stackdepot.c:649:8: note: raw_spinlock acquired here
   include/linux/spinlock.h:300:3: note: expanded from macro 'raw_spin_trylock_irqsave'
     300 |                 _raw_spin_trylock(lock) ?               \
         |                 ^
   include/linux/spinlock_api_up.h:72:38: note: expanded from macro '_raw_spin_trylock'
      72 | #define _raw_spin_trylock(lock)                 ({ __LOCK(lock); 1; })
         |                                                    ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
      31 |   do { preempt_disable(); ___LOCK(lock); } while (0)
         |                           ^
   include/linux/spinlock_api_up.h:28:8: note: expanded from macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-capability-analysis.h:168:24: note: expanded from macro '__acquire'
     168 | # define __acquire(x)           __acquire_cap(x)
         |                                 ^
>> lib/stackdepot.c:684:6: warning: raw_spinlock 'pool_lock' is not held on every path through here [-Wthread-safety-analysis]
     684 |         if (prealloc) {
         |             ^
   lib/stackdepot.c:649:8: note: raw_spinlock acquired here
     649 |                 if (!raw_spin_trylock_irqsave(&pool_lock, flags))
         |                      ^
   include/linux/spinlock.h:300:3: note: expanded from macro 'raw_spin_trylock_irqsave'
     300 |                 _raw_spin_trylock(lock) ?               \
         |                 ^
   include/linux/spinlock_api_up.h:72:38: note: expanded from macro '_raw_spin_trylock'
      72 | #define _raw_spin_trylock(lock)                 ({ __LOCK(lock); 1; })
         |                                                    ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
      31 |   do { preempt_disable(); ___LOCK(lock); } while (0)
         |                           ^
   include/linux/spinlock_api_up.h:28:8: note: expanded from macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-capability-analysis.h:168:24: note: expanded from macro '__acquire'
     168 | # define __acquire(x)           __acquire_cap(x)
         |                                 ^
   2 warnings generated.


vim +/pool_lock +649 lib/stackdepot.c

cd11016e5f5212 Alexander Potapenko 2016-03-25  595  
022012dcf44209 Andrey Konovalov    2023-11-20  596  depot_stack_handle_t stack_depot_save_flags(unsigned long *entries,
c0cfc337264c5e Thomas Gleixner     2019-04-25  597  					    unsigned int nr_entries,
022012dcf44209 Andrey Konovalov    2023-11-20  598  					    gfp_t alloc_flags,
022012dcf44209 Andrey Konovalov    2023-11-20  599  					    depot_flags_t depot_flags)
cd11016e5f5212 Alexander Potapenko 2016-03-25  600  {
4805180bc16523 Andrey Konovalov    2023-11-20  601  	struct list_head *bucket;
4805180bc16523 Andrey Konovalov    2023-11-20  602  	struct stack_record *found = NULL;
603c000c115b40 Andrey Konovalov    2023-11-20  603  	depot_stack_handle_t handle = 0;
cd11016e5f5212 Alexander Potapenko 2016-03-25  604  	struct page *page = NULL;
cd11016e5f5212 Alexander Potapenko 2016-03-25  605  	void *prealloc = NULL;
022012dcf44209 Andrey Konovalov    2023-11-20  606  	bool can_alloc = depot_flags & STACK_DEPOT_FLAG_CAN_ALLOC;
c0cfc337264c5e Thomas Gleixner     2019-04-25  607  	unsigned long flags;
c0cfc337264c5e Thomas Gleixner     2019-04-25  608  	u32 hash;
cd11016e5f5212 Alexander Potapenko 2016-03-25  609  
022012dcf44209 Andrey Konovalov    2023-11-20  610  	if (WARN_ON(depot_flags & ~STACK_DEPOT_FLAGS_MASK))
022012dcf44209 Andrey Konovalov    2023-11-20  611  		return 0;
022012dcf44209 Andrey Konovalov    2023-11-20  612  
e940066089490e Marco Elver         2022-01-21  613  	/*
e940066089490e Marco Elver         2022-01-21  614  	 * If this stack trace is from an interrupt, including anything before
e940066089490e Marco Elver         2022-01-21  615  	 * interrupt entry usually leads to unbounded stack depot growth.
e940066089490e Marco Elver         2022-01-21  616  	 *
b232b9995a6dba Andrey Konovalov    2023-02-10  617  	 * Since use of filter_irq_stacks() is a requirement to ensure stack
b232b9995a6dba Andrey Konovalov    2023-02-10  618  	 * depot can efficiently deduplicate interrupt stacks, always
e940066089490e Marco Elver         2022-01-21  619  	 * filter_irq_stacks() to simplify all callers' use of stack depot.
e940066089490e Marco Elver         2022-01-21  620  	 */
e940066089490e Marco Elver         2022-01-21  621  	nr_entries = filter_irq_stacks(entries, nr_entries);
e940066089490e Marco Elver         2022-01-21  622  
735df3c3a3493c Andrey Konovalov    2023-02-10  623  	if (unlikely(nr_entries == 0) || stack_depot_disabled)
603c000c115b40 Andrey Konovalov    2023-11-20  624  		return 0;
cd11016e5f5212 Alexander Potapenko 2016-03-25  625  
c0cfc337264c5e Thomas Gleixner     2019-04-25  626  	hash = hash_stack(entries, nr_entries);
f9987921cb541b Vlastimil Babka     2022-06-20  627  	bucket = &stack_table[hash & stack_hash_mask];
cd11016e5f5212 Alexander Potapenko 2016-03-25  628  
4434a56ec20925 Marco Elver         2024-01-18  629  	/* Fast path: look the stack trace up without locking. */
4434a56ec20925 Marco Elver         2024-01-18  630  	found = find_stack(bucket, entries, nr_entries, hash, depot_flags);
4434a56ec20925 Marco Elver         2024-01-18  631  	if (found)
cd11016e5f5212 Alexander Potapenko 2016-03-25  632  		goto exit;
cd11016e5f5212 Alexander Potapenko 2016-03-25  633  
cd11016e5f5212 Alexander Potapenko 2016-03-25  634  	/*
a6cd957021f2bb Andrey Konovalov    2023-11-20  635  	 * Allocate memory for a new pool if required now:
a6cd957021f2bb Andrey Konovalov    2023-11-20  636  	 * we won't be able to do that under the lock.
cd11016e5f5212 Alexander Potapenko 2016-03-25  637  	 */
31639fd6cebd4f Marco Elver         2024-01-29  638  	if (unlikely(can_alloc && !READ_ONCE(new_pool))) {
70c435ca8dcb64 Dave Chinner        2024-04-30  639  		page = alloc_pages(gfp_nested_mask(alloc_flags),
70c435ca8dcb64 Dave Chinner        2024-04-30  640  				   DEPOT_POOL_ORDER);
cd11016e5f5212 Alexander Potapenko 2016-03-25  641  		if (page)
cd11016e5f5212 Alexander Potapenko 2016-03-25  642  			prealloc = page_address(page);
cd11016e5f5212 Alexander Potapenko 2016-03-25  643  	}
cd11016e5f5212 Alexander Potapenko 2016-03-25  644  
031e04bdc834cd Marco Elver         2024-11-22  645  	if (in_nmi()) {
031e04bdc834cd Marco Elver         2024-11-22  646  		/* We can never allocate in NMI context. */
031e04bdc834cd Marco Elver         2024-11-22  647  		WARN_ON_ONCE(can_alloc);
031e04bdc834cd Marco Elver         2024-11-22  648  		/* Best effort; bail if we fail to take the lock. */
031e04bdc834cd Marco Elver         2024-11-22 @649  		if (!raw_spin_trylock_irqsave(&pool_lock, flags))
031e04bdc834cd Marco Elver         2024-11-22  650  			goto exit;
031e04bdc834cd Marco Elver         2024-11-22  651  	} else {
4434a56ec20925 Marco Elver         2024-01-18  652  		raw_spin_lock_irqsave(&pool_lock, flags);
031e04bdc834cd Marco Elver         2024-11-22  653  	}
a914d8d6cf2042 Andrey Konovalov    2023-12-19  654  	printk_deferred_enter();
cd11016e5f5212 Alexander Potapenko 2016-03-25  655  
4434a56ec20925 Marco Elver         2024-01-18  656  	/* Try to find again, to avoid concurrently inserting duplicates. */
4434a56ec20925 Marco Elver         2024-01-18  657  	found = find_stack(bucket, entries, nr_entries, hash, depot_flags);
cd11016e5f5212 Alexander Potapenko 2016-03-25  658  	if (!found) {
b232b9995a6dba Andrey Konovalov    2023-02-10  659  		struct stack_record *new =
31639fd6cebd4f Marco Elver         2024-01-29  660  			depot_alloc_stack(entries, nr_entries, hash, depot_flags, &prealloc);
7f2b8818ea1361 Marco Elver         2021-11-05  661  
cd11016e5f5212 Alexander Potapenko 2016-03-25  662  		if (new) {
4434a56ec20925 Marco Elver         2024-01-18  663  			/*
4434a56ec20925 Marco Elver         2024-01-18  664  			 * This releases the stack record into the bucket and
4434a56ec20925 Marco Elver         2024-01-18  665  			 * makes it visible to readers in find_stack().
4434a56ec20925 Marco Elver         2024-01-18  666  			 */
4434a56ec20925 Marco Elver         2024-01-18  667  			list_add_rcu(&new->hash_list, bucket);
cd11016e5f5212 Alexander Potapenko 2016-03-25  668  			found = new;
cd11016e5f5212 Alexander Potapenko 2016-03-25  669  		}
4434a56ec20925 Marco Elver         2024-01-18  670  	}
4434a56ec20925 Marco Elver         2024-01-18  671  
4434a56ec20925 Marco Elver         2024-01-18  672  	if (prealloc) {
cd11016e5f5212 Alexander Potapenko 2016-03-25  673  		/*
4434a56ec20925 Marco Elver         2024-01-18  674  		 * Either stack depot already contains this stack trace, or
4434a56ec20925 Marco Elver         2024-01-18  675  		 * depot_alloc_stack() did not consume the preallocated memory.
4434a56ec20925 Marco Elver         2024-01-18  676  		 * Try to keep the preallocated memory for future.
cd11016e5f5212 Alexander Potapenko 2016-03-25  677  		 */
b6a353d3ebc2b5 Andrey Konovalov    2023-11-20  678  		depot_keep_new_pool(&prealloc);
cd11016e5f5212 Alexander Potapenko 2016-03-25  679  	}
cd11016e5f5212 Alexander Potapenko 2016-03-25  680  
a914d8d6cf2042 Andrey Konovalov    2023-12-19  681  	printk_deferred_exit();
4434a56ec20925 Marco Elver         2024-01-18  682  	raw_spin_unlock_irqrestore(&pool_lock, flags);
cd11016e5f5212 Alexander Potapenko 2016-03-25  683  exit:
cd11016e5f5212 Alexander Potapenko 2016-03-25 @684  	if (prealloc) {
b232b9995a6dba Andrey Konovalov    2023-02-10  685  		/* Stack depot didn't use this memory, free it. */
424cafee4a9c66 Andrey Konovalov    2023-02-10  686  		free_pages((unsigned long)prealloc, DEPOT_POOL_ORDER);
cd11016e5f5212 Alexander Potapenko 2016-03-25  687  	}
cd11016e5f5212 Alexander Potapenko 2016-03-25  688  	if (found)
603c000c115b40 Andrey Konovalov    2023-11-20  689  		handle = found->handle.handle;
603c000c115b40 Andrey Konovalov    2023-11-20  690  	return handle;
cd11016e5f5212 Alexander Potapenko 2016-03-25  691  }
022012dcf44209 Andrey Konovalov    2023-11-20  692  EXPORT_SYMBOL_GPL(stack_depot_save_flags);
11ac25c62cd2f3 Marco Elver         2021-11-05  693  

:::::: The code at line 649 was first introduced by commit
:::::: 031e04bdc834cda3b054ef6b698503b2b97e8186 stackdepot: fix stack_depot_save_flags() in NMI context

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
