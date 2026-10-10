Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5946C3CE4B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616070; cv=none; b=FhNfIUjMh+Jf9s2l3TDA5aGZR6VlvsUJE6Ab4vfQgIR7UXDD803jpF4iNFUyou0d9WVfI1n0OypiQpNRI2FdqSqzA/0AhSdPAsrJ2mvIDyjY+NNqCET7BWF5sNqmPm9yypaKlGB/J/qv8D2CLlKtZpH29NTsJnadZyMg3F7dU+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616070; c=relaxed/simple;
	bh=GNErx85AoqEdkIzonBFZhAU98pSLII7EDbUWMzkq+Sg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ju9fSzB3zrWvFK8bOI6WzZIoaW5+6J2obkh7RziqH3PJgbB+6mX+og4A9BhIxfMkxcmbVjrC3MerzPDZjKJ7d9r//bNFHHFHkhBQwK98XeKmbt81RyFdd+7zg5POwmGscCcKPXgekWE24KqZ7Ee1JwwyjBdVPzgU5pQYfumJcWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YozHiEcC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YozHiEcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791616069; x=1823152069;
  h=date:from:to:cc:subject:message-id;
  bh=GNErx85AoqEdkIzonBFZhAU98pSLII7EDbUWMzkq+Sg=;
  b=YozHiEcCIyyEVYW1TchluDydPJAZIf/8oo5Pqytw/XNyWYB384Rz7QIz
   6BDmrvgxMc/7am3yeXr0F89nuqG7jwX6Dlwv2Jnu/bpMsEP7CP7yIFuNf
   icloO1RMADXyV7980yVxc6M8z6vgWcaYkv2/6WQQ2E+w9MbhXR3COrgmK
   NYYgYIGqKzIxMqvHJN6mncSPb7R7qCuGSjknce8OkUT8BBmizMJwf+eVz
   FqDuLrlUhOVibZa8xWtaWGj6eQgG0zPZRW0jgz4oUHw9VbKvoSUBGW9qj
   9o7p2xpe2lpxN1OZbqNE/c//MOXznyyjYhZPOYPMacDp518VViBUhDd5A
   Q==;
X-CSE-ConnectionGUID: JkUZx00eTFOCTsTp6N3MYQ==
X-CSE-MsgGUID: ZN9Pr9YZTAy4PKM/XhB72g==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="314007"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="314007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 00:07:46 -0700
X-CSE-ConnectionGUID: k3ELemwOQfyxttrCV4SHqQ==
X-CSE-MsgGUID: qw1VqMnGQtiMkQco1u/mfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="939726"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2026 00:07:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFRBF-000000007cr-1ch5;
	Sat, 10 Oct 2026 07:07:41 +0000
Date: Sat, 10 Oct 2026 09:07:05 +0200
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 20/22] kernel/rcu/tree.c:2772:54: error: no
 member named 'rcu_node_entry' in 'struct task_struct'
