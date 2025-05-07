Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4661C214A79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614967; cv=none; b=WMeUxOZH4aIkJ4sMRfHJ8LNhlgIDT4jnQR4S2G0vmHrcRA4FSxhUQaIVgpivaoqpGFla+3uq2PJKuOLZciabx0DDQ65pROczCYW4ZxzzvcEITTpBpO4sQIZ5Fa1oVsL5ouFzroIfwqgedXglB08ssz9M6PFwwbCslRu91mk0YFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614967; c=relaxed/simple;
	bh=/F4ThNs4YSKoQvnNH2gSnRt8R9fTq6LpEUzPD3KAeyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GAkeTJPxXplJeYWYR0dKIsB9cwY4vc6oGfQxmgLMVQU0TiWz3F6YMiXGs65z+XZzps8bYgICSfde6iA/XmbDGPscV6EflJHJmjNDcuwFOmAz6vHiPff+pNhMRnX6xlxvQ3XDn3Ioox5EQDhwl/FgPGfvgCXrmoif9VM8vfoSpMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2vh7F3Y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2vh7F3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614964; x=1778150964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/F4ThNs4YSKoQvnNH2gSnRt8R9fTq6LpEUzPD3KAeyE=;
  b=I2vh7F3YMAC+IDAlHrCRoHoTu1K1yi9SAgIZl3Wa5aJmq9AsS+0tMkBd
   0d8qdWRxjXBpzn2e9oDiDu2yIyoTmq5ByiR0IgnrivBjkpp1BCSIMh66t
   mTGuSlDccl4PpBaqN1JUxYz7Pybr0rcwdyfKCYE0ChSH+PbMRhpdsyEYN
   svc+2DHJvA3xs3HqruCUMAyvmti1qAGOIJQIqOvkRNTe+UV4wXAMA7tAm
   eMyFP+JMR8KJZfhiJ/2U+RZxG3YVz0UWyh3V99/4+AwGvNd95k1LEGbnL
   S3sGuowlOmBPWHLnuWRhH0/ynG62eij+2zEXZ/dcMiKjCDkjgVZtQlDBd
   A==;
X-CSE-ConnectionGUID: qsS8gdETSQSt8uya8+vt/Q==
X-CSE-MsgGUID: xLes0VvVTv6iq++KaP2W5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65867038"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65867038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:49:22 -0700
X-CSE-ConnectionGUID: 4fm/kUnERW2G9KqmUw21qA==
X-CSE-MsgGUID: eDOMxsGZSdGPccbBk/sGrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135823134"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 03:49:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcL0-0007dT-0w;
	Wed, 07 May 2025 10:49:18 +0000
Date: Wed, 7 May 2025 18:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx_sched-v2 25/34] kernel/sched/ext.c:5230:34:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202505071836.xbtJeoqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx_sched-v2
head:   b40e5ff46a0202549236b537090b0532f1a2903a
commit: 69ba4f885e16e07ecd4ca26948724f21ecc4a755 [25/34] sched_ext: Use dynamic allocation for scx_sched
config: mips-randconfig-r111-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071836.xbtJeoqk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071836.xbtJeoqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071836.xbtJeoqk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:529:55: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:989:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:989:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:989:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1527:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1527:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1527:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1847:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1847:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1847:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1547:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1547:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1547:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1548:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1548:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1548:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1609:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1609:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1609:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1652:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1652:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1652:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1672:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1672:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1672:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2016:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2016:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2016:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2039:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2039:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2039:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2385:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2385:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2385:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2387:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2387:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2387:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2387:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2387:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2387:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2717:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2717:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2717:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2727:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2727:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2727:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2833:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2833:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2833:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2357:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2357:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2357:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2368:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2368:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2368:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1262:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1262:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1262:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1262:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1362:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1362:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1362:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1671:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1671:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1671:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1671:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1671:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1671:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1760:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1760:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1760:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2578:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2578:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2578:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2242:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2242:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2242:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2243:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2243:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2243:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2318:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2318:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2318:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2878:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2878:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2878:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2880:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2880:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2880:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2882:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2882:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2882:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3071:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3071:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3071:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3120:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext.c:5230:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
   kernel/sched/ext.c:1844:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1982:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1982:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1982:56: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/ext.c:2225:13: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/sched/ext.c:2225:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2225:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2225:13: sparse:     got unsigned long [noderef] __rcu *
>> kernel/sched/ext.c:2225:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2225:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2225:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2332:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2332:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2332:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2332:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2332:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2332:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2332:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2367:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2367:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2367:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2367:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2367:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2367:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2367:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2415:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2415:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2415:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2415:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2415:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2415:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2415:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2420:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2420:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2420:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2420:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2420:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2420:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2420:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2438:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2438:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:2438:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2440:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2440:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2440:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2440:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2440:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2440:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2440:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2448:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2448:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:2448:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2450:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2450:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2450:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2450:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2450:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2450:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2450:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3008:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3008:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3008:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3008:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3008:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3008:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3008:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3039:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3039:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3039:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3039:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3039:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3039:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3039:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3124:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *sprev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3124:56: sparse:     expected struct task_struct *sprev
   kernel/sched/ext.c:3124:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3176:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3176:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3176:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3176:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3176:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3176:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3176:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3252:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3252:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3252:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3252:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3252:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3252:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3252:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3270:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3270:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3270:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3270:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3270:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3270:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3270:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3314:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3314:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:3314:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3438:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3438:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3438:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3438:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3438:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3438:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3438:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3490:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3490:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3490:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3490:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3490:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3490:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3490:13: sparse:     got unsigned long [noderef] __rcu *
