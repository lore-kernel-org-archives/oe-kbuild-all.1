Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68A156C76
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 04:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505615; cv=none; b=A7QXZZ9pUQmwEKl5re2Ws4nakaRoEfTXHVOBsO42YJ5lQqAc++lzpgNGPKy2fuYsR9qorEzsNO9NJuUM0mCFlbriZ2sCFTwhw98dzhGXNiBGH04P3ePmgI64wqjrk4xzv72zbfao1QzvS/m7qvQ/JBuhJXJFGpdZcME06DJ99sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505615; c=relaxed/simple;
	bh=/kTh+tkG6Lj9pKitLE9kFXg4onOYZz9MZMfSuGATC7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmVcnOHGDq9RchrqTJEWErld5xCLLzNdZG1xk2CwWeS61NIblktbcKEL+bOivK8rjpVOxaXC+3Xt74RfEmGgM/pt6Sq7g+SCzJOr8KIyMNVlkS39nUuKM0Z7mW+iuyfb5CelLFd1aStLo3aqSH89mr5uSqb2QxWzpGDmaTr/UvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGaamboA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGaamboA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739505613; x=1771041613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/kTh+tkG6Lj9pKitLE9kFXg4onOYZz9MZMfSuGATC7c=;
  b=ZGaamboApY4j/onCz04dySsjseEW09zKDMb2PYumhRvdKjQT2IaT15G8
   TbzDHo0kp5RHDmKkyvfjPswbwewpiD//hpB6xpJjIVOCXPGfq27A7sbmg
   eOQP+vwMeRix5JsR8TvXl+HuPCGa9HWFw705PmtZIBvlkd6lpYquJEinm
   2wmYA1Hven7+CE+uISUstzFATZYZaiANIrXoOTgqpPAmMM3hsUQMKMsUz
   FAaFhjuBVLftIsgs2VAcRKWVH0twsE5C6sGN4ZSrP9VF56EeXYdVsYBXK
   9Stng6ncP1aCnK98C1ZDMGGc38hc0K12bAA7px/4ipPw65LKiEDQtbBRk
   A==;
X-CSE-ConnectionGUID: tZzm2xp+QQqy/qKV3cCSTw==
X-CSE-MsgGUID: lMNVN4vMQm6nP1RSRQ9sWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40391318"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="40391318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 20:00:12 -0800
X-CSE-ConnectionGUID: hH70ix+lRqOq0KjXLuz3uA==
X-CSE-MsgGUID: zCJabamJQ9Gu0IHd/6vKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113302459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2025 20:00:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tims4-00192h-28;
	Fri, 14 Feb 2025 04:00:08 +0000
Date: Fri, 14 Feb 2025 11:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 23/26] lib/stackdepot.c:251:9: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202502141107.HcycKNCX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: d6d88d3748905102f5fd6d0a360fb96ddc1c71a3 [23/26] stackdepot: Enable capability analysis
config: i386-randconfig-r123-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141107.HcycKNCX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141107.HcycKNCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141107.HcycKNCX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/seqlock.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assert_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__release_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__assert_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__release_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__assert_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
   lib/stackdepot.c: note: in included file:
   include/linux/debugfs.h:243:1: sparse: sparse: multiple definitions for function '__assert_shared_cap'
   lib/stackdepot.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:11:1: sparse:  the previous one is here
>> lib/stackdepot.c:251:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:251:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:251:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:299:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:299:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:299:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:323:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:323:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:323:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:356:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:356:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:356:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:395:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   lib/stackdepot.c:395:9: sparse:     expected struct debugfs_cancellation const *var
   lib/stackdepot.c:395:9: sparse:     got struct raw_spinlock *
   lib/stackdepot.c:684:9: sparse: sparse: context imbalance in 'stack_depot_save_flags' - different lock contexts for basic block

vim +251 lib/stackdepot.c

