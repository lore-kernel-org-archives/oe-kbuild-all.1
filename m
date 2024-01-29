Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3E3DDC6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 01:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706492759; cv=none; b=t5SJx9SMm3EoMj6HjPRLAe4vVDEYnSlep/TzmHZF49eXPdgrEgMxp0xw/zbuAntUYKOv1VRw961f3w3N967hEwkNCGI6SGv1dAFnQRrE3gCid77FxTo8JC+9u9G3ZX6PN7Fy3wX1qLQpKZhETtGUOfgawQJH7n5UNvBnXRHyWpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706492759; c=relaxed/simple;
	bh=2uVZZkCu2mgBOC8C6J31sadzhS23iWOfy4G/SuepWIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z3L5SSeHKASKxCkKjvCQ5DJ/W+mVnkUHnDJBClQlSeeBu3bIZ5ZUwRkuy6gIKdqYizDwvk4Ken7agFzIt+Bd0+0c5372B9lKzsI7z5kmme5P6MrbVCnQp9r9UJoscW5tDUE4AB0afAupgT799tcKU/YEszKtYBfFLJD8YUiLKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ns7V/dCO; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ns7V/dCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706492756; x=1738028756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2uVZZkCu2mgBOC8C6J31sadzhS23iWOfy4G/SuepWIw=;
  b=Ns7V/dCO3wR1pBDmHhg7ZqkNCjx9sJW0aGRTrUyYp9AD3u+RozvRJcNW
   6GzViaUhfXyfUF6tQCIduCRoiJMMYgvvFFMnqB1748Aax6hBP08bG5zxw
   e4aTcSmu+wazfMmv8gvv2lUPEl4dHw4HiJa32ORXR2ZmesB2J8dl5zVAJ
   b/KzoP+7TDfnukRG8AtV7kxsV5y32N6bNtStJcYlAIFhQ+oGctzueBoiJ
   RutudgBuSCZawZrjXdaoOG1EcPgRyKqo5Rb0CC3LKBXhLYp2iTU4MwPqE
   Lg1bsjtYKb4bURQKK55QzwUdBWOuAIjenunnnx33PuU73NoxyKMCK3XLs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393262423"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="393262423"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 17:45:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="910898341"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="910898341"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2024 17:45:54 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUGie-0003wH-1j;
	Mon, 29 Jan 2024 01:45:52 +0000
Date: Mon, 29 Jan 2024 09:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/prjc 294/431] kernel/sched/alt_core.c:4421:3: error: call
 to undeclared function 'hrtick_start'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202401290939.dGYMLyML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.7/prjc
