Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF941CB4D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037238; cv=none; b=YHoc/17HnuittWJ5nj0qmJKTYLQB1V8A5MZEBgWGhOby+dNYJs3+95LHRizgc/x7kOMXXXF8ivONvgtJqmGNN1iETXSdCsQp7SpC0fCVcDrC5iOmWMn43OLelWy/MG5qPcWhsGlWrxZXbuXCljYKAkHl5CE2grcF8smfcVBzpOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037238; c=relaxed/simple;
	bh=iHVYNUmf90+LjnvNkAK1wXXzBRTxuX6lyOViDpINvBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IB3WV3h6lBJno427KiAE/7eaIOfMvWBuxEN1coagVGPZLK3/poPrS01eAngqk0R4zEILhL0b9eMlJIf5YwJC7HQlV0oUTjYqD/lS4ODI3QlSGT1p8xohwODRtSMSBjYPg+dgkDjEnenOnjXJ2+dtGIZMCcihAEZ0dnXvRcosvcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gT/qXWTJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gT/qXWTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788037235; x=1819573235;
  h=date:from:to:cc:subject:message-id;
  bh=iHVYNUmf90+LjnvNkAK1wXXzBRTxuX6lyOViDpINvBc=;
  b=gT/qXWTJJHxIiwZwykLyKXMIs+YtZipimoMbtfuvKdGW3N7SKBL2KJF7
   lTCw9tuaHM5AviOZoEVD+kchJApQ9Ee13VmZPuPmSwwXxs4VT7mvtCqDZ
   9Illp/6EDFeNCki6aRRYjC1fQ42XlV9iyOGUy+0n/0kabixxi8FXm2mUi
   GV5hM+sn9EtBOWRWjdLpj+LNk/MG3IvQCCbP5xvnbb9bTb2YOSi5CgCNe
   AWoXdfze+Zptc+ikGlF60lApi4Bd4Y2TOba7FtAEHBiLc+OELUemS2vnf
   YT3DBq6HX4GFF81TkStQUYZowNpefsHiPAjzTVz8QNgfiVPcK8LjPUn4V
   w==;
X-CSE-ConnectionGUID: SbpneeGCTg2FgVUXw6vSqQ==
X-CSE-MsgGUID: QjlrECW0QT+uH2WpLJmWQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88377067"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="88377067"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 14:00:34 -0700
X-CSE-ConnectionGUID: d3I65/zrSgqmCQfhb4kPCg==
X-CSE-MsgGUID: 6FcgblN+Tqm4VO3Z33R1pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="273719280"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Aug 2026 14:00:33 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0QAA-00000000DIK-43eZ;
	Sat, 29 Aug 2026 21:00:30 +0000
Date: Sun, 30 Aug 2026 05:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 17/20]
 include/linux/thread_info.h:104:9: error: implicit declaration of function
 'set_bit'; did you mean 'test_bit'?
Message-ID: <202608300446.zQrHlSkz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: f0f1f20d167c74ea3bf43b179ce88214100b21a5 [17/20] irqflags: Provide refcounted local_irq_*() variants
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260830/202608300446.zQrHlSkz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300446.zQrHlSkz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300446.zQrHlSkz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg.h:15,
                    from arch/csky/include/asm/cmpxchg.h:162,
                    from include/asm-generic/atomic.h:12,
                    from arch/csky/include/asm/atomic.h:199,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
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
>> include/linux/thread_info.h:104:9: error: implicit declaration of function 'set_bit'; did you mean 'test_bit'? [-Wimplicit-function-declaration]
     104 |         set_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~
         |         test_bit
   include/linux/thread_info.h: In function 'clear_ti_thread_flag':
>> include/linux/thread_info.h:109:9: error: implicit declaration of function 'clear_bit' [-Wimplicit-function-declaration]
     109 |         clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_set_ti_thread_flag':
>> include/linux/thread_info.h:123:16: error: implicit declaration of function 'test_and_set_bit' [-Wimplicit-function-declaration]
     123 |         return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'test_and_clear_ti_thread_flag':
>> include/linux/thread_info.h:128:16: error: implicit declaration of function 'test_and_clear_bit'; did you mean 'const___clear_bit'? [-Wimplicit-function-declaration]
     128 |         return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~~~
         |                const___clear_bit
   include/linux/thread_info.h: In function 'test_ti_thread_flag':
>> include/linux/bitops.h:60:47: error: implicit declaration of function '_test_bit'; did you mean 'test_bit'? [-Wimplicit-function-declaration]
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                               ^~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                ^~
   include/linux/thread_info.h:133:16: note: in expansion of macro 'test_bit'
     133 |         return test_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~
   include/linux/irqflags.h: In function 'raw_safe_halt':
   include/linux/irqflags.h:284:9: error: implicit declaration of function 'arch_safe_halt'; did you mean 'raw_safe_halt'? [-Wimplicit-function-declaration]
     284 |         arch_safe_halt();
         |         ^~~~~~~~~~~~~~
         |         raw_safe_halt
   In file included from include/asm-generic/bitops/atomic.h:68,
                    from arch/csky/include/asm/bitops.h:70:
   include/asm-generic/bitops/instrumented-atomic.h: At top level:
>> include/asm-generic/bitops/instrumented-atomic.h:26:29: warning: conflicting types for 'set_bit'; have 'void(long int,  volatile long unsigned int *)'
      26 | static __always_inline void set_bit(long nr, volatile unsigned long *addr)
         |                             ^~~~~~~
>> include/asm-generic/bitops/instrumented-atomic.h:26:29: error: static declaration of 'set_bit' follows non-static declaration
   include/linux/thread_info.h:104:9: note: previous implicit declaration of 'set_bit' with type 'void(long int,  volatile long unsigned int *)'
     104 |         set_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~
>> include/asm-generic/bitops/instrumented-atomic.h:39:29: warning: conflicting types for 'clear_bit'; have 'void(long int,  volatile long unsigned int *)'
      39 | static __always_inline void clear_bit(long nr, volatile unsigned long *addr)
         |                             ^~~~~~~~~
>> include/asm-generic/bitops/instrumented-atomic.h:39:29: error: static declaration of 'clear_bit' follows non-static declaration
   include/linux/thread_info.h:109:9: note: previous implicit declaration of 'clear_bit' with type 'void(long int,  volatile long unsigned int *)'
     109 |         clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^~~~~~~~~
>> include/asm-generic/bitops/instrumented-atomic.h:68:29: error: conflicting types for 'test_and_set_bit'; have 'bool(long int,  volatile long unsigned int *)' {aka '_Bool(long int,  volatile long unsigned int *)'}
      68 | static __always_inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
         |                             ^~~~~~~~~~~~~~~~
   include/linux/thread_info.h:123:16: note: previous implicit declaration of 'test_and_set_bit' with type 'int()'
     123 |         return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |                ^~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/instrumented-atomic.h:82:29: error: conflicting types for 'test_and_clear_bit'; have 'bool(long int,  volatile long unsigned int *)' {aka '_Bool(long int,  volatile long unsigned int *)'}
      82 | static __always_inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
         |                             ^~~~~~~~~~~~~~~~~~
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
   make[2]: *** [Makefile:1414: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +104 include/linux/thread_info.h

2889f60814e15d Thomas Gleixner     2012-05-05   96  
^1da177e4c3f41 Linus Torvalds      2005-04-16   97  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16   98   * flag set/clear/test wrappers
^1da177e4c3f41 Linus Torvalds      2005-04-16   99   * - pass TIF_xxxx constants to these functions
^1da177e4c3f41 Linus Torvalds      2005-04-16  100   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  101  
^1da177e4c3f41 Linus Torvalds      2005-04-16  102  static inline void set_ti_thread_flag(struct thread_info *ti, int flag)
^1da177e4c3f41 Linus Torvalds      2005-04-16  103  {
5548fecdff5617 Jeremy Fitzhardinge 2008-01-30 @104  	set_bit(flag, (unsigned long *)&ti->flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  105  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  106  
^1da177e4c3f41 Linus Torvalds      2005-04-16  107  static inline void clear_ti_thread_flag(struct thread_info *ti, int flag)
^1da177e4c3f41 Linus Torvalds      2005-04-16  108  {
5548fecdff5617 Jeremy Fitzhardinge 2008-01-30 @109  	clear_bit(flag, (unsigned long *)&ti->flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  110  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  111  
93ee37c2a6a97e Dave Martin         2018-04-11  112  static inline void update_ti_thread_flag(struct thread_info *ti, int flag,
93ee37c2a6a97e Dave Martin         2018-04-11  113  					 bool value)
93ee37c2a6a97e Dave Martin         2018-04-11  114  {
93ee37c2a6a97e Dave Martin         2018-04-11  115  	if (value)
93ee37c2a6a97e Dave Martin         2018-04-11  116  		set_ti_thread_flag(ti, flag);
93ee37c2a6a97e Dave Martin         2018-04-11  117  	else
93ee37c2a6a97e Dave Martin         2018-04-11  118  		clear_ti_thread_flag(ti, flag);
93ee37c2a6a97e Dave Martin         2018-04-11  119  }
93ee37c2a6a97e Dave Martin         2018-04-11  120  
^1da177e4c3f41 Linus Torvalds      2005-04-16  121  static inline int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
^1da177e4c3f41 Linus Torvalds      2005-04-16  122  {
5548fecdff5617 Jeremy Fitzhardinge 2008-01-30 @123  	return test_and_set_bit(flag, (unsigned long *)&ti->flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  124  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  125  
^1da177e4c3f41 Linus Torvalds      2005-04-16  126  static inline int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
^1da177e4c3f41 Linus Torvalds      2005-04-16  127  {
5548fecdff5617 Jeremy Fitzhardinge 2008-01-30 @128  	return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  129  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  130  

:::::: The code at line 104 was first introduced by commit
:::::: 5548fecdff5617ba3a2f09f0e585e1ac6e1bd25c x86: clean up bitops-related warnings

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
