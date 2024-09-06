Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA71D4609
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649136; cv=none; b=DtXq9CV7+5Rp0XGHOKh3+Av4+QUMhm8bi/sPYaqhowDRawnu+RygxrrX5q76B5Onufw9zZD8VlAAYzHbldphumQGlPbfcdSWkzdRvQo+6iPgV2GNjufBi4KX9HXHLyJWYZKyMWhnFgAJmHdX4Y7K6h1f6xg5dmMZDovlFkD2954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649136; c=relaxed/simple;
	bh=4IebFgKj4Ggbke3RBUh4YOsVSbo9gDe4VYqx3CQa66M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jS/z7LvdUMLMSR1TvTJW3YAsEIDBcMNPVL/J/cz9YR3gHsJtnoUPUwWTzCOSxWxJ0vJGKgjc3Jm1fWxLswaBNwPaF2S3/UCYmvEQJcLQraXBvD9vaxvmskCJbnzIerxZsrpTuTOyXtaMQmIBzCn2rEKvR9zg3a+hPrN0P/vAOR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPa86wXT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPa86wXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725649134; x=1757185134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4IebFgKj4Ggbke3RBUh4YOsVSbo9gDe4VYqx3CQa66M=;
  b=YPa86wXTXul4zHuUgp6FS9AVhBrTLRjZyenbBynhjhXJI+NnBEcnPl77
   YRZ41sjH900IGlRYYDaFRHx0974hIIINob6+7IYHB4Ml/Syu1eBJ8el16
   +Y8ptXrrh8uWuUhA5qYP4lN8W9dHCJzZz9I72Z4SGSfKFJ3Oi8Mp5QpRe
   5m2o798XcWHZwA/67pL8cfDealWG7wiRvP2lseovfwZLTSgUYEMFhOkG2
   GpT/Ov9Hs2nStCI7JfvH3ZMH1cZUx0oZBJZ+/FU4VnbKs3gU5C1nc9wYi
   yI/Bg2SwqJ8HrAyhSXPKvF1ZdOfjHpt2jjBQhq5Gmnrub4NDWWLQ5Uiup
   A==;
X-CSE-ConnectionGUID: Ymn+sTd3T4O9mSMD7aK83A==
X-CSE-MsgGUID: 9JSMPiUqQiminKtBeHOinw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41899303"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="41899303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 11:58:53 -0700
X-CSE-ConnectionGUID: 09yshNJSQdGUAZDEWXc4qQ==
X-CSE-MsgGUID: dm3JctWwRJ6uCAQ+6B/dog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="70170692"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2024 11:58:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smeAS-000BcB-22;
	Fri, 06 Sep 2024 18:58:48 +0000
Date: Sat, 7 Sep 2024 02:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Vernet <dvernet@meta.com>
Subject: [linux-next:master 104/10296] kernel/sched/ext.c:631:22: sparse:
 sparse: symbol 'scx_dump_data' was not declared. Should it be static?
