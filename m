Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10C0B662
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 04:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709353763; cv=none; b=beQja16NnA6BkPSaSJWEUjvrnI2naViWdBEHA5BiBISkC3z3ybuX6AQZVfY/3YziclmHRyLwBru1Sc/SYVudi7XNpUNy7K+UeZLruOrYUxC3KbQymL2AYNGXXh+JYdmnVAvwnhrGwcCDb6XgcGHiu53vZUzX4WoXWV5AsgAgEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709353763; c=relaxed/simple;
	bh=zLxTZ4qeXAE+8WP8LdQDU+f1WoP37kT7H5KhZTQWrOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKEWcGvg+8EcD/yx//d/ZucJ9JHkHLqfwe+6awhn0lXB8WiRh0pKr1dAKylViNX7uUzVUonCeiB/DfbqgI3Fx8LDR3IdZEl173QnI2WXvdtCgVyo0G6oXhyx+R3jjOda6k80NVQEtTXQECe/ELkimp1BT3f5ZHSnB8GiaiyjVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCG6Wpcw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCG6Wpcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709353761; x=1740889761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLxTZ4qeXAE+8WP8LdQDU+f1WoP37kT7H5KhZTQWrOo=;
  b=GCG6WpcwZJp/B1rwIwdrXfmtH8OyYZVx12KGxxLkyyQdMk5NSSOpThDw
   l0OSUxki4I5wrZNT7E4UBTXy6VK0aMesrZBOIMAh1edEWxch3Y4pLgkQl
   U5eaKOLFWZpGGo4IQ76wbpSSf8japMUC6xhWTU5GtGYOlyV1VNofwOX5E
   2xt5NZyhtKddMdTyaLx6OtAulO19a9n/bXK9C31cOEX9NLqIxx0+LzGUu
   mYIWOSNfL3LcGbwStAkyZ5IfmE14XegYHXwLISf63/0FNJ4Zs4abolfle
   4g7j4HJMzP4LNz/keLaL+robocEoUiagBo/hT9XXnBIliS+Rd3CIl3TZM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4034140"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="4034140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 20:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="31576884"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2024 20:29:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgGzs-000EJD-0b;
	Sat, 02 Mar 2024 04:29:16 +0000
Date: Sat, 2 Mar 2024 12:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1338/19018]
 kernel/sched/core.c:190:22: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202403021241.WnfpzlvR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   09ca5740fbbe445af407b1db7ceb5c53c191fe74
