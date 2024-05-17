Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D95103F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715938317; cv=none; b=XVTUvZu1sQXUi//fFS4kZ/PTO0LaIO8AnaafASWQSsWs14fKEARCQkZtvL1OSm3l9ZkrBjwL+6hXmTy4a355HjgXS93FurF7WOofllB9YJEov9l6sJUy0VrsIRovqphhbcDLRU35WPmiWTSdvdsTBeCpDOFmglsQZyyIPGLoPyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715938317; c=relaxed/simple;
	bh=67OyUCN9V5c5/CjALCn2O6w/T2IBZq5+EExc2WPb/ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2QMjRlJShTMWvcyAVa/aKZDpc69wBztVg/s1zmRGwcqDacg5dLK5LQzi4OF7kg/92nL2kMcUgHaFsctZZiWAv65EZ+8njHY2wg+RBRIeICaqhiQf6/CMfzcWDMeZOI25xxoMSMHcz/63liV5C1DNlG1gxNLgkcur/y2qtUqm5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ms0sGEuG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ms0sGEuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715938316; x=1747474316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=67OyUCN9V5c5/CjALCn2O6w/T2IBZq5+EExc2WPb/ao=;
  b=Ms0sGEuGCcrKPymXd4nl9K1pYwK8jrDpLjfqEJQ8hl/BOuQD51JbhkcY
   2UqMkXoMQQY7u3hLTcyd2phwRIOVcnFc38ucQm+kSOQbDwz0icz5K3GOF
   TDg6hBK/waHnm2r7L4twggyOrewq/PeAQvTzwtSNRRaPtm2v6DSHbT57z
   PRSiL4COAW0MJBcbbchZYjCfoCKvsmNgWM0MBJj5oXmU/decbBrlq49zo
   +0hDJEibLBDixkB+aaxTsjFideySNtbJcV0SgwATCTYB1MvTFrI4d1XGb
   UXZ/ZSmQU4ioQt+SdhkJUcqWrRLEMVv/nF3UEkCxFNFHVhbaXzo0gInM3
   Q==;
X-CSE-ConnectionGUID: 3gZXIK6xS6y+eykRWAKb5w==
X-CSE-MsgGUID: X6tzaapSS0+DkDWxhDodPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22780986"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22780986"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 02:31:55 -0700
X-CSE-ConnectionGUID: HO1nTBvSQvW8h9BsGVPssg==
X-CSE-MsgGUID: y1oQfA5jSy+QOfmJS8a0JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31735628"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2024 02:31:54 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7twM-0000Wu-0q;
	Fri, 17 May 2024 09:31:50 +0000
Date: Fri, 17 May 2024 17:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 461/472] kernel/sched/alt_core.c:4208:20: warning:
 assignment to 'struct rq *' from 'int' makes pointer from integer without a
 cast
Message-ID: <202405171757.1NcU7y3q-lkp@intel.com>
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
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240517/202405171757.1NcU7y3q-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171757.1NcU7y3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171757.1NcU7y3q-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   kernel/sched/alt_core.c:4207:28: error: implicit declaration of function '__best_mask_cpu'; did you mean '__set_task_cpu'? [-Werror=implicit-function-declaration]
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
   kernel/sched/alt_core.c:4207:58: error: 'sched_cpu_llc_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
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
   kernel/sched/alt_core.c:4208:22: error: implicit declaration of function 'move_queued_task'; did you mean 'requeue_task'? [-Werror=implicit-function-declaration]
    4208 |                 rq = move_queued_task(rq, p, dcpu);
         |                      ^~~~~~~~~~~~~~~~
         |                      requeue_task
>> kernel/sched/alt_core.c:4208:20: warning: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4208 |                 rq = move_queued_task(rq, p, dcpu);
         |                    ^
   kernel/sched/alt_core.c: In function 'trigger_active_balance':
   kernel/sched/alt_core.c:4245:45: error: 'struct rq' has no member named 'active_balance_work'
    4245 |                                     arg, &rq->active_balance_work);
         |                                             ^~
   kernel/sched/alt_core.c: In function 'sched_init':
   kernel/sched/alt_core.c:7683:54: error: 'sched_sg_idle_mask' undeclared (first use in this function); did you mean 'sched_idle_mask'?
    7683 |         struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      sched_idle_mask
   kernel/sched/alt_core.c:7683:28: warning: unused variable 'balance_arg' [-Wunused-variable]
    7683 |         struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
         |                            ^~~~~~~~~~~
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
