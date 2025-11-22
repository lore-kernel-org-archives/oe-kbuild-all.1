Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C771DED49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 00:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763771229; cv=none; b=lcK3c/rYnpJUfw9LcCixVyPEslFtapUhzCZwoHCSI+5uL5jGmrRQPuRuRpcmaCv4/ppYVTbL5OyS/sqVKvtgWSoooDPTH5LydC+Is8sP/uNU3NRwIE+Vv4eemkhQM030sqdc+8BFh7U4EaxbIBBn7He/3JRJqhtXS8eMRjFgB1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763771229; c=relaxed/simple;
	bh=3KDw3uqNvgdWT++I4sb2ysuqLHes2NpQ1q4dXzF7Srw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSn+ZrKVsuGBEOrVdoUQn+K2UpcdCUIzm/RqnRNJCH4jglarKDArXYHIiQtqi62xI5w8niOCi/DSE/ov1ccocSugjJCPwewDN+yVgu1op9zTWVjrlsMjxpGlpYhWw/jYteYisnNHNyQMk3MsWTYd1O0IVmKljzNO0iIIjTIGooA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmIK2caf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmIK2caf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763771224; x=1795307224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KDw3uqNvgdWT++I4sb2ysuqLHes2NpQ1q4dXzF7Srw=;
  b=cmIK2caflC+uq9ORcdpb5dv2ubvMcgSIIhbzlwKkkAyB1tK3sOfLztBE
   q9DfkirrVTSHWKR2W5UwOOTomF64R0qGCpTMfKZ8p/Kx1y1vcHPHGbjcT
   UnEDFbxHzib71+iytbTehIcZRIZqaAjGgr3XzS0aDjuoKw25HBFUqnzEa
   YywR2gGLhgQZ+tsVprTA2ZSszKDWcwUA819rlEgLH1Z9d12Jz+sll8LvI
   dMmC4affE6fjyMEKyuHBLE43tDjeqV7eBzgWYofgfYkLz69P9V+8h1nTG
   yXgpjVL8Dy1/8PARbzVJ/ADbXQuIYyL0lZ0r3LNlIr9yGokkwef+yasq/
   g==;
X-CSE-ConnectionGUID: QFeG3nZPQUCxVYV8DsXRgw==
X-CSE-MsgGUID: hTL+q64GSe+QnLfKYgEDiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77231079"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="77231079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:27:03 -0800
X-CSE-ConnectionGUID: jZ25tTAxQYmdpoJPN8E+5Q==
X-CSE-MsgGUID: vY6JCELdRQiHvjTTq5q0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="196293143"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Nov 2025 16:27:02 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMbSt-00070t-15;
	Sat, 22 Nov 2025 00:26:59 +0000