head:   31561c8ccf8a088f0c1ccefa592b221423781ce2
commit: 8ba0ab052a7464503f11589aa0248012e7c8ee16 [294/431] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240129/202401290939.dGYMLyML-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290939.dGYMLyML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290939.dGYMLyML-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:6:
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
   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:6:
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
   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:6:
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
   In file included from kernel/sched/alt_core.c:42:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:481:14: warning: declaration of 'struct cpuidle_state' will not be visible outside of this function [-Wvisibility]
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^
   kernel/sched/alt_core.c:578:14: error: call to undeclared function 'sched_clock_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     578 |         s64 delta = sched_clock_cpu(cpu_of(rq)) - rq->clock;
         |                     ^
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
     966 | void resched_curr(struct rq *rq)
         |      ^
   kernel/sched/alt_core.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     966 | void resched_curr(struct rq *rq)
         | ^
         | static 
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
     989 | void resched_cpu(int cpu)
         |      ^
   kernel/sched/alt_core.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     989 | void resched_cpu(int cpu)
         | ^
         | static 
   kernel/sched/alt_core.c:3894:2: error: call to undeclared function 'sched_clock_tick'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3894 |         sched_clock_tick();
         |         ^
   kernel/sched/alt_core.c:3894:2: note: did you mean 'scheduler_tick'?
   kernel/sched/alt_core.c:3887:6: note: 'scheduler_tick' declared here
    3887 | void scheduler_tick(void)
         |      ^
    3888 | {
    3889 |         int cpu __maybe_unused = smp_processor_id();
    3890 |         struct rq *rq = cpu_rq(cpu);
    3891 |         u64 resched_latency;
    3892 | 
    3893 |         arch_scale_freq_tick();
    3894 |         sched_clock_tick();
         |         ~~~~~~~~~~~~~~~~
         |         scheduler_tick
>> kernel/sched/alt_core.c:4421:3: error: call to undeclared function 'hrtick_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4421 |                 hrtick_start(rq, next->time_slice);
         |                 ^
   kernel/sched/alt_core.c:4421:3: note: did you mean 'hrtimer_start'?
   include/linux/hrtimer.h:415:20: note: 'hrtimer_start' declared here
     415 | static inline void hrtimer_start(struct hrtimer *timer, ktime_t tim,
         |                    ^
   kernel/sched/alt_core.c:4440:2: error: call to undeclared function 'hrtick_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4440 |         hrtick_start(rq, next->time_slice);
         |         ^
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
    4558 |                                 !(prev->flags & PF_FROZEN);
         |                                                 ^
   kernel/sched/alt_core.c:4674:6: error: call to undeclared function 'tsk_is_pi_blocked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4674 |         if (tsk_is_pi_blocked(tsk))
         |             ^
   kernel/sched/alt_core.c:5357:3: error: call to undeclared function 'cpuset_read_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5357 |                 cpuset_read_lock();
         |                 ^
   kernel/sched/alt_core.c:5357:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpu.h:148:20: note: 'cpus_read_lock' declared here
     148 | static inline void cpus_read_lock(void) { }
         |                    ^
   kernel/sched/alt_core.c:5405:4: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5405 |                         cpuset_read_unlock();
         |                         ^
   kernel/sched/alt_core.c:5437:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5437 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:5451:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5451 |                 cpuset_read_unlock();
         |                 ^
   kernel/sched/alt_core.c:7238:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
    7238 | void __init sched_init_smp(void)
         |             ^
   kernel/sched/alt_core.c:7238:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7238 | void __init sched_init_smp(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
    7278 | void __init sched_init(void)
         |             ^
   kernel/sched/alt_core.c:7278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7278 | void __init sched_init(void)
         | ^
         | static 
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         |                    ^
   kernel/sched/alt_core.c:7633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7633 | struct task_group *sched_create_group(struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         |      ^
   kernel/sched/alt_core.c:7644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7644 | void sched_online_group(struct task_group *tg, struct task_group *parent)
         | ^
         | static 
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
    7655 | void sched_destroy_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7655 | void sched_destroy_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
    7661 | void sched_release_group(struct task_group *tg)
         |      ^
   kernel/sched/alt_core.c:7661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7661 | void sched_release_group(struct task_group *tg)
         | ^
         | static 
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         |     ^
   kernel/sched/alt_core.c:7731:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7731 | int sched_group_set_shares(struct task_group *tg, unsigned long shares)
         | ^
         | static 
   22 warnings and 10 errors generated.


vim +/hrtick_start +4421 kernel/sched/alt_core.c

fbfe8ff6c6b93b Alfred Chen 2019-08-19  4399  
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4400  static inline struct task_struct *
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4401  choose_next_task(struct rq *rq, int cpu, struct task_struct *prev)
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4402  {
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4403  	struct task_struct *next;
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4404  
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4405  	if (unlikely(rq->skip)) {
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4406  		next = rq_runnable_task(rq);
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4407  		if (next == rq->idle) {
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4408  #ifdef	CONFIG_SMP
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4409  			if (!take_other_rq_tasks(rq, cpu)) {
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4410  #endif
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4411  				rq->skip = NULL;
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4412  				schedstat_inc(rq->sched_goidle);
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4413  				return next;
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4414  #ifdef	CONFIG_SMP
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4415  			}
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4416  			next = rq_runnable_task(rq);
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4417  #endif
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4418  		}
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4419  		rq->skip = NULL;
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4420  #ifdef CONFIG_HIGH_RES_TIMERS
fbfe8ff6c6b93b Alfred Chen 2019-08-19 @4421  		hrtick_start(rq, next->time_slice);
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4422  #endif
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4423  		return next;
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4424  	}
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4425  
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4426  	next = sched_rq_first_task(rq);
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4427  	if (next == rq->idle) {
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4428  #ifdef	CONFIG_SMP
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4429  		if (!take_other_rq_tasks(rq, cpu)) {
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4430  #endif
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4431  			schedstat_inc(rq->sched_goidle);
c05e232dfa21b5 Alfred Chen 2020-08-09  4432  			/*printk(KERN_INFO "sched: choose_next_task(%d) idle %px\n", cpu, next);*/
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4433  			return next;
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4434  #ifdef	CONFIG_SMP
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4435  		}
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4436  		next = sched_rq_first_task(rq);
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4437  #endif
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4438  	}
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4439  #ifdef CONFIG_HIGH_RES_TIMERS
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4440  	hrtick_start(rq, next->time_slice);
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4441  #endif
c05e232dfa21b5 Alfred Chen 2020-08-09  4442  	/*printk(KERN_INFO "sched: choose_next_task(%d) next %px\n", cpu,
c05e232dfa21b5 Alfred Chen 2020-08-09  4443  	 * next);*/
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4444  	return next;
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4445  }
fbfe8ff6c6b93b Alfred Chen 2019-08-19  4446  

:::::: The code at line 4421 was first introduced by commit
:::::: fbfe8ff6c6b93b06975504d6aed3ebf3c0a6c25a Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
