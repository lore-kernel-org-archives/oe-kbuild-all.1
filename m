Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC1446D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726470900; cv=none; b=siAt41WHxepKyQnij45Gne4Ey8OOOOZ/cFMx1VwIlo+GOG/G3FeJQidxhUzbi9NdJoilL+cL6GmruS4gbiqR7T80qNrv6eeJvjVgf/n/DnJDbhcDeJP0qdzbL0u6HKV4gcPIXfVmF7qzdaZ2fdqyaQgyXnXTT79sgpEdv571eSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726470900; c=relaxed/simple;
	bh=jzcBdP7j8vYPtj8EFa3xlmgSbL/O8ZceqbiFAM3c0c8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+yB09ym/jqEAzrwjPpVRFUZHVMglnuMAzfq6vTqQ2dZiZaJeQpvWEBNjHcFmHyrcEcKf0bxDSqD+QrSYUfPXpho3QYYEDh4qPfyYBCdBL8xvgMigXHBZvN15Lf1SDT3sKNr6BaGb14/6EWEcKxmDPQEMUEYMqsx9Ocin+1SSO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkf0pGdJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkf0pGdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726470898; x=1758006898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jzcBdP7j8vYPtj8EFa3xlmgSbL/O8ZceqbiFAM3c0c8=;
  b=jkf0pGdJmyO/MTwPbjF+p19v//xbmAgAfleMy6FVCYZA8a8ig1bOXNUV
   pKT8xGrSRSkN37FjK624KtxnyJ+Ymz4ZDyiRpJm/BQXeRVITBTVu/Mz44
   GRe23qNthObZoxFkBGGE6kSHG7NKM23odPQZKNBBgiPcRq/C1peXLRcKO
   QMMGVpfy2sS/5nVPA64pXzw8LNGaKxpNbxksAB0G2NusAQiFfSUbJMdJE
   gium/9o4wK+hRwo+7yAy1rJrKvfyU5iWlyg//xjymgIo9HvqrG0A328zu
   yAuMQ7k5NdMIa6LOR2zZckB+MMmXHDQKv4aGeqhe8qR9NMw8qsRcH21Vd
   g==;
X-CSE-ConnectionGUID: ZHooe/l7TGe4e1/OYU5gmQ==
X-CSE-MsgGUID: +1d4yZAETSOBYi6KaAp5nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="29190110"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="29190110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 00:14:57 -0700
X-CSE-ConnectionGUID: Utx/ZN+ERrisam4jeC3ryg==
X-CSE-MsgGUID: zCaj8EkbQ82KhwFtgFHpQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68404171"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2024 00:14:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq5wk-0009VA-27;
	Mon, 16 Sep 2024 07:14:54 +0000
Date: Mon, 16 Sep 2024 15:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 296/2859] kernel/sched/alt_core.c:4421:3: error:
 implicit declaration of function 'hrtick_start' is invalid in C99
