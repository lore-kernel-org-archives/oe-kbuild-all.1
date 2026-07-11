Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4E2E7398
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 20:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803173; cv=none; b=i8/inrCja/PRaCeDA5ZsPJmUOQZcY9Mnsb9respLWDGzJGhBeVBi6s4BtziXir9LnBjb9J/hAlP9M7TU38Ld8m02bUHEoqj7SmDcFMjjW6nOSI53bamdNz+JIx5HlVb9mT858aaDsYlL2DfHnmqDNJA2nONwK+lmicjJX4YzGfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803173; c=relaxed/simple;
	bh=TPuPiLH/fn7kIBs5RunICat++r44iOcO9n8UhUZpa2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KYydOEjvaEnxWGjVngWtDSuX7t9mZXDPWkWEXNT03Ye1/FvVxylZAzWkUmILYlV7ePOJN6Jmm1Id/0MLLiCtwt1/R89Kq33qjKvCRC1Yun3YS9BR6JmbaM054Mf4tPBRCfKc7pjwnYChDKs06EOqQylfzPsPAshZ+FuS8BWmLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/WZ32ht; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/WZ32ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783803171; x=1815339171;
  h=date:from:to:cc:subject:message-id;
  bh=TPuPiLH/fn7kIBs5RunICat++r44iOcO9n8UhUZpa2E=;
  b=P/WZ32ht2slq1uk6tEQ3rXWwFfUO0Rjb9bXzZUfRCsJ++4OZYmjAzfcg
   M8XQYjJMcGUd1sfrGY14lbpBapJ6yqiW03rVwhBM7SeFHZRLyMzCfdgD3
   QJIDOUUVc/jH57Yz4yEtqXrm+WWAPqNz/QeDVWwjePU3WPn0ZClm/paLK
   Snu0oqyBlOS5d0p1x5bhM9+5iYJgMzYU13zduge2nh6prHIH6EAQbA0W1
   UAYJ0wdPs0D1ezTgAZO+b2mWgMxeDISgD/7Gd5X5191nf0PXsxrWI/vRH
   4DfnLd0gVtEWp5lkkhP6QZtVg1IoTb4EsDCQcAKJ+SFmQoA0mcB9I4Ue+
   g==;
X-CSE-ConnectionGUID: C5livDmbQSGw3fERetThgg==
X-CSE-MsgGUID: 5aUTRsLzTUm8AZ3iH634CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="102023216"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="102023216"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 13:52:50 -0700
X-CSE-ConnectionGUID: vdoQTtHcQc2KiRXgiZidig==
X-CSE-MsgGUID: Jl6jk83qTmmHLcGpBAsZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285273465"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2026 13:52:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiegn-00000000KO2-3Rxw;
	Sat, 11 Jul 2026 20:52:45 +0000
Date: Sun, 12 Jul 2026 04:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-caps-v5 43/61]
 kernel/sched/ext/sub.c:335:30: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202607120412.0mohEapw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-caps-v5
head:   c51c3642e76ea3b627413ecb76f893f1289cf4ae
commit: 08a65d9166c3c4df920a654a332fd5a1f8d6006c [43/61] sched_ext: Maintain per-cpu effective cap copies for single-read checks
config: arm64-randconfig-r132-20260711 (https://download.01.org/0day-ci/archive/20260712/202607120412.0mohEapw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120412.0mohEapw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120412.0mohEapw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext/ext.c:2603:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:2603:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:2755:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:2755:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:2755:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:2902:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:2902:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext/ext.c:2902:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:3133:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3133:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3133:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3545:62: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/ext.c:3545:62: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3545:62: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext/ext.c:6169:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6169:57: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:6169:57: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:6170:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6170:51: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:6170:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:7663:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7663:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:7663:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:9019:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9464:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:9464:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:9464:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:751:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/idle.c:771:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/sub.c:335:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/sub.c:624:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/sub.c:971:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1418:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1425:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2339:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1425:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1343:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1676:15: sparse: sparse: dereference of noderef expression

vim +335 kernel/sched/ext/sub.c

   310	
   311	/**
   312	 * queue_sync_ecaps - Queue ecaps update for a (sch, cid) pair
   313	 * @sch: sched to update
   314	 * @cid: cid to update
   315	 *
   316	 * Queue an ecaps update for @sch's @cid and kick the cpu so that it syncs in
   317	 * balance_one().
   318	 */
   319	static void queue_sync_ecaps(struct scx_sched *sch, s32 cid)
   320	{
   321		s32 cpu = __scx_cid_to_cpu(cid);
   322		struct scx_sched_pcpu *pcpu = per_cpu_ptr(sch->pcpu, cpu);
   323	
   324		/*
   325		 * Pairs with smp_mb() in scx_process_sync_ecaps(). Either the check
   326		 * below sees the node off the list and queues it, or the in-flight sync
   327		 * sees the caps[] update made before this call.
   328		 */
   329		smp_mb();
   330	
   331		/* @cid's pshard->lock excludes concurrent queueing attempts */
   332		if (llist_on_list(&pcpu->ecaps_to_sync_node))
   333			return;
   334		if (llist_add(&pcpu->ecaps_to_sync_node, &cpu_rq(cpu)->scx.ecaps_to_sync))
 > 335			scx_kick_cpu(scx_root, cpu, 0);
   336	}
   337	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
