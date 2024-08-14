Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04981B013F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659996; cv=none; b=D/+o1g37IwS6VmKGACuU4DhVxl02f6U+M4j8xehtCdPrDSTbQYt9mc1mCx3K3d0sdKL1th2b7+48sN2KPapwyGlnlibNEIo1LTtOQwJlKRK1nCQV9dWqptkGO25q9TLqT6DbmQH0wid4E4H7A9xuEPA2ve24xWRr+I2vBgVDKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659996; c=relaxed/simple;
	bh=UrzsFifXoYMeKF6F6gT72Xg3qy5ud9Rj8B7cSiQIhzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM+K0b+jZTxmZ07BE9ERVg/bkV8kXNlz2lVGB1P1YqwwF0wmyv9At4RZqRrfKq/kstyx4Pqr8E0eyNrwpFfxuooGbbSSGL5s4c1W3LwvmMUv5Wz9NOvNKu/pFGg21ZuYYetTEssN7XoAvG+YyRKeIBe0Md2LP/rBqFjFWURlXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuupgZM+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuupgZM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723659994; x=1755195994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UrzsFifXoYMeKF6F6gT72Xg3qy5ud9Rj8B7cSiQIhzg=;
  b=OuupgZM+KJ7QxRw9TQqAFFugNYDUn/GxWq7wxK2maBdzuMshyyYJWkWK
   Oi+hFUyLEyRGYLwU3KSoDO7+qXT/DZHxII4DeJ61d1kKX+VjWuOots6Ud
   fvAav8y7Ln5H0ljbpOZurWzuEpV8PU6wydiNNO/nphaPif9lqkX7eznB1
   nDDGDAATn34YaDoKbnSr9l/KmoK3WCpLzEqHxT/XAB1QSls61osa8mnTJ
   Re7psFzCKLRnywuLlnFJVjRodtmOLByGyhati7vlrfPUvBB7r/leermoE
   R2ri9PaafrUTuRCZ5L6AvEHHZJJbKbX/m7t8wRVSPasF8fmgLRPM2wJgV
   w==;
X-CSE-ConnectionGUID: 3QivMcWwRP24nCsU3714OA==
X-CSE-MsgGUID: 4SbNbSiuT1ul4qcd1nr81w==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39351491"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="39351491"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:26:33 -0700
X-CSE-ConnectionGUID: wmgRLJrQRPSu8QcoHIB3KA==
X-CSE-MsgGUID: R2SPLY+TTBmzC62npR7iMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="63938093"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2024 11:26:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seIhZ-0002j5-2c;
	Wed, 14 Aug 2024 18:26:29 +0000
Date: Thu, 15 Aug 2024 02:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/4] percpu: Repurpose __percpu tag as a named
 address space qualifier
Message-ID: <202408150226.bS0BfwtN-lkp@intel.com>
References: <20240812115945.484051-4-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812115945.484051-4-ubizjak@gmail.com>

