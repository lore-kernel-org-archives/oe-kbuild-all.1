Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FD165F0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724075149; cv=none; b=l7jKEnCu0jnYYPl+KfKJEJpCmZNlVMsSMNyHBelNdCJyexi/qA2wNIQZSBm1JkQ4XF0dmJ+omYlmpC1ysPiLjMqFNWSwEQsppaaLDUclrhqts5JGJnBYGiumevhSlAwUnnqMPefZq+gF6rTKzKmWtbo0tElVKAwYVWCk23Y/yDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724075149; c=relaxed/simple;
	bh=VEfU5llH7kwXXPOQv/+COgSli9mKuPnkdkVgkX/qrN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNZETKQUPUTzeVP9h6hOytiPIT9DtSPtDBTqOYc0XsOLRxmComY+IMgsG1EdL1Faxy3fYQD87sN1EThOc1vuYQR1ANR52/lxOpJeS7PEmNzp+wmA4Tu2xEUhwCEWqyFQNSnNh45/5fJXlh9tLTkQV6EuRuN5G+fjPA3oK6qPPzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtzT4X6s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtzT4X6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724075147; x=1755611147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VEfU5llH7kwXXPOQv/+COgSli9mKuPnkdkVgkX/qrN4=;
  b=JtzT4X6sgnUIAfJ1Xcmgo+YHHrGUSCAQugR7lCjQjj1Nf1Ba7zkwfQlq
   WoUmovIh6f6NKOsMcApCVDzpI+TlX6ms71EV0E0JfaRQwAJI59gq/1AMF
   Bcs+vRmyKK6oogLBBfG6AjM9Hx72FGyXrtFUnK0gihTJnzl1H9aJFHJHL
   rPgV+NFhh3MT0zDwbyfm+0WWhnjT+wvrgTPQsg9zyQ9M5xLNNCDshZIcI
   Hq2Wgh0d72p5OYcn31q37IbB3i9CkcczWYxztbQ4zn8Gg3WBiuCWpC4+y
   C4lPMryAbKyrjAcxD5803EQIaSjukK91P92Bsrr3UeftcpXgk/3wqnITP
   Q==;
X-CSE-ConnectionGUID: IOp1tunxSFGhSbMZlV2HPw==
X-CSE-MsgGUID: O7Frc60rSnagLIwdmpRcPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="25225201"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="25225201"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 06:45:46 -0700
X-CSE-ConnectionGUID: trN9Ps3sSCm6mlLyefksTg==
X-CSE-MsgGUID: LFV2XfwrRCekwJDQASdYQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="64540737"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2024 06:45:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg2hZ-00091Q-2M;
	Mon, 19 Aug 2024 13:45:41 +0000
Date: Mon, 19 Aug 2024 21:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t
 of qspinlock
