Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C900CC2CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687960486; x=1719496486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHvCAUKOvXLRxDtD24ao1geVHVvRzQRvoiIWhL6/gl0=;
  b=apDGcA/Iy/AVyuiQmxGVGvoZdKhR6oN8x1Y4TPQhH8+tjFKvy2mTsL4R
   UGYZzIYB6X5PdUsF5Jac+goTpgGseOAeut7CRSk1hOyZJOVYyzQhRe93d
   DCP9dm4tF3F4Wk8uBhj7OgdBKNoFENJvQcv9/K3CeeNfhflKJiNh0NMVX
   3Ph9H5jUhWlbI5ymp92dp9SmlOVewlmWffIks3POBnyw4DG8EcZi9/KMo
   /UUrB0zpgBnYeyJRPiEotFvRMD1Fhk4Vu+wRmVXm55AJcJVZbLjx1tW9a
   Ii6pL62Q7Wze2FOCnNfi9bZAQ6z3fIiztK6A9v0M8mUQJW4RpbBHWXkeR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364399121"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="364399121"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 06:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="782296238"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="782296238"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2023 06:54:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEVd4-000DHx-1t;
	Wed, 28 Jun 2023 13:54:42 +0000
Date: Wed, 28 Jun 2023 21:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 379/385] kernel/sched/alt_core.c:2516:6: warning: no
 previous prototype for function 'call_function_single_prep_ipi'
