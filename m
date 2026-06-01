Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A33AE183
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322155; cv=none; b=RQhIHQpZcloXV0grmQekFwFomuKRmfE+lbFE/6HVn7xIs6tQsi8Hg2W/OSEAdluKYHWE6dJ3L5cENM7cx6C9J8fXGysvZH+KSZ145c5XGsAhqv+bRvApLvSqDmonuBMshbQcpqj/4UV3/xrx7d52PHAqfjdz5mydfRnIigF6CSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322155; c=relaxed/simple;
	bh=gfREg8QY6zk5ZV15U8DNWcdbSlOCyNU6ZASC5BYjBkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=judAVJOZiPcBFpJ6GX3xO0eUxIGkRs83Yvto87qi5Qdb9L1tCpRJRP2g9njJNHTeonhq1mQ0KN2li36HLKXwet8S2gGn+LNf58AjZBdAVuW8AkG7i0pcbdVT+fdTtTg4+4fMIVHTVBtsS/ibOIM3W++JghsypZSPho+HyVlf5s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGKVOvUV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGKVOvUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322153; x=1811858153;
  h=date:from:to:cc:subject:message-id;
  bh=gfREg8QY6zk5ZV15U8DNWcdbSlOCyNU6ZASC5BYjBkM=;
  b=MGKVOvUVsaBuTL4+VP4l+sWuHtsMOMoZrb02GuBaqEiT+h4kX3FzUzRM
   QhxNPxevZ/xc8U/ASAqMFdRrWv/nPfkq9dCNXmFqTDUTPPJKD+BXdA6jd
   JDMHPeXNf2dbuZCRRQ9EsQZTqdUxViuiL4fHxWXYWE13Ldx7/rs0aA1PQ
   G1Bnc9xrgK144XPR/N00mymj2xbo/vz42U6gP1x07zr4JXM9BuhXSIOzb
   fC4DyIQcM2M29+kFYxlcLE6RJvALC3mj2D/Jr2QkTIoRvJDN7dGDGq3MU
   VVO8qiqB1wlFNWj7xqfNJqyH2IzffIoHzULXEpxaYLmYXkrz6y0ihmfXU
   g==;
X-CSE-ConnectionGUID: qtnFK22rTqiyqvStLmUWFg==
X-CSE-MsgGUID: J5iNZvBdQPWvD7vsH6SFHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92460785"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="92460785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:55:53 -0700
X-CSE-ConnectionGUID: QFZWkK/USYKgbWwqJuYGEw==
X-CSE-MsgGUID: YJ9ZUHb3RX+qSEhS7r6yog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243682727"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jun 2026 06:55:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU37M-00000000Adg-0IQq;
	Mon, 01 Jun 2026 13:55:48 +0000
Date: Mon, 01 Jun 2026 21:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: kernel/sched/core.c:10574:58: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202606012159.elx68pnX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: fbd0e71dc370af73f6b316e4de9eed273dd90340 sched/mmcid: Provide CID ownership mode fixup functions
date:   6 months ago
config: loongarch-randconfig-r133-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012159.elx68pnX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012159.elx68pnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fbd0e71dc370 ("sched/mmcid: Provide CID ownership mode fixup functions")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012159.elx68pnX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:880:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:880:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:880:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1100:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1100:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1100:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1206:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1206:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1206:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2203:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2203:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2203:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2214:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2214:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2214:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3656:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3656:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3656:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3861:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3861:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3861:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:8167:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8167:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:8167:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5585:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5585:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5585:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6799:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6799:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6799:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6865:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6865:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6865:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7372:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7372:17: sparse:    struct task_struct *
   kernel/sched/core.c:7372:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10322:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10322:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10322:25: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:10574:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10574:58: sparse:     expected struct task_struct *t
   kernel/sched/core.c:10574:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:10610:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:10610:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10610:38: sparse:    struct task_struct *
   kernel/sched/core.c:631:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:656:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:680:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1799:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1799:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:880:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1579:13: sparse: sparse: context imbalance in 'uclamp_update_util_min_rt_default' - wrong count at exit
   kernel/sched/core.c:2284:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c:2678:6: sparse: sparse: context imbalance in 'set_cpus_allowed_common' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2474:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2277:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2277:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2277:25: sparse:    struct task_struct *
   kernel/sched/core.c:2167:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2167:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2167:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2497:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2497:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:80:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:80:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:89:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:89:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, arch/loongarch/include/asm/thread_info.h, ...):
   arch/loongarch/include/asm/loongarch.h:1358:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1358:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1358:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1358:1: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:89:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, arch/loongarch/include/asm/thread_info.h, ...):
   arch/loongarch/include/asm/loongarch.h:1358:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1358:1: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:226:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/include/asm/fpu.h:226:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:274:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/include/asm/fpu.h:274:17: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2474:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct *

vim +10574 kernel/sched/core.c

 10555	
 10556	static void __maybe_unused mm_cid_fixup_cpus_to_tasks(struct mm_struct *mm)
 10557	{
 10558		unsigned int cpu;
 10559	
 10560		/* Walk the CPUs and fixup all stale CIDs */
 10561		for_each_possible_cpu(cpu) {
 10562			struct mm_cid_pcpu *pcp = per_cpu_ptr(mm->mm_cid.pcpu, cpu);
 10563			struct rq *rq = cpu_rq(cpu);
 10564	
 10565			/* Remote access to mm::mm_cid::pcpu requires rq_lock */
 10566			guard(rq_lock_irq)(rq);
 10567			/* Is the CID still owned by the CPU? */
 10568			if (cid_on_cpu(pcp->cid)) {
 10569				/*
 10570				 * If rq->curr has @mm, transfer it with the
 10571				 * transition bit set. Otherwise drop it.
 10572				 */
 10573				if (rq->curr->mm == mm && rq->curr->mm_cid.active)
 10574					mm_cid_transit_to_task(rq->curr, pcp);
 10575				else
 10576					mm_drop_cid_on_cpu(mm, pcp);
 10577	
 10578			} else if (rq->curr->mm == mm && rq->curr->mm_cid.active) {
 10579				unsigned int cid = rq->curr->mm_cid.cid;
 10580	
 10581				/* Ensure it has the transition bit set */
 10582				if (!cid_in_transit(cid)) {
 10583					cid = cid_to_transit_cid(cid);
 10584					rq->curr->mm_cid.cid = cid;
 10585					pcp->cid = cid;
 10586				}
 10587			}
 10588		}
 10589		/* Clear the transition bit */
 10590		WRITE_ONCE(mm->mm_cid.transit, 0);
 10591	}
 10592	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
