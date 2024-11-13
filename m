Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614C157A48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 21:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731534465; cv=none; b=Kl3L3kBVnBEgjuprKkttprzG99VX8m5WtpXecRTPDtpROf+jHxnrAd8iheNspZG/s1bnoG5j5uj738s8bzzq6sBagcebYB78V1c/AfisKSJlRrYGbx7/h2doPBFHRatLt3fBcWyLtuWPz5Sy+eiCohtJImleZL2fpKHMSCAerIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731534465; c=relaxed/simple;
	bh=9ZUEGDSkXwSlFLuw/bBXx2jDW9w+H/eaR7wdOKsDTTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=coV8NsCFOiMZL7jdQVAzRp2Tn2eRRunKrr0xeN4pz6DPVgM8avFJlCwzczSVczWNO60Mzkgr1KOynLVzml4BeqLvb/wVcoCPteeVpftgmXst0mAELq52hMPUhkZgp/8ZWBoADa1B5PgLSQLISzGAFl9L+LSZOqq7C+bHo77REik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqMlGMU/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqMlGMU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731534463; x=1763070463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ZUEGDSkXwSlFLuw/bBXx2jDW9w+H/eaR7wdOKsDTTA=;
  b=BqMlGMU/6MycZa6hAXFX4a2OsG7+/elA3cFaa9ryPZsNI247dgiQrmkW
   f6CB3pxf0NDEuCO0olniKbN83F/l8iULGm+BVhgYFJoHrbl2YfFjW5JuH
   VbYJcAKjMZ/zda1UE/Dkg2Fv+4xT7UQGAZrR1wovg/HbTM79w/pE9mabz
   0LnbzY4tXUpcxlqa1y8frZa6WGH/YOKzasHZ973YxiSqq4NMO9PhJtwC4
   kvV/n1ATs0sRgUxMntVzWH2YYztPoVHfjJxyhX1RpgyHIqkbYjZAC+nVc
   vxmmDO5ypAKZ8r7Its1jXHxBbZwI1XTyduKUPqp/Gk7XziJUHIsfyOxCm
   w==;
X-CSE-ConnectionGUID: hm7mu6oyTry1dQny5Lwoog==
X-CSE-MsgGUID: BmchgJk1Q3SoCIA2UBW7aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35244975"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="35244975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:47:43 -0800
X-CSE-ConnectionGUID: S9KDfXlXTV2XjkojvREHJQ==
X-CSE-MsgGUID: WUma6PpHSly16qD219ldxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88794875"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 13:47:40 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBLD7-0000kb-2C;
	Wed, 13 Nov 2024 21:47:37 +0000
Date: Thu, 14 Nov 2024 05:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Leonardo Bras <leobras@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [riscv:for-next 9/15] kernel/fork.c:1895:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202411140529.FxTxOwOw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
head:   0eb512779d642b21ced83778287a0f7a3ca8f2a1
commit: cbe82e140bb76e1aa9f808cc841654a25b70d4e5 [9/15] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
config: riscv-randconfig-r112-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140529.FxTxOwOw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241114/202411140529.FxTxOwOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140529.FxTxOwOw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   kernel/fork.c:1243:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *owner @@     got struct task_struct *p @@
   kernel/fork.c:1243:19: sparse:     expected struct task_struct [noderef] __rcu *owner
   kernel/fork.c:1243:19: sparse:     got struct task_struct *p
   kernel/fork.c:1790:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1790:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1790:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1799:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1799:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1799:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1800:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1800:9: sparse:     expected void const *
   kernel/fork.c:1800:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1800:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1800:9: sparse:     expected void const *
   kernel/fork.c:1800:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1800:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1800:9: sparse:     expected void const *
   kernel/fork.c:1800:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1801:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1801:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1801:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1895:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/fork.c:1895:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/fork.c:1895:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/fork.c:2193:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2193:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2193:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2197:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2197:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2197:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2511:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2511:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2511:32: sparse:     got struct task_struct *
   kernel/fork.c:2520:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2520:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2520:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2569:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2569:54: sparse:     expected struct list_head *head
   kernel/fork.c:2569:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2589:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2589:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2589:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2611:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2611:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2611:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2639:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2639:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2639:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2670:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2670:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2670:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2672:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2672:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2672:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3115:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3115:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3115:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3203:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3203:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3203:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:2243:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/ftrace.h, include/linux/perf_event.h, include/linux/trace_events.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2567:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2568:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1235:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:1235:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:1235:23: sparse:    struct task_struct *
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   kernel/seccomp.c:579:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:579:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:579:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:583:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:583:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:583:29: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/seccomp.c:895:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:895:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:895:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:1396:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1396:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1396:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1408:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1408:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1408:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1894:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/seccomp.c:1894:9: sparse:     expected struct lockdep_map const *lock
   kernel/seccomp.c:1894:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/seccomp.c:1980:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1980:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1980:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1998:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1998:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1998:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:495:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:495:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:495:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:602:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:602:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:602:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:453:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:453:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:453:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:439:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:439:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:439:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:453:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:453:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:453:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:439:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:439:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:439:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:453:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:453:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:453:9: sparse:     got struct qspinlock [noderef] __rcu *

