Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1228E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677321810; x=1708857810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UldBVtYjhqzyRtrbHmjP1aFjRVQUZ++ud3rOfJQuGMQ=;
  b=Id3z04hoXaTRqWW7UMYsdSa7aHgcTgOqxxcvBiv9DS7XIyb593aZtC3R
   TVF6gTltEiPGFn1JPn/8QSoDwey9f8Igcjl1aLKxY6U7x2ohZ/f4TyO+h
   zSqbsh3Qy2NIt0eaD1TkGOW8WEHaqH/616F2+nwlhZzJvmgy3HEntb/CR
   AZB56MV7TQ86RXIH5ezEShWeMotx498ofbO1QB7KFay6DhYbiIC8OYmHx
   6RxI2O5Q4EcLDwhD+T54RKJ2MwWoBjaAHlncBjmF6C4qVlcO6N+35SLwy
   ChGzXm3L8vtgiVdTLXEi4TkXSIhb0p3iEZy9bMStsJ/R952oniUpadlkn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="419883565"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="419883565"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 02:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705567681"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="705567681"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Feb 2023 02:43:27 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVs1W-00037j-1S;
	Sat, 25 Feb 2023 10:43:26 +0000
Date: Sat, 25 Feb 2023 18:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc 295/376] kernel/sched/alt_core.c:556:32: error:
 'paravirt_steal_rq_enabled' undeclared
Message-ID: <202302251825.A9rsy3bl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc
head:   16c9f17f2a21749a507d8b3358225d4d73cba785
commit: e9aa933fffbcd3860f608f851f18e49b2954190d [295/376] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302251825.A9rsy3bl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/e9aa933fffbcd3860f608f851f18e49b2954190d
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc
        git checkout e9aa933fffbcd3860f608f851f18e49b2954190d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251825.A9rsy3bl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c: In function 'update_rq_clock_task':
