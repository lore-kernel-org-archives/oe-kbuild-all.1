Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16165231827
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 08:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782633658; cv=none; b=CKHXPmdvTdTVfBz+Gl8ETEhUC55EGFm8PoJe6q7WH2SiGY6hdp2eUSbJELJ1HxyybbtFDzsWNR7AKBVGS6fadYOh4cvY2y3ge3Fdc6bQqP7ikqOv2Zf5nMyc0K/O6hRMAqAAhNKDkn5kRgs/5mTNBwDzJgwpLdkyS9jYVSkaiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782633658; c=relaxed/simple;
	bh=tgMo3G0SxL47q70x+wyoNiE6Y0JKTFgzDlyAxv7vBxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MPrYM9kiQKYrVd20rUj17rjWD8g2tdpsPhjEE6XwPjNFf/MkBy4FcLxaiBR54szIctohAtxvPLfLJ29FooSJs2tJLRLNyBXAyjKV14ERq4USCJCxjgZ0yxqI6rNMjsHjCsb/lFRZuYkCctNXEqi2Qe7X9Gn4QdjxddvW1PDddzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gp2XeSFf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gp2XeSFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782633656; x=1814169656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tgMo3G0SxL47q70x+wyoNiE6Y0JKTFgzDlyAxv7vBxU=;
  b=gp2XeSFfSUoMrGkiBzIEW1j7eBjYZwksboaK6CRcoTOtGdoVI40C+Lll
   G/JgrX3hnJ844BI2jEXkhKFuEj7zHWOXqnLaHdHgAqfIrtpO5JYP0Hw6N
   UWTEcmEJNv+DGMjxdNjNgo6a+jUV0SUMhhHhzf91YqhOyPqtKAR/iej4e
   rw5d8uXiv9IcXdwwu+2/vnu1XJRc8puusPjsTzehkIMqZ/sup7jQFXWf1
   TPlZ7qMy0KC6MBMCHuIyuo0d05WOIixVOqP54DI9O+G/VXHnnmmgCG9vx
   /DWfcZeY5+zw55npSvp+FN2UXdtH18nF4vZQsGwb2gYFd+XiHTiQiEL7i
   Q==;
X-CSE-ConnectionGUID: vT7/Ehs7TAGUDetL5x9XGA==
X-CSE-MsgGUID: PWjrplVVQj6R9ySuT0Wt+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="83362466"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="83362466"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 01:00:56 -0700
X-CSE-ConnectionGUID: M0frLPc6SlSJbGJ4xHo9cA==
X-CSE-MsgGUID: +FP4jhy9QLKbaiOYsJswpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="251817186"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Jun 2026 01:00:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdkRZ-000000006FJ-3ftJ;
	Sun, 28 Jun 2026 08:00:46 +0000
Date: Sun, 28 Jun 2026 15:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 5/5]
 include/asm-generic/preempt.h:11:26: error: implicit declaration of function
 'current_thread_info'
Message-ID: <202606281508.ZQRWb4CK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   03d5a8129cbb0bdada3b8d5556c2458a6a397bab
commit: 03d5a8129cbb0bdada3b8d5556c2458a6a397bab [5/5] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20260628/202606281508.ZQRWb4CK-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281508.ZQRWb4CK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281508.ZQRWb4CK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/asm-generic/preempt.h: In function 'preempt_count':
>> include/asm-generic/preempt.h:11:26: error: implicit declaration of function 'current_thread_info' [-Wimplicit-function-declaration]
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:635:53: note: in definition of macro '__unqual_scalar_typeof'
     635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
   In file included from ./arch/mips/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from arch/mips/math-emu/ieee754dp.h:11,
                    from arch/mips/math-emu/dp_flong.c:10:
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
   In file included from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/asm-generic/percpu.h:11,
                    from ./arch/mips/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/mips/include/asm/atomic.h:17,
                    from include/linux/atomic.h:7,
                    from arch/mips/include/asm/processor.h:14,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/mips/math-emu/ieee754.h:19,
                    from arch/mips/math-emu/ieee754int.h:13,
                    from arch/mips/math-emu/ieee754dp.h:13:
   include/asm-generic/preempt.h: In function 'preempt_count_ptr':
   include/asm-generic/preempt.h:16:38: error: invalid type argument of '->' (have 'int')
      16 |         return &current_thread_info()->preempt_count;
         |                                      ^~
   include/asm-generic/preempt.h: In function '__preempt_count_dec_and_test':
>> include/asm-generic/preempt.h:69:43: error: implicit declaration of function 'tif_need_resched' [-Wimplicit-function-declaration]
      69 |         return !--*preempt_count_ptr() && tif_need_resched();
         |                                           ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/thread_info.h: At top level:
>> arch/mips/include/asm/thread_info.h:67:35: error: conflicting types for 'current_thread_info'; have 'struct thread_info *(void)'
      67 | static inline struct thread_info *current_thread_info(void)
         |                                   ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:26: note: previous implicit declaration of 'current_thread_info' with type 'int()'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/linux/thread_info.h:213:29: error: conflicting types for 'tif_need_resched'; have 'bool(void)' {aka '_Bool(void)'}
     213 | static __always_inline bool tif_need_resched(void)
         |                             ^~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:69:43: note: previous implicit declaration of 'tif_need_resched' with type 'int()'
      69 |         return !--*preempt_count_ptr() && tif_need_resched();
         |                                           ^~~~~~~~~~~~~~~~
--
   In file included from <command-line>:
   include/asm-generic/preempt.h: In function 'preempt_count':
>> include/asm-generic/preempt.h:11:26: error: implicit declaration of function 'current_thread_info' [-Wimplicit-function-declaration]
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/linux/compiler_types.h:635:53: note: in definition of macro '__unqual_scalar_typeof'
     635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
   In file included from ./arch/mips/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from arch/mips/math-emu/ieee754sp.h:11,
                    from arch/mips/math-emu/sp_fdp.c:10:
>> include/asm-generic/preempt.h:11:47: error: invalid type argument of '->' (have 'int')
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                                               ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
   In file included from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/asm-generic/percpu.h:11,
                    from ./arch/mips/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/mips/include/asm/atomic.h:17,
                    from include/linux/atomic.h:7,
                    from arch/mips/include/asm/processor.h:14,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/mips/math-emu/ieee754.h:19,
                    from arch/mips/math-emu/ieee754int.h:13,
                    from arch/mips/math-emu/ieee754sp.h:13:
   include/asm-generic/preempt.h: In function 'preempt_count_ptr':
   include/asm-generic/preempt.h:16:38: error: invalid type argument of '->' (have 'int')
      16 |         return &current_thread_info()->preempt_count;
         |                                      ^~
   include/asm-generic/preempt.h: In function '__preempt_count_dec_and_test':
>> include/asm-generic/preempt.h:69:43: error: implicit declaration of function 'tif_need_resched' [-Wimplicit-function-declaration]
      69 |         return !--*preempt_count_ptr() && tif_need_resched();
         |                                           ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/thread_info.h: At top level:
>> arch/mips/include/asm/thread_info.h:67:35: error: conflicting types for 'current_thread_info'; have 'struct thread_info *(void)'
      67 | static inline struct thread_info *current_thread_info(void)
         |                                   ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:26: note: previous implicit declaration of 'current_thread_info' with type 'int()'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:11:16: note: in expansion of macro 'READ_ONCE'
      11 |         return READ_ONCE(current_thread_info()->preempt_count);
         |                ^~~~~~~~~
>> include/linux/thread_info.h:213:29: error: conflicting types for 'tif_need_resched'; have 'bool(void)' {aka '_Bool(void)'}
     213 | static __always_inline bool tif_need_resched(void)
         |                             ^~~~~~~~~~~~~~~~
   include/asm-generic/preempt.h:69:43: note: previous implicit declaration of 'tif_need_resched' with type 'int()'
      69 |         return !--*preempt_count_ptr() && tif_need_resched();
         |                                           ^~~~~~~~~~~~~~~~
   arch/mips/math-emu/sp_fdp.c: In function 'ieee754sp_fdp':
   arch/mips/math-emu/ieee754int.h:49:38: warning: variable 'ys' set but not used [-Wunused-but-set-variable=]
      49 |         unsigned int ym; int ye; int ys; int yc
         |                                      ^~
   arch/mips/math-emu/sp_fdp.c:25:9: note: in expansion of macro 'COMPYSP'
      25 |         COMPYSP;
         |         ^~~~~~~
..


vim +/current_thread_info +11 include/asm-generic/preempt.h

