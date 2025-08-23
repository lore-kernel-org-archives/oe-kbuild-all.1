Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B971E9B22
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 19:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755978656; cv=none; b=EdL/aDWS69XCK5SFLfOLqUH917HGR9/U3iY8scbAKQKD4HyordsifVizv4sx/Vm++i4j+3sDvrNubnzVh8Eq6stQqyJM+oYRJwIL/KDMGDTIfHPO5U34o+kHuYvwUigAOFJXlZ9dj4+cZuZNswbzU69qIcE14rtdtUzc3mdI6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755978656; c=relaxed/simple;
	bh=Cb33VjJkMru9PzPIId9A9NcH/kRziHdknoyEve3cHwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOpTteJnlykC6GQI/4pvOPNqhUfFniogTdh8OMhekMYsJppkKAWvOyIZzGoboCr40frV7iR2LDoBaeQ/Q3W8XR7C5e7LOvLcQKP63GQ/aIgQW/soTvyeefWgOnMxCvgcWUNqS87OMbqXcmlC9uvTJfb+NSf/qSzDwhkNS7LWBM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iArmbx/Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iArmbx/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755978654; x=1787514654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cb33VjJkMru9PzPIId9A9NcH/kRziHdknoyEve3cHwY=;
  b=iArmbx/Y4oEZjY/yMvb5PvpNGvslDuF29LTGZoW9WeICUUmYW8LHuhpq
   Jgo1T9XCU8ZU+JC3wNdsC4PwBK1Ldw2u/7a2TFU/YTbyonqTkJVcqt8AW
   UsZL0+NkVbTgLGMWIm1rICNSrRqbCguV/2ufGP89rW4BDQ4xgDeDOsyGo
   kx7O4bQ8hf7dcdyNfxexM51/+u6KBJTo15B0yV7nphpPwq+gMix7bGYEl
   nUiyfXkOx59InUTKLLvNwiHoKJSzCuTNZu+Tk/WoWtrbbtnPU5nwqP7Ch
   ycwZDzY5UpQkJmCMtzEEoq9u3CFtQtOSs0+G/R3fHbaTsBgjCNC2plkne
   A==;
X-CSE-ConnectionGUID: X8g7t3rjR56F8MH2EcIfyA==
X-CSE-MsgGUID: XalhvoUSR+uQDuJDSIi6hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58347720"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58347720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 12:50:53 -0700
X-CSE-ConnectionGUID: cqx8P9ZnTzmZYvYctAYT3A==
X-CSE-MsgGUID: aWfheT+NSYaBsfrC4V5h9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174261268"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Aug 2025 12:50:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upuGH-000MY3-05;
	Sat, 23 Aug 2025 19:50:49 +0000
Date: Sun, 24 Aug 2025 03:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ye Liu <liuye@kylinos.cn>
Subject: [akpm-mm:mm-unstable 52/221] include/linux/jump_label.h:262:16:
 error: implicit declaration of function 'raw_atomic_read'
Message-ID: <202508240352.J77mKV39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3c3393d4b766eebdc475ea5bd6bbd3a221e2526e
commit: fec41ba45badfd5e087ab6ac63fc6dfef1bf8990 [52/221] mm-replace-20-page_shift-with-common-macros-for-pages-mb-conversion-fix
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20250824/202508240352.J77mKV39-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240352.J77mKV39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240352.J77mKV39-lkp@intel.com/

