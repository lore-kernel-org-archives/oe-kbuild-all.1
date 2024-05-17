Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21B38384
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715942153; cv=none; b=rX7Nz3ej/rrsc+wjInaz8aqFkxvImHHYk5N5rjnaUiie8zCuB/Hbaxr7kyJYenBLvk5kAwAXNWbQD1Y+i0Q0ArOmJ9rhjN/a4nGJMJn3+KWSdYIqkLsRfru53IZ5eSeE2WttowdZL76gVzFBDngjjZ6wmIoGw5uYjOTPCFyQVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715942153; c=relaxed/simple;
	bh=ewPdbwzE+M1E+FOMhZUX005DTEkUZaf48GwvhwAx1bU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E7ukPvBMkz9Ux+YIPQdL513NlyNsUkpEnzVZikPHzMnbPQT6MN5S/oTAXsB3mFZIGUFyjcQ1Nd9IGEXfH6ksLkOA8gUq5jucrXdpaORAbj9BtjdlsisNUDfNC0xX56u9WdQIFtodZoVpPV5T7lbsJom2HW9VpK2O6GIsxfMJdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj6OYzhi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj6OYzhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715942151; x=1747478151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewPdbwzE+M1E+FOMhZUX005DTEkUZaf48GwvhwAx1bU=;
  b=aj6OYzhiRoW7ZERjWf4nDMXYLaJZZMzHTJJwLFD1IA18CjEZRqD9jvoY
   LOe2H5oP7y1pjk9Y4HO7epQMZQ2JnY6627RCe8jLX6wmt9V1HNqXgbDOR
   YHjTL+Mr5ZTGiIkS/Ra+CLYGnNQLc1wMoBOElDr0G6gcNgGj/Po0zn7+b
   beJYos9YDpOOOVL6JM8z4Dbt13wAYlMcOIv5CmudheO3Yax38tMKNPyjM
   /IWx77yU2khHaIOKvdWCxRQQ2lpP4PCY0SS4lHcER7xDzbQmp8F5S25vX
   uRjU19FYa/Tl+4luRmulLjFs3MID9HRLcG5wLDDW3W2pArREmBIdQtmAE
   Q==;
X-CSE-ConnectionGUID: Eus5XQpAQS2CgxWS/r5/BA==
X-CSE-MsgGUID: zFcnKyoISEmwnNG2GS6Vhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22716673"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22716673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 03:35:49 -0700
X-CSE-ConnectionGUID: DDO61hA/R161O3+1VfQssQ==
X-CSE-MsgGUID: 8t8W8LYwSJ6zAp2nK/yJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31769797"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 May 2024 03:35:49 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7uwE-0000Ze-0y;
	Fri, 17 May 2024 10:35:46 +0000
Date: Fri, 17 May 2024 18:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 461/472] kernel/sched/alt_core.c:4207:14: error: call
 to undeclared function '__best_mask_cpu'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202405171813.gP8HoPQJ-lkp@intel.com>
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
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240517/202405171813.gP8HoPQJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171813.gP8HoPQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171813.gP8HoPQJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/sched/alt_core.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sched/alt_core.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from kernel/sched/alt_core.c:48:
   kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
      14 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^
   kernel/sched/alt_sched.h:357:20: note: previous definition is here
     357 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^
>> kernel/sched/alt_core.c:4207:14: error: call to undeclared function '__best_mask_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                            ^
   kernel/sched/alt_core.c:4207:14: note: did you mean '__set_task_cpu'?
   kernel/sched/alt_core.c:1514:20: note: '__set_task_cpu' declared here
    1514 | static inline void __set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^
