Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5FB1B59B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708774138; cv=none; b=WS94gHdrKcHKUcBU+W9Szd7PLX2BU9kfuM405yxx/CD7mTTGqDFXrwbTlNKnM3YNBfgub7uVj3gXYa+SH+jnGyOghRTGiyqIpL3GUvbbfew3zFluF3Y+mBQ54vlOM1QfDY67uczNdscPCymYl+C1pRcofQ/IwYnZ0AtP35tdf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708774138; c=relaxed/simple;
	bh=QL2PZrth3c754n6H+xNyMiN/QPg1Kqur44HB0jbghwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djwmm9KnkCQPm51eRqLhlWr+6y6gCDGl0pU1biThKE0SJ7ME4KtyNvG4TaugAiFQnF552tYP9/KZSnQOTyK/265YtBdVl4Cp1fpTB/P5nEMBd7yi+tRHsZe1zo7TKGZOU43h0ZBt6EfyYjYlctQmqmIZokCunm+RY1JWGFtiVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJyp+y6R; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJyp+y6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708774136; x=1740310136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QL2PZrth3c754n6H+xNyMiN/QPg1Kqur44HB0jbghwo=;
  b=KJyp+y6RZ9Ryf8tzWhW5RYabYZjj2oyx4CPo5bGGUf3A6VcsDOzXk7W3
   99PfN4U1b9Rg9nuJHqPcS4/Y1Sz8eg0WjSDFtKJdcKfgxCUAw8BLXDhsT
   wDqUhSoc6ErO/lop11Nsurm1fhfYBXAUJpFxjBdVFbJnXEy+WH4jUldJE
   XQO3wtBFycrlW0MKlzt+fKukPfnP5iYnsYij2AGrVa8U2zCxsruL4p4EQ
   59RH2jxZlHBLrGtoudoWOGr356amGGFni4h9jQ15B54BBs0kMCfHPlyfL
   jfjLbdpizCs8TXL8kA95fR7myRRdRbXH6epyAO58ErXZUZm2FLivb5Azn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20647068"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20647068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10855824"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Feb 2024 03:28:54 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqD0-0008Ua-10;
	Sat, 24 Feb 2024 11:28:50 +0000
Date: Sat, 24 Feb 2024 19:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/88] kernel/sched/fair_eevdf.c:12889:1:
 sparse: sparse: symbol '__pcpu_scope_eevdf_switch_tasks' was not declared.
 Should it be static?
