Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A4E34DB54
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766513409; cv=none; b=Ve/TyqstAFo7MhBzBiYvbRTEvgjC5jUzjyOxR9ZM0XFPtY8cyU5yt1ZiyBta1gH+QfB3ZML7H4m8cOMsJ0JhvG3Zt2+PxJeREglQAUH4iox4zo5UmmKGz3hB2rWqUBtJNex966xZ4OkhNGOE8gfsaDpK0YOcMZAM5B/V1KjSkRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766513409; c=relaxed/simple;
	bh=AjlctM8z6MsPbI9jnxGhK7Fm1/uCHxnhymLsk2AAD/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=haJIhaU2RfBCXDQfMqt89eawulgey2g7ry7YkoA21MmvOXQ55cKhsfRkEzfjtS9QfcL+9i41Ly47BE+RViJyn+qG7/6gtAZyOgca9HzuVA7Le332bucuSVCRWBgc4M6PKZY1ysPQTREB8ZYXMmFDLC9wL7mPUdSSVIKAyxzHjpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETicdavz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETicdavz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766513407; x=1798049407;
  h=date:from:to:cc:subject:message-id;
  bh=AjlctM8z6MsPbI9jnxGhK7Fm1/uCHxnhymLsk2AAD/c=;
  b=ETicdavzpXB6QviRtlLfMkqltoZ0dOUy+5NIconSaWEdirNcT7w0ZYTd
   u2gQi3ulmRG1wPs08NuguYVD86Of/JCxRip6K8FXEaRbz0bJ6c2b9jUL1
   LvgEnArkS+XXquoIMoM5W9GRd4HuBkhpGKnkBmxQOVV44f4ATYQS9rwvO
   /VtoX+twATK4VnaGy3E/zTQ1rBfKIY0khTPd7HrwpXMrjT5dxoqZsHj+V
   DZOUyAgIDGxnVEyEaIGgiopkTR02WonV+ww1GXAOc40ci5KR/8fRf7fJx
   QojfoOmc5s66YJEOzmLY9Km9BYtBAwGcnmNg8BdQMe2jvMexpUiwRbr1/
   w==;
X-CSE-ConnectionGUID: sZeurQlHQyWQ7jLDjNc33g==
X-CSE-MsgGUID: Oa6S51R5QGmkGsn7kXhLtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="67557345"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="67557345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 10:10:05 -0800
X-CSE-ConnectionGUID: jCRyJjyVT3CxDDyaTaabtQ==
X-CSE-MsgGUID: UMXoofEKSKK9JVt9flRN/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="230497045"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 10:10:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY6pS-000000002G5-2WBR;
	Tue, 23 Dec 2025 18:09:52 +0000
Date: Wed, 24 Dec 2025 02:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 34/39] lib/stackdepot.c:296:9:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202512240235.GHruv8v1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: ee771bab5add646af678f7a40b6272c21a0964d7 [34/39] stackdepot: Enable context analysis
config: um-randconfig-r134-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240235.GHruv8v1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240235.GHruv8v1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240235.GHruv8v1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   lib/stackdepot.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
>> lib/stackdepot.c:296:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:296:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:296:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:344:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:344:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:368:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:368:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:368:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:401:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:401:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:401:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:440:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:440:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:440:9: sparse:     got struct raw_spinlock *

vim +296 lib/stackdepot.c

