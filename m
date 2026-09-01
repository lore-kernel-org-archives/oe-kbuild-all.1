Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5738AC97
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Sep 2026 19:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291084; cv=none; b=Q3GUkwgmlXrK40pB091NV7ZiyOS4o8KgUZWcHjmHEDZb8eJHn9RJXij5IYaOS4WxDc6ArH3K0zs4ioIgZzvVtbiJ5B1C4y93/tBDCHUO001AWqG0IjWCTuulHMkeCSa9LPfurNdD7CFHZP3GAhq+l6p81KddZf8sOdPKL5gIrfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291084; c=relaxed/simple;
	bh=5fCRPub0S4/UYL3pB8MPm6/uMONEsQSybJgv/6KT9Zc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I2FAm5C55HNkrbsnhlVM6nFt8szY/FMgqC9uU4QiRw7Dg6sKX0Q7Kcx0go71bgOLg0Kyuc7WvyVhXA3bYGJ3a1eeRSgC7TWBAPP/WjUyrw0q0IY7CmZItAHQEJp1NTxeIci5K7386WCa3JU2ZoVIIrPe3mRFGEfMYp/6x7tzoK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsQSgwR2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsQSgwR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788291082; x=1819827082;
  h=date:from:to:cc:subject:message-id;
  bh=5fCRPub0S4/UYL3pB8MPm6/uMONEsQSybJgv/6KT9Zc=;
  b=KsQSgwR2CQKUNeL4JHR4VU9wnF/rwy5Zm5PiWvrssDYktPAsx33SXOFQ
   vI9swn78v9YHWqQ4JW9G9ab0/MC5XKRiPI8RcUYAWwJthHTisFBENhGKn
   /8tcUz5SL8oBnNE0s5BMj8d0XIIKDwKMPjccUqy3gETix9uB+KeIGxARU
   50tt6XlSfC93MNYRQ5+DJC0pjvTpW/REgH/Meqik35gGF/HXDAX8diHPt
   qHu7mfII3Lx8kgAtp4rr6A8FFWm++URIxcxK5Vg98QKOq9DST1HiwHM14
   NN8/bWgoP+OxJtoh4S53l9bPo2GVSGFRyJi4SyxTrz3hxiXNeTcHG9ns0
   Q==;
X-CSE-ConnectionGUID: 9C2GSRRYRI6edvt4WIMUGA==
X-CSE-MsgGUID: 28jTkmdsQkWyVkRZH6WtTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92432134"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="92432134"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:31:22 -0700
X-CSE-ConnectionGUID: LIdNv7qCRDGhZje2x8pNDw==
X-CSE-MsgGUID: xYCw+oMvTGqv89q5DPnaFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267421544"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2026 12:31:20 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1UCU-000000001NP-1bUJ;
	Tue, 01 Sep 2026 19:31:18 +0000
Date: Wed, 02 Sep 2026 03:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 18/22]
 arch/openrisc/include/asm/bitops/atomic.h:12:20: warning: conflicting types
 for 'set_bit'