>> kernel/sched/ext.c:3510:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_ext_ops *ops @@     got struct sched_ext_ops [noderef] __rcu * @@
   kernel/sched/ext.c:3510:50: sparse:     expected struct sched_ext_ops *ops
   kernel/sched/ext.c:3510:50: sparse:     got struct sched_ext_ops [noderef] __rcu *
   kernel/sched/ext.c:3512:23: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3512:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3512:23: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3512:23: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3512:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3512:23: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3512:23: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3514:29: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3514:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3514:29: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3514:29: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3514:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3514:29: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3514:29: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3617:20: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3617:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3617:20: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3617:20: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3617:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3617:20: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3617:20: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3689:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3689:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3689:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3689:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3689:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3689:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3689:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3752:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3752:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3752:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3752:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3752:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3752:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3752:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3756:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3756:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3756:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3756:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3756:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3756:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3756:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3767:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3767:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3767:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3767:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3767:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3767:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3767:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3796:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3796:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3796:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3796:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3796:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3796:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3796:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3905:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3905:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3905:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3905:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3905:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3905:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3905:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3921:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3921:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3921:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3921:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3921:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3921:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3921:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3980:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3980:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3980:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3980:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3980:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3980:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3980:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4005:35: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4005:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4005:35: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4005:35: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4005:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4005:35: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4005:35: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4039:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4039:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4039:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4039:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4039:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4039:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4039:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4053:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4053:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4053:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4053:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4053:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4053:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4053:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4073:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4073:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4073:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4073:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4073:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4073:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4073:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4094:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4094:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4094:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4094:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4094:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4094:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4094:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4109:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4109:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4109:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4109:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4109:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4109:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4109:21: sparse:     got unsigned long [noderef] __rcu *
>> kernel/sched/ext.c:4726:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:4726:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4726:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:5053:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5053:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5053:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5053:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5053:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5053:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5053:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5100:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5100:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5100:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5100:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5100:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5100:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5100:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5123:30: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5123:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5123:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5123:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5123:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5123:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5123:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5157:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5157:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5157:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5157:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5157:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5157:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5157:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5181:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5181:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5181:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5934:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5934:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5934:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:7243:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7243:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7243:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:245:24: sparse: sparse: Using plain integer as NULL pointer
>> kernel/sched/ext_idle.c:747:13: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/sched/ext_idle.c:747:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
>> kernel/sched/ext_idle.c:747:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext_idle.c:766:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1295:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1697:15: sparse: sparse: dereference of noderef expression

vim +5230 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  5222  
c5f22258f5f675 Tejun Heo 2025-04-04  5223  static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
f0e1a0643a59bf Tejun Heo 2024-06-18  5224  				      const char *fmt, ...)
f0e1a0643a59bf Tejun Heo 2024-06-18  5225  {
a57e4bfdf9f465 Tejun Heo 2025-04-25  5226  	struct scx_exit_info *ei = scx_root->exit_info;
f0e1a0643a59bf Tejun Heo 2024-06-18  5227  	int none = SCX_EXIT_NONE;
f0e1a0643a59bf Tejun Heo 2024-06-18  5228  	va_list args;
f0e1a0643a59bf Tejun Heo 2024-06-18  5229  
a57e4bfdf9f465 Tejun Heo 2025-04-25 @5230  	if (!atomic_try_cmpxchg(&scx_root->exit_kind, &none, kind))
f0e1a0643a59bf Tejun Heo 2024-06-18  5231  		return;
f0e1a0643a59bf Tejun Heo 2024-06-18  5232  
f0e1a0643a59bf Tejun Heo 2024-06-18  5233  	ei->exit_code = exit_code;
62d3726d4cd66f Tejun Heo 2024-09-23  5234  #ifdef CONFIG_STACKTRACE
f0e1a0643a59bf Tejun Heo 2024-06-18  5235  	if (kind >= SCX_EXIT_ERROR)
f0e1a0643a59bf Tejun Heo 2024-06-18  5236  		ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
62d3726d4cd66f Tejun Heo 2024-09-23  5237  #endif
f0e1a0643a59bf Tejun Heo 2024-06-18  5238  	va_start(args, fmt);
f0e1a0643a59bf Tejun Heo 2024-06-18  5239  	vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
f0e1a0643a59bf Tejun Heo 2024-06-18  5240  	va_end(args);
f0e1a0643a59bf Tejun Heo 2024-06-18  5241  
07814a9439a3b0 Tejun Heo 2024-06-18  5242  	/*
07814a9439a3b0 Tejun Heo 2024-06-18  5243  	 * Set ei->kind and ->reason for scx_dump_state(). They'll be set again
1a2469403eb26c Tejun Heo 2025-04-04  5244  	 * in scx_disable_workfn().
07814a9439a3b0 Tejun Heo 2024-06-18  5245  	 */
07814a9439a3b0 Tejun Heo 2024-06-18  5246  	ei->kind = kind;
07814a9439a3b0 Tejun Heo 2024-06-18  5247  	ei->reason = scx_exit_reason(ei->kind);
07814a9439a3b0 Tejun Heo 2024-06-18  5248  
c5f22258f5f675 Tejun Heo 2025-04-04  5249  	irq_work_queue(&scx_error_irq_work);
f0e1a0643a59bf Tejun Heo 2024-06-18  5250  }
f0e1a0643a59bf Tejun Heo 2024-06-18  5251  

:::::: The code at line 5230 was first introduced by commit
:::::: a57e4bfdf9f4656274f3733a5fc84d5987dcbafb sched_ext: Introduce scx_sched

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