Message-ID: <202409070218.RB5WsQ07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 07814a9439a3b03d79a1001614b5bc1cab69bcec [104/10296] sched_ext: Print debug dump after an error exit
config: loongarch-randconfig-r131-20240906 (https://download.01.org/0day-ci/archive/20240907/202409070218.RB5WsQ07-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409070218.RB5WsQ07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070218.RB5WsQ07-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:916:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:916:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:916:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1002:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1002:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1002:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1536:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1536:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1536:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1876:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1876:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1876:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1556:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1556:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1556:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1621:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1621:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1621:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1682:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1682:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1682:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2044:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2044:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2044:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2067:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2417:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2417:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2417:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2401:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2401:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2401:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2411:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2519:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2026:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2026:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2026:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2037:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2037:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2037:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1220:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1220:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1220:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1444:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1444:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1444:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2262:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1911:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1911:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1911:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1987:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1987:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1987:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2566:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2566:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2566:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2568:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2568:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2568:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2570:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2570:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2570:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2794:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:531:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
>> kernel/sched/ext.c:631:22: sparse: sparse: symbol 'scx_dump_data' was not declared. Should it be static?
   kernel/sched/ext.c:982:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1399:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1409:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:3444:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4824:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4824:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:4824:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2389:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2389:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1426:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1707:15: sparse: sparse: dereference of noderef expression

vim +/scx_dump_data +631 kernel/sched/ext.c

   530	
 > 531	struct static_key_false scx_has_op[SCX_OPI_END] =
   532		{ [0 ... SCX_OPI_END-1] = STATIC_KEY_FALSE_INIT };
   533	
   534	static atomic_t scx_exit_kind = ATOMIC_INIT(SCX_EXIT_DONE);
   535	static struct scx_exit_info *scx_exit_info;
   536	
   537	static atomic_long_t scx_nr_rejected = ATOMIC_LONG_INIT(0);
   538	
   539	/*
   540	 * The maximum amount of time in jiffies that a task may be runnable without
   541	 * being scheduled on a CPU. If this timeout is exceeded, it will trigger
   542	 * scx_ops_error().
   543	 */
   544	static unsigned long scx_watchdog_timeout;
   545	
   546	/*
   547	 * The last time the delayed work was run. This delayed work relies on
   548	 * ksoftirqd being able to run to service timer interrupts, so it's possible
   549	 * that this work itself could get wedged. To account for this, we check that
   550	 * it's not stalled in the timer tick, and trigger an error if it is.
   551	 */
   552	static unsigned long scx_watchdog_timestamp = INITIAL_JIFFIES;
   553	
   554	static struct delayed_work scx_watchdog_work;
   555	
   556	/* idle tracking */
   557	#ifdef CONFIG_SMP
   558	#ifdef CONFIG_CPUMASK_OFFSTACK
   559	#define CL_ALIGNED_IF_ONSTACK
   560	#else
   561	#define CL_ALIGNED_IF_ONSTACK __cacheline_aligned_in_smp
   562	#endif
   563	
   564	static struct {
   565		cpumask_var_t cpu;
   566		cpumask_var_t smt;
   567	} idle_masks CL_ALIGNED_IF_ONSTACK;
   568	
   569	#endif	/* CONFIG_SMP */
   570	
   571	/*
   572	 * Direct dispatch marker.
   573	 *
   574	 * Non-NULL values are used for direct dispatch from enqueue path. A valid
   575	 * pointer points to the task currently being enqueued. An ERR_PTR value is used
   576	 * to indicate that direct dispatch has already happened.
   577	 */
   578	static DEFINE_PER_CPU(struct task_struct *, direct_dispatch_task);
   579	
   580	/* dispatch queues */
   581	static struct scx_dispatch_q __cacheline_aligned_in_smp scx_dsq_global;
   582	
   583	static const struct rhashtable_params dsq_hash_params = {
   584		.key_len		= 8,
   585		.key_offset		= offsetof(struct scx_dispatch_q, id),
   586		.head_offset		= offsetof(struct scx_dispatch_q, hash_node),
   587	};
   588	
   589	static struct rhashtable dsq_hash;
   590	static LLIST_HEAD(dsqs_to_free);
   591	
   592	/* dispatch buf */
   593	struct scx_dsp_buf_ent {
   594		struct task_struct	*task;
   595		unsigned long		qseq;
   596		u64			dsq_id;
   597		u64			enq_flags;
   598	};
   599	
   600	static u32 scx_dsp_max_batch;
   601	
   602	struct scx_dsp_ctx {
   603		struct rq		*rq;
   604		struct rq_flags		*rf;
   605		u32			cursor;
   606		u32			nr_tasks;
   607		struct scx_dsp_buf_ent	buf[];
   608	};
   609	
   610	static struct scx_dsp_ctx __percpu *scx_dsp_ctx;
   611	
   612	/* string formatting from BPF */
   613	struct scx_bstr_buf {
   614		u64			data[MAX_BPRINTF_VARARGS];
   615		char			line[SCX_EXIT_MSG_LEN];
   616	};
   617	
   618	static DEFINE_RAW_SPINLOCK(scx_exit_bstr_buf_lock);
   619	static struct scx_bstr_buf scx_exit_bstr_buf;
   620	
   621	/* ops debug dump */
   622	struct scx_dump_data {
   623		s32			cpu;
   624		bool			first;
   625		s32			cursor;
   626		struct seq_buf		*s;
   627		const char		*prefix;
   628		struct scx_bstr_buf	buf;
   629	};
   630	
 > 631	struct scx_dump_data scx_dump_data = {
   632		.cpu			= -1,
   633	};
   634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
