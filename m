Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04EF1F419F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765499880; cv=none; b=LSnFO6VoKMjaUp7mRzN06wr3sU+wug8fPsqXPNYE1USNSeIBggbTFz5AXirRvJiuyRA++bzN0GiZOQqXeoMQrKKKzk1F1ugGAn2S0jtKgOvjqUZSq3LYtXn/f4PUC/753QQCrrZWt0PlwvmfswJcO0T9i5D3jYcqTCpF7NudZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765499880; c=relaxed/simple;
	bh=JwZiZMDoKbjIiR7JYdvkmdn+uMJ9wr8oac9l3SfZ5kI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kg+oHuE2XMQTQpQ39EBXOKkWMQbLjTThFYQ4Vwm0DS9J5ZL7qEI6z3T8Fm8qMYb5jV6XN22USvmg60zho1gj5bGU6WSV3HMxBq14xcxsTmdlDWJlRKYYZQHotzBgLZJmK94P63oEoQ8m8Yu4qXGgE06vAUxqen6tI93MjUv/Qx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5xIW13k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5xIW13k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765499879; x=1797035879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwZiZMDoKbjIiR7JYdvkmdn+uMJ9wr8oac9l3SfZ5kI=;
  b=F5xIW13kI112NqP7sZK9WqHPcvQtLJenN6O5/rWXWNrMKbhiOTtMQy82
   rxxUTToUqi1mAGr79+TuLQCxEAztBY7NDAM2yps0alrjChYO/cVW3rAGu
   RLPOIPh0f+z0c+IrqLnPkyshF8nZG6VmnutNcVJk/2x6xOV536NaDxphv
   zQEL92GKrcn1xmuC2+ugKn2De+etlGVwoneYFWjz89QShgpYcJ+7qdqCu
   nc7I/F3uCxOcfOxI+1ASAn8oWPHv34dfgfnxB+wsczRW5CJVhvp1FHpua
   0vEzCSZXAN9BMwd9hrr8SpEOUFEi1b7hTq0aKl5XesA8fKY0I0j7a8B6P
   Q==;
X-CSE-ConnectionGUID: QB8+lLrVTBuQ6vfdGlcdRg==
X-CSE-MsgGUID: XaoELfLaSAujVYfrYHaEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67226916"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67226916"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:37:58 -0800
X-CSE-ConnectionGUID: BUDw9d9RSmOcDf7vMFb+Kg==
X-CSE-MsgGUID: t5LZEGRESCinkUrS0gLcdA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 16:37:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrAR-000000005FQ-0RUQ;
	Fri, 12 Dec 2025 00:37:55 +0000