vim +1895 kernel/fork.c

a016f3389c06606 JANAK DESAI             2006-02-07  1784  
a39bc51691a0c88 Alexey Dobriyan         2007-10-18  1785  static int copy_sighand(unsigned long clone_flags, struct task_struct *tsk)
^1da177e4c3f415 Linus Torvalds          2005-04-16  1786  {
^1da177e4c3f415 Linus Torvalds          2005-04-16  1787  	struct sighand_struct *sig;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1788  
60348802e9cb137 Zhaolei                 2009-01-06  1789  	if (clone_flags & CLONE_SIGHAND) {
d036bda7d0e7269 Elena Reshetova         2019-01-18  1790  		refcount_inc(&current->sighand->count);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1791  		return 0;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1792  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  1793  	sig = kmem_cache_alloc(sighand_cachep, GFP_KERNEL);
0c282b068eb26db Madhuparna Bhowmik      2020-01-27  1794  	RCU_INIT_POINTER(tsk->sighand, sig);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1795  	if (!sig)
^1da177e4c3f415 Linus Torvalds          2005-04-16  1796  		return -ENOMEM;
9d7fb04276481c5 Peter Zijlstra          2015-06-30  1797  
d036bda7d0e7269 Elena Reshetova         2019-01-18  1798  	refcount_set(&sig->count, 1);
06e62a46bbba20a Jann Horn               2018-08-21  1799  	spin_lock_irq(&current->sighand->siglock);
^1da177e4c3f415 Linus Torvalds          2005-04-16 @1800  	memcpy(sig->action, current->sighand->action, sizeof(sig->action));
06e62a46bbba20a Jann Horn               2018-08-21  1801  	spin_unlock_irq(&current->sighand->siglock);
b612e5df4587c93 Christian Brauner       2019-10-14  1802  
b612e5df4587c93 Christian Brauner       2019-10-14  1803  	/* Reset all signal handler not set to SIG_IGN to SIG_DFL. */
b612e5df4587c93 Christian Brauner       2019-10-14  1804  	if (clone_flags & CLONE_CLEAR_SIGHAND)
b612e5df4587c93 Christian Brauner       2019-10-14  1805  		flush_signal_handlers(tsk, 0);
b612e5df4587c93 Christian Brauner       2019-10-14  1806  
^1da177e4c3f415 Linus Torvalds          2005-04-16  1807  	return 0;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1808  }
^1da177e4c3f415 Linus Torvalds          2005-04-16  1809  
a7e5328a06a2bee Oleg Nesterov           2006-03-28  1810  void __cleanup_sighand(struct sighand_struct *sighand)
c81addc9d3a0ebf Oleg Nesterov           2006-03-28  1811  {
d036bda7d0e7269 Elena Reshetova         2019-01-18  1812  	if (refcount_dec_and_test(&sighand->count)) {
d80e731ecab420d Oleg Nesterov           2012-02-24  1813  		signalfd_cleanup(sighand);
392809b25833548 Oleg Nesterov           2014-09-28  1814  		/*
5f0d5a3ae7cff0d Paul E. McKenney        2017-01-18  1815  		 * sighand_cachep is SLAB_TYPESAFE_BY_RCU so we can free it
392809b25833548 Oleg Nesterov           2014-09-28  1816  		 * without an RCU grace period, see __lock_task_sighand().
392809b25833548 Oleg Nesterov           2014-09-28  1817  		 */
c81addc9d3a0ebf Oleg Nesterov           2006-03-28  1818  		kmem_cache_free(sighand_cachep, sighand);
c81addc9d3a0ebf Oleg Nesterov           2006-03-28  1819  	}
d80e731ecab420d Oleg Nesterov           2012-02-24  1820  }
c81addc9d3a0ebf Oleg Nesterov           2006-03-28  1821  
f06febc96ba8e0a Frank Mayhar            2008-09-12  1822  /*
f06febc96ba8e0a Frank Mayhar            2008-09-12  1823   * Initialize POSIX timer handling for a thread group.
f06febc96ba8e0a Frank Mayhar            2008-09-12  1824   */
f06febc96ba8e0a Frank Mayhar            2008-09-12  1825  static void posix_cpu_timers_init_group(struct signal_struct *sig)
f06febc96ba8e0a Frank Mayhar            2008-09-12  1826  {
2b69942f9021bf7 Thomas Gleixner         2019-08-21  1827  	struct posix_cputimers *pct = &sig->posix_cputimers;
78d7d407b62a021 Jiri Slaby              2010-03-05  1828  	unsigned long cpu_limit;
78d7d407b62a021 Jiri Slaby              2010-03-05  1829  
316c1608d15c736 Jason Low               2015-04-28  1830  	cpu_limit = READ_ONCE(sig->rlim[RLIMIT_CPU].rlim_cur);
3a245c0f110e2bf Thomas Gleixner         2019-08-21  1831  	posix_cputimers_group_init(pct, cpu_limit);
6279a751fe096a2 Oleg Nesterov           2009-03-27  1832  }
6279a751fe096a2 Oleg Nesterov           2009-03-27  1833  
a39bc51691a0c88 Alexey Dobriyan         2007-10-18  1834  static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
^1da177e4c3f415 Linus Torvalds          2005-04-16  1835  {
^1da177e4c3f415 Linus Torvalds          2005-04-16  1836  	struct signal_struct *sig;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1837  
4ab6c08336535f8 Oleg Nesterov           2009-08-26  1838  	if (clone_flags & CLONE_THREAD)
490dea45d00f018 Peter Zijlstra          2008-11-24  1839  		return 0;
490dea45d00f018 Peter Zijlstra          2008-11-24  1840  
a56704ef6b0c579 Veaceslav Falico        2010-03-10  1841  	sig = kmem_cache_zalloc(signal_cachep, GFP_KERNEL);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1842  	tsk->signal = sig;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1843  	if (!sig)
^1da177e4c3f415 Linus Torvalds          2005-04-16  1844  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1845  
b3ac022cb9dc588 Oleg Nesterov           2010-05-26  1846  	sig->nr_threads = 1;
d80f7d7b2c75c59 Eric W. Biederman       2022-06-21  1847  	sig->quick_threads = 1;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1848  	atomic_set(&sig->live, 1);
60d4de3ff7f7755 Elena Reshetova         2019-01-18  1849  	refcount_set(&sig->sigcnt, 1);
0c740d0afc3bff0 Oleg Nesterov           2014-01-21  1850  
0c740d0afc3bff0 Oleg Nesterov           2014-01-21  1851  	/* list_add(thread_node, thread_head) without INIT_LIST_HEAD() */
0c740d0afc3bff0 Oleg Nesterov           2014-01-21  1852  	sig->thread_head = (struct list_head)LIST_HEAD_INIT(tsk->thread_node);
0c740d0afc3bff0 Oleg Nesterov           2014-01-21  1853  	tsk->thread_node = (struct list_head)LIST_HEAD_INIT(sig->thread_head);
0c740d0afc3bff0 Oleg Nesterov           2014-01-21  1854  
^1da177e4c3f415 Linus Torvalds          2005-04-16  1855  	init_waitqueue_head(&sig->wait_chldexit);
db51aeccd7097ce Oleg Nesterov           2008-04-30  1856  	sig->curr_target = tsk;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1857  	init_sigpending(&sig->shared_pending);
c3ad2c3b02e953e Eric W. Biederman       2018-07-23  1858  	INIT_HLIST_HEAD(&sig->multiprocess);
e78c3496790ee8a Rik van Riel            2014-08-16  1859  	seqlock_init(&sig->stats_lock);
9d7fb04276481c5 Peter Zijlstra          2015-06-30  1860  	prev_cputime_init(&sig->prev_cputime);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1861  
baa73d9e478ff32 Nicolas Pitre           2016-11-11  1862  #ifdef CONFIG_POSIX_TIMERS
52dea0a15cc888e Thomas Gleixner         2024-06-10  1863  	INIT_HLIST_HEAD(&sig->posix_timers);
c9cb2e3d7c9178a Thomas Gleixner         2007-02-16  1864  	hrtimer_init(&sig->real_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1865  	sig->real_timer.function = it_real_fn;
baa73d9e478ff32 Nicolas Pitre           2016-11-11  1866  #endif
^1da177e4c3f415 Linus Torvalds          2005-04-16  1867  
^1da177e4c3f415 Linus Torvalds          2005-04-16  1868  	task_lock(current->group_leader);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1869  	memcpy(sig->rlim, current->signal->rlim, sizeof sig->rlim);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1870  	task_unlock(current->group_leader);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1871  
6279a751fe096a2 Oleg Nesterov           2009-03-27  1872  	posix_cpu_timers_init_group(sig);
6279a751fe096a2 Oleg Nesterov           2009-03-27  1873  
522ed7767e800cf Miloslav Trmac          2007-07-15  1874  	tty_audit_fork(sig);
5091faa449ee0b7 Mike Galbraith          2010-11-30  1875  	sched_autogroup_fork(sig);
522ed7767e800cf Miloslav Trmac          2007-07-15  1876  
a63d83f427fbce9 David Rientjes          2010-08-09  1877  	sig->oom_score_adj = current->signal->oom_score_adj;
dabb16f63982026 Mandeep Singh Baines    2011-01-13  1878  	sig->oom_score_adj_min = current->signal->oom_score_adj_min;
28b83c5193e7ab9 KOSAKI Motohiro         2009-09-21  1879  
9b1bf12d5d51bca KOSAKI Motohiro         2010-10-27  1880  	mutex_init(&sig->cred_guard_mutex);
f7cfd871ae0c500 Eric W. Biederman       2020-12-03  1881  	init_rwsem(&sig->exec_update_lock);
9b1bf12d5d51bca KOSAKI Motohiro         2010-10-27  1882  
^1da177e4c3f415 Linus Torvalds          2005-04-16  1883  	return 0;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1884  }
^1da177e4c3f415 Linus Torvalds          2005-04-16  1885  
dbd952127d11bb4 Kees Cook               2014-06-27  1886  static void copy_seccomp(struct task_struct *p)
dbd952127d11bb4 Kees Cook               2014-06-27  1887  {
dbd952127d11bb4 Kees Cook               2014-06-27  1888  #ifdef CONFIG_SECCOMP
dbd952127d11bb4 Kees Cook               2014-06-27  1889  	/*
dbd952127d11bb4 Kees Cook               2014-06-27  1890  	 * Must be called with sighand->lock held, which is common to
dbd952127d11bb4 Kees Cook               2014-06-27  1891  	 * all threads in the group. Holding cred_guard_mutex is not
dbd952127d11bb4 Kees Cook               2014-06-27  1892  	 * needed because this new task is not yet running and cannot
dbd952127d11bb4 Kees Cook               2014-06-27  1893  	 * be racing exec.
dbd952127d11bb4 Kees Cook               2014-06-27  1894  	 */
69f6a34bdeea4fe Guenter Roeck           2014-08-10 @1895  	assert_spin_locked(&current->sighand->siglock);
dbd952127d11bb4 Kees Cook               2014-06-27  1896  
dbd952127d11bb4 Kees Cook               2014-06-27  1897  	/* Ref-count the new filter user, and assign it. */
dbd952127d11bb4 Kees Cook               2014-06-27  1898  	get_seccomp_filter(current);
dbd952127d11bb4 Kees Cook               2014-06-27  1899  	p->seccomp = current->seccomp;
dbd952127d11bb4 Kees Cook               2014-06-27  1900  
dbd952127d11bb4 Kees Cook               2014-06-27  1901  	/*
dbd952127d11bb4 Kees Cook               2014-06-27  1902  	 * Explicitly enable no_new_privs here in case it got set
dbd952127d11bb4 Kees Cook               2014-06-27  1903  	 * between the task_struct being duplicated and holding the
dbd952127d11bb4 Kees Cook               2014-06-27  1904  	 * sighand lock. The seccomp state and nnp must be in sync.
dbd952127d11bb4 Kees Cook               2014-06-27  1905  	 */
dbd952127d11bb4 Kees Cook               2014-06-27  1906  	if (task_no_new_privs(current))
dbd952127d11bb4 Kees Cook               2014-06-27  1907  		task_set_no_new_privs(p);
dbd952127d11bb4 Kees Cook               2014-06-27  1908  
dbd952127d11bb4 Kees Cook               2014-06-27  1909  	/*
dbd952127d11bb4 Kees Cook               2014-06-27  1910  	 * If the parent gained a seccomp mode after copying thread
dbd952127d11bb4 Kees Cook               2014-06-27  1911  	 * flags and between before we held the sighand lock, we have
dbd952127d11bb4 Kees Cook               2014-06-27  1912  	 * to manually enable the seccomp thread flag here.
dbd952127d11bb4 Kees Cook               2014-06-27  1913  	 */
dbd952127d11bb4 Kees Cook               2014-06-27  1914  	if (p->seccomp.mode != SECCOMP_MODE_DISABLED)
23d67a54857a768 Gabriel Krisman Bertazi 2020-11-16  1915  		set_task_syscall_work(p, SECCOMP);
dbd952127d11bb4 Kees Cook               2014-06-27  1916  #endif
dbd952127d11bb4 Kees Cook               2014-06-27  1917  }
dbd952127d11bb4 Kees Cook               2014-06-27  1918  

:::::: The code at line 1895 was first introduced by commit
:::::: 69f6a34bdeea4fec50bb90619bc9602973119572 seccomp: Replace BUG(!spin_is_locked()) with assert_spin_lock

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
