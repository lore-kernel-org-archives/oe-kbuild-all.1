Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BBF378D98
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292443; cv=none; b=WfQD0xFFYW08LPaG2dkaP/q4xwRDbImsz8HmWNb5gFxq2hOzmvRYX2Y88JFA28B4SZbr2pH71XRyzao5z3wt4/thMPDUiUzlDoB+NKdqyEuqOTQYV5j26DVS0rrwQVDhBejhtHhRxPljWLOyNP88AtDcBTPByPEfVJvRkdjGIvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292443; c=relaxed/simple;
	bh=hIUxI92gF+lGLy7tXrDE7UHx5jS9o4ZFtdXVXGKSfsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZvAETgYASLyWiQ4sOmcoFI76jCTxdYy2ygMlkrkC/sdfNSchSQwl7V5AqWu2ut36fyVgBPsEtxf3jnneFI8oSGhT4cmTp2yg9+X3XW6pbKZP/VYM6XgCFAA9NpFE+94UhHnl+FinXP84qNrmjQx67garfVDHHphb6x+tz+5O4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7Mmw7gD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7Mmw7gD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292442; x=1799828442;
  h=date:from:to:cc:subject:message-id;
  bh=hIUxI92gF+lGLy7tXrDE7UHx5jS9o4ZFtdXVXGKSfsQ=;
  b=n7Mmw7gDtnqxFtk72mMNvQIbvob7N6caT7c6FUfgIrNfbvs1DjmBtz9o
   mTWSl/0E7kqYTJdqwOzvthhjpx9KyPg3u3Fd0TgbEoQumwJjmmi6ga21t
   CF3GDH0VU8hIqor17F2TgOh32hJlZBcwQ+Tw3HMV5nYGTsnI7nFR0CrPM
   LYkS+p5ZraM3futzisU5QaeYrZ6O1J73kizlEjVv0Eopw+xe+nyDABMPw
   wlXGPb4tiMzVCOlYZRHgxueBbE5myYPr+1zw4CddZs9fqHHCT4nZfQ4Kd
   9UwQnyEL92LWu1w3gCwCkpAxhDFwobY3goLljIKx3iEK9vD3/2/TWBK84
   g==;
X-CSE-ConnectionGUID: qtg1JiS4TsWnIqXG4CCG0Q==
X-CSE-MsgGUID: 1zJ2wE1zQWaSvDkZ1eK9Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80938905"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80938905"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:20:40 -0800
X-CSE-ConnectionGUID: 9SQmt/AhSn29kjtuUhAs1Q==
X-CSE-MsgGUID: 3Fy3ObWNRce54t9HGDnH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203959279"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 00:20:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfZdi-00000000ERW-3k5v;
	Tue, 13 Jan 2026 08:20:34 +0000
Date: Tue, 13 Jan 2026 16:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/ftrace.c:3537:67: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202601131659.v7wM186x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 04a80a34c22f4db245f553d8696d1318d1c00ece ftrace: Properly merge notrace hashes
date:   9 months ago
config: arm64-randconfig-r123-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131659.v7wM186x-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131659.v7wM186x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131659.v7wM186x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:1522:42: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1693:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1693:18: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:1693:18: sparse:     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:1694:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1694:43: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:1694:43: sparse:     got struct ftrace_ops [noderef] __rcu *next
   kernel/trace/ftrace.c:1755:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1755:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1755:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1756:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1756:22: sparse:     expected struct ftrace_hash *notrace_hash
   kernel/trace/ftrace.c:1756:22: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:2076:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2076:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2076:50: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:2087:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2087:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2087:50: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:2570:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:2570:53: sparse:     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:2570:53: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:2581:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:2581:36: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:2581:36: sparse:     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:3312:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3312:63: sparse:     expected struct ftrace_hash *new_hash
   kernel/trace/ftrace.c:3312:63: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3338:88: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3338:88: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3338:88: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3346:77: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3346:77: sparse:     expected struct ftrace_hash *new_hash2
   kernel/trace/ftrace.c:3346:77: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3413:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3413:51: sparse:     expected struct ftrace_hash *B
   kernel/trace/ftrace.c:3413:51: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3414:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3414:66: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:3414:66: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:3420:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3420:52: sparse:     expected struct ftrace_hash *B
   kernel/trace/ftrace.c:3420:52: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3421:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3421:66: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:3421:66: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:3460:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3460:45: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3460:45: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3462:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3462:46: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3462:46: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3464:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3464:48: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3464:48: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3466:49: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3466:49: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3466:49: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3471:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3471:58: sparse:     expected struct ftrace_hash *src
   kernel/trace/ftrace.c:3471:58: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3472:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3472:59: sparse:     expected struct ftrace_hash *src
   kernel/trace/ftrace.c:3472:59: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3479:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_filter_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3479:34: sparse:     expected struct ftrace_hash *save_filter_hash
   kernel/trace/ftrace.c:3479:34: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3480:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3480:35: sparse:     expected struct ftrace_hash *save_notrace_hash
   kernel/trace/ftrace.c:3480:35: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3482:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] filter_hash @@
   kernel/trace/ftrace.c:3482:45: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3482:45: sparse:     got struct ftrace_hash *[assigned] filter_hash
   kernel/trace/ftrace.c:3483:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *[assigned] notrace_hash @@
   kernel/trace/ftrace.c:3483:46: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3483:46: sparse:     got struct ftrace_hash *[assigned] notrace_hash
   kernel/trace/ftrace.c:3488:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
   kernel/trace/ftrace.c:3488:53: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3488:53: sparse:     got struct ftrace_hash *save_filter_hash
   kernel/trace/ftrace.c:3489:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3489:54: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3489:54: sparse:     got struct ftrace_hash *save_notrace_hash
   kernel/trace/ftrace.c:3508:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3508:45: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3508:45: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3509:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3509:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3509:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3514:83: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3514:83: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3514:83: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3517:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3517:66: sparse:     expected struct ftrace_hash *new_hash
   kernel/trace/ftrace.c:3517:66: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3525:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3525:45: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3525:45: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3526:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3526:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3526:48: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
