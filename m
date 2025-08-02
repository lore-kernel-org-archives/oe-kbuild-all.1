Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF98D18CC13
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754161177; cv=none; b=EZXJ7KCV97U7DpFBMXKo+L6WZ43K+3b+8qJCNhuZKPcebMrxDycvMHI+i01kjl0sbiq40xZoShjML2XSW94By3ZHo5dZ12N14zJL0Me9UoyPxN5gk3OL7ty0OaEgx9jQBIvdbSTnwRhiErvnUH04dYacyRQSNX60oNvTL9G8zv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754161177; c=relaxed/simple;
	bh=VM5ATlJvpRnLnh1+HacweXWR4o+39vBY9Mme7b2+F/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPCjeh5GrW3cHstMMO9tTZgLrL3V9IKUiABVmDfcWX1xCTBG5wl1Sl4IV+3xAKRfxsJ2DKWpsvqvrzqfzmta+Z0PqYNEX34tPekl2QQrl0clIqoBfjkbcFrIYb3eCc9/rvIDXdD0x8/EGEbWOtEuezpPgvKa7UkFLmzS34G/TO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaYXcVUW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaYXcVUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754161175; x=1785697175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VM5ATlJvpRnLnh1+HacweXWR4o+39vBY9Mme7b2+F/o=;
  b=GaYXcVUWmL/ZJtNx1gieIaByLd7CDa2AjNID4W5lBg+k26WquN75Mutf
   a4dorvnVxy3P51PXCuN96D3zzl+cUUTsiB8h/yhlTtB0KuTnMaL1hY7EP
   3C3gC4x0B0MIiANjzXdkNqaITgyuvYnUHIY8/Yxl7ku7SJqYMg5seXwo9
   nbA+sYlGJRaV6PDfrHjnZxis4N0Su5z/sL4oUh5dxbSnsgE+8DKsYwsFF
   G0KQXtZha/vmncuGfIdnRfEJai4NkG9qY+0V7i90kd+N/k1fzZ4/f0K2U
   /lrnQiWtjKp9waVtPbz8vTas4y3te4xryYMOtdhVO6BUmTQ0ho9mx8W95
   Q==;
X-CSE-ConnectionGUID: dc4IICzESBShNm6yiRNWhw==
X-CSE-MsgGUID: QMkpJ1EFRRu4W7Vth7OIig==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="81926102"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="81926102"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 11:59:34 -0700
X-CSE-ConnectionGUID: grQHuJPERIa6HseU2LgCQQ==
X-CSE-MsgGUID: kf6IUnRyQeWqP7QvuBMA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169129472"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Aug 2025 11:59:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiHS7-0005YS-0S;
	Sat, 02 Aug 2025 18:59:31 +0000
Date: Sun, 3 Aug 2025 02:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 8/33] kernel/ptrace.c:380:30: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202508030257.JGIavAFP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   fdd3a307f8bbbf8727a633b44c3d6a31103e1938
commit: 19b8502cf404e369c1dac8db67ced1f1763262df [8/33] locking/rwlock, spinlock: Support Clang's capability analysis
config: csky-randconfig-r111-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030257.JGIavAFP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250803/202508030257.JGIavAFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030257.JGIavAFP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/ptrace.c:55:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:55:22: sparse:    struct task_struct *
   kernel/ptrace.c:55:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:74:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *parent @@     got struct task_struct *new_parent @@
   kernel/ptrace.c:74:23: sparse:     expected struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:74:23: sparse:     got struct task_struct *new_parent
   kernel/ptrace.c:75:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *ptracer_cred @@     got struct cred const * @@
   kernel/ptrace.c:75:29: sparse:     expected struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:75:29: sparse:     got struct cred const *
   kernel/ptrace.c:129:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   kernel/ptrace.c:129:18: sparse:     expected struct cred const *old_cred
   kernel/ptrace.c:129:18: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:133:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:133:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:133:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:160:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:160:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:160:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:192:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:192:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:192:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:198:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:198:30: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:198:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:251:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:251:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:251:44: sparse:    struct task_struct *
   kernel/ptrace.c:494:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/ptrace.c:494:54: sparse:     expected struct task_struct *parent
   kernel/ptrace.c:494:54: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:502:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:502:53: sparse:     expected struct task_struct *new_parent
   kernel/ptrace.c:502:53: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:550:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:550:41: sparse:     expected struct task_struct *p1
   kernel/ptrace.c:550:41: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:552:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sigh @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/ptrace.c:552:50: sparse:     expected struct sighand_struct *sigh
   kernel/ptrace.c:552:50: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/ptrace.c:743:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:743:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:743:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:751:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:751:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:751:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:862:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:862:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:862:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:866:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:866:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:866:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1221:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1221:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1221:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1223:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1223:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1223:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/ptrace.c:380:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:380:30: sparse:     expected struct spinlock [usertype] *_T
   kernel/ptrace.c:380:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:409:12: sparse: sparse: context imbalance in 'ptrace_attach' - different lock contexts for basic block
   kernel/ptrace.c:500:38: sparse: sparse: dereference of noderef expression
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:690:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:706:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   kernel/ptrace.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/ptrace.c:1384:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)

