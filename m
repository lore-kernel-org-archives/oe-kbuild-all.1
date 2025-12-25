Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFB1BC2A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 01:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766624549; cv=none; b=EJGyXFd41oWYan6sqJEqD8Y2nnkR8++VcOcbNjNGpdxr83Vhr8j3q8wyA2DymBjhBx7bLTk1qvRe+9gWo2XntPcj6pqSvGX3oPgfxJSjxn9Zo0K5zKJrZqLJbTcyeKH4M2an2gupXvgp4p8NrFX7y8HvgmMGDZKEdnTc3nM8sCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766624549; c=relaxed/simple;
	bh=sYSj5x/Rl0ZPHU298K6WnlkcXgwnwgLG9mbaQYSidP8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PQv/Q+/HidozYXVZjd9mjL1G48Z/L1Q1JSzKBm7DEzu1HB1lJvJLsJff5c0JJ1+Ft43MAelV/nxqZG29Ut2yGwdiR3IzLb95j8sswz+dMu/tgWmA7+HC39zP1EY1dT3XHivPbK+VnCNr2ORnhpl9Wh8qezfx6xJ6IU96gFmCEK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieAsrk4h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieAsrk4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766624547; x=1798160547;
  h=date:from:to:cc:subject:message-id;
  bh=sYSj5x/Rl0ZPHU298K6WnlkcXgwnwgLG9mbaQYSidP8=;
  b=ieAsrk4hXu/YHh4d5j2jwPwAW1C7rhddhveLnR3AK0y6k9pF90zo74VK
   ng+C7Anv0HNrrXuJS14UUWkpOu6sm3jIdnjoix7BEUd5khQxAG+M7uvMK
   x5Zbk8iDMfC7EIQ7iYYMH9rtL8F6+ivijIKOws6JqObIYyqzSDm5Gstl7
   bhyUOxwW0MlPpRuiWkG6uiWfzZuf4EiQ0z6J8lKB+yJrI47/rrpPFHE4m
   65W7riHAmzpW1vV4mIJyO+ISSaN6IdB4tC7BksA+p8o1AY76j/des/uPg
   z/Fzb1AgL9Uq9OuASQD2p3qjd01i2flZ4/rMHBlKQIBj6z/CaL85yNMHm
   Q==;
X-CSE-ConnectionGUID: xEKesZ2oSD28czcjx4criw==
X-CSE-MsgGUID: V/985is/SeqQiizMk/EgnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72306729"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="72306729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 17:02:27 -0800
X-CSE-ConnectionGUID: L9mXNkNbRNehqsnDhFfHPw==
X-CSE-MsgGUID: tnku82q/TPK+kF/HrdKvzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200427287"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Dec 2025 17:02:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYZkA-000000003ar-382V;
	Thu, 25 Dec 2025 01:02:20 +0000
Date: Thu, 25 Dec 2025 09:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 20/20]
 kernel/sched/core.c:9595:2: error: implicit declaration of function
 'tg_burst_change'
Message-ID: <202512250818.LMwZTq9v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi CruzZhao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   f8cc47d4950acfa65f223aece2eff125f1b84ab6
commit: 9c074b9ff2a8a4bcaaf0b74aeac66822eb7cbd93 [20/20] anolis: sched: support Group Balancer to be aware of cpu burst
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251225/202512250818.LMwZTq9v-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250818.LMwZTq9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250818.LMwZTq9v-lkp@intel.com/

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
