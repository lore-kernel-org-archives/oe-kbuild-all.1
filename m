Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23972F2E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 06:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741502874; cv=none; b=Kyw6PVYLjzTI0Vpj8MYs3ojeUsMCvEzfklRqFbO8XCd/WK6PNqPaTIz8e8Vf0aNGW83HcqxAApzEKN/Kip3d+rB+LRL3MOkmTzp1YAoIpX6b9KdMZ9krYbUB5SBm1BouTLuKFsZLKsniYVxzkX+qjMmfWjJjBqUuBNyNX47CYsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741502874; c=relaxed/simple;
	bh=WZBBMyyFkQKuDNJJ/VbNVczq+k5JSaLm2bRXMjU1vOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjxHzyS5ixPSDPu3gBPqJeE7/POUu1VLIZviws4E4zN3rflGTJdeTbrpSfIZQnUd2b01OiXyaqap69G5/NFfD5yFQ/bUb66ceOcuEakSftdcCZrw4820bEd16r6QZt9wFPB9vdbEOv46uVj17RdKSBWNZrJDxWu6tvlczFp2GXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PG0vxj+f; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG0vxj+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741502872; x=1773038872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZBBMyyFkQKuDNJJ/VbNVczq+k5JSaLm2bRXMjU1vOc=;
  b=PG0vxj+f2Dtwb1dhqwRIkfLXGbS2WiravW47AXsEFxxmpGQNGV+A/JE6
   3jZz+A4XmA+2KUP7b6laJkdXxw0WsIG7AXGJydRUBfOl1TjiNYEYqsamE
   38Q8gmt6Smr8RX4OJcTRAikRytR0pbN6XPQb04YcURvxhYalAXMGz86ZN
   WT6gEeHnNFWNssAmp68Oa7ft+7daqGL7+oG30TF9jdxlziWsWpH2LhTyg
   7VS1SJ2eQtEXQVz0SXwylEHz8lQMMzK1p1N+93ZDzwzHZzGnLoOZrVM55
   G6kwb/mzWYgGFBFcl7pUtWAt+jZG7bfRjG0SWs828cUKv2826gE9JdrRx
   w==;
X-CSE-ConnectionGUID: LN9o8NrPQ9+Ve5PDrYeHDQ==
X-CSE-MsgGUID: Zd/e4XazSaKvLbwWClS2BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="52721227"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="52721227"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 22:47:51 -0800
X-CSE-ConnectionGUID: AIAUER2/SNWkiwCeVhJc9Q==
X-CSE-MsgGUID: IjHa3li4QT2/M7Zh207L4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124946330"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2025 22:47:50 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trARw-0002mG-0w;
	Sun, 09 Mar 2025 06:47:48 +0000
Date: Sun, 9 Mar 2025 14:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 39/42] arch/x86/include/asm/cmpxchg_32.h:96:22:
 error: expected ':' or ')' before string constant