All errors (new ones prefixed by >>):

                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   include/asm-generic/getorder.h: In function 'get_order':
   include/asm-generic/getorder.h:38:24: error: implicit declaration of function 'ilog2' [-Wimplicit-function-declaration]
      38 |                 return ilog2((size) - 1) - PAGE_SHIFT + 1;
         |                        ^~~~~
   include/linux/thread_info.h: In function 'set_ti_thread_flag':
   include/linux/thread_info.h:97:9: error: implicit declaration of function 'set_bit'; did you mean 'test_bit'? [-Wimplicit-function-declaration]
      97 |         set_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~
         |         test_bit
   include/linux/thread_info.h: In function 'clear_ti_thread_flag':
   include/linux/thread_info.h:102:9: error: implicit declaration of function 'clear_bit' [-Wimplicit-function-declaration]
     102 |         clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_set_ti_thread_flag':
   include/linux/thread_info.h:116:16: error: implicit declaration of function 'test_and_set_bit' [-Wimplicit-function-declaration]
     116 |         return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_clear_ti_thread_flag':
   include/linux/thread_info.h:121:16: error: implicit declaration of function 'test_and_clear_bit'; did you mean 'const___clear_bit'? [-Wimplicit-function-declaration]
     121 |         return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~~~
         |                const___clear_bit
   include/linux/thread_info.h: In function 'test_ti_thread_flag':
   include/linux/bitops.h:60:47: error: implicit declaration of function '_test_bit'; did you mean 'test_bit'? [-Wimplicit-function-declaration]
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                               ^~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                ^~
   include/linux/thread_info.h:126:16: note: in expansion of macro 'test_bit'
     126 |         return test_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/alloc_tag.h:13:
   include/linux/find.h: In function 'find_nth_bit':
   include/linux/find.h:240:30: error: implicit declaration of function 'fns'; did you mean 'ffs'? [-Wimplicit-function-declaration]
     240 |                 return val ? fns(val, n) : size;
         |                              ^~~
         |                              ffs
   include/linux/bitmap.h: In function 'bitmap_weight':
   include/linux/bitmap.h:445:24: error: implicit declaration of function 'hweight_long' [-Wimplicit-function-declaration]
     445 |                 return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
         |                        ^~~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_set':
   include/linux/bitops.h:53:47: error: implicit declaration of function '___set_bit'; did you mean 'test_bit'? [-Wimplicit-function-declaration]
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                               ^~~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                ^~
   include/linux/bitmap.h:471:17: note: in expansion of macro '__set_bit'
     471 |                 __set_bit(start, map);
         |                 ^~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_clear':
   include/linux/bitops.h:54:47: error: implicit declaration of function '___clear_bit'; did you mean 'const___clear_bit'? [-Wimplicit-function-declaration]
      54 | #define __clear_bit(nr, addr)           bitop(___clear_bit, nr, addr)
         |                                               ^~~~~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                ^~
   include/linux/bitmap.h:487:17: note: in expansion of macro '__clear_bit'
     487 |                 __clear_bit(start, map);
         |                 ^~~~~~~~~~~
   include/linux/bitmap.h: In function 'bitmap_scatter':
   include/linux/bitmap.h:577:17: error: implicit declaration of function '__assign_bit' [-Wimplicit-function-declaration]
     577 |                 __assign_bit(bit, dst, test_bit(n++, src));
         |                 ^~~~~~~~~~~~
   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/bug.h:11,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/linux/random.h: In function 'get_random_u32_below':
   include/linux/random.h:79:36: error: implicit declaration of function 'is_power_of_2' [-Wimplicit-function-declaration]
      79 |                         if (likely(is_power_of_2(ceil) || (u8)mult >= (1U << 8) % ceil))
         |                                    ^~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   In file included from include/linux/smp_types.h:5,
                    from include/linux/smp.h:15,
                    from include/linux/alloc_tag.h:14:
   include/linux/llist.h: In function 'llist_add_batch':
   include/linux/llist.h:242:19: error: implicit declaration of function 'try_cmpxchg' [-Wimplicit-function-declaration]
     242 |         } while (!try_cmpxchg(&head->first, &first, new_first));
         |                   ^~~~~~~~~~~
   include/linux/llist.h: In function 'llist_del_all':
   include/linux/llist.h:283:16: error: implicit declaration of function 'xchg' [-Wimplicit-function-declaration]
     283 |         return xchg(&head->first, NULL);
         |                ^~~~
   include/linux/llist.h:283:16: error: returning 'int' from a function with return type 'struct llist_node *' makes pointer from integer without a cast [-Wint-conversion]
     283 |         return xchg(&head->first, NULL);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/static_key.h:1,
                    from include/linux/alloc_tag.h:15:
   include/linux/jump_label.h: In function 'static_key_count':
