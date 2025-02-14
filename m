Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62E4261567
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739536641; cv=none; b=VLqwyGLKbgHJVJeaabdA9eOJrH/y0qzFC6ZE0IPwg+V2s7g0DPylTZgxcQonyXQZ02NFxKYgjzWqmjUJnDZtVc+YkOZvDLNKjbxLQZe2fybkrulSLGsvudOlUipdQH16hqPBjNOdAdcqqtssGOGyie7HM9RRtdk8hjjq6dIBPbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739536641; c=relaxed/simple;
	bh=CECxCsYh18z3pOh0zfMWkZXmFrXZ11LAYG5mKoQE7pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNvaAwi1U2FhLlUEL54IxuMkjhd6xqt/2ZS4cupf0faLObohXDxqt7HnOF6qLut3aFUZrtl2zQpZST4wrTcwbmIWki4QRWJrr91DVHFgICOEeDgc4xlPkm5FJmqkMEtvi33/zBBlLC0YHrK/Ksj5uQM3Px+h8q+3GgElkdfDnfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUfOoCd2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUfOoCd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739536639; x=1771072639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CECxCsYh18z3pOh0zfMWkZXmFrXZ11LAYG5mKoQE7pw=;
  b=PUfOoCd2b4W5Gc9841EOxGy6pBYzPb8uK18Ci2DXM7IEUAj0fn/OvM6D
   uck4nhk/DRqafT74bz+DQPzFlD84ttzZVycfspbAqYNH+mki9pFOJi3R3
   XFmjDsAAMh64IXmyQDjxlakNYyndFyzYFxbVmPs1fVgdVlprI3VrMvbx5
   vSDDh5PxhNL0eEAsnQl3lRyaEHKsReMX7stQmGpVxXKD5Mc/tEm5uFjBB
   TNIr2JVtmks6n7RuiXAmptC2sjWXPGm7mnjBNIqNR3FJdyrG9FnxaQHxV
   1u1zv9VwSB0c3XYhyuKwEFNEo8/FDIIvxa0qzG8G1DbQwWVV2VOK3thuI
   A==;
X-CSE-ConnectionGUID: /YVhjGXvRuaj8exR0Cq2ZA==
X-CSE-MsgGUID: hEEcBUqvTkyOlUhog8d1bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39991250"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="39991250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 04:37:17 -0800
X-CSE-ConnectionGUID: Ek9lfplKQ8Ged1cREBZufQ==
X-CSE-MsgGUID: fX78FYWYQWagnE7qgDD9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="118555315"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Feb 2025 04:37:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiuwP-0019Xh-0A;
	Fri, 14 Feb 2025 12:37:09 +0000
Date: Fri, 14 Feb 2025 20:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 18/26]
 include/linux/local_lock_internal.h:111:17: error: implicit declaration of
 function 'local_irq_enable'
Message-ID: <202502142000.elXvNztG-lkp@intel.com>
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
commit: 895e91e6a76fc478ef13428a02587e5a424fc0be [18/26] locking/local_lock: Support Clang's capability analysis
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250214/202502142000.elXvNztG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142000.elXvNztG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142000.elXvNztG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/jump_label.h:78,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:610,
                    from include/linux/kernel.h:31,
                    from include/linux/bit_spinlock.h:5,
                    from lib/test_capability-analysis.c:7:
   include/linux/local_lock.h: In function 'class_local_lock_irq_destructor':
>> include/linux/local_lock_internal.h:111:17: error: implicit declaration of function 'local_irq_enable' [-Wimplicit-function-declaration]
     111 |                 local_irq_enable();                             \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/cleanup.h:379:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     379 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      57 | DEFINE_LOCK_GUARD_1(local_lock_irq, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:43:41: note: in expansion of macro '__local_unlock_irq'
      43 | #define local_unlock_irq(lock)          __local_unlock_irq(lock)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:59:21: note: in expansion of macro 'local_unlock_irq'
      59 |                     local_unlock_irq(_T->lock))
         |                     ^~~~~~~~~~~~~~~~
   include/linux/local_lock.h: In function 'class_local_lock_irq_constructor':