Date: Sat, 22 Nov 2025 08:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:for-test 35/36] kernel/sched/core.c:651:17: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202511220825.aqOaKkHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git for-test
head:   10da1cb636df659be0b839e78c48037968cc5cc6
commit: 19b1ea63b92b86908c602b477f29bb6f7beac4cf [35/36] sched: Enable context analysis for core.c and fair.c
config: arm-randconfig-r122-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220825.aqOaKkHG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220825.aqOaKkHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220825.aqOaKkHG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c:643:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:643:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:643:17: sparse:     got struct raw_spinlock *
>> kernel/sched/core.c:651:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] *[assigned] lock @@
   kernel/sched/core.c:651:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:651:17: sparse:     got struct raw_spinlock [usertype] *[assigned] lock
   kernel/sched/core.c:657:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] *[assigned] lock @@
   kernel/sched/core.c:657:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:657:17: sparse:     got struct raw_spinlock [usertype] *[assigned] lock
   kernel/sched/core.c:682:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] *[assigned] lock @@
   kernel/sched/core.c:682:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:682:17: sparse:     got struct raw_spinlock [usertype] *[assigned] lock
   kernel/sched/core.c:688:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:688:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:688:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:705:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:705:47: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:705:47: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:717:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:717:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:717:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:741:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:741:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:741:17: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:766:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:766:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:766:17: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:885:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:885:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:885:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1105:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1105:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1105:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2075:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2075:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2075:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:2080:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2080:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2080:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:2210:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2210:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2210:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2221:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2221:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2221:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2302:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:2302:22: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2302:22: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:2731:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2731:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2731:17: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:2561:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2561:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2561:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:2651:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2651:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2651:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:2683:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2683:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2683:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:2812:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2812:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2812:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:2817:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:2817:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:2817:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:3160:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3160:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:3160:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3205:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3205:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:3205:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3671:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3671:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3671:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3778:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3778:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:3778:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3876:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3876:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3876:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4367:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:4367:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4367:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:4370:33: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:4370:33: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4370:33: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:4389:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:4389:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4389:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:4770:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:4770:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4770:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:4788:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:4788:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4788:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:4833:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:4833:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4833:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:4846:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:4846:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:4846:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:5531:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:5531:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:5531:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:5613:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5613:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5613:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6832:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6832:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6832:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6898:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6898:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6898:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6973:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:6973:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:6973:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:6973:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:6973:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:6973:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:7372:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:7372:14: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7372:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:7405:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7405:17: sparse:    struct task_struct *
   kernel/sched/core.c:7405:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7555:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock [usertype] *lock @@
   kernel/sched/core.c:7555:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7555:9: sparse:     got struct spinlock [usertype] *lock
   kernel/sched/core.c:7573:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7573:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7573:9: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:7576:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7576:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7576:17: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:7580:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7580:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7580:17: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:7591:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7591:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7591:9: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:7594:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7594:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7594:17: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:7598:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7598:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:7598:17: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:8005:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:8005:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:8005:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:8042:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:8042:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:8042:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:8747:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:8747:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:8747:17: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:9164:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:9164:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9164:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:9164:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:9164:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9164:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:9164:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock * @@
   kernel/sched/core.c:9164:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9164:9: sparse:     got struct spinlock *
   kernel/sched/core.c:9208:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:9208:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9208:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:9208:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:9208:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9208:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:9208:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock * @@
   kernel/sched/core.c:9208:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/core.c:9208:9: sparse:     got struct spinlock *
   kernel/sched/core.c:10362:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10362:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10362:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h):
>> include/linux/spinlock_api_up.h:82:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock [usertype] *lock @@
   include/linux/spinlock_api_up.h:82:9: sparse:     expected struct mutex const *var
   include/linux/spinlock_api_up.h:82:9: sparse:     got struct raw_spinlock [usertype] *lock
>> include/linux/spinlock_api_up.h:82:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock [usertype] *lock @@
   include/linux/spinlock_api_up.h:82:9: sparse:     expected struct mutex const *var
   include/linux/spinlock_api_up.h:82:9: sparse:     got struct raw_spinlock [usertype] *lock
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:885:11: sparse: sparse: dereference of noderef expression
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c: note: in included file (through include/linux/sched.h):
>> include/linux/spinlock.h:550:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock [usertype] *[usertype] lock @@
   include/linux/spinlock.h:550:1: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:550:1: sparse:     got struct raw_spinlock [usertype] *[usertype] lock
   kernel/sched/core.c: note: in included file:
>> kernel/sched/sched.h:1859:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/sched.h:1859:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1859:9: sparse:     got struct raw_spinlock *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1859:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/sched.h:1859:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1859:9: sparse:     got struct raw_spinlock *
>> kernel/sched/sched.h:1859:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   kernel/sched/sched.h:1859:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1859:9: sparse:     got struct raw_spinlock *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:3045:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:3045:17: sparse:     expected struct srcu_struct const *var
   kernel/sched/sched.h:3045:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2495:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2495:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2495:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2298:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2298:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2298:25: sparse:    struct task_struct *
   kernel/sched/core.c:2174:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2174:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2174:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2518:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2518:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2518:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2518:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2518:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2518:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2495:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2495:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2495:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2495:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2495:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2495:9: sparse:    struct task_struct *
