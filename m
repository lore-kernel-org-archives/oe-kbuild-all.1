Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10422D4D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 22:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763247126; cv=none; b=dDo6loDjw3KSc5RLexqVVAhIEqJq6Tz+YQ/+sOKFonAsBi9jgsRXCDmg0WnUZtW/Wiy35SstUrs/7bS0N26R2gagifnTtvyVNwodfZoZ2YB7dqrJ1zYrWkXGz1eTcKGURmw2xN5Jgdy4g2qY4g3Xi8YZb6q70JnlRi0rbrLpKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763247126; c=relaxed/simple;
	bh=DglDXmZ6tb3zRsqYSWcXStf8HnMX1vGlcziuknNa4/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENLJrp87pi9yg6/xGfLrgOLuht/vto4jtwtTnxZbJzvz9eqAITedXnBRPtvTVUsrb/INNd1gCIhJ6N0z3J8Du4G1JK3Mq2fymrQcyuIc4+grq7/sl2ETURle0R/xipwSfspgzGPEpkuuClQrED3ZupE6kwn/vLhXCitTdsCgwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fat66O2c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fat66O2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763247124; x=1794783124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DglDXmZ6tb3zRsqYSWcXStf8HnMX1vGlcziuknNa4/Y=;
  b=Fat66O2cDHoYv/khh7CYfGTo1raT67iMGjPvYgMM7dRRG30QpymPeY4a
   2sslQ+n5Gidq4/BQQ0d7WEbu4697k4CfDAGhi7D1zEejIXH9LOrAUixwf
   9IAtBly4RPecFZ+EqbZzypeGIxIhSUCNch4fBI8j4/Th65VPLPvhMMYMh
   pbOk8fZjKiFiWzAYEjhMHvfTSIcBMEOxYaFsT6+ju1g0TkYNoxONpLbWn
   h/duTouyU1RVqYiwO8X5q8qOLgG5Yy7IMKUXFZTnZL03PDlopTAShkwQ3
   KBls4dQLPqB+/GPadQu1x2uKpckVAlFU6xuzPmJcPhY23hhpMYP2SZRR1
   g==;
X-CSE-ConnectionGUID: pcDYMJjlQYyX06x1iZ7Zag==
X-CSE-MsgGUID: NN8UUxsFS1qAuK/sxVc0+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76649736"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="76649736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 14:52:03 -0800
X-CSE-ConnectionGUID: IGEybyxfTZqtampxMNJk9w==
X-CSE-MsgGUID: 51pLvyvhQSWsXNbNTc/NNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="194427969"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Nov 2025 14:52:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKP7e-0008Jf-0l;
	Sat, 15 Nov 2025 22:51:58 +0000