Message-ID: <202408192140.4ledWtAa-lkp@intel.com>
References: <20240818063538.6651-10-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-10-alexghiti@rivosinc.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on robh/for-next linus/master v6.11-rc4 next-20240819]
[cannot apply to tip/locking/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Move-cpufeature-h-macros-into-their-own-header/20240818-145004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240818063538.6651-10-alexghiti%40rivosinc.com
patch subject: [PATCH v5 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
config: riscv-randconfig-r132-20240819 (https://download.01.org/0day-ci/archive/20240819/202408192140.4ledWtAa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce: (https://download.01.org/0day-ci/archive/20240819/202408192140.4ledWtAa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408192140.4ledWtAa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zabha'
   kernel/fork.c:1791:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1791:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1791:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1800:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1800:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1800:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1801:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1801:9: sparse:     expected void const *
   kernel/fork.c:1801:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1801:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1801:9: sparse:     expected void const *
   kernel/fork.c:1801:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1801:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1801:9: sparse:     expected void const *
   kernel/fork.c:1801:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1802:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1802:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1802:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1896:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/fork.c:1896:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/fork.c:1896:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/fork.c:2194:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2194:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2194:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2198:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2198:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2198:33: sparse:     got struct spinlock [noderef] __rcu *
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
   kernel/fork.c:2638:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2638:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2638:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2667:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2667:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2667:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2669:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2669:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2669:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3112:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3112:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3112:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3200:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3200:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3200:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:2244:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/ftrace.h, include/linux/perf_event.h, include/linux/trace_events.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2567:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2568:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   WARNING: invalid argument to '-march': '_zabha'
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
   kernel/seccomp.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/seccomp.c:439:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:439:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:439:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:453:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:453:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:453:9: sparse:     got struct qspinlock [noderef] __rcu *
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/seccomp.c:439:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:439:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:439:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:453:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:453:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:453:9: sparse:     got struct qspinlock [noderef] __rcu *

vim +1896 kernel/fork.c

a016f3389c0660 JANAK DESAI             2006-02-07  1785  
a39bc51691a0c8 Alexey Dobriyan         2007-10-18  1786  static int copy_sighand(unsigned long clone_flags, struct task_struct *tsk)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1787  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  1788  	struct sighand_struct *sig;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1789  
60348802e9cb13 Zhaolei                 2009-01-06  1790  	if (clone_flags & CLONE_SIGHAND) {
d036bda7d0e726 Elena Reshetova         2019-01-18  1791  		refcount_inc(&current->sighand->count);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1792  		return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1793  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1794  	sig = kmem_cache_alloc(sighand_cachep, GFP_KERNEL);
0c282b068eb26d Madhuparna Bhowmik      2020-01-27  1795  	RCU_INIT_POINTER(tsk->sighand, sig);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1796  	if (!sig)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1797  		return -ENOMEM;
9d7fb04276481c Peter Zijlstra          2015-06-30  1798  
d036bda7d0e726 Elena Reshetova         2019-01-18  1799  	refcount_set(&sig->count, 1);
06e62a46bbba20 Jann Horn               2018-08-21  1800  	spin_lock_irq(&current->sighand->siglock);
^1da177e4c3f41 Linus Torvalds          2005-04-16 @1801  	memcpy(sig->action, current->sighand->action, sizeof(sig->action));
06e62a46bbba20 Jann Horn               2018-08-21  1802  	spin_unlock_irq(&current->sighand->siglock);
b612e5df4587c9 Christian Brauner       2019-10-14  1803  
b612e5df4587c9 Christian Brauner       2019-10-14  1804  	/* Reset all signal handler not set to SIG_IGN to SIG_DFL. */
b612e5df4587c9 Christian Brauner       2019-10-14  1805  	if (clone_flags & CLONE_CLEAR_SIGHAND)
b612e5df4587c9 Christian Brauner       2019-10-14  1806  		flush_signal_handlers(tsk, 0);
b612e5df4587c9 Christian Brauner       2019-10-14  1807  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1808  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1809  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1810  
a7e5328a06a2be Oleg Nesterov           2006-03-28  1811  void __cleanup_sighand(struct sighand_struct *sighand)
c81addc9d3a0eb Oleg Nesterov           2006-03-28  1812  {
d036bda7d0e726 Elena Reshetova         2019-01-18  1813  	if (refcount_dec_and_test(&sighand->count)) {
d80e731ecab420 Oleg Nesterov           2012-02-24  1814  		signalfd_cleanup(sighand);
392809b2583354 Oleg Nesterov           2014-09-28  1815  		/*
5f0d5a3ae7cff0 Paul E. McKenney        2017-01-18  1816  		 * sighand_cachep is SLAB_TYPESAFE_BY_RCU so we can free it
392809b2583354 Oleg Nesterov           2014-09-28  1817  		 * without an RCU grace period, see __lock_task_sighand().
392809b2583354 Oleg Nesterov           2014-09-28  1818  		 */
c81addc9d3a0eb Oleg Nesterov           2006-03-28  1819  		kmem_cache_free(sighand_cachep, sighand);
c81addc9d3a0eb Oleg Nesterov           2006-03-28  1820  	}
d80e731ecab420 Oleg Nesterov           2012-02-24  1821  }
c81addc9d3a0eb Oleg Nesterov           2006-03-28  1822  
f06febc96ba8e0 Frank Mayhar            2008-09-12  1823  /*
f06febc96ba8e0 Frank Mayhar            2008-09-12  1824   * Initialize POSIX timer handling for a thread group.
f06febc96ba8e0 Frank Mayhar            2008-09-12  1825   */
f06febc96ba8e0 Frank Mayhar            2008-09-12  1826  static void posix_cpu_timers_init_group(struct signal_struct *sig)
f06febc96ba8e0 Frank Mayhar            2008-09-12  1827  {
2b69942f9021bf Thomas Gleixner         2019-08-21  1828  	struct posix_cputimers *pct = &sig->posix_cputimers;
78d7d407b62a02 Jiri Slaby              2010-03-05  1829  	unsigned long cpu_limit;
78d7d407b62a02 Jiri Slaby              2010-03-05  1830  
316c1608d15c73 Jason Low               2015-04-28  1831  	cpu_limit = READ_ONCE(sig->rlim[RLIMIT_CPU].rlim_cur);
3a245c0f110e2b Thomas Gleixner         2019-08-21  1832  	posix_cputimers_group_init(pct, cpu_limit);
6279a751fe096a Oleg Nesterov           2009-03-27  1833  }
6279a751fe096a Oleg Nesterov           2009-03-27  1834  
a39bc51691a0c8 Alexey Dobriyan         2007-10-18  1835  static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1836  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  1837  	struct signal_struct *sig;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1838  
4ab6c08336535f Oleg Nesterov           2009-08-26  1839  	if (clone_flags & CLONE_THREAD)
490dea45d00f01 Peter Zijlstra          2008-11-24  1840  		return 0;
490dea45d00f01 Peter Zijlstra          2008-11-24  1841  
a56704ef6b0c57 Veaceslav Falico        2010-03-10  1842  	sig = kmem_cache_zalloc(signal_cachep, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1843  	tsk->signal = sig;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1844  	if (!sig)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1845  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1846  
b3ac022cb9dc58 Oleg Nesterov           2010-05-26  1847  	sig->nr_threads = 1;
d80f7d7b2c75c5 Eric W. Biederman       2022-06-21  1848  	sig->quick_threads = 1;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1849  	atomic_set(&sig->live, 1);
60d4de3ff7f775 Elena Reshetova         2019-01-18  1850  	refcount_set(&sig->sigcnt, 1);
0c740d0afc3bff Oleg Nesterov           2014-01-21  1851  
0c740d0afc3bff Oleg Nesterov           2014-01-21  1852  	/* list_add(thread_node, thread_head) without INIT_LIST_HEAD() */
0c740d0afc3bff Oleg Nesterov           2014-01-21  1853  	sig->thread_head = (struct list_head)LIST_HEAD_INIT(tsk->thread_node);
0c740d0afc3bff Oleg Nesterov           2014-01-21  1854  	tsk->thread_node = (struct list_head)LIST_HEAD_INIT(sig->thread_head);
0c740d0afc3bff Oleg Nesterov           2014-01-21  1855  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1856  	init_waitqueue_head(&sig->wait_chldexit);
db51aeccd7097c Oleg Nesterov           2008-04-30  1857  	sig->curr_target = tsk;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1858  	init_sigpending(&sig->shared_pending);
c3ad2c3b02e953 Eric W. Biederman       2018-07-23  1859  	INIT_HLIST_HEAD(&sig->multiprocess);
e78c3496790ee8 Rik van Riel            2014-08-16  1860  	seqlock_init(&sig->stats_lock);
9d7fb04276481c Peter Zijlstra          2015-06-30  1861  	prev_cputime_init(&sig->prev_cputime);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1862  
baa73d9e478ff3 Nicolas Pitre           2016-11-11  1863  #ifdef CONFIG_POSIX_TIMERS
b18b6a9cef7f30 Nicolas Pitre           2017-01-21  1864  	INIT_LIST_HEAD(&sig->posix_timers);
c9cb2e3d7c9178 Thomas Gleixner         2007-02-16  1865  	hrtimer_init(&sig->real_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1866  	sig->real_timer.function = it_real_fn;
baa73d9e478ff3 Nicolas Pitre           2016-11-11  1867  #endif
^1da177e4c3f41 Linus Torvalds          2005-04-16  1868  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1869  	task_lock(current->group_leader);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1870  	memcpy(sig->rlim, current->signal->rlim, sizeof sig->rlim);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1871  	task_unlock(current->group_leader);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1872  
6279a751fe096a Oleg Nesterov           2009-03-27  1873  	posix_cpu_timers_init_group(sig);
6279a751fe096a Oleg Nesterov           2009-03-27  1874  
522ed7767e800c Miloslav Trmac          2007-07-15  1875  	tty_audit_fork(sig);
5091faa449ee0b Mike Galbraith          2010-11-30  1876  	sched_autogroup_fork(sig);
522ed7767e800c Miloslav Trmac          2007-07-15  1877  
a63d83f427fbce David Rientjes          2010-08-09  1878  	sig->oom_score_adj = current->signal->oom_score_adj;
dabb16f6398202 Mandeep Singh Baines    2011-01-13  1879  	sig->oom_score_adj_min = current->signal->oom_score_adj_min;
28b83c5193e7ab KOSAKI Motohiro         2009-09-21  1880  
9b1bf12d5d51bc KOSAKI Motohiro         2010-10-27  1881  	mutex_init(&sig->cred_guard_mutex);
f7cfd871ae0c50 Eric W. Biederman       2020-12-03  1882  	init_rwsem(&sig->exec_update_lock);
9b1bf12d5d51bc KOSAKI Motohiro         2010-10-27  1883  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1884  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1885  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1886  
dbd952127d11bb Kees Cook               2014-06-27  1887  static void copy_seccomp(struct task_struct *p)
dbd952127d11bb Kees Cook               2014-06-27  1888  {
dbd952127d11bb Kees Cook               2014-06-27  1889  #ifdef CONFIG_SECCOMP
dbd952127d11bb Kees Cook               2014-06-27  1890  	/*
dbd952127d11bb Kees Cook               2014-06-27  1891  	 * Must be called with sighand->lock held, which is common to
dbd952127d11bb Kees Cook               2014-06-27  1892  	 * all threads in the group. Holding cred_guard_mutex is not
dbd952127d11bb Kees Cook               2014-06-27  1893  	 * needed because this new task is not yet running and cannot
dbd952127d11bb Kees Cook               2014-06-27  1894  	 * be racing exec.
dbd952127d11bb Kees Cook               2014-06-27  1895  	 */
69f6a34bdeea4f Guenter Roeck           2014-08-10 @1896  	assert_spin_locked(&current->sighand->siglock);
dbd952127d11bb Kees Cook               2014-06-27  1897  
dbd952127d11bb Kees Cook               2014-06-27  1898  	/* Ref-count the new filter user, and assign it. */
dbd952127d11bb Kees Cook               2014-06-27  1899  	get_seccomp_filter(current);
dbd952127d11bb Kees Cook               2014-06-27  1900  	p->seccomp = current->seccomp;
dbd952127d11bb Kees Cook               2014-06-27  1901  
dbd952127d11bb Kees Cook               2014-06-27  1902  	/*
dbd952127d11bb Kees Cook               2014-06-27  1903  	 * Explicitly enable no_new_privs here in case it got set
dbd952127d11bb Kees Cook               2014-06-27  1904  	 * between the task_struct being duplicated and holding the
dbd952127d11bb Kees Cook               2014-06-27  1905  	 * sighand lock. The seccomp state and nnp must be in sync.
dbd952127d11bb Kees Cook               2014-06-27  1906  	 */
dbd952127d11bb Kees Cook               2014-06-27  1907  	if (task_no_new_privs(current))
dbd952127d11bb Kees Cook               2014-06-27  1908  		task_set_no_new_privs(p);
dbd952127d11bb Kees Cook               2014-06-27  1909  
dbd952127d11bb Kees Cook               2014-06-27  1910  	/*
dbd952127d11bb Kees Cook               2014-06-27  1911  	 * If the parent gained a seccomp mode after copying thread
dbd952127d11bb Kees Cook               2014-06-27  1912  	 * flags and between before we held the sighand lock, we have
dbd952127d11bb Kees Cook               2014-06-27  1913  	 * to manually enable the seccomp thread flag here.
dbd952127d11bb Kees Cook               2014-06-27  1914  	 */
dbd952127d11bb Kees Cook               2014-06-27  1915  	if (p->seccomp.mode != SECCOMP_MODE_DISABLED)
23d67a54857a76 Gabriel Krisman Bertazi 2020-11-16  1916  		set_task_syscall_work(p, SECCOMP);
dbd952127d11bb Kees Cook               2014-06-27  1917  #endif
dbd952127d11bb Kees Cook               2014-06-27  1918  }
dbd952127d11bb Kees Cook               2014-06-27  1919  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
