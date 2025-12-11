Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC52C21E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765437951; cv=none; b=F3QRQM6Le3+PVNH7deuEy1j9mHB5InExBEHCmcZYKsnfmDbrpdu52ZEPiA6RLmICRRXpg8eEUeaKNjrk4xwesDZNQNNj7Vpu6dhtjW+pmxvqmBLfp4nM3fKGs6WfWVhHhzs0znn82BaufTdAaoG15q/3nhT53gUA6brQe4h+0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765437951; c=relaxed/simple;
	bh=Yi3YrsaUk4f9D+otUZPZCk4RPBlt50GJlc1bvz7tf1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sLqkxh+ZNVfCGSys+xDIO1EeoBNfWLKvrWJjzeUTCzKuFa8uNh13qidbiyEU8YPyIz38lg7+85Z4CTmBvt8BQ58/a9deWZc9vvCfKieFvTOc7VkIvmwjF1TVzU6uX5UKCmDcyJLslHO8jjJbNG6nz8PHXk/i2HbeWWoeX/MAz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdP8q5jS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdP8q5jS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765437949; x=1796973949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yi3YrsaUk4f9D+otUZPZCk4RPBlt50GJlc1bvz7tf1A=;
  b=bdP8q5jSjV8KDTk7MdpurR6DlxvONCTr9BpsnRJJkYMlQuA+ViRc70m2
   QNTvaQXsqIbUUJe7VnD1o1OVIxDSL4oMs6Hnk6XlLi2zqwKVsGG6doIIB
   3itM/FkT2bEP7yjvooXTQ1lDtDKcW+6I7yxPfPVDPMbpWRVswJOQSB+nr
   mxNxNJMfiVvaEWhtdg1J65xLHwN2pTAd7S7ozWnHAG2MVINelhPS8B45Y
   27FLmO/DXqqTOBDhOLs9sHG3juKgA1LvoH5J1NUT4XnTItrVQjLwOzKKK
   m7qccTTQcmxuBxK+7p6SE2TYzIe715j2ZRkk6S6EgAtyY+WTJyeD2HgV2
   g==;
X-CSE-ConnectionGUID: ER1DkC6GRMSrO3e7r8XYlA==
X-CSE-MsgGUID: Ng8XTUI8QO+Nw6YsZd0fdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78781778"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78781778"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 23:25:47 -0800
X-CSE-ConnectionGUID: fQT204I3R7ioy0bK1ZScLQ==
X-CSE-MsgGUID: AcAlykrfS7+VXVHZTRTYCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196739618"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 23:25:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTb3X-000000004MB-1ieL;
	Thu, 11 Dec 2025 07:25:43 +0000
Date: Thu, 11 Dec 2025 15:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/fair.c:12755:9: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512111531.Lvqcv5wy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   6 months ago
config: i386-randconfig-061-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111531.Lvqcv5wy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111531.Lvqcv5wy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111531.Lvqcv5wy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1196:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1196:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1196:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:12755:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12755:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12755:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6731:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6731:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6731:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:6936:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6936:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6936:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8322:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8322:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8322:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8526:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8526:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8526:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8668:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8668:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8668:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8699:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8699:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8699:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8917:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8917:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8917:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10562:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10562:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10562:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12007:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12007:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12007:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11657:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11657:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11657:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12116:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12116:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12116:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6653:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2460:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *

vim +12755 kernel/sched/fair.c

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra  2009-12-17  12686  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12687  /*
7d058285cd77cc kernel/sched/fair.c Ingo Molnar     2024-03-08  12688   * sched_balance_newidle is called by schedule() if this_cpu is about to become
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12689   * idle. Attempts to pull tasks from other CPUs.
7277a34c6be0b2 kernel/sched/fair.c Peter Zijlstra  2019-11-08  12690   *
7277a34c6be0b2 kernel/sched/fair.c Peter Zijlstra  2019-11-08  12691   * Returns:
7277a34c6be0b2 kernel/sched/fair.c Peter Zijlstra  2019-11-08  12692   *   < 0 - we released the lock and there are !fair tasks present
7277a34c6be0b2 kernel/sched/fair.c Peter Zijlstra  2019-11-08  12693   *     0 - failed, no new tasks
7277a34c6be0b2 kernel/sched/fair.c Peter Zijlstra  2019-11-08  12694   *   > 0 - success, new (fair) tasks present
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12695   */
7d058285cd77cc kernel/sched/fair.c Ingo Molnar     2024-03-08  12696  static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12697  {
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12698  	unsigned long next_balance = jiffies + HZ;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12699  	int this_cpu = this_rq->cpu;
c829d6818b60c5 kernel/sched/fair.c Shrikanth Hegde 2024-03-25  12700  	int continue_balancing = 1;
9e9af819db5dbe kernel/sched/fair.c Vincent Guittot 2021-10-19  12701  	u64 t0, t1, curr_cost = 0;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12702  	struct sched_domain *sd;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12703  	int pulled_task = 0;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12704  
5ba553eff0c3a7 kernel/sched/fair.c Peter Zijlstra  2019-05-29  12705  	update_misfit_status(NULL, this_rq);
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12706  
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12707  	/*
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12708  	 * There is a task waiting to run. No need to search for one.
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12709  	 * Return 0; the task will be enqueued when switching to idle.
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12710  	 */
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12711  	if (this_rq->ttwu_pending)
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12712  		return 0;
e5e678e4fea26d kernel/sched/fair.c Rik van Riel    2021-04-22  12713  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12714  	/*
c829d6818b60c5 kernel/sched/fair.c Shrikanth Hegde 2024-03-25  12715  	 * We must set idle_stamp _before_ calling sched_balance_rq()
c829d6818b60c5 kernel/sched/fair.c Shrikanth Hegde 2024-03-25  12716  	 * for CPU_NEWLY_IDLE, such that we measure the this duration
c829d6818b60c5 kernel/sched/fair.c Shrikanth Hegde 2024-03-25  12717  	 * as idle time.
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12718  	 */
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12719  	this_rq->idle_stamp = rq_clock(this_rq);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12720  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12721  	/*
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12722  	 * Do not pull tasks towards !active CPUs...
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12723  	 */
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12724  	if (!cpu_active(this_cpu))
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12725  		return 0;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12726  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12727  	/*
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12728  	 * This is OK, because current is on_cpu, which avoids it being picked
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12729  	 * for load-balance and preemption/IRQs are still disabled avoiding
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12730  	 * further scheduler activity on it and we're being very careful to
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12731  	 * re-start the picking loop.
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12732  	 */
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12733  	rq_unpin_lock(this_rq, rf);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12734  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12735  	rcu_read_lock();
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12736  	sd = rcu_dereference_check_sched_domain(this_rq->sd);
9d783c8dd112ad kernel/sched/fair.c Vincent Guittot 2021-10-19  12737  
76cc4f91488af0 kernel/sched/fair.c Ingo Molnar     2024-03-28  12738  	if (!get_rd_overloaded(this_rq->rd) ||
9d783c8dd112ad kernel/sched/fair.c Vincent Guittot 2021-10-19  12739  	    (sd && this_rq->avg_idle < sd->max_newidle_lb_cost)) {
9d783c8dd112ad kernel/sched/fair.c Vincent Guittot 2021-10-19  12740  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12741  		if (sd)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12742  			update_next_balance(sd, &next_balance);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12743  		rcu_read_unlock();
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12744  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12745  		goto out;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12746  	}
9d783c8dd112ad kernel/sched/fair.c Vincent Guittot 2021-10-19  12747  	rcu_read_unlock();
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12748  
5cb9eaa3d274f7 kernel/sched/fair.c Peter Zijlstra  2020-11-17  12749  	raw_spin_rq_unlock(this_rq);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12750  
9e9af819db5dbe kernel/sched/fair.c Vincent Guittot 2021-10-19  12751  	t0 = sched_clock_cpu(this_cpu);
391b7a5335c45b kernel/sched/fair.c Ingo Molnar     2024-03-08  12752  	sched_balance_update_blocked_averages(this_cpu);
9e9af819db5dbe kernel/sched/fair.c Vincent Guittot 2021-10-19  12753  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12754  	rcu_read_lock();
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20 @12755  	for_each_domain(this_cpu, sd) {
9e9af819db5dbe kernel/sched/fair.c Vincent Guittot 2021-10-19  12756  		u64 domain_cost;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12757  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12758  		update_next_balance(sd, &next_balance);
8ea9183db4ad8a kernel/sched/fair.c Vincent Guittot 2021-10-19  12759  
8ea9183db4ad8a kernel/sched/fair.c Vincent Guittot 2021-10-19  12760  		if (this_rq->avg_idle < curr_cost + sd->max_newidle_lb_cost)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12761  			break;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12762  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12763  		if (sd->flags & SD_BALANCE_NEWIDLE) {
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12764  
4c3e509ea9f249 kernel/sched/fair.c Ingo Molnar     2024-03-08  12765  			pulled_task = sched_balance_rq(this_cpu, this_rq,
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12766  						   sd, CPU_NEWLY_IDLE,
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12767  						   &continue_balancing);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12768  
9e9af819db5dbe kernel/sched/fair.c Vincent Guittot 2021-10-19  12769  			t1 = sched_clock_cpu(this_cpu);
9e9af819db5dbe kernel/sched/fair.c Vincent Guittot 2021-10-19  12770  			domain_cost = t1 - t0;
e60b56e46b384c kernel/sched/fair.c Vincent Guittot 2021-10-19  12771  			update_newidle_cost(sd, domain_cost);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12772  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12773  			curr_cost += domain_cost;
9e9af819db5dbe kernel/sched/fair.c Vincent Guittot 2021-10-19  12774  			t0 = t1;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12775  		}
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12776  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12777  		/*
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12778  		 * Stop searching for tasks to pull if there are
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12779  		 * now runnable tasks on this rq.
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12780  		 */
c829d6818b60c5 kernel/sched/fair.c Shrikanth Hegde 2024-03-25  12781  		if (pulled_task || !continue_balancing)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12782  			break;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12783  	}
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12784  	rcu_read_unlock();
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12785  
5cb9eaa3d274f7 kernel/sched/fair.c Peter Zijlstra  2020-11-17  12786  	raw_spin_rq_lock(this_rq);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12787  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12788  	if (curr_cost > this_rq->max_idle_balance_cost)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12789  		this_rq->max_idle_balance_cost = curr_cost;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12790  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12791  	/*
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12792  	 * While browsing the domains, we released the rq lock, a task could
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12793  	 * have been enqueued in the meantime. Since we're not going idle,
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12794  	 * pretend we pulled a task.
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12795  	 */
7b8a702d943827 kernel/sched/fair.c Vincent Guittot 2024-12-02  12796  	if (this_rq->cfs.h_nr_queued && !pulled_task)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12797  		pulled_task = 1;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12798  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12799  	/* Is there a task of a high priority class? */
7b8a702d943827 kernel/sched/fair.c Vincent Guittot 2024-12-02  12800  	if (this_rq->nr_running != this_rq->cfs.h_nr_queued)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12801  		pulled_task = -1;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12802  
6553fc18179113 kernel/sched/fair.c Vincent Guittot 2021-02-24  12803  out:
6553fc18179113 kernel/sched/fair.c Vincent Guittot 2021-02-24  12804  	/* Move the next balance forward */
6553fc18179113 kernel/sched/fair.c Vincent Guittot 2021-02-24  12805  	if (time_after(this_rq->next_balance, next_balance))
6553fc18179113 kernel/sched/fair.c Vincent Guittot 2021-02-24  12806  		this_rq->next_balance = next_balance;
6553fc18179113 kernel/sched/fair.c Vincent Guittot 2021-02-24  12807  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12808  	if (pulled_task)
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12809  		this_rq->idle_stamp = 0;
0826530de3cbdc kernel/sched/fair.c Vincent Guittot 2021-02-24  12810  	else
0826530de3cbdc kernel/sched/fair.c Vincent Guittot 2021-02-24  12811  		nohz_newidle_balance(this_rq);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12812  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12813  	rq_repin_lock(this_rq, rf);
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12814  
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12815  	return pulled_task;
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12816  }
47ea54121e46a6 kernel/sched/fair.c Peter Zijlstra  2018-02-20  12817  

:::::: The code at line 12755 was first introduced by commit
:::::: 47ea54121e46a685aa2320df8b0f71aaeedff23f sched/fair: Move idle_balance()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
