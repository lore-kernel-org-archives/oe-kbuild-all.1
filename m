Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C91E5B95
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764480288; cv=none; b=sv5iR+yM65Aq+QCNMZyz9v7kOGftlSmvNJAfKqIYoBUCUE3uhjTiFQi1qQZYFtxf1VlKSBIounTpPo1PgoUAP2CtEz70iOJ7oFFk/ApnmRHwS5TIy/0+nHCclsPZEoN8oTcZcUfO+okzYGYsEmRpMdMWdEPXA7QQPz5sriNYefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764480288; c=relaxed/simple;
	bh=J1T8TJDZGybx8KehJpW4+Uo8epYpwthk1SKlz4fvi/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9feZGM+oE+tLBz1ws5vU7fW2J4s1pGTi0Jz2+Kkmu19RP6fUpwaNEBxbx7z3GjdKq4InctUKzKOr5Q3T3i8Cf4ZCkuPkhc956DIJlGtzrdbhHeJhv6Id9M6MvMoMjfkSr+p97OMC/rSpTA68rPCDw9o+vt1z1Ywg0rDdIIsQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNx0EeYU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNx0EeYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764480286; x=1796016286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1T8TJDZGybx8KehJpW4+Uo8epYpwthk1SKlz4fvi/A=;
  b=fNx0EeYUlweSBW4Ms73ndlIMd6/D9tja+sIBS1Q3VcUljctkloW0nLTd
   VLEpTLkluNaldkf88v1P+QEWIKthq1Hy/XlmCU8ifphuYTq9WGLoqcrox
   v65Vjw7gC9a10b+QZSA2DAccAuqnI7PJ2xk8/SS9BgZSdeygmKhtBUcSJ
   d8k4ILhD0I4D5k4AAL4Ei8lWdt1nqaXCkIZ/EjsAZeIYXdf7exaDU55ws
   bmbL97Z9Wp35Gj+JOg01Rt1DkF+1wjWvdy8IIqXt8hY84VANiYZCINWEN
   zSgT5D6R4GQYdlPWAOmkmHo0U5d57SIikYhY05dtzK79huG+B720ZdGH8
   w==;
X-CSE-ConnectionGUID: 2bSDU/A8RCuolcy1aNVNvg==
X-CSE-MsgGUID: rhaU+vV4QHWpALTl68YOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66335890"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66335890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 21:24:46 -0800
X-CSE-ConnectionGUID: h6rypScQTmygE9dpwA4mjA==
X-CSE-MsgGUID: clzjVd3dR/COY1Q1/MZ1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193971833"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Nov 2025 21:24:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPZvO-000000007nR-0zJv;
	Sun, 30 Nov 2025 05:24:42 +0000
Date: Sun, 30 Nov 2025 13:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:rqspinlock/freeze 1/1] kernel/bpf/rqspinlock.c:214:12:
 error: invalid operands to binary expression ('struct mcs_spinlock *' and
 'void')
