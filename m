Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4126FB9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 04:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717216629; cv=none; b=L7rAzf1nb8iIAtTrTmElSi69hZ1U8Jdxx4c2aBRZoUyTA8KlVvhD24xzBF5twajtefRBucOJ146lxi5Rp4nLdPbNStBeuMZb/3ymsrPypgy3L5L8faN/8YNaRZvplUqOzc7LJZRr06oNLf7w+Yk57s4Q25h7nDcRycJ57iu0o2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717216629; c=relaxed/simple;
	bh=cI02ZdRER8wMAwEAPeMn7mXRWAQEyMdvqfPmeFGMFZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URRz4n3Qnjl9KWbhIWfcHmiI4cI2G2CB8DLZWTfXjYrB8bdFUSyHawn7O/mUoWz9MB+VErRu+Vtw0wXizgvpDZRkB1dycEZvlcdD2BdTznmBo/NrfiK+OC218/YZbVDJ5NylN1k7Rg86kYdI7z/EGh2Ji24iVmy7ZORem2vTHwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zorz1eon; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zorz1eon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717216627; x=1748752627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cI02ZdRER8wMAwEAPeMn7mXRWAQEyMdvqfPmeFGMFZs=;
  b=Zorz1eon/keWXbSovIL9M8jAf8nCQpppyFPA5x68B/pU6QnMdg8nJuxc
   QLcmLQj4Zho+ESNy4+e3wDHzcBWs9BMrJZyqGM+6UvQDDM5k4gX3tAha5
   Kf9O0FROkeirFxhoQmptOaRCsMu4qGz544qe/0o51W2qb89X5xBAGPs5L
   WUgqRU7vgEBJMGo5ykz0c1M5WhF++jD1KruOMhLs1AdfPzTRBQujpN+Dg
   K9u+VNlbDt1SOGCNEeEvBeMr/YP2yOTkuA+OtDxkfWISoE6eP2emUlrYy
   e1mIJgK9ovRH/o1CaK/OUxbORPzTb/PuAhd5UDQigVpyH829VFLyFXcpC
   Q==;
X-CSE-ConnectionGUID: PZwyiO9fQBOwXfOZqcxHtg==
X-CSE-MsgGUID: pbUw6T+aT/CRXlfCuOEUcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24893314"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="24893314"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 21:37:06 -0700
X-CSE-ConnectionGUID: HVS8BmnJSsWjNkUcWubDrw==
X-CSE-MsgGUID: M7gaF/rOSNWMl7FekdF/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="40900849"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 21:37:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDGUJ-000IP5-0z;
	Sat, 01 Jun 2024 04:37:03 +0000
Date: Sat, 1 Jun 2024 12:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 461/473] kernel/sched/alt_core.c:4208:6: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202406011244.OJQBOe5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/prjc
head:   8964d2061c8f25fc8c96de75a0f9e3234ae61c6e
commit: f90f6c0ad3cb7786aa8308e4669ea037dabf7476 [461/473] sched/alt: Generic active_balance_cpu_stop()
config: i386-randconfig-011-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011244.OJQBOe5s-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011244.OJQBOe5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011244.OJQBOe5s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:48:0:
   kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
    static inline void flush_smp_call_function_queue(void) { }
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:9:0,
                    from kernel/sched/alt_core.c:47:
   kernel/sched/alt_sched.h:357:20: note: previous definition of 'flush_smp_call_function_queue' was here
    static inline void flush_smp_call_function_queue(void) { }
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'active_balance_cpu_stop':
   kernel/sched/alt_core.c:4207:14: error: implicit declaration of function '__best_mask_cpu'; did you mean '__set_task_cpu'? [-Werror=implicit-function-declaration]
      int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
                 ^~~~~~~~~~~~~~~
                 __set_task_cpu
   In file included from include/asm-generic/percpu.h:7:0,
                    from arch/x86/include/asm/percpu.h:615,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c:4207:44: error: 'sched_cpu_llc_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
      int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
                                               ^
   include/linux/percpu-defs.h:219:47: note: in definition of macro '__verify_pcpu_ptr'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                  ^~~
   include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PERCPU_PTR'
    #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:29: note: in expansion of macro 'per_cpu_ptr'
    #define per_cpu(var, cpu) (*per_cpu_ptr(&(var), cpu))
                                ^~~~~~~~~~~
   kernel/sched/alt_core.c:4207:36: note: in expansion of macro 'per_cpu'
      int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
                                       ^~~~~~~
   kernel/sched/alt_core.c:4207:44: note: each undeclared identifier is reported only once for each function it appears in
      int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
                                               ^
   include/linux/percpu-defs.h:219:47: note: in definition of macro '__verify_pcpu_ptr'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                  ^~~
   include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PERCPU_PTR'
    #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:29: note: in expansion of macro 'per_cpu_ptr'
    #define per_cpu(var, cpu) (*per_cpu_ptr(&(var), cpu))
                                ^~~~~~~~~~~
   kernel/sched/alt_core.c:4207:36: note: in expansion of macro 'per_cpu'
      int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
                                       ^~~~~~~
   kernel/sched/alt_core.c:4208:8: error: implicit declaration of function 'move_queued_task'; did you mean 'requeue_task'? [-Werror=implicit-function-declaration]
      rq = move_queued_task(rq, p, dcpu);
           ^~~~~~~~~~~~~~~~
           requeue_task