vim +380 kernel/ptrace.c

ee1fee900537b5 Jann Horn      2022-03-19  377  
08701813a1b439 Oleg Nesterov  2024-01-22  378  static inline void ptrace_set_stopped(struct task_struct *task, bool seize)
5431fdd2c181dd Peter Zijlstra 2023-09-17  379  {
5431fdd2c181dd Peter Zijlstra 2023-09-17 @380  	guard(spinlock)(&task->sighand->siglock);
5431fdd2c181dd Peter Zijlstra 2023-09-17  381  
08701813a1b439 Oleg Nesterov  2024-01-22  382  	/* SEIZE doesn't trap tracee on attach */
08701813a1b439 Oleg Nesterov  2024-01-22  383  	if (!seize)
08701813a1b439 Oleg Nesterov  2024-01-22  384  		send_signal_locked(SIGSTOP, SEND_SIG_PRIV, task, PIDTYPE_PID);
5431fdd2c181dd Peter Zijlstra 2023-09-17  385  	/*
5431fdd2c181dd Peter Zijlstra 2023-09-17  386  	 * If the task is already STOPPED, set JOBCTL_TRAP_STOP and
5431fdd2c181dd Peter Zijlstra 2023-09-17  387  	 * TRAPPING, and kick it so that it transits to TRACED.  TRAPPING
5431fdd2c181dd Peter Zijlstra 2023-09-17  388  	 * will be cleared if the child completes the transition or any
5431fdd2c181dd Peter Zijlstra 2023-09-17  389  	 * event which clears the group stop states happens.  We'll wait
5431fdd2c181dd Peter Zijlstra 2023-09-17  390  	 * for the transition to complete before returning from this
5431fdd2c181dd Peter Zijlstra 2023-09-17  391  	 * function.
5431fdd2c181dd Peter Zijlstra 2023-09-17  392  	 *
5431fdd2c181dd Peter Zijlstra 2023-09-17  393  	 * This hides STOPPED -> RUNNING -> TRACED transition from the
5431fdd2c181dd Peter Zijlstra 2023-09-17  394  	 * attaching thread but a different thread in the same group can
5431fdd2c181dd Peter Zijlstra 2023-09-17  395  	 * still observe the transient RUNNING state.  IOW, if another
5431fdd2c181dd Peter Zijlstra 2023-09-17  396  	 * thread's WNOHANG wait(2) on the stopped tracee races against
5431fdd2c181dd Peter Zijlstra 2023-09-17  397  	 * ATTACH, the wait(2) may fail due to the transient RUNNING.
5431fdd2c181dd Peter Zijlstra 2023-09-17  398  	 *
5431fdd2c181dd Peter Zijlstra 2023-09-17  399  	 * The following task_is_stopped() test is safe as both transitions
5431fdd2c181dd Peter Zijlstra 2023-09-17  400  	 * in and out of STOPPED are protected by siglock.
5431fdd2c181dd Peter Zijlstra 2023-09-17  401  	 */
5431fdd2c181dd Peter Zijlstra 2023-09-17  402  	if (task_is_stopped(task) &&
5431fdd2c181dd Peter Zijlstra 2023-09-17  403  	    task_set_jobctl_pending(task, JOBCTL_TRAP_STOP | JOBCTL_TRAPPING)) {
5431fdd2c181dd Peter Zijlstra 2023-09-17  404  		task->jobctl &= ~JOBCTL_STOPPED;
5431fdd2c181dd Peter Zijlstra 2023-09-17  405  		signal_wake_up_state(task, __TASK_STOPPED);
5431fdd2c181dd Peter Zijlstra 2023-09-17  406  	}
5431fdd2c181dd Peter Zijlstra 2023-09-17  407  }
5431fdd2c181dd Peter Zijlstra 2023-09-17  408  

:::::: The code at line 380 was first introduced by commit
:::::: 5431fdd2c181dd2eac218e45b44deb2925fa48f0 ptrace: Convert ptrace_attach() to use lock guards

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