>> include/linux/jump_label.h:262:16: error: implicit declaration of function 'raw_atomic_read' [-Wimplicit-function-declaration]
     262 |         return raw_atomic_read(&key->enabled);
         |                ^~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_fast_inc_not_disabled':
   include/linux/jump_label.h:295:13: error: implicit declaration of function 'atomic_read' [-Wimplicit-function-declaration]
     295 |         v = atomic_read(&key->enabled);
         |             ^~~~~~~~~~~
   include/linux/jump_label.h:299:26: error: implicit declaration of function 'atomic_try_cmpxchg'; did you mean 'raw_cpu_try_cmpxchg'? [-Wimplicit-function-declaration]
     299 |         } while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/jump_label.h: In function 'static_key_slow_dec':
   include/linux/jump_label.h:307:9: error: implicit declaration of function 'atomic_dec' [-Wimplicit-function-declaration]
     307 |         atomic_dec(&key->enabled);
         |         ^~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_enable':
   include/linux/jump_label.h:329:9: error: implicit declaration of function 'atomic_set' [-Wimplicit-function-declaration]
     329 |         atomic_set(&key->enabled, 1);
         |         ^~~~~~~~~~
   In file included from include/linux/sched.h:25,
                    from include/linux/percpu.h:12:
   include/linux/mutex_types.h: At top level:
   include/linux/mutex_types.h:42:9: error: unknown type name 'atomic_long_t'; did you mean 'atomic_t'?
      42 |         atomic_long_t           owner;
         |         ^~~~~~~~~~~~~
         |         atomic_t
   In file included from include/linux/spinlock.h:314,
                    from include/linux/sched.h:37:
   include/linux/spinlock.h: In function 'spin_lock_irq':
>> include/linux/spinlock_api_up.h:37:8: error: implicit declaration of function 'local_irq_disable'; did you mean 'local_bh_disable'? [-Wimplicit-function-declaration]
      37 |   do { local_irq_disable(); __LOCK(lock); } while (0)
         |        ^~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:66:49: note: in expansion of macro '__LOCK_IRQ'
      66 | #define _raw_spin_lock_irq(lock)                __LOCK_IRQ(lock)
         |                                                 ^~~~~~~~~~
   include/linux/spinlock.h:274:41: note: in expansion of macro '_raw_spin_lock_irq'
     274 | #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:376:9: note: in expansion of macro 'raw_spin_lock_irq'
     376 |         raw_spin_lock_irq(&lock->rlock);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h: In function 'spin_unlock_irq':
>> include/linux/spinlock_api_up.h:53:8: error: implicit declaration of function 'local_irq_enable'; did you mean 'local_bh_enable'? [-Wimplicit-function-declaration]
      53 |   do { local_irq_enable(); __UNLOCK(lock); } while (0)
         |        ^~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:82:49: note: in expansion of macro '__UNLOCK_IRQ'
      82 | #define _raw_spin_unlock_irq(lock)              __UNLOCK_IRQ(lock)
         |                                                 ^~~~~~~~~~~~
   include/linux/spinlock.h:277:41: note: in expansion of macro '_raw_spin_unlock_irq'
     277 | #define raw_spin_unlock_irq(lock)       _raw_spin_unlock_irq(lock)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:401:9: note: in expansion of macro 'raw_spin_unlock_irq'
     401 |         raw_spin_unlock_irq(&lock->rlock);
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h: In function 'spin_unlock_irqrestore':
>> include/linux/spinlock_api_up.h:56:8: error: implicit declaration of function 'local_irq_restore' [-Wimplicit-function-declaration]
      56 |   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
         |        ^~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:86:41: note: in expansion of macro '__UNLOCK_IRQRESTORE'
      86 |                                         __UNLOCK_IRQRESTORE(lock, flags)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:282:17: note: in expansion of macro '_raw_spin_unlock_irqrestore'
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/irqflags.h:17:
   include/linux/spinlock.h: In function 'class_raw_spinlock_irqsave_constructor':
