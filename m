Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0BD331EB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788614332; cv=none; b=ja56J6bPXo72jrGQHIghQhgNchqi/YHwH3juDa7dsRIbsg+3JfZDoV/bmcuJLcG0sE65FYbK3CxAW2pL+piP537XFaegmzVdhgtUGwZ6Vow2H3ngb2Odw6QIdPIGOYiSJN2vsHoRZRtA6lUmWHFsPpIo7gF8DbphCty5sBki+uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788614332; c=relaxed/simple;
	bh=o/YoWnZvIKZ7qcjBspuxToFmm4L5aaFWSF98jo9Av5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eHBWxUJMawKS3aukNR0lm78nZnbcHvhwFBWF0L3x0tIRu2F2V63+lfGHAgyYsFLvKsqJv2vSQRrQOTl7JCzu0Mm5j70becPIrdst7IvwKWwsVO12GHSKObumTzwo7v2cQgKLFDRls63ABPvngI6+ffvYY22inmt3mxNB4g9pDPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAwXpU0z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAwXpU0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788614320; x=1820150320;
  h=date:from:to:cc:subject:message-id;
  bh=o/YoWnZvIKZ7qcjBspuxToFmm4L5aaFWSF98jo9Av5k=;
  b=EAwXpU0zxZ+gGtbxjrlAM0oBOmARGrw1w9PyfdVHucEij0KvGXEo+plO
   ATztX5IxeW24onV6e9FL7ZteZDGGaxxXizhKL00v5CSm+FuyVOLrMbDdI
   B1CrMDAbOitOpGaD/wVMNP6CiRykQMTnZwZkj0SQNIpE9ISc6wMJjE9cX
   rhSP6OVnGtINxwCICOQ1p+VjwG1C4g16bOvMhqKKKEVqd0i8YFZzniHjv
   kcOpjV8phD+7gs+CDfFulaw4I3ANOPNYPyvIHXyiFN0rNdNh0uxdjh68R
   g5zDH7nLiDXHknjeljJ9uMEzN/SPE1VYDUADiamgCQmL0OdGTOq3VSHKy
   A==;
X-CSE-ConnectionGUID: zMi1rELTRrGGAtdf5lJgvA==
X-CSE-MsgGUID: VID33L1KRHGTNJgCIaL6SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92909363"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="92909363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 06:18:40 -0700
X-CSE-ConnectionGUID: Kmwva7TgTFuSaXVh4R1kbg==
X-CSE-MsgGUID: rj99Wx/iSPqaEGlpmRAamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270265734"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Sep 2026 06:18:39 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2qI0-000000000Vv-0sJR;
	Sat, 05 Sep 2026 13:18:36 +0000
Date: Sat, 05 Sep 2026 21:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 18/22]
 arch/parisc/include/asm/bitops.h:21:24: error: static declaration of
 'set_bit' follows non-static declaration