>> kernel/trace/ftrace.c:3537:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash1 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3537:67: sparse:     expected struct ftrace_hash *new_hash1
   kernel/trace/ftrace.c:3537:67: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3538:55: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3538:55: sparse:     expected struct ftrace_hash *new_hash2
   kernel/trace/ftrace.c:3538:55: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3597:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3597:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3597:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3598:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3598:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3598:48: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3599:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3599:45: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3599:45: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3600:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3600:46: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3600:46: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3654:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3654:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:3654:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:3657:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3657:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:3657:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:3897:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3897:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3897:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3914:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3914:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3914:22: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:4562:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4562:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:4562:22: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:4565:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4565:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:4565:22: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:5349:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5349:19: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5349:19: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5493:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5493:19: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5493:19: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5499:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5499:34: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:5499:34: sparse:     got struct ftrace_hash *[assigned] old_hash
   kernel/trace/ftrace.c:5764:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5764:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5764:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5766:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5766:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5766:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5847:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5847:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5847:50: sparse:     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:5849:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5849:51: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5849:51: sparse:     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:5898:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5898:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5898:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:5947:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5947:19: sparse:     expected struct ftrace_hash *free_hash
   kernel/trace/ftrace.c:5947:19: sparse:     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:5989:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5989:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5989:50: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:6041:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6041:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6041:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:6045:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6045:52: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6045:52: sparse:     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions
   kernel/trace/ftrace.c:6371:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6371:35: sparse:     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_hash
   kernel/trace/ftrace.c:6371:35: sparse:     got struct ftrace_hash *[assigned] hash
   kernel/trace/ftrace.c:6373:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6373:43: sparse:     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_notrace_hash
   kernel/trace/ftrace.c:6373:43: sparse:     got struct ftrace_hash *[assigned] hash
   kernel/trace/ftrace.c:6442:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6442:35: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:6442:35: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:6450:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6450:35: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:6450:35: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:6518:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:6518:47: sparse:     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_hash
   kernel/trace/ftrace.c:6518:47: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:6519:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:6519:55: sparse:     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_notrace_hash
   kernel/trace/ftrace.c:6519:55: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:7238:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7238:46: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7238:46: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:7239:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7239:47: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7239:47: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:7243:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7243:44: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7243:44: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:7694:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7694:62: sparse:     expected struct ftrace_hash *hash

