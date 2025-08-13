Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC941CD1F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 18:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755109853; cv=none; b=SsY7ibDSC6Qc0ff7rTs8J8ntSrS/wwITbYpG7kYUIxuYcQBmxXlwiYy1/kcI5BdZ93gYyi/mLPEV6yKPGisG9NHPiHGQ1YyqzfWFv/KKK9aXMP6Pzt1v7EAnkx7LiTbKFiNMo1EkW4LxZBjCZB/OBi50t+m6j+n+gw2hUoxh2kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755109853; c=relaxed/simple;
	bh=B2MTJJiGzyaO+z+/8AKwk9NEx40iP0hNgNls3qkVc9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EHpb5IyX54MWrfOGHdTNzC5L0w+H3xADmpvAJ0wCanoN1MBUIsMaMo1oI3/++vYZGnsza7/KiM5QyZ1N0gBJS9w1rbvKI5Z4ha8HJYi47AWtpFvSPN/EArnS8lAHjDOyZsTyUiBrU2DTiPpYk4ASr9L8f2abf65X4r4BHA2+vgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mn7E0baf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mn7E0baf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755109851; x=1786645851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2MTJJiGzyaO+z+/8AKwk9NEx40iP0hNgNls3qkVc9U=;
  b=mn7E0bafBM66xcfbH+IKPzId8Kp6V/XUWeDawjEnzPgAjPNuROC3A2U6
   KwWKIoECBC5kacq6awonpPrhq6P8++gswluH1HAuPS3X5MglUWOeRsQWk
   9fdgrarNfTkw8/39wfUmhmCS5JRAZc3miVjQzapnnn3/Nul7ehhaF4Uy4
   fVFUmYApJWBuiJ1lpa6QRXak9ZVX/rSUBvL0dA/79M3/2gDIKzLVzG4L2
   OtJfIOQZnvaSWc+jsFLlrtDTm8xmbRObVSEEUT0UhJJRjbZCGkU6YAmI7
   702MYWP+NHV6omuTHt2sW1jopeipPsm/J3e4u1Y3ttncyXsRPdF0ZVTK1
   A==;
X-CSE-ConnectionGUID: IHaqB5u3Sa6cs5C3x5t71w==
X-CSE-MsgGUID: Ik6fTRgLR3a8Kd/cVP+qQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79989595"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="79989595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 11:30:51 -0700
X-CSE-ConnectionGUID: 20xNIuIlTJiCTCgTW77P9Q==
X-CSE-MsgGUID: qpKQ4966Q3WH2JhxKzl79A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="203715306"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2025 11:30:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umGFF-000ADo-2h;
	Wed, 13 Aug 2025 18:30:42 +0000
Date: Thu, 14 Aug 2025 02:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-new 125/137] include/linux/sched/coredump.h:23:33:
 sparse: sparse: incorrect type in initializer (different modifiers)
Message-ID: <202508140219.D4jGTlbP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   694c8e78f486b09137ee3efadae044d01aba971b
commit: 63e795236094c47c4030f1203c798c511f9ac6f0 [125/137] mm: update coredump logic to correctly use bitmap mm flags
config: microblaze-randconfig-r131-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140219.D4jGTlbP-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508140219.D4jGTlbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140219.D4jGTlbP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/exec.c:318:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __user * @@     got void * @@
   fs/exec.c:318:31: sparse:     expected char const [noderef] __user *
   fs/exec.c:318:31: sparse:     got void *
   fs/exec.c:911:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:911:48: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:911:48: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1017:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1017:56: sparse:     expected struct task_struct *parent
   fs/exec.c:1017:56: sparse:     got struct task_struct [noderef] __rcu *parent
   fs/exec.c:1052:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1052:47: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1052:47: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1167:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/exec.c:1167:26: sparse:     expected struct spinlock [usertype] *lock
   fs/exec.c:1167:26: sparse:     got struct spinlock [noderef] __rcu *
   fs/exec.c:1169:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/exec.c:1169:28: sparse:     expected struct spinlock [usertype] *lock
   fs/exec.c:1169:28: sparse:     got struct spinlock [noderef] __rcu *
   fs/exec.c:1693:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1693:70: sparse:     expected struct task_struct *tsk
   fs/exec.c:1693:70: sparse:     got struct task_struct [noderef] __rcu *parent
   fs/exec.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
>> include/linux/mm_types.h:1239:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1239:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1239:33: sparse:     got unsigned long [noderef] *
   fs/exec.c: note: in included file (through include/linux/sched/mm.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
>> include/linux/sched/coredump.h:23:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/sched/coredump.h:23:33: sparse:     expected unsigned long *bitmap
   include/linux/sched/coredump.h:23:33: sparse:     got unsigned long [noderef] *
--
   fs/coredump.c:508:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:508:27: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:508:27: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:517:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:517:29: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:517:29: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:556:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:556:31: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:556:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:561:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:561:33: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:561:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
>> include/linux/mm_types.h:1239:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1239:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1239:33: sparse:     got unsigned long [noderef] *
--
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
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/sched/mm.h):
>> include/linux/mm_types.h:1239:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1239:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1239:33: sparse:     got unsigned long [noderef] *
   kernel/ptrace.c:380:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:380:30: sparse:     expected struct spinlock [usertype] *l
   kernel/ptrace.c:380:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:409:12: sparse: sparse: context imbalance in 'ptrace_attach' - different lock contexts for basic block
   kernel/ptrace.c:500:38: sparse: sparse: dereference of noderef expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:690:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:706:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1384:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
--
   kernel/sys.c:1144:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1144:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1144:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/sys.c:1894:33: sparse: sparse: context imbalance in 'getrusage' - different lock contexts for basic block
   kernel/sys.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
>> include/linux/mm_types.h:1239:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1239:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1239:33: sparse:     got unsigned long [noderef] *
   kernel/sys.c: note: in included file:
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
   include/linux/mm.h:747:25: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:747:25: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:747:25: sparse:     got unsigned long [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
   include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
--
   fs/proc/base.c:890:65: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/proc/base.c:890:65: sparse:    struct task_struct [noderef] __rcu *
   fs/proc/base.c:890:65: sparse:    struct task_struct *
   fs/proc/base.c:2326:25: sparse: sparse: cast to restricted fmode_t
   fs/proc/base.c:2383:42: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:2483:48: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:752:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:752:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:752:37: sparse:     got struct spinlock [noderef] __rcu *
   fs/proc/base.c:1170:36: sparse: sparse: context imbalance in '__set_oom_adj' - unexpected unlock
   fs/proc/base.c: note: in included file (through include/linux/pgtable.h, arch/microblaze/include/asm/uaccess.h, include/linux/uaccess.h):
>> include/linux/mm_types.h:1239:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1239:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1239:33: sparse:     got unsigned long [noderef] *
>> include/linux/mm_types.h:1239:33: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned long *bitmap @@     got unsigned long [noderef] * @@
   include/linux/mm_types.h:1239:33: sparse:     expected unsigned long *bitmap
   include/linux/mm_types.h:1239:33: sparse:     got unsigned long [noderef] *
   fs/proc/base.c: note: in included file:
   include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
   include/linux/mm.h:747:25: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:747:25: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:747:25: sparse:     got unsigned long [noderef] *

vim +23 include/linux/sched/coredump.h

    20	
    21	static inline void __mm_flags_set_mask_dumpable(struct mm_struct *mm, int value)
    22	{
  > 23		unsigned long *bitmap = ACCESS_PRIVATE(&mm->_flags, __mm_flags);
    24	
    25		set_mask_bits(bitmap, MMF_DUMPABLE_MASK, value);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
