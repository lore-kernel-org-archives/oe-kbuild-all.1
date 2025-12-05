Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91E42EA16A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764917555; cv=none; b=rq/7yvuCBLeJotojZ5lQ4VN8RFe5f3qJsbYCqOg0f6yHq48nSOpYognUX5TeBnNlH1pi2WxlSorVEaX/IsyPPj6TZxtl/nUQJ0dpvLzPYzan2darkDoUXwWag00fhQKurjrjWUWTiFsNpEkbcDxTZ1LdAN6nLWHlo8josfFivn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764917555; c=relaxed/simple;
	bh=pISwRvMNWCIyPP7VfX6mCY7OT182bTxWHcDHEqYQ5Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7iF8X2vP+f82Foaqz9BZOloHRqcYbZszDpLhYPyNHh5RsR88cdm8Svm59aNbbCrsvPf2U3P1JOpVl0lHMS++Q2/hm6Lm8krDND0Cu3bZndwIxyubvTxZbxxgryDJ6oaASKlqbamVN8iJOSVeURJ4ldSKfkYJWZxpogkXOwvvdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvzsAfEC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvzsAfEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764917553; x=1796453553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pISwRvMNWCIyPP7VfX6mCY7OT182bTxWHcDHEqYQ5Y4=;
  b=EvzsAfEC+Kjn+mP2iLDC328WG/TlXnd8QGtn5KxxvSxS50X62d3l5A0k
   Ai587v+ir3DPoRReGdjFF5WDdm2Gf3T0YZU7aWI04jY1B3F4pNJKSn6UW
   KZ3WhaUB+8cJuk+h4GgxtvYmzrYBgt7Q9z/lCIPW/5dIYtj1jAqMi1enQ
   5hak9MBzipZ5O6sMjkkODx5rel5W+dEwy4mZ9GRcwnlsGWFOsEbL+oNVx
   W1BAB6xYgpqqsy7elyCh8pULx7ZxSPy4/P8UQIjm+EZlc2F7F0SqnWxfI
   EhWgsCuynCiwIo72zbJ2WVcZgtD9CVieNIbf+JyyOKwC8PVsZfTZqW8Gx
   A==;
X-CSE-ConnectionGUID: hzEihC+uQISyPbUOUAgBAw==
X-CSE-MsgGUID: wNfyqva0Qtiz839rwNvbDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="89599337"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="89599337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 22:52:32 -0800
X-CSE-ConnectionGUID: bUQhRnJ+RiqPQvpLq9OLSA==
X-CSE-MsgGUID: egPL5zcYQ+mPcINr1sbtOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195041494"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2025 22:52:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRPg5-00000000Eht-0OvW;
	Fri, 05 Dec 2025 06:52:29 +0000
Date: Fri, 5 Dec 2025 14:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] kernel/sched/core.c:9595:2:
 error: implicit declaration of function 'tg_burst_change'
Message-ID: <202512051426.fhkdP4DY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31b356d59497695e1135b4c6ea07b6d0bd148e07
commit: 9c074b9ff2a8a4bcaaf0b74aeac66822eb7cbd93 [0/1] anolis: sched: support Group Balancer to be aware of cpu burst
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512051426.fhkdP4DY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051426.fhkdP4DY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051426.fhkdP4DY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:2861:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    2861 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:2861:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2861 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:5639:16: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
    5639 | __attribute__((optimize("no-omit-frame-pointer")))
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5880:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
    5880 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^
   kernel/sched/core.c:5880:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5880 | asmlinkage __visible void __sched schedule_user(void)
         |                      ^
         |                      static 
>> kernel/sched/core.c:9595:2: error: implicit declaration of function 'tg_burst_change' [-Werror,-Wimplicit-function-declaration]
    9595 |         tg_burst_change(tg, burst);
         |         ^
   kernel/sched/core.c:9595:2: note: did you mean 'tg_specs_change'?
   include/linux/sched.h:2445:20: note: 'tg_specs_change' declared here
    2445 | static inline void tg_specs_change(struct task_group *tg) { }
         |                    ^
   3 warnings and 1 error generated.


