Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38E481DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710347339; cv=none; b=RDHsh8YI1uDg58/VP8A7aBOX/KfqHzcI6teVhKZFUsCsnqBY33WkI4iyKUBKBEvXSDNgtr1xOiAJTBMQvdcVidROpQGVZ1OdO2vFgfb6Ezp3M73CRoLa2SCQkwSr8g1u2qUlfHHdOcVidBpVcBDyEvzPLqUZOdeva5WHbADX8o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710347339; c=relaxed/simple;
	bh=yEDRPg82EzeLrfTavprVBbXHv2EZPPaQU60LUy/z7xU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQmIk5z2mzHufo1tsHawyvQILqg1/yQaD0AJV+o75LWRlWfBvNWPL/8K1j6ROZtbBaQBOExF396Tg7lPljGBCydhW0IQWKQQ56q0KElfeZrH0hBTsR3hDqJEfON8TjlayNeKh4I+cfSikJ8oz80aZt8KJx/+FMFw8Ae2XdY7b48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6DkJ9PV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6DkJ9PV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710347337; x=1741883337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEDRPg82EzeLrfTavprVBbXHv2EZPPaQU60LUy/z7xU=;
  b=m6DkJ9PVD2kDjofPRKudRhHWTdUMghH2eWwyHZfax6I8bvZ2Hapez5x7
   +oyF9CEcubG8aUd7kc/O/Lkt8lnFMKUx/uoOxBF2UlCzPLuI1ZY+ns73X
   3fv4NrmiN8etSyIO7Ytzwv98nSIXr4qLB3WYk+2jlAerG0BDV41YWj2BU
   tKanrroVOGAzj2HX0Xxapb0uuWjnhWsM98oJlVKt2bIpWwjiEmBtzkhm+
   jrwDc6Paq2UZEGxdjeDW63HfM9+5jDMH+YR81vi0jvkqDB555L52W4ZBL
   Mrz8zh3KLLkqS5MrO7BpLSGOI0clr+jT4X9InTQ/FN+uqbInAihMjncy2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="27602918"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="27602918"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 09:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16439739"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Mar 2024 09:28:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkRTI-000CXf-1p;
	Wed, 13 Mar 2024 16:28:52 +0000
Date: Thu, 14 Mar 2024 00:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.8/prjc 294/437] kernel/sched/alt_core.c:4421:3: error: call
 to undeclared function 'hrtick_start'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202403140016.QSIVFfyX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.8/prjc
head:   8b12bef41c21a484fe111f5b19be0db54a6c03a5
commit: 42f1330699031a5c9cda99c2fa0f5154a511f2aa [294/437] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240314/202403140016.QSIVFfyX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140016.QSIVFfyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140016.QSIVFfyX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
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
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
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
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
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
>> kernel/sched/alt_core.c:4421:3: error: call to undeclared function 'hrtick_start'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   hrtick_start(rq, next->time_slice);
                   ^
   kernel/sched/alt_core.c:4421:3: note: did you mean 'hrtimer_start'?
   include/linux/hrtimer.h:377:20: note: 'hrtimer_start' declared here
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
   include/linux/cpu.h:153:20: note: 'cpus_read_lock' declared here
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
   22 warnings and 12 errors generated.


vim +/hrtick_start +4421 kernel/sched/alt_core.c

