Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A702253BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642524; cv=none; b=Ag6uVqIRrzGzjN/Bn1/v5cLFNUwjx4mcV0fz7xK8Qj90lfd+AfGyperzI8xgJbyig+gspLCjeG/wQ+YAnZHiRDE0pyvHqrpmgtaM5eTbIxCnWhHVqkjB2WtbG7G8jzxm7T+vgUj8rBxS7SyeK2KVkfPlpCUZjITYcTjgBJ8T1+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642524; c=relaxed/simple;
	bh=69qBjM2h+B9t4IGeWiuBSJe8lQatgjtxSpyhVd1/EjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUQYEhQscOeQV5Ym7uFyw1s94SIaFUbgd7veJSAbrMpBNQQY/M5eR1YZm8XIyrhItgdQQnJYk0XDj8CSl6CemHjJXbiy3er6Ey/xbnHnUBt5Goqtj3zlvhU7dA/03SuVjCK8ZWytkbig9UBNP5iUGRDBj8WeTNcjAMIA/1q78u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqRmrP1f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqRmrP1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740642521; x=1772178521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=69qBjM2h+B9t4IGeWiuBSJe8lQatgjtxSpyhVd1/EjE=;
  b=eqRmrP1f2pxAcVA6t2oM58BFJDvD3B3GyKIvuNc9oTHcrdYbN01MvF1y
   HVnRquzjKVWHHGzRhHHSCYwdpGQ1vCUvDJNnnqjxwckqXRfPWCfn2Fb7o
   zadKEuXzifbSgEtJYPyc6yvVgNh5iXoM/sVd1pIBbpgHasevV60/p2dvq
   BxSmjzk+h+nGsd901P2LHZHaseXDJ0GuSQiRbjBGHCtmOykMdeF2pLpYP
   zxmG5Rx4NABUbRn1QTWD/6tPj7lHh3gK8mcyePu5lMYooH50zZ3EGMoqH
   yaOY+qQw0r4t6EMny18CZXhyQGrHt/hPxBZXMpgW1bvHlHpeXX24fqa7l
   w==;
X-CSE-ConnectionGUID: IPbaCAXhQrKgjHUvOEh+Sg==
X-CSE-MsgGUID: 6wZ7qD3ISqqyx9lg5Fnm1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41402207"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41402207"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 23:48:38 -0800
X-CSE-ConnectionGUID: S4iy61ukS+upknrala/FXQ==
X-CSE-MsgGUID: OZceAbgLR7CdU6Kse/panQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117123531"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2025 23:48:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnYdF-000D2Q-09;
	Thu, 27 Feb 2025 07:48:33 +0000
Date: Thu, 27 Feb 2025 15:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v10 2/3] sched: Move task_mm_cid_work to mm work_struct
Message-ID: <202502271525.N9ZL15lR-lkp@intel.com>
References: <20250226070202.95062-3-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226070202.95062-3-gmonaco@redhat.com>

Hi Gabriele,

kernel test robot noticed the following build errors:

[auto build test ERROR on ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/sched-Add-prev_sum_exec_runtime-support-for-RT-DL-and-SCX-classes/20250226-150508
base:   ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
patch link:    https://lore.kernel.org/r/20250226070202.95062-3-gmonaco%40redhat.com
patch subject: [PATCH v10 2/3] sched: Move task_mm_cid_work to mm work_struct
config: arm-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271525.N9ZL15lR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271525.N9ZL15lR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271525.N9ZL15lR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from arch/arm/include/asm/ptrace.h:13,
                    from arch/arm/include/asm/processor.h:14,
                    from include/linux/sched.h:13,
                    from kernel/rseq.c:11:
   kernel/rseq.c: In function '__rseq_handle_notify_resume':
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/asm-generic/rwonce.h:44:43: note: in expansion of macro '__unqual_scalar_typeof'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
>> kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
   kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/rseq.c:423:40: note: in expansion of macro 'READ_ONCE'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                        ^~~~~~~~~
   kernel/rseq.c:423:55: error: 'struct mm_struct' has no member named 'mm_cid_next_scan'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/rseq.c:423:9: note: in expansion of macro 'if'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |         ^~
   include/linux/jiffies.h:138:33: note: in expansion of macro 'time_after'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/rseq.c:423:23: note: in expansion of macro 'time_before'
     423 |         if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
         |                       ^~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)


vim +423 kernel/rseq.c

   390	
   391	/*
   392	 * This resume handler must always be executed between any of:
   393	 * - preemption,
   394	 * - signal delivery,
   395	 * and return to user-space.
   396	 *
   397	 * This is how we can ensure that the entire rseq critical section
   398	 * will issue the commit instruction only if executed atomically with
   399	 * respect to other threads scheduled on the same CPU, and with respect
   400	 * to signal handlers.
   401	 */
   402	void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
   403	{
   404		struct task_struct *t = current;
   405		unsigned long now = jiffies;
   406		int ret, sig;
   407	
   408		if (unlikely(t->flags & PF_EXITING))
   409			return;
   410	
   411		/*
   412		 * regs is NULL if and only if the caller is in a syscall path.  Skip
   413		 * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
   414		 * kill a misbehaving userspace on debug kernels.
   415		 */
   416		if (regs) {
   417			ret = rseq_ip_fixup(regs);
   418			if (unlikely(ret < 0))
   419				goto error;
   420		}
   421		if (unlikely(rseq_update_cpu_node_id(t)))
   422			goto error;
 > 423		if (t->mm && !time_before(now, READ_ONCE(t->mm->mm_cid_next_scan)))
   424			task_queue_mm_cid(t);
   425		return;
   426	
   427	error:
   428		sig = ksig ? ksig->sig : 0;
   429		force_sigsegv(sig);
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