>> include/linux/local_lock_internal.h:88:17: error: implicit declaration of function 'local_irq_disable' [-Wimplicit-function-declaration]
      88 |                 local_irq_disable();                            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:393:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     393 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      57 | DEFINE_LOCK_GUARD_1(local_lock_irq, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:22:41: note: in expansion of macro '__local_lock_irq'
      22 | #define local_lock_irq(lock)            __local_lock_irq(lock)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/local_lock.h:58:21: note: in expansion of macro 'local_lock_irq'
      58 |                     local_lock_irq(_T->lock),
         |                     ^~~~~~~~~~~~~~
   include/linux/local_lock.h: In function 'class_local_lock_irqsave_destructor':
>> include/linux/local_lock_internal.h:118:17: error: implicit declaration of function 'local_irq_restore' [-Wimplicit-function-declaration]
     118 |                 local_irq_restore(flags);                       \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:379:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     379 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:52:9: note: in expansion of macro '__local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:21: note: in expansion of macro 'local_unlock_irqrestore'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h: In function 'class_local_lock_irqsave_constructor':
>> include/linux/local_lock_internal.h:95:17: error: implicit declaration of function 'local_irq_save' [-Wimplicit-function-declaration]
      95 |                 local_irq_save(flags);                          \
         |                 ^~~~~~~~~~~~~~
   include/linux/cleanup.h:393:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     393 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:31:9: note: in expansion of macro '__local_lock_irqsave'
      31 |         __local_lock_irqsave(lock, flags)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:61:21: note: in expansion of macro 'local_lock_irqsave'
      61 |                     local_lock_irqsave(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h: In function 'class_local_lock_nested_bh_constructor':
   include/asm-generic/percpu.h:136:9: error: implicit declaration of function 'raw_local_irq_save' [-Wimplicit-function-declaration]
     136 |         raw_local_irq_save(___flags);                                   \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:393:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     393 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:71:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      71 | DEFINE_LOCK_GUARD_1(local_lock_nested_bh, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:618:9: note: in expansion of macro 'WARN_ON_ONCE'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |         ^~~~~~~~~~~~
   include/asm-generic/percpu.h:148:25: note: in expansion of macro '__this_cpu_generic_read_noirq'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:375:41: note: in expansion of macro 'this_cpu_generic_read'
     375 | #define this_cpu_read_1(pcp)            this_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:323:30: note: in expansion of macro 'this_cpu_read_1'
     323 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:497:41: note: in expansion of macro '__pcpu_size_call_return'
     497 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:50: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                                  ^~~~~~~~~~~~~
   include/linux/lockdep.h:618:22: note: in expansion of macro '__lockdep_enabled'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:123:17: note: in expansion of macro 'lockdep_assert_in_softirq'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:66:9: note: in expansion of macro '__local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:72:21: note: in expansion of macro 'local_lock_nested_bh'
      72 |                     local_lock_nested_bh(_T->lock),
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:138:9: error: implicit declaration of function 'raw_local_irq_restore' [-Wimplicit-function-declaration]
     138 |         raw_local_irq_restore(___flags);                                \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:393:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     393 |         _lock;                                                          \
         |         ^~~~~
   include/linux/local_lock.h:71:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      71 | DEFINE_LOCK_GUARD_1(local_lock_nested_bh, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:618:9: note: in expansion of macro 'WARN_ON_ONCE'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |         ^~~~~~~~~~~~
   include/asm-generic/percpu.h:148:25: note: in expansion of macro '__this_cpu_generic_read_noirq'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:375:41: note: in expansion of macro 'this_cpu_generic_read'
     375 | #define this_cpu_read_1(pcp)            this_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:323:30: note: in expansion of macro 'this_cpu_read_1'
     323 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:497:41: note: in expansion of macro '__pcpu_size_call_return'
     497 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:50: note: in expansion of macro 'this_cpu_read'
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                                  ^~~~~~~~~~~~~
   include/linux/lockdep.h:618:22: note: in expansion of macro '__lockdep_enabled'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:123:17: note: in expansion of macro 'lockdep_assert_in_softirq'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:66:9: note: in expansion of macro '__local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:72:21: note: in expansion of macro 'local_lock_nested_bh'
      72 |                     local_lock_nested_bh(_T->lock),
         |                     ^~~~~~~~~~~~~~~~~~~~


vim +/local_irq_enable +111 include/linux/local_lock_internal.h

c5bcab7558220bb Sebastian Andrzej Siewior 2024-06-20   78  
91710728d1725de Thomas Gleixner           2020-05-27   79  #define __local_lock(lock)					\
91710728d1725de Thomas Gleixner           2020-05-27   80  	do {							\
91710728d1725de Thomas Gleixner           2020-05-27   81  		preempt_disable();				\
91710728d1725de Thomas Gleixner           2020-05-27   82  		local_lock_acquire(this_cpu_ptr(lock));		\
895e91e6a76fc47 Marco Elver               2025-01-30   83  		__acquire(lock);				\
91710728d1725de Thomas Gleixner           2020-05-27   84  	} while (0)
91710728d1725de Thomas Gleixner           2020-05-27   85  
91710728d1725de Thomas Gleixner           2020-05-27   86  #define __local_lock_irq(lock)					\
91710728d1725de Thomas Gleixner           2020-05-27   87  	do {							\
91710728d1725de Thomas Gleixner           2020-05-27  @88  		local_irq_disable();				\
91710728d1725de Thomas Gleixner           2020-05-27   89  		local_lock_acquire(this_cpu_ptr(lock));		\
895e91e6a76fc47 Marco Elver               2025-01-30   90  		__acquire(lock);				\
91710728d1725de Thomas Gleixner           2020-05-27   91  	} while (0)
91710728d1725de Thomas Gleixner           2020-05-27   92  
91710728d1725de Thomas Gleixner           2020-05-27   93  #define __local_lock_irqsave(lock, flags)			\
91710728d1725de Thomas Gleixner           2020-05-27   94  	do {							\
91710728d1725de Thomas Gleixner           2020-05-27  @95  		local_irq_save(flags);				\
91710728d1725de Thomas Gleixner           2020-05-27   96  		local_lock_acquire(this_cpu_ptr(lock));		\
895e91e6a76fc47 Marco Elver               2025-01-30   97  		__acquire(lock);				\
91710728d1725de Thomas Gleixner           2020-05-27   98  	} while (0)
91710728d1725de Thomas Gleixner           2020-05-27   99  
91710728d1725de Thomas Gleixner           2020-05-27  100  #define __local_unlock(lock)					\
91710728d1725de Thomas Gleixner           2020-05-27  101  	do {							\
895e91e6a76fc47 Marco Elver               2025-01-30  102  		__release(lock);				\
91710728d1725de Thomas Gleixner           2020-05-27  103  		local_lock_release(this_cpu_ptr(lock));		\
91710728d1725de Thomas Gleixner           2020-05-27  104  		preempt_enable();				\
91710728d1725de Thomas Gleixner           2020-05-27  105  	} while (0)
91710728d1725de Thomas Gleixner           2020-05-27  106  
91710728d1725de Thomas Gleixner           2020-05-27  107  #define __local_unlock_irq(lock)				\
91710728d1725de Thomas Gleixner           2020-05-27  108  	do {							\
895e91e6a76fc47 Marco Elver               2025-01-30  109  		__release(lock);				\
91710728d1725de Thomas Gleixner           2020-05-27  110  		local_lock_release(this_cpu_ptr(lock));		\
91710728d1725de Thomas Gleixner           2020-05-27 @111  		local_irq_enable();				\
91710728d1725de Thomas Gleixner           2020-05-27  112  	} while (0)
91710728d1725de Thomas Gleixner           2020-05-27  113  
91710728d1725de Thomas Gleixner           2020-05-27  114  #define __local_unlock_irqrestore(lock, flags)			\
91710728d1725de Thomas Gleixner           2020-05-27  115  	do {							\
895e91e6a76fc47 Marco Elver               2025-01-30  116  		__release(lock);				\
91710728d1725de Thomas Gleixner           2020-05-27  117  		local_lock_release(this_cpu_ptr(lock));		\
91710728d1725de Thomas Gleixner           2020-05-27 @118  		local_irq_restore(flags);			\
91710728d1725de Thomas Gleixner           2020-05-27  119  	} while (0)
026659b9774e4c5 Thomas Gleixner           2021-08-15  120  

:::::: The code at line 111 was first introduced by commit
:::::: 91710728d1725de51d06b40674abf6e860d592c7 locking: Introduce local_lock()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
