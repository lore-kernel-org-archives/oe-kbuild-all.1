Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0B539341A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 22:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769122480; cv=none; b=EXTek14d3zGB6hCkCWvwN9F9obnMJHy0SXxLERUYCgiFD9ynsITmWD0lO0G5H+X3OUHxPlTIqUhLqIWSFftk1v1ETzkCE11Dj1NkfWyEa9+72ZtznqeErBm+fNJPXdYdaEVEVIgSnvXth81XXFuEAcDfOEvLV+1iFQwfXI4neAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769122480; c=relaxed/simple;
	bh=okAL0P90WtkCTGV6dZFe3k9+l7JnC/YdAQOvZCFuFIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJyNKDlkoDx3jAEv7V6v9zPdCN3AzqNwr2HFtH0fuaN+SIQ+Bvtky9Jl3AoQtlz0ukBcHeDi3DRkMvKEjftMi4Y2E9m4/yy8bpozs49Al41Q+1Wmfj3MNq/ZpUGZlXq7YqaGqLqfm3QIXeB+gzLFhNcY2k/mGE8ifsqwjyPPF58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBjJS1Ef; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBjJS1Ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769122471; x=1800658471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=okAL0P90WtkCTGV6dZFe3k9+l7JnC/YdAQOvZCFuFIk=;
  b=jBjJS1EfL2G1S3O+VlGz6ijWwNgeDQTghbxgeMdcx/L/J/c3+SGjndEa
   c9M8JWaUBfZSULo/dW9pIWJy/jH4sQshJlWyYBmPzIX95wLp00i59Uciz
   PHy2YepeK3nRhXfX8bpQcyWpxIQrcMs4rZNzuADd+3GZTLbStRCJ9o6K7
   HVgRwmFQg65+tLR31E3SFCU1XkqQMb4NJYpt/lJWsnGibXyfU4GKZiVEw
   TY5jcJgUwABOLgZb4AsFVmyJKt0gZ1f63NFRkZKF4q48rbUAt5AU1NrYB
   Fg5gnBRmWRVnGQACtqemQJhbxudxvtflZhnn62QyKBpo5DC9Gf8aQ/sAl
   Q==;
X-CSE-ConnectionGUID: GK6fH2LwSmqmdsCs4IArvg==
X-CSE-MsgGUID: 8VmMJa9LQsK4Bysq2a038A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74227015"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="74227015"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:54:27 -0800
X-CSE-ConnectionGUID: dsqx+CcGR8i+B7B1PpZJZw==
X-CSE-MsgGUID: p8zDPfPYR7KvLvmhZWd1ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="206913904"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jan 2026 14:54:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj3ZF-00000000TJm-1WWU;
	Thu, 22 Jan 2026 22:54:21 +0000
Date: Fri, 23 Jan 2026 06:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
Subject: Re: [PATCH] sched/fair: Optimize EAS energy calculation complexity
 from O(N) to O(1) inside inner loop
Message-ID: <202601230609.zsX7Ojfn-lkp@intel.com>
References: <20260122154227.130767-1-realwujing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122154227.130767-1-realwujing@gmail.com>

