Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EBA2DE717
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440546; cv=none; b=adThWojibyMG2V02h78F3hDGJMvJJVrnq9QNgSPLCXA+dwEoh2r7WKJwMxDUVUhW+O45sstEBAIrnXM55019T6sbOJ37qcPDM8jIFym61c/We0dxSfvF88mPZzN0GguIiaERnWdRz7CjDAN3MD7l8DAgAkfBeF83pK/X1/by3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440546; c=relaxed/simple;
	bh=Ko22jGjDo3m2DWRH1fDQIpgEfCa5DvKgJ/8YLbv54Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KH7GQuBGsorzSv867OyHuiI6fWFpy8Y0NKDxoQdrePoqT1qp9rKv6XL45XYWV+JSW+QNyYUoUqfM7mljKPDzBBcOh6M0jZKkgWk0VY6DcFWbV8mZYru0sbpoR5rKEDOtiAPAQrDXqrrVZpdrMls+VwoBa9Rks/Q6CIInIMckRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmknrB6q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmknrB6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765440538; x=1796976538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ko22jGjDo3m2DWRH1fDQIpgEfCa5DvKgJ/8YLbv54Ws=;
  b=nmknrB6qWaNeUa9V+QFg880n75GC/sW1qQiwfIAeHzk7U6TzLnwG9xWw
   DT19ho+AJGIhy/q97ExrJ1CEJlHhDEXq0aoKtxKko7ZqMM4M31zGBhx5w
   9aF/7oamPNRrJaVAisLsElRqjH5o3Q/ksOqNFPJHl5Uu6cNZXEWhaQKXY
   0TLaLcI5QGa0TgWdjYtUSrEXpFH2ylfTblWjvFzXPCT4OoYId5BdfDfrF
   NhDhwgc+ihj7ko3FkS9lGswYgfBnJJ2HhjwLbA0VV0dt4swYjus/1SvDr
   Ql76c7AGTAeIzMsmrPSrzhX4qk6sgWxbkIP65XLMX57CROteA5AnVoBc3
   A==;
X-CSE-ConnectionGUID: mNxJ2Tj8R36CiEjoRyBgLA==
X-CSE-MsgGUID: f7LucJBbRii9d1ABY3wIHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67354371"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67354371"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:08:50 -0800
X-CSE-ConnectionGUID: ANUu4H0GTHeP/2gFh5qYfA==
X-CSE-MsgGUID: kr4fcUkoQuyjxrvD/ZJnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227795654"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 00:08:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTbjB-000000004OP-36dV;
	Thu, 11 Dec 2025 08:08:45 +0000
Date: Thu, 11 Dec 2025 16:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: kernel/sched/core.c:10574:58: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512111625.wn0o2Qnb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: fbd0e71dc370af73f6b316e4de9eed273dd90340 sched/mmcid: Provide CID ownership mode fixup functions
date:   2 weeks ago
config: x86_64-randconfig-121-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111625.wn0o2Qnb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111625.wn0o2Qnb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111625.wn0o2Qnb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:804:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:804:33: sparse:     expected struct task_struct *task
   kernel/sched/core.c:804:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1100:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1100:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1100:38: sparse:     got struct task_struct [noderef] __rcu *curr
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
   kernel/sched/core.c:664:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:680:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1799:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1799:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
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