>> include/linux/spinlock_api_up.h:40:8: error: implicit declaration of function 'local_irq_save' [-Wimplicit-function-declaration]
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |        ^~~~~~~~~~~~~~
   include/linux/cleanup.h:480:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     480 |         _lock;                                                          \
         |         ^~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:69:49: note: in expansion of macro '__LOCK_IRQSAVE'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/spinlock.h:266:17: note: in expansion of macro '_raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:558:21: note: in expansion of macro 'raw_spin_lock_irqsave'
     558 |                     raw_spin_lock_irqsave(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h: In function 'clear_tsk_need_resched':
   include/linux/sched.h:2046:9: error: implicit declaration of function 'atomic_long_andnot' [-Wimplicit-function-declaration]
    2046 |         atomic_long_andnot(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY,
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/sched.h:2047:29: error: 'atomic_long_t' undeclared (first use in this function); did you mean 'atomic_t'?
    2047 |                            (atomic_long_t *)&task_thread_info(tsk)->flags);
         |                             ^~~~~~~~~~~~~
         |                             atomic_t
   include/linux/sched.h:2047:29: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/sched.h:2047:44: error: expected expression before ')' token
    2047 |                            (atomic_long_t *)&task_thread_info(tsk)->flags);
         |                                            ^
   In file included from <command-line>:
   include/linux/gfp.h: In function 'gfp_migratetype':
   include/linux/gfp.h:23:63: error: 'MIGRATE_MOVABLE' undeclared (first use in this function)
      23 |         BUILD_BUG_ON((___GFP_MOVABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_MOVABLE);
         |                                                               ^~~~~~~~~~~~~~~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/gfp.h:23:9: note: in expansion of macro 'BUILD_BUG_ON'
      23 |         BUILD_BUG_ON((___GFP_MOVABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_MOVABLE);
         |         ^~~~~~~~~~~~
   include/linux/gfp.h:24:67: error: 'MIGRATE_RECLAIMABLE' undeclared (first use in this function)
      24 |         BUILD_BUG_ON((___GFP_RECLAIMABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_RECLAIMABLE);
         |                                                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/gfp.h:24:9: note: in expansion of macro 'BUILD_BUG_ON'
      24 |         BUILD_BUG_ON((___GFP_RECLAIMABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_RECLAIMABLE);
         |         ^~~~~~~~~~~~
   include/linux/gfp.h:26:45: error: 'MIGRATE_HIGHATOMIC' undeclared (first use in this function)
      26 |                       GFP_MOVABLE_SHIFT) != MIGRATE_HIGHATOMIC);
         |                                             ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/gfp.h:25:9: note: in expansion of macro 'BUILD_BUG_ON'
      25 |         BUILD_BUG_ON(((___GFP_MOVABLE | ___GFP_RECLAIMABLE) >>
         |         ^~~~~~~~~~~~
   include/linux/gfp.h:28:22: error: 'page_group_by_mobility_disabled' undeclared (first use in this function)
      28 |         if (unlikely(page_group_by_mobility_disabled))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/gfp.h:29:24: error: 'MIGRATE_UNMOVABLE' undeclared (first use in this function)
      29 |                 return MIGRATE_UNMOVABLE;
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/gfp.h: At top level:
   include/linux/gfp.h:116:25: warning: 'ZONES_SHIFT' is not defined, evaluates to '0' [-Wundef]
     116 | #define GFP_ZONES_SHIFT ZONES_SHIFT
         |                         ^~~~~~~~~~~
   include/linux/gfp.h:119:10: note: in expansion of macro 'GFP_ZONES_SHIFT'
     119 | #if 16 * GFP_ZONES_SHIFT > BITS_PER_LONG


vim +/raw_atomic_read +262 include/linux/jump_label.h

1f69bf9c613760 Jason Baron    2016-08-03  259  
656d054e0a15ec Peter Zijlstra 2022-05-02  260  static __always_inline int static_key_count(struct static_key *key)
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  261  {
0f613bfa8268a8 Mark Rutland   2023-06-05 @262  	return raw_atomic_read(&key->enabled);
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  263  }
4c5ea0a9cd02d6 Paolo Bonzini  2016-06-21  264  

:::::: The code at line 262 was first introduced by commit
:::::: 0f613bfa8268a89be25f2b6b58fc6fe8ccd9a2ba locking/atomic: treewide: use raw_atomic*_<op>()

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