Message-ID: <202409161520.g5UMKX1P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/main
head:   f446b0d8da9b1fd6e2286d3599e19d363c205337
commit: 8709d450c41654b91b78d6bca880f98164d4b219 [296/2859] sched/alt: [Sync] 95c74abe404d io_uring: move to separate directory
config: um-randconfig-001-20240916 (https://download.01.org/0day-ci/archive/20240916/202409161520.g5UMKX1P-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161520.g5UMKX1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161520.g5UMKX1P-lkp@intel.com/

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
   kernel/sched/alt_core.c:3021:2: error: implicit declaration of function 'rseq_migrate' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           rseq_migrate(p);
           ^
   kernel/sched/alt_core.c:3449:2: error: implicit declaration of function 'rseq_preempt' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           rseq_preempt(prev);
           ^
   kernel/sched/alt_core.c:3894:2: error: implicit declaration of function 'sched_clock_tick' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
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
>> kernel/sched/alt_core.c:4421:3: error: implicit declaration of function 'hrtick_start' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   hrtick_start(rq, next->time_slice);
                   ^
   kernel/sched/alt_core.c:4421:3: note: did you mean 'hrtimer_start'?
   include/linux/hrtimer.h:272:20: note: 'hrtimer_start' declared here
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
   kernel/sched/alt_core.c:5357:3: error: implicit declaration of function 'cpuset_read_lock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   cpuset_read_lock();
                   ^
   kernel/sched/alt_core.c:5357:3: note: did you mean 'cpus_read_lock'?
   include/linux/cpu.h:155:20: note: 'cpus_read_lock' declared here
   static inline void cpus_read_lock(void) { }
                      ^
   kernel/sched/alt_core.c:5405:4: error: implicit declaration of function 'cpuset_read_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           cpuset_read_unlock();
                           ^
   kernel/sched/alt_core.c:5437:3: error: implicit declaration of function 'cpuset_read_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   cpuset_read_unlock();
                   ^
   kernel/sched/alt_core.c:5451:3: error: implicit declaration of function 'cpuset_read_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
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
   18 warnings and 12 errors generated.


vim +/hrtick_start +4421 kernel/sched/alt_core.c

d821e3e8509258 Alfred Chen 2019-08-19  4399  
d821e3e8509258 Alfred Chen 2019-08-19  4400  static inline struct task_struct *
d821e3e8509258 Alfred Chen 2019-08-19  4401  choose_next_task(struct rq *rq, int cpu, struct task_struct *prev)
d821e3e8509258 Alfred Chen 2019-08-19  4402  {
d821e3e8509258 Alfred Chen 2019-08-19  4403  	struct task_struct *next;
d821e3e8509258 Alfred Chen 2019-08-19  4404  
d821e3e8509258 Alfred Chen 2019-08-19  4405  	if (unlikely(rq->skip)) {
d821e3e8509258 Alfred Chen 2019-08-19  4406  		next = rq_runnable_task(rq);
d821e3e8509258 Alfred Chen 2019-08-19  4407  		if (next == rq->idle) {
d821e3e8509258 Alfred Chen 2019-08-19  4408  #ifdef	CONFIG_SMP
d821e3e8509258 Alfred Chen 2019-08-19  4409  			if (!take_other_rq_tasks(rq, cpu)) {
d821e3e8509258 Alfred Chen 2019-08-19  4410  #endif
d821e3e8509258 Alfred Chen 2019-08-19  4411  				rq->skip = NULL;
d821e3e8509258 Alfred Chen 2019-08-19  4412  				schedstat_inc(rq->sched_goidle);
d821e3e8509258 Alfred Chen 2019-08-19  4413  				return next;
d821e3e8509258 Alfred Chen 2019-08-19  4414  #ifdef	CONFIG_SMP
d821e3e8509258 Alfred Chen 2019-08-19  4415  			}
d821e3e8509258 Alfred Chen 2019-08-19  4416  			next = rq_runnable_task(rq);
d821e3e8509258 Alfred Chen 2019-08-19  4417  #endif
d821e3e8509258 Alfred Chen 2019-08-19  4418  		}
d821e3e8509258 Alfred Chen 2019-08-19  4419  		rq->skip = NULL;
d821e3e8509258 Alfred Chen 2019-08-19  4420  #ifdef CONFIG_HIGH_RES_TIMERS
d821e3e8509258 Alfred Chen 2019-08-19 @4421  		hrtick_start(rq, next->time_slice);
d821e3e8509258 Alfred Chen 2019-08-19  4422  #endif
d821e3e8509258 Alfred Chen 2019-08-19  4423  		return next;
d821e3e8509258 Alfred Chen 2019-08-19  4424  	}
d821e3e8509258 Alfred Chen 2019-08-19  4425  
d821e3e8509258 Alfred Chen 2019-08-19  4426  	next = sched_rq_first_task(rq);
d821e3e8509258 Alfred Chen 2019-08-19  4427  	if (next == rq->idle) {
d821e3e8509258 Alfred Chen 2019-08-19  4428  #ifdef	CONFIG_SMP
d821e3e8509258 Alfred Chen 2019-08-19  4429  		if (!take_other_rq_tasks(rq, cpu)) {
d821e3e8509258 Alfred Chen 2019-08-19  4430  #endif
d821e3e8509258 Alfred Chen 2019-08-19  4431  			schedstat_inc(rq->sched_goidle);
3a24f42da1ff2b Alfred Chen 2020-08-09  4432  			/*printk(KERN_INFO "sched: choose_next_task(%d) idle %px\n", cpu, next);*/
d821e3e8509258 Alfred Chen 2019-08-19  4433  			return next;
d821e3e8509258 Alfred Chen 2019-08-19  4434  #ifdef	CONFIG_SMP
d821e3e8509258 Alfred Chen 2019-08-19  4435  		}
d821e3e8509258 Alfred Chen 2019-08-19  4436  		next = sched_rq_first_task(rq);
d821e3e8509258 Alfred Chen 2019-08-19  4437  #endif
d821e3e8509258 Alfred Chen 2019-08-19  4438  	}
d821e3e8509258 Alfred Chen 2019-08-19  4439  #ifdef CONFIG_HIGH_RES_TIMERS
d821e3e8509258 Alfred Chen 2019-08-19  4440  	hrtick_start(rq, next->time_slice);
d821e3e8509258 Alfred Chen 2019-08-19  4441  #endif
3a24f42da1ff2b Alfred Chen 2020-08-09  4442  	/*printk(KERN_INFO "sched: choose_next_task(%d) next %px\n", cpu,
3a24f42da1ff2b Alfred Chen 2020-08-09  4443  	 * next);*/
d821e3e8509258 Alfred Chen 2019-08-19  4444  	return next;
d821e3e8509258 Alfred Chen 2019-08-19  4445  }
d821e3e8509258 Alfred Chen 2019-08-19  4446  

:::::: The code at line 4421 was first introduced by commit
:::::: d821e3e85092581709b1b5f9ab8cacf0ce70c1a8 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