>> kernel/sched/alt_core.c:4208:6: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      rq = move_queued_task(rq, p, dcpu);
         ^
   kernel/sched/alt_core.c: In function 'trigger_active_balance':
   kernel/sched/alt_core.c:4245:17: error: 'struct rq' has no member named 'active_balance_work'
            arg, &rq->active_balance_work);
                    ^~
   kernel/sched/alt_core.c: In function 'sched_init':
   kernel/sched/alt_core.c:7683:47: error: 'sched_sg_idle_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
     struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
                                                  ^~~~~~~~~~~~~~~~~~
                                                  sched_idle_mask
   kernel/sched/alt_core.c:7683:21: warning: unused variable 'balance_arg' [-Wunused-variable]
     struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
                        ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +4208 kernel/sched/alt_core.c

561e42ce50942d Alfred Chen 2019-08-19  4188  
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4189  static int active_balance_cpu_stop(void *data)
561e42ce50942d Alfred Chen 2019-08-19  4190  {
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4191  	struct balance_arg *arg = data;
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4192  	struct task_struct *p = arg->task;
561e42ce50942d Alfred Chen 2019-08-19  4193  	struct rq *rq = this_rq();
561e42ce50942d Alfred Chen 2019-08-19  4194  	unsigned long flags;
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4195  	cpumask_t tmp;
561e42ce50942d Alfred Chen 2019-08-19  4196  
561e42ce50942d Alfred Chen 2019-08-19  4197  	local_irq_save(flags);
561e42ce50942d Alfred Chen 2019-08-19  4198  
561e42ce50942d Alfred Chen 2019-08-19  4199  	raw_spin_lock(&p->pi_lock);
561e42ce50942d Alfred Chen 2019-08-19  4200  	raw_spin_lock(&rq->lock);
561e42ce50942d Alfred Chen 2019-08-19  4201  
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4202  	arg->active = 0;
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4203  
561e42ce50942d Alfred Chen 2019-08-19  4204  	if (task_on_rq_queued(p) && task_rq(p) == rq &&
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4205  	    cpumask_and(&tmp, p->cpus_ptr, arg->cpumask) &&
f445b324dd06c9 Alfred Chen 2021-03-14  4206  	    !is_migration_disabled(p)) {
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4207  		int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
561e42ce50942d Alfred Chen 2019-08-19 @4208  		rq = move_queued_task(rq, p, dcpu);
66606cb1479a7c Alfred Chen 2020-11-03  4209  	}
561e42ce50942d Alfred Chen 2019-08-19  4210  
561e42ce50942d Alfred Chen 2019-08-19  4211  	raw_spin_unlock(&rq->lock);
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4212  	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
561e42ce50942d Alfred Chen 2019-08-19  4213  
561e42ce50942d Alfred Chen 2019-08-19  4214  	return 0;
561e42ce50942d Alfred Chen 2019-08-19  4215  }
561e42ce50942d Alfred Chen 2019-08-19  4216  

:::::: The code at line 4208 was first introduced by commit
:::::: 561e42ce50942dea67eafbee0a4b48d1b0b7b7ac Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
