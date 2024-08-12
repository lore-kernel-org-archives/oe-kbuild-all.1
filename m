Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAF6193092
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723494343; cv=none; b=j81Ob9qiqoEHrU9w5VX1MLAerAnfjbB841eY78AWg/IvOS8iwuvzDCjNcI9cBgW2rOWTskj1stzOBG+BHYFOcNvU0b1xRrETxTW+9eeg6qeonkV9Yw7jqaJ/N9DlpLB7CqPLMCn5r6XxYe4m69PNUR+DyaCCOwbVtSIBaz9jg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723494343; c=relaxed/simple;
	bh=FPPTwq6lKCMSf+eRoUr1D7SJCkn8K2O2u/a+3UVwQbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWBSCC9azq3yM3mAAIiZppYsYp0Qy9XRlQ9zV2sq/z/g+lbCM9viuWPFKPSeKfGgkQA87XHvJpLsxxMgY992AOUFhbkpfrk+e6GCXBLKecv1VK8kLL0i1w+f1eF3ozmIQ6mLcJGJ4aFJBirU+zloCiaYFlwbiZFH2NHQfovkcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEJ5AvoO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEJ5AvoO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723494340; x=1755030340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FPPTwq6lKCMSf+eRoUr1D7SJCkn8K2O2u/a+3UVwQbk=;
  b=BEJ5AvoOHy2B0/B9FzY3xxM0kgj7TnPNyMUoIhCFDPPKXxuzHi05x/52
   hve+2QevSJkIZQYgkM6O/2iX4As9krr2VShN+UaYS+4rB97XfcP5AJMEc
   2BkFXINQGR7UrFnzsZilVxgvK6Haq8CeN+JjFyITLINUUNxs1JlSNaLCS
   LfVH0vsr0moNWASzvL+VlHktND5darJYQRNQFXl+7SxsKOqat1wjvtsOw
   u9lp/u2La9JPeQ9QSOWnXyccDS04ycyOoI/ncGYHFP57kZPXKffaRS3I4
   0NI0p69SPNAIarTJDpT5mNIeQ+NunKkGXrvWyECbHsOWdbNNK6bqL6Qqm
   A==;
X-CSE-ConnectionGUID: DsyIayOqQZiu6HKlhdDbRQ==
X-CSE-MsgGUID: R80wRRK2TnKsMTthC2VC6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21272560"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="21272560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 13:25:40 -0700
X-CSE-ConnectionGUID: xM6AhuSgSn6EiaqRctOcWg==
X-CSE-MsgGUID: ODzVFjbvT+a6QkzIqonvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="58042350"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2024 13:25:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdbbg-000C9t-2a;
	Mon, 12 Aug 2024 20:25:34 +0000
Date: Tue, 13 Aug 2024 04:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 2/28] kernel/signal.c:1889:37: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202408130444.ETG8RcMa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   1dba27bbf1f09ab0380512d0f5f05398e884efeb
commit: b7294cacdfc054d1805af6c5e32a0104313a2f32 [2/28] signal: Confine POSIX_TIMERS properly
config: x86_64-randconfig-122-20240812 (https://download.01.org/0day-ci/archive/20240813/202408130444.ETG8RcMa-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130444.ETG8RcMa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130444.ETG8RcMa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/signal.c: note: in included file (through arch/x86/include/uapi/asm/signal.h, arch/x86/include/asm/signal.h, include/uapi/linux/signal.h, ...):
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:188:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:188:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:188:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:191:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:191:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:191:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:473:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:473:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:473:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:477:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:477:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:477:34: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:499:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct k_sigaction *ka @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:499:53: sparse:     expected struct k_sigaction *ka
   kernel/signal.c:499:53: sparse:     got struct k_sigaction [noderef] __rcu *
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:595:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:595:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:595:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:692:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:692:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:817:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:817:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:1012:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:1012:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:1012:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:1264:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1264:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1264:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1265:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *action @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:1265:16: sparse:     expected struct k_sigaction *action
   kernel/signal.c:1265:16: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/signal.c:1286:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1286:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1286:34: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/signal.c:1889:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1889:37: sparse:     expected struct spinlock [usertype] *l
   kernel/signal.c:1889:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1901:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1901:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1901:36: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2036:44: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2055:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2055:65: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2055:65: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2056:40: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2074:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *psig @@     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand @@
   kernel/signal.c:2074:14: sparse:     expected struct sighand_struct *psig
   kernel/signal.c:2074:14: sparse:     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand
   kernel/signal.c:2103:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2103:53: sparse:     expected struct task_struct *t
   kernel/signal.c:2103:53: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2104:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2104:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:2104:34: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2133:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2133:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2133:24: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2136:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/signal.c:2136:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2136:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/signal.c:2169:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2169:17: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2169:17: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2209:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2209:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2209:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2211:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2211:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2211:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2268:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2268:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2268:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2326:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2326:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2326:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2366:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2366:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2366:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2368:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2368:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2368:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2466:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2466:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2466:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2550:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2550:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2550:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2562:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2562:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2562:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2605:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2605:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2605:52: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2607:49: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2645:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2645:49: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2645:49: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2978:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2978:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2978:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2999:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2999:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2999:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3066:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3066:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3066:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3068:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3068:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3068:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3219:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3219:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3219:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3222:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3222:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3222:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3611:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3611:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3611:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3623:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3623:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3623:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3628:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3628:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3628:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3633:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3633:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3633:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4109:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4109:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4109:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4121:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4121:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4121:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4139:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:4139:11: sparse:     expected struct k_sigaction *k

vim +1889 kernel/signal.c

  1884	
  1885	void flush_itimer_signals(void)
  1886	{
  1887		struct task_struct *tsk = current;
  1888	
> 1889		guard(spinlock_irqsave)(&tsk->sighand->siglock);
  1890		__flush_itimer_signals(&tsk->pending);
  1891		__flush_itimer_signals(&tsk->signal->shared_pending);
  1892	}
  1893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
