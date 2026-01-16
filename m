Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED701EA65
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 04:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768537215; cv=none; b=CgdM1zHjxtCtnsA1/g+zHn3lo0kWMB9HmMH8L3G+s1Y+8CBOrFk6p6wMLQxEL+EmKQtMAaVTB4QelTAR6zlxsFcu9wlIx7fkkcwuxPlUvVC+SjCc1IB2qqvKkR7lzmG6lnOaLQoFwg59QfzdFxBLlyE/05vyGrF/D+XrpIdlCKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768537215; c=relaxed/simple;
	bh=dwQA0Tr3QY81WQdUXs3ZR7PiGPLBAvm/8Sm8T3GCtDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BLC3bsOXgp/J8/5CkaUur3aMfoJJ+TWR4ZftNJQROJFN7fFe7wSH6Voy7GGoi0mEoLc/a6XxFaWNTYxq3epBpXGaD7poDYAc1Q9DRY29AJDpout6tLst6k1wnE2znoJ43kA5eV5LXeMxw6emOettRK9ghNeUgjGsPnVvikG1ZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjfymtHu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjfymtHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768537214; x=1800073214;
  h=date:from:to:cc:subject:message-id;
  bh=dwQA0Tr3QY81WQdUXs3ZR7PiGPLBAvm/8Sm8T3GCtDo=;
  b=SjfymtHun1DWDWgeeQs03Stf5tVlrwvribsV/HxW3NW9ol4k7EFwh/hi
   uolB91yCYHUzZpwq/pDQY4eiEcZn84avfVhqXOEMCUvxKDx+FwJsUi4pu
   FxRjizNTshRnymPh46JSgWRSH3RHoLi+889RXiSHyPCy/U8HdSLW1Ll46
   46FcCzM4hjrCLNuMXF0JVjIGr9LQjYnJRbUXLmRZ14sv7FSJ58L8IOrTX
   s36/Ul7dSMOhx05RgPc+LWqZa0bj0M8mY0tmf6bHjXb4dCizh3YlQJ5WZ
   uaB+D+fi8lEGa2rXVEt6ZbGeoEHqJIHo4XcumIHISLBaeLQqdaC7ANIHg
   A==;
X-CSE-ConnectionGUID: eLYLfzlEQFuxIF5aJBI+Vg==
X-CSE-MsgGUID: ahpVDl2FScaR5PElmz7YnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69055480"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69055480"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 20:20:13 -0800
X-CSE-ConnectionGUID: 30GFWGbhTp+MOzhskbz5rw==
X-CSE-MsgGUID: fGmiG0OzRP2XYv5US0BMVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204930647"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Jan 2026 20:20:11 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgbJg-000000001hN-1p4R;
	Fri, 16 Jan 2026 04:20:08 +0000
Date: Fri, 16 Jan 2026 05:19:08 +0100
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 37/37]
 include/linux/spinlock.h:582:56: error: too many arguments provided to
 function-like macro invocation