commit: 6b0a9dc6df8d8be21c8d178a01e0711b0fe6ce73 [1338/19018] ANDROID: GKI: core: Export for runqueues
config: x86_64-randconfig-121-20240301 (https://download.01.org/0day-ci/archive/20240302/202403021241.WnfpzlvR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021241.WnfpzlvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021241.WnfpzlvR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)


vim +190 kernel/sched/core.c

fa85ae2418e684 kernel/sched.c      Peter Zijlstra 2008-01-25   84  
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   85  
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   86  /*
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   87   * Serialization rules:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   88   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   89   * Lock order:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   90   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   91   *   p->pi_lock
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   92   *     rq->lock
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   93   *       hrtimer_cpu_base->lock (hrtimer_start() for bandwidth controls)
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   94   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   95   *  rq1->lock
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   96   *    rq2->lock  where: rq1 < rq2
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   97   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   98   * Regular state:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   99   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  100   * Normal scheduling state is serialized by rq->lock. __schedule() takes the
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  101   * local CPU's rq->lock, it optionally removes the task from the runqueue and
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  102   * always looks at the local rq data structures to find the most elegible task
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  103   * to run next.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  104   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  105   * Task enqueue is also under rq->lock, possibly taken from another CPU.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  106   * Wakeups from another LLC domain might use an IPI to transfer the enqueue to
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  107   * the local CPU to avoid bouncing the runqueue state around [ see
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  108   * ttwu_queue_wakelist() ]
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  109   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  110   * Task wakeup, specifically wakeups that involve migration, are horribly
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  111   * complicated to avoid having to take two rq->locks.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  112   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  113   * Special state:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  114   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  115   * System-calls and anything external will use task_rq_lock() which acquires
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  116   * both p->pi_lock and rq->lock. As a consequence the state they change is
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  117   * stable while holding either lock:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  118   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  119   *  - sched_setaffinity()/
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  120   *    set_cpus_allowed_ptr():	p->cpus_ptr, p->nr_cpus_allowed
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  121   *  - set_user_nice():		p->se.load, p->*prio
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  122   *  - __sched_setscheduler():	p->sched_class, p->policy, p->*prio,
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  123   *				p->se.load, p->rt_priority,
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  124   *				p->dl.dl_{runtime, deadline, period, flags, bw, density}
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  125   *  - sched_setnuma():		p->numa_preferred_nid
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  126   *  - sched_move_task()/
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  127   *    cpu_cgroup_fork():	p->sched_task_group
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  128   *  - uclamp_update_active()	p->uclamp*
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  129   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  130   * p->state <- TASK_*:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  131   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  132   *   is changed locklessly using set_current_state(), __set_current_state() or
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  133   *   set_special_state(), see their respective comments, or by
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  134   *   try_to_wake_up(). This latter uses p->pi_lock to serialize against
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  135   *   concurrent self.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  136   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  137   * p->on_rq <- { 0, 1 = TASK_ON_RQ_QUEUED, 2 = TASK_ON_RQ_MIGRATING }:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  138   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  139   *   is set by activate_task() and cleared by deactivate_task(), under
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  140   *   rq->lock. Non-zero indicates the task is runnable, the special
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  141   *   ON_RQ_MIGRATING state is used for migration without holding both
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  142   *   rq->locks. It indicates task_cpu() is not stable, see task_rq_lock().
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  143   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  144   * p->on_cpu <- { 0, 1 }:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  145   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  146   *   is set by prepare_task() and cleared by finish_task() such that it will be
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  147   *   set before p is scheduled-in and cleared after p is scheduled-out, both
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  148   *   under rq->lock. Non-zero indicates the task is running on its CPU.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  149   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  150   *   [ The astute reader will observe that it is possible for two tasks on one
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  151   *     CPU to have ->on_cpu = 1 at the same time. ]
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  152   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  153   * task_cpu(p): is changed by set_task_cpu(), the rules are:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  154   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  155   *  - Don't call set_task_cpu() on a blocked task:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  156   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  157   *    We don't care what CPU we're not running on, this simplifies hotplug,
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  158   *    the CPU assignment of blocked tasks isn't required to be valid.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  159   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  160   *  - for try_to_wake_up(), called under p->pi_lock:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  161   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  162   *    This allows try_to_wake_up() to only take one rq->lock, see its comment.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  163   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  164   *  - for migration called under rq->lock:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  165   *    [ see task_on_rq_migrating() in task_rq_lock() ]
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  166   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  167   *    o move_queued_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  168   *    o detach_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  169   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  170   *  - for migration called under double_rq_lock():
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  171   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  172   *    o __migrate_swap_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  173   *    o push_rt_task() / pull_rt_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  174   *    o push_dl_task() / pull_dl_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  175   *    o dl_task_offline_migration()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  176   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  177   */
58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  178  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  179  /*
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  180   * __task_rq_lock - lock the rq @p resides on.
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  181   */
eb58075149b7f0 kernel/sched/core.c Peter Zijlstra 2015-07-31  182  struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  183  	__acquires(rq->lock)
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  184  {
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  185  	struct rq *rq;
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  186  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  187  	lockdep_assert_held(&p->pi_lock);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  188  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  189  	for (;;) {
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28 @190  		rq = task_rq(p);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  191  		raw_spin_lock(&rq->lock);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  192  		if (likely(rq == task_rq(p) && !task_on_rq_migrating(p))) {
d8ac897137a230 kernel/sched/core.c Matt Fleming   2016-09-21  193  			rq_pin_lock(rq, rf);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  194  			return rq;
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  195  		}
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  196  		raw_spin_unlock(&rq->lock);
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  197  
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  198  		while (unlikely(task_on_rq_migrating(p)))
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  199  			cpu_relax();
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  200  	}
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  201  }
3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  202  

:::::: The code at line 190 was first introduced by commit
:::::: 3e71a462dd483ce508a723356b293731e7d788ea sched/core: Move task_rq_lock() out of line

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
