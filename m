Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040B2326937
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771199234; cv=none; b=t4e4VVL3w8i4XYepo0MDLl5yWLXv6u+UuZQ9f098rLnoeUQPzon2Zc28AgKVQwX0aLvvR+IVGxi1FYaOBD9tY+WPaqIjM8L3t161TeMozsP8iK3JvHEATcMDsFUa2IzbAUnOknzJK0kFL0B/JMzW8rUTfLf5noRfAaG1+VgW+/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771199234; c=relaxed/simple;
	bh=z2LpK+eXu1bLjAAt0WaypRX5GpHDtvXAh1EysC0Rhfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KSnOIEHdbJd9O5EY736EALc9v9y3P6kO7Q/Xpl+1g00NvL23MhS1gOCXkBnevqJq9xEwtDJ+sqTD28du8vviP1los2uiWWBZ4V5d455EnK2Sc+sp2iZA/5tW9krcrf1RXRNXqSYtdvFJQVyC7ZyhAIkYrvGfQsshHKuP2k1yhG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXkBLsM7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXkBLsM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771199232; x=1802735232;
  h=date:from:to:cc:subject:message-id;
  bh=z2LpK+eXu1bLjAAt0WaypRX5GpHDtvXAh1EysC0Rhfc=;
  b=fXkBLsM73xhXwLKSoSMg7zg4kv7DoNyX/a+L5cdN9yUyXr/UssEU0N4v
   Ic+OqszFJVCVbKct6O2luZmuSjLlX9KwG+9YItn627sNrv4dyfOtEc1GI
   ULi2oiyiKrnjZ4+q2CW8jf8S4XOOeqgFOFRVwMLg+LBWa7b0sYajMKkoq
   6AjCAQ+lWwEvbLSiFG8ldCcRCjEfQFyQIWshRNXna7MNdxmIzNCfyw5NR
   Q0LR3kV2Wvee8ntaEmlFIWxBCJt3unHdOGcFJUjPr29fStewzKOmtliZ4
   8NcmLaebiYIBBHE84NBSkQuJBy44w6etZKDIU1Vsfc2rYgN4tFbVQ6QtZ
   Q==;
X-CSE-ConnectionGUID: I7m2hwXCQM6gubG+Lx6Y3g==
X-CSE-MsgGUID: UMkxMNSbRx+hd9nBa/7oMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71487035"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="71487035"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 15:47:11 -0800
X-CSE-ConnectionGUID: 3SoqXQU6RaKbYBDqbuXXhQ==
X-CSE-MsgGUID: J09H8ydmQcW3FWZN6BT7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212489410"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Feb 2026 15:47:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrlpT-00000000zFo-1uEE;
	Sun, 15 Feb 2026 23:47:07 +0000
Date: Mon, 16 Feb 2026 07:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/events/core.c:5424:21: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202602160713.gkTy1MUw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: 4960626f956d63dce57f099016c2ecbe637a8229 perf/core: Fix slow perf_event_task_exit() with LBR callstacks
date:   5 weeks ago
config: arc-randconfig-r131-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160713.gkTy1MUw-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160713.gkTy1MUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160713.gkTy1MUw-lkp@intel.com/

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
>> kernel/events/core.c:5424:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu *_n_ @@     got struct perf_ctx_data *[assigned] cd @@
>> kernel/events/core.c:5424:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu *_n_ @@     got struct perf_ctx_data *[assigned] cd @@
   kernel/events/core.c:5435:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
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
   kernel/events/core.c:14496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14496:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:14496:9: sparse:    struct perf_event_context *
   kernel/events/core.c:15016:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:15016:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:15016:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:197:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:213:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
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

vim +5424 kernel/events/core.c

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