Hi Qiliang,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master peterz-queue/sched/core linus/master v6.19-rc6 next-20260122]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-fair-Optimize-EAS-energy-calculation-complexity-from-O-N-to-O-1-inside-inner-loop/20260123-000924
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260122154227.130767-1-realwujing%40gmail.com
patch subject: [PATCH] sched/fair: Optimize EAS energy calculation complexity from O(N) to O(1) inside inner loop
config: x86_64-randconfig-161-20260123 (https://download.01.org/0day-ci/archive/20260123/202601230609.zsX7Ojfn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230609.zsX7Ojfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230609.zsX7Ojfn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:8345:3: error: member reference base type 'void' is not a structure or union
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:380:24: note: expanded from macro 'for_each_cpu'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: note: expanded from macro 'cpumask_bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^ ~~~~
   include/linux/find.h:586:41: note: expanded from macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   1 error generated.


vim +/void +8345 kernel/sched/fair.c

  8262	
  8263	/*
  8264	 * find_energy_efficient_cpu(): Find most energy-efficient target CPU for the
  8265	 * waking task. find_energy_efficient_cpu() looks for the CPU with maximum
  8266	 * spare capacity in each performance domain and uses it as a potential
  8267	 * candidate to execute the task. Then, it uses the Energy Model to figure
  8268	 * out which of the CPU candidates is the most energy-efficient.
  8269	 *
  8270	 * The rationale for this heuristic is as follows. In a performance domain,
  8271	 * all the most energy efficient CPU candidates (according to the Energy
  8272	 * Model) are those for which we'll request a low frequency. When there are
  8273	 * several CPUs for which the frequency request will be the same, we don't
  8274	 * have enough data to break the tie between them, because the Energy Model
  8275	 * only includes active power costs. With this model, if we assume that
  8276	 * frequency requests follow utilization (e.g. using schedutil), the CPU with
  8277	 * the maximum spare capacity in a performance domain is guaranteed to be among
  8278	 * the best candidates of the performance domain.
  8279	 *
  8280	 * In practice, it could be preferable from an energy standpoint to pack
  8281	 * small tasks on a CPU in order to let other CPUs go in deeper idle states,
  8282	 * but that could also hurt our chances to go cluster idle, and we have no
  8283	 * ways to tell with the current Energy Model if this is actually a good
  8284	 * idea or not. So, find_energy_efficient_cpu() basically favors
  8285	 * cluster-packing, and spreading inside a cluster. That should at least be
  8286	 * a good thing for latency, and this is consistent with the idea that most
  8287	 * of the energy savings of EAS come from the asymmetry of the system, and
  8288	 * not so much from breaking the tie between identical CPUs. That's also the
  8289	 * reason why EAS is enabled in the topology code only for systems where
  8290	 * SD_ASYM_CPUCAPACITY is set.
  8291	 *
  8292	 * NOTE: Forkees are not accepted in the energy-aware wake-up path because
  8293	 * they don't have any useful utilization data yet and it's not possible to
  8294	 * forecast their impact on energy consumption. Consequently, they will be
  8295	 * placed by sched_balance_find_dst_cpu() on the least loaded CPU, which might turn out
  8296	 * to be energy-inefficient in some use-cases. The alternative would be to
  8297	 * bias new tasks towards specific types of CPUs first, or to try to infer
  8298	 * their util_avg from the parent task, but those heuristics could hurt
  8299	 * other use-cases too. So, until someone finds a better way to solve this,
  8300	 * let's keep things simple by re-using the existing slow path.
  8301	 */
  8302	static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
  8303	{
  8304		struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
  8305		unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
  8306		unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
  8307		unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
  8308		struct root_domain *rd = this_rq()->rd;
  8309		int cpu, best_energy_cpu, target = -1;
  8310		int prev_fits = -1, best_fits = -1;
  8311		unsigned long best_actual_cap = 0;
  8312		unsigned long prev_actual_cap = 0;
  8313		struct sched_domain *sd;
  8314		struct perf_domain *pd, *tmp_pd;
  8315		struct energy_env eenv;
  8316	
  8317		rcu_read_lock();
  8318		pd = rcu_dereference_all(rd->pd);
  8319		if (!pd)
  8320			goto unlock;
  8321	
  8322		/*
  8323		 * Energy-aware wake-up happens on the lowest sched_domain starting
  8324		 * from sd_asym_cpucapacity spanning over this_cpu and prev_cpu.
  8325		 */
  8326		sd = rcu_dereference_all(*this_cpu_ptr(&sd_asym_cpucapacity));
  8327		while (sd && !cpumask_test_cpu(prev_cpu, sched_domain_span(sd)))
  8328			sd = sd->parent;
  8329		if (!sd)
  8330			goto unlock;
  8331	
  8332		target = prev_cpu;
  8333	
  8334		sync_entity_load_avg(&p->se);
  8335		if (!task_util_est(p) && p_util_min == 0)
  8336			goto unlock;
  8337	
  8338		eenv_task_busy_time(&eenv, p, prev_cpu);
  8339	
  8340		/* Algorithmic Optimization: Pre-calculate max_util for O(1) energy estimation */
  8341		for (tmp_pd = pd; tmp_pd; tmp_pd = tmp_pd->next) {
  8342			unsigned long max_u = 0;
  8343			int i;
  8344	
> 8345			for_each_cpu(i, perf_domain_span(tmp_pd)) {
  8346				unsigned long util = cpu_util(i, p, -1, 1);
  8347				unsigned long eff_util, min, max;
  8348	
  8349				eff_util = effective_cpu_util(i, util, &min, &max);
  8350				eff_util = sugov_effective_cpu_perf(i, eff_util, min, max);
  8351				if (eff_util > max_u)
  8352					max_u = eff_util;
  8353			}
  8354			tmp_pd->max_util = max_u;
  8355		}
  8356	
  8357		for (; pd; pd = pd->next) {
  8358			unsigned long util_min = p_util_min, util_max = p_util_max;
  8359			unsigned long cpu_cap, cpu_actual_cap, util;
  8360			long prev_spare_cap = -1, max_spare_cap = -1;
  8361			unsigned long rq_util_min, rq_util_max;
  8362			unsigned long cur_delta, base_energy;
  8363			int max_spare_cap_cpu = -1;
  8364			int fits, max_fits = -1;
  8365	
  8366			if (!cpumask_and(cpus, perf_domain_span(pd), cpu_online_mask))
  8367				continue;
  8368	
  8369			/* Account external pressure for the energy estimation */
  8370			cpu = cpumask_first(cpus);
  8371			cpu_actual_cap = get_actual_cpu_capacity(cpu);
  8372	
  8373			eenv.cpu_cap = cpu_actual_cap;
  8374			eenv.pd_cap = 0;
  8375	
  8376			for_each_cpu(cpu, cpus) {
  8377				struct rq *rq = cpu_rq(cpu);
  8378	
  8379				eenv.pd_cap += cpu_actual_cap;
  8380	
  8381				if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
  8382					continue;
  8383	
  8384				if (!cpumask_test_cpu(cpu, p->cpus_ptr))
  8385					continue;
  8386	
  8387				util = cpu_util(cpu, p, cpu, 0);
  8388				cpu_cap = capacity_of(cpu);
  8389	
  8390				/*
  8391				 * Skip CPUs that cannot satisfy the capacity request.
  8392				 * IOW, placing the task there would make the CPU
  8393				 * overutilized. Take uclamp into account to see how
  8394				 * much capacity we can get out of the CPU; this is
  8395				 * aligned with sched_cpu_util().
  8396				 */
  8397				if (uclamp_is_used() && !uclamp_rq_is_idle(rq)) {
  8398					/*
  8399					 * Open code uclamp_rq_util_with() except for
  8400					 * the clamp() part. I.e.: apply max aggregation
  8401					 * only. util_fits_cpu() logic requires to
  8402					 * operate on non clamped util but must use the
  8403					 * max-aggregated uclamp_{min, max}.
  8404					 */
  8405					rq_util_min = uclamp_rq_get(rq, UCLAMP_MIN);
  8406					rq_util_max = uclamp_rq_get(rq, UCLAMP_MAX);
  8407	
  8408					util_min = max(rq_util_min, p_util_min);
  8409					util_max = max(rq_util_max, p_util_max);
  8410				}
  8411	
  8412				fits = util_fits_cpu(util, util_min, util_max, cpu);
  8413				if (!fits)
  8414					continue;
  8415	
  8416				lsub_positive(&cpu_cap, util);
  8417	
  8418				if (cpu == prev_cpu) {
  8419					/* Always use prev_cpu as a candidate. */
  8420					prev_spare_cap = cpu_cap;
  8421					prev_fits = fits;
  8422				} else if ((fits > max_fits) ||
  8423					   ((fits == max_fits) && ((long)cpu_cap > max_spare_cap))) {
  8424					/*
  8425					 * Find the CPU with the maximum spare capacity
  8426					 * among the remaining CPUs in the performance
  8427					 * domain.
  8428					 */
  8429					max_spare_cap = cpu_cap;
  8430					max_spare_cap_cpu = cpu;
  8431					max_fits = fits;
  8432				}
  8433			}
  8434	
  8435			if (max_spare_cap_cpu < 0 && prev_spare_cap < 0)
  8436				continue;
  8437	
  8438			eenv_pd_busy_time(&eenv, cpus, p);
  8439			/* Compute the 'base' energy of the pd, without @p */
  8440			base_energy = compute_energy(&eenv, pd, cpus, p, -1);
  8441	
  8442			/* Evaluate the energy impact of using prev_cpu. */
  8443			if (prev_spare_cap > -1) {
  8444				prev_delta = compute_energy(&eenv, pd, cpus, p,
  8445							    prev_cpu);
  8446				/* CPU utilization has changed */
  8447				if (prev_delta < base_energy)
  8448					goto unlock;
  8449				prev_delta -= base_energy;
  8450				prev_actual_cap = cpu_actual_cap;
  8451				best_delta = min(best_delta, prev_delta);
  8452			}
  8453	
  8454			/* Evaluate the energy impact of using max_spare_cap_cpu. */
  8455			if (max_spare_cap_cpu >= 0 && max_spare_cap > prev_spare_cap) {
  8456				/* Current best energy cpu fits better */
  8457				if (max_fits < best_fits)
  8458					continue;
  8459	
  8460				/*
  8461				 * Both don't fit performance hint (i.e. uclamp_min)
  8462				 * but best energy cpu has better capacity.
  8463				 */
  8464				if ((max_fits < 0) &&
  8465				    (cpu_actual_cap <= best_actual_cap))
  8466					continue;
  8467	
  8468				cur_delta = compute_energy(&eenv, pd, cpus, p,
  8469							   max_spare_cap_cpu);
  8470				/* CPU utilization has changed */
  8471				if (cur_delta < base_energy)
  8472					goto unlock;
  8473				cur_delta -= base_energy;
  8474	
  8475				/*
  8476				 * Both fit for the task but best energy cpu has lower
  8477				 * energy impact.
  8478				 */
  8479				if ((max_fits > 0) && (best_fits > 0) &&
  8480				    (cur_delta >= best_delta))
  8481					continue;
  8482	
  8483				best_delta = cur_delta;
  8484				best_energy_cpu = max_spare_cap_cpu;
  8485				best_fits = max_fits;
  8486				best_actual_cap = cpu_actual_cap;
  8487			}
  8488		}
  8489		rcu_read_unlock();
  8490	
  8491		if ((best_fits > prev_fits) ||
  8492		    ((best_fits > 0) && (best_delta < prev_delta)) ||
  8493		    ((best_fits < 0) && (best_actual_cap > prev_actual_cap)))
  8494			target = best_energy_cpu;
  8495	
  8496		return target;
  8497	
  8498	unlock:
  8499		rcu_read_unlock();
  8500	
  8501		return target;
  8502	}
  8503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
