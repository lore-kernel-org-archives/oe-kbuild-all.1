Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136061CABB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720947011; cv=none; b=T3dZWKcqdx88i6H2OtrtZctoyxr/iQGngNns1il8Iq+4tTl7DFoW31+6pWd9REYZSybVgHQ1J77fR9Z7zxNU3ifhvq3NW4P7mcBmGeOh16wRDlcvjzU9Bo3e4tc2Om6TmfkUbiiPFjW1hgRryYz9i1GPC1J5zYYV9DA/cqE8iZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720947011; c=relaxed/simple;
	bh=0wvIupGVJs9ujp03fJ0wRWR2ItebKnAv6q1VuS/ZXKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1a/rzztjnoknQ0J42NriJ/VgvXahd+WDRzACDYoumRGv7hctyR8RcSsXX6mDNmfXFwbEF0AspPJDdzVGG0uUsnIEQfQkvAqfffBJot0ZtqxAHgJKVknbnNKWMagc5KCHBO/FXMYKFFqml/4NSm8mZ/0RWXe9Cphso35F0zrCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dH9wh9MM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH9wh9MM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720947009; x=1752483009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0wvIupGVJs9ujp03fJ0wRWR2ItebKnAv6q1VuS/ZXKo=;
  b=dH9wh9MMkLjRAPANt2hQtBxOYoJi3WeCNbM59Wqda5+KF5AteFL/azjm
   0OMUu0ly6Dj0A5NRF8iJK5x6RhPoliec3/W2gbJN0AexOcThtFS8Apw8G
   14RLxtB+xUOXICjASJA1pHRIaJmrYkQVPJ60Bua0hptQqWt5qsC/Wl5no
   jo99bA6XHolw3jOpHu60cEzugb57GVOh0f5k/EL+mBKilecsTtiXWfMHu
   wHB4lpkgq7v36V/D0mSN4D4i2jTWdzRMjgEUaCgYSqnzEtxZsXY+d1g3O
   uHqepxI/N7cAuE0hKvInSyhH+nPkSCOK5e/8OMc57nG0hxTbw9rUr99qs
   Q==;
X-CSE-ConnectionGUID: s3hKSnA7R0eXyon0mltZQQ==
X-CSE-MsgGUID: ro1RV+bnRPmPRs/dvxXpyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18492863"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="18492863"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 01:50:08 -0700
X-CSE-ConnectionGUID: VmceBxSuQ1CXUnrES2jcUA==
X-CSE-MsgGUID: dV+NVNRTQdmzHLbqFwUpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49049340"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2024 01:50:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSuvl-000dH0-1O;
	Sun, 14 Jul 2024 08:50:05 +0000
Date: Sun, 14 Jul 2024 16:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 3/4] kernel/sched/alt_core.c:4216:20: error:
 assignment to 'struct rq *' from 'int' makes pointer from integer without a
 cast
Message-ID: <202407141645.znGvEgnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/prjc
head:   5d131fcb17bc5c82ac8e5cf6217da8b8ea79453b
commit: 8964d2061c8f25fc8c96de75a0f9e3234ae61c6e [3/4] fixup! ZEN: sched/alt: Set default timeslice to 2ms
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240714/202407141645.znGvEgnO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141645.znGvEgnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141645.znGvEgnO-lkp@intel.com/

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
   kernel/sched/alt_core.c:4215:28: error: implicit declaration of function '__best_mask_cpu'; did you mean '__set_task_cpu'? [-Wimplicit-function-declaration]
    4215 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                            ^~~~~~~~~~~~~~~
         |                            __set_task_cpu
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/sh/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/sh/include/asm/cmpxchg-irq.h:5,
                    from arch/sh/include/asm/cmpxchg.h:20,
                    from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
   kernel/sched/alt_core.c:4215:58: error: 'sched_cpu_llc_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
    4215 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
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
   kernel/sched/alt_core.c:4215:50: note: in expansion of macro 'per_cpu'
    4215 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                  ^~~~~~~
   kernel/sched/alt_core.c:4215:58: note: each undeclared identifier is reported only once for each function it appears in
    4215 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
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
   kernel/sched/alt_core.c:4215:50: note: in expansion of macro 'per_cpu'
    4215 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                  ^~~~~~~
   kernel/sched/alt_core.c:4216:22: error: implicit declaration of function 'move_queued_task'; did you mean 'requeue_task'? [-Wimplicit-function-declaration]
    4216 |                 rq = move_queued_task(rq, p, dcpu);
         |                      ^~~~~~~~~~~~~~~~
         |                      requeue_task
