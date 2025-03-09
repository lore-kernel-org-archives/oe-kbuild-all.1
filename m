Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED841537C6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741499744; cv=none; b=pIDMOXoQpjcqnOXRcrJULP56g9h0XkbfA97Rz1hZ79/XzngNUX3htF4yZGpFjdR6c8TfRd6JY4Ufita+ys2vd7Y+YkUazZO5mfQ5VCpGJQDU+ljmQ0X6V5SL/ZR9PHk9aF0+v/NTmFusC4r8nZ5g4YgB9tIvxlaI1tvXD9kKfZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741499744; c=relaxed/simple;
	bh=dVPImDnZ5AJV6j11N0X2U8QnVG2s/q6zCYcWiR/WuSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rIcpwXNikLZc3iGK6eokNO0rK6a3fXVuhbWxVTn63nlcIG4JTQh//NmWakMH+BJBywg2pJ5MFtnksr2+XbJjbaKYOALAGAexMwwDJoiXEqoaR4e15feOoWal7ojzYA1wPT2zOOBBOPdzooT2yS58h5AvjyMRJYgBTrW+ZpexiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGlaojcd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGlaojcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741499742; x=1773035742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVPImDnZ5AJV6j11N0X2U8QnVG2s/q6zCYcWiR/WuSE=;
  b=CGlaojcdubplMrD4ZoalKQkQKlPKIoy/ttrkVQyQllKZcjUdfoGgsYlH
   WDbR+JQxC5uQ0ajk4OIPKtB7umqAldjwaSm79fTp6C6fU/bVMDC93uDvM
   avbQ7ANOldb8DdhqEOBXzFlk4g8QhsOoBs3fZmIU7dP7DIDoZ3I+S/7vt
   cnrUIro2nL+NPm17NnrL68ARzbERE/1QtwUjZeYD1mrtJnM1ZGlcHG++I
   3DTBoU2gDqZDOK3gYsvGKlgL3XH+D5+WqS+v0kHoxQp5cCBFy6ECzaNaI
   QzFR2pJRcaDgpT9QIbv8yWVyzalhuycgp2IrwmF92dvhdmSOjyW/RJVQo
   Q==;
X-CSE-ConnectionGUID: PmRxeG2eTxqpUs/JQeWPFg==
X-CSE-MsgGUID: QN+iOe9bTdyKZP1B8oznLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42425214"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42425214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 21:55:42 -0800
X-CSE-ConnectionGUID: Bs6sx26xSICGtIOd3jKG9g==
X-CSE-MsgGUID: 9EyT/AIBToid3YCsKbdnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="150472405"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Mar 2025 21:55:41 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr9dS-0002kE-10;
	Sun, 09 Mar 2025 05:55:38 +0000
Date: Sun, 9 Mar 2025 13:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 24/42] arch/x86/include/asm/cmpxchg_32.h:91:28:
 warning: unused variable 'n'
