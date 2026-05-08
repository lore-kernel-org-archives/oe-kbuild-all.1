Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249391B81CA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 00:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778199958; cv=none; b=fkOQ2ih4jXqIXM145rWU1kgnU//u0hQG5m/XmQpiextxMCd6jV50GpEewVXp5jZRRTfjD1gho3m3C+3T8Jo3L9aK5o8J10VoWdfOI0iECjzsyg/oL4VrTLZzSAZTeUuDiujyRK48DQD0zvcO5ZRDw7afax54P1CZZMOQWlCPM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778199958; c=relaxed/simple;
	bh=oNzEmy4oFOvsNh0om0q8Favetufl4Hjg1tQhsTFOPUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZL8PCQSYUM880JcNM/ARkvQ1TKuLy/J7swnV/Uy9pvzy1nwHOftRcyD41dRaLCOe9cJHtHG9/uCEA2eGSsu5E75THegTuMKBdr02vgLx4VCLsrpVFuIcbsieIgXIhgbJ90onHUfBMpVnOnNM8VBcJ8qIJIL22s+pbFT8t9sRIbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIh8cX69; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIh8cX69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778199956; x=1809735956;
  h=date:from:to:cc:subject:message-id;
  bh=oNzEmy4oFOvsNh0om0q8Favetufl4Hjg1tQhsTFOPUk=;
  b=MIh8cX69XkPDJ+dTp+dxtI/U8s00iuRdaSLBC/Bzw9PA0LaMZMCCEGr9
   TKRdwU2DZnuodXckDjcsWIo4LygbDiLiCzy5mzjKZ6P0Rtk9QNkUbhOGM
   1DJxWC+l4aWjIs1/QEMACL8dhCi/ByTrGDwib30DgnejZRS4+neopB7QM
   T2dEr7sOMTHfNzz14fuVquXIPXHI1C6UQd0KwOHwrRwR8rz87rHBA5fGJ
   jdEYhhDf8LrPDKP7DNt8a+e4lHRMjj0n1nmA8Du161mPNWvl38i9/BNpn
   DwcXCKlf7gkknPH3JAx7NMS5qxnyos7SSx3gx2FTHrKxlYfLfiq2dXvx9
   w==;
X-CSE-ConnectionGUID: XHXSKBfBSH20DFKO/QKPTg==
X-CSE-MsgGUID: 9U4eOcndTvOm1Rznn/b0sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89862771"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="89862771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 17:25:55 -0700
X-CSE-ConnectionGUID: DVfCo//iTS6aKCkDnhaAKw==
X-CSE-MsgGUID: zUXNHHqWQdSBYblXr47pYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="240606740"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2026 17:25:54 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL92M-000000000dt-3Vsx;
	Fri, 08 May 2026 00:25:50 +0000
Date: Fri, 08 May 2026 08:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:6583:1: warning: label
 'err_free_lb_resched' defined but not used
