Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AE18131D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474680; cv=none; b=iXf+FqIueqr/0UdIltyYxBgq4nucNMVe4YB+pjkk2DJRUiDGD8MuPpzmDOWYC/2fDx+MfI3vxMixfZQS6N5fhME/C5G+SImGgL37prK9l+P/xV2Q+47Uce2M3uMj/pj+5u8zzSqlqSYEMtzN10piBsfP8Kg9uyF2P3OCyAlomX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474680; c=relaxed/simple;
	bh=FPbmRcYm91zo84pkJJDgfGb6EdW2Ta2f8oUBP2nH1oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BuYxKr3xqV2zuTlhaj4pF8xGCj48PIPsNoZZN+9cUAIIWtl33iXyqhoIb8Fj27qz+BlOEDHa5Q/+5sLKzpur1PY0qq4G7JnDl9E35U59c0Hl/9joGuNqudJEonvSbVXUmAekBbUskd0gOLPWxjgNE0ZGX7E5KEDt0Obpt5RLSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4ZerWtw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4ZerWtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713474679; x=1745010679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FPbmRcYm91zo84pkJJDgfGb6EdW2Ta2f8oUBP2nH1oQ=;
  b=a4ZerWtwvqJqz1I7d3hM7yGSs062kpyVfMLoCynEfwZ7IbEWXYf+krVV
   jPc6LQHSsD/wnZH7vb+L8hNfFL2hOLbEzBqWnB6UkwBo1pUDgV437e6SA
   IlhzoZAa3nhHNCMB9sETtgYalK1lCH0sJRaWYDz2a+0C/MGNfCaabh1Mc
   2NLNWvScYGk+HUlOfcrgs9NphuTKCYtblS4EHYPkPsuLrLdyxo/s5LhqH
   mgrlaXAnmv2jNWkD1wvOwbz0OwBF7JL/fDGb3TTGVjZengXKcGxo/RK/S
   BwXUCKHs+DoyQTyblPioa/87WjIFA/L8lAzFdH2JLCds/kNZH2KYIo835
   A==;
X-CSE-ConnectionGUID: 8fmIipatTSC5r8rd2fcBTQ==
X-CSE-MsgGUID: p5oP9bGmTZeMbtWioVcwJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9178794"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9178794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:11:18 -0700
X-CSE-ConnectionGUID: rQhf7pdGR1e910NLjA87tg==
X-CSE-MsgGUID: pyGRIGmnRNeI8vT9COHwJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27954868"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Apr 2024 14:11:17 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxZ2I-0009FG-2A;
	Thu, 18 Apr 2024 21:11:14 +0000
Date: Fri, 19 Apr 2024 05:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/dlserver.update_h_nr 1/1] kernel/sched/fair.c:5119:17:
 error: implicit declaration of function 'update_h_nr_running'