cd11016e5f5212 Alexander Potapenko 2016-03-25  289  
4434a56ec20925 Marco Elver         2024-01-18  290  /*
31639fd6cebd4f Marco Elver         2024-01-29  291   * Initializes new stack pool, and updates the list of pools.
4434a56ec20925 Marco Elver         2024-01-18  292   */
31639fd6cebd4f Marco Elver         2024-01-29  293  static bool depot_init_pool(void **prealloc)
ee771bab5add64 Marco Elver         2025-12-19  294  	__must_hold(&pool_lock)
b29d3188581400 Andrey Konovalov    2023-11-20  295  {
4434a56ec20925 Marco Elver         2024-01-18 @296  	lockdep_assert_held(&pool_lock);
4805180bc16523 Andrey Konovalov    2023-11-20  297  
ed4f142f72a919 Matt Fleming        2025-07-18  298  	if (unlikely(pools_num >= stack_max_pools)) {
31639fd6cebd4f Marco Elver         2024-01-29  299  		/* Bail out if we reached the pool limit. */
ed4f142f72a919 Matt Fleming        2025-07-18  300  		WARN_ON_ONCE(pools_num > stack_max_pools); /* should never happen */
31639fd6cebd4f Marco Elver         2024-01-29  301  		WARN_ON_ONCE(!new_pool); /* to avoid unnecessary pre-allocation */
31639fd6cebd4f Marco Elver         2024-01-29  302  		WARN_ONCE(1, "Stack depot reached limit capacity");
31639fd6cebd4f Marco Elver         2024-01-29  303  		return false;
31639fd6cebd4f Marco Elver         2024-01-29  304  	}
b29d3188581400 Andrey Konovalov    2023-11-20  305  
31639fd6cebd4f Marco Elver         2024-01-29  306  	if (!new_pool && *prealloc) {
31639fd6cebd4f Marco Elver         2024-01-29  307  		/* We have preallocated memory, use it. */
31639fd6cebd4f Marco Elver         2024-01-29  308  		WRITE_ONCE(new_pool, *prealloc);
31639fd6cebd4f Marco Elver         2024-01-29  309  		*prealloc = NULL;
31639fd6cebd4f Marco Elver         2024-01-29  310  	}
b29d3188581400 Andrey Konovalov    2023-11-20  311  
31639fd6cebd4f Marco Elver         2024-01-29  312  	if (!new_pool)
31639fd6cebd4f Marco Elver         2024-01-29  313  		return false; /* new_pool and *prealloc are NULL */
31639fd6cebd4f Marco Elver         2024-01-29  314  
31639fd6cebd4f Marco Elver         2024-01-29  315  	/* Save reference to the pool to be used by depot_fetch_stack(). */
31639fd6cebd4f Marco Elver         2024-01-29  316  	stack_pools[pools_num] = new_pool;
4434a56ec20925 Marco Elver         2024-01-18  317  
4434a56ec20925 Marco Elver         2024-01-18  318  	/*
31639fd6cebd4f Marco Elver         2024-01-29  319  	 * Stack depot tries to keep an extra pool allocated even before it runs
31639fd6cebd4f Marco Elver         2024-01-29  320  	 * out of space in the currently used pool.
31639fd6cebd4f Marco Elver         2024-01-29  321  	 *
31639fd6cebd4f Marco Elver         2024-01-29  322  	 * To indicate that a new preallocation is needed new_pool is reset to
31639fd6cebd4f Marco Elver         2024-01-29  323  	 * NULL; do not reset to NULL if we have reached the maximum number of
31639fd6cebd4f Marco Elver         2024-01-29  324  	 * pools.
4434a56ec20925 Marco Elver         2024-01-18  325  	 */
ed4f142f72a919 Matt Fleming        2025-07-18  326  	if (pools_num < stack_max_pools)
31639fd6cebd4f Marco Elver         2024-01-29  327  		WRITE_ONCE(new_pool, NULL);
31639fd6cebd4f Marco Elver         2024-01-29  328  	else
31639fd6cebd4f Marco Elver         2024-01-29  329  		WRITE_ONCE(new_pool, STACK_DEPOT_POISON);
4434a56ec20925 Marco Elver         2024-01-18  330  
4434a56ec20925 Marco Elver         2024-01-18  331  	/* Pairs with concurrent READ_ONCE() in depot_fetch_stack(). */
4434a56ec20925 Marco Elver         2024-01-18  332  	WRITE_ONCE(pools_num, pools_num + 1);
4434a56ec20925 Marco Elver         2024-01-18  333  	ASSERT_EXCLUSIVE_WRITER(pools_num);
31639fd6cebd4f Marco Elver         2024-01-29  334  
31639fd6cebd4f Marco Elver         2024-01-29  335  	pool_offset = 0;
31639fd6cebd4f Marco Elver         2024-01-29  336  
31639fd6cebd4f Marco Elver         2024-01-29  337  	return true;
b29d3188581400 Andrey Konovalov    2023-11-20  338  }
b29d3188581400 Andrey Konovalov    2023-11-20  339  

:::::: The code at line 296 was first introduced by commit
:::::: 4434a56ec20925333d6cf4d4093641d063abd35b stackdepot: make fast paths lock-less again

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
