Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDA146A6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731236699; cv=none; b=EIYiIAJMaf1OtOw06Te58d1n4/I+g4Lmcrkvv0otxHyTeKMSWHX9VQa/v1yoEVuhT3UuhzuZ0TQ4DHtP1cMDCLThL1o7rT21NlVQRkq4jOZQuKMWnsQaGjalFuztRJcq//03aULnXEtgZrUWEjtY9X7s9M8e6FctftDRJc+UgqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731236699; c=relaxed/simple;
	bh=9MThQTppd4YgC8JrFJ00qtELS5F1LRJahZEos/DWPLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+E7VgM/JOmFJ6hEnuZCp0dqpX9zbZ6vrTkFzhfhZmzXGAl/24TwKiozEr5P8C4fRy5aLcyn6ccJv9Kgq4zd9wHgH02kYdVrra+/Fc5o1MXaQOQ7SVNKUI7jdI/9JuNdO4WkGUtWaVW6ZV5zRgzsORVxN7cuGeEKenTRk0MUIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddXeliRs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddXeliRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731236697; x=1762772697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MThQTppd4YgC8JrFJ00qtELS5F1LRJahZEos/DWPLQ=;
  b=ddXeliRszq1IUQnVs7JQIMRoN8EjKC7sm8SLONown5B71TkCa5w0fuYB
   Mi/fICX7GdCN65miMAOFhgLuesk80GEc6s+Olve2WPgKQYkmrAgZVyVBK
   hy6OnotOa4GsWpR2ziJynLgP2TOKD5jf0Jn8ERGRxQ3yoLmYsVwe6noke
   DIsziKQty8fRNiE8BHQk8ndBMDiIsSodpq/xoHXEF8QxUebfm6cvIVJ1s
   2N+ceEanObcC15cbNM5qC2FWjXS7+GrTrt6cX7QAneuwN3gJD3OqhgDAG
   sGYMrKqQI2Pbt5h5hNwm0V4463jvgsEVYnRvga5q7gXVyubrMBNR1Lof4
   g==;
X-CSE-ConnectionGUID: dnaNyNPFRJqDuk3d0hXf9Q==
X-CSE-MsgGUID: EumlxMhORFeSc8jobyoRkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31227303"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31227303"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 03:04:54 -0800
X-CSE-ConnectionGUID: MRGikLasRgGKQcP5XGbSeQ==
X-CSE-MsgGUID: PVa5FbjIRzi5bCHeb/PrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="90913414"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2024 03:04:51 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA5kP-000069-1g;
	Sun, 10 Nov 2024 11:04:49 +0000
Date: Sun, 10 Nov 2024 19:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/prjc 294/499] kernel/sched/alt_core.c:4421:3: error: call
 to undeclared function 'hrtick_start'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202411101810.z3PmAIcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.11/prjc
head:   355c7c39251ebaf5cca419e0eeac8e0cb7fa3749
commit: eb12a7b51b974d5d081846afd6ae8741716092ed [294/499] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20241110/202411101810.z3PmAIcz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101810.z3PmAIcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101810.z3PmAIcz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from kernel/sched/alt_core.c:42:
   In file included from kernel/sched/sched.h:9:
   kernel/sched/alt_sched.h:481:14: warning: declaration of 'struct cpuidle_state' will not be visible outside of this function [-Wvisibility]
                                     struct cpuidle_state *idle_state)
                                            ^
   kernel/sched/alt_core.c:578:14: error: call to undeclared function 'sched_clock_cpu'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           s64 delta = sched_clock_cpu(cpu_of(rq)) - rq->clock;
                       ^
   kernel/sched/alt_core.c:966:6: warning: no previous prototype for function 'resched_curr' [-Wmissing-prototypes]
   void resched_curr(struct rq *rq)
        ^
   kernel/sched/alt_core.c:966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_curr(struct rq *rq)
   ^
   static 
   kernel/sched/alt_core.c:989:6: warning: no previous prototype for function 'resched_cpu' [-Wmissing-prototypes]
   void resched_cpu(int cpu)
        ^
   kernel/sched/alt_core.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void resched_cpu(int cpu)
   ^
   static 
   kernel/sched/alt_core.c:3021:2: error: call to undeclared function 'rseq_migrate'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           rseq_migrate(p);
           ^
   kernel/sched/alt_core.c:3449:2: error: call to undeclared function 'rseq_preempt'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           rseq_preempt(prev);
           ^
   kernel/sched/alt_core.c:3894:2: error: call to undeclared function 'sched_clock_tick'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           sched_clock_tick();
           ^
   kernel/sched/alt_core.c:3894:2: note: did you mean 'scheduler_tick'?
   kernel/sched/alt_core.c:3887:6: note: 'scheduler_tick' declared here
   void scheduler_tick(void)
        ^
   kernel/sched/alt_core.c:3887:6: warning: no previous prototype for function 'scheduler_tick' [-Wmissing-prototypes]
   void scheduler_tick(void)
        ^
   kernel/sched/alt_core.c:3887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void scheduler_tick(void)
   ^
   static 
