Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED5313298
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010772; cv=none; b=cHnN+MaQ2oJJfgNfq2jEck88CfIkL4i4xS/m1G9QsGjHV4apaMA/ZCz69G43CrrCyfUsxfpf3OlmLOC2pjmUucuh0TjEwG82AedgYj5NOpQYccEBDPPg2nosIFaV9UWv2sgNBQbdWjcK9aTiG0PK3EOE0/tHccE3CiMCJBE13co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010772; c=relaxed/simple;
	bh=W/5AQMH/UKZXSDNNhvz6xAj0bfPR0pP7h8FPyrKJv4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a42mY/X2OtwiRk/3cJuh6jeqlDMTIYxKmhMmtoR8EFZqt4JLdKZN3LZh4lFyPR/k7UHi+iFpeYeCJXwj6ILWKPcPMRAosCXxWFOQs6iFYBvYSBs/Uh7fYUGd8UMKCv2LXs/lJDS4c30L2Rz0AV0sl6bKj/DBIMyQ3rLOBvmSwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnwtMVTV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnwtMVTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772010769; x=1803546769;
  h=date:from:to:cc:subject:message-id;
  bh=W/5AQMH/UKZXSDNNhvz6xAj0bfPR0pP7h8FPyrKJv4c=;
  b=JnwtMVTVRuRZXZM2Dr/WH3NCx9/fvmMEfj5sPDA0ubFkpSi+gK3sGXvj
   CONLE6WkKj4sAFPuGPTJH6pmzI5q1id9kFNoBpBmRIMmTNnxjVLW9uYFN
   FVw7s6+j126xC1PTD4Rvu8e+B/ZZ3Y9gXXiPYBRkgnf35R44GXAgIn3bE
   FOAZvT3KI5tGpuiwT8EONWB5g/np54AMA8spF/MJNt+MWiXVaYYA/29SP
   J/XARgEISRC3Bu3W1mUysIuqWEaR5iiCaHBbjNKC6ZxlnKOahVs0x3ZfG
   Pm7YZAuW1IIdDHx5kfXBQvXsI3Q1NPCZ1wQ2tOTKPQWucfkC5drUx6MMK
   Q==;
X-CSE-ConnectionGUID: sLHtZ+ESTDKoG1xY/JSD+g==
X-CSE-MsgGUID: tcylGmP0QXuyisZLNgS9NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72949502"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72949502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 01:12:49 -0800
X-CSE-ConnectionGUID: xv4TAtE8R0Kb/qcKIlLAnw==
X-CSE-MsgGUID: LOmUSSeTSbeAQPLHRhcR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="214484915"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Feb 2026 01:12:47 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvAwm-000000004fV-3t65;
	Wed, 25 Feb 2026 09:12:44 +0000
Date: Wed, 25 Feb 2026 17:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-sched-v2 13/40]
 kernel/sched/ext.c:4617:9: error: implicit declaration of function
 'drain_descendants'
Message-ID: <202602251757.KJSZVYcW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-sched-v2
head:   f2122e67cf5ccb9d8844e72cd437a6fd56f0ad80
commit: 7138f0c420368c1b234c9d9b2264e4f84cf8a80b [13/40] sched_ext: Introduce cgroup sub-sched support
config: powerpc-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251757.KJSZVYcW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251757.KJSZVYcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251757.KJSZVYcW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function 'scx_root_disable':
>> kernel/sched/ext.c:4617:9: error: implicit declaration of function 'drain_descendants' [-Werror=implicit-function-declaration]
    4617 |         drain_descendants(sch);
         |         ^~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:4678:29: error: 'struct scx_sched' has no member named 'cgrp'
    4678 |         set_cgroup_sched(sch->cgrp, NULL);
         |                             ^~
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:5155:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    5155 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_root_enable':
>> kernel/sched/ext.c:5401:45: error: 'cgrp_dfl_root' undeclared (first use in this function)
    5401 |         sch = scx_alloc_and_add_sched(ops, &cgrp_dfl_root.cgrp, NULL);
         |                                             ^~~~~~~~~~~~~
   kernel/sched/ext.c:5401:45: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/ext.c:5531:29: error: 'struct scx_sched' has no member named 'cgrp'
    5531 |         set_cgroup_sched(sch->cgrp, sch);
         |                             ^~
   kernel/sched/ext.c: At top level:
