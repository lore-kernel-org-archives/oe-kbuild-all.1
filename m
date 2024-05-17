Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4F225D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715942151; cv=none; b=qO9bMepV2wir2r8o7IcYDEvbTVPoiRIH8DrtxEWjXkUAcWmqpxq6rzUt+gyvi1JuYLXw7Qb04qWeH+4hWjVMMHHFcsh1SCXZKVnlg8a+67NAnomUNkSl9Ti1enrww8hgUAmVJdTqym9IJuiKSwwat9MeFaAE9tZxdt3xOs+vG2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715942151; c=relaxed/simple;
	bh=I8ra6DHb37nFcd8LxzbkeLcazcFpgHPxAe/pMZlD1OI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSSerYg9MEdUutSJQXct8MWS3UzHfXGa6zaeyiHiyXXglQi1hr1nrrwKYH+Fulv2FrNvNBj8sSBId3809N7QIBoqByis7ds/rcGosB8TzEirtGh3cmxfiN+r2FOG66Q33DaJ9+Rd+Esnc4YlazwnLcR0N0GBPR2px55p3iPId5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiNZzt3C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiNZzt3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715942150; x=1747478150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8ra6DHb37nFcd8LxzbkeLcazcFpgHPxAe/pMZlD1OI=;
  b=ZiNZzt3CwjbYcCTuIeVXZ/oXwy8zPQZEcaNGMVP7mPqnUzY6tfi1PMSA
   CwEegYW8NxbRZMtYww9ThT/7G1jwlfxwyJRPNNO732yE0oX8VvJVdskVX
   eZ+fHpjZthTFRm/08V908czxEAO1O/RROMvc6heBzKjKrmdufY6tSlEE/
   i266qADKNqwZvmwkN/iz0Krq4urPWbJqvpaO8949vicezzXe/r5ramYc8
   ljL75ebAlaIu/S6z27SxB+QhPa5xBavuTnM0UQLs82cYjRqtEZ21V20zc
   EtCts/8EwWAEGvm/jxJnFaSKNABirwThGeX/w65ndwT+xmt+IHs4jkK7n
   Q==;
X-CSE-ConnectionGUID: KpWUUt2nQ0KnQV7iRngsJQ==
X-CSE-MsgGUID: /uU1vqz2SVWqX9NHM66IuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22716671"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22716671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 03:35:49 -0700
X-CSE-ConnectionGUID: L3RQzILYTbKUS8C4OTRMDA==
X-CSE-MsgGUID: P8yMFt92Rqy54NB5ErP+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31769796"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 May 2024 03:35:49 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7uwE-0000Zc-0s;
	Fri, 17 May 2024 10:35:46 +0000
Date: Fri, 17 May 2024 18:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 461/472] kernel/sched/alt_core.c:4207:28: error:
 implicit declaration of function '__best_mask_cpu'; did you mean
 '__set_task_cpu'?
Message-ID: <202405171843.e14KjFEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/prjc
head:   90e00625dbe63d991978337198b3c43a1df585c9
commit: f90f6c0ad3cb7786aa8308e4669ea037dabf7476 [461/472] sched/alt: Generic active_balance_cpu_stop()
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240517/202405171843.e14KjFEk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171843.e14KjFEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171843.e14KjFEk-lkp@intel.com/

Note: the zen/6.9/prjc HEAD 90e00625dbe63d991978337198b3c43a1df585c9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:48:
   kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
      14 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/alt_core.c:47:
   kernel/sched/alt_sched.h:357:20: note: previous definition of 'flush_smp_call_function_queue' with type 'void(void)'
     357 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'active_balance_cpu_stop':