Message-ID: <202609052110.9zgddAMT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   60735555f9a14d6c3e0a576e9ea7bcdb883ce747
commit: 882f996705954c7f6847b915286bbd3d437c3bc7 [18/22] irqflags: Provide refcounted local_irq_*() variants
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260905/202609052110.9zgddAMT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609052110.9zgddAMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609052110.9zgddAMT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/parisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:87,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/math64.h: In function 'div_u64_rem':
   include/asm-generic/div64.h:185:13: error: implicit declaration of function 'is_power_of_2' [-Wimplicit-function-declaration]
     185 |             is_power_of_2(__base)) {                    \
         |             ^~~~~~~~~~~~~
   include/linux/math64.h:106:22: note: in expansion of macro 'do_div'
     106 |         *remainder = do_div(dividend, divisor);
         |                      ^~~~~~
   include/asm-generic/div64.h:187:25: error: implicit declaration of function 'ilog2' [-Wimplicit-function-declaration]
     187 |                 (n) >>= ilog2(__base);                  \
         |                         ^~~~~
   include/linux/math64.h:106:22: note: in expansion of macro 'do_div'
     106 |         *remainder = do_div(dividend, divisor);
         |                      ^~~~~~
   include/linux/thread_info.h: In function 'set_ti_thread_flag':
   include/linux/thread_info.h:104:9: error: implicit declaration of function 'set_bit'; did you mean 'test_bit'? [-Wimplicit-function-declaration]
     104 |         set_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~
         |         test_bit
   include/linux/thread_info.h: In function 'clear_ti_thread_flag':
   include/linux/thread_info.h:109:9: error: implicit declaration of function 'clear_bit' [-Wimplicit-function-declaration]
     109 |         clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_set_ti_thread_flag':
   include/linux/thread_info.h:123:16: error: implicit declaration of function 'test_and_set_bit' [-Wimplicit-function-declaration]
     123 |         return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_clear_ti_thread_flag':
   include/linux/thread_info.h:128:16: error: implicit declaration of function 'test_and_clear_bit'; did you mean 'const___clear_bit'? [-Wimplicit-function-declaration]
     128 |         return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~~~
         |                const___clear_bit
   include/linux/thread_info.h: In function 'test_ti_thread_flag':
   include/linux/bitops.h:60:47: error: implicit declaration of function '_test_bit'; did you mean 'test_bit'? [-Wimplicit-function-declaration]
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                               ^~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                ^~
   include/linux/thread_info.h:133:16: note: in expansion of macro 'test_bit'
     133 |         return test_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~
   include/linux/irqflags.h: In function 'raw_safe_halt':
   include/linux/irqflags.h:299:9: error: implicit declaration of function 'arch_safe_halt'; did you mean 'raw_safe_halt'? [-Wimplicit-function-declaration]
     299 |         arch_safe_halt();
         |         ^~~~~~~~~~~~~~
         |         raw_safe_halt
   arch/parisc/include/asm/bitops.h: At top level:
   arch/parisc/include/asm/bitops.h:21:24: warning: conflicting types for 'set_bit'; have 'void(int,  volatile long unsigned int *)'
      21 | static __inline__ void set_bit(int nr, volatile unsigned long * addr)
         |                        ^~~~~~~
>> arch/parisc/include/asm/bitops.h:21:24: error: static declaration of 'set_bit' follows non-static declaration
   include/linux/thread_info.h:104:9: note: previous implicit declaration of 'set_bit' with type 'void(int,  volatile long unsigned int *)'
     104 |         set_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~
   arch/parisc/include/asm/bitops.h:32:24: warning: conflicting types for 'clear_bit'; have 'void(int,  volatile long unsigned int *)'
      32 | static __inline__ void clear_bit(int nr, volatile unsigned long * addr)
         |                        ^~~~~~~~~
>> arch/parisc/include/asm/bitops.h:32:24: error: static declaration of 'clear_bit' follows non-static declaration
   include/linux/thread_info.h:109:9: note: previous implicit declaration of 'clear_bit' with type 'void(int,  volatile long unsigned int *)'
     109 |         clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~
>> arch/parisc/include/asm/bitops.h:54:23: error: static declaration of 'test_and_set_bit' follows non-static declaration
      54 | static __inline__ int test_and_set_bit(int nr, volatile unsigned long * addr)
         |                       ^~~~~~~~~~~~~~~~
   include/linux/thread_info.h:123:16: note: previous implicit declaration of 'test_and_set_bit' with type 'int()'
     123 |         return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~
>> arch/parisc/include/asm/bitops.h:72:23: error: static declaration of 'test_and_clear_bit' follows non-static declaration
      72 | static __inline__ int test_and_clear_bit(int nr, volatile unsigned long * addr)
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:128:16: note: previous implicit declaration of 'test_and_clear_bit' with type 'int()'
     128 |         return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/log2.h:45:6: error: conflicting types for 'is_power_of_2'; have 'bool(long unsigned int)' {aka '_Bool(long unsigned int)'}
      45 | bool is_power_of_2(unsigned long n)
         |      ^~~~~~~~~~~~~
   include/asm-generic/div64.h:185:13: note: previous implicit declaration of 'is_power_of_2' with type 'int()'
     185 |             is_power_of_2(__base)) {                    \
         |             ^~~~~~~~~~~~~
   include/linux/math64.h:106:22: note: in expansion of macro 'do_div'
     106 |         *remainder = do_div(dividend, divisor);
         |                      ^~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/set_bit +21 arch/parisc/include/asm/bitops.h

^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  14  
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21  15  /* See http://marc.theaimsgroup.com/?t=108826637900003 for discussion
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21  16   * on use of volatile and __*_bit() (set/clear/change):
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21  17   *	*_bit() want use of volatile.
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21  18   *	__*_bit() are "relaxed" and don't use spinlock or volatile.
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21  19   */
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21  20  
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21 @21  static __inline__ void set_bit(int nr, volatile unsigned long * addr)
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  22  {
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  23  	unsigned long mask = BIT_MASK(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  24  	unsigned long flags;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  25  
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  26  	addr += BIT_WORD(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  27  	_atomic_spin_lock_irqsave(addr, flags);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  28  	*addr |= mask;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  29  	_atomic_spin_unlock_irqrestore(addr, flags);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  30  }
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  31  
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21 @32  static __inline__ void clear_bit(int nr, volatile unsigned long * addr)
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  33  {
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  34  	unsigned long mask = BIT_MASK(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  35  	unsigned long flags;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  36  
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  37  	addr += BIT_WORD(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  38  	_atomic_spin_lock_irqsave(addr, flags);
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  39  	*addr &= ~mask;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  40  	_atomic_spin_unlock_irqrestore(addr, flags);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  41  }
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  42  
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21  43  static __inline__ void change_bit(int nr, volatile unsigned long * addr)
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  44  {
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  45  	unsigned long mask = BIT_MASK(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  46  	unsigned long flags;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  47  
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  48  	addr += BIT_WORD(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  49  	_atomic_spin_lock_irqsave(addr, flags);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  50  	*addr ^= mask;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  51  	_atomic_spin_unlock_irqrestore(addr, flags);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  52  }
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  53  
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21 @54  static __inline__ int test_and_set_bit(int nr, volatile unsigned long * addr)
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  55  {
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  56  	unsigned long mask = BIT_MASK(nr);
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  57  	unsigned long old;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  58  	unsigned long flags;
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  59  	int set;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  60  
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  61  	addr += BIT_WORD(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  62  	_atomic_spin_lock_irqsave(addr, flags);
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  63  	old = *addr;
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  64  	set = (old & mask) ? 1 : 0;
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  65  	if (!set)
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  66  		*addr = old | mask;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  67  	_atomic_spin_unlock_irqrestore(addr, flags);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  68  
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  69  	return set;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  70  }
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  71  
a366064c3ff46c include/asm-parisc/bitops.h      Grant Grundler 2005-10-21 @72  static __inline__ int test_and_clear_bit(int nr, volatile unsigned long * addr)
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  73  {
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  74  	unsigned long mask = BIT_MASK(nr);
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  75  	unsigned long old;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  76  	unsigned long flags;
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  77  	int set;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  78  
208151bfb70fb7 arch/parisc/include/asm/bitops.h Helge Deller   2020-06-14  79  	addr += BIT_WORD(nr);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  80  	_atomic_spin_lock_irqsave(addr, flags);
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  81  	old = *addr;
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  82  	set = (old & mask) ? 1 : 0;
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  83  	if (set)
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  84  		*addr = old & ~mask;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  85  	_atomic_spin_unlock_irqrestore(addr, flags);
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  86  
af5917f0cd6071 include/asm-parisc/bitops.h      Matthew Wilcox 2006-12-14  87  	return set;
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  88  }
^1da177e4c3f41 include/asm-parisc/bitops.h      Linus Torvalds 2005-04-16  89  

:::::: The code at line 21 was first introduced by commit
:::::: a366064c3ff46c985a3c7243468be197d29874dc [PARISC] Update bitops from parisc tree

:::::: TO: Grant Grundler <grundler@parisc-linux.org>
:::::: CC: Kyle McMartin <kyle@parisc-linux.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