Message-ID: <202610100942.wehumJty-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   96aaeadd587ee111e53032f63b93e54a8b476483
commit: 2c4925768252397b03d47704f70891ce2b47e774 [20/22] EXP rcu: Send resched_cpu() to idle CPUs having preempted RCU readers
config: hexagon-randconfig-r2106-20261010 (https://download.01.org/0day-ci/archive/20261010/202610100942.wehumJty-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 43c3bf2782849a898d95a345a28179d639ef4e22)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100942.wehumJty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100942.wehumJty-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/tree.c:2772:54: error: no member named 'rcu_node_entry' in 'struct task_struct'
    2772 |         if (task_curr(t) || READ_ONCE(rnp->gp_tasks) != &t->rcu_node_entry)
         |                                                          ~  ^
   kernel/rcu/tree.c:2823:57: error: no member named 'rcu_node_entry' in 'struct task_struct'
    2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/linux/container_of.h:20:56: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:8:45: note: expanded from macro 'typeof_member'
       8 | #define typeof_member(T, m)     typeof(((T*)0)->m)
         |                                                 ^
   include/linux/compiler_types.h:610:74: note: expanded from macro '__same_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/rcu/tree.c:2823:9: error: no member named 'rcu_node_entry' in 'task_struct'
    2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
         |                                     ^                                               ~~~~~~~~~~~~~~
   include/linux/container_of.h:23:27: note: expanded from macro 'container_of'
      23 |         (type *)((void *)(ptr) - offsetof(type, member)); })
         |                                  ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> kernel/rcu/tree.c:2823:7: error: assigning to 'struct task_struct *' from incompatible type 'void'
    2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
         |                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +2772 kernel/rcu/tree.c

  2757	
  2758	// Check to see if a task holding up the current grace period is
  2759	// preempted but runnable on an idle CPU.  This involves an
  2760	// rcu_node structure, a pointer to which is passed to fqs_slow_task()
  2761	// as a callback from task_call_func().  The fqs_slow_task()
  2762	// function returns the CPU to pass to resched_cpu() or -1 if
  2763	// there is no need for an additional call to resched_cpu().
  2764	static int fqs_slow_task(struct task_struct *t, void *arg)
  2765	{
  2766		int cpu;
  2767		struct rcu_node *rnp = arg;
  2768		struct task_struct *tc;
  2769	
  2770		// If the task is running or is no longer blocking the current
  2771		// grace period, there should be no call to resched_cpu().
> 2772		if (task_curr(t) || READ_ONCE(rnp->gp_tasks) != &t->rcu_node_entry)
  2773			return -1;
  2774	
  2775		// If the target CPU is not idle, there should be no call to
  2776		// resched_cpu().
  2777		WARN_ON_ONCE(1); // @@@
  2778		cpu = task_cpu(t);
  2779		tc = rcu_cpu_curr(cpu);
  2780		if (!is_idle_task(tc))
  2781			return -1;
  2782	
  2783		// But the target CPU is idle, so resched_cpu() it is!
  2784		WARN_ON_ONCE(1); // @@@
  2785		return cpu;
  2786	}
  2787	
  2788	/*
  2789	 * Scan the leaf rcu_node structures.  For each structure on which all
  2790	 * CPUs have reported a quiescent state and on which there are tasks
  2791	 * blocking the current grace period, initiate RCU priority boosting.
  2792	 * Otherwise, invoke the specified function to check dyntick state for
  2793	 * each CPU that has not yet reported a quiescent state.
  2794	 */
  2795	static void force_qs_rnp(int (*f)(struct rcu_data *rdp))
  2796	{
  2797		int cpu;
  2798		unsigned long flags;
  2799		bool halfway;
  2800		struct rcu_node *rnp;
  2801		struct task_struct *t = NULL;
  2802	
  2803		rcu_state.cbovld = rcu_state.cbovldnext;
  2804		rcu_state.cbovldnext = false;
  2805		rcu_for_each_leaf_node(rnp) {
  2806			unsigned long mask = 0;
  2807			unsigned long rsmask = 0;
  2808	
  2809			cond_resched_tasks_rcu_qs();
  2810			raw_spin_lock_irqsave_rcu_node(rnp, flags);
  2811			rcu_state.cbovldnext |= !!rnp->cbovldmask;
  2812			if (rnp->qsmask == 0) {
  2813	
  2814				// Prepare to check for preempted tasks blocking
  2815				// the current RCU grace period whose CPU is idle.
  2816				// But only if we are at least halfway to the RCU
  2817				// CPU stall warning.
  2818				halfway = time_after(jiffies, rcu_state.jiffies_resched);
  2819				WARN_ONCE(1, "%s: halfway: %d.\n", __func__, halfway); // @@@
  2820				WARN_ON_ONCE(halfway); // @@@
  2821				if (halfway) {
  2822					WARN_ON_ONCE(1); // @@@
> 2823					t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
  2824					if (t)
  2825						get_task_struct(t);
  2826				}
  2827				if (rcu_preempt_blocked_readers_cgp(rnp)) {
  2828					/*
  2829					 * No point in scanning bits because they
  2830					 * are all zero.  But we might need to
  2831					 * priority-boost blocked readers.
  2832					 */
  2833					rcu_initiate_boost(rnp, flags);
  2834					/* rcu_initiate_boost() releases rnp->lock */
  2835				} else {
  2836					raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
  2837				}
  2838	
  2839				// If the first preempted task blocking the
  2840				// current RCU grace period wants to run on a
  2841				// CPU that is idle, then add that CPU to rsmask.
  2842				// Unless the CPU belongs to some other rcu_node
  2843				// structure, in which case, call resched_cpu()
  2844				// directly.
  2845				if (halfway && t) {
  2846					WARN_ON_ONCE(1); // @@@
  2847					cpu = task_call_func(t, fqs_slow_task, rnp);
  2848					if (cpu >= 0) {
  2849						pr_alert("%s: For task P%d, resched_cpu(%d).\n",
  2850							 __func__, t->pid, cpu); // @@@
  2851						resched_cpu(cpu);
  2852					}
  2853					put_task_struct(t);
  2854				}
  2855	
  2856				continue;
  2857			}
  2858			for_each_leaf_node_cpu_mask(rnp, cpu, rnp->qsmask) {
  2859				struct rcu_data *rdp;
  2860				int ret;
  2861	
  2862				rdp = per_cpu_ptr(&rcu_data, cpu);
  2863				ret = f(rdp);
  2864				if (ret > 0) {
  2865					mask |= rdp->grpmask;
  2866					rcu_disable_urgency_upon_qs(rdp);
  2867				}
  2868				if (ret < 0)
  2869					rsmask |= rdp->grpmask;
  2870			}
  2871	
  2872			if (mask != 0) {
  2873				/* Idle/offline CPUs, report (releases rnp->lock). */
  2874				rcu_report_qs_rnp(mask, rnp, rnp->gp_seq, flags);
  2875			} else {
  2876				/* Nothing to do here, so just drop the lock. */
  2877				raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
  2878			}
  2879	
  2880			for_each_leaf_node_cpu_mask(rnp, cpu, rsmask)
  2881				resched_cpu(cpu);
  2882		}
  2883	}
  2884	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
