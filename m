Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B139635
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629163; cv=none; b=c7tbZjonolLdqRanFgWDC/VSh6VNE/qqvSa0+kGlEIZ9GrT4GytCXCU/7RSj0Gfk58mu2caWLcgJ31ne1RUYgL/crfBIdFU9sliRDarqj7I5vILc+wzJ37puyRXx6eqrZnUTNpzrAWF2eRN47C76rleOYc3gqBqnvezjxxQZ/4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629163; c=relaxed/simple;
	bh=1Lz5o4NAQlwpPvwv+i/qmxHNQaktt8DJjax5fmqA9fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JluA9QNs6LTWcFZcMIJLvcY8yld7ARXwQ3Eee9qZPl4lUXggh4qijVjzltyJc18ENcm0SDuPuVot2lzBNB+HA0V8z42uaa1Lao6fevJnAnReUMOrrkkXPS38GGBxyCn9DkOmYHrrV1jgpXtQsjq3FBpXSbsh3xn4akZivKp9Qmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSoVb9vG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSoVb9vG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728629161; x=1760165161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Lz5o4NAQlwpPvwv+i/qmxHNQaktt8DJjax5fmqA9fc=;
  b=FSoVb9vGPl6BS4FSNRoE097Mrw8eluHnl7bpdZhIkcHrVcnCCfq6rjr7
   B9rsREzf/1QTUtuj5IevPT5wKQkG6z9L+iXIFJpM+kLdKFAqaZZJO7eNQ
   qqpYRQSyIKjkqw5hc2CQyDSbCihHsPPcX14aeqI4OjHwe/DVkXx4RJvNF
   qk9EW9utVk/Kzddien/+qfJ5XOBNztrFOqEP1aJn80+U4PgR7f9WFmOwl
   on0avcjY9aWREppm1migtOsRR07VoSWuTfsHZRxwWl4D5hjyR/WiJjKif
   mDU38syuzR+tDIuWSF8/H2k6k2ROXAtJVtSJB/2MjsZ1HJiNs4U6XIs1t
   w==;
X-CSE-ConnectionGUID: XTfoRo9rSn6cWxgIjYrKFQ==
X-CSE-MsgGUID: /LDBwTPuTU6vVX4Xom4h0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28111102"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="28111102"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 23:46:01 -0700
X-CSE-ConnectionGUID: /BuVl0ZtR2yBE/yMQzyW1g==
X-CSE-MsgGUID: Ckk/1yN+QAinSVQQ1exheQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="107689395"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2024 23:46:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz9PR-000BxR-1Q;
	Fri, 11 Oct 2024 06:45:57 +0000
Date: Fri, 11 Oct 2024 14:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/urgent 3/7] kernel/sched/ext.c:4474:17: error:
 implicit declaration of function '__setscheduler_prio'; did you mean
 '__setscheduler_class'?