>> kernel/sched/alt_core.c:4207:28: error: implicit declaration of function '__best_mask_cpu'; did you mean '__set_task_cpu'? [-Werror=implicit-function-declaration]
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                            ^~~~~~~~~~~~~~~
         |                            __set_task_cpu
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/openrisc/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
>> kernel/sched/alt_core.c:4207:58: error: 'sched_cpu_llc_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                          ^~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:54: note: in definition of macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/alt_core.c:4207:50: note: in expansion of macro 'per_cpu'
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                  ^~~~~~~
   kernel/sched/alt_core.c:4207:58: note: each undeclared identifier is reported only once for each function it appears in
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                          ^~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:54: note: in definition of macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:263:49: note: in expansion of macro 'VERIFY_PERCPU_PTR'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:35: note: in expansion of macro 'per_cpu_ptr'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                   ^~~~~~~~~~~
   kernel/sched/alt_core.c:4207:50: note: in expansion of macro 'per_cpu'
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                  ^~~~~~~
>> kernel/sched/alt_core.c:4208:22: error: implicit declaration of function 'move_queued_task'; did you mean 'requeue_task'? [-Werror=implicit-function-declaration]
    4208 |                 rq = move_queued_task(rq, p, dcpu);
         |                      ^~~~~~~~~~~~~~~~
         |                      requeue_task
   kernel/sched/alt_core.c:4208:20: warning: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4208 |                 rq = move_queued_task(rq, p, dcpu);
         |                    ^
   kernel/sched/alt_core.c: In function 'trigger_active_balance':
>> kernel/sched/alt_core.c:4245:45: error: 'struct rq' has no member named 'active_balance_work'
    4245 |                                     arg, &rq->active_balance_work);
         |                                             ^~
   kernel/sched/alt_core.c: In function 'sched_init':
>> kernel/sched/alt_core.c:7683:54: error: 'sched_sg_idle_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
    7683 |         struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      sched_idle_mask
   kernel/sched/alt_core.c:7683:28: warning: unused variable 'balance_arg' [-Wunused-variable]
    7683 |         struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
         |                            ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +4207 kernel/sched/alt_core.c

  4188	
  4189	static int active_balance_cpu_stop(void *data)
  4190	{
  4191		struct balance_arg *arg = data;
  4192		struct task_struct *p = arg->task;
  4193		struct rq *rq = this_rq();
  4194		unsigned long flags;
  4195		cpumask_t tmp;
  4196	
  4197		local_irq_save(flags);
  4198	
  4199		raw_spin_lock(&p->pi_lock);
  4200		raw_spin_lock(&rq->lock);
  4201	
  4202		arg->active = 0;
  4203	
  4204		if (task_on_rq_queued(p) && task_rq(p) == rq &&
  4205		    cpumask_and(&tmp, p->cpus_ptr, arg->cpumask) &&
  4206		    !is_migration_disabled(p)) {
> 4207			int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
> 4208			rq = move_queued_task(rq, p, dcpu);
  4209		}
  4210	
  4211		raw_spin_unlock(&rq->lock);
  4212		raw_spin_unlock_irqrestore(&p->pi_lock, flags);
  4213	
  4214		return 0;
  4215	}
  4216	
  4217	/* trigger_active_balance - for @cpu/@rq */
  4218	static inline int
  4219	trigger_active_balance(struct rq *src_rq, struct rq *rq, struct balance_arg *arg)
  4220	{
  4221		unsigned long flags;
  4222		struct task_struct *p;
  4223		int res;
  4224	
  4225		if (!raw_spin_trylock_irqsave(&rq->lock, flags))
  4226			return 0;
  4227	
  4228		res = (1 == rq->nr_running) &&					\
  4229		      !is_migration_disabled((p = sched_rq_first_task(rq))) &&	\
  4230		      cpumask_intersects(p->cpus_ptr, arg->cpumask) &&		\
  4231		      !arg->active;
  4232		if (res) {
  4233			arg->task = p;
  4234	
  4235			arg->active = 1;
  4236		}
  4237	
  4238		raw_spin_unlock_irqrestore(&rq->lock, flags);
  4239	
  4240		if (res) {
  4241			preempt_disable();
  4242			raw_spin_unlock(&src_rq->lock);
  4243	
  4244			stop_one_cpu_nowait(cpu_of(rq), active_balance_cpu_stop,
> 4245					    arg, &rq->active_balance_work);
  4246	
  4247			preempt_enable();
  4248			raw_spin_lock(&src_rq->lock);
  4249		}
  4250	
  4251		return res;
  4252	}
  4253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
