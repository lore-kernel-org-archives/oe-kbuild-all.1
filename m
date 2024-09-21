Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF6A14EC7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 22:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726958895; cv=none; b=LnkkgKljjl1A1L/QNIOBis4R/iysPzSilkESyb5IQsm4hTeavUFlRY5BHq4WACbJFznt3aCa+7SCsUNvHV9ytjAGviDjD9uLEuCEL+1q58eX8OxDE+o7Ry2Vk2VWkEpkFs/cxCqViYEPdSfN1wJfXUX4KsKVeEskOm9u3HJO8QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726958895; c=relaxed/simple;
	bh=0wEzHWx/Z06XOi5SdsmahhqsDAYBjOOEs/RdAx8UasA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fy46RO9d+wo2W3P14M90BovcbhfrnvZfPM+KDyL7/YX6F1HGnBLaCCk3azbZM6WoDWsK6FJG3TBciSX8rG0xtL0gs+wEKh2H+sCnDGlt2GlAHK6kY4ycrFVqtPTGy+Xeu3gCVW4ucbaeRQ2Xfmg+9c0HbWA+eLSeal9lxX43GaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGuIpARa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGuIpARa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726958893; x=1758494893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0wEzHWx/Z06XOi5SdsmahhqsDAYBjOOEs/RdAx8UasA=;
  b=NGuIpARaBKorjN8e3Zok5jWJgZ1JnvKQvfkOFoQCeWoXWh+3NFv50ST5
   KBjoxVgpU3sdLcpRFdHNzBoK+j4+5niRe88W8F6QRlsgUz3U7zw5nElj/
   65VBXil4pHltDnuaJ6vhi23mD8uLT5cpQvzcE76MIG1IWO3H9FCjNjUlJ
   alDLhhdB7ZGIUkGBjMcj1eCk7xVVEIdTtj6KW+ExXO90W8kNM0oFa57B1
   pKWHwKB8jgxqWHeCS5hf0nhuye1j3JTR5XYTW02fitCqQs4dZBfnrMA3I
   XemR8dMuBPGSQOwjG9x9JCcsPxYCIxnzSEMpPKSgabFllUAq9vmt4tBM6
   g==;
X-CSE-ConnectionGUID: uhmm7AzXQbSZCzEA6IjaaQ==
X-CSE-MsgGUID: gMqfEzXAQuuPpU9IT9R09w==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37310288"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="37310288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 15:48:10 -0700
X-CSE-ConnectionGUID: b9ZJFQHgRbqKLrygus6EcA==
X-CSE-MsgGUID: m6q9MuCjQuWn0eIgycRsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75442533"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2024 15:48:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss8ta-000Fqq-17;
	Sat, 21 Sep 2024 22:48:06 +0000
Date: Sun, 22 Sep 2024 06:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/ext.c:2898:17: error: implicit declaration of function
 'stack_trace_print'; did you mean 'event_trace_printk'?
