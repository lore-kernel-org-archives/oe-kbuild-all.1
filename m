Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CABA313268
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766527364; cv=none; b=KDzrP/Ii7408y43QY7Ozzx+xAINM7Ay0R5yYGynMttgZfKOy/I26x8YdJR+/2qwazABWawzsop4vE6cyDSN7CNMaaQxxvwfeGgSuF2i9LzzFI7nR4T1/qAgZ/SiBNN9TVowae00k6DOU3s89rZy2FEZHaDi9o8EwLlGLgyl9XGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766527364; c=relaxed/simple;
	bh=UG5l8lBQ76Kb3AUfebQdHdc3fMgVAomkGjs6Y3BM3lo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZRl+snY6cGfGawpGokTvUIY1zThrrf/IxHFnNbwa/A8pdQeGpTg/TPwhVwTlmWDAeL6SbW7JYrNveLWV64QIM8wv2yeFotLXS2U8z3G4NFa1NB6YuPMjBSUI53OH1jaKLACSjg+ApCdE9x7pGDUgQ4BVrS/zxp2N0jNqgao9uQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdmw3WKA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdmw3WKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766527361; x=1798063361;
  h=date:from:to:cc:subject:message-id;
  bh=UG5l8lBQ76Kb3AUfebQdHdc3fMgVAomkGjs6Y3BM3lo=;
  b=Sdmw3WKAfAzXTQrG1/3DTejFzYPmP10yvE0zlvQvXpvs0rsrb0JlG/rw
   qysi4a7f1ZGOoAwZMhorOddr/cEqYNKnX11ARiSKljblhPESjIAdIS55T
   aPlDxlufw8ECrl+1TSyQv+yXv5EaYjFD/j2HPS3kF6fouSW7OtsKfPjKN
   i47p6Yz9yQyGn/WLbJXVZ9gAJszhvHaqaqFp+HE9bFLuNZT6zjtovlpNg
   zsP/8gZ6gB4innmgkELJCYn8L4JceCOclcdAP7q61Kn3c0Gbuq6jZ2jLG
   P/SeOBNfhwAeAeqDrjC7zD8tq74nUHFB4gbBBy9SW0ZBc6zVRd/L5Shbc
   g==;
X-CSE-ConnectionGUID: xWrimuNkTzG5fawOgizgPg==
X-CSE-MsgGUID: F0CTzNeKTtO+a2IZ7Hh96w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72003688"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="72003688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 14:02:39 -0800
X-CSE-ConnectionGUID: 5jZ2lqQ5QA6BEOyuuHicvQ==
X-CSE-MsgGUID: ydf4cjfWTiqaOBpBAhyVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="237276847"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Dec 2025 14:02:37 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYASg-000000002Pk-4BKN;
	Tue, 23 Dec 2025 22:02:34 +0000
Date: Wed, 24 Dec 2025 06:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 39/39]
 kernel/sched/core.c:706:46: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202512240522.K3dHkbeS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: 77b4ebc9e43b02f3c50dab48963d969964ea83ef [39/39] sched: Enable context analysis for core.c and fair.c
config: um-randconfig-r134-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240522.K3dHkbeS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240522.K3dHkbeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240522.K3dHkbeS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/core.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/sched/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> kernel/sched/core.c:706:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:706:46: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:706:46: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/core.c:718:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:718:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:718:9: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:1106:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1106:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1106:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2180:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2180:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2180:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2191:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2191:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2191:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2272:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:2272:22: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:2272:22: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3093:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3093:14: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:3093:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3138:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3138:14: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:3138:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3596:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3596:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3596:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3703:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:3703:14: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:3703:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:3801:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3801:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3801:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4295:33: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:4295:33: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:4295:33: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:4768:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:4768:14: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:4768:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:5462:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:5462:14: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:5462:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:5544:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5544:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5544:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6766:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6766:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6766:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6833:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6833:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6833:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7306:14: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/core.c:7306:14: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:7306:14: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/core.c:7339:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7339:17: sparse:    struct task_struct *
   kernel/sched/core.c:7339:17: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/core.c:7473:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock [usertype] *lock @@
   kernel/sched/core.c:7473:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:7473:9: sparse:     got struct spinlock [usertype] *lock
