Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850F225760
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772242388; cv=none; b=FyVgTf4NySm7cQxI/3dNzOPer6nhyK1lxHkrIBMxPYI2mlDoifQxm48mJVy0yF5T7S3r8xCDSEopdlVZwo1u9MsByAiDClPcL9bsjruiyIefcQTMBvpBdvoRejdDsA9YGq7j//Z1ROCY9Sp9i+v6/wILwOIk0cPe8UCuaDokZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772242388; c=relaxed/simple;
	bh=PQ8rf4OkA0JCJ+8HupADPV9JYoe5+3GUC8F3HOYrS/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tzl8zGWBf5hI6zIzcv3gsWjlG2Gx31Yh6VW2Zrrlhtb8R1keBM8qLoacsrPULBkYhFyLw5WWqD/A/JMUNvEYW5DrOuNjqoojj3XjBKN9s+57G7TCHENW9epZSKt9BYI0X1/zpb+2HD+0MAOCLVxkE30fgIJTqdFbtb3qV49f2cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4Is67qS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4Is67qS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772242387; x=1803778387;
  h=date:from:to:cc:subject:message-id;
  bh=PQ8rf4OkA0JCJ+8HupADPV9JYoe5+3GUC8F3HOYrS/M=;
  b=A4Is67qStuB/EIHqQj0yc0YxfaFi+s/8Pyt6SrqyO+g3yZYf0Q8Ei/dy
   8qxuJGRoEkvIH8YO2wEvVZCYp9JtQeDlrf4pN0Wzu7r18d58dxwno7ikV
   eDBxyKTU/+Xy+Wk46RuDQl1R8L/SR8CMQQ+N3elFr8/lAIGhKSmxfgb9k
   +GYFEOJ5KdBVcqw+dSUK9KepUZPOzGMxL66ABN2RhXln62OI9sB3z/Tet
   gSoLKU8rpOoxPqVDqaK+V+pVtebodxVx1os5APEeZbICnkHafSNnF02M3
   ihfxVlVQnxEMAYS8eEivfaznmn6wPpKX2UtHIUxhT9o27ApHjsGNHztr4
   g==;
X-CSE-ConnectionGUID: ENzn+up5Ra6Dw4O0xrnykw==
X-CSE-MsgGUID: Ct8EkbdGTm6yNSYyLYlfXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73237546"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73237546"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 17:33:06 -0800
X-CSE-ConnectionGUID: AvvJLtYqRj+9HJ1fKCNFww==
X-CSE-MsgGUID: nVUatlqkS4abJv9qQ9l8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="247562707"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2026 17:33:06 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw9CY-00000000BEf-2Yvr;
	Sat, 28 Feb 2026 01:33:02 +0000
Date: Sat, 28 Feb 2026 09:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 kernel/sched/core.c:4197:35: warning: function 'proxy_resched_idle' has
 internal linkage but is not defined
Message-ID: <202602280945.nlHnXHeI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   1de239ac3464b167e07b59e5e91f7c58d4cc5166
commit: 1de239ac3464b167e07b59e5e91f7c58d4cc5166 [3/3] ANDROID: sched: proxy-exec: Rework proxy_needs_return() to match v24 logic
config: arm-exynos_defconfig (https://download.01.org/0day-ci/archive/20260228/202602280945.nlHnXHeI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280945.nlHnXHeI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280945.nlHnXHeI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:5713:6: warning: no previous prototype for function '__balance_callbacks' [-Wmissing-prototypes]
    5713 | void __balance_callbacks(struct rq *rq)
         |      ^
   kernel/sched/core.c:5713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5713 | void __balance_callbacks(struct rq *rq)
         | ^
         | static 
>> kernel/sched/core.c:4197:35: warning: function 'proxy_resched_idle' has internal linkage but is not defined [-Wundefined-internal]
    4197 | static inline struct task_struct *proxy_resched_idle(struct rq *rq);
         |                                   ^
   kernel/sched/core.c:4230:3: note: used here
    4230 |                 proxy_resched_idle(rq);
         |                 ^
   2 warnings generated.


vim +/proxy_resched_idle +4197 kernel/sched/core.c

  4195	
  4196	#ifdef CONFIG_SMP
> 4197	static inline struct task_struct *proxy_resched_idle(struct rq *rq);
  4198	/*
  4199	 * Checks to see if task p has been proxy-migrated to another rq
  4200	 * and needs to be returned. If so, we deactivate the task here
  4201	 * so that it can be properly woken up on the p->wake_cpu
  4202	 * (or whichever cpu select_task_rq() picks at the bottom of
  4203	 * try_to_wake_up()
  4204	 */
  4205	static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
  4206	{
  4207		if (!sched_proxy_exec())
  4208			return false;
  4209	
  4210		guard(raw_spinlock)(&p->blocked_lock);
  4211	
  4212		/* If task isn't BO_WAKING, we don't need to do return migration */
  4213		if (p->blocked_on_state != BO_WAKING)
  4214			return false;
  4215	
  4216		__set_blocked_on_runnable(p);
  4217	
  4218		/* If already current, don't need to return migrate */
  4219		if (task_current(rq, p))
  4220			return false;
  4221	
  4222		/* If wake_cpu is targeting this cpu, don't bother return migrating */
  4223		if (p->wake_cpu == cpu_of(rq)) {
  4224			resched_curr(rq);
  4225			return false;
  4226		}
  4227	
  4228		/* If we're return migrating the rq->donor, switch it out for idle */
  4229		if (task_current_donor(rq, p))
  4230			proxy_resched_idle(rq);
  4231	
  4232		/* (ab)Use DEQUEUE_SPECIAL to ensure task is always blocked here. */
  4233		block_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SPECIAL);
  4234		return true;
  4235	}
  4236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
