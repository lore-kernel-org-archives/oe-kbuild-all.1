Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF90E4D0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678596134; x=1710132134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJtUokxHAmikr678ALxY4+VBPT8le8GHRbshyDEKzFQ=;
  b=NazMylq6oxgQEKjotcwc6tS0GIwsd1A5QH6dpkW4LxjsIwCe6VBJk8em
   fQXSYorN5YhUlZJvKtRKZjbc0sg2htxzchIlTIjbFKxxo29sRAyIsxFYq
   3YOFAV78v6iTV8R67qwLYuhumO9OrTby4K49FZIQa3mcGzb3VR4aOqtow
   nth8ZYv7ZvdtV9FPPIrodEFUmOsG29Oh1Tz14x+MYH6zlhR2B7MC/f5h0
   JltNPGoOjPMNhFVaWwCouxTWpq/w7xNdNCvM2AzLkgINE1A37Jr7R090I
   qlOPxLeENNWIG74JH4TMi0S2YGWmaX+bq/vzao3DIx/uAbDnQsSRgZWMs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="320813801"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="320813801"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 20:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="628253644"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="628253644"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Mar 2023 20:42:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbDX8-0004z7-1l;
	Sun, 12 Mar 2023 04:42:10 +0000
Date: Sun, 12 Mar 2023 12:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 295/371] kernel/sched/alt_core.c:2339:6: warning: no
 previous prototype for function 'sched_ttwu_pending'