Hi Uros,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on tip/x86/core driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools tj-wq/for-next linus/master v6.11-rc3 next-20240814]
[cannot apply to tip/locking/core dennis-percpu/for-next acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/percpu-Define-pcpu_typeof/20240812-200316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240812115945.484051-4-ubizjak%40gmail.com
patch subject: [RFC PATCH v2 3/4] percpu: Repurpose __percpu tag as a named address space qualifier
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240815/202408150226.bS0BfwtN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150226.bS0BfwtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150226.bS0BfwtN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2116,
                    from arch/loongarch/kernel/asm-offsets.c:8:
>> arch/loongarch/include/asm/percpu.h:71:66: error: expected ';', ',' or ')' before '*' token
      71 | static __always_inline unsigned long __percpu_read(void __percpu *ptr, int size)
         |                                                                  ^
   arch/loongarch/include/asm/percpu.h:108:58: error: expected ';', ',' or ')' before '*' token
     108 | static __always_inline void __percpu_write(void __percpu *ptr, unsigned long val, int size)
         |                                                          ^
   include/linux/interrupt.h: In function 'this_cpu_ksoftirqd':
>> arch/loongarch/include/asm/percpu.h:173:33: error: implicit declaration of function '__percpu_read'; did you mean '_percpu_read'? [-Wimplicit-function-declaration]
     173 |         __retval = (typeof(pcp))__percpu_read(&(pcp), sizeof(pcp));     \
         |                                 ^~~~~~~~~~~~~
   arch/loongarch/include/asm/percpu.h:218:30: note: in expansion of macro '_percpu_read'
     218 | #define this_cpu_read_1(pcp) _percpu_read(pcp)
         |                              ^~~~~~~~~~~~
   include/linux/percpu-defs.h:346:30: note: in expansion of macro 'this_cpu_read_1'
     346 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro '__pcpu_size_call_return'
     520 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:623:16: note: in expansion of macro 'this_cpu_read'
     623 |         return this_cpu_read(ksoftirqd);
         |                ^~~~~~~~~~~~~
>> arch/loongarch/include/asm/percpu.h:173:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     173 |         __retval = (typeof(pcp))__percpu_read(&(pcp), sizeof(pcp));     \
         |                    ^
   arch/loongarch/include/asm/percpu.h:218:30: note: in expansion of macro '_percpu_read'
     218 | #define this_cpu_read_1(pcp) _percpu_read(pcp)
         |                              ^~~~~~~~~~~~
   include/linux/percpu-defs.h:346:30: note: in expansion of macro 'this_cpu_read_1'
     346 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro '__pcpu_size_call_return'
     520 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:623:16: note: in expansion of macro 'this_cpu_read'
     623 |         return this_cpu_read(ksoftirqd);
         |                ^~~~~~~~~~~~~
>> arch/loongarch/include/asm/percpu.h:173:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     173 |         __retval = (typeof(pcp))__percpu_read(&(pcp), sizeof(pcp));     \
         |                    ^
   arch/loongarch/include/asm/percpu.h:219:30: note: in expansion of macro '_percpu_read'
     219 | #define this_cpu_read_2(pcp) _percpu_read(pcp)
         |                              ^~~~~~~~~~~~
   include/linux/percpu-defs.h:347:30: note: in expansion of macro 'this_cpu_read_2'
     347 |         case 2: pscr_ret__ = stem##2(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro '__pcpu_size_call_return'
     520 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:623:16: note: in expansion of macro 'this_cpu_read'
     623 |         return this_cpu_read(ksoftirqd);
         |                ^~~~~~~~~~~~~
>> arch/loongarch/include/asm/percpu.h:173:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     173 |         __retval = (typeof(pcp))__percpu_read(&(pcp), sizeof(pcp));     \
         |                    ^
   arch/loongarch/include/asm/percpu.h:220:30: note: in expansion of macro '_percpu_read'
     220 | #define this_cpu_read_4(pcp) _percpu_read(pcp)
         |                              ^~~~~~~~~~~~
   include/linux/percpu-defs.h:348:30: note: in expansion of macro 'this_cpu_read_4'
     348 |         case 4: pscr_ret__ = stem##4(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro '__pcpu_size_call_return'
     520 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:623:16: note: in expansion of macro 'this_cpu_read'
     623 |         return this_cpu_read(ksoftirqd);
         |                ^~~~~~~~~~~~~
>> arch/loongarch/include/asm/percpu.h:173:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     173 |         __retval = (typeof(pcp))__percpu_read(&(pcp), sizeof(pcp));     \
         |                    ^
   arch/loongarch/include/asm/percpu.h:221:30: note: in expansion of macro '_percpu_read'
     221 | #define this_cpu_read_8(pcp) _percpu_read(pcp)
         |                              ^~~~~~~~~~~~
   include/linux/percpu-defs.h:349:30: note: in expansion of macro 'this_cpu_read_8'
     349 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:520:41: note: in expansion of macro '__pcpu_size_call_return'
     520 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:623:16: note: in expansion of macro 'this_cpu_read'
     623 |         return this_cpu_read(ksoftirqd);
         |                ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +71 arch/loongarch/include/asm/percpu.h

46859ac8af52ae Huacai Chen 2022-05-31   70  
ee2daf7102f420 Huacai Chen 2023-11-21  @71  static __always_inline unsigned long __percpu_read(void __percpu *ptr, int size)
46859ac8af52ae Huacai Chen 2022-05-31   72  {
46859ac8af52ae Huacai Chen 2022-05-31   73  	unsigned long ret;
46859ac8af52ae Huacai Chen 2022-05-31   74  
46859ac8af52ae Huacai Chen 2022-05-31   75  	switch (size) {
46859ac8af52ae Huacai Chen 2022-05-31   76  	case 1:
46859ac8af52ae Huacai Chen 2022-05-31   77  		__asm__ __volatile__ ("ldx.b %[ret], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31   78  		: [ret] "=&r"(ret)
46859ac8af52ae Huacai Chen 2022-05-31   79  		: [ptr] "r"(ptr)
46859ac8af52ae Huacai Chen 2022-05-31   80  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31   81  		break;
46859ac8af52ae Huacai Chen 2022-05-31   82  	case 2:
46859ac8af52ae Huacai Chen 2022-05-31   83  		__asm__ __volatile__ ("ldx.h %[ret], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31   84  		: [ret] "=&r"(ret)
46859ac8af52ae Huacai Chen 2022-05-31   85  		: [ptr] "r"(ptr)
46859ac8af52ae Huacai Chen 2022-05-31   86  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31   87  		break;
46859ac8af52ae Huacai Chen 2022-05-31   88  	case 4:
46859ac8af52ae Huacai Chen 2022-05-31   89  		__asm__ __volatile__ ("ldx.w %[ret], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31   90  		: [ret] "=&r"(ret)
46859ac8af52ae Huacai Chen 2022-05-31   91  		: [ptr] "r"(ptr)
46859ac8af52ae Huacai Chen 2022-05-31   92  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31   93  		break;
46859ac8af52ae Huacai Chen 2022-05-31   94  	case 8:
46859ac8af52ae Huacai Chen 2022-05-31   95  		__asm__ __volatile__ ("ldx.d %[ret], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31   96  		: [ret] "=&r"(ret)
46859ac8af52ae Huacai Chen 2022-05-31   97  		: [ptr] "r"(ptr)
46859ac8af52ae Huacai Chen 2022-05-31   98  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31   99  		break;
46859ac8af52ae Huacai Chen 2022-05-31  100  	default:
46859ac8af52ae Huacai Chen 2022-05-31  101  		ret = 0;
46859ac8af52ae Huacai Chen 2022-05-31  102  		BUILD_BUG();
46859ac8af52ae Huacai Chen 2022-05-31  103  	}
46859ac8af52ae Huacai Chen 2022-05-31  104  
46859ac8af52ae Huacai Chen 2022-05-31  105  	return ret;
46859ac8af52ae Huacai Chen 2022-05-31  106  }
46859ac8af52ae Huacai Chen 2022-05-31  107  
ee2daf7102f420 Huacai Chen 2023-11-21  108  static __always_inline void __percpu_write(void __percpu *ptr, unsigned long val, int size)
46859ac8af52ae Huacai Chen 2022-05-31  109  {
46859ac8af52ae Huacai Chen 2022-05-31  110  	switch (size) {
46859ac8af52ae Huacai Chen 2022-05-31  111  	case 1:
46859ac8af52ae Huacai Chen 2022-05-31  112  		__asm__ __volatile__("stx.b %[val], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31  113  		:
46859ac8af52ae Huacai Chen 2022-05-31  114  		: [val] "r" (val), [ptr] "r" (ptr)
46859ac8af52ae Huacai Chen 2022-05-31  115  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31  116  		break;
46859ac8af52ae Huacai Chen 2022-05-31  117  	case 2:
46859ac8af52ae Huacai Chen 2022-05-31  118  		__asm__ __volatile__("stx.h %[val], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31  119  		:
46859ac8af52ae Huacai Chen 2022-05-31  120  		: [val] "r" (val), [ptr] "r" (ptr)
46859ac8af52ae Huacai Chen 2022-05-31  121  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31  122  		break;
46859ac8af52ae Huacai Chen 2022-05-31  123  	case 4:
46859ac8af52ae Huacai Chen 2022-05-31  124  		__asm__ __volatile__("stx.w %[val], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31  125  		:
46859ac8af52ae Huacai Chen 2022-05-31  126  		: [val] "r" (val), [ptr] "r" (ptr)
46859ac8af52ae Huacai Chen 2022-05-31  127  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31  128  		break;
46859ac8af52ae Huacai Chen 2022-05-31  129  	case 8:
46859ac8af52ae Huacai Chen 2022-05-31  130  		__asm__ __volatile__("stx.d %[val], $r21, %[ptr]	\n"
46859ac8af52ae Huacai Chen 2022-05-31  131  		:
46859ac8af52ae Huacai Chen 2022-05-31  132  		: [val] "r" (val), [ptr] "r" (ptr)
46859ac8af52ae Huacai Chen 2022-05-31  133  		: "memory");
46859ac8af52ae Huacai Chen 2022-05-31  134  		break;
46859ac8af52ae Huacai Chen 2022-05-31  135  	default:
46859ac8af52ae Huacai Chen 2022-05-31  136  		BUILD_BUG();
46859ac8af52ae Huacai Chen 2022-05-31  137  	}
46859ac8af52ae Huacai Chen 2022-05-31  138  }
46859ac8af52ae Huacai Chen 2022-05-31  139  
ee2daf7102f420 Huacai Chen 2023-11-21  140  static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val, int size)
46859ac8af52ae Huacai Chen 2022-05-31  141  {
46859ac8af52ae Huacai Chen 2022-05-31  142  	switch (size) {
720dc7ab252bbd Huacai Chen 2022-08-25  143  	case 1:
720dc7ab252bbd Huacai Chen 2022-08-25  144  	case 2:
720dc7ab252bbd Huacai Chen 2022-08-25  145  		return __xchg_small((volatile void *)ptr, val, size);
720dc7ab252bbd Huacai Chen 2022-08-25  146  
46859ac8af52ae Huacai Chen 2022-05-31  147  	case 4:
46859ac8af52ae Huacai Chen 2022-05-31  148  		return __xchg_asm("amswap.w", (volatile u32 *)ptr, (u32)val);
46859ac8af52ae Huacai Chen 2022-05-31  149  
46859ac8af52ae Huacai Chen 2022-05-31  150  	case 8:
46859ac8af52ae Huacai Chen 2022-05-31  151  		return __xchg_asm("amswap.d", (volatile u64 *)ptr, (u64)val);
46859ac8af52ae Huacai Chen 2022-05-31  152  
46859ac8af52ae Huacai Chen 2022-05-31  153  	default:
46859ac8af52ae Huacai Chen 2022-05-31  154  		BUILD_BUG();
46859ac8af52ae Huacai Chen 2022-05-31  155  	}
46859ac8af52ae Huacai Chen 2022-05-31  156  
46859ac8af52ae Huacai Chen 2022-05-31  157  	return 0;
46859ac8af52ae Huacai Chen 2022-05-31  158  }
46859ac8af52ae Huacai Chen 2022-05-31  159  
46859ac8af52ae Huacai Chen 2022-05-31  160  /* this_cpu_cmpxchg */
46859ac8af52ae Huacai Chen 2022-05-31  161  #define _protect_cmpxchg_local(pcp, o, n)			\
46859ac8af52ae Huacai Chen 2022-05-31  162  ({								\
46859ac8af52ae Huacai Chen 2022-05-31  163  	typeof(*raw_cpu_ptr(&(pcp))) __ret;			\
46859ac8af52ae Huacai Chen 2022-05-31  164  	preempt_disable_notrace();				\
46859ac8af52ae Huacai Chen 2022-05-31  165  	__ret = cmpxchg_local(raw_cpu_ptr(&(pcp)), o, n);	\
46859ac8af52ae Huacai Chen 2022-05-31  166  	preempt_enable_notrace();				\
46859ac8af52ae Huacai Chen 2022-05-31  167  	__ret;							\
46859ac8af52ae Huacai Chen 2022-05-31  168  })
46859ac8af52ae Huacai Chen 2022-05-31  169  
46859ac8af52ae Huacai Chen 2022-05-31  170  #define _percpu_read(pcp)						\
46859ac8af52ae Huacai Chen 2022-05-31  171  ({									\
46859ac8af52ae Huacai Chen 2022-05-31  172  	typeof(pcp) __retval;						\
46859ac8af52ae Huacai Chen 2022-05-31 @173  	__retval = (typeof(pcp))__percpu_read(&(pcp), sizeof(pcp));	\
46859ac8af52ae Huacai Chen 2022-05-31  174  	__retval;							\
46859ac8af52ae Huacai Chen 2022-05-31  175  })
46859ac8af52ae Huacai Chen 2022-05-31  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
