Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C7256A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676352358; x=1707888358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=steYND2FPHsjiHPFofhT5akMopXUjIz02utqQXarLDU=;
  b=FD+sYaxZUmdIvlPtC2ORMfOcgQfa5Vv+9oDV1JaQHpOoKmpc9vKFS6RS
   6rYJ0o/zPj276WKB55umNgcpFvc15TxleJWzZ8cy4WHxTe+2adN4nPa1/
   RbymOaGOT93CSTu3KPSv/qCFxpwHu4EDJhmvqdqho8RrQD2a3VBuoTYp7
   wGVBe69ZWEeHc6+G2y7EoJzFLX8iy/5DpjhGD4ZL11hUlpMjRADoeolzA
   aE3teUjjwvRkCY8c2IEbpX1PMfPZSbLzYN/zzK298An25CH8v1LwcoaJy
   VJurHwF9+M+QFmhuGowlkTMlKdzVIi5J2H2jcxYKVbPChu1L1B03jEVuJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319110801"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="319110801"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="662426530"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="662426530"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Feb 2023 21:25:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRnpD-0008FB-35;
	Tue, 14 Feb 2023 05:25:55 +0000
Date: Tue, 14 Feb 2023 13:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc-test 34/34] include/linux/printk.h:457:44: warning:
 array subscript 3 is above array bounds of 'long unsigned int[3]'
Message-ID: <202302141346.mqQd7H13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc-test
head:   9f1d88c71fdf107b93a41d224d630b4dcd5f54a6
commit: 9f1d88c71fdf107b93a41d224d630b4dcd5f54a6 [34/34] sched/alt: Add more intensive debugging
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230214/202302141346.mqQd7H13-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/zen-kernel/zen-kernel/commit/9f1d88c71fdf107b93a41d224d630b4dcd5f54a6
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc-test
        git checkout 9f1d88c71fdf107b93a41d224d630b4dcd5f54a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141346.mqQd7H13-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1012:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
    1012 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:1035:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
    1035 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1050:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1050 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1052:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1052 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1238:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1238 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2442:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2442 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2475:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2475 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7003:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    7003 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7213:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7213 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7252:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7252 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7316:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7316 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7336:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7336 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7378:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7378 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7460:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7460 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7520:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7520 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:7875:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7875 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7886:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7886 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7897:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7897 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7903:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7903 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7971:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    7971 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8041:27: warning: initialized field overwritten [-Woverride-init]
    8041 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:8041:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:14:
   kernel/sched/alt_core.c: In function 'migrate_pending_tasks':