--
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/mm_api.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c:1167:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1167:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1167:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1201:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1201:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1201:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:4789:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4789:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4789:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:4794:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4794:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4794:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:12852:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12852:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12852:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5664:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:5664:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:5664:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:5692:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:5692:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:5692:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:5694:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:5694:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:5694:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:7012:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7012:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7012:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:5987:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:5987:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:5987:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6003:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6003:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6003:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6044:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6044:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6044:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6050:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6050:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6050:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6071:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6071:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6071:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6176:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6176:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6176:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6182:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6182:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6182:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6268:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6268:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6268:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6271:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6271:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6271:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6346:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6346:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6346:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6355:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6355:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6355:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6382:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6382:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6382:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6386:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6386:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6386:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6393:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6393:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6393:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6490:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6490:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6490:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6531:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6531:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6531:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6538:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6538:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6538:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6567:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6567:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6567:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6630:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6630:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6630:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6632:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:6632:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:6632:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:6812:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6812:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6812:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8397:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8397:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8397:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8582:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:8582:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:8582:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:8601:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8601:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8601:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:8677:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/fair.c:8677:22: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:8677:22: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:8744:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8744:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8744:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8776:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8776:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8776:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8999:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8999:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8999:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10024:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10024:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10024:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10652:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10652:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10652:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12097:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12097:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12097:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11747:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11747:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11747:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12212:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12212:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12212:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13330:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:13330:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:13330:9: sparse:     got struct raw_spinlock *
>> kernel/sched/fair.c:13496:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct mutex * @@
   kernel/sched/fair.c:13496:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:13496:9: sparse:     got struct mutex *
   kernel/sched/fair.c: note: in included file:
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:4570:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4570:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4570:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:4575:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4575:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4575:17: sparse:     got struct raw_spinlock *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:4570:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4570:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4570:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:4575:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4575:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4575:17: sparse:     got struct raw_spinlock *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:4570:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4570:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4570:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:4575:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4575:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4575:17: sparse:     got struct raw_spinlock *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:4570:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4570:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4570:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:4575:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4575:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4575:17: sparse:     got struct raw_spinlock *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:4570:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4570:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4570:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:4575:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4575:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4575:17: sparse:     got struct raw_spinlock *
>> kernel/sched/sched.h:1546:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1546:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1546:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:4570:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4570:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4570:17: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:4575:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:4575:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:4575:17: sparse:     got struct raw_spinlock *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2518:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2518:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2518:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2298:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2298:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2298:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:26: sparse:    struct task_struct *

vim +651 kernel/sched/core.c

