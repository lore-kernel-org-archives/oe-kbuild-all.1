Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0E5219E8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760372404; cv=none; b=GiFN/BatdX7VuCuguRB5PPe18Ke0INfGqgFaJYnZQLc9KinqOd+sXSCgCs5Dw12hyOP2M71DsFZm2LF5IC90N31BnydhXmTBEcD/e+HEB1zcsR3rS2fUaxyzxpI4IR0Y2xFrLeP+W2YEHLiZhmr/VODsqzTa0GqxqvAY9YvE86U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760372404; c=relaxed/simple;
	bh=vMdryYjDeXxhdiKwNHAB5XvAQz/+LzGVstn26sSyN2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPjFqFObxJztiYZIzmiY2t9RcRoN1+T8s1Uhi7d+QVpFh6+9KU5gaicoLYi6RYgfvlZxsw2W6OIaDI/wXsSGn0mYquWpYSUGun2eJlGa6czZDtO0AtizZtT8LGuyurvxwqyBQirnb2Z2mIWjJwTeDIcmZSZExPu2p6VerHY5QQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHqdQZ/G; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHqdQZ/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760372402; x=1791908402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMdryYjDeXxhdiKwNHAB5XvAQz/+LzGVstn26sSyN2U=;
  b=gHqdQZ/GU58jSw2HLU+CXMROk0LoptJYMMoUG0mYZpLRgDCGubtlo99p
   1oi07dSPOB6lpXEN44t5Oz73MB8JJ8vxIGOBShKoJ9FhfoMe31mSSqQv1
   DuhefQT7yWL5Q/w11Gyd7uL1BsngaiGkXpoMHQLajBgNzB5++vn8jefWI
   0aRYmESRyUbkhGarvI4kYOkaUf3jnx1Vo1Wf8568YVZkR3+TYczZc0s2v
   /nzQYb4eWNRvN2CI/3wmy9Eo68thQxI+GwAVsGRWsr+p7QQjKcfUFEg9Q
   fLtAHaHP+coTdjEfKLgZ26ySRwTvto2mHvMk1kcXLU1Dm46B5xo6uzycq
   Q==;
X-CSE-ConnectionGUID: a1tVEKGBThqJ1BdA7LFbww==
X-CSE-MsgGUID: 156J5uLYRN21xibYhmj91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62450073"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62450073"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 09:20:02 -0700
X-CSE-ConnectionGUID: HqhIM7bxRbS4lUkt99SGRg==
X-CSE-MsgGUID: uVKTI5bLSw6CD+lecvYbTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="186931648"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 13 Oct 2025 09:20:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8LHC-0001id-01;
	Mon, 13 Oct 2025 16:19:58 +0000
Date: Tue, 14 Oct 2025 00:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/cleanup-pick 21/23]
 kernel/sched/fair.c:12903:33: warning: passing argument 2 of
 'rq_modified_above' discards 'const' qualifier from pointer target type