Message-ID: <202609020326.EqDeXNs3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   ec3ae38eecb47043e2e2d2138e35ee22dedfced4
commit: 1f816ea094fc01ff1b9954106e93489661fb42af [18/22] irqflags: Provide refcounted local_irq_*() variants
config: openrisc-randconfig-r064-20260902 (https://download.01.org/0day-ci/archive/20260902/202609020326.EqDeXNs3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020326.EqDeXNs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020326.EqDeXNs3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/div64.h:185:6: error: implicit declaration of function 'is_power_of_2' [-Werror=implicit-function-declaration]
     185 |      is_power_of_2(__base)) {   \
         |      ^~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/asm-generic/div64.h:184:2: note: in expansion of macro 'if'
     184 |  if (__builtin_constant_p(__base) &&  \
         |  ^~
   include/linux/math64.h:106:15: note: in expansion of macro 'do_div'
     106 |  *remainder = do_div(dividend, divisor);
         |               ^~~~~~
   In file included from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/asm-generic/div64.h:187:11: error: implicit declaration of function 'ilog2' [-Werror=implicit-function-declaration]
     187 |   (n) >>= ilog2(__base);   \
         |           ^~~~~
   include/linux/math64.h:106:15: note: in expansion of macro 'do_div'
     106 |  *remainder = do_div(dividend, divisor);
         |               ^~~~~~
   In file included from arch/openrisc/include/asm/page.h:78,
                    from arch/openrisc/include/asm/processor.h:19,
                    from arch/openrisc/include/asm/thread_info.h:22,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/asm-generic/getorder.h: In function 'get_order':
   include/asm-generic/getorder.h:44:9: error: implicit declaration of function 'fls' [-Werror=implicit-function-declaration]
      44 |  return fls(size);
         |         ^~~
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/thread_info.h: In function 'set_ti_thread_flag':
   include/linux/thread_info.h:104:2: error: implicit declaration of function 'set_bit'; did you mean 'test_bit'? [-Werror=implicit-function-declaration]
     104 |  set_bit(flag, (unsigned long *)&ti->flags);
         |  ^~~~~~~
         |  test_bit
   include/linux/thread_info.h: In function 'clear_ti_thread_flag':
   include/linux/thread_info.h:109:2: error: implicit declaration of function 'clear_bit' [-Werror=implicit-function-declaration]
     109 |  clear_bit(flag, (unsigned long *)&ti->flags);
         |  ^~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_set_ti_thread_flag':
   include/linux/thread_info.h:123:9: error: implicit declaration of function 'test_and_set_bit' [-Werror=implicit-function-declaration]
     123 |  return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_clear_ti_thread_flag':
   include/linux/thread_info.h:128:9: error: implicit declaration of function 'test_and_clear_bit'; did you mean 'const___clear_bit'? [-Werror=implicit-function-declaration]
     128 |  return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~~~~~~~~~~
         |         const___clear_bit
   In file included from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/thread_info.h: In function 'test_ti_thread_flag':
   include/linux/bitops.h:60:35: error: implicit declaration of function '_test_bit'; did you mean 'test_bit'? [-Werror=implicit-function-declaration]
      60 | #define test_bit(nr, addr)  bitop(_test_bit, nr, addr)
         |                                   ^~~~~~~~~
   include/linux/bitops.h:47:25: note: in definition of macro 'bitop'
      47 |   const##op(nr, addr) : op(nr, addr))
         |                         ^~
   include/linux/thread_info.h:133:9: note: in expansion of macro 'test_bit'
     133 |  return test_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~
   In file included from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/irqflags.h: In function 'raw_safe_halt':
   include/linux/irqflags.h:299:2: error: implicit declaration of function 'arch_safe_halt'; did you mean 'raw_safe_halt'? [-Werror=implicit-function-declaration]
     299 |  arch_safe_halt();
         |  ^~~~~~~~~~~~~~
         |  raw_safe_halt
   In file included from arch/openrisc/include/asm/bitops.h:43,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   arch/openrisc/include/asm/bitops/atomic.h: At top level:
>> arch/openrisc/include/asm/bitops/atomic.h:12:20: warning: conflicting types for 'set_bit'
      12 | static inline void set_bit(int nr, volatile unsigned long *addr)
         |                    ^~~~~~~
   arch/openrisc/include/asm/bitops/atomic.h:12:20: error: static declaration of 'set_bit' follows non-static declaration
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/thread_info.h:104:2: note: previous implicit declaration of 'set_bit' was here
     104 |  set_bit(flag, (unsigned long *)&ti->flags);
         |  ^~~~~~~
   In file included from arch/openrisc/include/asm/bitops.h:43,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
>> arch/openrisc/include/asm/bitops/atomic.h:29:20: warning: conflicting types for 'clear_bit'
      29 | static inline void clear_bit(int nr, volatile unsigned long *addr)
         |                    ^~~~~~~~~
   arch/openrisc/include/asm/bitops/atomic.h:29:20: error: static declaration of 'clear_bit' follows non-static declaration
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/thread_info.h:109:2: note: previous implicit declaration of 'clear_bit' was here
     109 |  clear_bit(flag, (unsigned long *)&ti->flags);
         |  ^~~~~~~~~
   In file included from arch/openrisc/include/asm/bitops.h:43,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   arch/openrisc/include/asm/bitops/atomic.h:63:19: error: static declaration of 'test_and_set_bit' follows non-static declaration
      63 | static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
         |                   ^~~~~~~~~~~~~~~~
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/thread_info.h:123:9: note: previous implicit declaration of 'test_and_set_bit' was here
     123 |  return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~~~~~~~~
   In file included from arch/openrisc/include/asm/bitops.h:43,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   arch/openrisc/include/asm/bitops/atomic.h:83:19: error: static declaration of 'test_and_clear_bit' follows non-static declaration
      83 | static inline int test_and_clear_bit(int nr, volatile unsigned long *addr)
         |                   ^~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/thread_info.h:128:9: note: previous implicit declaration of 'test_and_clear_bit' was here
     128 |  return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~~~~~~~~~~
   In file included from kernel/bounds.c:14:
   include/linux/log2.h:45:6: error: conflicting types for 'is_power_of_2'
      45 | bool is_power_of_2(unsigned long n)
         |      ^~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/openrisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:11:
   include/asm-generic/div64.h:185:6: note: previous implicit declaration of 'is_power_of_2' was here
     185 |      is_power_of_2(__base)) {   \
         |      ^~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/asm-generic/div64.h:184:2: note: in expansion of macro 'if'
     184 |  if (__builtin_constant_p(__base) &&  \
         |  ^~
   include/linux/math64.h:106:15: note: in expansion of macro 'do_div'
     106 |  *remainder = do_div(dividend, divisor);
         |               ^~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/set_bit +12 arch/openrisc/include/asm/bitops/atomic.h

0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  11  
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12 @12  static inline void set_bit(int nr, volatile unsigned long *addr)
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  13  {
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  14  	unsigned long mask = BIT_MASK(nr);
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  15  	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  16  	unsigned long tmp;
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  17  
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  18  	__asm__ __volatile__(
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  19  		"1:	l.lwa	%0,0(%1)	\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  20  		"	l.or	%0,%0,%2	\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  21  		"	l.swa	0(%1),%0	\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  22  		"	l.bnf	1b		\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  23  		"	 l.nop			\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  24  		: "=&r"(tmp)
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  25  		: "r"(p), "r"(mask)
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  26  		: "cc", "memory");
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  27  }
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  28  
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12 @29  static inline void clear_bit(int nr, volatile unsigned long *addr)
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  30  {
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  31  	unsigned long mask = BIT_MASK(nr);
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  32  	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  33  	unsigned long tmp;
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  34  
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  35  	__asm__ __volatile__(
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  36  		"1:	l.lwa	%0,0(%1)	\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  37  		"	l.and	%0,%0,%2	\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  38  		"	l.swa	0(%1),%0	\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  39  		"	l.bnf	1b		\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  40  		"	 l.nop			\n"
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  41  		: "=&r"(tmp)
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  42  		: "r"(p), "r"(~mask)
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  43  		: "cc", "memory");
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  44  }
0e9f9fd20ce931c Stefan Kristiansson 2014-05-12  45  

:::::: The code at line 12 was first introduced by commit
:::::: 0e9f9fd20ce931cc2cf0519c56ae33fc74d656ad openrisc: add atomic bitops

:::::: TO: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
:::::: CC: Stafford Horne <shorne@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
