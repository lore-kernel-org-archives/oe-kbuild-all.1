Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8E613C8E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534438; cv=none; b=hSFiZuoQsDeAGhUYsb8G3H1dFLLZ+IlGo0ROdLCrgSUWNh9AfABafnB4+RvEz/9Zcppmk99Ut0FmXAWjKLfV9Eh6U21E9LXONeiM/u36dmtxqupaLdNHL9yfAHoyxyRr8YFfPchW/faakQgke4ZaMJ5MpCf3oMlAlXb7kg+Nacs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534438; c=relaxed/simple;
	bh=onKqt6VU+pAoFDmtmTkEmhso1TSQpvw7ANv4y4NHWlM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ittL+tXQJrjx4NoYpYnFFiVLGF+9Pcwq2DYwDc9FLeuOh4wlleQo0eheEX/KaPxM20AtWKURC2LQ9Ejz6n6J1hpifYRlJalgb+YZtXB+Y51jIkwNBMsIFPiVr4GyJG+FD26NTur+wxAsWF06NyAuxc8gLGwu7uukIxPukVFHXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCesYawl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCesYawl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534438; x=1807070438;
  h=date:from:to:cc:subject:message-id;
  bh=onKqt6VU+pAoFDmtmTkEmhso1TSQpvw7ANv4y4NHWlM=;
  b=dCesYawl0uOHyxsZtLH2yd1O7z5WJmwA6kXfVJZK1bOv8w9SW8LaucgS
   m8qjYg84yIn9ogvm/Ro6ZwBljI5FGa37MXbmRhqOIn30GmWxTzU4Vu7A2
   pt3xRAxrAqJJJNKcIttD2Ndt1WoU1t701tUm8HZu/4Y+nZdJU8BCUOpt9
   2gZK+bUS7dwGgCzlwuQdmmeOCdJqwzFxVeMJY+2wuM9o+X4Qle/xfMf8H
   nnJnlTthjtuXVdBjXR5rs0IrqUGXuBl5uyobpSQMLphOXMgKyYIGLYTrr
   AFG9n0oLBmrgnWWAs27JP4kY7NQEtN+4qqCQkxn1U1iCouxCw+HceApLe
   A==;
X-CSE-ConnectionGUID: fKiK0RZAT9WIoSRVhV5HxA==
X-CSE-MsgGUID: P8YSHZaCS+22Rnr5pw+HMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782248"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782248"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:37 -0700
X-CSE-ConnectionGUID: bj04vaOuRcSIV9hXfwVo+A==
X-CSE-MsgGUID: OQRYvUTTTb6UC5SecaYrGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225304367"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 21:00:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007P-2Nwe;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 07 Apr 2026 12:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/prjc 16/22] kernel/sched/alt_core.c:7352:38:
 error: no member named 'user_list' in 'struct mm_mm_cid'
Message-ID: <202604051939.u3POKHHt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/prjc
head:   14ff03aebefa493a7d7ecfcbff66ded1147dba3e
commit: 929363bec03b29a52d29a1e3b16e8b631ad47d18 [16/22] sched/alt: [Sync] 81f70f0ee9ea sched/mmcid: Avoid full tasklist walks
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260405/202604051939.u3POKHHt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051939.u3POKHHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051939.u3POKHHt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/alt_core.c:7352:38: error: no member named 'user_list' in 'struct mm_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                  ~~~~~~~~~~ ^
   include/linux/list.h:1167:31: note: expanded from macro 'hlist_for_each_entry'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                                      ^~~~
   include/linux/list.h:1156:12: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                   ^~~
>> kernel/sched/alt_core.c:7352:38: error: no member named 'user_list' in 'struct mm_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                  ~~~~~~~~~~ ^
   include/linux/list.h:1167:31: note: expanded from macro 'hlist_for_each_entry'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                                      ^~~~
   include/linux/list.h:1156:28: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                                   ^~~
>> kernel/sched/alt_core.c:7352:2: error: no member named 'node' in 'sched_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^                                                    ~~~~~
   include/linux/list.h:1167:13: note: expanded from macro 'hlist_for_each_entry'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                    ^                                               ~~~~~~
   include/linux/list.h:1157:15: note: expanded from macro 'hlist_entry_safe'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^                          ~~~~~~
   include/linux/list.h:1146:40: note: expanded from macro 'hlist_entry'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^                     ~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> kernel/sched/alt_core.c:7352:56: error: no member named 'node' in 'struct sched_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:1169:37: note: expanded from macro 'hlist_for_each_entry'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:1156:12: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                   ^~~
>> kernel/sched/alt_core.c:7352:56: error: no member named 'node' in 'struct sched_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:1169:37: note: expanded from macro 'hlist_for_each_entry'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:1156:28: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                                   ^~~
>> kernel/sched/alt_core.c:7352:2: error: no member named 'node' in 'sched_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^                                                    ~~~~~
   include/linux/list.h:1169:13: note: expanded from macro 'hlist_for_each_entry'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^                                                    ~~~~~~
   include/linux/list.h:1157:15: note: expanded from macro 'hlist_entry_safe'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^                          ~~~~~~
   include/linux/list.h:1146:40: note: expanded from macro 'hlist_entry'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^                     ~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   kernel/sched/alt_core.c:7366:28: error: no member named 'node' in 'struct sched_mm_cid'
    7366 |         hlist_add_head(&t->mm_cid.node, &mm->mm_cid.user_list);
         |                         ~~~~~~~~~ ^
   kernel/sched/alt_core.c:7366:46: error: no member named 'user_list' in 'struct mm_mm_cid'
    7366 |         hlist_add_head(&t->mm_cid.node, &mm->mm_cid.user_list);
         |                                          ~~~~~~~~~~ ^
   kernel/sched/alt_core.c:7424:28: error: no member named 'node' in 'struct sched_mm_cid'
    7424 |         hlist_del_init(&t->mm_cid.node);
         |                         ~~~~~~~~~ ^
   kernel/sched/alt_core.c:7567:30: error: no member named 'user_list' in 'struct mm_mm_cid'
    7567 |         INIT_HLIST_HEAD(&mm->mm_cid.user_list);
         |                          ~~~~~~~~~~ ^
   include/linux/list.h:945:32: note: expanded from macro 'INIT_HLIST_HEAD'
     945 | #define INIT_HLIST_HEAD(ptr) ((ptr)->first = NULL)
         |                                ^~~
   10 errors generated.


vim +7352 kernel/sched/alt_core.c

  7344	
  7345	static void mm_cid_fixup_tasks_to_cpus(void)
  7346	{
  7347		struct mm_struct *mm = current->mm;
  7348		struct task_struct *t;
  7349	
  7350		lockdep_assert_held(&mm->mm_cid.mutex);
  7351	
> 7352		hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
  7353			/* Current has already transferred before invoking the fixup. */
  7354			if (t != current)
  7355				mm_cid_fixup_task_to_cpu(t, mm);
  7356		}
  7357	
  7358		mm_cid_complete_transit(mm, MM_CID_ONCPU);
  7359	}
  7360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
