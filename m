Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73776D2F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 19:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695498422; x=1727034422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z0SzsoLcu3VMtARmJBb7lNOIJnlqCLGvgMu+FAOM6hg=;
  b=L8DolLwbI0E+NkXBIDgbCxXwOmUkgza3qhk6xQ3QyDnTewMoTTiZTPUR
   F2j6LwPAqSq96+RnkjtW6cqBAknUwtcOtd8TVXtDkdLG049LPi/LCTPk8
   rwVX6FWuAooRKCPLnmpzJBUdDUJhVBdRHnv9EKQ2p/gDpWn2m0gan4Ewr
   CjNI52D3ndL6UMFY8tqKXd8DpE+mtUswpxG4sGCc0iacNE0kazEMGGlQ8
   s/wD9Z7xwJ4r+9tMMkfO1EZXuti7JA5AX+FkIe4bUyv93pSiYNH1OUXTd
   TJX93g+nAeFkr385J8QIbVQoy+bkKJl4VlQvXabalQHnHbLBzaONElorO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="371366871"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="371366871"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 12:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="891205574"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="891205574"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2023 12:46:02 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk8ag-0002mL-0I;
	Sat, 23 Sep 2023 19:46:58 +0000
Date: Sun, 24 Sep 2023 03:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 19/30]
 kernel/sched/core.c:1660:14: error: 'struct sched_entity' has no member
 named 'avg'
Message-ID: <202309240335.jx1Lm0Wp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   833db5ec53f6ad1606b5363338fb455e6bd7bd01
commit: e0515f89730a8597730e11f244a80d37c7970d4a [19/30] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20230924/202309240335.jx1Lm0Wp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240335.jx1Lm0Wp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240335.jx1Lm0Wp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/vmpressure.h:11,
                    from include/linux/memcontrol.h:18,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from kernel/sched/sched.h:63,
                    from kernel/sched/core.c:13:
   include/linux/eventfd.h:76:19: error: redefinition of 'eventfd_signal_mask'
      76 | static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/eventfd.h:70:19: note: previous definition of 'eventfd_signal_mask' with type 'int(struct eventfd_ctx *, __u64,  unsigned int)' {aka 'int(struct eventfd_ctx *, long long unsigned int,  unsigned int)'}
      70 | static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
         |                   ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function '__setscheduler_task_util':
>> kernel/sched/core.c:1660:14: error: 'struct sched_entity' has no member named 'avg'
    1660 |         p->se.avg.util_guest = attr->sched_util_min;
         |              ^
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2629:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    2629 |         struct rq *rq;
         |                    ^~
--
   In file included from include/linux/vmpressure.h:11,
                    from include/linux/memcontrol.h:18,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from kernel/sched/sched.h:63,
                    from kernel/sched/fair.c:23:
   include/linux/eventfd.h:76:19: error: redefinition of 'eventfd_signal_mask'
      76 | static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/eventfd.h:70:19: note: previous definition of 'eventfd_signal_mask' with type 'int(struct eventfd_ctx *, __u64,  unsigned int)' {aka 'int(struct eventfd_ctx *, long long unsigned int,  unsigned int)'}
      70 | static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
         |                   ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4594:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    4594 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:5577:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5577 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/sched/fair.c: In function 'enqueue_task_fair':
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:274:27: note: in definition of macro '__unqual_scalar_typeof'
     274 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from arch/arm/include/uapi/asm/swab.h:19,
                    from arch/arm/include/asm/swab.h:19,
                    from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/arm/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5:
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:11510:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   11510 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11512:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   11512 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11517:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   11517 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11519:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   11519 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1660 kernel/sched/core.c

  1656	
  1657		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  1658			return;
  1659	
> 1660		p->se.avg.util_guest = attr->sched_util_min;
  1661	}
  1662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