Message-ID: <202409220642.fDW2OmWc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejun,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88264981f2082248e892a706b2c5004650faac54
commit: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class
date:   3 months ago
config: sparc-randconfig-002-20240922 (https://download.01.org/0day-ci/archive/20240922/202409220642.fDW2OmWc-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220642.fDW2OmWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220642.fDW2OmWc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rhashtable-types.h:12,
                    from include/linux/sched/ext.h:13,
                    from include/linux/sched.h:83,
                    from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/build_policy.c:17:
   kernel/sched/ext.c: In function 'alloc_exit_info':
   kernel/sched/ext.c:2759:32: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:16: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2759:18: note: in expansion of macro 'kcalloc'
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   kernel/sched/ext.c:2759:32: note: earlier argument should specify number of elements, later size of each element
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:16: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2759:18: note: in expansion of macro 'kcalloc'
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   kernel/sched/ext.c:2759:32: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:34: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2759:18: note: in expansion of macro 'kcalloc'
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   kernel/sched/ext.c:2759:32: note: earlier argument should specify number of elements, later size of each element
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:34: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2759:18: note: in expansion of macro 'kcalloc'
    2759 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   In file included from kernel/sched/build_policy.c:61:
   kernel/sched/ext.c: In function 'scx_ops_disable_workfn':
>> kernel/sched/ext.c:2898:17: error: implicit declaration of function 'stack_trace_print'; did you mean 'event_trace_printk'? [-Wimplicit-function-declaration]
    2898 |                 stack_trace_print(ei->bt, ei->bt_len, 2);
         |                 ^~~~~~~~~~~~~~~~~
         |                 event_trace_printk
   kernel/sched/ext.c: In function 'scx_ops_exit_kind':
>> kernel/sched/ext.c:2989:30: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_tracer_enable'? [-Wimplicit-function-declaration]
    2989 |                 ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
         |                              ^~~~~~~~~~~~~~~~
         |                              stack_tracer_enable


vim +2898 kernel/sched/ext.c

  2787	
  2788	static void scx_ops_disable_workfn(struct kthread_work *work)
  2789	{
  2790		struct scx_exit_info *ei = scx_exit_info;
  2791		struct scx_task_iter sti;
  2792		struct task_struct *p;
  2793		struct rhashtable_iter rht_iter;
  2794		struct scx_dispatch_q *dsq;
  2795		int i, kind;
  2796	
  2797		kind = atomic_read(&scx_exit_kind);
  2798		while (true) {
  2799			/*
  2800			 * NONE indicates that a new scx_ops has been registered since
  2801			 * disable was scheduled - don't kill the new ops. DONE
  2802			 * indicates that the ops has already been disabled.
  2803			 */
  2804			if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
  2805				return;
  2806			if (atomic_try_cmpxchg(&scx_exit_kind, &kind, SCX_EXIT_DONE))
  2807				break;
  2808		}
  2809		ei->kind = kind;
  2810		ei->reason = scx_exit_reason(ei->kind);
  2811	
  2812		/* guarantee forward progress by bypassing scx_ops */
  2813		scx_ops_bypass(true);
  2814	
  2815		switch (scx_ops_set_enable_state(SCX_OPS_DISABLING)) {
  2816		case SCX_OPS_DISABLING:
  2817			WARN_ONCE(true, "sched_ext: duplicate disabling instance?");
  2818			break;
  2819		case SCX_OPS_DISABLED:
  2820			pr_warn("sched_ext: ops error detected without ops (%s)\n",
  2821				scx_exit_info->msg);
  2822			WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
  2823				     SCX_OPS_DISABLING);
  2824			goto done;
  2825		default:
  2826			break;
  2827		}
  2828	
  2829		/*
  2830		 * Here, every runnable task is guaranteed to make forward progress and
  2831		 * we can safely use blocking synchronization constructs. Actually
  2832		 * disable ops.
  2833		 */
  2834		mutex_lock(&scx_ops_enable_mutex);
  2835	
  2836		static_branch_disable(&__scx_switched_all);
  2837		WRITE_ONCE(scx_switching_all, false);
  2838	
  2839		/*
  2840		 * Avoid racing against fork. See scx_ops_enable() for explanation on
  2841		 * the locking order.
  2842		 */
  2843		percpu_down_write(&scx_fork_rwsem);
  2844		cpus_read_lock();
  2845	
  2846		spin_lock_irq(&scx_tasks_lock);
  2847		scx_task_iter_init(&sti);
  2848		/*
  2849		 * Invoke scx_ops_exit_task() on all non-idle tasks, including
  2850		 * TASK_DEAD tasks. Because dead tasks may have a nonzero refcount,
  2851		 * we may not have invoked sched_ext_free() on them by the time a
  2852		 * scheduler is disabled. We must therefore exit the task here, or we'd
  2853		 * fail to invoke ops.exit_task(), as the scheduler will have been
  2854		 * unloaded by the time the task is subsequently exited on the
  2855		 * sched_ext_free() path.
  2856		 */
  2857		while ((p = scx_task_iter_next_locked(&sti, true))) {
  2858			const struct sched_class *old_class = p->sched_class;
  2859			struct sched_enq_and_set_ctx ctx;
  2860	
  2861			if (READ_ONCE(p->__state) != TASK_DEAD) {
  2862				sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE,
  2863						       &ctx);
  2864	
  2865				p->scx.slice = min_t(u64, p->scx.slice, SCX_SLICE_DFL);
  2866				__setscheduler_prio(p, p->prio);
  2867				check_class_changing(task_rq(p), p, old_class);
  2868	
  2869				sched_enq_and_set_task(&ctx);
  2870	
  2871				check_class_changed(task_rq(p), p, old_class, p->prio);
  2872			}
  2873			scx_ops_exit_task(p);
  2874		}
  2875		scx_task_iter_exit(&sti);
  2876		spin_unlock_irq(&scx_tasks_lock);
  2877	
  2878		/* no task is on scx, turn off all the switches and flush in-progress calls */
  2879		static_branch_disable_cpuslocked(&__scx_ops_enabled);
  2880		for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
  2881			static_branch_disable_cpuslocked(&scx_has_op[i]);
  2882		static_branch_disable_cpuslocked(&scx_ops_enq_last);
  2883		static_branch_disable_cpuslocked(&scx_ops_enq_exiting);
  2884		static_branch_disable_cpuslocked(&scx_builtin_idle_enabled);
  2885		synchronize_rcu();
  2886	
  2887		cpus_read_unlock();
  2888		percpu_up_write(&scx_fork_rwsem);
  2889	
  2890		if (ei->kind >= SCX_EXIT_ERROR) {
  2891			printk(KERN_ERR "sched_ext: BPF scheduler \"%s\" errored, disabling\n", scx_ops.name);
  2892	
  2893			if (ei->msg[0] == '\0')
  2894				printk(KERN_ERR "sched_ext: %s\n", ei->reason);
  2895			else
  2896				printk(KERN_ERR "sched_ext: %s (%s)\n", ei->reason, ei->msg);
  2897	
> 2898			stack_trace_print(ei->bt, ei->bt_len, 2);
  2899		}
  2900	
  2901		if (scx_ops.exit)
  2902			SCX_CALL_OP(SCX_KF_UNLOCKED, exit, ei);
  2903	
  2904		/*
  2905		 * Delete the kobject from the hierarchy eagerly in addition to just
  2906		 * dropping a reference. Otherwise, if the object is deleted
  2907		 * asynchronously, sysfs could observe an object of the same name still
  2908		 * in the hierarchy when another scheduler is loaded.
  2909		 */
  2910		kobject_del(scx_root_kobj);
  2911		kobject_put(scx_root_kobj);
  2912		scx_root_kobj = NULL;
  2913	
  2914		memset(&scx_ops, 0, sizeof(scx_ops));
  2915	
  2916		rhashtable_walk_enter(&dsq_hash, &rht_iter);
  2917		do {
  2918			rhashtable_walk_start(&rht_iter);
  2919	
  2920			while ((dsq = rhashtable_walk_next(&rht_iter)) && !IS_ERR(dsq))
  2921				destroy_dsq(dsq->id);
  2922	
  2923			rhashtable_walk_stop(&rht_iter);
  2924		} while (dsq == ERR_PTR(-EAGAIN));
  2925		rhashtable_walk_exit(&rht_iter);
  2926	
  2927		free_percpu(scx_dsp_ctx);
  2928		scx_dsp_ctx = NULL;
  2929		scx_dsp_max_batch = 0;
  2930	
  2931		free_exit_info(scx_exit_info);
  2932		scx_exit_info = NULL;
  2933	
  2934		mutex_unlock(&scx_ops_enable_mutex);
  2935	
  2936		WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
  2937			     SCX_OPS_DISABLING);
  2938	done:
  2939		scx_ops_bypass(false);
  2940	}
  2941	
  2942	static DEFINE_KTHREAD_WORK(scx_ops_disable_work, scx_ops_disable_workfn);
  2943	
  2944	static void schedule_scx_ops_disable_work(void)
  2945	{
  2946		struct kthread_worker *helper = READ_ONCE(scx_ops_helper);
  2947	
  2948		/*
  2949		 * We may be called spuriously before the first bpf_sched_ext_reg(). If
  2950		 * scx_ops_helper isn't set up yet, there's nothing to do.
  2951		 */
  2952		if (helper)
  2953			kthread_queue_work(helper, &scx_ops_disable_work);
  2954	}
  2955	
  2956	static void scx_ops_disable(enum scx_exit_kind kind)
  2957	{
  2958		int none = SCX_EXIT_NONE;
  2959	
  2960		if (WARN_ON_ONCE(kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE))
  2961			kind = SCX_EXIT_ERROR;
  2962	
  2963		atomic_try_cmpxchg(&scx_exit_kind, &none, kind);
  2964	
  2965		schedule_scx_ops_disable_work();
  2966	}
  2967	
  2968	static void scx_ops_error_irq_workfn(struct irq_work *irq_work)
  2969	{
  2970		schedule_scx_ops_disable_work();
  2971	}
  2972	
  2973	static DEFINE_IRQ_WORK(scx_ops_error_irq_work, scx_ops_error_irq_workfn);
  2974	
  2975	static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
  2976						     s64 exit_code,
  2977						     const char *fmt, ...)
  2978	{
  2979		struct scx_exit_info *ei = scx_exit_info;
  2980		int none = SCX_EXIT_NONE;
  2981		va_list args;
  2982	
  2983		if (!atomic_try_cmpxchg(&scx_exit_kind, &none, kind))
  2984			return;
  2985	
  2986		ei->exit_code = exit_code;
  2987	
  2988		if (kind >= SCX_EXIT_ERROR)
> 2989			ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
  2990	
  2991		va_start(args, fmt);
  2992		vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
  2993		va_end(args);
  2994	
  2995		irq_work_queue(&scx_ops_error_irq_work);
  2996	}
  2997	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
