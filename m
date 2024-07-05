Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A44634
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 00:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720138408; cv=none; b=QcoOsQXSgBsQ7V8ygOwTsBVaxKJIgSv+PVMBHdEv2OE73zUrP+16n8YJMZyo4YJQbACs1WWOIiZqoPdqkJxwnu/7T9EMlwG+YNYFNLp/0MrLQ4Lsy4LMeUSTzxd1u+jUlCO22NzVWziNZ9OHZmIt0+JGI6T30vDHXyBB5/gbQ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720138408; c=relaxed/simple;
	bh=Tn2TxcfmUKqj2g9hM8pOpy9+msn5PHq9g/eG1UHFMMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IdETXBg7fAiNlcjF3y7cg89w3IDeR7L6O/AASqj9LurQ3Ub5bOnWIKGuA2lEQN0/Vc8+6JBlnWhh5/UsNIWkkYupY9N6r2scn8lMSnbDKE41Od3oDIuw40K84kFd46w3QO+okUUdEW1lN/KdBxvMOAa2AmLvsMrHMQtd5WIxTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRRXZsrR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRRXZsrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720138405; x=1751674405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tn2TxcfmUKqj2g9hM8pOpy9+msn5PHq9g/eG1UHFMMQ=;
  b=nRRXZsrR3dzAwSOMb4+xoZir8p6I4RM7vwY32ccjj5fvLABzF0Hf0g6r
   Br9nGJqi0Q/DKfqpAY3RImH1tvoYoatzGcqTLdo3aB6WhPyASMJNeN/zx
   z47W9GdUDI1ks40S1U3jnqPRLvH2md3L/1wzyYuvTKthfrPYlVN63HxCr
   COmW3z4XjtQ/uINxmjgJpEGIICv7PByCLSoxmuNYQxd6eT8YzboA46vSM
   xuqnC2BICU9PeNx5cDXt0PFAQ3yZjrQl0LezJFsDcOyAcFfOOk8QAJfsa
   0I3+Cv3w377YmQRkwPqKedok5FucrUfZcVYjRSsjOolluqkHGGEGt/7cA
   A==;
X-CSE-ConnectionGUID: JLQYMvyqSqK6zF0YklCKRg==
X-CSE-MsgGUID: +T+KVArcTSGAw+qYk12YGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20329416"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="20329416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 17:13:25 -0700
X-CSE-ConnectionGUID: uSGkrpXbRgyOrcpHYEiJ9g==
X-CSE-MsgGUID: VbGkT853SiK7OGMga+6Ptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46836085"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2024 17:13:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPWZk-000Rfi-0t;
	Fri, 05 Jul 2024 00:13:20 +0000
Date: Fri, 5 Jul 2024 08:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 1907/10451] include/linux/iopoll.h:179:35: error:
 implicit declaration of function 'readq'; did you mean 'readw'?
