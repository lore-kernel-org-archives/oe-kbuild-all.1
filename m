Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CCC136A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708221998; cv=none; b=Nzbsn+mCGC3rwRO5prXuRIvsTcbXdB634c+8rhlyf5ORecXCNBEp+Bbkxog5G/Fp459x2tRh+z5HospZvlcO0NS4o54vaJr/75FGOJdoO7hZvUGqUdGQZC2xCJOAAstzofN4ZcP4EvnhPTpJGD4lka2arcDP0F3lXyqKXYjlqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708221998; c=relaxed/simple;
	bh=fD9p/BVXtnST5qbM7zJp3FZZ0r2BJ98IxJH8J/TskVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZI2hmPo78rt65DUCbgZBbEcGHRoAU2PMHPV03kVzi7hODMYMiGDbkPUQQ8p4zQIxiYfSazyRZn0QA+D3RSnHkirK70utetC/T5dE+05shePbEynyXiJmP9B6pedf0ZP7GdXTZxJukNjIgs9ZJw4t/u7J1+5mb+F69WG3+0ktF7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHpzhZX7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHpzhZX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708221997; x=1739757997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fD9p/BVXtnST5qbM7zJp3FZZ0r2BJ98IxJH8J/TskVU=;
  b=FHpzhZX7Z+JOXTvXAotNBVajESrcnmm8fSDuBiBjxGd22mbLh+mwX6O6
   PZi95WPYLtMnTRAh+6prjPySbudVM5JDuFCOSxgqE0zhf4jfGJZQoTZ8m
   eD8EpLUP9wyuKJ93oG8pnJItQ3F1sWS+4SKHahgiL5cvo5nTb1exj/mM+
   kY+pBorxYRuKHb85cE0EUtwRirI44RaJImkOdR1XJloAnKVA2CI9nT79U
   Xr31qsZgK0+u8F4Nza0IsiRsm+4qXfKvvjq2oZBFiG7b/ut1cEu1gx+Gl
   V+98++5tgfJVCEUsEC3kt2MSoXy7YrSZEHvIhlHhtJInCWuC3ewhP/Clk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2189178"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2189178"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 18:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4540199"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2024 18:06:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbWZb-0002hK-0o;
	Sun, 18 Feb 2024 02:06:31 +0000