Message-ID: <202410111445.VwIVeDqw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urgent
head:   7b8c7811ba63b1abbbb2349e603f987f8e6e3257
commit: 8606bea3971897e827dac357dc3ce58629abb4ee [3/7] sched: Fix delayed_dequeue vs switched_from_fair()
config: loongarch-randconfig-r073-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111445.VwIVeDqw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111445.VwIVeDqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111445.VwIVeDqw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c: In function 'scx_ops_disable_workfn':
>> kernel/sched/ext.c:4474:17: error: implicit declaration of function '__setscheduler_prio'; did you mean '__setscheduler_class'? [-Wimplicit-function-declaration]
    4474 |                 __setscheduler_prio(p, p->prio);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 __setscheduler_class

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +4474 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo    2024-06-18  4397  
f0e1a0643a59bf Tejun Heo    2024-06-18  4398  static void scx_ops_disable_workfn(struct kthread_work *work)
f0e1a0643a59bf Tejun Heo    2024-06-18  4399  {
f0e1a0643a59bf Tejun Heo    2024-06-18  4400  	struct scx_exit_info *ei = scx_exit_info;
f0e1a0643a59bf Tejun Heo    2024-06-18  4401  	struct scx_task_iter sti;
f0e1a0643a59bf Tejun Heo    2024-06-18  4402  	struct task_struct *p;
f0e1a0643a59bf Tejun Heo    2024-06-18  4403  	struct rhashtable_iter rht_iter;
f0e1a0643a59bf Tejun Heo    2024-06-18  4404  	struct scx_dispatch_q *dsq;
f0e1a0643a59bf Tejun Heo    2024-06-18  4405  	int i, kind;
f0e1a0643a59bf Tejun Heo    2024-06-18  4406  
f0e1a0643a59bf Tejun Heo    2024-06-18  4407  	kind = atomic_read(&scx_exit_kind);
f0e1a0643a59bf Tejun Heo    2024-06-18  4408  	while (true) {
f0e1a0643a59bf Tejun Heo    2024-06-18  4409  		/*
f0e1a0643a59bf Tejun Heo    2024-06-18  4410  		 * NONE indicates that a new scx_ops has been registered since
f0e1a0643a59bf Tejun Heo    2024-06-18  4411  		 * disable was scheduled - don't kill the new ops. DONE
f0e1a0643a59bf Tejun Heo    2024-06-18  4412  		 * indicates that the ops has already been disabled.
f0e1a0643a59bf Tejun Heo    2024-06-18  4413  		 */
f0e1a0643a59bf Tejun Heo    2024-06-18  4414  		if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
f0e1a0643a59bf Tejun Heo    2024-06-18  4415  			return;
f0e1a0643a59bf Tejun Heo    2024-06-18  4416  		if (atomic_try_cmpxchg(&scx_exit_kind, &kind, SCX_EXIT_DONE))
f0e1a0643a59bf Tejun Heo    2024-06-18  4417  			break;
f0e1a0643a59bf Tejun Heo    2024-06-18  4418  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  4419  	ei->kind = kind;
f0e1a0643a59bf Tejun Heo    2024-06-18  4420  	ei->reason = scx_exit_reason(ei->kind);
f0e1a0643a59bf Tejun Heo    2024-06-18  4421  
f0e1a0643a59bf Tejun Heo    2024-06-18  4422  	/* guarantee forward progress by bypassing scx_ops */
f0e1a0643a59bf Tejun Heo    2024-06-18  4423  	scx_ops_bypass(true);
f0e1a0643a59bf Tejun Heo    2024-06-18  4424  
f0e1a0643a59bf Tejun Heo    2024-06-18  4425  	switch (scx_ops_set_enable_state(SCX_OPS_DISABLING)) {
f0e1a0643a59bf Tejun Heo    2024-06-18  4426  	case SCX_OPS_DISABLING:
f0e1a0643a59bf Tejun Heo    2024-06-18  4427  		WARN_ONCE(true, "sched_ext: duplicate disabling instance?");
f0e1a0643a59bf Tejun Heo    2024-06-18  4428  		break;
f0e1a0643a59bf Tejun Heo    2024-06-18  4429  	case SCX_OPS_DISABLED:
f0e1a0643a59bf Tejun Heo    2024-06-18  4430  		pr_warn("sched_ext: ops error detected without ops (%s)\n",
f0e1a0643a59bf Tejun Heo    2024-06-18  4431  			scx_exit_info->msg);
f0e1a0643a59bf Tejun Heo    2024-06-18  4432  		WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
f0e1a0643a59bf Tejun Heo    2024-06-18  4433  			     SCX_OPS_DISABLING);
f0e1a0643a59bf Tejun Heo    2024-06-18  4434  		goto done;
f0e1a0643a59bf Tejun Heo    2024-06-18  4435  	default:
f0e1a0643a59bf Tejun Heo    2024-06-18  4436  		break;
f0e1a0643a59bf Tejun Heo    2024-06-18  4437  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  4438  
f0e1a0643a59bf Tejun Heo    2024-06-18  4439  	/*
f0e1a0643a59bf Tejun Heo    2024-06-18  4440  	 * Here, every runnable task is guaranteed to make forward progress and
f0e1a0643a59bf Tejun Heo    2024-06-18  4441  	 * we can safely use blocking synchronization constructs. Actually
f0e1a0643a59bf Tejun Heo    2024-06-18  4442  	 * disable ops.
f0e1a0643a59bf Tejun Heo    2024-06-18  4443  	 */
f0e1a0643a59bf Tejun Heo    2024-06-18  4444  	mutex_lock(&scx_ops_enable_mutex);
f0e1a0643a59bf Tejun Heo    2024-06-18  4445  
f0e1a0643a59bf Tejun Heo    2024-06-18  4446  	static_branch_disable(&__scx_switched_all);
f0e1a0643a59bf Tejun Heo    2024-06-18  4447  	WRITE_ONCE(scx_switching_all, false);
f0e1a0643a59bf Tejun Heo    2024-06-18  4448  
f0e1a0643a59bf Tejun Heo    2024-06-18  4449  	/*
160216568cddc9 Tejun Heo    2024-09-27  4450  	 * Shut down cgroup support before tasks so that the cgroup attach path
160216568cddc9 Tejun Heo    2024-09-27  4451  	 * doesn't race against scx_ops_exit_task().
f0e1a0643a59bf Tejun Heo    2024-06-18  4452  	 */
8195136669661f Tejun Heo    2024-09-04  4453  	scx_cgroup_lock();
160216568cddc9 Tejun Heo    2024-09-27  4454  	scx_cgroup_exit();
160216568cddc9 Tejun Heo    2024-09-27  4455  	scx_cgroup_unlock();
f0e1a0643a59bf Tejun Heo    2024-06-18  4456  
f0e1a0643a59bf Tejun Heo    2024-06-18  4457  	/*
61eeb9a90522da Tejun Heo    2024-08-30  4458  	 * The BPF scheduler is going away. All tasks including %TASK_DEAD ones
61eeb9a90522da Tejun Heo    2024-08-30  4459  	 * must be switched out and exited synchronously.
f0e1a0643a59bf Tejun Heo    2024-06-18  4460  	 */
160216568cddc9 Tejun Heo    2024-09-27  4461  	percpu_down_write(&scx_fork_rwsem);
160216568cddc9 Tejun Heo    2024-09-27  4462  
160216568cddc9 Tejun Heo    2024-09-27  4463  	scx_ops_init_task_enabled = false;
160216568cddc9 Tejun Heo    2024-09-27  4464  
160216568cddc9 Tejun Heo    2024-09-27  4465  	spin_lock_irq(&scx_tasks_lock);
160216568cddc9 Tejun Heo    2024-09-27  4466  	scx_task_iter_init(&sti);
a8532fac7b5d27 Tejun Heo    2024-08-30  4467  	while ((p = scx_task_iter_next_locked(&sti))) {
f0e1a0643a59bf Tejun Heo    2024-06-18  4468  		const struct sched_class *old_class = p->sched_class;
f0e1a0643a59bf Tejun Heo    2024-06-18  4469  		struct sched_enq_and_set_ctx ctx;
f0e1a0643a59bf Tejun Heo    2024-06-18  4470  
61eeb9a90522da Tejun Heo    2024-08-30  4471  		sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
f0e1a0643a59bf Tejun Heo    2024-06-18  4472  
f0e1a0643a59bf Tejun Heo    2024-06-18  4473  		p->scx.slice = min_t(u64, p->scx.slice, SCX_SLICE_DFL);
f0e1a0643a59bf Tejun Heo    2024-06-18 @4474  		__setscheduler_prio(p, p->prio);
f0e1a0643a59bf Tejun Heo    2024-06-18  4475  		check_class_changing(task_rq(p), p, old_class);
f0e1a0643a59bf Tejun Heo    2024-06-18  4476  
f0e1a0643a59bf Tejun Heo    2024-06-18  4477  		sched_enq_and_set_task(&ctx);
f0e1a0643a59bf Tejun Heo    2024-06-18  4478  
f0e1a0643a59bf Tejun Heo    2024-06-18  4479  		check_class_changed(task_rq(p), p, old_class, p->prio);
f0e1a0643a59bf Tejun Heo    2024-06-18  4480  		scx_ops_exit_task(p);
f0e1a0643a59bf Tejun Heo    2024-06-18  4481  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  4482  	scx_task_iter_exit(&sti);
f0e1a0643a59bf Tejun Heo    2024-06-18  4483  	spin_unlock_irq(&scx_tasks_lock);
160216568cddc9 Tejun Heo    2024-09-27  4484  	percpu_up_write(&scx_fork_rwsem);
f0e1a0643a59bf Tejun Heo    2024-06-18  4485  
f0e1a0643a59bf Tejun Heo    2024-06-18  4486  	/* no task is on scx, turn off all the switches and flush in-progress calls */
160216568cddc9 Tejun Heo    2024-09-27  4487  	static_branch_disable(&__scx_ops_enabled);
f0e1a0643a59bf Tejun Heo    2024-06-18  4488  	for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
160216568cddc9 Tejun Heo    2024-09-27  4489  		static_branch_disable(&scx_has_op[i]);
160216568cddc9 Tejun Heo    2024-09-27  4490  	static_branch_disable(&scx_ops_enq_last);
160216568cddc9 Tejun Heo    2024-09-27  4491  	static_branch_disable(&scx_ops_enq_exiting);
160216568cddc9 Tejun Heo    2024-09-27  4492  	static_branch_disable(&scx_ops_cpu_preempt);
160216568cddc9 Tejun Heo    2024-09-27  4493  	static_branch_disable(&scx_builtin_idle_enabled);
f0e1a0643a59bf Tejun Heo    2024-06-18  4494  	synchronize_rcu();
f0e1a0643a59bf Tejun Heo    2024-06-18  4495  
f0e1a0643a59bf Tejun Heo    2024-06-18  4496  	if (ei->kind >= SCX_EXIT_ERROR) {
344576fa6a69ce Tejun Heo    2024-08-07  4497  		pr_err("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
344576fa6a69ce Tejun Heo    2024-08-07  4498  		       scx_ops.name, ei->reason);
f0e1a0643a59bf Tejun Heo    2024-06-18  4499  
344576fa6a69ce Tejun Heo    2024-08-07  4500  		if (ei->msg[0] != '\0')
344576fa6a69ce Tejun Heo    2024-08-07  4501  			pr_err("sched_ext: %s: %s\n", scx_ops.name, ei->msg);
62d3726d4cd66f Tejun Heo    2024-09-23  4502  #ifdef CONFIG_STACKTRACE
f0e1a0643a59bf Tejun Heo    2024-06-18  4503  		stack_trace_print(ei->bt, ei->bt_len, 2);
62d3726d4cd66f Tejun Heo    2024-09-23  4504  #endif
344576fa6a69ce Tejun Heo    2024-08-07  4505  	} else {
344576fa6a69ce Tejun Heo    2024-08-07  4506  		pr_info("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
344576fa6a69ce Tejun Heo    2024-08-07  4507  			scx_ops.name, ei->reason);
f0e1a0643a59bf Tejun Heo    2024-06-18  4508  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  4509  
f0e1a0643a59bf Tejun Heo    2024-06-18  4510  	if (scx_ops.exit)
f0e1a0643a59bf Tejun Heo    2024-06-18  4511  		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, ei);
f0e1a0643a59bf Tejun Heo    2024-06-18  4512  
8a010b81b3a50b David Vernet 2024-06-18  4513  	cancel_delayed_work_sync(&scx_watchdog_work);
8a010b81b3a50b David Vernet 2024-06-18  4514  
f0e1a0643a59bf Tejun Heo    2024-06-18  4515  	/*
f0e1a0643a59bf Tejun Heo    2024-06-18  4516  	 * Delete the kobject from the hierarchy eagerly in addition to just
f0e1a0643a59bf Tejun Heo    2024-06-18  4517  	 * dropping a reference. Otherwise, if the object is deleted
f0e1a0643a59bf Tejun Heo    2024-06-18  4518  	 * asynchronously, sysfs could observe an object of the same name still
f0e1a0643a59bf Tejun Heo    2024-06-18  4519  	 * in the hierarchy when another scheduler is loaded.
f0e1a0643a59bf Tejun Heo    2024-06-18  4520  	 */
f0e1a0643a59bf Tejun Heo    2024-06-18  4521  	kobject_del(scx_root_kobj);
f0e1a0643a59bf Tejun Heo    2024-06-18  4522  	kobject_put(scx_root_kobj);
f0e1a0643a59bf Tejun Heo    2024-06-18  4523  	scx_root_kobj = NULL;
f0e1a0643a59bf Tejun Heo    2024-06-18  4524  
f0e1a0643a59bf Tejun Heo    2024-06-18  4525  	memset(&scx_ops, 0, sizeof(scx_ops));
f0e1a0643a59bf Tejun Heo    2024-06-18  4526  
f0e1a0643a59bf Tejun Heo    2024-06-18  4527  	rhashtable_walk_enter(&dsq_hash, &rht_iter);
f0e1a0643a59bf Tejun Heo    2024-06-18  4528  	do {
f0e1a0643a59bf Tejun Heo    2024-06-18  4529  		rhashtable_walk_start(&rht_iter);
f0e1a0643a59bf Tejun Heo    2024-06-18  4530  
f0e1a0643a59bf Tejun Heo    2024-06-18  4531  		while ((dsq = rhashtable_walk_next(&rht_iter)) && !IS_ERR(dsq))
f0e1a0643a59bf Tejun Heo    2024-06-18  4532  			destroy_dsq(dsq->id);
f0e1a0643a59bf Tejun Heo    2024-06-18  4533  
f0e1a0643a59bf Tejun Heo    2024-06-18  4534  		rhashtable_walk_stop(&rht_iter);
f0e1a0643a59bf Tejun Heo    2024-06-18  4535  	} while (dsq == ERR_PTR(-EAGAIN));
f0e1a0643a59bf Tejun Heo    2024-06-18  4536  	rhashtable_walk_exit(&rht_iter);
f0e1a0643a59bf Tejun Heo    2024-06-18  4537  
f0e1a0643a59bf Tejun Heo    2024-06-18  4538  	free_percpu(scx_dsp_ctx);
f0e1a0643a59bf Tejun Heo    2024-06-18  4539  	scx_dsp_ctx = NULL;
f0e1a0643a59bf Tejun Heo    2024-06-18  4540  	scx_dsp_max_batch = 0;
f0e1a0643a59bf Tejun Heo    2024-06-18  4541  
f0e1a0643a59bf Tejun Heo    2024-06-18  4542  	free_exit_info(scx_exit_info);
f0e1a0643a59bf Tejun Heo    2024-06-18  4543  	scx_exit_info = NULL;
f0e1a0643a59bf Tejun Heo    2024-06-18  4544  
f0e1a0643a59bf Tejun Heo    2024-06-18  4545  	mutex_unlock(&scx_ops_enable_mutex);
f0e1a0643a59bf Tejun Heo    2024-06-18  4546  
f0e1a0643a59bf Tejun Heo    2024-06-18  4547  	WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
f0e1a0643a59bf Tejun Heo    2024-06-18  4548  		     SCX_OPS_DISABLING);
f0e1a0643a59bf Tejun Heo    2024-06-18  4549  done:
f0e1a0643a59bf Tejun Heo    2024-06-18  4550  	scx_ops_bypass(false);
f0e1a0643a59bf Tejun Heo    2024-06-18  4551  }
f0e1a0643a59bf Tejun Heo    2024-06-18  4552  

:::::: The code at line 4474 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
