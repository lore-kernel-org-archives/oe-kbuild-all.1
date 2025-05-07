Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A751917FB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636083; cv=none; b=gR2pMUEa8GtqZfjJAcfydckcGCZtNwqsRLMJFMQ4KKaofljUn4ojZpYrNDjQrGZeBRMkzWFejLfMeP1cQZSy6EQROAF/Oj6psfjsdU69XFImhrvuB9X+bnrk+PKYWcjgWh7YUlbPs5mGaKUcmR6DJaA6jbhIVwUPh5Y3mmJILg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636083; c=relaxed/simple;
	bh=ugXKx/rkQ0P1bwQ5Qt74X0nWuBjVGfqueD1aeMHaPuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d5R1nR6iwZ9IBHAGmZgS8IERDpGdkIgxskoTpS6jKDQpPRfioOwK7S/k6rYli5vSKJtsE1MHzmRU9yHmzAdREaGgZXoUwN3rtMcKNdKi2g3Ddbv7efR85c8AgM88w7hT1HGTmZ+6fNtuE+AZxo388DhlTUUd320/hhAkZPjzlks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2EOt9/d; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2EOt9/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746636080; x=1778172080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ugXKx/rkQ0P1bwQ5Qt74X0nWuBjVGfqueD1aeMHaPuo=;
  b=e2EOt9/dT3v4Qx8Z5FAmoku6bb/rP/frSkWWTBQxevP0A2WRdUzdboGN
   aSr0n5fuzGovgHVDxHjkOvNwWjENW6PpbspdUN2SW4uYsJCD5t+BH9IyZ
   +99IlVsiz1XNXZ83BDc+LZEmShk9r8+ZS6loR5HnEZ7l5eIg0royQRrF/
   nrUaexILzQxH96xsqzgg5desSeAPX7KW9G6gYFtQxP3jVVuoYoh+VUYqQ
   CH9Osmlec+NNUs3iKV+jipSQM8oC9/OK5lmR2MpvIBV2UNFYZ6BX6Klqu
   fy137i6TZnjHHyXcG68jZ3MwvyJmigYoBfakQQoLkg2JffHVJzgXQLx1W
   w==;
X-CSE-ConnectionGUID: qnPcdNnvSoOpph1H3y/CKA==
X-CSE-MsgGUID: xTLwuah4Tg2KS8u0+F7msQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48539026"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48539026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:41:18 -0700
X-CSE-ConnectionGUID: n6hKolE3QYaYaD6aeT+q2Q==
X-CSE-MsgGUID: KciXikOwRSaR3sq4jT3Nzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136030165"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 09:41:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uChpa-0008Ax-1u;
	Wed, 07 May 2025 16:41:14 +0000
Date: Thu, 8 May 2025 00:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx_sched-v2 33/34] kernel/sched/ext.c:5242:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202505080020.kco11Jcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx_sched-v2
head:   b40e5ff46a0202549236b537090b0532f1a2903a
commit: 8811c51d2167397de3fdf4b2e9b1919c4952dfbf [33/34] sched_ext: Move disable machinery into scx_sched
config: mips-randconfig-r111-20250501 (https://download.01.org/0day-ci/archive/20250508/202505080020.kco11Jcj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250508/202505080020.kco11Jcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080020.kco11Jcj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/ext.c:3166:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:5223:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
>> kernel/sched/ext.c:5242:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct irq_work *work @@     got struct irq_work [noderef] __rcu * @@
   kernel/sched/ext.c:1181:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1852:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1990:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1990:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1990:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:2196:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2196:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2196:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2236:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2236:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2236:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2236:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2236:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2236:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2236:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2343:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2343:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2343:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2343:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2343:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2343:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2343:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2378:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2378:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2378:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2378:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2378:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2378:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2378:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2426:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2426:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2426:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2426:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2426:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2426:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2426:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2431:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2431:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2431:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2431:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2431:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2431:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2431:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2449:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2449:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:2449:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2451:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2451:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2451:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2451:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2451:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2451:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2451:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2459:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2459:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:2459:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2461:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:2461:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2461:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2461:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:2461:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:2461:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:2461:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3004:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:3004:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3004:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:3022:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3022:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3022:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3022:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3022:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3022:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3022:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3053:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3053:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3053:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3053:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3053:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3053:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3053:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3138:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *sprev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3138:56: sparse:     expected struct task_struct *sprev
   kernel/sched/ext.c:3138:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3191:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3191:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3191:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3191:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3191:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3191:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3191:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3267:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3267:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3267:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3267:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3267:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3267:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3267:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3285:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3285:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3285:13: sparse:     expected unsigned long const volatile *addr

vim +5242 kernel/sched/ext.c

  5215	
  5216	static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
  5217					      const char *fmt, ...)
  5218	{
  5219		struct scx_exit_info *ei = scx_root->exit_info;
  5220		int none = SCX_EXIT_NONE;
  5221		va_list args;
  5222	
  5223		if (!atomic_try_cmpxchg(&scx_root->exit_kind, &none, kind))
  5224			return;
  5225	
  5226		ei->exit_code = exit_code;
  5227	#ifdef CONFIG_STACKTRACE
  5228		if (kind >= SCX_EXIT_ERROR)
  5229			ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
  5230	#endif
  5231		va_start(args, fmt);
  5232		vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
  5233		va_end(args);
  5234	
  5235		/*
  5236		 * Set ei->kind and ->reason for scx_dump_state(). They'll be set again
  5237		 * in scx_disable_workfn().
  5238		 */
  5239		ei->kind = kind;
  5240		ei->reason = scx_exit_reason(ei->kind);
  5241	
> 5242		irq_work_queue(&scx_root->error_irq_work);
  5243	}
  5244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