Message-ID: <202511301323.wygCmY6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux rqspinlock/freeze
head:   ecbeea85f52f8ff53a69932204c687c4de11f1c9
commit: ecbeea85f52f8ff53a69932204c687c4de11f1c9 [1/1] rqspinlock: Back propagate deadlock signals from successors
config: arm-randconfig-002-20251130 (https://download.01.org/0day-ci/archive/20251130/202511301323.wygCmY6f-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301323.wygCmY6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301323.wygCmY6f-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                 ^
   include/linux/compiler_types.h:602:22: note: expanded from macro 'compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:590:23: note: expanded from macro '_compiletime_assert'
     590 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:582:9: note: expanded from macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:214:29: error: incomplete definition of type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:564:38: note: expanded from macro '__native_word'
     564 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:602:22: note: expanded from macro 'compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:590:23: note: expanded from macro '_compiletime_assert'
     590 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:582:9: note: expanded from macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:214:29: error: incomplete definition of type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:602:22: note: expanded from macro 'compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:590:23: note: expanded from macro '_compiletime_assert'
     590 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:582:9: note: expanded from macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:214:29: error: incomplete definition of type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:552:13: note: expanded from macro '__unqual_scalar_typeof'
     552 |                 _Generic((x),                                           \
         |                           ^
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:214:29: error: incomplete definition of type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:559:15: note: expanded from macro '__unqual_scalar_typeof'
     559 |                          default: (x)))
         |                                    ^
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:214:29: error: incomplete definition of type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
>> kernel/bpf/rqspinlock.c:214:12: error: invalid operands to binary expression ('struct mcs_spinlock *' and 'void')
     214 |                 if (node && READ_ONCE(node->next)) {
         |                     ~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/rqspinlock.c:215:12: error: incomplete definition of type 'struct mcs_spinlock'
     215 |                         if (node->next->locked != RES_HUNG_VAL)
         |                             ~~~~^
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:240:29: error: incomplete definition of type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:563:10: note: expanded from macro '__native_word'
     563 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:602:22: note: expanded from macro 'compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:590:23: note: expanded from macro '_compiletime_assert'
     590 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:582:9: note: expanded from macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:240:29: error: incomplete definition of type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:563:39: note: expanded from macro '__native_word'
     563 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:602:22: note: expanded from macro 'compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:590:23: note: expanded from macro '_compiletime_assert'
     590 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:582:9: note: expanded from macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:240:29: error: incomplete definition of type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:564:10: note: expanded from macro '__native_word'
     564 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:602:22: note: expanded from macro 'compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:590:23: note: expanded from macro '_compiletime_assert'
     590 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:582:9: note: expanded from macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/bpf/rqspinlock.c:202:14: note: forward declaration of 'struct mcs_spinlock'
     202 |                                   struct mcs_spinlock *node)
         |                                          ^
   kernel/bpf/rqspinlock.c:240:29: error: incomplete definition of type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                       ~~~~^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:564:38: note: expanded from macro '__native_word'
     564 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:602:22: note: expanded from macro 'compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:590:23: note: expanded from macro '_compiletime_assert'
     590 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:582:9: note: expanded from macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \


vim +214 kernel/bpf/rqspinlock.c

   199	
   200	static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
   201					  struct rqspinlock_timeout *ts,
   202					  struct mcs_spinlock *node)
   203	{
   204		u64 prev = ts->cur;
   205		u64 time;
   206		int ret;
   207	
   208		if (!ts->timeout_end) {
   209			if (check_deadlock_AA(lock))
   210				return -EDEADLK;
   211			/*
   212			 * Is the successor indicating to us that they have a deadlock?
   213			 */
 > 214			if (node && READ_ONCE(node->next)) {
   215				if (node->next->locked != RES_HUNG_VAL)
   216					return 0;
   217				return -ETIMEDOUT;
   218			}
   219			ts->cur = ktime_get_mono_fast_ns();
   220			ts->timeout_end = ts->cur + ts->duration;
   221			return 0;
   222		}
   223	
   224		time = ktime_get_mono_fast_ns();
   225		if (time > ts->timeout_end)
   226			return -ETIMEDOUT;
   227	
   228		/*
   229		 * A millisecond interval passed from last time? Trigger deadlock
   230		 * checks.
   231		 */
   232		if (prev + NSEC_PER_MSEC < time) {
   233			ts->cur = time;
   234			ret = check_deadlock_ABBA(lock, mask);
   235			if (ret)
   236				return ret;
   237			/*
   238			 * Is the successor indicating to us that they have a deadlock?
   239			 */
   240			if (node && READ_ONCE(node->next)) {
   241				if (node->next->locked != RES_HUNG_VAL)
   242					return 0;
   243				return -ETIMEDOUT;
   244			}
   245		}
   246	
   247		return 0;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
