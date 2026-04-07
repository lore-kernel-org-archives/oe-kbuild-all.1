Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA869322A1F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534500; cv=none; b=ZXkovLSi1zRNE8Dk7Da/hSXBhkF5Tn4KawkKpLgmpfPHw6xPHDKh/bayiKvc6ANrsw74E9tMXfY01+zwHpAAn5MF4kMqT+r4TgjLbUmKIV6QMTLaxe7XE8uqEG/luNTVK7oRIGa5+Ai5DhTcE36+xIkjKlAKtcpBv4tTDLVdNo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534500; c=relaxed/simple;
	bh=/JL9oFa/K2XrM+KnEyqXh7r+YoOjMfPnz4DIcaawuaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZOLcmtW6rk8hTYx+2CI/cYGzI8oMPsjIwDIqRNCkI4H8EaqTGLpKwfd2jPIdXas03/r1NSE62241Y+DlFAPdULlQd229D4KCgscAVIbXzLsVs8lH77m999m17yHtWwxsG8xGaqQQs2qWsIdJC6o+u2UJfZlPevxPQTKaKEORPac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZyOtL8h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZyOtL8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534499; x=1807070499;
  h=date:from:to:cc:subject:message-id;
  bh=/JL9oFa/K2XrM+KnEyqXh7r+YoOjMfPnz4DIcaawuaw=;
  b=VZyOtL8hw5IUqMtqPTUUEDRHSrKqGL5BMuKVq35Z2sVxCu3tiQCDKHlT
   CUoSOZT+v+bGvGk1jYOsZBN+pba8zZ4c8VAfrWnDm7U115eaP+kCgNwwz
   Jfy/0T4XuCofWLIIfkR8M9TpgLrNeWTZpHBxIjG9ARGbhAWAqEXORkPPQ
   hhcivu2cRs5zmHYyh8n2bevufFV5xo2648K3rqCePkKuYJcpi8peEsML2
   FYHJ7PB7uZdFmB4WAmLZIf1P+1LFdkdNmYy3lJlBrFMBS9zyL783sTTa+
   8DUu7BzJw1dlDNwcoNv2p1PxGxo1VkFRVDjI4e+5PNb1Hy6CYQADQ6WV4
   A==;
X-CSE-ConnectionGUID: bavuW/OpRui/PlTNJSzcHA==
X-CSE-MsgGUID: e1D/c7UcQNCSSEujJSRfSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75663653"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="75663653"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:01:38 -0700
X-CSE-ConnectionGUID: gDfoA+9SSDmYCAV4mwuL/Q==
X-CSE-MsgGUID: UsP9p1sWQrec+OIMx/3rdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227218970"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 21:01:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xd7-0000000007t-3Fo6;
	Tue, 07 Apr 2026 04:01:33 +0000
Date: Tue, 07 Apr 2026 12:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/prjc 16/22] kernel/sched/alt_core.c:7352:23:
 warning: variable 't' used in loop condition not modified in loop body
Message-ID: <202604060045.IbOkdyeW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/prjc
head:   14ff03aebefa493a7d7ecfcbff66ded1147dba3e
commit: 929363bec03b29a52d29a1e3b16e8b631ad47d18 [16/22] sched/alt: [Sync] 81f70f0ee9ea sched/mmcid: Avoid full tasklist walks
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260406/202604060045.IbOkdyeW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604060045.IbOkdyeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604060045.IbOkdyeW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:490:25: error: use of undeclared identifier 'paravirt_steal_rq_enabled'
     490 |         if (static_key_false((&paravirt_steal_rq_enabled))) {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:493:24: error: call to undeclared function 'paravirt_steal_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     493 |                 steal = prev_steal = paravirt_steal_clock(cpu_of(rq));
         |                                      ^
   kernel/sched/alt_core.c:7352:38: error: no member named 'user_list' in 'struct mm_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                  ~~~~~~~~~~ ^
   include/linux/list.h:1167:31: note: expanded from macro 'hlist_for_each_entry'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                                      ^~~~
   include/linux/list.h:1156:12: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                   ^~~
   kernel/sched/alt_core.c:7352:38: error: no member named 'user_list' in 'struct mm_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                  ~~~~~~~~~~ ^
   include/linux/list.h:1167:31: note: expanded from macro 'hlist_for_each_entry'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                                      ^~~~
   include/linux/list.h:1156:28: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                                   ^~~
   kernel/sched/alt_core.c:7352:2: error: no member named 'node' in 'sched_mm_cid'
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
   kernel/sched/alt_core.c:7352:56: error: no member named 'node' in 'struct sched_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:1169:37: note: expanded from macro 'hlist_for_each_entry'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:1156:12: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                   ^~~
   kernel/sched/alt_core.c:7352:56: error: no member named 'node' in 'struct sched_mm_cid'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:1169:37: note: expanded from macro 'hlist_for_each_entry'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:1156:28: note: expanded from macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                                   ^~~
   kernel/sched/alt_core.c:7352:2: error: no member named 'node' in 'sched_mm_cid'
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
>> kernel/sched/alt_core.c:7352:23: warning: variable 't' used in loop condition not modified in loop body [-Wfor-loop-analysis]
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                              ^
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
   1 warning and 12 errors generated.


vim +/t +7352 kernel/sched/alt_core.c

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