Date: Sun, 18 Feb 2024 10:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 16/60] kernel/sched/fair_eevdf.c:2561:13:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202402180928.JeHg8rIJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   9af710afc434138601a0fe61195e4b193ca6a931
commit: e865e3abb45cea830f107c69a227ed07b28c0b43 [16/60] CHROMIUM: sched/eevdf: Adding fair_eevdf.c
config: x86_64-randconfig-122-20240218 (https://download.01.org/0day-ci/archive/20240218/202402180928.JeHg8rIJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180928.JeHg8rIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180928.JeHg8rIJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair_eevdf.c:869:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:869:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:869:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:905:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:905:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair_eevdf.c:905:34: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair_eevdf.c:2561:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:2561:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair_eevdf.c:2561:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:11417:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11417:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11417:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:6025:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:6026:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:7081:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7081:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:7081:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7262:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair_eevdf.c:7262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7452:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7452:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7452:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:7750:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7750:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7750:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:8801:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair_eevdf.c:8801:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair_eevdf.c:8801:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair_eevdf.c:9343:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair_eevdf.c:9343:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:9343:22: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:10706:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10706:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:10706:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:10364:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10364:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair_eevdf.c:10364:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:10802:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10802:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:10802:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:5694:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c: note: in included file:
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *

vim +2561 kernel/sched/fair_eevdf.c

  2524	
  2525	static void task_numa_group(struct task_struct *p, int cpupid, int flags,
  2526				int *priv)
  2527	{
  2528		struct numa_group *grp, *my_grp;
  2529		struct task_struct *tsk;
  2530		bool join = false;
  2531		int cpu = cpupid_to_cpu(cpupid);
  2532		int i;
  2533	
  2534		if (unlikely(!deref_curr_numa_group(p))) {
  2535			unsigned int size = sizeof(struct numa_group) +
  2536					    4*nr_node_ids*sizeof(unsigned long);
  2537	
  2538			grp = kzalloc(size, GFP_KERNEL | __GFP_NOWARN);
  2539			if (!grp)
  2540				return;
  2541	
  2542			refcount_set(&grp->refcount, 1);
  2543			grp->active_nodes = 1;
  2544			grp->max_faults_cpu = 0;
  2545			spin_lock_init(&grp->lock);
  2546			grp->gid = p->pid;
  2547			/* Second half of the array tracks nids where faults happen */
  2548			grp->faults_cpu = grp->faults + NR_NUMA_HINT_FAULT_TYPES *
  2549							nr_node_ids;
  2550	
  2551			for (i = 0; i < NR_NUMA_HINT_FAULT_STATS * nr_node_ids; i++)
  2552				grp->faults[i] = p->numa_faults[i];
  2553	
  2554			grp->total_faults = p->total_numa_faults;
  2555	
  2556			grp->nr_tasks++;
  2557			rcu_assign_pointer(p->numa_group, grp);
  2558		}
  2559	
  2560		rcu_read_lock();
> 2561		tsk = READ_ONCE(cpu_rq(cpu)->curr);
  2562	
  2563		if (!cpupid_match_pid(tsk, cpupid))
  2564			goto no_join;
  2565	
  2566		grp = rcu_dereference(tsk->numa_group);
  2567		if (!grp)
  2568			goto no_join;
  2569	
  2570		my_grp = deref_curr_numa_group(p);
  2571		if (grp == my_grp)
  2572			goto no_join;
  2573	
  2574		/*
  2575		 * Only join the other group if its bigger; if we're the bigger group,
  2576		 * the other task will join us.
  2577		 */
  2578		if (my_grp->nr_tasks > grp->nr_tasks)
  2579			goto no_join;
  2580	
  2581		/*
  2582		 * Tie-break on the grp address.
  2583		 */
  2584		if (my_grp->nr_tasks == grp->nr_tasks && my_grp > grp)
  2585			goto no_join;
  2586	
  2587		/* Always join threads in the same process. */
  2588		if (tsk->mm == current->mm)
  2589			join = true;
  2590	
  2591		/* Simple filter to avoid false positives due to PID collisions */
  2592		if (flags & TNF_SHARED)
  2593			join = true;
  2594	
  2595		/* Update priv based on whether false sharing was detected */
  2596		*priv = !join;
  2597	
  2598		if (join && !get_numa_group(grp))
  2599			goto no_join;
  2600	
  2601		rcu_read_unlock();
  2602	
  2603		if (!join)
  2604			return;
  2605	
  2606		BUG_ON(irqs_disabled());
  2607		double_lock_irq(&my_grp->lock, &grp->lock);
  2608	
  2609		for (i = 0; i < NR_NUMA_HINT_FAULT_STATS * nr_node_ids; i++) {
  2610			my_grp->faults[i] -= p->numa_faults[i];
  2611			grp->faults[i] += p->numa_faults[i];
  2612		}
  2613		my_grp->total_faults -= p->total_numa_faults;
  2614		grp->total_faults += p->total_numa_faults;
  2615	
  2616		my_grp->nr_tasks--;
  2617		grp->nr_tasks++;
  2618	
  2619		spin_unlock(&my_grp->lock);
  2620		spin_unlock_irq(&grp->lock);
  2621	
  2622		rcu_assign_pointer(p->numa_group, grp);
  2623	
  2624		put_numa_group(my_grp);
  2625		return;
  2626	
  2627	no_join:
  2628		rcu_read_unlock();
  2629		return;
  2630	}
  2631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