Message-ID: <202503091326.MktcfrUs-lkp@intel.com>
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
commit: 9d370256c94ac8fae08150c247d35872dd4e270f [24/42] x86/locking: Use asm_call() in *_cmpxchg64_emu()
config: i386-buildonly-randconfig-003-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091326.MktcfrUs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091326.MktcfrUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091326.MktcfrUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/x86/include/asm/cmpxchg_32.h: In function 'arch_cmpxchg64':
   arch/x86/include/asm/cmpxchg_32.h:104:77: error: macro "asm_call" requires 5 arguments, but only 3 given
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                                                                             ^
   In file included from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/asm.h:246: note: macro "asm_call" defined here
     246 | #define asm_call(vol, insns, output, input, clobbers...)                \
         | 
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
   arch/x86/include/asm/cmpxchg_32.h:93:9: error: 'asm_call' undeclared (first use in this function)
      93 |         asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",            \
         |         ^~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:104:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:93:9: note: each undeclared identifier is reported only once for each function it appears in
      93 |         asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",            \
         |         ^~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:104:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/cmpxchg_32.h:91:28: warning: unused variable 'n' [-Wunused-variable]
      91 |                            n = { .full = (_new), };                     \
         |                            ^
   arch/x86/include/asm/cmpxchg_32.h:104:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h: In function 'arch_cmpxchg64_local':
   arch/x86/include/asm/cmpxchg_32.h:110:53: error: macro "asm_call" requires 5 arguments, but only 3 given
     110 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                                                     ^
   In file included from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/asm.h:246: note: macro "asm_call" defined here
     246 | #define asm_call(vol, insns, output, input, clobbers...)                \
         | 
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
   arch/x86/include/asm/cmpxchg_32.h:93:9: error: 'asm_call' undeclared (first use in this function)
      93 |         asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",            \
         |         ^~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:110:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     110 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/cmpxchg_32.h:91:28: warning: unused variable 'n' [-Wunused-variable]
      91 |                            n = { .full = (_new), };                     \
         |                            ^
   arch/x86/include/asm/cmpxchg_32.h:110:16: note: in expansion of macro '__arch_cmpxchg64_emu'
     110 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/cmpxchg_32.h: In function 'arch_try_cmpxchg64':
   arch/x86/include/asm/cmpxchg_32.h:122:32: error: expected ':' or ')' before '(' token
     122 |                  ARG(CC_OUT(e) (ret), "+a" (o.low), "+d" (o.high)),     \
         |                                ^
   arch/x86/include/asm/asm.h:247:29: note: in definition of macro 'asm_call'
     247 |         asm_inline volatile(insns                                       \
         |                             ^~~~~
   arch/x86/include/asm/cmpxchg_32.h:122:18: note: in expansion of macro 'ARG'
     122 |                  ARG(CC_OUT(e) (ret), "+a" (o.low), "+d" (o.high)),     \
         |                  ^~~
   arch/x86/include/asm/cmpxchg_32.h:134:16: note: in expansion of macro '__arch_try_cmpxchg64_emu'
     134 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, LOCK_PREFIX_HERE, "lock ");
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
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
   arch/x86/include/asm/cmpxchg_32.h:117:28: warning: unused variable 'n' [-Wunused-variable]
     117 |                            n = { .full = (_new), };                     \
         |                            ^
   arch/x86/include/asm/cmpxchg_32.h:134:16: note: in expansion of macro '__arch_try_cmpxchg64_emu'
     134 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, LOCK_PREFIX_HERE, "lock ");
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/cmpxchg_32.h: In function 'arch_try_cmpxchg64_local':
   arch/x86/include/asm/cmpxchg_32.h:122:32: error: expected ':' or ')' before '(' token
     122 |                  ARG(CC_OUT(e) (ret), "+a" (o.low), "+d" (o.high)),     \
         |                                ^
   arch/x86/include/asm/asm.h:247:29: note: in definition of macro 'asm_call'
     247 |         asm_inline volatile(insns                                       \
         |                             ^~~~~
   arch/x86/include/asm/cmpxchg_32.h:122:18: note: in expansion of macro 'ARG'
     122 |                  ARG(CC_OUT(e) (ret), "+a" (o.low), "+d" (o.high)),     \
         |                  ^~~
   arch/x86/include/asm/cmpxchg_32.h:140:16: note: in expansion of macro '__arch_try_cmpxchg64_emu'
     140 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, ,);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
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
   arch/x86/include/asm/cmpxchg_32.h:117:28: warning: unused variable 'n' [-Wunused-variable]
     117 |                            n = { .full = (_new), };                     \
         |                            ^
   arch/x86/include/asm/cmpxchg_32.h:140:16: note: in expansion of macro '__arch_try_cmpxchg64_emu'
     140 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, ,);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/alternative.h:8,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/atomic64_32.h: In function 'arch_atomic64_xchg':
   arch/x86/include/asm/atomic64_32.h:114:40: error: expected ':' or ')' before '(' token
     114 |                              ARG("=&A" (o)),
         |                                        ^
   arch/x86/include/asm/asm.h:247:29: note: in definition of macro 'asm_call'
     247 |         asm_inline volatile(insns                                       \
         |                             ^~~~~
   arch/x86/include/asm/alternative.h:246:18: note: in expansion of macro 'ARG'
     246 |                  ARG(output),                                                           \
         |                  ^~~


vim +/n +91 arch/x86/include/asm/cmpxchg_32.h

7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   82  
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   83  /*
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   84   * Building a kernel capable running on 80386 and 80486. It may be necessary
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   85   * to simulate the cmpxchg8b on the 80386 and 80486 CPU.
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   86   */
a436ed9c5106b41 include/asm-i386/cmpxchg.h        Jeff Dike         2007-05-08   87  
33eb8ab4ec83cf0 arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-17   88  #define __arch_cmpxchg64_emu(_ptr, _old, _new, _lock_loc, _lock)	\
2c0b8a7578f7653 include/asm-x86/cmpxchg_32.h      Mathieu Desnoyers 2008-01-30   89  ({									\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   90  	union __u64_halves o = { .full = (_old), },			\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08  @91  			   n = { .full = (_new), };			\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   92  									\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   93  	asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",		\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   94  			     _lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8),\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   95  		 ARG("+a" (o.low), "+d" (o.high))			\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   96  		 ARG("b" (n.low), "c" (n.high),	[ptr] "S" (_ptr)),	\
9d370256c94ac8f arch/x86/include/asm/cmpxchg_32.h Josh Poimboeuf    2025-03-07   97  		 ARG("memory"));					\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   98  									\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08   99  	o.full;								\
7016cc5def44b9d arch/x86/include/asm/cmpxchg_32.h Uros Bizjak       2024-04-08  100  })
79e1dd05d1a22e9 arch/x86/include/asm/cmpxchg_32.h Arjan van de Ven  2009-09-30  101  

:::::: The code at line 91 was first introduced by commit
:::::: 7016cc5def44b9dcb28089efae4412fa0d6c78c2 locking/atomic/x86: Modernize x86_32 arch_{,try_}_cmpxchg64{,_local}()

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
