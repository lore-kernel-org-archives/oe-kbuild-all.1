Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109851DE2BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765420473; cv=none; b=ZtDuDAYyarjRwtJ1DfNPPAc2jHrek7U43F81MNatZYF18wp9mamNaH/xbhw0KVkGs+RKusGknIgbnfLyaEzNkrTwjM3Wuxm7RYazfGuDv3LvaJX7ieeavQ3X66sbYqNQnYG+vAtKz0YZaR7AFb5iTp37p9JSvpc5utAmrN3jpAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765420473; c=relaxed/simple;
	bh=Itb1hz97M9lxVLSLIzBRfehU6G/QLRRT6wQl6XEkHQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVtHeiZmGo1XpC0m6uym15WZtN4y5gGHXqd3ZoPBCWAmU2aw0lUSnSqBkgAlVYm9B6llktCI7yCOa76LCwjMf3Km+eVTMVU21CYGtC3AXFc+w714hwno5Ngjk9J8Y7wjnDuBgqOOc+mBJUXNqL3aZT24764fKrgC0tg8BZz8HBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsySNjWT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsySNjWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765420471; x=1796956471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Itb1hz97M9lxVLSLIzBRfehU6G/QLRRT6wQl6XEkHQY=;
  b=AsySNjWTjUx9gIwpUdhEkqbQcuuaAwKKiz1hEkmlQ7FKqfFpdJdOamws
   4zNwOy+1SFsGbWEWHcgXDLH9ZV8HTUM2gFJFOQjoZBIjw1F4YxRQQHNOy
   RMIAI+Ow1majFePRDHkuG8kpMJWnNaMJFIoGvmY+XSLZ23av6P8ZhKpGY
   36OycvOHQbPkS+/xnQbeweAeawZxvpFgmuwmVIH0BqrDctu+gH6hIhC8/
   sldfs+kJi1rPbTeA1GRf+1zffZQU/Oki4TLWWnYFEbfwIvkp+oFIr02vk
   UiJujoXq/A2ivOgUUG+4DCeJMVbffRhSclyyUCRZCp3GPCha9tPzioGO6
   g==;
X-CSE-ConnectionGUID: TH5dc2mtRKSnvRRuuFBkiw==
X-CSE-MsgGUID: Uf+wTfsvRqyQGwgiMioLZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78764758"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78764758"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:34:30 -0800
X-CSE-ConnectionGUID: iHBHo0EDRASAB3v0caINdA==
X-CSE-MsgGUID: YXSta6biSmeYdEpq6jghLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196735926"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 18:34:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWVd-0000000043h-3XCQ;
	Thu, 11 Dec 2025 02:34:25 +0000
Date: Thu, 11 Dec 2025 10:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>
Subject: kernel/signal.c:1889:37: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <202512111003.5hulufeZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: 68f99be287a59d50a9ad231d523f7e578f8bd28a signal: Confine POSIX_TIMERS properly
date:   1 year, 1 month ago
config: i386-randconfig-062-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111003.5hulufeZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111003.5hulufeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111003.5hulufeZ-lkp@intel.com/

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
   kernel/signal.c:1203:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned char * @@
   kernel/signal.c:1203:29: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/signal.c:1203:29: sparse:     got unsigned char *
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