Message-ID: <202503091446.UbrezQrg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call
head:   3688c8209c27cd871041b38371e3c44e219ed75a
commit: 9718c811b321acdc79da879f8830360acf26f69e [39/42] x86/percpu: Add __asm_call() and use it in percpu cmpxchg ops
config: i386-buildonly-randconfig-003-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091446.UbrezQrg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091446.UbrezQrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091446.UbrezQrg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/cmpxchg_32.h: In function 'arch_cmpxchg64':
>> arch/x86/include/asm/cmpxchg_32.h:96:22: error: expected ':' or ')' before string constant
      96 |                  ARG("b" (n.low), "c" (n.high), [ptr] "S" (_ptr)),      \
         |                      ^~~
   arch/x86/include/asm/asm.h:214:57: note: in definition of macro 'ASM_CALL_OUTPUT'
     214 | #define ASM_CALL_OUTPUT(x...)   ASM_CALL_CONSTRAINT, ## x
         |                                                         ^
   arch/x86/include/asm/asm.h:254:9: note: in expansion of macro '__asm_call'
     254 |         __asm_call(volatile, insns, ARG(output), ARG(input), ## clobbers)
         |         ^~~~~~~~~~
   arch/x86/include/asm/asm.h:254:37: note: in expansion of macro 'ARG'
     254 |         __asm_call(volatile, insns, ARG(output), ARG(input), ## clobbers)
         |                                     ^~~
   arch/x86/include/asm/cmpxchg_32.h:93:9: note: in expansion of macro 'asm_call'
      93 |         asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",            \
         |         ^~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:96:18: note: in expansion of macro 'ARG'
      96 |                  ARG("b" (n.low), "c" (n.high), [ptr] "S" (_ptr)),      \
         |                  ^~~
   arch/x86/include/asm/cmpxchg_32.h:104:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/cmpxchg.h:143,
                    from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:257,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/cmpxchg_32.h:91:28: warning: unused variable 'n' [-Wunused-variable]
      91 |                            n = { .full = (_new), };                     \
         |                            ^
   arch/x86/include/asm/cmpxchg_32.h:104:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/cmpxchg_32.h: In function 'arch_cmpxchg64_local':
>> arch/x86/include/asm/cmpxchg_32.h:96:22: error: expected ':' or ')' before string constant
      96 |                  ARG("b" (n.low), "c" (n.high), [ptr] "S" (_ptr)),      \
         |                      ^~~
   arch/x86/include/asm/asm.h:214:57: note: in definition of macro 'ASM_CALL_OUTPUT'
     214 | #define ASM_CALL_OUTPUT(x...)   ASM_CALL_CONSTRAINT, ## x
         |                                                         ^
   arch/x86/include/asm/asm.h:254:9: note: in expansion of macro '__asm_call'
     254 |         __asm_call(volatile, insns, ARG(output), ARG(input), ## clobbers)
         |         ^~~~~~~~~~
   arch/x86/include/asm/asm.h:254:37: note: in expansion of macro 'ARG'
     254 |         __asm_call(volatile, insns, ARG(output), ARG(input), ## clobbers)
         |                                     ^~~
   arch/x86/include/asm/cmpxchg_32.h:93:9: note: in expansion of macro 'asm_call'
      93 |         asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",            \
         |         ^~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:96:18: note: in expansion of macro 'ARG'
      96 |                  ARG("b" (n.low), "c" (n.high), [ptr] "S" (_ptr)),      \
         |                  ^~~
   arch/x86/include/asm/cmpxchg_32.h:110:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     110 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/cmpxchg.h:143,
                    from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:257,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/cmpxchg_32.h:91:28: warning: unused variable 'n' [-Wunused-variable]
      91 |                            n = { .full = (_new), };                     \
         |                            ^
   arch/x86/include/asm/cmpxchg_32.h:110:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     110 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                ^~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2779073971
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1267: prepare0] Error 2 shuffle=2779073971
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2779073971
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2779073971
   make: Target 'prepare' not remade because of errors.


vim +96 arch/x86/include/asm/cmpxchg_32.h

7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   82  
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   83  /*
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   84   * Building a kernel capable running on 80386 and 80486. It may be necessary
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   85   * to simulate the cmpxchg8b on the 80386 and 80486 CPU.
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   86   */
a436ed9c5106b41 include/asm-i386/cmpxchg.h        Jeff Dike         2007-05-08   87  
33eb8ab4ec83cf0 arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-17   88  #define __arch_cmpxchg64_emu(_ptr, _old, _new, _lock_loc, _lock)	\
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   89  ({									\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   90  	union __u64_halves o = { .full = (_old), },			\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   91  			   n = { .full = (_new), };			\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   92  									\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   93  	asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",		\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   94  			     _lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8),\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   95  		 ARG("+a" (o.low), "+d" (o.high))			\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07  @96  		 ARG("b" (n.low), "c" (n.high),	[ptr] "S" (_ptr)),	\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   97  		 ARG("memory"));					\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   98  									\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   99  	o.full;								\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08  100  })
79e1dd05d1a22e9 arch/x86/include/asm/cmpxchg_32.h Arjan van de Ven  2009-09-30  101  

:::::: The code at line 96 was first introduced by commit
:::::: 9d370256c94ac8fae08150c247d35872dd4e270f x86/locking: Use asm_call() in *_cmpxchg64_emu()

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
