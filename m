Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040A2A1CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944784; cv=none; b=BFNfp+SzL4YGpWggRVy6zNP4fHfixnK7a8wCz72b6e7vv75TD9Sp9Q2YzkbdiM3cRDQPqNaO7UDnfiXQs9O9OiGkGY/c3PIUbqtfD7v9eAEMUTKDTiD4Bo41wcPI1g0uifTdeSjX5toX5M1TEax3rfaFn8FN/JnI076LiAvTQGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944784; c=relaxed/simple;
	bh=CGqAeU1faPg2pTmxOli2hRDYxwkFWG+YbBsd78Aq2W8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHmF3Ov7re9c04iSWIr0PXaPN96VvUwJ8qbkRuxqjKBm7PK5eVd+avoEuoTWPzS8PJvmw4M/fEjkyRfbffgMX0AGGg/iYQ0JBC5gsnLiurIFMT7rzDlkqp/8fm6phEPYAms3lBGhxMDURewWtb+6m4PivnsGihhU5I+BaE60pDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RboGA0X4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RboGA0X4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722944782; x=1754480782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGqAeU1faPg2pTmxOli2hRDYxwkFWG+YbBsd78Aq2W8=;
  b=RboGA0X4p6Ns3Hhg+5JbGm8FaOimNn08SuTwEzbruC0lBYrCNhLzrmqV
   8JtRzBlSSAFL2f8p3R8SohJvM/QyEqyrZBMchL7b2S4OqxcvehaXftoEy
   mj+mphU2siY+m1WHgH3vKQ/mCx6GMrZhGAY6OPuc6XyfuXMOT3zJwl61q
   L5fT9sAkKSM98N/Hrjvxvydh5lglgL8w/jxQ8H11GN5HIoHpLaBCxYZi+
   Ga431ImBS9V63vA0mgj1SOjV+ykLCfvhLm7BSuaiCazOwAlwGm84ovHj2
   NnXHBU1Vsg3BwmHxS6RzEbGTvCMEz/p8FvR4HtYPI+6l5upU2+q7La1M+
   g==;
X-CSE-ConnectionGUID: FphziQhUQi6gkVP7bEjTEw==
X-CSE-MsgGUID: IEyGVviYSBaq4FU1IO3CZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20831896"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="20831896"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 04:46:21 -0700
X-CSE-ConnectionGUID: jijA+9d0SM+ddj0Rg2ZZvg==
X-CSE-MsgGUID: VHrcXCMRRYuouwouOZ51Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="61449823"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2024 04:46:20 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbIdt-0004SG-2L;
	Tue, 06 Aug 2024 11:46:17 +0000
Date: Tue, 6 Aug 2024 19:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 3/1422] kernel/sched/core.c:3887:41: error: no member
 named 'wake_entry' in 'struct task_struct'
Message-ID: <202408061915.zMwupbLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/main
head:   0816340db848460e20ae01ab50245be7b2c189b7
commit: d821e3e85092581709b1b5f9ab8cacf0ce70c1a8 [3/1422] Project C v5.7.5-r2
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240806/202408061915.zMwupbLg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061915.zMwupbLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061915.zMwupbLg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/core.c:33:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/sched/core.c:33:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/sched/core.c:33:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from kernel/sched/core.c:87:
   kernel/sched/sched.h:2075:5: error: no member named 'wake_cpu' in 'struct task_struct'
    2075 |         p->wake_cpu = cpu;
         |         ~  ^
   kernel/sched/core.c:2633:7: error: no member named 'wake_cpu' in 'struct task_struct'
    2633 |                         p->wake_cpu = arg->dest_cpu;
         |                         ~  ^