cd11016e5f5212 Alexander Potapenko 2016-03-25  244  
4434a56ec20925 Marco Elver         2024-01-18  245  /*
31639fd6cebd4f Marco Elver         2024-01-29  246   * Initializes new stack pool, and updates the list of pools.
4434a56ec20925 Marco Elver         2024-01-18  247   */
31639fd6cebd4f Marco Elver         2024-01-29  248  static bool depot_init_pool(void **prealloc)
d6d88d37489051 Marco Elver         2025-02-04  249  	__must_hold(&pool_lock)
b29d3188581400 Andrey Konovalov    2023-11-20  250  {
4434a56ec20925 Marco Elver         2024-01-18 @251  	lockdep_assert_held(&pool_lock);
4805180bc16523 Andrey Konovalov    2023-11-20  252  
31639fd6cebd4f Marco Elver         2024-01-29  253  	if (unlikely(pools_num >= DEPOT_MAX_POOLS)) {
31639fd6cebd4f Marco Elver         2024-01-29  254  		/* Bail out if we reached the pool limit. */
31639fd6cebd4f Marco Elver         2024-01-29  255  		WARN_ON_ONCE(pools_num > DEPOT_MAX_POOLS); /* should never happen */
31639fd6cebd4f Marco Elver         2024-01-29  256  		WARN_ON_ONCE(!new_pool); /* to avoid unnecessary pre-allocation */
31639fd6cebd4f Marco Elver         2024-01-29  257  		WARN_ONCE(1, "Stack depot reached limit capacity");
31639fd6cebd4f Marco Elver         2024-01-29  258  		return false;
31639fd6cebd4f Marco Elver         2024-01-29  259  	}
b29d3188581400 Andrey Konovalov    2023-11-20  260  
31639fd6cebd4f Marco Elver         2024-01-29  261  	if (!new_pool && *prealloc) {
31639fd6cebd4f Marco Elver         2024-01-29  262  		/* We have preallocated memory, use it. */
31639fd6cebd4f Marco Elver         2024-01-29  263  		WRITE_ONCE(new_pool, *prealloc);
31639fd6cebd4f Marco Elver         2024-01-29  264  		*prealloc = NULL;
31639fd6cebd4f Marco Elver         2024-01-29  265  	}
b29d3188581400 Andrey Konovalov    2023-11-20  266  
31639fd6cebd4f Marco Elver         2024-01-29  267  	if (!new_pool)
31639fd6cebd4f Marco Elver         2024-01-29  268  		return false; /* new_pool and *prealloc are NULL */
31639fd6cebd4f Marco Elver         2024-01-29  269  
31639fd6cebd4f Marco Elver         2024-01-29  270  	/* Save reference to the pool to be used by depot_fetch_stack(). */
31639fd6cebd4f Marco Elver         2024-01-29  271  	stack_pools[pools_num] = new_pool;
4434a56ec20925 Marco Elver         2024-01-18  272  
4434a56ec20925 Marco Elver         2024-01-18  273  	/*
31639fd6cebd4f Marco Elver         2024-01-29  274  	 * Stack depot tries to keep an extra pool allocated even before it runs
31639fd6cebd4f Marco Elver         2024-01-29  275  	 * out of space in the currently used pool.
31639fd6cebd4f Marco Elver         2024-01-29  276  	 *
31639fd6cebd4f Marco Elver         2024-01-29  277  	 * To indicate that a new preallocation is needed new_pool is reset to
31639fd6cebd4f Marco Elver         2024-01-29  278  	 * NULL; do not reset to NULL if we have reached the maximum number of
31639fd6cebd4f Marco Elver         2024-01-29  279  	 * pools.
4434a56ec20925 Marco Elver         2024-01-18  280  	 */
31639fd6cebd4f Marco Elver         2024-01-29  281  	if (pools_num < DEPOT_MAX_POOLS)
31639fd6cebd4f Marco Elver         2024-01-29  282  		WRITE_ONCE(new_pool, NULL);
31639fd6cebd4f Marco Elver         2024-01-29  283  	else
31639fd6cebd4f Marco Elver         2024-01-29  284  		WRITE_ONCE(new_pool, STACK_DEPOT_POISON);
4434a56ec20925 Marco Elver         2024-01-18  285  
4434a56ec20925 Marco Elver         2024-01-18  286  	/* Pairs with concurrent READ_ONCE() in depot_fetch_stack(). */
4434a56ec20925 Marco Elver         2024-01-18  287  	WRITE_ONCE(pools_num, pools_num + 1);
4434a56ec20925 Marco Elver         2024-01-18  288  	ASSERT_EXCLUSIVE_WRITER(pools_num);
31639fd6cebd4f Marco Elver         2024-01-29  289  
31639fd6cebd4f Marco Elver         2024-01-29  290  	pool_offset = 0;
31639fd6cebd4f Marco Elver         2024-01-29  291  
31639fd6cebd4f Marco Elver         2024-01-29  292  	return true;
b29d3188581400 Andrey Konovalov    2023-11-20  293  }
b29d3188581400 Andrey Konovalov    2023-11-20  294  

:::::: The code at line 251 was first introduced by commit
:::::: 4434a56ec20925333d6cf4d4093641d063abd35b stackdepot: make fast paths lock-less again

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
