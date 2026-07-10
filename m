Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB129994B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 04:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659227; cv=none; b=i5K0TXY6o2YWY65+HDcNhMZvrT7iZDlWFDVllkyl0FlzmwhtGuGAsBJd8zHLWm/BDRAh8DT/4A/lIzNOiGninBe54IOalQhVTQnPee7DgcqVwPmit6z2Qr+FCwxako5/W9ixcuc8bPdj3wspIETcnBkqlp2Yco4kLWBld0SL3wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659227; c=relaxed/simple;
	bh=jdK18C2wbBtQ1VXaLzaMpGiVDEBwQd0AUfvnpJAXKNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AXG20DrIZ6I7ktT+sKdOmxdp4b26EYUkHdU6xb0rcEJCD0d35QHCclDiqJhPW2Yn1wE3oCkJY8hC7y4X7adBJvbt+vfu42799Soi0mJM4qiEyP7WVOlzDpQ4zDDHVBNS/FL8jjmL9VK+mDqxgcZaxQa65O+e9bSU/Kn8sZAbdEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNYBJ6gD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNYBJ6gD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783659225; x=1815195225;
  h=date:from:to:cc:subject:message-id;
  bh=jdK18C2wbBtQ1VXaLzaMpGiVDEBwQd0AUfvnpJAXKNQ=;
  b=VNYBJ6gDZHr2941YzEEAXrPXvhkX/CBnqQiHYH/ICocpEjdSWGPmJFTk
   4py7QlPfQ43eMbZgMhMHBssBYHhJ86SSuKWCAIrmQNthdz6ddh0kktuhd
   R81NFEoBD99h9rz+TRw+Dwf82ijf1KZtoW5MHb9MjUgNT5M9bmik8trwe
   PE0airW6mGwIRQzaxadEYUIaUt+i9YDH2xHUUlEHGu6IToLawN/gUztN9
   k5zzZAxPzTgWsibEIEf6VDY5ae+2yVfQAHTbyGnfgLQcHtybpnWs/VDcR
   GQh1bWpVp7I7MfPdcOW67XesqntzlNx9bMHckozRjg+gc5cMxdRwpklg+
   g==;
X-CSE-ConnectionGUID: ORbP5YaOS8KqMD+GY2qN3A==
X-CSE-MsgGUID: pywrIbtnSqKwN9Riuyk2KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83333381"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83333381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 21:53:44 -0700
X-CSE-ConnectionGUID: DVA2kFaEQX2XYxlHcLNpSQ==
X-CSE-MsgGUID: zycQEZS1TpqX+Kp+XSxXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259092591"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 21:53:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi3F5-00000000IVN-0ChO;
	Fri, 10 Jul 2026 04:53:39 +0000
Date: Fri, 10 Jul 2026 12:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/events/core.c:5424:21: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202607101249.dHZOuAbx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 4960626f956d63dce57f099016c2ecbe637a8229 perf/core: Fix slow perf_event_task_exit() with LBR callstacks
date:   6 months ago
config: riscv-randconfig-r112-20260708 (https://download.01.org/0day-ci/archive/20260710/202607101249.dHZOuAbx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101249.dHZOuAbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4960626f956d ("perf/core: Fix slow perf_event_task_exit() with LBR callstacks")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101249.dHZOuAbx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1585:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1585:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1585:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1598:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1598:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1598:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3776:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3776:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3776:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3780:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3780:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3780:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3781:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3781:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3781:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3834:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3834:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3834:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3835:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3835:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3835:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4252:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4252:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4252:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4660:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4660:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4660:15: sparse:    struct perf_event_context *
   kernel/events/core.c:5149:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5149:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:5149:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6927:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6927:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6927:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5424:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
   kernel/events/core.c:5424:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu *__new @@     got struct perf_ctx_data *[assigned] cd @@
>> kernel/events/core.c:5424:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/events/core.c:5435:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
   kernel/events/core.c:5435:37: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/events/core.c:6310:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:6678:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6678:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6678:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6802:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6802:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6802:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6835:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6835:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6835:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6948:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6948:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6948:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6964:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6964:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6964:14: sparse:    struct perf_buffer *
   kernel/events/core.c:8946:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8946:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8946:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9034:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9034:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:9034:13: sparse:    struct perf_buffer *
   kernel/events/core.c:9138:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:9138:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:9138:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9140:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:9140:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:9140:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9876:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9876:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9876:15: sparse:    struct perf_event_context *
   kernel/events/core.c:11071:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11071:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11071:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:11110:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11110:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11110:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11385:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11385:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:11385:23: sparse:    struct perf_event_context *
   kernel/events/core.c:14496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14496:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:14496:9: sparse:    struct perf_event_context *
   kernel/events/core.c:15016:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:15016:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:15016:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:197:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:213:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1632:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:3106:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:5123:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:204:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *src @@
   kernel/events/core.c:10924:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10924:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10924:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10944:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10944:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10944:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11060:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:11060:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:11060:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist *

vim +/__rcu +5424 kernel/events/core.c

  5412	
  5413	static int
  5414	attach_task_ctx_data(struct task_struct *task, struct kmem_cache *ctx_cache,
  5415			     bool global)
  5416	{
  5417		struct perf_ctx_data *cd, *old = NULL;
  5418	
  5419		cd = alloc_perf_ctx_data(ctx_cache, global);
  5420		if (!cd)
  5421			return -ENOMEM;
  5422	
  5423		for (;;) {
> 5424			if (try_cmpxchg(&task->perf_ctx_data, &old, cd)) {
  5425				if (old)
  5426					perf_free_ctx_data_rcu(old);
  5427				/*
  5428				 * Above try_cmpxchg() pairs with try_cmpxchg() from
  5429				 * detach_task_ctx_data() such that
  5430				 * if we race with perf_event_exit_task(), we must
  5431				 * observe PF_EXITING.
  5432				 */
  5433				if (task->flags & PF_EXITING) {
  5434					/* detach_task_ctx_data() may free it already */
  5435					if (try_cmpxchg(&task->perf_ctx_data, &cd, NULL))
  5436						perf_free_ctx_data_rcu(cd);
  5437				}
  5438				return 0;
  5439			}
  5440	
  5441			if (!old) {
  5442				/*
  5443				 * After seeing a dead @old, we raced with
  5444				 * removal and lost, try again to install @cd.
  5445				 */
  5446				continue;
  5447			}
  5448	
  5449			if (refcount_inc_not_zero(&old->refcount)) {
  5450				free_perf_ctx_data(cd); /* unused */
  5451				return 0;
  5452			}
  5453	
  5454			/*
  5455			 * @old is a dead object, refcount==0 is stable, try and
  5456			 * replace it with @cd.
  5457			 */
  5458		}
  5459		return 0;
  5460	}
  5461	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