>> kernel/sched/core.c:3887:41: error: no member named 'wake_entry' in 'struct task_struct'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/llist.h:203:47: note: expanded from macro 'llist_for_each_entry_safe'
     203 |         for (pos = llist_entry((node), typeof(*pos), member);                  \
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/llist.h:110:26: note: expanded from macro 'llist_entry'
     110 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:451:74: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/sched/core.c:3887:2: error: no member named 'wake_entry' in 'task_struct'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^                                      ~~~~~~~~~~
   include/linux/llist.h:203:13: note: expanded from macro 'llist_for_each_entry_safe'
     203 |         for (pos = llist_entry((node), typeof(*pos), member);                  \
         |                    ^                                 ~~~~~~
   include/linux/llist.h:110:2: note: expanded from macro 'llist_entry'
     110 |         container_of(ptr, type, member)
         |         ^                       ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> kernel/sched/core.c:3887:2: error: assigning to 'struct task_struct *' from incompatible type 'void'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/llist.h:203:11: note: expanded from macro 'llist_for_each_entry_safe'
     203 |         for (pos = llist_entry((node), typeof(*pos), member);                  \
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:3887:2: error: no member named 'wake_entry' in 'task_struct'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^                                      ~~~~~~~~~~
   include/linux/llist.h:204:7: note: expanded from macro 'llist_for_each_entry_safe'
     204 |              member_address_is_nonnull(pos, member) &&                         \
         |              ^                              ~~~~~~
   include/linux/llist.h:127:22: note: expanded from macro 'member_address_is_nonnull'
     127 |         ((uintptr_t)(ptr) + offsetof(typeof(*(ptr)), member) != 0)
         |                             ^                        ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> kernel/sched/core.c:3887:41: error: no member named 'wake_entry' in 'struct task_struct'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                   ~            ^
   include/linux/llist.h:205:32: note: expanded from macro 'llist_for_each_entry_safe'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                                  ~~~  ^
   include/linux/llist.h:110:15: note: expanded from macro 'llist_entry'
     110 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> kernel/sched/core.c:3887:41: error: no member named 'wake_entry' in 'struct task_struct'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                   ~            ^
   include/linux/llist.h:205:32: note: expanded from macro 'llist_for_each_entry_safe'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                                  ~~~  ^
   include/linux/llist.h:110:15: note: expanded from macro 'llist_entry'
     110 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:451:63: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/sched/core.c:3887:41: error: no member named 'wake_entry' in 'struct task_struct'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                   ~            ^
   include/linux/llist.h:205:32: note: expanded from macro 'llist_for_each_entry_safe'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                                  ~~~  ^
   include/linux/llist.h:110:15: note: expanded from macro 'llist_entry'
     110 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:451:63: note: expanded from macro '__same_type'
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/sched/core.c:3887:2: error: no member named 'wake_entry' in 'task_struct'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^                                      ~~~~~~~~~~
   include/linux/llist.h:205:15: note: expanded from macro 'llist_for_each_entry_safe'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                      ^                                         ~~~~~~
   include/linux/llist.h:110:2: note: expanded from macro 'llist_entry'
     110 |         container_of(ptr, type, member)
         |         ^                       ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> kernel/sched/core.c:3887:2: error: assigning to 'struct task_struct *' from incompatible type 'void'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/llist.h:205:13: note: expanded from macro 'llist_for_each_entry_safe'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3940:35: error: no member named 'wake_entry' in 'struct task_struct'
    3940 |         __smp_call_single_queue(cpu, &p->wake_entry.llist);
         |                                       ~  ^
   kernel/sched/core.c:4362:30: error: no member named 'wake_cpu' in 'struct task_struct'
    4362 |                 cpu = select_task_rq(p, p->wake_cpu, wake_flags | WF_TTWU);
         |                                         ~  ^
   kernel/sched/core.c:4564:5: error: no member named 'wake_entry' in 'struct task_struct'
    4564 |         p->wake_entry.u_flags = CSD_TYPE_TTWU;
         |         ~  ^
   kernel/sched/core.c:4891:5: error: no member named 'recent_used_cpu' in 'struct task_struct'
    4891 |         p->recent_used_cpu = task_cpu(p);
         |         ~  ^
   13 warnings and 15 errors generated.


vim +3887 kernel/sched/core.c

c05fbafba1c548 kernel/sched.c      Peter Zijlstra 2011-04-05  3872  
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3873  #ifdef CONFIG_SMP
a148866489fbe2 kernel/sched/core.c Peter Zijlstra 2020-05-26  3874  void sched_ttwu_pending(void *arg)
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3875  {
a148866489fbe2 kernel/sched/core.c Peter Zijlstra 2020-05-26  3876  	struct llist_node *llist = arg;
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3877  	struct rq *rq = this_rq();
73215849dfbf63 kernel/sched/core.c Byungchul Park 2017-05-12  3878  	struct task_struct *p, *t;
d8ac897137a230 kernel/sched/core.c Matt Fleming   2016-09-21  3879  	struct rq_flags rf;
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3880  
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3881  	if (!llist)
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3882  		return;
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3883  
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra 2016-10-04  3884  	rq_lock_irqsave(rq, &rf);
77558e4d01ac0c kernel/sched/core.c Peter Zijlstra 2017-02-21  3885  	update_rq_clock(rq);
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3886  
8c4890d1c3358f kernel/sched/core.c Peter Zijlstra 2020-06-22 @3887  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3888  		if (WARN_ON_ONCE(p->on_cpu))
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3889  			smp_cond_load_acquire(&p->on_cpu, !VAL);
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3890  
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3891  		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3892  			set_task_cpu(p, cpu_of(rq));
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3893  
73215849dfbf63 kernel/sched/core.c Byungchul Park 2017-05-12  3894  		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3895  	}
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3896  
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3897  	/*
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3898  	 * Must be after enqueueing at least once task such that
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3899  	 * idle_cpu() does not observe a false-negative -- if it does,
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3900  	 * it is possible for select_idle_siblings() to stack a number
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3901  	 * of tasks on this CPU during that window.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3902  	 *
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3903  	 * It is ok to clear ttwu_pending when another task pending.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3904  	 * We will receive IPI after local irq enabled and then enqueue it.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3905  	 * Since now nr_running > 0, idle_cpu() will always get correct result.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3906  	 */
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3907  	WRITE_ONCE(rq->ttwu_pending, 0);
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra 2016-10-04  3908  	rq_unlock_irqrestore(rq, &rf);
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3909  }
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3910  

:::::: The code at line 3887 was first introduced by commit
:::::: 8c4890d1c3358fb8023d46e1e554c41d54f02878 smp, irq_work: Continue smp_call_function*() and irq_work*() integration

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
