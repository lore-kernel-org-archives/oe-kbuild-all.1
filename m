Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC5238C1B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397858; cv=none; b=rVnTjdklX/ghIgZH+1H5CmVova7CxqrvDZwogVFy4CnidptPhUqWNL3M1AKes2juVh1sbzrBd66GVrYyhfThh6gfCoy6fxpm+eHk5kfc1SSZRTHGwphAhNo/ecZHnim0EezEGJ10s+Gljpy+MV7pl4T/M8QGsxY+qdneqe3k2tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397858; c=relaxed/simple;
	bh=cyUeJUnMtC4CuLsb/yZq5SVWQPmkKGFTVRRdOoJXeZg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P8tMbJgpi/hwQ+oC1wHMdWMGAnclHBCMipzLcGXeW8u30tl8qGLi83lH4y+V/9RqpOj8MP7hYMy/8Sx/2Bb1fcc05lcWM5Riuz4iS0xfZgA1pjqVpBS2C9cRKwCIATdgPXuNfg0MT2H24U20jO294HvA54EMpZ5ZvvNw3H+pfWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8ZwnF4X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8ZwnF4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769397855; x=1800933855;
  h=date:from:to:cc:subject:message-id;
  bh=cyUeJUnMtC4CuLsb/yZq5SVWQPmkKGFTVRRdOoJXeZg=;
  b=H8ZwnF4XxRzxysl7l2+8AZDo/RpjjsGLCDXUdaGRIUfB09n83Ydnp56Y
   vUbLhuTpHq1VXbkBUglhcPo+6sZ+BC65g77d184q4rdZE5mqfdak5pmgG
   BQZ/h+jP7WeuOqjDrBhM6AfOOjxfQ4krjiyuvWF5USvaRLj+9yqB5XHAe
   VSl4wHnEZWR61Uh3suf2EPICzeW01tgUVy6G4FMp8+nWuM6t4/pe4h9sA
   oLXRrU3KVyz9PYJ2yPx7R5bYp2kxFDOuN4DlbwjtGkR1Z1h/Lpe4Q4i7o
   C6Ul1enhpldKL8cQYWJ3uecWc6HlIM2hEkVViseGPhJKHqPFTAnj0/oPx
   Q==;
X-CSE-ConnectionGUID: UTJg8ZONSf6e3C2FQAbujw==
X-CSE-MsgGUID: FmzfQT/vQp2AcbWCc/TPRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96043471"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="96043471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 19:24:14 -0800
X-CSE-ConnectionGUID: Kw1Oj08ZRuGekrsV/QkvJA==
X-CSE-MsgGUID: /x+qAAl/SmyB5Kf5VpdF2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212039854"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2026 19:24:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkDCz-00000000WqO-39fh;
	Mon, 26 Jan 2026 03:24:09 +0000
