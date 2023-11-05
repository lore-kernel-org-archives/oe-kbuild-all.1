Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956410F7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blgjZQDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699153506; x=1730689506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c84yJGMjJQgchBFqgTKGXbObfXTTOhHS+RAWR1SjbJA=;
  b=blgjZQDhiSgIjmlM89FEkHpSVQ7yqs2CC/y8cdRdUMdaJ4hpxc7AKQyh
   h4jjitKEXrm0ro8ak/MaSTiJYhAkajTCEMf8aAIAcK6Rm1Ojg6DVPsweC
   kUMBOYYlsNB6aryORtoGtvmljXyvh1oONntTMEFP7xIzlwH8ZsOjrbupo
   vzMC374gdrKI36EcpZOTb4drhC/yOn1kQ5AxBo5TMQktsDKTpoNoDHZXB
   LMd2VuJaedfCOmp438ii7s4C4VvhrqwXiMkCFVp4YDqHmw/iY9H8qxwIc
   0xZ5T1xTDt+HdOTvBC5W9zdqyVii6acy50CmDMVh27SWbdPwCQ/Nd31BU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="386297471"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="386297471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 20:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="3118236"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2023 20:05:02 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzTRc-0004xE-0q;
	Sun, 05 Nov 2023 03:05:00 +0000
Date: Sun, 5 Nov 2023 11:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/cleanup 2/2] kernel/ptrace.c:391:30: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202311051145.dFVy3o6V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/cleanup
head:   3a67a41fc0d5b43e0e3ea44aa929e9046def73ef
commit: 3a67a41fc0d5b43e0e3ea44aa929e9046def73ef [2/2] ptrace: Convert ptrace_attach() to use lock guards
config: x86_64-randconfig-121-20231103 (https://download.01.org/0day-ci/archive/20231105/202311051145.dFVy3o6V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051145.dFVy3o6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051145.dFVy3o6V-lkp@intel.com/

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
   kernel/ptrace.c:171:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:171:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:171:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:203:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:203:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:203:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:209:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:209:30: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:209:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:262:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:262:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:262:44: sparse:    struct task_struct *
   kernel/ptrace.c:508:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/ptrace.c:508:54: sparse:     expected struct task_struct *parent
   kernel/ptrace.c:508:54: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:516:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:516:53: sparse:     expected struct task_struct *new_parent
   kernel/ptrace.c:516:53: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:564:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:564:41: sparse:     expected struct task_struct *p1
   kernel/ptrace.c:564:41: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:566:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sigh @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/ptrace.c:566:50: sparse:     expected struct sighand_struct *sigh
   kernel/ptrace.c:566:50: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/ptrace.c:757:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:757:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:757:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:765:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:765:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:765:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:876:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:876:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:876:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:880:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:880:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:880:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1110:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1110:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1110:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1112:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1112:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1112:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/ptrace.c:391:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:391:30: sparse:     expected struct spinlock [usertype] *l
   kernel/ptrace.c:391:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:464:17: sparse: sparse: context imbalance in 'ptrace_attach' - different lock contexts for basic block
   kernel/ptrace.c:514:38: sparse: sparse: dereference of noderef expression
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:704:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:720:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   kernel/ptrace.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   kernel/ptrace.c:1269:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +391 kernel/ptrace.c

   388	
   389	static inline void ptrace_set_stopped(struct task_struct *task)
   390	{
 > 391		guard(spinlock)(&task->sighand->siglock);
   392	
   393		/*
   394		 * If the task is already STOPPED, set JOBCTL_TRAP_STOP and
   395		 * TRAPPING, and kick it so that it transits to TRACED.  TRAPPING
   396		 * will be cleared if the child completes the transition or any
   397		 * event which clears the group stop states happens.  We'll wait
   398		 * for the transition to complete before returning from this
   399		 * function.
   400		 *
   401		 * This hides STOPPED -> RUNNING -> TRACED transition from the
   402		 * attaching thread but a different thread in the same group can
   403		 * still observe the transient RUNNING state.  IOW, if another
   404		 * thread's WNOHANG wait(2) on the stopped tracee races against
   405		 * ATTACH, the wait(2) may fail due to the transient RUNNING.
   406		 *
   407		 * The following task_is_stopped() test is safe as both transitions
   408		 * in and out of STOPPED are protected by siglock.
   409		 */
   410		if (task_is_stopped(task) &&
   411		    task_set_jobctl_pending(task, JOBCTL_TRAP_STOP | JOBCTL_TRAPPING)) {
   412			task->jobctl &= ~JOBCTL_STOPPED;
   413			signal_wake_up_state(task, __TASK_STOPPED);
   414		}
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