>> kernel/sched/core.c:7491:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7491:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:7491:9: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:7509:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct rwlock [usertype] *lock @@
   kernel/sched/core.c:7509:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:7509:9: sparse:     got struct rwlock [usertype] *lock
   kernel/sched/core.c:8647:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/core.c:8647:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/core.c:8647:17: sparse:     got struct raw_spinlock *
   kernel/sched/core.c:10247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10247:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10247:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:3198:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:3198:17: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:3198:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2319:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2319:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2319:25: sparse:    struct task_struct *
   kernel/sched/core.c:2175:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2175:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2175:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2663:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2663:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2663:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2663:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2663:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2663:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2640:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2640:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2640:9: sparse:    struct task_struct *
--
   kernel/sched/fair.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c: note: in included file (through include/linux/mm.h, include/linux/hugetlb_inline.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/sched/fair.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/sched/fair.c:1151:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1151:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1151:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1187:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1187:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1187:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1243:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1243:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1243:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12927:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12927:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12927:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8350:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8350:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8350:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:8535:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:8535:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:8535:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c:8554:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8554:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8554:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:8630:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/fair.c:8630:22: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:8630:22: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:8753:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8753:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8753:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8780:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8780:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8780:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9045:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9045:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9045:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:10081:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10081:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10081:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10709:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10709:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10709:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12181:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12181:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12181:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11819:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11819:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11819:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12294:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12294:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12294:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13591:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock * @@
   kernel/sched/fair.c:13591:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/fair.c:13591:9: sparse:     got struct raw_spinlock *
   kernel/sched/fair.c: note: in included file:
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/sched/sched.h:1557:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/sched/sched.h:1557:9: sparse:     expected struct __context_bitlock const *var
   kernel/sched/sched.h:1557:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/sched/fair.c:6684:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/sched.h:2663:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2663:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2663:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2319:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2319:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2319:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2330:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2330:26: sparse:    struct task_struct *

vim +706 kernel/sched/core.c

   691	
   692	/*
   693	 * double_rq_lock - safely lock two runqueues
   694	 */
   695	void double_rq_lock(struct rq *rq1, struct rq *rq2)
   696	{
   697		lockdep_assert_irqs_disabled();
   698	
   699		if (rq_order_less(rq2, rq1))
   700			swap(rq1, rq2);
   701	
   702		raw_spin_rq_lock(rq1);
   703		if (__rq_lockp(rq1) != __rq_lockp(rq2))
   704			raw_spin_rq_lock_nested(rq2, SINGLE_DEPTH_NESTING);
   705		else
 > 706			__acquire_ctx_lock(__rq_lockp(rq2)); /* fake acquire */
   707	
   708		double_rq_clock_clear_update(rq1, rq2);
   709	}
   710	
   711	/*
   712	 * ___task_rq_lock - lock the rq @p resides on.
   713	 */
   714	struct rq *___task_rq_lock(struct task_struct *p, struct rq_flags *rf)
   715	{
   716		struct rq *rq;
   717	
 > 718		lockdep_assert_held(&p->pi_lock);
   719	
   720		for (;;) {
   721			rq = task_rq(p);
   722			raw_spin_rq_lock(rq);
   723			if (likely(rq == task_rq(p) && !task_on_rq_migrating(p))) {
   724				rq_pin_lock(rq, rf);
   725				return rq;
   726			}
   727			raw_spin_rq_unlock(rq);
   728	
   729			while (unlikely(task_on_rq_migrating(p)))
   730				cpu_relax();
   731		}
   732	}
   733	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
