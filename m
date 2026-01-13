Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB86939281F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308012; cv=none; b=Mos+FeDCmfMISWM5M8nWs81lGbGZyiXh3VBssyjNnoQKuyGBZXY9NBRaDHcfUn+4mehfAIu59kNNIlvhZMp4QcUCQduJOhe5KaPrBOtxm+2VdQty7SBvaNvrvfhFuU04NVNhvW9S+yJu3AkSq92Vv8ar+EenPNUwpiDspKg/TbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308012; c=relaxed/simple;
	bh=yCj+SNdw7x4/oCT+vv6xFv1oDFmSj4VxmRvjzz1xhQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tfFGfFUyNuA3xoqS++c7296UeDRWU7oKwkxHYACnZQY+OiC1PvU9i+X/MhFgLPO0AknXByuOhmM62WuuTwha+L0tvI8CMLmglnTw5LQu1JDwIdaQbfzkav4hT9MQE+u9apyl1DKJnFCLKTT+tjxP6hbDPFRfSMXwJSNpRXrDJIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ua6+Q8ji; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ua6+Q8ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768308011; x=1799844011;
  h=date:from:to:cc:subject:message-id;
  bh=yCj+SNdw7x4/oCT+vv6xFv1oDFmSj4VxmRvjzz1xhQo=;
  b=Ua6+Q8jie0uzVdkEUe7JcdRjd8yOxMVzL4jcLcamFexcyrFy6d7hq32C
   aGxP1D4AdJzb6CyeWctIRdGkd1jEZQq05MjE7yVA9J9bLS8DY67h1RkKA
   UJOdOOBCwwj4f+JFNqx4xHECYi64g2Oh8ybrUelJIXdCGU9jeP7kkgcyM
   jYIhmSvVybJPdnl8WCILRFerALFaaxFbasSpS+LTmQAHS/DMQQ6BDxGMo
   Z9rkcZibebaOOW8aLw3S9ByPno9rHvhDnIcWOOpR/HW6BKausE9ZJZAqW
   W18ylT+FVcJqVRqTStlx51H9BQ9wgHOPjN0glnu1277etsljUKvOa943e
   w==;
X-CSE-ConnectionGUID: NIIkk4oFRcKj0LjHDchtqg==
X-CSE-MsgGUID: jnR9SMfkSiOUAg/O7jJj4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69748708"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69748708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:40:05 -0800
X-CSE-ConnectionGUID: dgJIzyOfRnGKx36w8jJmJA==
X-CSE-MsgGUID: nItbUed6QGe5wmK1dE6PDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203586138"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 04:40:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfdgl-00000000EkC-3MBo;
	Tue, 13 Jan 2026 12:39:59 +0000
Date: Tue, 13 Jan 2026 20:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: kernel/sched/core.c:10574:58: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202601132020.efCy1VMV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: fbd0e71dc370af73f6b316e4de9eed273dd90340 sched/mmcid: Provide CID ownership mode fixup functions
date:   7 weeks ago
config: arm64-randconfig-r123-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132020.efCy1VMV-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132020.efCy1VMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132020.efCy1VMV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:804:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:804:33: sparse:     expected struct task_struct *task
   kernel/sched/core.c:804:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:880:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:880:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:880:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1100:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1100:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1100:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1206:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1206:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1206:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:1379:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1379:35: sparse:     expected struct task_struct *p
   kernel/sched/core.c:1379:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1380:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1380:47: sparse:     expected struct task_struct *p
   kernel/sched/core.c:1380:47: sparse:     got struct task_struct [noderef] __rcu *curr
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
   kernel/sched/core.c:5673:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5673:46: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5673:46: sparse:     got struct task_struct [noderef] __rcu *curr
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
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2474:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct *
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
