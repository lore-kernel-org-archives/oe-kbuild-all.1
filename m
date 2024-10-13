Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3515804
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728812027; cv=none; b=BVDO2+ZqVdkCvscrWlm4+ikonr3mt0XNhW12WO9swcesxQZSvKNGcb6EeQgT+KbzUOQRbql7fb8Ch7MxGODCiVcPu6p8kmPofDUS30ndGWvqQaf4AyLS2KJMgXgroB5bA/A1fjC3SEXljFugl5GckPiB8eCr8Uy6h8NkOK+Tgsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728812027; c=relaxed/simple;
	bh=5wK74fUrEHkvB292FNJyZVDsVJIKjLQxSU6WM1uCuFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jB10/3c5T+3dhvdTROwpD4KazGVES18Pr9vRJHPcOp/+0LS6QGwCGMixm8KwsVo1QuQsScS2mjYkAzeEBgQ2xEzOaR8bdrZy9PTB2eDTudY5Dz0y9Hp1JvuxR3CbVIpUrJkjulcYo+XTLTwCcn0SXsDhE4ze5Y4Ey4Md9gK68Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+3sz0wE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+3sz0wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728812025; x=1760348025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wK74fUrEHkvB292FNJyZVDsVJIKjLQxSU6WM1uCuFA=;
  b=g+3sz0wEutxTkIvDo33Zy6TfqoqeAZfwFAA+MrsRmIUToq1F6Z9/ImiZ
   cFU7iH58jWrcTYYueLz5EwjQINtins8NElpLRUGMcusQBdu8L7+2ucEcs
   gu0KoZQ74pNb9G/++iaiwt7K9czzw36XoDV6jQmq74K7QjAlo8isoqxjE
   fptOdhD73+Qzkyv7mwnCXlxxYhMBkPWaGLdyIRMKjtpz4lrZ75QGCNmSa
   ix6SbpXrfnv0WTAqaJ62QtTf/I5u83Xo7CJFXHlIRC1HZYrk91d91OQ4x
   fYbq9I7+9bSj6MKimd5Uqqi5090ROxhAFUNhmSaFMUhjho6T4DiWTdjt8
   w==;
X-CSE-ConnectionGUID: HJI/p1SBQl6/lrWANrqTjQ==
X-CSE-MsgGUID: /jYEkhFRRsyg+qq35zU6fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45670147"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="45670147"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 02:33:44 -0700
X-CSE-ConnectionGUID: J2tO0Y3yQYCg9nv3RgYrCg==
X-CSE-MsgGUID: O5DT6VIKTfSjJuKD4116Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="108049501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Oct 2024 02:33:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szuyp-000EFh-2o;
	Sun, 13 Oct 2024 09:33:39 +0000
Date: Sun, 13 Oct 2024 17:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Juri Lelli <juri.lelli@redhat.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>, Metin Kaya <metin.kaya@arm.com>
Subject: [peterz-queue:sched/core 10/10] kernel/sched/rt.c:1550:15: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202410131726.IzgJPN4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   f3542dc97564eea82e113e7978ed9ea5ccc7f37e
commit: f3542dc97564eea82e113e7978ed9ea5ccc7f37e [10/10] sched: Split scheduler and execution contexts
config: x86_64-randconfig-121-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131726.IzgJPN4Z-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131726.IzgJPN4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131726.IzgJPN4Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2336:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2336:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2336:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:991:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:991:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:991:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1529:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1529:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1529:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1849:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1849:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1849:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1549:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1549:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1549:14: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/rt.c:1550:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1550:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1550:15: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/rt.c:1611:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1611:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1611:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1674:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1674:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1674:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2018:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2018:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2018:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2041:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2387:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2387:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2387:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2389:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2389:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2703:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2703:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2703:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2713:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2819:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2342:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2342:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2342:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2353:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2353:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2353:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1739:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1739:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1739:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2564:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2564:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2564:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2226:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2226:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2226:14: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/deadline.c:2227:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2227:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2227:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2303:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2303:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2303:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2864:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2864:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2864:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2866:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2866:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2866:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2868:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2868:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2868:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3092:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:253:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1336:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1699:15: sparse: sparse: dereference of noderef expression