Date: Fri, 12 Dec 2025 08:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random-v2 6/7]
 include/linux/atomic/atomic-arch-fallback.h:406:34: error: initialization of
 'u64 *' {aka 'long long unsigned int *'} from 'u64' {aka 'long long unsigned
 int'} makes pointer from integer without a cast
Message-ID: <202512120833.5aENJBs8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random-v2
head:   629b369505e73286d416f91816305d3e16d5c3cf
commit: c638e24f6766140b08604e0f43615ca7d636138d [6/7] random: Use a lockless fast path for get_random_uXX()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251212/202512120833.5aENJBs8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120833.5aENJBs8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120833.5aENJBs8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:67,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/arm64/include/asm/processor.h:31,
                    from include/linux/sched.h:13,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
   drivers/char/random.c: In function 'get_random_u8':
   include/linux/atomic/atomic-instrumented.h:5030:49: error: invalid type argument of unary '*' (have 'u64' {aka 'long long unsigned int'})
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:570:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:31: error: passing argument 1 of 'instrument_read_write' makes pointer from integer without a cast [-Wint-conversion]
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
         |                               |
         |                               u64 {aka long long unsigned int}
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:570:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:52:72: note: expected 'const volatile void *' but argument is of type 'u64' {aka 'long long unsigned int'}
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~^
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:406:34: error: initialization of 'u64 *' {aka 'long long unsigned int *'} from 'u64' {aka 'long long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     406 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/linux/atomic/atomic-instrumented.h:5031:9: note: in expansion of macro 'raw_try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:570:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c: In function 'get_random_u16':
   include/linux/atomic/atomic-instrumented.h:5030:49: error: invalid type argument of unary '*' (have 'u64' {aka 'long long unsigned int'})
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:571:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:31: error: passing argument 1 of 'instrument_read_write' makes pointer from integer without a cast [-Wint-conversion]
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
         |                               |
         |                               u64 {aka long long unsigned int}
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:571:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/instrumented.h:52:72: note: expected 'const volatile void *' but argument is of type 'u64' {aka 'long long unsigned int'}
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~^
>> include/linux/atomic/atomic-arch-fallback.h:406:34: error: initialization of 'u64 *' {aka 'long long unsigned int *'} from 'u64' {aka 'long long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     406 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/linux/atomic/atomic-instrumented.h:5031:9: note: in expansion of macro 'raw_try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:571:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c: In function 'get_random_u32':
   include/linux/atomic/atomic-instrumented.h:5030:49: error: invalid type argument of unary '*' (have 'u64' {aka 'long long unsigned int'})
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:572:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:31: error: passing argument 1 of 'instrument_read_write' makes pointer from integer without a cast [-Wint-conversion]
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
         |                               |
         |                               u64 {aka long long unsigned int}
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:572:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/instrumented.h:52:72: note: expected 'const volatile void *' but argument is of type 'u64' {aka 'long long unsigned int'}
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~^
>> include/linux/atomic/atomic-arch-fallback.h:406:34: error: initialization of 'u64 *' {aka 'long long unsigned int *'} from 'u64' {aka 'long long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     406 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/linux/atomic/atomic-instrumented.h:5031:9: note: in expansion of macro 'raw_try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:572:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c: In function 'get_random_u64':
   include/linux/atomic/atomic-instrumented.h:5030:49: error: invalid type argument of unary '*' (have 'u64' {aka 'long long unsigned int'})
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:573:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     573 | DEFINE_BATCHED_ENTROPY(u64)
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:31: error: passing argument 1 of 'instrument_read_write' makes pointer from integer without a cast [-Wint-conversion]
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
         |                               |
         |                               u64 {aka long long unsigned int}
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:573:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     573 | DEFINE_BATCHED_ENTROPY(u64)
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/instrumented.h:52:72: note: expected 'const volatile void *' but argument is of type 'u64' {aka 'long long unsigned int'}
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~^
>> include/linux/atomic/atomic-arch-fallback.h:406:34: error: initialization of 'u64 *' {aka 'long long unsigned int *'} from 'u64' {aka 'long long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     406 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/linux/atomic/atomic-instrumented.h:5031:9: note: in expansion of macro 'raw_try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:573:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     573 | DEFINE_BATCHED_ENTROPY(u64)
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +406 include/linux/atomic/atomic-arch-fallback.h

8c8b096a23d12f Peter Zijlstra 2023-05-31  400  
9257959a6e5b4f Mark Rutland   2023-06-05  401  #ifdef arch_try_cmpxchg64_local
9257959a6e5b4f Mark Rutland   2023-06-05  402  #define raw_try_cmpxchg64_local arch_try_cmpxchg64_local
9257959a6e5b4f Mark Rutland   2023-06-05  403  #else
9257959a6e5b4f Mark Rutland   2023-06-05  404  #define raw_try_cmpxchg64_local(_ptr, _oldp, _new) \
e6ce9d741163af Uros Bizjak    2023-04-05  405  ({ \
e6ce9d741163af Uros Bizjak    2023-04-05 @406  	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
9257959a6e5b4f Mark Rutland   2023-06-05  407  	___r = raw_cmpxchg64_local((_ptr), ___o, (_new)); \
e6ce9d741163af Uros Bizjak    2023-04-05  408  	if (unlikely(___r != ___o)) \
e6ce9d741163af Uros Bizjak    2023-04-05  409  		*___op = ___r; \
e6ce9d741163af Uros Bizjak    2023-04-05  410  	likely(___r == ___o); \
e6ce9d741163af Uros Bizjak    2023-04-05  411  })
9257959a6e5b4f Mark Rutland   2023-06-05  412  #endif
9257959a6e5b4f Mark Rutland   2023-06-05  413  

:::::: The code at line 406 was first introduced by commit
:::::: e6ce9d741163af0b846637ce6550ae8a671b1588 locking/atomic: Add generic try_cmpxchg{,64}_local() support

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