Message-ID: <202605080821.ftqLNrXX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: d292aa00de1aea72961f94c0db43f6b5c72684c9 sched_ext: Make bypass LB cpumasks per-scheduler
date:   13 days ago
config: powerpc-randconfig-001-20260508 (https://download.01.org/0day-ci/archive/20260508/202605080821.ftqLNrXX-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080821.ftqLNrXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d292aa00de1a ("sched_ext: Make bypass LB cpumasks per-scheduler")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080821.ftqLNrXX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:6369:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    6369 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_alloc_and_add_sched':
>> kernel/sched/ext.c:6583:1: warning: label 'err_free_lb_resched' defined but not used [-Wunused-label]
    6583 | err_free_lb_resched:
         | ^~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c: At top level:
   kernel/sched/ext.c:300:26: warning: 'scx_find_sub_sched' defined but not used [-Wunused-function]
     300 | static struct scx_sched *scx_find_sub_sched(u64 cgroup_id) { return NULL; }
         |                          ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:12:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
      12 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +/err_free_lb_resched +6583 kernel/sched/ext.c

  6432	
  6433	/*
  6434	 * Allocate and initialize a new scx_sched. @cgrp's reference is always
  6435	 * consumed whether the function succeeds or fails.
  6436	 */
  6437	static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops,
  6438							 struct cgroup *cgrp,
  6439							 struct scx_sched *parent)
  6440	{
  6441		struct scx_sched *sch;
  6442		s32 level = parent ? parent->level + 1 : 0;
  6443		s32 node, cpu, ret, bypass_fail_cpu = nr_cpu_ids;
  6444	
  6445		sch = kzalloc_flex(*sch, ancestors, level + 1);
  6446		if (!sch) {
  6447			ret = -ENOMEM;
  6448			goto err_put_cgrp;
  6449		}
  6450	
  6451		sch->exit_info = alloc_exit_info(ops->exit_dump_len);
  6452		if (!sch->exit_info) {
  6453			ret = -ENOMEM;
  6454			goto err_free_sch;
  6455		}
  6456	
  6457		ret = rhashtable_init(&sch->dsq_hash, &dsq_hash_params);
  6458		if (ret < 0)
  6459			goto err_free_ei;
  6460	
  6461		sch->pnode = kzalloc_objs(sch->pnode[0], nr_node_ids);
  6462		if (!sch->pnode) {
  6463			ret = -ENOMEM;
  6464			goto err_free_hash;
  6465		}
  6466	
  6467		for_each_node_state(node, N_POSSIBLE) {
  6468			sch->pnode[node] = alloc_pnode(sch, node);
  6469			if (!sch->pnode[node]) {
  6470				ret = -ENOMEM;
  6471				goto err_free_pnode;
  6472			}
  6473		}
  6474	
  6475		sch->dsp_max_batch = ops->dispatch_max_batch ?: SCX_DSP_DFL_MAX_BATCH;
  6476		sch->pcpu = __alloc_percpu(struct_size_t(struct scx_sched_pcpu,
  6477							 dsp_ctx.buf, sch->dsp_max_batch),
  6478					   __alignof__(struct scx_sched_pcpu));
  6479		if (!sch->pcpu) {
  6480			ret = -ENOMEM;
  6481			goto err_free_pnode;
  6482		}
  6483	
  6484		for_each_possible_cpu(cpu) {
  6485			ret = init_dsq(bypass_dsq(sch, cpu), SCX_DSQ_BYPASS, sch);
  6486			if (ret) {
  6487				bypass_fail_cpu = cpu;
  6488				goto err_free_pcpu;
  6489			}
  6490		}
  6491	
  6492		for_each_possible_cpu(cpu) {
  6493			struct scx_sched_pcpu *pcpu = per_cpu_ptr(sch->pcpu, cpu);
  6494	
  6495			pcpu->sch = sch;
  6496			INIT_LIST_HEAD(&pcpu->deferred_reenq_local.node);
  6497		}
  6498	
  6499		sch->helper = kthread_run_worker(0, "sched_ext_helper");
  6500		if (IS_ERR(sch->helper)) {
  6501			ret = PTR_ERR(sch->helper);
  6502			goto err_free_pcpu;
  6503		}
  6504	
  6505		sched_set_fifo(sch->helper->task);
  6506	
  6507		if (parent)
  6508			memcpy(sch->ancestors, parent->ancestors,
  6509			       level * sizeof(parent->ancestors[0]));
  6510		sch->ancestors[level] = sch;
  6511		sch->level = level;
  6512	
  6513		if (ops->timeout_ms)
  6514			sch->watchdog_timeout = msecs_to_jiffies(ops->timeout_ms);
  6515		else
  6516			sch->watchdog_timeout = SCX_WATCHDOG_MAX_TIMEOUT;
  6517	
  6518		sch->slice_dfl = SCX_SLICE_DFL;
  6519		atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
  6520		init_irq_work(&sch->disable_irq_work, scx_disable_irq_workfn);
  6521		kthread_init_work(&sch->disable_work, scx_disable_workfn);
  6522		timer_setup(&sch->bypass_lb_timer, scx_bypass_lb_timerfn, 0);
  6523	
  6524		if (!alloc_cpumask_var(&sch->bypass_lb_donee_cpumask, GFP_KERNEL)) {
  6525			ret = -ENOMEM;
  6526			goto err_stop_helper;
  6527		}
  6528		if (!alloc_cpumask_var(&sch->bypass_lb_resched_cpumask, GFP_KERNEL)) {
  6529			ret = -ENOMEM;
  6530			goto err_free_lb_cpumask;
  6531		}
  6532		sch->ops = *ops;
  6533		rcu_assign_pointer(ops->priv, sch);
  6534	
  6535		sch->kobj.kset = scx_kset;
  6536	
  6537	#ifdef CONFIG_EXT_SUB_SCHED
  6538		char *buf = kzalloc(PATH_MAX, GFP_KERNEL);
  6539		if (!buf) {
  6540			ret = -ENOMEM;
  6541			goto err_free_lb_resched;
  6542		}
  6543		cgroup_path(cgrp, buf, PATH_MAX);
  6544		sch->cgrp_path = kstrdup(buf, GFP_KERNEL);
  6545		kfree(buf);
  6546		if (!sch->cgrp_path) {
  6547			ret = -ENOMEM;
  6548			goto err_free_lb_resched;
  6549		}
  6550	
  6551		sch->cgrp = cgrp;
  6552		INIT_LIST_HEAD(&sch->children);
  6553		INIT_LIST_HEAD(&sch->sibling);
  6554	
  6555		if (parent)
  6556			ret = kobject_init_and_add(&sch->kobj, &scx_ktype,
  6557						   &parent->sub_kset->kobj,
  6558						   "sub-%llu", cgroup_id(cgrp));
  6559		else
  6560			ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
  6561	
  6562		if (ret < 0) {
  6563			kobject_put(&sch->kobj);
  6564			return ERR_PTR(ret);
  6565		}
  6566	
  6567		if (ops->sub_attach) {
  6568			sch->sub_kset = kset_create_and_add("sub", NULL, &sch->kobj);
  6569			if (!sch->sub_kset) {
  6570				kobject_put(&sch->kobj);
  6571				return ERR_PTR(-ENOMEM);
  6572			}
  6573		}
  6574	#else	/* CONFIG_EXT_SUB_SCHED */
  6575		ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
  6576		if (ret < 0) {
  6577			kobject_put(&sch->kobj);
  6578			return ERR_PTR(ret);
  6579		}
  6580	#endif	/* CONFIG_EXT_SUB_SCHED */
  6581		return sch;
  6582	
> 6583	err_free_lb_resched:
  6584		free_cpumask_var(sch->bypass_lb_resched_cpumask);
  6585	err_free_lb_cpumask:
  6586		free_cpumask_var(sch->bypass_lb_donee_cpumask);
  6587	err_stop_helper:
  6588		kthread_destroy_worker(sch->helper);
  6589	err_free_pcpu:
  6590		for_each_possible_cpu(cpu) {
  6591			if (cpu == bypass_fail_cpu)
  6592				break;
  6593			exit_dsq(bypass_dsq(sch, cpu));
  6594		}
  6595		free_percpu(sch->pcpu);
  6596	err_free_pnode:
  6597		for_each_node_state(node, N_POSSIBLE)
  6598			free_pnode(sch->pnode[node]);
  6599		kfree(sch->pnode);
  6600	err_free_hash:
  6601		rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
  6602	err_free_ei:
  6603		free_exit_info(sch->exit_info);
  6604	err_free_sch:
  6605		kfree(sch);
  6606	err_put_cgrp:
  6607	#if defined(CONFIG_EXT_GROUP_SCHED) || defined(CONFIG_EXT_SUB_SCHED)
  6608		cgroup_put(cgrp);
  6609	#endif
  6610		return ERR_PTR(ret);
  6611	}
  6612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