vim +/tg_burst_change +9595 kernel/sched/core.c

  9533	
  9534	static int tg_set_cfs_bandwidth(struct task_group *tg, u64 period, u64 quota,
  9535							u64 burst, u64 init_buffer)
  9536	{
  9537		int i, ret = 0, runtime_enabled, runtime_was_enabled;
  9538		struct cfs_bandwidth *cfs_b = &tg->cfs_bandwidth;
  9539		u64 buffer, burst_onset;
  9540	
  9541		if (tg == &root_task_group)
  9542			return -EINVAL;
  9543	
  9544		/*
  9545		 * Ensure we have at some amount of bandwidth every period.  This is
  9546		 * to prevent reaching a state of large arrears when throttled via
  9547		 * entity_tick() resulting in prolonged exit starvation.
  9548		 */
  9549		if (quota < min_cfs_quota_period || period < min_cfs_quota_period)
  9550			return -EINVAL;
  9551	
  9552		/*
  9553		 * Likewise, bound things on the otherside by preventing insane quota
  9554		 * periods.  This also allows us to normalize in computing quota
  9555		 * feasibility.
  9556		 */
  9557		if (period > max_cfs_quota_period)
  9558			return -EINVAL;
  9559	
  9560		/*
  9561		 * Bound quota to defend quota against overflow during bandwidth shift.
  9562		 */
  9563		if (quota != RUNTIME_INF && quota > max_cfs_runtime)
  9564			return -EINVAL;
  9565	
  9566		/*
  9567		 * Bound burst to defend burst against overflow during bandwidth shift.
  9568		 */
  9569		if (burst > max_cfs_runtime || init_buffer > max_cfs_runtime)
  9570			return -EINVAL;
  9571	
  9572		if (quota == RUNTIME_INF)
  9573			buffer = RUNTIME_INF;
  9574		else
  9575			buffer = min(max_cfs_runtime, quota + burst);
  9576		/*
  9577		 * Prevent race between setting of cfs_rq->runtime_enabled and
  9578		 * unthrottle_offline_cfs_rqs().
  9579		 */
  9580		get_online_cpus();
  9581		mutex_lock(&cfs_constraints_mutex);
  9582		ret = __cfs_schedulable(tg, period, quota);
  9583		if (ret)
  9584			goto out_unlock;
  9585	
  9586		runtime_enabled = quota != RUNTIME_INF;
  9587		runtime_was_enabled = cfs_b->quota != RUNTIME_INF;
  9588		/*
  9589		 * If we need to toggle cfs_bandwidth_used, off->on must occur
  9590		 * before making related changes, and on->off must occur afterwards
  9591		 */
  9592		if (runtime_enabled && !runtime_was_enabled)
  9593			cfs_bandwidth_usage_inc();
  9594		raw_spin_lock_irq(&cfs_b->lock);
> 9595		tg_burst_change(tg, burst);
  9596		cfs_b->period = ns_to_ktime(period);
  9597		cfs_b->quota = quota;
  9598		cfs_b->burst = burst;
  9599		cfs_b->buffer = buffer;
  9600		cfs_b->init_buffer = init_buffer;
  9601	
  9602		cfs_b->max_overrun = DIV_ROUND_UP_ULL(max_cfs_runtime, quota);
  9603		cfs_b->runtime = cfs_b->quota;
  9604	
  9605		/* burst_onset needed */
  9606		if (cfs_b->quota != RUNTIME_INF &&
  9607				sysctl_sched_cfs_bw_burst_enabled &&
  9608				sysctl_sched_cfs_bw_burst_onset_percent > 0) {
  9609	
  9610			burst_onset = div_u64(burst, 100) *
  9611				sysctl_sched_cfs_bw_burst_onset_percent;
  9612	
  9613			cfs_b->runtime += burst_onset;
  9614			cfs_b->runtime = min(max_cfs_runtime, cfs_b->runtime);
  9615		}
  9616	
  9617		cfs_b->runtime = max(cfs_b->runtime, init_buffer);
  9618		cfs_b->current_buffer = max(cfs_b->buffer, init_buffer);
  9619		cfs_b->previous_runtime = cfs_b->runtime;
  9620	
  9621		/* Restart the period timer (if active) to handle new period expiry: */
  9622		if (runtime_enabled)
  9623			start_cfs_bandwidth(cfs_b, 1);
  9624	
  9625		raw_spin_unlock_irq(&cfs_b->lock);
  9626	
  9627		for_each_online_cpu(i) {
  9628			struct cfs_rq *cfs_rq = tg->cfs_rq[i];
  9629			struct rq *rq = cfs_rq->rq;
  9630			struct rq_flags rf;
  9631	
  9632			rq_lock_irq(rq, &rf);
  9633			cfs_rq->runtime_enabled = runtime_enabled;
  9634			cfs_rq->runtime_remaining = 0;
  9635	
  9636			if (cfs_rq->throttled)
  9637				unthrottle_cfs_rq(cfs_rq);
  9638			rq_unlock_irq(rq, &rf);
  9639		}
  9640		if (runtime_was_enabled && !runtime_enabled)
  9641			cfs_bandwidth_usage_dec();
  9642	out_unlock:
  9643		mutex_unlock(&cfs_constraints_mutex);
  9644		put_online_cpus();
  9645	
  9646		return ret;
  9647	}
  9648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
