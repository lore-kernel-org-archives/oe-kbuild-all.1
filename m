Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB08833
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687944391; x=1719480391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghnniTDyxaKQopSsVM89wAve6rSyuMfR2Hc7pX3Nk2U=;
  b=PbchyDMDD8301h/v7DYL6hpZCVHQZryjgURc1hbBhVp64l/SdfAiLr/e
   JbTECxCVDM3ZqPODCtqd4A7FECr9x5zzHSV35FCYkQsbhrsENdti80v13
   P3VN9l5fGLXblHmXWkzbNKRu1TqjQLAfe7K46TorQWUphSbNqHCZksQnr
   yMjW40+UQhTmee73flEVa0RmlSbLW3vPVUl+Ma9QahLkq3PpU4o7ZLUxn
   oTdESD6n9nXmYYMz4OijUDzz4RGx9/eWqInUdmLQSliR6vtUAIYfrPcUL
   /qvf2N+4BvF8YWRk8r0i4YO6nVixjNulyWqKicsKqtLOI2+oGWmCmg3Bx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="351582553"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="351582553"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 02:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963526686"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="963526686"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 02:26:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qERRR-000D9j-2a;
	Wed, 28 Jun 2023 09:26:25 +0000
Date: Wed, 28 Jun 2023 17:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 295/385] kernel/sched/alt_core.c:4421:3: error:
 implicit declaration of function 'hrtick_start' is invalid in C99
Message-ID: <202306281719.MuhJgksu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: bcf5606dbe8958da33841ebb8b63ba49b86c097f [295/385] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230628/202306281719.MuhJgksu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281719.MuhJgksu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281719.MuhJgksu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:16:
   In file included from include/linux/sched/isolation.h:6:
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
   In file included from include/linux/sched/isolation.h:6:
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
   In file included from include/linux/sched/isolation.h:6:
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
   kernel/sched/alt_core.c:578:14: error: implicit declaration of function 'sched_clock_cpu' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
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
   kernel/sched/alt_core.c:3894:2: error: implicit declaration of function 'sched_clock_tick' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           sched_clock_tick();
           ^
   kernel/sched/alt_core.c:3894:2: note: did you mean 'scheduler_tick'?
   kernel/sched/alt_core.c:3887:6: note: 'scheduler_tick' declared here
   void scheduler_tick(void)
        ^
>> kernel/sched/alt_core.c:4421:3: error: implicit declaration of function 'hrtick_start' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   hrtick_start(rq, next->time_slice);
                   ^
   kernel/sched/alt_core.c:4421:3: note: did you mean 'hrtimer_start'?
   include/linux/hrtimer.h:415:20: note: 'hrtimer_start' declared here
   static inline void hrtimer_start(struct hrtimer *timer, ktime_t tim,
                      ^
   kernel/sched/alt_core.c:4440:2: error: implicit declaration of function 'hrtick_start' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           hrtick_start(rq, next->time_slice);
           ^
   kernel/sched/alt_core.c:4558:21: error: use of undeclared identifier 'PF_FROZEN'
                                   !(prev->flags & PF_FROZEN);
                                                   ^
   kernel/sched/alt_core.c:4674:6: error: implicit declaration of function 'tsk_is_pi_blocked' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (tsk_is_pi_blocked(tsk))
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
   23 warnings and 6 errors generated.


vim +/hrtick_start +4421 kernel/sched/alt_core.c

cedcd3e67433b3 Alfred Chen 2019-08-19  4399  
cedcd3e67433b3 Alfred Chen 2019-08-19  4400  static inline struct task_struct *
cedcd3e67433b3 Alfred Chen 2019-08-19  4401  choose_next_task(struct rq *rq, int cpu, struct task_struct *prev)
cedcd3e67433b3 Alfred Chen 2019-08-19  4402  {
cedcd3e67433b3 Alfred Chen 2019-08-19  4403  	struct task_struct *next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4404  
cedcd3e67433b3 Alfred Chen 2019-08-19  4405  	if (unlikely(rq->skip)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4406  		next = rq_runnable_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4407  		if (next == rq->idle) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4408  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4409  			if (!take_other_rq_tasks(rq, cpu)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4410  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4411  				rq->skip = NULL;
cedcd3e67433b3 Alfred Chen 2019-08-19  4412  				schedstat_inc(rq->sched_goidle);
cedcd3e67433b3 Alfred Chen 2019-08-19  4413  				return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4414  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4415  			}
cedcd3e67433b3 Alfred Chen 2019-08-19  4416  			next = rq_runnable_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4417  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4418  		}
cedcd3e67433b3 Alfred Chen 2019-08-19  4419  		rq->skip = NULL;
cedcd3e67433b3 Alfred Chen 2019-08-19  4420  #ifdef CONFIG_HIGH_RES_TIMERS
cedcd3e67433b3 Alfred Chen 2019-08-19 @4421  		hrtick_start(rq, next->time_slice);
cedcd3e67433b3 Alfred Chen 2019-08-19  4422  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4423  		return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4424  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  4425  
cedcd3e67433b3 Alfred Chen 2019-08-19  4426  	next = sched_rq_first_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4427  	if (next == rq->idle) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4428  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4429  		if (!take_other_rq_tasks(rq, cpu)) {
cedcd3e67433b3 Alfred Chen 2019-08-19  4430  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4431  			schedstat_inc(rq->sched_goidle);
9a3feaa4d828fe Alfred Chen 2020-08-09  4432  			/*printk(KERN_INFO "sched: choose_next_task(%d) idle %px\n", cpu, next);*/
cedcd3e67433b3 Alfred Chen 2019-08-19  4433  			return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4434  #ifdef	CONFIG_SMP
cedcd3e67433b3 Alfred Chen 2019-08-19  4435  		}
cedcd3e67433b3 Alfred Chen 2019-08-19  4436  		next = sched_rq_first_task(rq);
cedcd3e67433b3 Alfred Chen 2019-08-19  4437  #endif
cedcd3e67433b3 Alfred Chen 2019-08-19  4438  	}
cedcd3e67433b3 Alfred Chen 2019-08-19  4439  #ifdef CONFIG_HIGH_RES_TIMERS
cedcd3e67433b3 Alfred Chen 2019-08-19  4440  	hrtick_start(rq, next->time_slice);
cedcd3e67433b3 Alfred Chen 2019-08-19  4441  #endif
9a3feaa4d828fe Alfred Chen 2020-08-09  4442  	/*printk(KERN_INFO "sched: choose_next_task(%d) next %px\n", cpu,
9a3feaa4d828fe Alfred Chen 2020-08-09  4443  	 * next);*/
cedcd3e67433b3 Alfred Chen 2019-08-19  4444  	return next;
cedcd3e67433b3 Alfred Chen 2019-08-19  4445  }
cedcd3e67433b3 Alfred Chen 2019-08-19  4446  

:::::: The code at line 4421 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
