Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FF3264EF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 16:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332408; cv=none; b=ktp5NWfwcwoacmS5KdyQPS3XiXa4L/5DLju9AjnX4ew7BAy3X2tQ48XfQMPwUbxSJWTnjjbnx7p9frKD7MfM4JVgbIAbQv6bEzww/rJAkGYRlX9JtG/VdsAmlbg5zwG/Ds9kREdOso22h8Zxqyim+WBaACQRa950nTW0epTs9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332408; c=relaxed/simple;
	bh=3HsIVCno4lnII/yu2zbdEQx23gtUOCxH72L4w4hvtC4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kKA4zqCP/cPLbGLbmLxwJx+rFjEejoyop5JrpTek0ZkvkhMohiQUmvpgMFfgsp/1O05bpwN4W0KJeYwQWB2zQ+Vy8cETmVzf7MKe6b1o79rqdXERU3dYfn63Olpck22Yn/LwoKYDabxpQFyszMrh3uzy8a9b630tMDDrz+Gwb08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AT4r6cNr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT4r6cNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780332407; x=1811868407;
  h=date:from:to:cc:subject:message-id;
  bh=3HsIVCno4lnII/yu2zbdEQx23gtUOCxH72L4w4hvtC4=;
  b=AT4r6cNrFl5TNgukZeiaFHVOGuq7b2kywQgKnuVRQHvgofglacOjdh3f
   Mg4X54Fix7L/rW209Kw1Y9fxrsS1vkbiBUKIpP6UReOqXYb9wCV880gip
   bKJD+hHEIREy//DOozGzLI+u1+/s1hm3JUqSsD12GssRBbNQzb79/vmbB
   zOyfQi6p4CAAUAcGC3X4soQCB05vJr+E8MqTtOW9EcZNSGWEHb+NrZs9K
   1VJRYskpEeLB15VhO6lkOATjpK0wTe1rG7+8dWbx2zDOEg+6bNti0xa5A
   s6/C94VU4bbrO3iVFFzLbH2TganULjx5oewL4pc4JwEs4s6xDAVA+2YFo
   w==;
X-CSE-ConnectionGUID: 5PTA3iwqTNiEXBWmA14ubw==
X-CSE-MsgGUID: y6yskpUlTI+BbnCmFQQ6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81089916"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81089916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:46:46 -0700
X-CSE-ConnectionGUID: /nF9bs2HSnWbLAYz421G4g==
X-CSE-MsgGUID: rzf+CnjxQAiGw1OV0QqAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243745215"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 09:46:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5mj-00000000ApC-2gCS;
	Mon, 01 Jun 2026 16:46:41 +0000
Date: Tue, 02 Jun 2026 00:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: kernel/sched/core.c:881:49: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202606020052.7nHX5mNh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: e38e5299747b23015b00b0109891815db44a2f30 sched/hrtick: Fix hrtick() vs. scheduling context
date:   6 months ago
config: loongarch-randconfig-r133-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020052.7nHX5mNh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020052.7nHX5mNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e38e5299747b ("sched/hrtick: Fix hrtick() vs. scheduling context")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020052.7nHX5mNh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:881:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:881:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:881:49: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:1101:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1101:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1101:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1207:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1207:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1207:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2175:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2175:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2175:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2186:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2186:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2186:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3583:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3583:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3583:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3788:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3788:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3788:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:8065:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8065:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:8065:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5512:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5512:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5512:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6730:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6730:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6730:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6797:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6797:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6797:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7303:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7303:17: sparse:    struct task_struct *
   kernel/sched/core.c:7303:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10207:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10207:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10207:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:10468:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10468:58: sparse:     expected struct task_struct *t
   kernel/sched/core.c:10468:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:10504:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:10504:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10504:38: sparse:    struct task_struct *
   kernel/sched/core.c:632:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:657:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:681:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1808:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1808:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:881:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1580:13: sparse: sparse: context imbalance in 'uclamp_update_util_min_rt_default' - wrong count at exit
   kernel/sched/core.c:2256:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c:2650:6: sparse: sparse: context imbalance in 'set_cpus_allowed_common' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2291:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct *
   kernel/sched/core.c:2170:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2170:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2170:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:80:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:80:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:89:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:89:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, arch/loongarch/include/asm/thread_info.h, ...):
   arch/loongarch/include/asm/loongarch.h:1360:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1360:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1360:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1360:1: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:89:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, arch/loongarch/include/asm/thread_info.h, ...):
   arch/loongarch/include/asm/loongarch.h:1360:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1360:1: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:226:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/include/asm/fpu.h:226:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:274:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/include/asm/fpu.h:274:17: sparse: sparse: cast from unknown type

vim +881 kernel/sched/core.c

   867	
   868	/*
   869	 * High-resolution timer tick.
   870	 * Runs from hardirq context with interrupts disabled.
   871	 */
   872	static enum hrtimer_restart hrtick(struct hrtimer *timer)
   873	{
   874		struct rq *rq = container_of(timer, struct rq, hrtick_timer);
   875		struct rq_flags rf;
   876	
   877		WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
   878	
   879		rq_lock(rq, &rf);
   880		update_rq_clock(rq);
 > 881		rq->donor->sched_class->task_tick(rq, rq->donor, 1);
   882		rq_unlock(rq, &rf);
   883	
   884		return HRTIMER_NORESTART;
   885	}
   886	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