ba1f14fbe70965 Peter Zijlstra     2013-11-28   8  
a787870924dbd6 Peter Zijlstra     2013-08-14   9  static __always_inline int preempt_count(void)
a787870924dbd6 Peter Zijlstra     2013-08-14  10  {
2e636d5e66c35d Peter Zijlstra     2016-05-16 @11  	return READ_ONCE(current_thread_info()->preempt_count);
a787870924dbd6 Peter Zijlstra     2013-08-14  12  }
a787870924dbd6 Peter Zijlstra     2013-08-14  13  
2e636d5e66c35d Peter Zijlstra     2016-05-16  14  static __always_inline volatile int *preempt_count_ptr(void)
a787870924dbd6 Peter Zijlstra     2013-08-14  15  {
a787870924dbd6 Peter Zijlstra     2013-08-14  16  	return &current_thread_info()->preempt_count;
a787870924dbd6 Peter Zijlstra     2013-08-14  17  }
a787870924dbd6 Peter Zijlstra     2013-08-14  18  
a787870924dbd6 Peter Zijlstra     2013-08-14  19  static __always_inline void preempt_count_set(int pc)
a787870924dbd6 Peter Zijlstra     2013-08-14  20  {
a787870924dbd6 Peter Zijlstra     2013-08-14  21  	*preempt_count_ptr() = pc;
a787870924dbd6 Peter Zijlstra     2013-08-14  22  }
a787870924dbd6 Peter Zijlstra     2013-08-14  23  
01028747559ac6 Peter Zijlstra     2013-08-14  24  /*
01028747559ac6 Peter Zijlstra     2013-08-14  25   * must be macros to avoid header recursion hell
01028747559ac6 Peter Zijlstra     2013-08-14  26   */
01028747559ac6 Peter Zijlstra     2013-08-14  27  #define init_task_preempt_count(p) do { \
609ca066386b2e Peter Zijlstra     2015-09-28  28  	task_thread_info(p)->preempt_count = FORK_PREEMPT_COUNT; \
01028747559ac6 Peter Zijlstra     2013-08-14  29  } while (0)
01028747559ac6 Peter Zijlstra     2013-08-14  30  
01028747559ac6 Peter Zijlstra     2013-08-14  31  #define init_idle_preempt_count(p, cpu) do { \
f1a0a376ca0c4e Valentin Schneider 2021-05-12  32  	task_thread_info(p)->preempt_count = PREEMPT_DISABLED; \
01028747559ac6 Peter Zijlstra     2013-08-14  33  } while (0)
01028747559ac6 Peter Zijlstra     2013-08-14  34  
a787870924dbd6 Peter Zijlstra     2013-08-14  35  static __always_inline void set_preempt_need_resched(void)
a787870924dbd6 Peter Zijlstra     2013-08-14  36  {
a787870924dbd6 Peter Zijlstra     2013-08-14  37  }
a787870924dbd6 Peter Zijlstra     2013-08-14  38  
a787870924dbd6 Peter Zijlstra     2013-08-14  39  static __always_inline void clear_preempt_need_resched(void)
a787870924dbd6 Peter Zijlstra     2013-08-14  40  {
a787870924dbd6 Peter Zijlstra     2013-08-14  41  }
a787870924dbd6 Peter Zijlstra     2013-08-14  42  
a787870924dbd6 Peter Zijlstra     2013-08-14  43  static __always_inline bool test_preempt_need_resched(void)
a787870924dbd6 Peter Zijlstra     2013-08-14  44  {
ba1f14fbe70965 Peter Zijlstra     2013-11-28  45  	return false;
a787870924dbd6 Peter Zijlstra     2013-08-14  46  }
a787870924dbd6 Peter Zijlstra     2013-08-14  47  
bdb43806589096 Peter Zijlstra     2013-09-10  48  /*
bdb43806589096 Peter Zijlstra     2013-09-10  49   * The various preempt_count add/sub methods
bdb43806589096 Peter Zijlstra     2013-09-10  50   */
bdb43806589096 Peter Zijlstra     2013-09-10  51  
bdb43806589096 Peter Zijlstra     2013-09-10  52  static __always_inline void __preempt_count_add(int val)
bdb43806589096 Peter Zijlstra     2013-09-10  53  {
bdb43806589096 Peter Zijlstra     2013-09-10  54  	*preempt_count_ptr() += val;
bdb43806589096 Peter Zijlstra     2013-09-10  55  }
bdb43806589096 Peter Zijlstra     2013-09-10  56  
bdb43806589096 Peter Zijlstra     2013-09-10  57  static __always_inline void __preempt_count_sub(int val)
bdb43806589096 Peter Zijlstra     2013-09-10  58  {
bdb43806589096 Peter Zijlstra     2013-09-10  59  	*preempt_count_ptr() -= val;
bdb43806589096 Peter Zijlstra     2013-09-10  60  }
bdb43806589096 Peter Zijlstra     2013-09-10  61  
bdb43806589096 Peter Zijlstra     2013-09-10  62  static __always_inline bool __preempt_count_dec_and_test(void)
bdb43806589096 Peter Zijlstra     2013-09-10  63  {
ba1f14fbe70965 Peter Zijlstra     2013-11-28  64  	/*
ba1f14fbe70965 Peter Zijlstra     2013-11-28  65  	 * Because of load-store architectures cannot do per-cpu atomic
ba1f14fbe70965 Peter Zijlstra     2013-11-28  66  	 * operations; we cannot use PREEMPT_NEED_RESCHED because it might get
ba1f14fbe70965 Peter Zijlstra     2013-11-28  67  	 * lost.
ba1f14fbe70965 Peter Zijlstra     2013-11-28  68  	 */
ba1f14fbe70965 Peter Zijlstra     2013-11-28 @69  	return !--*preempt_count_ptr() && tif_need_resched();
bdb43806589096 Peter Zijlstra     2013-09-10  70  }
bdb43806589096 Peter Zijlstra     2013-09-10  71  

:::::: The code at line 11 was first introduced by commit
:::::: 2e636d5e66c35dfcbaf617aa8fa963f6847478fe sched/preempt: Fix preempt_count manipulations

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