26f80681a09b95 Gabriele Monaco 2025-03-05  537  
58877d347b58c9 Peter Zijlstra  2020-07-02  538  /*
58877d347b58c9 Peter Zijlstra  2020-07-02  539   * Serialization rules:
58877d347b58c9 Peter Zijlstra  2020-07-02  540   *
58877d347b58c9 Peter Zijlstra  2020-07-02  541   * Lock order:
58877d347b58c9 Peter Zijlstra  2020-07-02  542   *
58877d347b58c9 Peter Zijlstra  2020-07-02  543   *   p->pi_lock
58877d347b58c9 Peter Zijlstra  2020-07-02  544   *     rq->lock
58877d347b58c9 Peter Zijlstra  2020-07-02  545   *       hrtimer_cpu_base->lock (hrtimer_start() for bandwidth controls)
58877d347b58c9 Peter Zijlstra  2020-07-02  546   *
58877d347b58c9 Peter Zijlstra  2020-07-02  547   *  rq1->lock
58877d347b58c9 Peter Zijlstra  2020-07-02  548   *    rq2->lock  where: rq1 < rq2
58877d347b58c9 Peter Zijlstra  2020-07-02  549   *
58877d347b58c9 Peter Zijlstra  2020-07-02  550   * Regular state:
58877d347b58c9 Peter Zijlstra  2020-07-02  551   *
58877d347b58c9 Peter Zijlstra  2020-07-02  552   * Normal scheduling state is serialized by rq->lock. __schedule() takes the
58877d347b58c9 Peter Zijlstra  2020-07-02  553   * local CPU's rq->lock, it optionally removes the task from the runqueue and
b19a888c1e9bdf Tal Zussman     2020-11-12  554   * always looks at the local rq data structures to find the most eligible task
58877d347b58c9 Peter Zijlstra  2020-07-02  555   * to run next.
58877d347b58c9 Peter Zijlstra  2020-07-02  556   *
58877d347b58c9 Peter Zijlstra  2020-07-02  557   * Task enqueue is also under rq->lock, possibly taken from another CPU.
58877d347b58c9 Peter Zijlstra  2020-07-02  558   * Wakeups from another LLC domain might use an IPI to transfer the enqueue to
58877d347b58c9 Peter Zijlstra  2020-07-02  559   * the local CPU to avoid bouncing the runqueue state around [ see
58877d347b58c9 Peter Zijlstra  2020-07-02  560   * ttwu_queue_wakelist() ]
58877d347b58c9 Peter Zijlstra  2020-07-02  561   *
58877d347b58c9 Peter Zijlstra  2020-07-02  562   * Task wakeup, specifically wakeups that involve migration, are horribly
58877d347b58c9 Peter Zijlstra  2020-07-02  563   * complicated to avoid having to take two rq->locks.
58877d347b58c9 Peter Zijlstra  2020-07-02  564   *
58877d347b58c9 Peter Zijlstra  2020-07-02  565   * Special state:
58877d347b58c9 Peter Zijlstra  2020-07-02  566   *
58877d347b58c9 Peter Zijlstra  2020-07-02  567   * System-calls and anything external will use task_rq_lock() which acquires
58877d347b58c9 Peter Zijlstra  2020-07-02  568   * both p->pi_lock and rq->lock. As a consequence the state they change is
58877d347b58c9 Peter Zijlstra  2020-07-02  569   * stable while holding either lock:
58877d347b58c9 Peter Zijlstra  2020-07-02  570   *
58877d347b58c9 Peter Zijlstra  2020-07-02  571   *  - sched_setaffinity()/
58877d347b58c9 Peter Zijlstra  2020-07-02  572   *    set_cpus_allowed_ptr():	p->cpus_ptr, p->nr_cpus_allowed
58877d347b58c9 Peter Zijlstra  2020-07-02  573   *  - set_user_nice():		p->se.load, p->*prio
58877d347b58c9 Peter Zijlstra  2020-07-02  574   *  - __sched_setscheduler():	p->sched_class, p->policy, p->*prio,
58877d347b58c9 Peter Zijlstra  2020-07-02  575   *				p->se.load, p->rt_priority,
58877d347b58c9 Peter Zijlstra  2020-07-02  576   *				p->dl.dl_{runtime, deadline, period, flags, bw, density}
58877d347b58c9 Peter Zijlstra  2020-07-02  577   *  - sched_setnuma():		p->numa_preferred_nid
39c4261191bf05 Chengming Zhou  2022-08-18  578   *  - sched_move_task():	p->sched_task_group
58877d347b58c9 Peter Zijlstra  2020-07-02  579   *  - uclamp_update_active()	p->uclamp*
58877d347b58c9 Peter Zijlstra  2020-07-02  580   *
58877d347b58c9 Peter Zijlstra  2020-07-02  581   * p->state <- TASK_*:
58877d347b58c9 Peter Zijlstra  2020-07-02  582   *
58877d347b58c9 Peter Zijlstra  2020-07-02  583   *   is changed locklessly using set_current_state(), __set_current_state() or
58877d347b58c9 Peter Zijlstra  2020-07-02  584   *   set_special_state(), see their respective comments, or by
58877d347b58c9 Peter Zijlstra  2020-07-02  585   *   try_to_wake_up(). This latter uses p->pi_lock to serialize against
58877d347b58c9 Peter Zijlstra  2020-07-02  586   *   concurrent self.
58877d347b58c9 Peter Zijlstra  2020-07-02  587   *
58877d347b58c9 Peter Zijlstra  2020-07-02  588   * p->on_rq <- { 0, 1 = TASK_ON_RQ_QUEUED, 2 = TASK_ON_RQ_MIGRATING }:
58877d347b58c9 Peter Zijlstra  2020-07-02  589   *
58877d347b58c9 Peter Zijlstra  2020-07-02  590   *   is set by activate_task() and cleared by deactivate_task(), under
58877d347b58c9 Peter Zijlstra  2020-07-02  591   *   rq->lock. Non-zero indicates the task is runnable, the special
58877d347b58c9 Peter Zijlstra  2020-07-02  592   *   ON_RQ_MIGRATING state is used for migration without holding both
58877d347b58c9 Peter Zijlstra  2020-07-02  593   *   rq->locks. It indicates task_cpu() is not stable, see task_rq_lock().
58877d347b58c9 Peter Zijlstra  2020-07-02  594   *
cd9626e9ebc77e Peter Zijlstra  2024-10-10  595   *   Additionally it is possible to be ->on_rq but still be considered not
cd9626e9ebc77e Peter Zijlstra  2024-10-10  596   *   runnable when p->se.sched_delayed is true. These tasks are on the runqueue
cd9626e9ebc77e Peter Zijlstra  2024-10-10  597   *   but will be dequeued as soon as they get picked again. See the
cd9626e9ebc77e Peter Zijlstra  2024-10-10  598   *   task_is_runnable() helper.
cd9626e9ebc77e Peter Zijlstra  2024-10-10  599   *
58877d347b58c9 Peter Zijlstra  2020-07-02  600   * p->on_cpu <- { 0, 1 }:
58877d347b58c9 Peter Zijlstra  2020-07-02  601   *
58877d347b58c9 Peter Zijlstra  2020-07-02  602   *   is set by prepare_task() and cleared by finish_task() such that it will be
58877d347b58c9 Peter Zijlstra  2020-07-02  603   *   set before p is scheduled-in and cleared after p is scheduled-out, both
58877d347b58c9 Peter Zijlstra  2020-07-02  604   *   under rq->lock. Non-zero indicates the task is running on its CPU.
58877d347b58c9 Peter Zijlstra  2020-07-02  605   *
58877d347b58c9 Peter Zijlstra  2020-07-02  606   *   [ The astute reader will observe that it is possible for two tasks on one
58877d347b58c9 Peter Zijlstra  2020-07-02  607   *     CPU to have ->on_cpu = 1 at the same time. ]
58877d347b58c9 Peter Zijlstra  2020-07-02  608   *
58877d347b58c9 Peter Zijlstra  2020-07-02  609   * task_cpu(p): is changed by set_task_cpu(), the rules are:
58877d347b58c9 Peter Zijlstra  2020-07-02  610   *
58877d347b58c9 Peter Zijlstra  2020-07-02  611   *  - Don't call set_task_cpu() on a blocked task:
58877d347b58c9 Peter Zijlstra  2020-07-02  612   *
58877d347b58c9 Peter Zijlstra  2020-07-02  613   *    We don't care what CPU we're not running on, this simplifies hotplug,
58877d347b58c9 Peter Zijlstra  2020-07-02  614   *    the CPU assignment of blocked tasks isn't required to be valid.
58877d347b58c9 Peter Zijlstra  2020-07-02  615   *
58877d347b58c9 Peter Zijlstra  2020-07-02  616   *  - for try_to_wake_up(), called under p->pi_lock:
58877d347b58c9 Peter Zijlstra  2020-07-02  617   *
58877d347b58c9 Peter Zijlstra  2020-07-02  618   *    This allows try_to_wake_up() to only take one rq->lock, see its comment.
58877d347b58c9 Peter Zijlstra  2020-07-02  619   *
58877d347b58c9 Peter Zijlstra  2020-07-02  620   *  - for migration called under rq->lock:
58877d347b58c9 Peter Zijlstra  2020-07-02  621   *    [ see task_on_rq_migrating() in task_rq_lock() ]
58877d347b58c9 Peter Zijlstra  2020-07-02  622   *
58877d347b58c9 Peter Zijlstra  2020-07-02  623   *    o move_queued_task()
58877d347b58c9 Peter Zijlstra  2020-07-02  624   *    o detach_task()
58877d347b58c9 Peter Zijlstra  2020-07-02  625   *
58877d347b58c9 Peter Zijlstra  2020-07-02  626   *  - for migration called under double_rq_lock():
58877d347b58c9 Peter Zijlstra  2020-07-02  627   *
58877d347b58c9 Peter Zijlstra  2020-07-02  628   *    o __migrate_swap_task()
58877d347b58c9 Peter Zijlstra  2020-07-02  629   *    o push_rt_task() / pull_rt_task()
58877d347b58c9 Peter Zijlstra  2020-07-02  630   *    o push_dl_task() / pull_dl_task()
58877d347b58c9 Peter Zijlstra  2020-07-02  631   *    o dl_task_offline_migration()
58877d347b58c9 Peter Zijlstra  2020-07-02  632   *
58877d347b58c9 Peter Zijlstra  2020-07-02  633   */
58877d347b58c9 Peter Zijlstra  2020-07-02  634  
39d371b7c0c299 Peter Zijlstra  2021-03-02  635  void raw_spin_rq_lock_nested(struct rq *rq, int subclass)
19b1ea63b92b86 Marco Elver     2025-08-03  636  	__context_unsafe()
39d371b7c0c299 Peter Zijlstra  2021-03-02  637  {
d66f1b06b5b438 Peter Zijlstra  2021-03-02  638  	raw_spinlock_t *lock;
d66f1b06b5b438 Peter Zijlstra  2021-03-02  639  
9edeaea1bc4523 Peter Zijlstra  2020-11-17  640  	/* Matches synchronize_rcu() in __sched_core_enable() */
9edeaea1bc4523 Peter Zijlstra  2020-11-17  641  	preempt_disable();
d66f1b06b5b438 Peter Zijlstra  2021-03-02  642  	if (sched_core_disabled()) {
d66f1b06b5b438 Peter Zijlstra  2021-03-02  643  		raw_spin_lock_nested(&rq->__lock, subclass);
9edeaea1bc4523 Peter Zijlstra  2020-11-17  644  		/* preempt_count *MUST* be > 1 */
9edeaea1bc4523 Peter Zijlstra  2020-11-17  645  		preempt_enable_no_resched();
d66f1b06b5b438 Peter Zijlstra  2021-03-02  646  		return;
d66f1b06b5b438 Peter Zijlstra  2021-03-02  647  	}
d66f1b06b5b438 Peter Zijlstra  2021-03-02  648  
d66f1b06b5b438 Peter Zijlstra  2021-03-02  649  	for (;;) {
9ef7e7e33bcdb5 Peter Zijlstra  2021-03-03  650  		lock = __rq_lockp(rq);
d66f1b06b5b438 Peter Zijlstra  2021-03-02 @651  		raw_spin_lock_nested(lock, subclass);
9ef7e7e33bcdb5 Peter Zijlstra  2021-03-03  652  		if (likely(lock == __rq_lockp(rq))) {
9edeaea1bc4523 Peter Zijlstra  2020-11-17  653  			/* preempt_count *MUST* be > 1 */
9edeaea1bc4523 Peter Zijlstra  2020-11-17  654  			preempt_enable_no_resched();
d66f1b06b5b438 Peter Zijlstra  2021-03-02  655  			return;
9edeaea1bc4523 Peter Zijlstra  2020-11-17  656  		}
d66f1b06b5b438 Peter Zijlstra  2021-03-02  657  		raw_spin_unlock(lock);
d66f1b06b5b438 Peter Zijlstra  2021-03-02  658  	}
39d371b7c0c299 Peter Zijlstra  2021-03-02  659  }
39d371b7c0c299 Peter Zijlstra  2021-03-02  660  

:::::: The code at line 651 was first introduced by commit
:::::: d66f1b06b5b438cd20ba3664b8eef1f9c79e84bf sched: Prepare for Core-wide rq->lock

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
