Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D3B222560
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 04:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764391193; cv=none; b=WD01IPxZ6hXcrLqRmeThSM7qbe+DEYRGSANsXAKQBQDVdJmDJ3WxjuIHNLtwtgH0Muee5M2iuyr68T7rFdTgNf/TradtT+TV42XHg0dwzATRbpZRTAAZFHZbItFSarF9t57N0a7ddXT91KzGBCOyLjrDq4oxZR0s/cy0V1wjHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764391193; c=relaxed/simple;
	bh=zzgMhtSPj7+sk3YumaE0xDtwmDzguc8dc4Th4KLw+Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+TmWwi8Rmvgkn3i0KKDjK2HWD0AoRD9bLNW6KazS4XuO2s+CI14+OGJR+KiOJ72Fs6pwGwxfJj7KllmkPUN486mdM0K40NE8yiMAYfSQVEZyTHm6FXLeZXydQX2jYmSfF+7AruroDGOeCAIXXYyKLMTeDWLNtkJXGBTC0hs3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laHjNwx9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laHjNwx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764391191; x=1795927191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzgMhtSPj7+sk3YumaE0xDtwmDzguc8dc4Th4KLw+Oo=;
  b=laHjNwx99DQApXnChSMHbnfRGZ/gdovWxejkeVArA9CF2ofhx0nLp6gf
   Z5Nu9e0PofrUFSk/TYpg0guAioaRw5HWpDc7uSyJkGVj5GOaNkljQLlDb
   ziHru6tJ2OAPY4H+tjHKF1kpxpf7WQv8gw+g8CBIjOsW1UN0TKwq77NbR
   RpQ4DjtluxWE9XrQpofXBcMdbXBrfCYsZTXUvd4vsUDtO4WX/js4j2c00
   1PcTEJhTj/3qkYfXo8/DsZU6Sd+lkSr7GqsLanSNOE2EDMUv9+1Hpt5aw
   GKFxRMZsv/7VuTiKWiZs6PVODGoexpF+Rgmwo0x20t0dSvRuffTFugQIn
   A==;
X-CSE-ConnectionGUID: ZeJG/mJTRoGfJ1enzaB1iA==
X-CSE-MsgGUID: ZyKsJMYoQwe7TsaKTpvtFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70261749"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="70261749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 20:39:50 -0800
X-CSE-ConnectionGUID: nzmzLE/wQyKpL/LFkoY2SA==
X-CSE-MsgGUID: JDnv825OTbyB1gzmDS6P1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="192852324"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 20:39:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPCkM-000000006yD-44Js;
	Sat, 29 Nov 2025 04:39:46 +0000
Date: Sat, 29 Nov 2025 12:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random-v2 5/7] drivers/char/random.c:571: Error:
 unrecognized opcode `lr.d a0,0(a5)'
Message-ID: <202511291207.GmmKX7FV-lkp@intel.com>
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
commit: 9f7fa197442610db1e5e9a38c3a1e21520593843 [5/7] random: Plug race in preceding patch
config: riscv-randconfig-001-20251129 (https://download.01.org/0day-ci/archive/20251129/202511291207.GmmKX7FV-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291207.GmmKX7FV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291207.GmmKX7FV-lkp@intel.com/

All errors (new ones prefixed by >>):

    DEFINE_BATCHED_ENTROPY(u32)
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
     if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) { \
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
     if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) { \
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
>> drivers/char/random.c:571: Error: unrecognized opcode `lr.d a0,0(a5)'
   drivers/char/random.c:573: Error: unrecognized opcode `sc.d a2,a6,0(a5)'
   drivers/char/random.c:572: Error: unrecognized opcode `lr.d a0,0(a5)'
   drivers/char/random.c:574: Error: unrecognized opcode `sc.d a2,a6,0(a5)'
   drivers/char/random.c:573: Error: unrecognized opcode `lr.d a0,0(a5)'
   drivers/char/random.c:575: Error: unrecognized opcode `sc.d a2,a6,0(a5)'
   drivers/char/random.c:574: Error: unrecognized opcode `lr.d a0,0(a5)'
   drivers/char/random.c:576: Error: unrecognized opcode `sc.d a2,a6,0(a5)'


vim +571 drivers/char/random.c

3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  570  
585cd5fe9f7378 Jason A. Donenfeld 2022-09-28 @571  DEFINE_BATCHED_ENTROPY(u8)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  572  DEFINE_BATCHED_ENTROPY(u16)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  573  DEFINE_BATCHED_ENTROPY(u32)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  574  DEFINE_BATCHED_ENTROPY(u64)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  575  

:::::: The code at line 571 was first introduced by commit
:::::: 585cd5fe9f7378601b1d4915ad6e9088333b5e5e random: add 8-bit and 16-bit batches

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