Message-ID: <202510140008.vTIgbDzP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/cleanup-pick
head:   a85bb9c58a6293b7823fff6c715026bad24d3fff
commit: 3e92434695a42323aaa6b1d6a78245f1c31b3421 [21/23] sched: Detect per-class runqueue changes
config: arc-randconfig-001-20251013 (https://download.01.org/0day-ci/archive/20251014/202510140008.vTIgbDzP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140008.vTIgbDzP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140008.vTIgbDzP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'sched_balance_newidle':
>> kernel/sched/fair.c:12903:33: warning: passing argument 2 of 'rq_modified_above' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     if (rq_modified_above(this_rq, &fair_sched_class))
                                    ^~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:57:
   kernel/sched/sched.h:2593:73: note: expected 'struct sched_class *' but argument is of type 'const struct sched_class *'
    static inline bool rq_modified_above(struct rq *rq, struct sched_class *class)
                                                        ~~~~~~~~~~~~~~~~~~~~^~~~~


vim +12903 kernel/sched/fair.c

 12781	
 12782	/*
 12783	 * sched_balance_newidle is called by schedule() if this_cpu is about to become
 12784	 * idle. Attempts to pull tasks from other CPUs.
 12785	 *
 12786	 * Returns:
 12787	 *   < 0 - we released the lock and there are !fair tasks present
 12788	 *     0 - failed, no new tasks
 12789	 *   > 0 - success, new (fair) tasks present
 12790	 */
 12791	static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 12792	{
 12793		unsigned long next_balance = jiffies + HZ;
 12794		int this_cpu = this_rq->cpu;
 12795		int continue_balancing = 1;
 12796		u64 t0, t1, curr_cost = 0;
 12797		struct sched_domain *sd;
 12798		int pulled_task = 0;
 12799	
 12800		update_misfit_status(NULL, this_rq);
 12801	
 12802		/*
 12803		 * There is a task waiting to run. No need to search for one.
 12804		 * Return 0; the task will be enqueued when switching to idle.
 12805		 */
 12806		if (this_rq->ttwu_pending)
 12807			return 0;
 12808	
 12809		/*
 12810		 * We must set idle_stamp _before_ calling sched_balance_rq()
 12811		 * for CPU_NEWLY_IDLE, such that we measure the this duration
 12812		 * as idle time.
 12813		 */
 12814		this_rq->idle_stamp = rq_clock(this_rq);
 12815	
 12816		/*
 12817		 * Do not pull tasks towards !active CPUs...
 12818		 */
 12819		if (!cpu_active(this_cpu))
 12820			return 0;
 12821	
 12822		/*
 12823		 * This is OK, because current is on_cpu, which avoids it being picked
 12824		 * for load-balance and preemption/IRQs are still disabled avoiding
 12825		 * further scheduler activity on it and we're being very careful to
 12826		 * re-start the picking loop.
 12827		 */
 12828		rq_unpin_lock(this_rq, rf);
 12829	
 12830		rcu_read_lock();
 12831		sd = rcu_dereference_check_sched_domain(this_rq->sd);
 12832	
 12833		if (!get_rd_overloaded(this_rq->rd) ||
 12834		    (sd && this_rq->avg_idle < sd->max_newidle_lb_cost)) {
 12835	
 12836			if (sd)
 12837				update_next_balance(sd, &next_balance);
 12838			rcu_read_unlock();
 12839	
 12840			goto out;
 12841		}
 12842		rcu_read_unlock();
 12843	
 12844		rq_modified_clear(this_rq);
 12845		raw_spin_rq_unlock(this_rq);
 12846	
 12847		t0 = sched_clock_cpu(this_cpu);
 12848		sched_balance_update_blocked_averages(this_cpu);
 12849	
 12850		rcu_read_lock();
 12851		for_each_domain(this_cpu, sd) {
 12852			u64 domain_cost;
 12853	
 12854			update_next_balance(sd, &next_balance);
 12855	
 12856			if (this_rq->avg_idle < curr_cost + sd->max_newidle_lb_cost)
 12857				break;
 12858	
 12859			if (sd->flags & SD_BALANCE_NEWIDLE) {
 12860	
 12861				pulled_task = sched_balance_rq(this_cpu, this_rq,
 12862							   sd, CPU_NEWLY_IDLE,
 12863							   &continue_balancing);
 12864	
 12865				t1 = sched_clock_cpu(this_cpu);
 12866				domain_cost = t1 - t0;
 12867				curr_cost += domain_cost;
 12868				t0 = t1;
 12869	
 12870				/*
 12871				 * Failing newidle means it is not effective;
 12872				 * bump the cost so we end up doing less of it.
 12873				 */
 12874				if (!pulled_task)
 12875					domain_cost = (3 * sd->max_newidle_lb_cost) / 2;
 12876	
 12877				update_newidle_cost(sd, domain_cost);
 12878			}
 12879	
 12880			/*
 12881			 * Stop searching for tasks to pull if there are
 12882			 * now runnable tasks on this rq.
 12883			 */
 12884			if (pulled_task || !continue_balancing)
 12885				break;
 12886		}
 12887		rcu_read_unlock();
 12888	
 12889		raw_spin_rq_lock(this_rq);
 12890	
 12891		if (curr_cost > this_rq->max_idle_balance_cost)
 12892			this_rq->max_idle_balance_cost = curr_cost;
 12893	
 12894		/*
 12895		 * While browsing the domains, we released the rq lock, a task could
 12896		 * have been enqueued in the meantime. Since we're not going idle,
 12897		 * pretend we pulled a task.
 12898		 */
 12899		if (this_rq->cfs.h_nr_queued && !pulled_task)
 12900			pulled_task = 1;
 12901	
 12902		/* If a higher prio class was modified, restart the pick */
 12903		if (rq_modified_above(this_rq, &fair_sched_class))
 12904			pulled_task = -1;
 12905	
 12906	out:
 12907		/* Move the next balance forward */
 12908		if (time_after(this_rq->next_balance, next_balance))
 12909			this_rq->next_balance = next_balance;
 12910	
 12911		if (pulled_task)
 12912			this_rq->idle_stamp = 0;
 12913		else
 12914			nohz_newidle_balance(this_rq);
 12915	
 12916		rq_repin_lock(this_rq, rf);
 12917	
 12918		return pulled_task;
 12919	}
 12920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