Date: Sun, 16 Nov 2025 06:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [tip:sched/core 11/19] kernel/sched/fair.c:11736:73: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202511160608.dqVtgcXd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   7c983640e4db0c1fd8ce6c6cd921c19954a8d479
commit: 2265c5d4deeff3bfe4580d9ffe718fd80a414cac [11/19] sched/fair: Skip sched_balance_running cmpxchg when balance is not due
config: sparc64-randconfig-r134-20251116 (https://download.01.org/0day-ci/archive/20251116/202511160608.dqVtgcXd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160608.dqVtgcXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160608.dqVtgcXd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1141:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1141:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1141:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1175:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1175:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1175:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1231:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1231:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1231:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12798:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12798:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12798:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8347:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8347:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8347:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8551:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8551:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8551:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8684:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8684:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8684:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8716:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8716:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8716:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8933:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8933:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8933:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9969:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9969:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9969:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10597:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10597:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10597:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12068:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12068:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12068:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11707:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11707:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11707:44: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:11736:73: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/fair.c:12168:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12168:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12168:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6679:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2627:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2627:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2627:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2294:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2283:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2283:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2283:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2294:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2294:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2294:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2294:26: sparse:    struct task_struct *

vim +11736 kernel/sched/fair.c

 11697	
 11698	/*
 11699	 * Check this_cpu to ensure it is balanced within domain. Attempt to move
 11700	 * tasks if there is an imbalance.
 11701	 */
 11702	static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 11703				struct sched_domain *sd, enum cpu_idle_type idle,
 11704				int *continue_balancing)
 11705	{
 11706		int ld_moved, cur_ld_moved, active_balance = 0;
 11707		struct sched_domain *sd_parent = sd->parent;
 11708		struct sched_group *group;
 11709		struct rq *busiest;
 11710		struct rq_flags rf;
 11711		struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
 11712		struct lb_env env = {
 11713			.sd		= sd,
 11714			.dst_cpu	= this_cpu,
 11715			.dst_rq		= this_rq,
 11716			.dst_grpmask    = group_balance_mask(sd->groups),
 11717			.idle		= idle,
 11718			.loop_break	= SCHED_NR_MIGRATE_BREAK,
 11719			.cpus		= cpus,
 11720			.fbq_type	= all,
 11721			.tasks		= LIST_HEAD_INIT(env.tasks),
 11722		};
 11723		bool need_unlock = false;
 11724	
 11725		cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 11726	
 11727		schedstat_inc(sd->lb_count[idle]);
 11728	
 11729	redo:
 11730		if (!should_we_balance(&env)) {
 11731			*continue_balancing = 0;
 11732			goto out_balanced;
 11733		}
 11734	
 11735		if (!need_unlock && (sd->flags & SD_SERIALIZE) && idle != CPU_NEWLY_IDLE) {
 11736			if (!atomic_try_cmpxchg_acquire(&sched_balance_running, 0, 1))
 11737				goto out_balanced;
 11738	
 11739			need_unlock = true;
 11740		}
 11741	
 11742		group = sched_balance_find_src_group(&env);
 11743		if (!group) {
 11744			schedstat_inc(sd->lb_nobusyg[idle]);
 11745			goto out_balanced;
 11746		}
 11747	
 11748		busiest = sched_balance_find_src_rq(&env, group);
 11749		if (!busiest) {
 11750			schedstat_inc(sd->lb_nobusyq[idle]);
 11751			goto out_balanced;
 11752		}
 11753	
 11754		WARN_ON_ONCE(busiest == env.dst_rq);
 11755	
 11756		update_lb_imbalance_stat(&env, sd, idle);
 11757	
 11758		env.src_cpu = busiest->cpu;
 11759		env.src_rq = busiest;
 11760	
 11761		ld_moved = 0;
 11762		/* Clear this flag as soon as we find a pullable task */
 11763		env.flags |= LBF_ALL_PINNED;
 11764		if (busiest->nr_running > 1) {
 11765			/*
 11766			 * Attempt to move tasks. If sched_balance_find_src_group has found
 11767			 * an imbalance but busiest->nr_running <= 1, the group is
 11768			 * still unbalanced. ld_moved simply stays zero, so it is
 11769			 * correctly treated as an imbalance.
 11770			 */
 11771			env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
 11772	
 11773	more_balance:
 11774			rq_lock_irqsave(busiest, &rf);
 11775			update_rq_clock(busiest);
 11776	
 11777			/*
 11778			 * cur_ld_moved - load moved in current iteration
 11779			 * ld_moved     - cumulative load moved across iterations
 11780			 */
 11781			cur_ld_moved = detach_tasks(&env);
 11782	
 11783			/*
 11784			 * We've detached some tasks from busiest_rq. Every
 11785			 * task is masked "TASK_ON_RQ_MIGRATING", so we can safely
 11786			 * unlock busiest->lock, and we are able to be sure
 11787			 * that nobody can manipulate the tasks in parallel.
 11788			 * See task_rq_lock() family for the details.
 11789			 */
 11790	
 11791			rq_unlock(busiest, &rf);
 11792	
 11793			if (cur_ld_moved) {
 11794				attach_tasks(&env);
 11795				ld_moved += cur_ld_moved;
 11796			}
 11797	
 11798			local_irq_restore(rf.flags);
 11799	
 11800			if (env.flags & LBF_NEED_BREAK) {
 11801				env.flags &= ~LBF_NEED_BREAK;
 11802				goto more_balance;
 11803			}
 11804	
 11805			/*
 11806			 * Revisit (affine) tasks on src_cpu that couldn't be moved to
 11807			 * us and move them to an alternate dst_cpu in our sched_group
 11808			 * where they can run. The upper limit on how many times we
 11809			 * iterate on same src_cpu is dependent on number of CPUs in our
 11810			 * sched_group.
 11811			 *
 11812			 * This changes load balance semantics a bit on who can move
 11813			 * load to a given_cpu. In addition to the given_cpu itself
 11814			 * (or a ilb_cpu acting on its behalf where given_cpu is
 11815			 * nohz-idle), we now have balance_cpu in a position to move
 11816			 * load to given_cpu. In rare situations, this may cause
 11817			 * conflicts (balance_cpu and given_cpu/ilb_cpu deciding
 11818			 * _independently_ and at _same_ time to move some load to
 11819			 * given_cpu) causing excess load to be moved to given_cpu.
 11820			 * This however should not happen so much in practice and
 11821			 * moreover subsequent load balance cycles should correct the
 11822			 * excess load moved.
 11823			 */
 11824			if ((env.flags & LBF_DST_PINNED) && env.imbalance > 0) {
 11825	
 11826				/* Prevent to re-select dst_cpu via env's CPUs */
 11827				__cpumask_clear_cpu(env.dst_cpu, env.cpus);
 11828	
 11829				env.dst_rq	 = cpu_rq(env.new_dst_cpu);
 11830				env.dst_cpu	 = env.new_dst_cpu;
 11831				env.flags	&= ~LBF_DST_PINNED;
 11832				env.loop	 = 0;
 11833				env.loop_break	 = SCHED_NR_MIGRATE_BREAK;
 11834	
 11835				/*
 11836				 * Go back to "more_balance" rather than "redo" since we
 11837				 * need to continue with same src_cpu.
 11838				 */
 11839				goto more_balance;
 11840			}
 11841	
 11842			/*
 11843			 * We failed to reach balance because of affinity.
 11844			 */
 11845			if (sd_parent) {
 11846				int *group_imbalance = &sd_parent->groups->sgc->imbalance;
 11847	
 11848				if ((env.flags & LBF_SOME_PINNED) && env.imbalance > 0)
 11849					*group_imbalance = 1;
 11850			}
 11851	
 11852			/* All tasks on this runqueue were pinned by CPU affinity */
 11853			if (unlikely(env.flags & LBF_ALL_PINNED)) {
 11854				__cpumask_clear_cpu(cpu_of(busiest), cpus);
 11855				/*
 11856				 * Attempting to continue load balancing at the current
 11857				 * sched_domain level only makes sense if there are
 11858				 * active CPUs remaining as possible busiest CPUs to
 11859				 * pull load from which are not contained within the
 11860				 * destination group that is receiving any migrated
 11861				 * load.
 11862				 */
 11863				if (!cpumask_subset(cpus, env.dst_grpmask)) {
 11864					env.loop = 0;
 11865					env.loop_break = SCHED_NR_MIGRATE_BREAK;
 11866					goto redo;
 11867				}
 11868				goto out_all_pinned;
 11869			}
 11870		}
 11871	
 11872		if (!ld_moved) {
 11873			schedstat_inc(sd->lb_failed[idle]);
 11874			/*
 11875			 * Increment the failure counter only on periodic balance.
 11876			 * We do not want newidle balance, which can be very
 11877			 * frequent, pollute the failure counter causing
 11878			 * excessive cache_hot migrations and active balances.
 11879			 *
 11880			 * Similarly for migration_misfit which is not related to
 11881			 * load/util migration, don't pollute nr_balance_failed.
 11882			 */
 11883			if (idle != CPU_NEWLY_IDLE &&
 11884			    env.migration_type != migrate_misfit)
 11885				sd->nr_balance_failed++;
 11886	
 11887			if (need_active_balance(&env)) {
 11888				unsigned long flags;
 11889	
 11890				raw_spin_rq_lock_irqsave(busiest, flags);
 11891	
 11892				/*
 11893				 * Don't kick the active_load_balance_cpu_stop,
 11894				 * if the curr task on busiest CPU can't be
 11895				 * moved to this_cpu:
 11896				 */
 11897				if (!cpumask_test_cpu(this_cpu, busiest->curr->cpus_ptr)) {
 11898					raw_spin_rq_unlock_irqrestore(busiest, flags);
 11899					goto out_one_pinned;
 11900				}
 11901	
 11902				/* Record that we found at least one task that could run on this_cpu */
 11903				env.flags &= ~LBF_ALL_PINNED;
 11904	
 11905				/*
 11906				 * ->active_balance synchronizes accesses to
 11907				 * ->active_balance_work.  Once set, it's cleared
 11908				 * only after active load balance is finished.
 11909				 */
 11910				if (!busiest->active_balance) {
 11911					busiest->active_balance = 1;
 11912					busiest->push_cpu = this_cpu;
 11913					active_balance = 1;
 11914				}
 11915	
 11916				preempt_disable();
 11917				raw_spin_rq_unlock_irqrestore(busiest, flags);
 11918				if (active_balance) {
 11919					stop_one_cpu_nowait(cpu_of(busiest),
 11920						active_load_balance_cpu_stop, busiest,
 11921						&busiest->active_balance_work);
 11922				}
 11923				preempt_enable();
 11924			}
 11925		} else {
 11926			sd->nr_balance_failed = 0;
 11927		}
 11928	
 11929		if (likely(!active_balance) || need_active_balance(&env)) {
 11930			/* We were unbalanced, so reset the balancing interval */
 11931			sd->balance_interval = sd->min_interval;
 11932		}
 11933	
 11934		goto out;
 11935	
 11936	out_balanced:
 11937		/*
 11938		 * We reach balance although we may have faced some affinity
 11939		 * constraints. Clear the imbalance flag only if other tasks got
 11940		 * a chance to move and fix the imbalance.
 11941		 */
 11942		if (sd_parent && !(env.flags & LBF_ALL_PINNED)) {
 11943			int *group_imbalance = &sd_parent->groups->sgc->imbalance;
 11944	
 11945			if (*group_imbalance)
 11946				*group_imbalance = 0;
 11947		}
 11948	
 11949	out_all_pinned:
 11950		/*
 11951		 * We reach balance because all tasks are pinned at this level so
 11952		 * we can't migrate them. Let the imbalance flag set so parent level
 11953		 * can try to migrate them.
 11954		 */
 11955		schedstat_inc(sd->lb_balanced[idle]);
 11956	
 11957		sd->nr_balance_failed = 0;
 11958	
 11959	out_one_pinned:
 11960		ld_moved = 0;
 11961	
 11962		/*
 11963		 * sched_balance_newidle() disregards balance intervals, so we could
 11964		 * repeatedly reach this code, which would lead to balance_interval
 11965		 * skyrocketing in a short amount of time. Skip the balance_interval
 11966		 * increase logic to avoid that.
 11967		 *
 11968		 * Similarly misfit migration which is not necessarily an indication of
 11969		 * the system being busy and requires lb to backoff to let it settle
 11970		 * down.
 11971		 */
 11972		if (env.idle == CPU_NEWLY_IDLE ||
 11973		    env.migration_type == migrate_misfit)
 11974			goto out;
 11975	
 11976		/* tune up the balancing interval */
 11977		if ((env.flags & LBF_ALL_PINNED &&
 11978		     sd->balance_interval < MAX_PINNED_INTERVAL) ||
 11979		    sd->balance_interval < sd->max_interval)
 11980			sd->balance_interval *= 2;
 11981	out:
 11982		if (need_unlock)
 11983			atomic_set_release(&sched_balance_running, 0);
 11984	
 11985		return ld_moved;
 11986	}
 11987	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
