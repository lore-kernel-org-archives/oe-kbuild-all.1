Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475A315D46
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554232; cv=none; b=XBTQrI9gyRug2VQCI0quIiignmJ2ZxEfmCTRO4iBxKYYbe4kHPbFG/A3dIlEcBlHazbTtvkWpI83so3qkJGydl+MSEKV4rTHeV37l0WopZl7iSsD6n1QJzePWZzGREHzSHIQxLz5NNQj65eoJmdGQe9eNER+08LC754tli8gUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554232; c=relaxed/simple;
	bh=v2pM9JRFiF7GYKHg9Ab75VKM/hpXrUXHZ11z19D8aPg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nTew/7mgilxC315lhXH1JV/FM5QvHvSbvmSq4TDJpZ0SQA/T/OmkEebzrwnDF0RddybH1dw+BN5tGvU8sujLS1Mq++t0FfTXLZgtcfWD5DYym3/+oPFbOzZndfObnmgaXyzDfQDKVTBABEPIXwElP0WYznaHkd9+jCz0UXg4nf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDXVEuVA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDXVEuVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768554231; x=1800090231;
  h=date:from:to:cc:subject:message-id;
  bh=v2pM9JRFiF7GYKHg9Ab75VKM/hpXrUXHZ11z19D8aPg=;
  b=XDXVEuVAPCXni7OAlqBJrzoCs22mJatZLNf719zlTUOuyL4fi653PGf9
   f5m/9rsghy1rwwmknqBindTtbl0Bv1vlDZL77Tv0IG3DgFUv5wLF4+hvB
   RngHIMOYhfpxnCy287/mbBPfhK6EeJCvfvd4b7ydHRn36WeszUM5Rw+iT
   PsQheb/8Xv6hsQ89PSGr2UtClHrkZANgBoe28Qvmcu7gCSOwr+vEEb7cP
   b51W/YY2rcP4qY76f31a30oR/xdZ4E0OFCw8QeMXMmJCM/mtfwEVjGxlT
   y2U+EBmhltrvmtzvlakGCUk4TRFCpOY5VptykBijjU0hIiGP12GkJCGIn
   w==;
X-CSE-ConnectionGUID: Z5tHUjPKS0inDdYPwlBE3A==
X-CSE-MsgGUID: mm8z+9l1Tkib0qZjAwyxpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73721210"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73721210"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:03:50 -0800
X-CSE-ConnectionGUID: DsPFdf8ySp6zOOznxTMEHA==
X-CSE-MsgGUID: TUET9BONTa2a+hoMnxqrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="236451634"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 01:03:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgfkA-00000000Kcv-3MMP;
	Fri, 16 Jan 2026 09:03:46 +0000
Date: Fri, 16 Jan 2026 17:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 37/37]
 include/linux/local_lock_internal.h:84:36: warning: cast to generic address
 space pointer from disjoint '__seg_gs' address space pointer
