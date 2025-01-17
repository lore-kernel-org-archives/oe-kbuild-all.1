Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E71FF7AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737119567; cv=none; b=RBYiAGqc99ZlveSKbsQXAvgkZpnCiEhRseWTG12H73eGyeetd2fZjuP+f04ir7Y59g3zLnMmjqklGmFRYPBTWj2OIDM4vDsyjC2Qn7iP/BgqppPY7vYhrEaDMPffZvOE6iBF28FQ6/l/Ty94xY0GhG4xRfS6+WkIGhRGLuBfg98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737119567; c=relaxed/simple;
	bh=RMROoe1Y2kO1ZDk3PwY0YJbQEoU4qU0K5QwZNg1Q9eI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMu8CtHcdBrDiVb325hDAzHh2fWDD5nigJnr3tZkwWjzEx6KVYF6gBPaVuwpJIpmsJ6CkhZcONnExsNNZc1mUc3EOSb41p/9Ll8idfZ73keIf1KsYlA1ZetIQ3pe7P3nJxqyAJw2hCSpNYAqC87kYkQyOVEjbbC8HJunZOJoL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYrtxWZ9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYrtxWZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737119565; x=1768655565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMROoe1Y2kO1ZDk3PwY0YJbQEoU4qU0K5QwZNg1Q9eI=;
  b=gYrtxWZ9aLCqieQnLplQ08YRkZCT+8S3yOBWYYH6pZTbaLWwkufo7chO
   I1qwbqgSGxj+R95E4/P4Ig/TCWm9rjuD0SJ/vx9m0W2W2W1ZUPy7JDS9a
   +aI/uRxm810w5bPFz++NwBa/dLVGB87XspcDRaogWqzkZPKvHkDS5xqZt
   cwt+JoAsKr5KiMkfXWYwN1zpvvkSJ4HufeKgdxRH1ftOr/rRUAscA2Pdm
   Ju5GYuFQkyKQuOFi7IunygPQmIhWJYFVEOVIDRKCa+T/rFJ2HD+6szVe9
   m7npvFnPLW3ljFMfNWjsLdzwBeUFbRL2NMjKVkT6dPFB2HNvKl6ZDk+gp
   A==;
X-CSE-ConnectionGUID: Z2RfGb9qTLeN/jzRoZgPTA==
X-CSE-MsgGUID: 46tvPSuOSzmnYv5yOjvH0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37461534"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37461534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:12:43 -0800
X-CSE-ConnectionGUID: FOIZxaRXRIWIEprkLvUSVQ==
X-CSE-MsgGUID: YJWLjpMNRGmf9w2U3qdR7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105981847"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2025 05:12:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYm9P-000TET-0O;
	Fri, 17 Jan 2025 13:12:39 +0000
Date: Fri, 17 Jan 2025 21:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1407/1407]
 include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used
Message-ID: <202501172158.pLxZDrP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: 1811840c2cdebd0820818392a8217ffbd1be5c67 [1407/1407] mm/sharepool: Fix sharepool node id invalid when using sp_alloc
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250117/202501172158.pLxZDrP8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172158.pLxZDrP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172158.pLxZDrP8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/fork.c:741:20: warning: no previous prototype for 'arch_task_cache_init' [-Wmissing-prototypes]
     741 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:826:12: warning: no previous prototype for 'arch_dup_task_struct' [-Wmissing-prototypes]
     826 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c: In function 'dup_task_struct':
   kernel/fork.c:845:27: warning: variable 'stack_vm_area' set but not used [-Wunused-but-set-variable]
     845 |         struct vm_struct *stack_vm_area;
         |                           ^~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/fork.c:23:
   include/linux/signal.h: In function 'sigemptyset':
   include/linux/signal.h:180:29: warning: this statement may fall through [-Wimplicit-fallthrough=]
     180 |         case 2: set->sig[1] = 0;
         |                 ~~~~~~~~~~~~^~~
   include/linux/signal.h:181:9: note: here
     181 |         case 1: set->sig[0] = 0;
         |         ^~~~
   In file included from kernel/fork.c:31:
   include/linux/mempolicy.h: At top level:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from kernel/fork.c:14:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from '__mmput' at kernel/fork.c:1074:3,
       inlined from 'mmput_async_fn' at kernel/fork.c:1104:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:82,
                    from include/linux/mmzone.h:9,
                    from include/linux/gfp.h:6:
   kernel/fork.c: In function 'mmput_async_fn':
   kernel/fork.c:939:44: note: object 'mmlist_lock' of size 4
     939 | __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
         |                                            ^~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from '__mmput' at kernel/fork.c:1074:3,
       inlined from 'mmput_async_fn' at kernel/fork.c:1104:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/fork.c: In function 'mmput_async_fn':
   kernel/fork.c:939:44: note: object 'mmlist_lock' of size 4
     939 | __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
         |                                            ^~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from '__mmput' at kernel/fork.c:1074:3,
       inlined from 'mmput' at kernel/fork.c:1094:3,
       inlined from 'mmput' at kernel/fork.c:1086:6:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/fork.c: In function 'mmput':
   kernel/fork.c:939:44: note: object 'mmlist_lock' of size 4
     939 | __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
         |                                            ^~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from '__mmput' at kernel/fork.c:1074:3,
       inlined from 'mmput' at kernel/fork.c:1094:3,
       inlined from 'mmput' at kernel/fork.c:1086:6:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/fork.c: In function 'mmput':
   kernel/fork.c:939:44: note: object 'mmlist_lock' of size 4
     939 | __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
