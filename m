Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505A42E7623
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547568; cv=none; b=nDRiNhtl3pwQ1fLPbXQDc5KTP/30DxuEoLyyW2pVNmwhvR18P+oEXCXBIZqPT1fSXwYAglk8SGFM1FgDhWmvrOIZGimxwosYIsYRQLoMoMCzRy6RChgUISEIUUOjeGs7kKeoupxzFTfY6FaGzLWOtlvnEiBoq2fIT0HRUJzJTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547568; c=relaxed/simple;
	bh=wrpaG1I+PNBsN1R8Ue61Qw6PTYgG8re8Dxsg5JR2ggk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aeQm8tMvsZWbMq4kpl+7rhp7pBHRNH8/iSCg9Hxc7RZBlCwkKEbpTp5RAv+VOVnZXLmDPT8XWaFk5TP9bVs6X35a/D9fnwVzQKgaSl1eFOr74GlqPZy93X7HKAVTQe5aB9nfhEgrmAvY7j1BHeNdH4OKx6s2KjexwumjIAwSaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXcki9uf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXcki9uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768547566; x=1800083566;
  h=date:from:to:cc:subject:message-id;
  bh=wrpaG1I+PNBsN1R8Ue61Qw6PTYgG8re8Dxsg5JR2ggk=;
  b=mXcki9ufECwPckRCKNQJIcNUEyWr07U2XuBNl1F97jNbHXK4YROU2xaY
   gsayr/unow/YI+Lzq8oxOo3ykcY9k2qzsv0wm/KNUn4FZZaHHivM170aX
   st/0BEzaqKf22LY/kdFYQHLlqqbjm3OacHceQw3otWk6Z+vmT9dfHJdQa
   PcUG1gp/qWCpcMLm3C5ma6E65ORqU5CwwkFIwqK+g9zPsAiXVGn3ahb41
   PzYPC2Z9vqbLXiGqI7FSEyrW39yMWPeyMcDy3r0tFjXfebzDHwi4N9W1R
   IGQ9ViJW7cPn5HA/F+m+/TjOGEFZJA3gU5ep0x6TMukOxcJsTJWqZT93m
   g==;
X-CSE-ConnectionGUID: pI3j8rDFShiLTyiRfN7Arw==
X-CSE-MsgGUID: py2FdT2kQ4qZ41jpI4BmVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87279303"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="87279303"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 23:12:46 -0800
X-CSE-ConnectionGUID: pB7iiP9OQ2yR3Bu+kK0kAA==
X-CSE-MsgGUID: W5FS4BzmTB2Ro91KNvv/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205447653"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 23:12:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vge0f-00000000KWC-3l3O;
	Fri, 16 Jan 2026 07:12:41 +0000
Date: Fri, 16 Jan 2026 15:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 37/37]
 include/linux/spinlock.h:582:56: error: too many arguments provided to
 function-like macro invocation
Message-ID: <202601161552.UR23pmSX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   3a6d19e51fad5bde689a9dc06c7fceb435d1b015
commit: 3a6d19e51fad5bde689a9dc06c7fceb435d1b015 [37/37] WIP: scoped init guards
config: hexagon-randconfig-001-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161552.UR23pmSX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161552.UR23pmSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161552.UR23pmSX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
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
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
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
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
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
   include/linux/rwlock_types.h:49:31: note: expanded from macro '__RW_LOCK_UNLOCKED'
      49 |                                 RW_DEP_MAP_INIT(lockname) }
         |                                                           ^
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
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   include/linux/spinlock.h:672:44: error: expected expression
     672 | DEFINE_LOCK_GUARD_1(rwlock_init, rwlock_t, rwlock_init(_T->lock), /* */)
         |                                            ^
   include/linux/rwlock.h:28:2: note: expanded from macro 'rwlock_init'
      28 |         do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:19:
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
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:19:
>> include/linux/seqlock.h:1362:46: error: expected expression
    1362 | DEFINE_LOCK_GUARD_1(seqlock_init, seqlock_t, seqlock_init(_T->lock), /* */)
         |                                              ^
   include/linux/seqlock.h:817:2: note: expanded from macro 'seqlock_init'
     817 |         do {                                                            \
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +582 include/linux/spinlock.h

   581	
 > 582	DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
   583	DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_init, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
   584	#define class_raw_spinlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_init, _T)
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