>> kernel/sched/ext.c:4603:13: warning: 'scx_propgate_disable' defined but not used [-Wunused-function]
    4603 | static void scx_propgate_disable(struct scx_sched *sch) { }
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:319:13: warning: 'scx_is_descendant' defined but not used [-Wunused-function]
     319 | static bool scx_is_descendant(struct scx_sched *sch, struct scx_sched *ancestor)
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drain_descendants +4617 kernel/sched/ext.c

  4557	
  4558	static void scx_sub_disable(struct scx_sched *sch)
  4559	{
  4560		struct scx_sched *parent = scx_parent(sch);
  4561	
  4562		drain_descendants(sch);
  4563	
  4564		mutex_lock(&scx_enable_mutex);
  4565		percpu_down_write(&scx_fork_rwsem);
  4566		scx_cgroup_lock();
  4567	
  4568		set_cgroup_sched(sch->cgrp, parent);
  4569	
  4570		/* TODO - perform actual disabling here */
  4571	
  4572		scx_cgroup_unlock();
  4573		percpu_up_write(&scx_fork_rwsem);
  4574	
  4575		raw_spin_lock_irq(&scx_sched_lock);
  4576		list_del_init(&sch->sibling);
  4577		list_del_rcu(&sch->all);
  4578		raw_spin_unlock_irq(&scx_sched_lock);
  4579	
  4580		mutex_unlock(&scx_enable_mutex);
  4581	
  4582		/*
  4583		 * @sch is now unlinked from the parent's children list. Notify and call
  4584		 * ops.sub_detach/exit(). Note that ops.sub_detach/exit() must be called
  4585		 * after unlinking and releasing all locks. See scx_claim_exit().
  4586		 */
  4587		wake_up_all(&scx_unlink_waitq);
  4588	
  4589		if (sch->ops.sub_detach && sch->sub_attached) {
  4590			struct scx_sub_detach_args sub_detach_args = {
  4591				.ops = &sch->ops,
  4592				.cgroup_path = sch->cgrp_path,
  4593			};
  4594			SCX_CALL_OP(parent, SCX_KF_UNLOCKED, sub_detach, NULL,
  4595				    &sub_detach_args);
  4596		}
  4597	
  4598		if (sch->ops.exit)
  4599			SCX_CALL_OP(sch, SCX_KF_UNLOCKED, exit, NULL, sch->exit_info);
  4600		kobject_del(&sch->kobj);
  4601	}
  4602	#else	/* CONFIG_EXT_SUB_SCHED */