Message-ID: <202601160538.hcZN4ljj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   3a6d19e51fad5bde689a9dc06c7fceb435d1b015
commit: 3a6d19e51fad5bde689a9dc06c7fceb435d1b015 [37/37] WIP: scoped init guards
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260116/202601160538.hcZN4ljj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160538.hcZN4ljj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160538.hcZN4ljj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
>> include/linux/spinlock.h:582:56: error: too many arguments provided to function-like macro invocation
     582 | DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
         |                                                        ^
   include/linux/spinlock.h:113:17: note: expanded from macro 'raw_spin_lock_init'
     113 |         do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
         |                        ^
   include/linux/spinlock_types_raw.h:70:19: note: expanded from macro '__RAW_SPIN_LOCK_UNLOCKED'
      70 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
         |                          ^
   include/linux/spinlock_types_raw.h:67:34: note: expanded from macro '__RAW_SPIN_LOCK_INITIALIZER'
      67 |         RAW_SPIN_DEP_MAP_INIT(lockname) }
         |                                         ^
   include/linux/cleanup.h:496:9: note: macro '__DEFINE_LOCK_GUARD_1' defined here
     496 | #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)                      \
         |         ^
   include/linux/spinlock.h:582:1: note: parentheses are required around macro argument containing braced initializer list
     582 | DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
         | ^
         |                                                        (
   include/linux/cleanup.h:558:60: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     558 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         |                                                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
>> include/linux/spinlock.h:582:56: error: expected expression
     582 | DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
         |                                                        ^
   include/linux/spinlock.h:113:2: note: expanded from macro 'raw_spin_lock_init'
     113 |         do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
         |         ^
   include/linux/spinlock.h:630:48: error: too many arguments provided to function-like macro invocation
     630 | DEFINE_LOCK_GUARD_1(spinlock_init, spinlock_t, spin_lock_init(_T->lock), /* */)
         |                                                ^
   include/linux/spinlock.h:333:13: note: expanded from macro 'spin_lock_init'
     333 |         *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
         |                    ^
   include/linux/spinlock_types.h:42:15: note: expanded from macro '__SPIN_LOCK_UNLOCKED'
      42 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
         |                      ^
   include/linux/spinlock_types.h:39:15: note: expanded from macro '__SPIN_LOCK_INITIALIZER'
      39 |         { { .rlock = ___SPIN_LOCK_INITIALIZER(lockname) } }
         |                      ^
   include/linux/spinlock_types.h:36:30: note: expanded from macro '___SPIN_LOCK_INITIALIZER'
      36 |         SPIN_DEP_MAP_INIT(lockname) }
         |                                     ^
   include/linux/cleanup.h:496:9: note: macro '__DEFINE_LOCK_GUARD_1' defined here
     496 | #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)                      \
         |         ^
   include/linux/spinlock.h:630:1: note: parentheses are required around macro argument containing braced initializer list
     630 | DEFINE_LOCK_GUARD_1(spinlock_init, spinlock_t, spin_lock_init(_T->lock), /* */)
         | ^
         |                                                (
   include/linux/cleanup.h:558:60: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     558 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         |                                                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   include/linux/spinlock.h:630:48: error: expected expression
     630 | DEFINE_LOCK_GUARD_1(spinlock_init, spinlock_t, spin_lock_init(_T->lock), /* */)
         |                                                ^
   include/linux/spinlock.h:330:34: note: expanded from macro 'spin_lock_init'
     330 | # define spin_lock_init(_lock)                  \
         |                                                 ^
   include/linux/spinlock.h:672:44: error: too many arguments provided to function-like macro invocation
     672 | DEFINE_LOCK_GUARD_1(rwlock_init, rwlock_t, rwlock_init(_T->lock), /* */)
         |                                            ^
   include/linux/rwlock.h:28:17: note: expanded from macro 'rwlock_init'
      28 |         do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
         |                        ^
   include/linux/rwlock_types.h:48:27: note: expanded from macro '__RW_LOCK_UNLOCKED'
      48 |         (rwlock_t)      {       .raw_lock = __ARCH_RW_LOCK_UNLOCKED,    \
         |                                             ^
   include/asm-generic/qrwlock_types.h:30:28: note: expanded from macro '__ARCH_RW_LOCK_UNLOCKED'
      30 |         { .cnts = ATOMIC_INIT(0), },            \
         |                                   ^
   include/linux/cleanup.h:496:9: note: macro '__DEFINE_LOCK_GUARD_1' defined here
     496 | #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)                      \
         |         ^
   include/linux/spinlock.h:672:1: note: parentheses are required around macro argument containing braced initializer list
     672 | DEFINE_LOCK_GUARD_1(rwlock_init, rwlock_t, rwlock_init(_T->lock), /* */)
         | ^
         |                                            (
   include/linux/cleanup.h:558:60: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     558 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         |                                                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   include/linux/spinlock.h:672:44: error: expected expression
     672 | DEFINE_LOCK_GUARD_1(rwlock_init, rwlock_t, rwlock_init(_T->lock), /* */)
         |                                            ^
   include/linux/rwlock.h:28:2: note: expanded from macro 'rwlock_init'
      28 |         do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
>> include/linux/seqlock.h:1362:46: error: too many arguments provided to function-like macro invocation
    1362 | DEFINE_LOCK_GUARD_1(seqlock_init, seqlock_t, seqlock_init(_T->lock), /* */)
         |                                              ^
   include/linux/seqlock.h:818:3: note: expanded from macro 'seqlock_init'
     818 |                 spin_lock_init(&(sl)->lock);                            \
         |                 ^
   include/linux/spinlock.h:333:13: note: expanded from macro 'spin_lock_init'
     333 |         *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
         |                    ^
   include/linux/spinlock_types.h:42:15: note: expanded from macro '__SPIN_LOCK_UNLOCKED'
      42 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
         |                      ^
   include/linux/spinlock_types.h:39:15: note: expanded from macro '__SPIN_LOCK_INITIALIZER'
      39 |         { { .rlock = ___SPIN_LOCK_INITIALIZER(lockname) } }
         |                      ^
   include/linux/spinlock_types.h:36:30: note: expanded from macro '___SPIN_LOCK_INITIALIZER'
      36 |         SPIN_DEP_MAP_INIT(lockname) }
         |                                     ^
   include/linux/cleanup.h:496:9: note: macro '__DEFINE_LOCK_GUARD_1' defined here
     496 | #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)                      \
         |         ^
   include/linux/seqlock.h:1362:1: note: parentheses are required around macro argument containing braced initializer list
    1362 | DEFINE_LOCK_GUARD_1(seqlock_init, seqlock_t, seqlock_init(_T->lock), /* */)
         | ^
         |                                              (
   include/linux/cleanup.h:558:60: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     558 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         |                                                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
>> include/linux/seqlock.h:1362:46: error: expected expression
    1362 | DEFINE_LOCK_GUARD_1(seqlock_init, seqlock_t, seqlock_init(_T->lock), /* */)
         |                                              ^
   include/linux/seqlock.h:817:2: note: expanded from macro 'seqlock_init'
     817 |         do {                                                            \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +582 include/linux/spinlock.h

   581	
 > 582	DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
   583	DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_init, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
   584	#define class_raw_spinlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_init, _T)
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