Message-ID: <202404190525.oKxYBfJV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.update_h_nr
head:   4e843586ff1b3b77e5244d0128facac6330490a4
commit: 4e843586ff1b3b77e5244d0128facac6330490a4 [1/1] Prototype: Update h_nr_running from single place to stop/start dl server
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240419/202404190525.oKxYBfJV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190525.oKxYBfJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190525.oKxYBfJV-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:633:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     633 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'throttle_cfs_rq':
>> kernel/sched/fair.c:5119:17: error: implicit declaration of function 'update_h_nr_running' [-Werror=implicit-function-declaration]
    5119 |                 update_h_nr_running(qcfs_rq, -1 * task_delta);
         |                 ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:5830:13: warning: conflicting types for 'update_h_nr_running'; have 'void(struct cfs_rq *, int)'
    5830 | static void update_h_nr_running(struct cfs_rq *cfs_rq, int delta)
         |             ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:5830:13: error: static declaration of 'update_h_nr_running' follows non-static declaration
   kernel/sched/fair.c:5119:17: note: previous implicit declaration of 'update_h_nr_running' with type 'void(struct cfs_rq *, int)'
    5119 |                 update_h_nr_running(qcfs_rq, -1 * task_delta);
         |                 ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/update_h_nr_running +5119 kernel/sched/fair.c

  5070	
  5071	static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
  5072	{
  5073		struct rq *rq = rq_of(cfs_rq);
  5074		struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
  5075		struct sched_entity *se;
  5076		long task_delta, idle_task_delta, dequeue = 1;
  5077	
  5078		raw_spin_lock(&cfs_b->lock);
  5079		/* This will start the period timer if necessary */
  5080		if (__assign_cfs_rq_runtime(cfs_b, cfs_rq, 1)) {
  5081			/*
  5082			 * We have raced with bandwidth becoming available, and if we
  5083			 * actually throttled the timer might not unthrottle us for an
  5084			 * entire period. We additionally needed to make sure that any
  5085			 * subsequent check_cfs_rq_runtime calls agree not to throttle
  5086			 * us, as we may commit to do cfs put_prev+pick_next, so we ask
  5087			 * for 1ns of runtime rather than just check cfs_b.
  5088			 */
  5089			dequeue = 0;
  5090		} else {
  5091			list_add_tail_rcu(&cfs_rq->throttled_list,
  5092					  &cfs_b->throttled_cfs_rq);
  5093		}
  5094		raw_spin_unlock(&cfs_b->lock);
  5095	
  5096		if (!dequeue)
  5097			return false;  /* Throttle no longer required. */
  5098	
  5099		se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
  5100	
  5101		/* freeze hierarchy runnable averages while throttled */
  5102		rcu_read_lock();
  5103		walk_tg_tree_from(cfs_rq->tg, tg_throttle_down, tg_nop, (void *)rq);
  5104		rcu_read_unlock();
  5105	
  5106		task_delta = cfs_rq->h_nr_running;
  5107		idle_task_delta = cfs_rq->idle_h_nr_running;
  5108		for_each_sched_entity(se) {
  5109			struct cfs_rq *qcfs_rq = cfs_rq_of(se);
  5110			/* throttled entity or throttle-on-deactivate */
  5111			if (!se->on_rq)
  5112				goto done;
  5113	
  5114			dequeue_entity(qcfs_rq, se, DEQUEUE_SLEEP);
  5115	
  5116			if (cfs_rq_is_idle(group_cfs_rq(se)))
  5117				idle_task_delta = cfs_rq->h_nr_running;
  5118	
> 5119			update_h_nr_running(qcfs_rq, -1 * task_delta);
  5120			qcfs_rq->idle_h_nr_running -= idle_task_delta;
  5121	
  5122			if (qcfs_rq->load.weight) {
  5123				/* Avoid re-evaluating load for this entity: */
  5124				se = parent_entity(se);
  5125				break;
  5126			}
  5127		}
  5128	
  5129		for_each_sched_entity(se) {
  5130			struct cfs_rq *qcfs_rq = cfs_rq_of(se);
  5131			/* throttled entity or throttle-on-deactivate */
  5132			if (!se->on_rq)
  5133				goto done;
  5134	
  5135			update_load_avg(qcfs_rq, se, 0);
  5136			se_update_runnable(se);
  5137	
  5138			if (cfs_rq_is_idle(group_cfs_rq(se)))
  5139				idle_task_delta = cfs_rq->h_nr_running;
  5140	
  5141			update_h_nr_running(qcfs_rq, -1 * task_delta);
  5142			qcfs_rq->idle_h_nr_running -= idle_task_delta;
  5143		}
  5144	
  5145		/* At this point se is NULL and we are at root level*/
  5146		sub_nr_running(rq, task_delta);
  5147	
  5148	done:
  5149		/*
  5150		 * Note: distribution will already see us throttled via the
  5151		 * throttled-list.  rq->lock protects completion.
  5152		 */
  5153		cfs_rq->throttled = 1;
  5154		cfs_rq->throttled_clock = rq_clock(rq);
  5155		return true;
  5156	}
  5157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