> 4603	static void scx_propgate_disable(struct scx_sched *sch) { }
  4604	static void scx_sub_disable(struct scx_sched *sch) { }
  4605	#endif	/* CONFIG_EXT_SUB_SCHED */
  4606	
  4607	static void scx_root_disable(struct scx_sched *sch)
  4608	{
  4609		struct scx_exit_info *ei = sch->exit_info;
  4610		struct scx_task_iter sti;
  4611		struct task_struct *p;
  4612		int cpu;
  4613	
  4614		/* guarantee forward progress and wait for descendants to be disabled */
  4615		scx_bypass(true);
  4616		WRITE_ONCE(scx_aborting, false);
> 4617		drain_descendants(sch);
  4618	
  4619		switch (scx_set_enable_state(SCX_DISABLING)) {
  4620		case SCX_DISABLING:
  4621			WARN_ONCE(true, "sched_ext: duplicate disabling instance?");
  4622			break;
  4623		case SCX_DISABLED:
  4624			pr_warn("sched_ext: ops error detected without ops (%s)\n",
  4625				sch->exit_info->msg);
  4626			WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
  4627			goto done;
  4628		default:
  4629			break;
  4630		}
  4631	
  4632		/*
  4633		 * Here, every runnable task is guaranteed to make forward progress and
  4634		 * we can safely use blocking synchronization constructs. Actually
  4635		 * disable ops.
  4636		 */
  4637		mutex_lock(&scx_enable_mutex);
  4638	
  4639		static_branch_disable(&__scx_switched_all);
  4640		WRITE_ONCE(scx_switching_all, false);
  4641	
  4642		/*
  4643		 * Shut down cgroup support before tasks so that the cgroup attach path
  4644		 * doesn't race against scx_exit_task().
  4645		 */
  4646		scx_cgroup_lock();
  4647		scx_cgroup_exit(sch);
  4648		scx_cgroup_unlock();
  4649	
  4650		/*
  4651		 * The BPF scheduler is going away. All tasks including %TASK_DEAD ones
  4652		 * must be switched out and exited synchronously.
  4653		 */
  4654		percpu_down_write(&scx_fork_rwsem);
  4655	
  4656		scx_init_task_enabled = false;
  4657	
  4658		scx_task_iter_start(&sti, NULL);
  4659		while ((p = scx_task_iter_next_locked(&sti))) {
  4660			unsigned int queue_flags = DEQUEUE_SAVE | DEQUEUE_MOVE | DEQUEUE_NOCLOCK;
  4661			const struct sched_class *old_class = p->sched_class;
  4662			const struct sched_class *new_class = scx_setscheduler_class(p);
  4663	
  4664			update_rq_clock(task_rq(p));
  4665	
  4666			if (old_class != new_class)
  4667				queue_flags |= DEQUEUE_CLASS;
  4668	
  4669			scoped_guard (sched_change, p, queue_flags) {
  4670				p->sched_class = new_class;
  4671			}
  4672	
  4673			scx_exit_task(p);
  4674		}
  4675		scx_task_iter_stop(&sti);
  4676	
  4677		scx_cgroup_lock();
> 4678		set_cgroup_sched(sch->cgrp, NULL);
  4679		scx_cgroup_unlock();
  4680	
  4681		percpu_up_write(&scx_fork_rwsem);
  4682	
  4683		/*
  4684		 * Invalidate all the rq clocks to prevent getting outdated
  4685		 * rq clocks from a previous scx scheduler.
  4686		 */
  4687		for_each_possible_cpu(cpu) {
  4688			struct rq *rq = cpu_rq(cpu);
  4689			scx_rq_clock_invalidate(rq);
  4690		}
  4691	
  4692		/* no task is on scx, turn off all the switches and flush in-progress calls */
  4693		static_branch_disable(&__scx_enabled);
  4694		bitmap_zero(sch->has_op, SCX_OPI_END);
  4695		scx_idle_disable();
  4696		synchronize_rcu();
  4697	
  4698		if (ei->kind >= SCX_EXIT_ERROR) {
  4699			pr_err("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
  4700			       sch->ops.name, ei->reason);
  4701	
  4702			if (ei->msg[0] != '\0')
  4703				pr_err("sched_ext: %s: %s\n", sch->ops.name, ei->msg);
  4704	#ifdef CONFIG_STACKTRACE
  4705			stack_trace_print(ei->bt, ei->bt_len, 2);
  4706	#endif
  4707		} else {
  4708			pr_info("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
  4709				sch->ops.name, ei->reason);
  4710		}
  4711	
  4712		if (sch->ops.exit)
  4713			SCX_CALL_OP(sch, SCX_KF_UNLOCKED, exit, NULL, ei);
  4714	
  4715		cancel_delayed_work_sync(&scx_watchdog_work);
  4716	
  4717		raw_spin_lock_irq(&scx_sched_lock);
  4718		list_del_rcu(&sch->all);
  4719		raw_spin_unlock_irq(&scx_sched_lock);
  4720	
  4721		/*
  4722		 * scx_root clearing must be inside cpus_read_lock(). See
  4723		 * handle_hotplug().
  4724		 */
  4725		cpus_read_lock();
  4726		RCU_INIT_POINTER(scx_root, NULL);
  4727		cpus_read_unlock();
  4728	
  4729		/*
  4730		 * Delete the kobject from the hierarchy synchronously. Otherwise, sysfs
  4731		 * could observe an object of the same name still in the hierarchy when
  4732		 * the next scheduler is loaded.
  4733		 */
  4734		kobject_del(&sch->kobj);
  4735	
  4736		free_percpu(scx_dsp_ctx);
  4737		scx_dsp_ctx = NULL;
  4738		scx_dsp_max_batch = 0;
  4739		free_kick_syncs();
  4740	
  4741		if (scx_bypassed_for_enable) {
  4742			scx_bypassed_for_enable = false;
  4743			scx_bypass(false);
  4744		}
  4745	
  4746		mutex_unlock(&scx_enable_mutex);
  4747	
  4748		WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
  4749	done:
  4750		scx_bypass(false);
  4751	}
  4752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