>> kernel/sched/alt_core.c:556:32: error: 'paravirt_steal_rq_enabled' undeclared (first use in this function)
     556 |         if (static_key_false((&paravirt_steal_rq_enabled))) {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:556:32: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/alt_core.c:557:25: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
     557 |                 steal = paravirt_steal_clock(cpu_of(rq));
         |                         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'; have 'long unsigned int(int,  long unsigned int)'
     632 | unsigned long sched_cpu_util(int cpu, unsigned long max)
         |               ^~~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:14:
   include/linux/sched.h:2325:15: note: previous declaration of 'sched_cpu_util' with type 'long unsigned int(int)'
    2325 | unsigned long sched_cpu_util(int cpu);
         |               ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:1004:6: warning: no previous prototype for 'select_nohz_load_balancer' [-Wmissing-prototypes]
    1004 | void select_nohz_load_balancer(int stop_tick) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
    1006 | void set_cpu_sd_state_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1192:6: warning: no previous prototype for 'hrtick_start' [-Wmissing-prototypes]
    1192 | void hrtick_start(struct rq *rq, u64 delay)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:2339:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2339 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2372:6: warning: no previous prototype for 'send_call_function_single_ipi' [-Wmissing-prototypes]
    2372 | void send_call_function_single_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__schedule':
   kernel/sched/alt_core.c:4558:49: error: 'PF_FROZEN' undeclared (first use in this function); did you mean 'PF_ROSE'?
    4558 |                                 !(prev->flags & PF_FROZEN);
         |                                                 ^~~~~~~~~
         |                                                 PF_ROSE
   kernel/sched/alt_core.c: In function 'sched_submit_work':
   kernel/sched/alt_core.c:4674:13: error: implicit declaration of function 'tsk_is_pi_blocked'; did you mean 'osq_is_locked'? [-Werror=implicit-function-declaration]
    4674 |         if (tsk_is_pi_blocked(tsk))
         |             ^~~~~~~~~~~~~~~~~
         |             osq_is_locked
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    4734 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   kernel/sched/alt_core.c:6770:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    6770 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6980:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    6980 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7019:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7019 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7083:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7083 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7103:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7103 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7145:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7145 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7226 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^~~~~~~~~~
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for 'sched_group_set_shares' [-Wmissing-prototypes]
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: warning: initialized field overwritten [-Woverride-init]
    7800 |         .legacy_cftypes = cpu_legacy_files,
         |                           ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7800:27: note: (near initialization for 'cpu_cgrp_subsys.legacy_cftypes')
   cc1: some warnings being treated as errors


vim +/paravirt_steal_rq_enabled +556 kernel/sched/alt_core.c

8079bd41313b7a Alfred Chen 2021-09-02  518  
570d4c77574657 Alfred Chen 2019-08-19  519  /*
570d4c77574657 Alfred Chen 2019-08-19  520   * RQ-clock updating methods:
570d4c77574657 Alfred Chen 2019-08-19  521   */
570d4c77574657 Alfred Chen 2019-08-19  522  
570d4c77574657 Alfred Chen 2019-08-19  523  static void update_rq_clock_task(struct rq *rq, s64 delta)
570d4c77574657 Alfred Chen 2019-08-19  524  {
570d4c77574657 Alfred Chen 2019-08-19  525  /*
570d4c77574657 Alfred Chen 2019-08-19  526   * In theory, the compile should just see 0 here, and optimize out the call
570d4c77574657 Alfred Chen 2019-08-19  527   * to sched_rt_avg_update. But I don't trust it...
570d4c77574657 Alfred Chen 2019-08-19  528   */
570d4c77574657 Alfred Chen 2019-08-19  529  	s64 __maybe_unused steal = 0, irq_delta = 0;
570d4c77574657 Alfred Chen 2019-08-19  530  
570d4c77574657 Alfred Chen 2019-08-19  531  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
570d4c77574657 Alfred Chen 2019-08-19  532  	irq_delta = irq_time_read(cpu_of(rq)) - rq->prev_irq_time;
570d4c77574657 Alfred Chen 2019-08-19  533  
570d4c77574657 Alfred Chen 2019-08-19  534  	/*
570d4c77574657 Alfred Chen 2019-08-19  535  	 * Since irq_time is only updated on {soft,}irq_exit, we might run into
570d4c77574657 Alfred Chen 2019-08-19  536  	 * this case when a previous update_rq_clock() happened inside a
570d4c77574657 Alfred Chen 2019-08-19  537  	 * {soft,}irq region.
570d4c77574657 Alfred Chen 2019-08-19  538  	 *
570d4c77574657 Alfred Chen 2019-08-19  539  	 * When this happens, we stop ->clock_task and only update the
570d4c77574657 Alfred Chen 2019-08-19  540  	 * prev_irq_time stamp to account for the part that fit, so that a next
570d4c77574657 Alfred Chen 2019-08-19  541  	 * update will consume the rest. This ensures ->clock_task is
570d4c77574657 Alfred Chen 2019-08-19  542  	 * monotonic.
570d4c77574657 Alfred Chen 2019-08-19  543  	 *
570d4c77574657 Alfred Chen 2019-08-19  544  	 * It does however cause some slight miss-attribution of {soft,}irq
570d4c77574657 Alfred Chen 2019-08-19  545  	 * time, a more accurate solution would be to update the irq_time using
570d4c77574657 Alfred Chen 2019-08-19  546  	 * the current rq->clock timestamp, except that would require using
570d4c77574657 Alfred Chen 2019-08-19  547  	 * atomic ops.
570d4c77574657 Alfred Chen 2019-08-19  548  	 */
570d4c77574657 Alfred Chen 2019-08-19  549  	if (irq_delta > delta)
570d4c77574657 Alfred Chen 2019-08-19  550  		irq_delta = delta;
570d4c77574657 Alfred Chen 2019-08-19  551  
570d4c77574657 Alfred Chen 2019-08-19  552  	rq->prev_irq_time += irq_delta;
570d4c77574657 Alfred Chen 2019-08-19  553  	delta -= irq_delta;
570d4c77574657 Alfred Chen 2019-08-19  554  #endif
570d4c77574657 Alfred Chen 2019-08-19  555  #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
570d4c77574657 Alfred Chen 2019-08-19 @556  	if (static_key_false((&paravirt_steal_rq_enabled))) {
570d4c77574657 Alfred Chen 2019-08-19 @557  		steal = paravirt_steal_clock(cpu_of(rq));
570d4c77574657 Alfred Chen 2019-08-19  558  		steal -= rq->prev_steal_time_rq;
570d4c77574657 Alfred Chen 2019-08-19  559  
570d4c77574657 Alfred Chen 2019-08-19  560  		if (unlikely(steal > delta))
570d4c77574657 Alfred Chen 2019-08-19  561  			steal = delta;
570d4c77574657 Alfred Chen 2019-08-19  562  
570d4c77574657 Alfred Chen 2019-08-19  563  		rq->prev_steal_time_rq += steal;
570d4c77574657 Alfred Chen 2019-08-19  564  		delta -= steal;
570d4c77574657 Alfred Chen 2019-08-19  565  	}
570d4c77574657 Alfred Chen 2019-08-19  566  #endif
570d4c77574657 Alfred Chen 2019-08-19  567  
570d4c77574657 Alfred Chen 2019-08-19  568  	rq->clock_task += delta;
570d4c77574657 Alfred Chen 2019-08-19  569  

:::::: The code at line 556 was first introduced by commit
:::::: 570d4c77574657dc1df2ca8c54e6b4407de76fd5 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