Message-ID: <202306282135.FYCixv6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: 217029dcc8414f797711c3cac589493f62a4dc13 [379/385] sched/alt: [Sync] 68f4ff04dbad sched, smp: Trace smp callback causing an IPI
config: x86_64-randconfig-x013-20230628 (https://download.01.org/0day-ci/archive/20230628/202306282135.FYCixv6I-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306282135.FYCixv6I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306282135.FYCixv6I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:690:21: error: no member named 'cid_lock' in 'struct mm_struct'
           raw_spin_lock(&mm->cid_lock);
                          ~~  ^
   include/linux/spinlock.h:216:44: note: expanded from macro 'raw_spin_lock'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                                  ^~~~
   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:692:23: error: no member named 'cid_lock' in 'struct mm_struct'
           raw_spin_unlock(&mm->cid_lock);
                            ~~  ^
   include/linux/spinlock.h:275:49: note: expanded from macro 'raw_spin_unlock'
   #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
                                                            ^~~~
   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:700:21: error: no member named 'cid_lock' in 'struct mm_struct'
           raw_spin_lock(&mm->cid_lock);
                          ~~  ^
   include/linux/spinlock.h:216:44: note: expanded from macro 'raw_spin_lock'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                                  ^~~~
   In file included from kernel/sched/alt_core.c:44:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:702:23: error: no member named 'cid_lock' in 'struct mm_struct'
           raw_spin_unlock(&mm->cid_lock);
                            ~~  ^
   include/linux/spinlock.h:275:49: note: expanded from macro 'raw_spin_unlock'
   #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
                                                            ^~~~
   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
   void resched_curr(struct rq *rq)
        ^
   kernel/sched/alt_core.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_curr(struct rq *rq)
   ^
   static 
   kernel/sched/alt_core.c:1029:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
   void resched_cpu(int cpu)
        ^
   kernel/sched/alt_core.c:1029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_cpu(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:1044:6: warning: no previous prototype for function 'select_nohz_load_balancer' [-Wmissing-prototypes]
   void select_nohz_load_balancer(int stop_tick) {}
        ^
   kernel/sched/alt_core.c:1044:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void select_nohz_load_balancer(int stop_tick) {}
   ^
   static 
   kernel/sched/alt_core.c:1046:6: warning: no previous prototype for function 'set_cpu_sd_state_idle' [-Wmissing-prototypes]
   void set_cpu_sd_state_idle(void) {}
        ^
   kernel/sched/alt_core.c:1046:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void set_cpu_sd_state_idle(void) {}
   ^
   static 
   kernel/sched/alt_core.c:2473:6: warning: no previous prototype for function 'sched_ttwu_pending' [-Wmissing-prototypes]
   void sched_ttwu_pending(void *arg)
        ^
   kernel/sched/alt_core.c:2473:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_ttwu_pending(void *arg)
   ^
   static 
>> kernel/sched/alt_core.c:2516:6: warning: no previous prototype for function 'call_function_single_prep_ipi' [-Wmissing-prototypes]
   bool call_function_single_prep_ipi(int cpu)
        ^
   kernel/sched/alt_core.c:2516:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool call_function_single_prep_ipi(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7137:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
   void idle_task_exit(void)
        ^
   kernel/sched/alt_core.c:7137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_task_exit(void)
   ^
   static 
   kernel/sched/alt_core.c:7347:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
   int sched_cpu_activate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_activate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7386:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
   int sched_cpu_deactivate(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7386:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_deactivate(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7450:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
   int sched_cpu_starting(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7450:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_starting(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7470:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
   int sched_cpu_wait_empty(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7470:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_wait_empty(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7512:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
   int sched_cpu_dying(unsigned int cpu)
       ^
   kernel/sched/alt_core.c:7512:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_dying(unsigned int cpu)
   ^
   static 
   kernel/sched/alt_core.c:7595:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/alt_core.c:7595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/alt_core.c:7655:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/alt_core.c:7655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   kernel/sched/alt_core.c:8011:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
   struct task_group *sched_create_group(struct task_group *parent)
                      ^
   kernel/sched/alt_core.c:8011:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct task_group *sched_create_group(struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:8022:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
   void sched_online_group(struct task_group *tg, struct task_group *parent)
        ^
   kernel/sched/alt_core.c:8022:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_online_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:8033:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
   void sched_destroy_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:8033:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_destroy_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:8039:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
   void sched_release_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:8039:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_release_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:8107:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
       ^
   kernel/sched/alt_core.c:8107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
   ^
   static 
   kernel/sched/alt_core.c:8177:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .legacy_cftypes = cpu_legacy_files,
                             ^~~~~~~~~~~~~~~~


vim +/call_function_single_prep_ipi +2516 kernel/sched/alt_core.c

  2471	
  2472	#ifdef CONFIG_SMP
> 2473	void sched_ttwu_pending(void *arg)
  2474	{
  2475		struct llist_node *llist = arg;
  2476		struct rq *rq = this_rq();
  2477		struct task_struct *p, *t;
  2478		struct rq_flags rf;
  2479	
  2480		if (!llist)
  2481			return;
  2482	
  2483		rq_lock_irqsave(rq, &rf);
  2484		update_rq_clock(rq);
  2485	
  2486		llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
  2487			if (WARN_ON_ONCE(p->on_cpu))
  2488				smp_cond_load_acquire(&p->on_cpu, !VAL);
  2489	
  2490			if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
  2491				set_task_cpu(p, cpu_of(rq));
  2492	
  2493			ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0);
  2494		}
  2495	
  2496		/*
  2497		 * Must be after enqueueing at least once task such that
  2498		 * idle_cpu() does not observe a false-negative -- if it does,
  2499		 * it is possible for select_idle_siblings() to stack a number
  2500		 * of tasks on this CPU during that window.
  2501		 *
  2502		 * It is ok to clear ttwu_pending when another task pending.
  2503		 * We will receive IPI after local irq enabled and then enqueue it.
  2504		 * Since now nr_running > 0, idle_cpu() will always get correct result.
  2505		 */
  2506		WRITE_ONCE(rq->ttwu_pending, 0);
  2507		rq_unlock_irqrestore(rq, &rf);
  2508	}
  2509	
  2510	/*
  2511	 * Prepare the scene for sending an IPI for a remote smp_call
  2512	 *
  2513	 * Returns true if the caller can proceed with sending the IPI.
  2514	 * Returns false otherwise.
  2515	 */
> 2516	bool call_function_single_prep_ipi(int cpu)
  2517	{
  2518		if (set_nr_if_polling(cpu_rq(cpu)->idle)) {
  2519			trace_sched_wake_idle_without_ipi(cpu);
  2520			return false;
  2521		}
  2522	
  2523		return true;
  2524	}
  2525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