Message-ID: <202402241915.2LkA2lM3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   d7ab448d89bd5d3326425d135ea793c6351ebc05
commit: 33508a693bdea05c8d33b4b664c19ce2886b8033 [34/88] CHROMIUM: sched: dynamically switch between cfs and eevdf
config: x86_64-randconfig-123-20240218 (https://download.01.org/0day-ci/archive/20240224/202402241915.2LkA2lM3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241915.2LkA2lM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241915.2LkA2lM3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair_eevdf.c:28:5: sparse: sparse: symbol 'sysctl_sched_use_eevdf' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:708:6: sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:1268:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:1268:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:1268:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:1305:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:1305:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair_eevdf.c:1305:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair_eevdf.c:11975:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11975:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11975:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:6309:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:6309:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:6309:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:6569:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:6570:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:7625:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7625:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:7625:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7806:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7806:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair_eevdf.c:7806:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7996:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7996:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7996:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:8304:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:8304:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:8304:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:9359:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair_eevdf.c:9359:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair_eevdf.c:9359:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair_eevdf.c:9901:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair_eevdf.c:9901:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:9901:22: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:11264:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11264:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11264:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:10922:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10922:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair_eevdf.c:10922:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:11360:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11360:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11360:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair_eevdf.c:12889:1: sparse: sparse: symbol '__pcpu_scope_eevdf_switch_tasks' was not declared. Should it be static?
>> kernel/sched/fair_eevdf.c:12894:5: sparse: sparse: symbol 'scheduler_switch_eevdf' was not declared. Should it be static?
>> kernel/sched/fair_eevdf.c:12955:5: sparse: sparse: symbol 'sched_use_eevdf' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:6235:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c: note: in included file:
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:12892:32: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c:12891:32: sparse: sparse: marked inline, but without a definition

vim +/__pcpu_scope_eevdf_switch_tasks +12889 kernel/sched/fair_eevdf.c

 12888	
 12889	DEFINE_PER_CPU(struct list_head, eevdf_switch_tasks);
 12890	
 12891	extern inline void enqueue_task(struct rq *rq, struct task_struct *p, int flags);
 12892	extern inline void dequeue_task(struct rq *rq, struct task_struct *p, int flags);
 12893	
 12894	int scheduler_switch_eevdf(void *arg)
 12895	{
 12896		unsigned int use_eevdf = (unsigned int)((size_t) arg);
 12897		int cpu;
 12898		struct task_struct *p;
 12899		struct rq *rq;
 12900		int num_deq;
 12901		struct list_head* cpu_list;
 12902		struct list_head* cfs_tasks;
 12903		struct rq_flags rf;
 12904	
 12905		// 1. Remove all the scheduling entities from all rq.
 12906		// 2. Change the use_eevdf rq flags.
 12907		// 3. Add all the entities removed back to the rqs.
 12908		lockdep_assert_irqs_disabled();
 12909	
 12910		if (use_eevdf == sysctl_sched_use_eevdf)
 12911			return 0;
 12912	
 12913		// Dequeue all the tasks
 12914		for_each_cpu(cpu, cpu_possible_mask) {
 12915			num_deq = 0;
 12916			cpu_list = &per_cpu(eevdf_switch_tasks, (cpu));
 12917	
 12918			INIT_LIST_HEAD(cpu_list);
 12919			// Since this is running in a stop_machine we don't need to take the
 12920			// lock, but to make lockdep_asserts happy.
 12921			rq = cpu_rq(cpu);
 12922			rq_lock(rq, &rf);
 12923			cfs_tasks = &rq->cfs_tasks;
 12924			while(!list_empty(cfs_tasks)) {
 12925				p = list_first_entry(cfs_tasks, struct task_struct, se.group_node);
 12926				num_deq++;
 12927				dequeue_task(rq, p, DEQUEUE_SAVE);
 12928				list_add(&p->se.group_node, cpu_list);
 12929			}
 12930			if (rb_first_cached(&rq->cfs.tasks_timeline) || rq->cfs.nr_running)
 12931				pr_err("unexpected tasks on rq: num_deq=%d, cfs_rq->nr_running=%d\n",
 12932						num_deq, rq->cfs.nr_running);
 12933			rq_unlock(rq, &rf);
 12934		}
 12935	
 12936		// Switch the EEVDF flag
 12937		sysctl_sched_use_eevdf = use_eevdf;
 12938	
 12939		// Enqueue all the taks back into the rqs
 12940		for_each_cpu(cpu, cpu_possible_mask) {
 12941			cpu_list = &per_cpu(eevdf_switch_tasks, (cpu));
 12942			rq = cpu_rq(cpu);
 12943			rq_lock(rq, &rf);
 12944			while(!list_empty(cpu_list)) {
 12945				p = list_first_entry(cpu_list, struct task_struct, se.group_node);
 12946				list_del(&p->se.group_node);
 12947				enqueue_task(rq, p, ENQUEUE_RESTORE);
 12948			}
 12949			rq_unlock(rq, &rf);
 12950		}
 12951	
 12952		return 0;
 12953	}
 12954	
 12955	int sched_use_eevdf(struct ctl_table *table, int write,
 12956				  void *buffer, size_t *lenp, loff_t *ppos)
 12957	{
 12958		struct ctl_table t;
 12959		int err;
 12960		unsigned int state = sysctl_sched_use_eevdf;
 12961	
 12962		t = *table;
 12963		t.data = &state;
 12964		err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
 12965		if (err < 0)
 12966			return err;
 12967	
 12968		if (write)
 12969			stop_machine_cpuslocked(
 12970				scheduler_switch_eevdf, (void *)((size_t)state), NULL);
 12971	
 12972		return err;
 12973	}
 12974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