>> kernel/sched/alt_core.c:4421:3: error: call to undeclared function 'hrtick_start'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   hrtick_start(rq, next->time_slice);
                   ^
   kernel/sched/alt_core.c:4421:3: note: did you mean 'hrtimer_start'?
   include/linux/hrtimer.h:272:20: note: 'hrtimer_start' declared here
   static inline void hrtimer_start(struct hrtimer *timer, ktime_t tim,
                      ^
   kernel/sched/alt_core.c:4440:2: error: call to undeclared function 'hrtick_start'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           hrtick_start(rq, next->time_slice);
           ^
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
                                   !(prev->flags & PF_FROZEN);
                                                   ^
   kernel/sched/alt_core.c:4674:6: error: call to undeclared function 'tsk_is_pi_blocked'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           if (tsk_is_pi_blocked(tsk))
               ^
   kernel/sched/alt_core.c:5357:3: error: call to undeclared function 'cpuset_read_lock'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   cpuset_read_lock();
                   ^
   kernel/sched/alt_core.c:5357:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpuhplock.h:36:20: note: 'cpus_read_lock' declared here
   static inline void cpus_read_lock(void) { }
                      ^
   kernel/sched/alt_core.c:5405:4: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           cpuset_read_unlock();
                           ^
   kernel/sched/alt_core.c:5437:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   cpuset_read_unlock();
                   ^
   kernel/sched/alt_core.c:5451:3: error: call to undeclared function 'cpuset_read_unlock'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   cpuset_read_unlock();
                   ^
   kernel/sched/alt_core.c:7238:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/alt_core.c:7238:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/alt_core.c:7278:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/alt_core.c:7278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   kernel/sched/alt_core.c:7633:20: warning: no previous prototype for function 'sched_create_group' [-Wmissing-prototypes]
   struct task_group *sched_create_group(struct task_group *parent)
                      ^
   kernel/sched/alt_core.c:7633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct task_group *sched_create_group(struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:7644:6: warning: no previous prototype for function 'sched_online_group' [-Wmissing-prototypes]
   void sched_online_group(struct task_group *tg, struct task_group *parent)
        ^
   kernel/sched/alt_core.c:7644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_online_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/alt_core.c:7655:6: warning: no previous prototype for function 'sched_destroy_group' [-Wmissing-prototypes]
   void sched_destroy_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:7655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_destroy_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:7661:6: warning: no previous prototype for function 'sched_release_group' [-Wmissing-prototypes]
   void sched_release_group(struct task_group *tg)
        ^
   kernel/sched/alt_core.c:7661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_release_group(struct task_group *tg)
   ^
   static 
   kernel/sched/alt_core.c:7731:5: warning: no previous prototype for function 'sched_group_set_shares' [-Wmissing-prototypes]
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
       ^
   kernel/sched/alt_core.c:7731:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_group_set_shares(struct task_group *tg, unsigned long shares)
   ^
   static 
   kernel/sched/alt_core.c:7800:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .legacy_cftypes = cpu_legacy_files,
                             ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7799:20: note: previous initialization is here
           .legacy_cftypes = cpu_files,
                             ^~~~~~~~~
   24 warnings and 12 errors generated.


vim +/hrtick_start +4421 kernel/sched/alt_core.c

ce5a2e79cb434d Alfred Chen 2019-08-19  4399  
ce5a2e79cb434d Alfred Chen 2019-08-19  4400  static inline struct task_struct *
ce5a2e79cb434d Alfred Chen 2019-08-19  4401  choose_next_task(struct rq *rq, int cpu, struct task_struct *prev)
ce5a2e79cb434d Alfred Chen 2019-08-19  4402  {
ce5a2e79cb434d Alfred Chen 2019-08-19  4403  	struct task_struct *next;
ce5a2e79cb434d Alfred Chen 2019-08-19  4404  
ce5a2e79cb434d Alfred Chen 2019-08-19  4405  	if (unlikely(rq->skip)) {
ce5a2e79cb434d Alfred Chen 2019-08-19  4406  		next = rq_runnable_task(rq);
ce5a2e79cb434d Alfred Chen 2019-08-19  4407  		if (next == rq->idle) {
ce5a2e79cb434d Alfred Chen 2019-08-19  4408  #ifdef	CONFIG_SMP
ce5a2e79cb434d Alfred Chen 2019-08-19  4409  			if (!take_other_rq_tasks(rq, cpu)) {
ce5a2e79cb434d Alfred Chen 2019-08-19  4410  #endif
ce5a2e79cb434d Alfred Chen 2019-08-19  4411  				rq->skip = NULL;
ce5a2e79cb434d Alfred Chen 2019-08-19  4412  				schedstat_inc(rq->sched_goidle);
ce5a2e79cb434d Alfred Chen 2019-08-19  4413  				return next;
ce5a2e79cb434d Alfred Chen 2019-08-19  4414  #ifdef	CONFIG_SMP
ce5a2e79cb434d Alfred Chen 2019-08-19  4415  			}
ce5a2e79cb434d Alfred Chen 2019-08-19  4416  			next = rq_runnable_task(rq);
ce5a2e79cb434d Alfred Chen 2019-08-19  4417  #endif
ce5a2e79cb434d Alfred Chen 2019-08-19  4418  		}
ce5a2e79cb434d Alfred Chen 2019-08-19  4419  		rq->skip = NULL;
ce5a2e79cb434d Alfred Chen 2019-08-19  4420  #ifdef CONFIG_HIGH_RES_TIMERS
ce5a2e79cb434d Alfred Chen 2019-08-19 @4421  		hrtick_start(rq, next->time_slice);
ce5a2e79cb434d Alfred Chen 2019-08-19  4422  #endif
ce5a2e79cb434d Alfred Chen 2019-08-19  4423  		return next;
ce5a2e79cb434d Alfred Chen 2019-08-19  4424  	}
ce5a2e79cb434d Alfred Chen 2019-08-19  4425  
ce5a2e79cb434d Alfred Chen 2019-08-19  4426  	next = sched_rq_first_task(rq);
ce5a2e79cb434d Alfred Chen 2019-08-19  4427  	if (next == rq->idle) {
ce5a2e79cb434d Alfred Chen 2019-08-19  4428  #ifdef	CONFIG_SMP
ce5a2e79cb434d Alfred Chen 2019-08-19  4429  		if (!take_other_rq_tasks(rq, cpu)) {
ce5a2e79cb434d Alfred Chen 2019-08-19  4430  #endif
ce5a2e79cb434d Alfred Chen 2019-08-19  4431  			schedstat_inc(rq->sched_goidle);
62b0a6f7432ed2 Alfred Chen 2020-08-09  4432  			/*printk(KERN_INFO "sched: choose_next_task(%d) idle %px\n", cpu, next);*/
ce5a2e79cb434d Alfred Chen 2019-08-19  4433  			return next;
ce5a2e79cb434d Alfred Chen 2019-08-19  4434  #ifdef	CONFIG_SMP
ce5a2e79cb434d Alfred Chen 2019-08-19  4435  		}
ce5a2e79cb434d Alfred Chen 2019-08-19  4436  		next = sched_rq_first_task(rq);
ce5a2e79cb434d Alfred Chen 2019-08-19  4437  #endif
ce5a2e79cb434d Alfred Chen 2019-08-19  4438  	}
ce5a2e79cb434d Alfred Chen 2019-08-19  4439  #ifdef CONFIG_HIGH_RES_TIMERS
ce5a2e79cb434d Alfred Chen 2019-08-19  4440  	hrtick_start(rq, next->time_slice);
ce5a2e79cb434d Alfred Chen 2019-08-19  4441  #endif
62b0a6f7432ed2 Alfred Chen 2020-08-09  4442  	/*printk(KERN_INFO "sched: choose_next_task(%d) next %px\n", cpu,
62b0a6f7432ed2 Alfred Chen 2020-08-09  4443  	 * next);*/
ce5a2e79cb434d Alfred Chen 2019-08-19  4444  	return next;
ce5a2e79cb434d Alfred Chen 2019-08-19  4445  }
ce5a2e79cb434d Alfred Chen 2019-08-19  4446  

:::::: The code at line 4421 was first introduced by commit
:::::: ce5a2e79cb434dd19c9e68f22d13090d097e8731 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
