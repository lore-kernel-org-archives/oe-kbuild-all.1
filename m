Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3320218C31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 05:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764395575; cv=none; b=TQAYOoOevuJkGlKFSRVrLfIHSYzav/GX7jme84ge8f9itSmVwjHpHXhPQVaifg/nNsX1RQYlnHJWOmqxw4zUKn5lYDS7uepFHcgaLBmveznBN+/6O1bFjIAc7JQOrZ7hFxg3XM9Vw57LDRtYRtyxuW7m7STsANZaDXLvU0GI0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764395575; c=relaxed/simple;
	bh=Vn40pBxBPrdtGfx86HNroNwM1f3+ClWDGkoljRoPdto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnJwFRJKOfNqWVWt5wRTe3REWFdzmSSEKeCWbGxf+Gfj48iXtwV/yuhPZusR94ea6qqpoDJsgMBtdpo8x/qHapaco/gwS2vUsAIkXvmJuyW6xwNFhXo+fcXqfgDIOV+0T6cuauFEc82SOGioJTxeUzssPar1E8CwV5GBh0qqrto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuKGEacC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuKGEacC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764395573; x=1795931573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vn40pBxBPrdtGfx86HNroNwM1f3+ClWDGkoljRoPdto=;
  b=OuKGEacCuHQOdErOfPetEI3m4yPSryW1ygAH4EgDdrrJfJG0rj53FS0p
   zGj2K+Rwwjbwda7MJ9CR1Zs7IZ0cWg234ueWbWHdW1ZTL59333BnWgbTi
   XApMyieCNwMcZ+vw3plo03avTMHZ4CUk3OEBi86fW2LHyGpouux6pyFfw
   nPAcPZIlfQ9i+tnZDZrzplc3nms8aD46Axi6d1ETBZW45cF59YlHEcC2W
   8toRmpa36MlhxByCNJQoPWWtz0KppaTcJlbk1jeC4Xo1OF/W1mzYC5+76
   M8TbmMSjMMyqnYTXbF+KnW415xqRcT4UudiliquNt8WNBNpQwvkvufVkr
   A==;
X-CSE-ConnectionGUID: qvFOqcByRFiCWMUtW/LB7Q==
X-CSE-MsgGUID: 4pokBeOBRLq2B+SgfKXfeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66441240"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66441240"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 21:52:53 -0800
X-CSE-ConnectionGUID: bFYdJCQ4Q5mdoUadyfJANw==
X-CSE-MsgGUID: kWDu048tQhS2BzIOM9yOsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="198716961"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2025 21:52:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPDt2-00000000709-3D75;
	Sat, 29 Nov 2025 05:52:48 +0000
Date: Sat, 29 Nov 2025 13:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random-v2 7/7] drivers/char/random.c:573: Error:
 unrecognized opcode `sc.d a2,s2,0(a5)'
Message-ID: <202511291321.sIwjCjQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random-v2
head:   450b86bd8eaba0d002ed7b8fae53513c0fd21433
commit: 450b86bd8eaba0d002ed7b8fae53513c0fd21433 [7/7] fixup! random: Use a lockless fast path for get_random_uXX()
config: riscv-randconfig-001-20251129 (https://download.01.org/0day-ci/archive/20251129/202511291321.sIwjCjQ2-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291321.sIwjCjQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291321.sIwjCjQ2-lkp@intel.com/

All errors (new ones prefixed by >>):

    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c: In function 'get_random_u64':
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:152:18: note: in expansion of macro 'GENMASK'
      ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0) \
                     ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:224:3: note: in expansion of macro '__arch_cmpxchg_masked'
      __arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,  \
      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:265:2: note: in expansion of macro '_arch_cmpxchg'
     _arch_cmpxchg((ptr), (o), (n),     \
     ^~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:300:2: note: in expansion of macro 'arch_cmpxchg_relaxed'
     arch_cmpxchg_relaxed((ptr), (o), (n));    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: in expansion of macro 'arch_cmpxchg64_local'
    #define raw_cmpxchg64_local arch_cmpxchg64_local
                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4998:2: note: in expansion of macro 'raw_cmpxchg64_local'
     raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:553:6: note: in expansion of macro 'cmpxchg64_local'
     if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) { \
         ^~~~~~~~~~~~~~~
   drivers/char/random.c:574:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
    DEFINE_BATCHED_ENTROPY(u64)
    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:152:18: note: in expansion of macro 'GENMASK'
      ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0) \
                     ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:230:3: note: in expansion of macro '__arch_cmpxchg_masked'
      __arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,  \
      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:265:2: note: in expansion of macro '_arch_cmpxchg'
     _arch_cmpxchg((ptr), (o), (n),     \
     ^~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:300:2: note: in expansion of macro 'arch_cmpxchg_relaxed'
     arch_cmpxchg_relaxed((ptr), (o), (n));    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: in expansion of macro 'arch_cmpxchg64_local'
    #define raw_cmpxchg64_local arch_cmpxchg64_local
                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4998:2: note: in expansion of macro 'raw_cmpxchg64_local'
     raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:553:6: note: in expansion of macro 'cmpxchg64_local'
     if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) { \
         ^~~~~~~~~~~~~~~
   drivers/char/random.c:574:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
    DEFINE_BATCHED_ENTROPY(u64)
    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from drivers/char/random.c:29:
   drivers/char/random.c: At top level:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_getrandom' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   drivers/char/random.c:1409:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(getrandom, char __user *, ubuf, size_t, len, unsigned int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   drivers/char/random.c:1409:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(getrandom, char __user *, ubuf, size_t, len, unsigned int, flags)
    ^~~~~~~~~~~~~~~
   drivers/char/random.c: Assembler messages:
   drivers/char/random.c:571: Error: unrecognized opcode `lr.d a0,0(a5)'
>> drivers/char/random.c:573: Error: unrecognized opcode `sc.d a2,s2,0(a5)'
   drivers/char/random.c:572: Error: unrecognized opcode `lr.d a0,0(a5)'
   drivers/char/random.c:574: Error: unrecognized opcode `sc.d a2,s2,0(a5)'
   drivers/char/random.c:573: Error: unrecognized opcode `lr.d a0,0(a5)'
   drivers/char/random.c:575: Error: unrecognized opcode `sc.d a2,s2,0(a5)'
   drivers/char/random.c:574: Error: unrecognized opcode `lr.d a0,0(a5)'
   drivers/char/random.c:576: Error: unrecognized opcode `sc.d a2,s2,0(a5)'


vim +573 drivers/char/random.c

3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  570  
585cd5fe9f7378 Jason A. Donenfeld 2022-09-28  571  DEFINE_BATCHED_ENTROPY(u8)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  572  DEFINE_BATCHED_ENTROPY(u16)
a890d1c657ecba Jason A. Donenfeld 2022-10-05 @573  DEFINE_BATCHED_ENTROPY(u32)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  574  DEFINE_BATCHED_ENTROPY(u64)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  575  

:::::: The code at line 573 was first introduced by commit
:::::: a890d1c657ecba73a7b28591c92587aef1be1888 random: clear new batches when bringing new CPUs online

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