>> kernel/sched/alt_core.c:4216:20: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4216 |                 rq = move_queued_task(rq, p, dcpu);
         |                    ^
   kernel/sched/alt_core.c: In function 'trigger_active_balance':
   kernel/sched/alt_core.c:4253:45: error: 'struct rq' has no member named 'active_balance_work'
    4253 |                                     arg, &rq->active_balance_work);
         |                                             ^~
   kernel/sched/alt_core.c: In function 'sched_init':
   kernel/sched/alt_core.c:7704:54: error: 'sched_sg_idle_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
    7704 |         struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      sched_idle_mask
   kernel/sched/alt_core.c:7704:28: warning: unused variable 'balance_arg' [-Wunused-variable]
    7704 |         struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
         |                            ^~~~~~~~~~~


vim +4216 kernel/sched/alt_core.c

561e42ce50942d Alfred Chen 2019-08-19  4196  
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4197  static int active_balance_cpu_stop(void *data)
561e42ce50942d Alfred Chen 2019-08-19  4198  {
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4199  	struct balance_arg *arg = data;
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4200  	struct task_struct *p = arg->task;
561e42ce50942d Alfred Chen 2019-08-19  4201  	struct rq *rq = this_rq();
561e42ce50942d Alfred Chen 2019-08-19  4202  	unsigned long flags;
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4203  	cpumask_t tmp;
561e42ce50942d Alfred Chen 2019-08-19  4204  
561e42ce50942d Alfred Chen 2019-08-19  4205  	local_irq_save(flags);
561e42ce50942d Alfred Chen 2019-08-19  4206  
561e42ce50942d Alfred Chen 2019-08-19  4207  	raw_spin_lock(&p->pi_lock);
561e42ce50942d Alfred Chen 2019-08-19  4208  	raw_spin_lock(&rq->lock);
561e42ce50942d Alfred Chen 2019-08-19  4209  
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4210  	arg->active = 0;
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4211  
561e42ce50942d Alfred Chen 2019-08-19  4212  	if (task_on_rq_queued(p) && task_rq(p) == rq &&
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4213  	    cpumask_and(&tmp, p->cpus_ptr, arg->cpumask) &&
f445b324dd06c9 Alfred Chen 2021-03-14  4214  	    !is_migration_disabled(p)) {
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4215  		int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
561e42ce50942d Alfred Chen 2019-08-19 @4216  		rq = move_queued_task(rq, p, dcpu);
66606cb1479a7c Alfred Chen 2020-11-03  4217  	}
561e42ce50942d Alfred Chen 2019-08-19  4218  
561e42ce50942d Alfred Chen 2019-08-19  4219  	raw_spin_unlock(&rq->lock);
f90f6c0ad3cb77 Alfred Chen 2024-02-20  4220  	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
561e42ce50942d Alfred Chen 2019-08-19  4221  
561e42ce50942d Alfred Chen 2019-08-19  4222  	return 0;
561e42ce50942d Alfred Chen 2019-08-19  4223  }
561e42ce50942d Alfred Chen 2019-08-19  4224  

:::::: The code at line 4216 was first introduced by commit
:::::: 561e42ce50942dea67eafbee0a4b48d1b0b7b7ac Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