vim +1550 kernel/sched/rt.c

  1526	
  1527	static void yield_task_rt(struct rq *rq)
  1528	{
> 1529		requeue_task_rt(rq, rq->curr, 0);
  1530	}
  1531	
  1532	#ifdef CONFIG_SMP
  1533	static int find_lowest_rq(struct task_struct *task);
  1534	
  1535	static int
  1536	select_task_rq_rt(struct task_struct *p, int cpu, int flags)
  1537	{
  1538		struct task_struct *curr, *donor;
  1539		struct rq *rq;
  1540		bool test;
  1541	
  1542		/* For anything but wake ups, just return the task_cpu */
  1543		if (!(flags & (WF_TTWU | WF_FORK)))
  1544			goto out;
  1545	
  1546		rq = cpu_rq(cpu);
  1547	
  1548		rcu_read_lock();
  1549		curr = READ_ONCE(rq->curr); /* unlocked access */
> 1550		donor = READ_ONCE(rq->donor);
  1551	
  1552		/*
  1553		 * If the current task on @p's runqueue is an RT task, then
  1554		 * try to see if we can wake this RT task up on another
  1555		 * runqueue. Otherwise simply start this RT task
  1556		 * on its current runqueue.
  1557		 *
  1558		 * We want to avoid overloading runqueues. If the woken
  1559		 * task is a higher priority, then it will stay on this CPU
  1560		 * and the lower prio task should be moved to another CPU.
  1561		 * Even though this will probably make the lower prio task
  1562		 * lose its cache, we do not want to bounce a higher task
  1563		 * around just because it gave up its CPU, perhaps for a
  1564		 * lock?
  1565		 *
  1566		 * For equal prio tasks, we just let the scheduler sort it out.
  1567		 *
  1568		 * Otherwise, just let it ride on the affine RQ and the
  1569		 * post-schedule router will push the preempted task away
  1570		 *
  1571		 * This test is optimistic, if we get it wrong the load-balancer
  1572		 * will have to sort it out.
  1573		 *
  1574		 * We take into account the capacity of the CPU to ensure it fits the
  1575		 * requirement of the task - which is only important on heterogeneous
  1576		 * systems like big.LITTLE.
  1577		 */
  1578		test = curr &&
  1579		       unlikely(rt_task(donor)) &&
  1580		       (curr->nr_cpus_allowed < 2 || donor->prio <= p->prio);
  1581	
  1582		if (test || !rt_task_fits_capacity(p, cpu)) {
  1583			int target = find_lowest_rq(p);
  1584	
  1585			/*
  1586			 * Bail out if we were forcing a migration to find a better
  1587			 * fitting CPU but our search failed.
  1588			 */
  1589			if (!test && target != -1 && !rt_task_fits_capacity(p, target))
  1590				goto out_unlock;
  1591	
  1592			/*
  1593			 * Don't bother moving it if the destination CPU is
  1594			 * not running a lower priority task.
  1595			 */
  1596			if (target != -1 &&
  1597			    p->prio < cpu_rq(target)->rt.highest_prio.curr)
  1598				cpu = target;
  1599		}
  1600	
  1601	out_unlock:
  1602		rcu_read_unlock();
  1603	
  1604	out:
  1605		return cpu;
  1606	}
  1607	
  1608	static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
  1609	{
  1610		if (rq->curr->nr_cpus_allowed == 1 ||
> 1611		    !cpupri_find(&rq->rd->cpupri, rq->donor, NULL))
  1612			return;
  1613	
  1614		/*
  1615		 * p is migratable, so let's not schedule it and
  1616		 * see if it is pushed or pulled somewhere else.
  1617		 */
  1618		if (p->nr_cpus_allowed != 1 &&
  1619		    cpupri_find(&rq->rd->cpupri, p, NULL))
  1620			return;
  1621	
  1622		/*
  1623		 * There appear to be other CPUs that can accept
  1624		 * the current task but none can run 'p', so lets reschedule
  1625		 * to try and push the current task away:
  1626		 */
  1627		requeue_task_rt(rq, p, 1);
  1628		resched_curr(rq);
  1629	}
  1630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