--
   kernel/exit.c:1677:13: warning: no previous prototype for 'abort' [-Wmissing-prototypes]
    1677 | __weak void abort(void)
         |             ^~~~~
   In file included from kernel/exit.c:37:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
--
   In file included from include/linux/shmem_fs.h:7,
                    from kernel/umh.c:29:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:10,
                    from kernel/umh.c:4:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'proc_cap_handler' at kernel/umh.c:668:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:82,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:11:
   kernel/umh.c: In function 'proc_cap_handler':
   kernel/umh.c:41:24: note: object 'umh_sysctl_lock' of size 4
      41 | static DEFINE_SPINLOCK(umh_sysctl_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'proc_cap_handler' at kernel/umh.c:668:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/umh.c: In function 'proc_cap_handler':
   kernel/umh.c:41:24: note: object 'umh_sysctl_lock' of size 4
      41 | static DEFINE_SPINLOCK(umh_sysctl_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'proc_cap_handler' at kernel/umh.c:701:3:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/umh.c: In function 'proc_cap_handler':
   kernel/umh.c:41:24: note: object 'umh_sysctl_lock' of size 4
      41 | static DEFINE_SPINLOCK(umh_sysctl_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'proc_cap_handler' at kernel/umh.c:701:3:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/umh.c: In function 'proc_cap_handler':
   kernel/umh.c:41:24: note: object 'umh_sysctl_lock' of size 4
      41 | static DEFINE_SPINLOCK(umh_sysctl_lock);
         |                        ^~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
--
   In file included from kernel/workqueue.c:39:
>> include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from kernel/workqueue.c:28:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'pool_mayday_timeout' at kernel/workqueue.c:2003:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:82,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from kernel/workqueue.c:29:
   kernel/workqueue.c: In function 'pool_mayday_timeout':
   kernel/workqueue.c:302:24: note: object 'wq_mayday_lock' of size 4
     302 | static DEFINE_SPINLOCK(wq_mayday_lock); /* protects wq->maydays list */
         |                        ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'pool_mayday_timeout' at kernel/workqueue.c:2003:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/workqueue.c: In function 'pool_mayday_timeout':
   kernel/workqueue.c:302:24: note: object 'wq_mayday_lock' of size 4
     302 | static DEFINE_SPINLOCK(wq_mayday_lock); /* protects wq->maydays list */
         |                        ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   kernel/workqueue.c: In function 'create_worker':
   kernel/workqueue.c:1887:54: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 5 and 14 [-Wformat-truncation=]
    1887 |                 snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
         |                                                      ^~
   kernel/workqueue.c:1887:50: note: directive argument in the range [0, 2147483647]
    1887 |                 snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
         |                                                  ^~~~~~~~~
   kernel/workqueue.c:1887:17: note: 'snprintf' output between 4 and 23 bytes into a destination of size 16
    1887 |                 snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1888 |                          pool->attrs->nice < 0  ? "H" : "");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_irq' at include/linux/spinlock_api_smp.h:129:2,
       inlined from 'spin_lock_irq' at include/linux/spinlock.h:354:2,
       inlined from 'rescuer_thread' at kernel/workqueue.c:2461:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   kernel/workqueue.c: In function 'rescuer_thread':
   kernel/workqueue.c:302:24: note: object 'wq_mayday_lock' of size 4
     302 | static DEFINE_SPINLOCK(wq_mayday_lock); /* protects wq->maydays list */
         |                        ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_irq' at include/linux/spinlock_api_smp.h:129:2,
       inlined from 'spin_lock_irq' at include/linux/spinlock.h:354:2,
       inlined from 'rescuer_thread' at kernel/workqueue.c:2461:2:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
..


vim +/__do_mbind +329 include/linux/mempolicy.h

   328	
 > 329	static long __do_mbind(unsigned long start, unsigned long len,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