Message-ID: <202407050803.hJqMoDsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: cabff60ca77da6cb460988e2af40bde95776d92b [1907/10451] cache: Add StarFive StarLink cache management
config: riscv-randconfig-r133-20240704 (https://download.01.org/0day-ci/archive/20240705/202407050803.hJqMoDsx-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407050803.hJqMoDsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050803.hJqMoDsx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cache/starfive_starlink_cache.c:12:
   drivers/cache/starfive_starlink_cache.c: In function 'starlink_cache_flush_complete':
>> include/linux/iopoll.h:179:35: error: implicit declaration of function 'readq'; did you mean 'readw'? [-Werror=implicit-function-declaration]
     179 |         readx_poll_timeout_atomic(readq, addr, val, cond, delay_us, timeout_us)
         |                                   ^~~~~
   include/linux/iopoll.h:97:25: note: in definition of macro 'read_poll_timeout_atomic'
      97 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:179:9: note: in expansion of macro 'readx_poll_timeout_atomic'
     179 |         readx_poll_timeout_atomic(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:40:15: note: in expansion of macro 'readq_poll_timeout_atomic'
      40 |         ret = readq_poll_timeout_atomic(ctl, v, !(v & STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK),
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c: In function 'starlink_cache_dma_cache_wback':
>> drivers/cache/starfive_starlink_cache.c:49:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |         ^~~~~~
         |         writel
   In file included from <command-line>:
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:49:16: note: in expansion of macro 'FIELD_PREP'
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:57: note: in expansion of macro 'GENMASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^~~~~~~
   drivers/cache/starfive_starlink_cache.c:49:27: note: in expansion of macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:49:16: note: in expansion of macro 'FIELD_PREP'
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:57: note: in expansion of macro 'GENMASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^~~~~~~
   drivers/cache/starfive_starlink_cache.c:49:27: note: in expansion of macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:49:16: note: in expansion of macro 'FIELD_PREP'
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:57: note: in expansion of macro 'GENMASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^~~~~~~
   drivers/cache/starfive_starlink_cache.c:49:27: note: in expansion of macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
--
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:81:16: note: in expansion of macro 'FIELD_PREP'
      81 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:57: note: in expansion of macro 'GENMASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^~~~~~~
   drivers/cache/starfive_starlink_cache.c:81:27: note: in expansion of macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      81 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:81:16: note: in expansion of macro 'FIELD_PREP'
      81 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:57: note: in expansion of macro 'GENMASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^~~~~~~
   drivers/cache/starfive_starlink_cache.c:81:27: note: in expansion of macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      81 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/cache/starfive_starlink_cache.c:81:16: note: in expansion of macro 'FIELD_PREP'
      81 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                ^~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:57: note: in expansion of macro 'GENMASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^~~~~~~
   drivers/cache/starfive_starlink_cache.c:81:27: note: in expansion of macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      81 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:116:63: note: in definition of macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:57: note: in expansion of macro 'GENMASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^~~~~~~
   drivers/cache/starfive_starlink_cache.c:81:27: note: in expansion of macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      81 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c: At top level:
>> drivers/cache/starfive_starlink_cache.c:93:18: error: initialization of 'void (*)(phys_addr_t,  size_t)' {aka 'void (*)(unsigned int,  unsigned int)'} from incompatible pointer type 'void (*)(phys_addr_t,  long unsigned int)' {aka 'void (*)(unsigned int,  long unsigned int)'} [-Werror=incompatible-pointer-types]
      93 |         .wback = &starlink_cache_dma_cache_wback,
         |                  ^
   drivers/cache/starfive_starlink_cache.c:93:18: note: (near initialization for 'starlink_cache_ops.wback')
   drivers/cache/starfive_starlink_cache.c:94:16: error: initialization of 'void (*)(phys_addr_t,  size_t)' {aka 'void (*)(unsigned int,  unsigned int)'} from incompatible pointer type 'void (*)(phys_addr_t,  long unsigned int)' {aka 'void (*)(unsigned int,  long unsigned int)'} [-Werror=incompatible-pointer-types]
      94 |         .inv = &starlink_cache_dma_cache_invalidate,
         |                ^
   drivers/cache/starfive_starlink_cache.c:94:16: note: (near initialization for 'starlink_cache_ops.inv')
   drivers/cache/starfive_starlink_cache.c:95:22: error: initialization of 'void (*)(phys_addr_t,  size_t)' {aka 'void (*)(unsigned int,  unsigned int)'} from incompatible pointer type 'void (*)(phys_addr_t,  long unsigned int)' {aka 'void (*)(unsigned int,  long unsigned int)'} [-Werror=incompatible-pointer-types]
      95 |         .wback_inv = &starlink_cache_dma_cache_wback_inv,
         |                      ^
   drivers/cache/starfive_starlink_cache.c:95:22: note: (near initialization for 'starlink_cache_ops.wback_inv')
   drivers/cache/starfive_starlink_cache.c: In function 'starlink_cache_dma_cache_wback_inv':
>> include/linux/compiler_types.h:487:45: error: call to '__compiletime_assert_479' declared with attribute error: FIELD_PREP: mask is zero
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:468:25: note: in definition of macro '__compiletime_assert'
     468 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:79:16: note: in expansion of macro 'FIELD_PREP'
      79 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ^~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c: In function 'starlink_cache_dma_cache_invalidate':
   include/linux/compiler_types.h:487:45: error: call to '__compiletime_assert_464' declared with attribute error: FIELD_PREP: mask is zero
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:468:25: note: in definition of macro '__compiletime_assert'
     468 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:64:16: note: in expansion of macro 'FIELD_PREP'
      64 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ^~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c: In function 'starlink_cache_dma_cache_wback':
   include/linux/compiler_types.h:487:45: error: call to '__compiletime_assert_449' declared with attribute error: FIELD_PREP: mask is zero
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:468:25: note: in definition of macro '__compiletime_assert'
     468 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:49:16: note: in expansion of macro 'FIELD_PREP'
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +179 include/linux/iopoll.h

57a29df341466b Kai-Heng Feng         2020-04-25  115  
54c523127bcca9 Matt Wagantall        2014-12-15  116  /**
54c523127bcca9 Matt Wagantall        2014-12-15  117   * readx_poll_timeout - Periodically poll an address until a condition is met or a timeout occurs
54c523127bcca9 Matt Wagantall        2014-12-15  118   * @op: accessor function (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall        2014-12-15  119   * @addr: Address to poll
54c523127bcca9 Matt Wagantall        2014-12-15  120   * @val: Variable to read the value into
54c523127bcca9 Matt Wagantall        2014-12-15  121   * @cond: Break condition (usually involving @val)
54c523127bcca9 Matt Wagantall        2014-12-15  122   * @sleep_us: Maximum time to sleep between reads in us (0
54c523127bcca9 Matt Wagantall        2014-12-15  123   *            tight-loops).  Should be less than ~20ms since usleep_range
458f69ef36656d Mauro Carvalho Chehab 2019-06-12  124   *            is used (see Documentation/timers/timers-howto.rst).
54c523127bcca9 Matt Wagantall        2014-12-15  125   * @timeout_us: Timeout in us, 0 means never timeout
54c523127bcca9 Matt Wagantall        2014-12-15  126   *
54c523127bcca9 Matt Wagantall        2014-12-15  127   * Returns 0 on success and -ETIMEDOUT upon a timeout. In either
54c523127bcca9 Matt Wagantall        2014-12-15  128   * case, the last read value at @addr is stored in @val. Must not
54c523127bcca9 Matt Wagantall        2014-12-15  129   * be called from atomic context if sleep_us or timeout_us are used.
54c523127bcca9 Matt Wagantall        2014-12-15  130   *
54c523127bcca9 Matt Wagantall        2014-12-15  131   * When available, you'll probably want to use one of the specialized
54c523127bcca9 Matt Wagantall        2014-12-15  132   * macros defined below rather than this macro directly.
54c523127bcca9 Matt Wagantall        2014-12-15  133   */
54c523127bcca9 Matt Wagantall        2014-12-15  134  #define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)	\
eaa6b01024a74a Dejin Zheng           2020-03-23  135  	read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall        2014-12-15  136  
54c523127bcca9 Matt Wagantall        2014-12-15  137  /**
54c523127bcca9 Matt Wagantall        2014-12-15  138   * readx_poll_timeout_atomic - Periodically poll an address until a condition is met or a timeout occurs
54c523127bcca9 Matt Wagantall        2014-12-15  139   * @op: accessor function (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall        2014-12-15  140   * @addr: Address to poll
54c523127bcca9 Matt Wagantall        2014-12-15  141   * @val: Variable to read the value into
54c523127bcca9 Matt Wagantall        2014-12-15  142   * @cond: Break condition (usually involving @val)
54c523127bcca9 Matt Wagantall        2014-12-15  143   * @delay_us: Time to udelay between reads in us (0 tight-loops).  Should
54c523127bcca9 Matt Wagantall        2014-12-15  144   *            be less than ~10us since udelay is used (see
458f69ef36656d Mauro Carvalho Chehab 2019-06-12  145   *            Documentation/timers/timers-howto.rst).
54c523127bcca9 Matt Wagantall        2014-12-15  146   * @timeout_us: Timeout in us, 0 means never timeout
54c523127bcca9 Matt Wagantall        2014-12-15  147   *
54c523127bcca9 Matt Wagantall        2014-12-15  148   * Returns 0 on success and -ETIMEDOUT upon a timeout. In either
54c523127bcca9 Matt Wagantall        2014-12-15  149   * case, the last read value at @addr is stored in @val.
54c523127bcca9 Matt Wagantall        2014-12-15  150   *
54c523127bcca9 Matt Wagantall        2014-12-15  151   * When available, you'll probably want to use one of the specialized
54c523127bcca9 Matt Wagantall        2014-12-15  152   * macros defined below rather than this macro directly.
54c523127bcca9 Matt Wagantall        2014-12-15  153   */
54c523127bcca9 Matt Wagantall        2014-12-15  154  #define readx_poll_timeout_atomic(op, addr, val, cond, delay_us, timeout_us) \
57a29df341466b Kai-Heng Feng         2020-04-25  155  	read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall        2014-12-15  156  
54c523127bcca9 Matt Wagantall        2014-12-15  157  #define readb_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15  158  	readx_poll_timeout(readb, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  159  
54c523127bcca9 Matt Wagantall        2014-12-15  160  #define readb_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15  161  	readx_poll_timeout_atomic(readb, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  162  
54c523127bcca9 Matt Wagantall        2014-12-15  163  #define readw_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15  164  	readx_poll_timeout(readw, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  165  
54c523127bcca9 Matt Wagantall        2014-12-15  166  #define readw_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15  167  	readx_poll_timeout_atomic(readw, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  168  
54c523127bcca9 Matt Wagantall        2014-12-15  169  #define readl_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15  170  	readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  171  
54c523127bcca9 Matt Wagantall        2014-12-15  172  #define readl_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15  173  	readx_poll_timeout_atomic(readl, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  174  
54c523127bcca9 Matt Wagantall        2014-12-15  175  #define readq_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15  176  	readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  177  
54c523127bcca9 Matt Wagantall        2014-12-15  178  #define readq_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall        2014-12-15 @179  	readx_poll_timeout_atomic(readq, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall        2014-12-15  180  

:::::: The code at line 179 was first introduced by commit
:::::: 54c523127bcca986c6f9b04c7b56a949ea011899 iopoll: Introduce memory-mapped IO polling macros

:::::: TO: Matt Wagantall <mattw@codeaurora.org>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