Date: Mon, 26 Jan 2026 11:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/core 11/43] kernel/ptrace.c:380:9: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202601261147.DICzPW0P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
commit: f16a802d402d735a55731f8c94952b3bbb5ddfe8 [11/43] locking/rwlock, spinlock: Support Clang's context analysis
config: arc-randconfig-r112-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261147.DICzPW0P-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261147.DICzPW0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261147.DICzPW0P-lkp@intel.com/

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
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/ptrace.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:380:9: sparse:     expected struct spinlock [usertype] *_T
   kernel/ptrace.c:380:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:409:12: sparse: sparse: context imbalance in 'ptrace_attach' - different lock contexts for basic block
   kernel/ptrace.c:500:38: sparse: sparse: dereference of noderef expression
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:690:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:706:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1384:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
--
   kernel/signal.c: note: in included file (through include/uapi/asm-generic/signal.h, include/asm-generic/signal.h, arch/arc/include/uapi/asm/signal.h, ...):
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:191:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:191:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:191:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:194:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:194:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:194:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:497:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:497:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:497:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:501:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:501:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:501:34: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:523:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct k_sigaction *ka @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:523:53: sparse:     expected struct k_sigaction *ka
   kernel/signal.c:523:53: sparse:     got struct k_sigaction [noderef] __rcu *
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:624:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:624:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:624:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:723:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:723:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:723:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:754:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:754:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:754:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:855:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:855:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:855:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:1050:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:1050:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:1050:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:1235:9: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1241:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1241:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1241:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1241:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1241:29: sparse: sparse: cannot dereference this type
   kernel/signal.c:1241:29: sparse: sparse: non-scalar type in conditional:
   kernel/signal.c:1241:29: sparse:    void
   kernel/signal.c:1302:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1302:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1302:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1303:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *action @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:1303:16: sparse:     expected struct k_sigaction *action
   kernel/signal.c:1303:16: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/signal.c:1324:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1324:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1324:34: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/signal.c:1927:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1927:9: sparse:     expected struct spinlock [usertype] *_T
   kernel/signal.c:1927:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2192:44: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2211:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2211:65: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2211:65: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2212:40: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2230:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *psig @@     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand @@
   kernel/signal.c:2230:14: sparse:     expected struct sighand_struct *psig
   kernel/signal.c:2230:14: sparse:     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand
   kernel/signal.c:2259:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2259:53: sparse:     expected struct task_struct *t
   kernel/signal.c:2259:53: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2260:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2260:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:2260:34: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2289:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2289:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2289:24: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2292:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/signal.c:2292:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2292:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/signal.c:2325:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2325:17: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2325:17: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2365:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2365:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2365:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2367:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2367:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2367:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2424:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2424:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2424:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2482:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2482:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2482:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2522:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2522:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2522:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2524:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2524:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2524:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2622:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2622:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2622:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2706:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2706:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2706:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2718:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2718:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2718:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2761:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2761:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2761:52: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2763:49: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2801:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2801:49: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2801:49: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:3133:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3133:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3133:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3153:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3153:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3153:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3220:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3220:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3220:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3222:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3222:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3222:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3373:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3373:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3373:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3376:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3376:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3376:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3765:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3765:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3765:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3777:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3777:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3777:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3782:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3782:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3782:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3787:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3787:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3787:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4279:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4279:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4279:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4291:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4291:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4291:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4309:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:4309:11: sparse:     expected struct k_sigaction *k
   kernel/signal.c:4309:11: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/signal.c:4311:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4311:25: sparse:     expected struct spinlock [usertype] *lock
--
   kernel/time/posix-timers.c:345:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:345:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:345:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:352:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:352:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:352:27: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/time/posix-timers.c:554:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:554:17: sparse:     expected struct spinlock [usertype] *_T
   kernel/time/posix-timers.c:554:17: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1042:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1042:9: sparse:     expected struct spinlock [usertype] *_T
   kernel/time/posix-timers.c:1042:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1090:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1090:9: sparse:     expected struct spinlock [usertype] *_T
   kernel/time/posix-timers.c:1090:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:134:13: sparse: sparse: context imbalance in 'posix_timer_add_at' - wrong count at exit
   kernel/time/posix-timers.c:306:13: sparse: sparse: context imbalance in '__posixtimer_deliver_signal' - wrong count at exit
   kernel/time/posix-timers.c:336:6: sparse: sparse: context imbalance in 'posixtimer_deliver_signal' - unexpected unlock
   kernel/time/posix-timers.c:374:29: sparse: sparse: context imbalance in 'posix_timer_fn' - wrong count at exit
   kernel/time/posix-timers.c:449:13: sparse: sparse: context imbalance in 'posix_timer_unhash_and_free' - wrong count at exit
   kernel/time/posix-timers.c:465:12: sparse: sparse: context imbalance in 'do_timer_create' - different lock contexts for basic block
   kernel/time/posix-timers.c:603:24: sparse: sparse: context imbalance in '__lock_timer' - different lock contexts for basic block
   kernel/time/posix-timers.c:1050:9: sparse: sparse: context imbalance in 'posix_timer_delete' - wrong count at exit
   kernel/time/posix-timers.c:1094:9: sparse: sparse: context imbalance in 'exit_itimers' - different lock contexts for basic block

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
