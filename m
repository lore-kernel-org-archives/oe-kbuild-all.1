Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED3225D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 20:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742763023; cv=none; b=R1E/T6oj7khO4UQx5yCiY/Tztx2lRH7uR6YvtEiJsbzu/NMhXaGMPve1c+G/5DbGJJ10EoH4hf46KY1EfH9/v5SuT1prX9ckcP35OsfrtAYgmUau/chhuj1iJYEwT/vq+kX/bqzcvaOYffu9BepiZPxCfOWFJeLh8RmdLTZAYDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742763023; c=relaxed/simple;
	bh=8yTCyl+p4cMuo/EX/NiU+yqzHPzbIaxuluHufQmUzVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6ihmapIuehri4ZH1J1FNSY99aXUpTCJW1G3PvqShG7qsBH0l+/jnNIOW+JR3Hf5u7Y2npYNRIgfFAqf0szl5LHgTu8NlhN7klzsLW6pibgUh3uFX/TBrk87hgb+iZzfgWOmIOmhrEImT4s1NWMb71p74thoD/JBbriOXbzI5ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfgqcbe7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfgqcbe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742763022; x=1774299022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yTCyl+p4cMuo/EX/NiU+yqzHPzbIaxuluHufQmUzVs=;
  b=hfgqcbe7RPVGpUMdNVplDkFKA7MdqYQ46pGU1QScpguV8x0xviNCfdgP
   3Bp1MUkDKV1pSBgWmyCHmcXwnlsDpSgeidTd1LBG5Grs9GKbqdz9//6xa
   08N5wjdgh8IbjILLGqMwtNeIo0NilUYO9Z0rtdFb97n8wZsVoM9BTgxhC
   jDZeVKFX9nZENUM1/rxgzgJbm9nPQw12P/DO/N0NnYGtx9HD5/L+Eeeh8
   Vf3VduZTprpvnYf1iMJClMu8BSkqCyIbD1kPlKuiYfoR1rogm00lJSIS/
   P1SIkE6Zm2MlytbPg2URfGFQKDRwS/C4xSBaGtPhMQfhguasD7Q6Te2LG
   Q==;
X-CSE-ConnectionGUID: q19L9MfwSfKCm13wbBmRIg==
X-CSE-MsgGUID: ZTW9iFCiRM6gy1HyZW7nSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44070813"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="44070813"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 13:50:21 -0700
X-CSE-ConnectionGUID: LqDjuVWoQ7WFYYqVz37nZw==
X-CSE-MsgGUID: 8mb4+vijRlKUPf7LIZV7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="123883719"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2025 13:50:20 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twSGq-0002xA-2v;
	Sun, 23 Mar 2025 20:50:14 +0000
Date: Mon, 24 Mar 2025 04:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/prjc 24/26] kernel/sched/alt_core.c:4492:6: error: call to
 undeclared function 'preempt_mask_check'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202503240437.VvxCjkss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/prjc
head:   ad6915f02da42c21c68f996604a88583afe258cf
commit: f6e4e5191cff5f87f3e907894608cd747a81f10c [24/26] sched/alt: Fix priority inversion for overloaded queues
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250324/202503240437.VvxCjkss-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503240437.VvxCjkss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240437.VvxCjkss-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/alt_core.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
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
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
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
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/sched/alt_core.c:4492:6: error: call to undeclared function 'preempt_mask_check'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4492 |             preempt_mask_check(&mask, &mask, task_sched_prio(p))) {
         |             ^
>> kernel/sched/alt_core.c:4493:10: error: call to undeclared function 'best_mask_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4493 |                 return best_mask_cpu(cpu, &mask);
         |                        ^
   kernel/sched/alt_core.c:4493:10: note: did you mean 'set_task_cpu'?
   include/linux/sched.h:2190:20: note: 'set_task_cpu' declared here
    2190 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^
>> kernel/sched/alt_core.c:4519:11: error: no member named 'online' in 'struct rq'
    4519 |         if (!rq->online)
         |              ~~  ^
   kernel/sched/alt_core.c:4592:2: error: call to undeclared function 'hrtick_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4592 |         hrtick_start(rq, next->time_slice);
         |         ^
   kernel/sched/alt_core.c:4592:2: note: did you mean 'hrtimer_start'?
   include/linux/hrtimer.h:257:20: note: 'hrtimer_start' declared here
     257 | static inline void hrtimer_start(struct hrtimer *timer, ktime_t tim,
         |                    ^
   12 warnings and 4 errors generated.


vim +/preempt_mask_check +4492 kernel/sched/alt_core.c

  4484	
  4485	static inline int balance_select_task_rq(struct task_struct *p)
  4486	{
  4487		cpumask_t mask;
  4488		int cpu = task_cpu(p);
  4489	
  4490		if (cpumask_empty(sched_idle_mask) &&
  4491		    cpumask_and(&mask, p->cpus_ptr, cpu_active_mask) &&
> 4492		    preempt_mask_check(&mask, &mask, task_sched_prio(p))) {
> 4493			return best_mask_cpu(cpu, &mask);
  4494		}
  4495	
  4496		return cpu;
  4497	}
  4498	
  4499	static inline void
  4500	__move_queued_task(struct rq *rq, struct task_struct *p, struct rq *dest_rq, int dest_cpu)
  4501	{
  4502		WRITE_ONCE(p->on_rq, TASK_ON_RQ_MIGRATING);
  4503		dequeue_task(p, rq, 0);
  4504		set_task_cpu(p, dest_cpu);
  4505	
  4506		sched_mm_cid_migrate_to(dest_rq, p);
  4507	
  4508		sched_task_sanity_check(p, dest_rq);
  4509		enqueue_task(p, dest_rq, 0);
  4510		WRITE_ONCE(p->on_rq, TASK_ON_RQ_QUEUED);
  4511		wakeup_preempt(dest_rq);
  4512	}
  4513	
  4514	static inline void prio_balance(struct rq *rq)
  4515	{
  4516		struct task_struct *p, *next;
  4517		int cpu, dest_cpu;
  4518	
> 4519		if (!rq->online)
  4520			return;
  4521	
  4522		if (0 == rq->prio_balance_time)
  4523			return;
  4524	
  4525		if (rq->clock - rq->prio_balance_time < sysctl_sched_base_slice << 2)
  4526			return;
  4527	
  4528		rq->prio_balance_time = rq->clock;
  4529		cpu = cpu_of(rq);
  4530	
  4531		if (!cpumask_empty(sched_idle_mask))
  4532			return;
  4533	
  4534		p = sched_rq_next_task(rq->curr, rq);
  4535		while (p != rq->idle) {
  4536			next = sched_rq_next_task(p, rq);
  4537			if (!is_migration_disabled(p) && (dest_cpu = balance_select_task_rq(p)) != cpu) {
  4538				struct rq *dest_rq;
  4539	
  4540				dest_rq = cpu_rq(dest_cpu);
  4541	
  4542				if (do_raw_spin_trylock(&dest_rq->lock)) {
  4543					spin_acquire(&dest_rq->lock.dep_map,
  4544						     SINGLE_DEPTH_NESTING, 1, _RET_IP_);
  4545	
  4546					__move_queued_task(rq, p, dest_rq, dest_cpu);
  4547	
  4548					spin_release(&dest_rq->lock.dep_map, _RET_IP_);
  4549					do_raw_spin_unlock(&dest_rq->lock);
  4550				}
  4551			}
  4552			p = next;
  4553		}
  4554	}
  4555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