vim +3537 kernel/trace/ftrace.c

  3429	
  3430	/**
  3431	 * ftrace_startup_subops - enable tracing for subops of an ops
  3432	 * @ops: Manager ops (used to pick all the functions of its subops)
  3433	 * @subops: A new ops to add to @ops
  3434	 * @command: Extra commands to use to enable tracing
  3435	 *
  3436	 * The @ops is a manager @ops that has the filter that includes all the functions
  3437	 * that its list of subops are tracing. Adding a new @subops will add the
  3438	 * functions of @subops to @ops.
  3439	 */
  3440	int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
  3441	{
  3442		struct ftrace_hash *filter_hash;
  3443		struct ftrace_hash *notrace_hash;
  3444		struct ftrace_hash *save_filter_hash;
  3445		struct ftrace_hash *save_notrace_hash;
  3446		int size_bits;
  3447		int ret;
  3448	
  3449		if (unlikely(ftrace_disabled))
  3450			return -ENODEV;
  3451	
  3452		ftrace_ops_init(ops);
  3453		ftrace_ops_init(subops);
  3454	
  3455		if (WARN_ON_ONCE(subops->flags & FTRACE_OPS_FL_ENABLED))
  3456			return -EBUSY;
  3457	
  3458		/* Make everything canonical (Just in case!) */
  3459		if (!ops->func_hash->filter_hash)
  3460			ops->func_hash->filter_hash = EMPTY_HASH;
  3461		if (!ops->func_hash->notrace_hash)
  3462			ops->func_hash->notrace_hash = EMPTY_HASH;
  3463		if (!subops->func_hash->filter_hash)
  3464			subops->func_hash->filter_hash = EMPTY_HASH;
  3465		if (!subops->func_hash->notrace_hash)
  3466			subops->func_hash->notrace_hash = EMPTY_HASH;
  3467	
  3468		/* For the first subops to ops just enable it normally */
  3469		if (list_empty(&ops->subop_list)) {
  3470			/* Just use the subops hashes */
  3471			filter_hash = copy_hash(subops->func_hash->filter_hash);
  3472			notrace_hash = copy_hash(subops->func_hash->notrace_hash);
  3473			if (!filter_hash || !notrace_hash) {
  3474				free_ftrace_hash(filter_hash);
  3475				free_ftrace_hash(notrace_hash);
  3476				return -ENOMEM;
  3477			}
  3478	
  3479			save_filter_hash = ops->func_hash->filter_hash;
  3480			save_notrace_hash = ops->func_hash->notrace_hash;
  3481	
  3482			ops->func_hash->filter_hash = filter_hash;
  3483			ops->func_hash->notrace_hash = notrace_hash;
  3484			list_add(&subops->list, &ops->subop_list);
  3485			ret = ftrace_startup(ops, command);
  3486			if (ret < 0) {
  3487				list_del(&subops->list);
  3488				ops->func_hash->filter_hash = save_filter_hash;
  3489				ops->func_hash->notrace_hash = save_notrace_hash;
  3490				free_ftrace_hash(filter_hash);
  3491				free_ftrace_hash(notrace_hash);
  3492			} else {
  3493				free_ftrace_hash(save_filter_hash);
  3494				free_ftrace_hash(save_notrace_hash);
  3495				subops->flags |= FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP;
  3496				subops->managed = ops;
  3497			}
  3498			return ret;
  3499		}
  3500	
  3501		/*
  3502		 * Here there's already something attached. Here are the rules:
  3503		 *   o If either filter_hash is empty then the final stays empty
  3504		 *      o Otherwise, the final is a superset of both hashes
  3505		 *   o If either notrace_hash is empty then the final stays empty
  3506		 *      o Otherwise, the final is an intersection between the hashes
  3507		 */
  3508		if (ftrace_hash_empty(ops->func_hash->filter_hash) ||
  3509		    ftrace_hash_empty(subops->func_hash->filter_hash)) {
  3510			filter_hash = EMPTY_HASH;
  3511		} else {
  3512			size_bits = max(ops->func_hash->filter_hash->size_bits,
  3513					subops->func_hash->filter_hash->size_bits);
  3514			filter_hash = alloc_and_copy_ftrace_hash(size_bits, ops->func_hash->filter_hash);
  3515			if (!filter_hash)
  3516				return -ENOMEM;
> 3517			ret = append_hash(&filter_hash, subops->func_hash->filter_hash,
  3518					  size_bits);
  3519			if (ret < 0) {
  3520				free_ftrace_hash(filter_hash);
  3521				return ret;
  3522			}
  3523		}
  3524	
  3525		if (ftrace_hash_empty(ops->func_hash->notrace_hash) ||
  3526		    ftrace_hash_empty(subops->func_hash->notrace_hash)) {
  3527			notrace_hash = EMPTY_HASH;
  3528		} else {
  3529			size_bits = max(ops->func_hash->notrace_hash->size_bits,
  3530					subops->func_hash->notrace_hash->size_bits);
  3531			notrace_hash = alloc_ftrace_hash(size_bits);
  3532			if (!notrace_hash) {
  3533				free_ftrace_hash(filter_hash);
  3534				return -ENOMEM;
  3535			}
  3536	
> 3537			ret = intersect_hash(&notrace_hash, ops->func_hash->notrace_hash,
  3538					     subops->func_hash->notrace_hash);
  3539			if (ret < 0) {
  3540				free_ftrace_hash(filter_hash);
  3541				free_ftrace_hash(notrace_hash);
  3542				return ret;
  3543			}
  3544		}
  3545	
  3546		list_add(&subops->list, &ops->subop_list);
  3547	
  3548		ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
  3549		free_ftrace_hash(filter_hash);
  3550		free_ftrace_hash(notrace_hash);
  3551		if (ret < 0) {
  3552			list_del(&subops->list);
  3553		} else {
  3554			subops->flags |= FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP;
  3555			subops->managed = ops;
  3556		}
  3557		return ret;
  3558	}
  3559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