>> kernel/sched/alt_core.c:4207:44: error: use of undeclared identifier 'sched_cpu_llc_mask'; did you mean 'sched_idle_mask'?
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                          ^~~~~~~~~~~~~~~~~~
         |                                                          sched_idle_mask
   include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                                 ^
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                                   ^
   include/linux/percpu-defs.h:259:20: note: expanded from macro 'VERIFY_PERCPU_PTR'
     259 |         __verify_pcpu_ptr(__p);                                         \
         |                           ^
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^
   kernel/sched/alt_core.c:155:25: note: 'sched_idle_mask' declared here
     155 | static cpumask_t *const sched_idle_mask = &sched_preempt_mask[SCHED_QUEUE_BITS - 1];
         |                         ^
>> kernel/sched/alt_core.c:4207:44: error: use of undeclared identifier 'sched_cpu_llc_mask'; did you mean 'sched_idle_mask'?
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                          ^~~~~~~~~~~~~~~~~~
         |                                                          sched_idle_mask
   include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                                 ^
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                                   ^
   include/linux/percpu-defs.h:260:12: note: expanded from macro 'VERIFY_PERCPU_PTR'
     260 |         (typeof(*(__p)) __kernel __force *)(__p);                       \
         |                   ^
   kernel/sched/alt_core.c:155:25: note: 'sched_idle_mask' declared here
     155 | static cpumask_t *const sched_idle_mask = &sched_preempt_mask[SCHED_QUEUE_BITS - 1];
         |                         ^
>> kernel/sched/alt_core.c:4207:44: error: use of undeclared identifier 'sched_cpu_llc_mask'; did you mean 'sched_idle_mask'?
    4207 |                 int dcpu = __best_mask_cpu(&tmp, per_cpu(sched_cpu_llc_mask, cpu_of(rq)));
         |                                                          ^~~~~~~~~~~~~~~~~~
         |                                                          sched_idle_mask
   include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                                 ^
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
     263 | #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
         |                                                                   ^
   include/linux/percpu-defs.h:260:38: note: expanded from macro 'VERIFY_PERCPU_PTR'
     260 |         (typeof(*(__p)) __kernel __force *)(__p);                       \
         |                                             ^
   kernel/sched/alt_core.c:155:25: note: 'sched_idle_mask' declared here
     155 | static cpumask_t *const sched_idle_mask = &sched_preempt_mask[SCHED_QUEUE_BITS - 1];
         |                         ^
>> kernel/sched/alt_core.c:4208:8: error: call to undeclared function 'move_queued_task'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4208 |                 rq = move_queued_task(rq, p, dcpu);
         |                      ^
>> kernel/sched/alt_core.c:4208:6: error: incompatible integer to pointer conversion assigning to 'struct rq *' from 'int' [-Wint-conversion]
    4208 |                 rq = move_queued_task(rq, p, dcpu);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:4245:19: error: no member named 'active_balance_work' in 'struct rq'
    4245 |                                     arg, &rq->active_balance_work);
         |                                           ~~  ^
   kernel/sched/alt_core.c:4721:2: error: call to undeclared function 'hrtick_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4721 |         hrtick_start(rq, next->time_slice);
         |         ^
   kernel/sched/alt_core.c:4721:2: note: did you mean 'hrtimer_start'?
   include/linux/hrtimer.h:272:20: note: 'hrtimer_start' declared here
     272 | static inline void hrtimer_start(struct hrtimer *timer, ktime_t tim,
         |                    ^
   kernel/sched/alt_core.c:7683:47: error: use of undeclared identifier 'sched_sg_idle_mask'; did you mean 'sched_idle_mask'?
    7683 |         struct balance_arg balance_arg = {.cpumask = sched_sg_idle_mask, .active = 0};
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      sched_idle_mask
   kernel/sched/alt_core.c:155:25: note: 'sched_idle_mask' declared here
     155 | static cpumask_t *const sched_idle_mask = &sched_preempt_mask[SCHED_QUEUE_BITS - 1];
         |                         ^
   12 warnings and 10 errors generated.


vim +/__best_mask_cpu +4207 kernel/sched/alt_core.c

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