>> include/linux/printk.h:457:44: warning: array subscript 3 is above array bounds of 'long unsigned int[3]' [-Warray-bounds]
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                            ^
   include/linux/printk.h:429:17: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                 ^~~~~~~
   kernel/sched/alt_core.c:262:8: note: in expansion of macro 'printk'
     262 |        printk(KERN_INFO "sched: p %lu %016lx %016lx %016lx %016lx\n",
         |        ^~~~~~
   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:5,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:14:
   kernel/sched/alt_sched.h:117:24: note: while referencing 'bitmap'
     117 |         DECLARE_BITMAP(bitmap, SCHED_QUEUE_BITS);
         |                        ^~~~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~


vim +457 include/linux/printk.h

337015573718b1 Chris Down      2021-06-15  405  
337015573718b1 Chris Down      2021-06-15  406  /*
337015573718b1 Chris Down      2021-06-15  407   * Some subsystems have their own custom printk that applies a va_format to a
337015573718b1 Chris Down      2021-06-15  408   * generic format, for example, to include a device number or other metadata
337015573718b1 Chris Down      2021-06-15  409   * alongside the format supplied by the caller.
337015573718b1 Chris Down      2021-06-15  410   *
337015573718b1 Chris Down      2021-06-15  411   * In order to store these in the way they would be emitted by the printk
337015573718b1 Chris Down      2021-06-15  412   * infrastructure, the subsystem provides us with the start, fixed string, and
337015573718b1 Chris Down      2021-06-15  413   * any subsequent text in the format string.
337015573718b1 Chris Down      2021-06-15  414   *
337015573718b1 Chris Down      2021-06-15  415   * We take a variable argument list as pr_fmt/dev_fmt/etc are sometimes passed
337015573718b1 Chris Down      2021-06-15  416   * as multiple arguments (eg: `"%s: ", "blah"`), and we must only take the
337015573718b1 Chris Down      2021-06-15  417   * first one.
337015573718b1 Chris Down      2021-06-15  418   *
337015573718b1 Chris Down      2021-06-15  419   * subsys_fmt_prefix must be known at compile time, or compilation will fail
337015573718b1 Chris Down      2021-06-15  420   * (since this is a mistake). If fmt or level is not known at compile time, no
337015573718b1 Chris Down      2021-06-15  421   * index entry will be made (since this can legitimately happen).
337015573718b1 Chris Down      2021-06-15  422   */
337015573718b1 Chris Down      2021-06-15  423  #define printk_index_subsys_emit(subsys_fmt_prefix, level, fmt, ...) \
337015573718b1 Chris Down      2021-06-15  424  	__printk_index_emit(fmt, level, subsys_fmt_prefix)
337015573718b1 Chris Down      2021-06-15  425  
337015573718b1 Chris Down      2021-06-15  426  #define printk_index_wrap(_p_func, _fmt, ...)				\
337015573718b1 Chris Down      2021-06-15  427  	({								\
337015573718b1 Chris Down      2021-06-15  428  		__printk_index_emit(_fmt, NULL, NULL);			\
337015573718b1 Chris Down      2021-06-15  429  		_p_func(_fmt, ##__VA_ARGS__);				\
337015573718b1 Chris Down      2021-06-15  430  	})
337015573718b1 Chris Down      2021-06-15  431  
337015573718b1 Chris Down      2021-06-15  432  
7d9e2661f26858 Jonathan Corbet 2021-07-25  433  /**
7d9e2661f26858 Jonathan Corbet 2021-07-25  434   * printk - print a kernel message
7d9e2661f26858 Jonathan Corbet 2021-07-25  435   * @fmt: format string
7d9e2661f26858 Jonathan Corbet 2021-07-25  436   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  437   * This is printk(). It can be called from any context. We want it to work.
7d9e2661f26858 Jonathan Corbet 2021-07-25  438   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  439   * If printk indexing is enabled, _printk() is called from printk_index_wrap.
7d9e2661f26858 Jonathan Corbet 2021-07-25  440   * Otherwise, printk is simply #defined to _printk.
7d9e2661f26858 Jonathan Corbet 2021-07-25  441   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  442   * We try to grab the console_lock. If we succeed, it's easy - we log the
7d9e2661f26858 Jonathan Corbet 2021-07-25  443   * output and call the console drivers.  If we fail to get the semaphore, we
7d9e2661f26858 Jonathan Corbet 2021-07-25  444   * place the output into the log buffer and return. The current holder of
7d9e2661f26858 Jonathan Corbet 2021-07-25  445   * the console_sem will notice the new output in console_unlock(); and will
7d9e2661f26858 Jonathan Corbet 2021-07-25  446   * send it to the consoles before releasing the lock.
7d9e2661f26858 Jonathan Corbet 2021-07-25  447   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  448   * One effect of this deferred printing is that code which calls printk() and
7d9e2661f26858 Jonathan Corbet 2021-07-25  449   * then changes console_loglevel may break. This is because console_loglevel
7d9e2661f26858 Jonathan Corbet 2021-07-25  450   * is inspected when the actual printing occurs.
7d9e2661f26858 Jonathan Corbet 2021-07-25  451   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  452   * See also:
7d9e2661f26858 Jonathan Corbet 2021-07-25  453   * printf(3)
7d9e2661f26858 Jonathan Corbet 2021-07-25  454   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  455   * See the vsnprintf() documentation for format string extensions over C99.
7d9e2661f26858 Jonathan Corbet 2021-07-25  456   */
337015573718b1 Chris Down      2021-06-15 @457  #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
337015573718b1 Chris Down      2021-06-15  458  #define printk_deferred(fmt, ...)					\
337015573718b1 Chris Down      2021-06-15  459  	printk_index_wrap(_printk_deferred, fmt, ##__VA_ARGS__)
337015573718b1 Chris Down      2021-06-15  460  

:::::: The code at line 457 was first introduced by commit
:::::: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format indexing support

:::::: TO: Chris Down <chris@chrisdown.name>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
