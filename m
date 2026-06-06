Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7BD3B71DB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780770537; cv=none; b=OYdKNHe5/nuAUbG5PWJOW9qJQet4ffZwqKRymF6/Wr0uZU5/1qJ5nLfuDeFbs/ZxfxiaoQKPIe6hCKcsSDCCMZnPJne7xybI6A4GewlsgibfO2TavB80rH/o/Az1jn67HQ6knMpNgvzr+mavK3MUgR4GL1JAEuDXDlZKrv/kOkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780770537; c=relaxed/simple;
	bh=+I/LewoBMNtr/qZ8jz7AtHpT//OvnDVfA1wCR6PXfQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cNoP00QCdebd891epDTbgBR/UOqA+s56lD1ZeAgAp8+m+4i4R59txLEI7AZG0VHBfDCIZb1JSyrpgiWIOEuuTQbX0+aG9wb2ldA5pkNXOlVvmZxf/E4MPB9F+E8fvEUPFIr+XKfxeItsMfOfBDkrpMae/c7mJDhdbYzDZcu/VzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AR8DKi+c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AR8DKi+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780770535; x=1812306535;
  h=date:from:to:cc:subject:message-id;
  bh=+I/LewoBMNtr/qZ8jz7AtHpT//OvnDVfA1wCR6PXfQo=;
  b=AR8DKi+cpU0PcdhKkJn7E++HUQ7kOxhmURDOulJqf551jB9Cn1deAVPQ
   pxfsvt1E0PD10Q+AZ10gTmTlE+We3R006CqtjyPoS8AhcMPamgAz0+9qc
   rrBy3DQulW/+C7saqnC3hyDiEZSj328V8C8ONmEU1gH33Acp5DI9E0kDi
   oqAezQAji3CyT2fz4XxVS1VlyJTdeRWkvlhtjfHk1PMhjeGdIOUDYTsvw
   1ZpBoWw+OBcz3u8hWs3c+iQ/loxI1BV3YgOSnUGWn35LPslGl8I4si5rM
   YYmLLw9droNvjYeZ94MDaScvNDEjAvDwsWKQFhTRgry9gD62BQTxOEYrA
   g==;
X-CSE-ConnectionGUID: FKCO3C/WRi221533EuGNyg==
X-CSE-MsgGUID: pgE+fpAkSX2Jx3YgnIsVZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81752715"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="81752715"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 11:28:55 -0700
X-CSE-ConnectionGUID: dOln5G+7SgeCL00JR9qAdw==
X-CSE-MsgGUID: a5titVSvR9e67ZWn1wRqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="249459002"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2026 11:28:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVvlJ-00000000HDe-03e8;
	Sat, 06 Jun 2026 18:28:49 +0000
Date: Sun, 07 Jun 2026 02:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [tip:sched/core 56/56] kernel/sched/fair.c:6905:44: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202606070217.eZYR9hdn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   f666241e6bd5d9a494beca982e1953208dce531c
commit: f666241e6bd5d9a494beca982e1953208dce531c [56/56] sched/fair: Unify cfs_rq throttling via account_cfs_rq_runtime()
config: arc-randconfig-r123-20260606 (https://download.01.org/0day-ci/archive/20260607/202606070217.eZYR9hdn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070217.eZYR9hdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606070217.eZYR9hdn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1367:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1367:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1367:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1979:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1979:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1979:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:2035:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:2035:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:2035:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:14397:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:14397:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:14397:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:6905:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6905:44: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6905:44: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:6963:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6963:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6963:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9373:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9373:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9373:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9568:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9568:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:9568:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9766:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9766:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9766:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9799:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9799:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9799:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10004:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:10004:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:10004:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:11349:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11349:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:11349:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:12115:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:12115:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12115:22: sparse:    struct task_struct *
   kernel/sched/fair.c:13633:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13633:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13633:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13264:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13264:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:13264:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13769:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13769:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13769:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/fair.c: note: in included file (through arch/arc/include/asm/irqflags.h, include/linux/irqflags.h, arch/arc/include/asm/smp.h, arch/arc/include/asm/cmpxchg.h, ...):
   arch/arc/include/asm/irqflags-arcv2.h:80:31: sparse: sparse: undefined identifier '__builtin_arc_lr'
   arch/arc/include/asm/irqflags-arcv2.h:83:17: sparse: sparse: undefined identifier '__builtin_arc_sr'
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *

vim +6905 kernel/sched/fair.c

  6844	
  6845	static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
  6846	{
  6847		struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
  6848		struct sched_entity *curr = cfs_rq->curr;
  6849		struct rq *rq = rq_of(cfs_rq);
  6850	
  6851		scoped_guard(raw_spinlock, &cfs_b->lock) {
  6852			u64 target_runtime = 1;
  6853	
  6854			/*
  6855			 * If cfs_rq->curr is still runnable, we are here from an
  6856			 * update_curr(). Request sysctl_sched_cfs_bandwidth_slice
  6857			 * worth of bandwidth to continue running.
  6858			 *
  6859			 * If the curr is not runnable, just request enough bandwidth
  6860			 * to be runnable next time the pick selects this cfs_rq.
  6861			 */
  6862			if (curr && curr->on_rq)
  6863				target_runtime = sched_cfs_bandwidth_slice();
  6864	
  6865			/*
  6866			 * Check if We have raced with bandwidth becoming available. If
  6867			 * we actually throttled the timer might not unthrottle us for
  6868			 * an entire period. We additionally needed to make sure that
  6869			 * any subsequent check_cfs_rq_runtime calls agree not to
  6870			 * throttle us, as we may commit to do cfs put_prev+pick_next,
  6871			 * so we ask for 1ns of runtime rather than just check cfs_b.
  6872			 *
  6873			 * This will start the period timer if necessary.
  6874			 */
  6875			if (__assign_cfs_rq_runtime(cfs_b, cfs_rq, target_runtime))
  6876				return false;
  6877	
  6878			/*
  6879			 * No bandwidth available; Add ourselves on the list to be
  6880			 * unthrottled later.
  6881			 */
  6882			list_add_tail_rcu(&cfs_rq->throttled_list,
  6883					  &cfs_b->throttled_cfs_rq);
  6884		}
  6885	
  6886		/* freeze hierarchy runnable averages while throttled */
  6887		scoped_guard(rcu)
  6888			walk_tg_tree_from(cfs_rq->tg, tg_throttle_down, tg_nop, (void *)rq);
  6889	
  6890		/*
  6891		 * Note: distribution will already see us throttled via the
  6892		 * throttled-list.  rq->lock protects completion.
  6893		 */
  6894		cfs_rq->throttled = 1;
  6895		WARN_ON_ONCE(cfs_rq->throttled_clock);
  6896	
  6897		/*
  6898		 * If current hierarchy was throttled, add throttle work to the
  6899		 * current donor. In case of proxy-execution, the execution
  6900		 * context cannot exit to the userspace while holding a mutex
  6901		 * and the rule of throttle deferral to only throttle the
  6902		 * throttled context at exit to userspace is still preserved.
  6903		 */
  6904		if (curr && curr->on_rq)
> 6905			task_throttle_setup_work(rq->donor);
  6906	
  6907		return true;
  6908	}
  6909	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