ed2223e92daaf9 Alfred Chen 2019-08-19  4399  
ed2223e92daaf9 Alfred Chen 2019-08-19  4400  static inline struct task_struct *
ed2223e92daaf9 Alfred Chen 2019-08-19  4401  choose_next_task(struct rq *rq, int cpu, struct task_struct *prev)
ed2223e92daaf9 Alfred Chen 2019-08-19  4402  {
ed2223e92daaf9 Alfred Chen 2019-08-19  4403  	struct task_struct *next;
ed2223e92daaf9 Alfred Chen 2019-08-19  4404  
ed2223e92daaf9 Alfred Chen 2019-08-19  4405  	if (unlikely(rq->skip)) {
ed2223e92daaf9 Alfred Chen 2019-08-19  4406  		next = rq_runnable_task(rq);
ed2223e92daaf9 Alfred Chen 2019-08-19  4407  		if (next == rq->idle) {
ed2223e92daaf9 Alfred Chen 2019-08-19  4408  #ifdef	CONFIG_SMP
ed2223e92daaf9 Alfred Chen 2019-08-19  4409  			if (!take_other_rq_tasks(rq, cpu)) {
ed2223e92daaf9 Alfred Chen 2019-08-19  4410  #endif
ed2223e92daaf9 Alfred Chen 2019-08-19  4411  				rq->skip = NULL;
ed2223e92daaf9 Alfred Chen 2019-08-19  4412  				schedstat_inc(rq->sched_goidle);
ed2223e92daaf9 Alfred Chen 2019-08-19  4413  				return next;
ed2223e92daaf9 Alfred Chen 2019-08-19  4414  #ifdef	CONFIG_SMP
ed2223e92daaf9 Alfred Chen 2019-08-19  4415  			}
ed2223e92daaf9 Alfred Chen 2019-08-19  4416  			next = rq_runnable_task(rq);
ed2223e92daaf9 Alfred Chen 2019-08-19  4417  #endif
ed2223e92daaf9 Alfred Chen 2019-08-19  4418  		}
ed2223e92daaf9 Alfred Chen 2019-08-19  4419  		rq->skip = NULL;
ed2223e92daaf9 Alfred Chen 2019-08-19  4420  #ifdef CONFIG_HIGH_RES_TIMERS
ed2223e92daaf9 Alfred Chen 2019-08-19 @4421  		hrtick_start(rq, next->time_slice);
ed2223e92daaf9 Alfred Chen 2019-08-19  4422  #endif
ed2223e92daaf9 Alfred Chen 2019-08-19  4423  		return next;
ed2223e92daaf9 Alfred Chen 2019-08-19  4424  	}
ed2223e92daaf9 Alfred Chen 2019-08-19  4425  
ed2223e92daaf9 Alfred Chen 2019-08-19  4426  	next = sched_rq_first_task(rq);
ed2223e92daaf9 Alfred Chen 2019-08-19  4427  	if (next == rq->idle) {
ed2223e92daaf9 Alfred Chen 2019-08-19  4428  #ifdef	CONFIG_SMP
ed2223e92daaf9 Alfred Chen 2019-08-19  4429  		if (!take_other_rq_tasks(rq, cpu)) {
ed2223e92daaf9 Alfred Chen 2019-08-19  4430  #endif
ed2223e92daaf9 Alfred Chen 2019-08-19  4431  			schedstat_inc(rq->sched_goidle);
8a08641298e7a0 Alfred Chen 2020-08-09  4432  			/*printk(KERN_INFO "sched: choose_next_task(%d) idle %px\n", cpu, next);*/
ed2223e92daaf9 Alfred Chen 2019-08-19  4433  			return next;
ed2223e92daaf9 Alfred Chen 2019-08-19  4434  #ifdef	CONFIG_SMP
ed2223e92daaf9 Alfred Chen 2019-08-19  4435  		}
ed2223e92daaf9 Alfred Chen 2019-08-19  4436  		next = sched_rq_first_task(rq);
ed2223e92daaf9 Alfred Chen 2019-08-19  4437  #endif
ed2223e92daaf9 Alfred Chen 2019-08-19  4438  	}
ed2223e92daaf9 Alfred Chen 2019-08-19  4439  #ifdef CONFIG_HIGH_RES_TIMERS
ed2223e92daaf9 Alfred Chen 2019-08-19  4440  	hrtick_start(rq, next->time_slice);
ed2223e92daaf9 Alfred Chen 2019-08-19  4441  #endif
8a08641298e7a0 Alfred Chen 2020-08-09  4442  	/*printk(KERN_INFO "sched: choose_next_task(%d) next %px\n", cpu,
8a08641298e7a0 Alfred Chen 2020-08-09  4443  	 * next);*/
ed2223e92daaf9 Alfred Chen 2019-08-19  4444  	return next;
ed2223e92daaf9 Alfred Chen 2019-08-19  4445  }
ed2223e92daaf9 Alfred Chen 2019-08-19  4446  

:::::: The code at line 4421 was first introduced by commit
:::::: ed2223e92daaf9860b48206a01c6dde92f542ca6 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
