Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D721CA13
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 04:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783832012; cv=none; b=pDYaO/NctP0xop86fTJQXO8vsLGZCaN4mlSgDr5GrqR+cSIAHFHacX7QZMsZZrF9G5I2zgDhAGFrxUxkYGQJ7tS8PMXVkstVEV074DTAllioWTds5gMk2Qce1QR8QrUCaXk+2x3XqzDwfmvoWPcnAjz8RpCZNyHBgS8x9v68PEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783832012; c=relaxed/simple;
	bh=HlhJZFvpzh3JRFzF97iItEFQV3D7EYjH2bZKToHa2HQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WaXtnqSLBEiDrJPfmioT2nh4dQH4mnwfxidRCOwwVgmzaBoZg+P41d8nuCeG6qewyPh4M4UdOcB41eBOPIWHY1MtAIOP7TbIAMidDo5KLAeS/VVgyrTJvdHur3Fvysc5oFDE8tFow+PMBta2Gv33yfBRcOTfustp5VBkz6T+vqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lh2EKq2/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lh2EKq2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783832010; x=1815368010;
  h=date:from:to:cc:subject:message-id;
  bh=HlhJZFvpzh3JRFzF97iItEFQV3D7EYjH2bZKToHa2HQ=;
  b=lh2EKq2/+YImdd3ve9S6hFXzupRdNUDrD+YDzafppkcfIs6QJLQTM8Wx
   rbsU41tyMz7WJK6CdaQd/Rk6r6gMjKoeYXsG8VzWQSCyGTfbKEpvhxPMY
   ugrO7bs/q9OLS/vr4DG23ApHq8RJRNHbQnUkvIPyey1n5JKqlotr2KQqG
   nHWvh3FCMAcWIrhn7p2Icz0f5YVa7l5WwfxuG/a0mO1f2IdL4Ejj+9Bc8
   KPhwfNnxBQULN4RZMgM3qBhFttgFEj3Q6V2ICQiZbEW7aac7Q70xaOTIf
   oFSv/AFDpqIwEsIOKU1reX1l5K7UhlV5ZvuCoVXbd3MLXDDia9G1N1V4p
   w==;
X-CSE-ConnectionGUID: pvyIW9KfTeCvNKDeh9rVqA==
X-CSE-MsgGUID: TS+w1ViNSGWVnvSfM15KPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107280336"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107280336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 21:53:30 -0700
X-CSE-ConnectionGUID: BB5V6jYqSbKvFOy/IN3o5A==
X-CSE-MsgGUID: T9RpWl3hQXCzO28tBzro1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254111364"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Jul 2026 21:53:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wimBx-00000000KhW-0rFn;
	Sun, 12 Jul 2026 04:53:25 +0000
Date: Sun, 12 Jul 2026 12:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-caps-v5 56/61]
 kernel/sched/ext/idle.c:749:45: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202607121243.ItBZpELi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-caps-v5
head:   c51c3642e76ea3b627413ecb76f893f1289cf4ae
commit: 09b1d220cac3c0c6db1529f18b56e09e2f931c26 [56/61] sched_ext: Route ops.update_idle() to sub-schedulers and re-notify owed scheds
config: arm64-randconfig-r132-20260711 (https://download.01.org/0day-ci/archive/20260712/202607121243.ItBZpELi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121243.ItBZpELi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607121243.ItBZpELi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext/ext.c:2201:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext/ext.c:2212:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2212:38: sparse:     expected struct task_struct *from
   kernel/sched/ext/ext.c:2212:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext/ext.c:2785:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:2785:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:2785:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:2941:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:2941:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:2941:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3090:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:3090:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext/ext.c:3090:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:3321:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3321:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3321:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3739:62: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/ext.c:3739:62: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3739:62: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext/ext.c:4086:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4086:48: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:4086:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:4087:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4087:34: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:4087:34: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:5566:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:5566:17: sparse:    struct scx_sched *
   kernel/sched/ext/ext.c:5566:17: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext/ext.c:6424:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6424:57: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:6424:57: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:6425:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6425:51: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:6425:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:7921:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7921:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:7921:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:7951:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7951:58: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:7951:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:9323:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9768:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:9768:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:9768:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/idle.c:749:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct scx_sched *root @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/idle.c:754:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct scx_sched *root @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
>> kernel/sched/ext/idle.c:758:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/idle.c:758:25: sparse:    struct scx_sched *
   kernel/sched/ext/idle.c:758:25: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/sub.c:464:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/sub.c:591:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct scx_sched *root @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/sub.c:595:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/sub.c:595:25: sparse:    struct scx_sched *
   kernel/sched/ext/sub.c:595:25: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext/sub.c:619:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct scx_sched *root @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/sub.c:621:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/sub.c:621:25: sparse:    struct scx_sched *
   kernel/sched/ext/sub.c:621:25: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext/sub.c:891:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/sub.c:1238:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1418:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1431:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1431:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1431:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2339:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2470:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2470:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2459:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2459:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1431:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1431:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1431:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1343:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1676:15: sparse: sparse: dereference of noderef expression

vim +749 kernel/sched/ext/idle.c

   733	
   734	/*
   735	 * Notify schedulers of an idle transition on @cpu's cid, delivering to every
   736	 * sched that holds %SCX_CAP_BASE on the cid (the root holds every cap). A real
   737	 * transition (@do_notify) reaches all holders. A forced one (@root_renotify for
   738	 * the root, a sub-sched's idle_renotify marker for a sub) reaches only the owed
   739	 * scheds.
   740	 */
   741	static void scx_idle_notify(struct rq *rq, bool idle, bool do_notify, bool root_renotify)
   742	{
   743		s32 cpu = cpu_of(rq);
   744		s32 cid = scx_cpu_arg(cpu);
   745		struct scx_sched *pos;
   746	
   747		lockdep_assert_rq_held(rq);
   748	
 > 749		pos = scx_next_descendant_pre(NULL, scx_root);
   750		while (pos) {
   751			bool forced = false;
   752	
   753			if (unlikely(scx_missing_caps(pos, cpu, SCX_CAP_BASE))) {
   754				pos = scx_skip_subtree_pre(pos, scx_root);
   755				continue;
   756			}
   757	
 > 758			if (pos == scx_root) {
   759				forced = root_renotify;
   760			}
   761	#ifdef CONFIG_EXT_SUB_SCHED
   762			else if (per_cpu_ptr(pos->pcpu, cpu)->idle_renotify) {
   763				per_cpu_ptr(pos->pcpu, cpu)->idle_renotify = false;
   764				forced = true;
   765			}
   766	#endif
   767			if ((do_notify || forced) && SCX_HAS_OP(pos, update_idle) &&
   768			    !scx_bypassing(pos, cpu))
   769				SCX_CALL_OP(pos, update_idle, rq, cid, idle);
   770			pos = scx_next_descendant_pre(pos, scx_root);
   771		}
   772	}
   773	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
