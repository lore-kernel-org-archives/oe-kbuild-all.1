Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC01B81C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 23:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727480578; cv=none; b=YCIB8Jxd3MWEZOS8rqDigNDOZ28fW6OmsLZg1xr+5dooB3rThJ6mGXB+V+hmdL6pamhTP6B2u8SkVmSQCPEf6VL+7wze2qeHgP5CkYurvUiZz4F5FoCp5tZN401fU9wUdWfDXsMVysmGUqlFDyK0Qtz56lOuMkTmGo3cxLRyH7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727480578; c=relaxed/simple;
	bh=0Cm8y3qfbpgX+YYp87z/CvsG0cfbylodO6duXzI5dhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=obS7JMgBK7Qf6VSBJcHiIbmQ5xETy4qgeY95Iy33XM+eTXRWghQO0eutpZLjiN1Ksz9KHZNVGZhzjbFNwWSP6Ayf3wEXYLXkoivwT3ELNvrgQ2Fpo6hrTiGW9mQwA6JNJYBJDhzDpnxasIawR4/xzlBXUZy5bOjUyWus1R66l/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuJqlaex; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuJqlaex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727480576; x=1759016576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Cm8y3qfbpgX+YYp87z/CvsG0cfbylodO6duXzI5dhc=;
  b=EuJqlaexxcjK7DLAOf2DuF6p+uf/qtUol0g+EB+wl+9LnIAyp/epubff
   3UjJvg8Lx6DFvaKFVbL46Sn94z8NxVpha5qd0o2/1ugkYIvhemowzKMhh
   vaph0DWMhZxNR1WfhKfDUSmSDmxvHrA3/ue0nkLe8UP3Tb/lL0jK1l+KP
   4GPHpjYN8YHTNffVnEq1uCU/BWJyR98wCKCpYUOBsqyyYcG1WpsKY88D4
   c86Na+llTvc2+44oKZ/ZaYjeL5GpQ/e46VnsHTnFj1wa6NP32v/9RWzy6
   Mx5Vd6ePL9CeU9Du3F1kzBOdfPZrxQ5WXzx9qFK+1RYsHKWIUcUPx6Lvn
   w==;
X-CSE-ConnectionGUID: zz8ZpSN9RNq5k7BfX8S+Qw==
X-CSE-MsgGUID: TSOuxgNHQbqP+73j2FXyEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30344644"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30344644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 16:42:53 -0700
X-CSE-ConnectionGUID: ceuEAafOQVe8ngpcGnuBzA==
X-CSE-MsgGUID: utBpLJiBTRqUu6lpSfPWjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72566090"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2024 16:42:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suKbp-000Mjo-0f;
	Fri, 27 Sep 2024 23:42:49 +0000
Date: Sat, 28 Sep 2024 07:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 1/27] kernel/signal.c:1889:37: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202409280715.VhhEBRPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   65fe98111e55a6ac48a8867e429228b04046e88f
commit: eaae35798ca6549d4cb416bb556b1ae8022e73ce [1/27] signal: Confine POSIX_TIMERS properly
config: x86_64-randconfig-121-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280715.VhhEBRPW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280715.VhhEBRPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280715.VhhEBRPW-lkp@intel.com/

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