Message-ID: <202601161645.rEIxqjhD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   3a6d19e51fad5bde689a9dc06c7fceb435d1b015
commit: 3a6d19e51fad5bde689a9dc06c7fceb435d1b015 [37/37] WIP: scoped init guards
config: x86_64-buildonly-randconfig-001-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161645.rEIxqjhD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161645.rEIxqjhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161645.rEIxqjhD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/local_lock.h: In function 'class_local_lock_init_constructor':
>> include/linux/local_lock_internal.h:84:36: warning: cast to generic address space pointer from disjoint '__seg_gs' address space pointer
      84 |         debug_check_no_locks_freed((void *)lock, sizeof(*lock));\
         |                                    ^
   include/linux/cleanup.h:501:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     501 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:107:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     107 | DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:11:41: note: in expansion of macro '__local_lock_init'
      11 | #define local_lock_init(lock)           __local_lock_init(lock)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:107:61: note: in expansion of macro 'local_lock_init'
     107 | DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
         |                                                             ^~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:85:31: error: passing argument 1 of 'lockdep_init_map_type' from pointer to non-enclosed address space
      85 |         lockdep_init_map_type(&(lock)->dep_map, #lock, &__key,  \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/cleanup.h:501:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     501 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:107:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     107 | DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:11:41: note: in expansion of macro '__local_lock_init'
      11 | #define local_lock_init(lock)           __local_lock_init(lock)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:107:61: note: in expansion of macro 'local_lock_init'
     107 | DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
         |                                                             ^~~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:63:
   include/linux/lockdep.h:128:55: note: expected 'struct lockdep_map *' but argument is of type '__seg_gs struct lockdep_map *'
     128 | extern void lockdep_init_map_type(struct lockdep_map *lock, const char *name,
         |                                   ~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/local_lock.h:107:79: error: passing argument 1 of 'local_lock_debug_init' from pointer to non-enclosed address space
     107 | DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
         |                                                                             ~~^~~~~~
   include/linux/cleanup.h:501:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     501 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:107:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     107 | DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:11:41: note: in expansion of macro '__local_lock_init'
      11 | #define local_lock_init(lock)           __local_lock_init(lock)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:107:61: note: in expansion of macro 'local_lock_init'
     107 | DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
         |                                                             ^~~~~~~~~~~~~~~
   In file included from include/linux/local_lock.h:5,
                    from include/linux/mmzone.h:24,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:18:
   include/linux/local_lock_internal.h:64:56: note: expected 'local_lock_t *' {aka 'struct local_lock *'} but argument is of type '__seg_gs local_lock_t *' {aka '__seg_gs struct local_lock *'}
      64 | static inline void local_lock_debug_init(local_lock_t *l)
         |                                          ~~~~~~~~~~~~~~^
   include/linux/local_lock.h: In function 'class_local_trylock_init_constructor':
   include/linux/local_lock_internal.h:93:27: warning: cast to generic address space pointer from disjoint '__seg_gs' address space pointer
      93 |         __local_lock_init((local_lock_t *)lock);                \
         |                           ^
   include/linux/cleanup.h:501:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     501 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:120:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     120 | DEFINE_LOCK_GUARD_1(local_trylock_init, local_trylock_t __percpu, local_trylock_init(_T->lock), /* */)
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:93:9: note: in expansion of macro '__local_lock_init'
      93 |         __local_lock_init((local_lock_t *)lock);                \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:59:41: note: in expansion of macro '__local_trylock_init'
      59 | #define local_trylock_init(lock)        __local_trylock_init(lock)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:120:67: note: in expansion of macro 'local_trylock_init'
     120 | DEFINE_LOCK_GUARD_1(local_trylock_init, local_trylock_t __percpu, local_trylock_init(_T->lock), /* */)
         |                                                                   ^~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:93:27: warning: cast to generic address space pointer from disjoint '__seg_gs' address space pointer
      93 |         __local_lock_init((local_lock_t *)lock);                \
         |                           ^
   include/linux/cleanup.h:501:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     501 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:120:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     120 | DEFINE_LOCK_GUARD_1(local_trylock_init, local_trylock_t __percpu, local_trylock_init(_T->lock), /* */)
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:93:9: note: in expansion of macro '__local_lock_init'
      93 |         __local_lock_init((local_lock_t *)lock);                \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:59:41: note: in expansion of macro '__local_trylock_init'
      59 | #define local_trylock_init(lock)        __local_trylock_init(lock)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:120:67: note: in expansion of macro 'local_trylock_init'
     120 | DEFINE_LOCK_GUARD_1(local_trylock_init, local_trylock_t __percpu, local_trylock_init(_T->lock), /* */)
         |                                                                   ^~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:93:27: warning: cast to generic address space pointer from disjoint '__seg_gs' address space pointer
      93 |         __local_lock_init((local_lock_t *)lock);                \
         |                           ^
   include/linux/cleanup.h:501:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     501 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:120:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'


vim +/__seg_gs +84 include/linux/local_lock_internal.h

d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  79  
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  80  #define __local_lock_init(lock)					\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  81  do {								\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  82  	static struct lock_class_key __key;			\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  83  								\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15 @84  	debug_check_no_locks_freed((void *)lock, sizeof(*lock));\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  85  	lockdep_init_map_type(&(lock)->dep_map, #lock, &__key,  \
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  86  			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  87  			      LD_LOCK_PERCPU);			\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  88  	local_lock_debug_init(lock);				\
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  89  } while (0)
d8bbd97ad0b99a9 Thomas Gleixner 2021-08-15  90  

:::::: The code at line 84 was first introduced by commit
:::::: d8bbd97ad0b99a9394f2cd8410b884c48e218cf0 locking/local_lock: Add missing owner initialization

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