Message-ID: <202303121211.WTEzb2Uk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   66bb0e6d857d9b3bce5062779df9216e00986c6f
commit: 758c39a103c58a35cb772408e0ceb8ff65399e12 [295/371] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230312/202303121211.WTEzb2Uk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/758c39a103c58a35cb772408e0ceb8ff65399e12
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 758c39a103c58a35cb772408e0ceb8ff65399e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121211.WTEzb2Uk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:632:15: error: conflicting types for 'sched_cpu_util'
   unsigned long sched_cpu_util(int cpu, unsigned long max)
                 ^
   include/linux/sched.h:2319:15: note: previous declaration is here
   unsigned long sched_cpu_util(int cpu);
                 ^
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
   void resched_curr(struct rq *rq)
        ^
   kernel/sched/alt_core.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_curr(struct rq *rq)
   ^
   static 
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
   void resched_cpu(int cpu)
        ^
   kernel/sched/alt_core.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_cpu(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:1192:6: warning: no previous prototype for function 'hrtick_start' [-Wmissing-prototypes]
   void hrtick_start(struct rq *rq, u64 delay)
        ^
   kernel/sched/alt_core.c:1192:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void hrtick_start(struct rq *rq, u64 delay)
   ^
   static 
>> kernel/sched/alt_core.c:2339:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
   void sched_ttwu_pending(void *arg)
        ^
   kernel/sched/alt_core.c:2339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_ttwu_pending(void *arg)
   ^
   static 
>> kernel/sched/alt_core.c:2372:6: warning: no previous prototype for function 'send_call_function_single_ipi' [-Wmissing-prototypes]
   void send_call_function_single_ipi(int cpu)
        ^
   kernel/sched/alt_core.c:2372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void send_call_function_single_ipi(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
                                   !(prev->flags & PF_FROZEN);
                                                   ^
   kernel/sched/alt_core.c:4674:6: error: implicit declaration of function 'tsk_is_pi_blocked' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (tsk_is_pi_blocked(tsk))
               ^
   kernel/sched/alt_core.c:4734:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
   asmlinkage __visible void __sched schedule_user(void)
                                     ^
   kernel/sched/alt_core.c:4734:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage __visible void __sched schedule_user(void)
                        ^
                        static 
>> kernel/sched/alt_core.c:6770:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
   void idle_task_exit(void)
        ^
   kernel/sched/alt_core.c:6770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_task_exit(void)
   ^
   static 
>> kernel/sched/alt_core.c:6980:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
   int sched_cpu_activate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:6980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_activate(unsigned int cpu)
   ^
   static 
>> kernel/sched/alt_core.c:7019:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
   int sched_cpu_deactivate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7019:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_deactivate(unsigned int cpu)
   ^
   static 
>> kernel/sched/alt_core.c:7083:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
   int sched_cpu_starting(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7083:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_starting(unsigned int cpu)
   ^
   static 
>> kernel/sched/alt_core.c:7103:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
   int sched_cpu_wait_empty(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_wait_empty(unsigned int cpu)
   ^
   static 
>> kernel/sched/alt_core.c:7145:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
   int sched_cpu_dying(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_dying(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7226:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/alt_core.c:7226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/alt_core.c:7278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
   struct task_group *sched_create_group(struct task_group *parent)
                      ^
   kernel/sched/alt_core.c:7633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct task_group *sched_create_group(struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
   void sched_online_group(struct task_group *tg, struct task_group *parent)
        ^
   kernel/sched/alt_core.c:7644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_online_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
   void sched_destroy_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:7655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_destroy_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
   void sched_release_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:7661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_release_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
       ^
   kernel/sched/alt_core.c:7731:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
   ^
   static 
   kernel/sched/alt_core.c:7800:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .legacy_cftypes = cpu_legacy_files,
                             ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7799:20: note: previous initialization is here
           .legacy_cftypes = cpu_files,
                             ^~~~~~~~~
   20 warnings and 3 errors generated.


vim +/sched_ttwu_pending +2339 kernel/sched/alt_core.c

8b025fc742d760 Alfred Chen 2019-08-19  2337  
8b025fc742d760 Alfred Chen 2019-08-19  2338  #ifdef CONFIG_SMP
e39d8404e72561 Alfred Chen 2020-08-02 @2339  void sched_ttwu_pending(void *arg)
f8991b9e3a5cad Alfred Chen 2020-07-29  2340  {
e39d8404e72561 Alfred Chen 2020-08-02  2341  	struct llist_node *llist = arg;
f8991b9e3a5cad Alfred Chen 2020-07-29  2342  	struct rq *rq = this_rq();
f8991b9e3a5cad Alfred Chen 2020-07-29  2343  	struct task_struct *p, *t;
f8991b9e3a5cad Alfred Chen 2020-07-29  2344  	struct rq_flags rf;
f8991b9e3a5cad Alfred Chen 2020-07-29  2345  
f8991b9e3a5cad Alfred Chen 2020-07-29  2346  	if (!llist)
f8991b9e3a5cad Alfred Chen 2020-07-29  2347  		return;
f8991b9e3a5cad Alfred Chen 2020-07-29  2348  
b466ff5f12b0b4 Alfred Chen 2020-08-02  2349  	/*
b466ff5f12b0b4 Alfred Chen 2020-08-02  2350  	 * rq::ttwu_pending racy indication of out-standing wakeups.
b466ff5f12b0b4 Alfred Chen 2020-08-02  2351  	 * Races such that false-negatives are possible, since they
b466ff5f12b0b4 Alfred Chen 2020-08-02  2352  	 * are shorter lived that false-positives would be.
b466ff5f12b0b4 Alfred Chen 2020-08-02  2353  	 */
b466ff5f12b0b4 Alfred Chen 2020-08-02  2354  	WRITE_ONCE(rq->ttwu_pending, 0);
b466ff5f12b0b4 Alfred Chen 2020-08-02  2355  
f8991b9e3a5cad Alfred Chen 2020-07-29  2356  	rq_lock_irqsave(rq, &rf);
f8991b9e3a5cad Alfred Chen 2020-07-29  2357  	update_rq_clock(rq);
f8991b9e3a5cad Alfred Chen 2020-07-29  2358  
e4068f211f8300 Alfred Chen 2020-08-02  2359  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
9c686a903b7d25 Alfred Chen 2020-08-02  2360  		if (WARN_ON_ONCE(p->on_cpu))
9c686a903b7d25 Alfred Chen 2020-08-02  2361  			smp_cond_load_acquire(&p->on_cpu, !VAL);
9c686a903b7d25 Alfred Chen 2020-08-02  2362  
9c686a903b7d25 Alfred Chen 2020-08-02  2363  		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
9c686a903b7d25 Alfred Chen 2020-08-02  2364  			set_task_cpu(p, cpu_of(rq));
9c686a903b7d25 Alfred Chen 2020-08-02  2365  
f8991b9e3a5cad Alfred Chen 2020-07-29  2366  		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0);
9c686a903b7d25 Alfred Chen 2020-08-02  2367  	}
9c686a903b7d25 Alfred Chen 2020-08-02  2368  
f8991b9e3a5cad Alfred Chen 2020-07-29  2369  	rq_unlock_irqrestore(rq, &rf);
f8991b9e3a5cad Alfred Chen 2020-07-29  2370  }
f8991b9e3a5cad Alfred Chen 2020-07-29  2371  
7c968298d72e8a Alfred Chen 2020-08-02 @2372  void send_call_function_single_ipi(int cpu)
7c968298d72e8a Alfred Chen 2020-08-02  2373  {
7c968298d72e8a Alfred Chen 2020-08-02  2374  	struct rq *rq = cpu_rq(cpu);
7c968298d72e8a Alfred Chen 2020-08-02  2375  
7c968298d72e8a Alfred Chen 2020-08-02  2376  	if (!set_nr_if_polling(rq->idle))
7c968298d72e8a Alfred Chen 2020-08-02  2377  		arch_send_call_function_single_ipi(cpu);
7c968298d72e8a Alfred Chen 2020-08-02  2378  	else
7c968298d72e8a Alfred Chen 2020-08-02  2379  		trace_sched_wake_idle_without_ipi(cpu);
7c968298d72e8a Alfred Chen 2020-08-02  2380  }
7c968298d72e8a Alfred Chen 2020-08-02  2381  

:::::: The code at line 2339 was first introduced by commit
:::::: e39d8404e7256171faa653b4e7bb535ab3f435df sched/alt: [Sync] a148866489fb sched: Replace rq::wake_list

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
