Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EAF24A06A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766819714; cv=none; b=H7xFEa10xPFrJ062e7PpnruPcD3CQyMgFJspGvketo/0ikGqe/XnnqEV/SznFpx4hJGdej/UnXiZ+qveRLrZExKsak6y225T+BS+s6h5elGcsdWMboU4uwFyQUi2XcQpfw0et+1aHokvWTVEXFlWPzFiqJn5wOPczKZLOTIm08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766819714; c=relaxed/simple;
	bh=LYfrDim3rw6ZY4ETFSmtyOIjjlFp0W1rdVtTf5bZv4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JIu1QphRes5J6rAVfq9qDO1Z3r8quOaR3YHPCAuGwNdzbSDplokbvnmFeDe90lF8kcheuIQEsbjTEyBfK6IFW5l2KHkaElfV03V2E8jBhAflI2SnJWis4c6AbaJWzbgFZ/6OSCjX/jSE7rfd5haq0It3Yblzx6HnfwKFdyOsaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4i42Gfj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4i42Gfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766819713; x=1798355713;
  h=date:from:to:cc:subject:message-id;
  bh=LYfrDim3rw6ZY4ETFSmtyOIjjlFp0W1rdVtTf5bZv4A=;
  b=n4i42GfjBxYXvqDP3DKWJ/j8IoDj+MIwyBgl30N7588dfc97+9s68u6y
   2pTNRuEh0MnOiEV9IXvn5kUbMWYl8k/Ij+yxHFISIcXe8EKKrsXVEO719
   3o7YBRa4rIdYgByFUeFy9ogAjn373TXjRsSP3zfB+YqLHYA3o9eG5Se2i
   ZD/4QyVgI+j/Nevo2donPkZrFC8IOL+nab7PeOW6rFZrNR7RLcSUlXhM5
   tY4isAZVNpNSk3of6T9Ya8EqdAd6C6gX5m8k7ugiDjgPrWXx8DPVbQA/4
   WwqPSAVbQrU6arWNcGxhhnvJqFKLnYFi+crr4NzMUhZRnTV1tmwo02+wR
   w==;
X-CSE-ConnectionGUID: wD368YQ+RqK59jh4R+n5CA==
X-CSE-MsgGUID: 1yn9ePO0ThSnxWFjT4sERA==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79987696"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79987696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:15:12 -0800
X-CSE-ConnectionGUID: 9y+vX7tMTOq6fPS3s143Xg==
X-CSE-MsgGUID: nvr1RgsXRdiMIoeebiXpyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205043528"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Dec 2025 23:15:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZOW3-000000005dV-3U2H;
	Sat, 27 Dec 2025 07:15:07 +0000
Date: Sat, 27 Dec 2025 15:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 1/6]
 arch/x86/include/asm/pgtable-3level.h:58:20: error: unknown type name
 'pudval_t'; did you mean 'pgdval_t'?
Message-ID: <202512271534.6xaWt2EU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alex,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/alexshi/linux.git pmdunify
head:   694b5dc7bcd7ba28db0bc95b24a78861bdffefc7
commit: 7c4dfaf03d4105a4daf3dc7baa6070bcab92a7fb [1/6] replace pudval_t by pmdval_t
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251227/202512271534.6xaWt2EU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271534.6xaWt2EU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271534.6xaWt2EU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_32.h:36,
                    from arch/x86/include/asm/pgtable.h:936,
                    from arch/x86/include/asm/tlbflush.h:17,
                    from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   arch/x86/include/asm/pgtable-3level.h: In function 'native_set_pud':
>> arch/x86/include/asm/pgtable-3level.h:58:20: error: unknown type name 'pudval_t'; did you mean 'pgdval_t'?
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |                    ^~~
   arch/x86/include/asm/pgtable-3level.h:23:9: note: in definition of macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |         ^~~~
>> arch/x86/include/asm/pgtable-3level.h:58:20: error: 'pudval_t' undeclared (first use in this function); did you mean 'pgdval_t'?
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |                    ^~~
   arch/x86/include/asm/pgtable-3level.h:23:28: note: in definition of macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                            ^~~~
   arch/x86/include/asm/pgtable-3level.h:58:20: note: each undeclared identifier is reported only once for each function it appears in
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |                    ^~~
   arch/x86/include/asm/pgtable-3level.h:23:28: note: in definition of macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                            ^~~~
>> arch/x86/include/asm/pgtable-3level.h:23:41: error: expected expression before ')' token
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                                         ^
   arch/x86/include/asm/pgtable-3level.h:58:9: note: in expansion of macro 'pxx_xchg64'
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^~~~~~~~~~
>> arch/x86/include/asm/pgtable-3level.h:24:21: error: expected ';' before '_o'
      24 |         _pxx##val_t _o = *_p;                                           \
         |                     ^~
   arch/x86/include/asm/pgtable-3level.h:58:9: note: in expansion of macro 'pxx_xchg64'
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from arch/x86/include/asm/thread_info.h:60,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/pgtable-3level.h:25:43: error: '_o' undeclared (first use in this function); did you mean '_p'?
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                                           ^~
   include/linux/atomic/atomic-instrumented.h:4914:16: note: in definition of macro 'try_cmpxchg64'
    4914 |         typeof(oldp) __ai_oldp = (oldp); \
         |                ^~~~
   arch/x86/include/asm/pgtable-3level.h:58:9: note: in expansion of macro 'pxx_xchg64'
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^~~~~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4917:49: error: invalid type argument of unary '*' (have 'int')
    4917 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:58:9: note: in expansion of macro 'pxx_xchg64'
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4917:31: error: passing argument 1 of 'instrument_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4917 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
         |                               |
         |                               int
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:58:9: note: in expansion of macro 'pxx_xchg64'
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^~~~~~~~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/x86/include/asm/bitops.h:423,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27:
   include/linux/instrumented.h:52:72: note: expected 'const volatile void *' but argument is of type 'int'
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~^
>> include/linux/atomic/atomic-instrumented.h:4918:27: error: passing argument 1 of '__try_cmpxchg64' from incompatible pointer type [-Wincompatible-pointer-types]
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |                           ^~~~~~~~
         |                           |
         |                           int *
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:58:9: note: in expansion of macro 'pxx_xchg64'
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^~~~~~~~~~
   In file included from arch/x86/include/asm/cmpxchg.h:143,
                    from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7:
   arch/x86/include/asm/cmpxchg_32.h:61:59: note: expected 'volatile u64 *' {aka 'volatile long long unsigned int *'} but argument is of type 'int *'
      61 | static __always_inline bool __try_cmpxchg64(volatile u64 *ptr, u64 *oldp, u64 new)
         |                                             ~~~~~~~~~~~~~~^~~
>> include/linux/atomic/atomic-instrumented.h:4918:37: error: passing argument 2 of '__try_cmpxchg64' makes pointer from integer without a cast [-Wint-conversion]
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |                                     ^~~~~~~~~
         |                                     |
         |                                     int
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:58:9: note: in expansion of macro 'pxx_xchg64'
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^~~~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:61:69: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'int'
      61 | static __always_inline bool __try_cmpxchg64(volatile u64 *ptr, u64 *oldp, u64 new)
         |                                                                ~~~~~^~~~
   arch/x86/include/asm/pgtable-3level.h: In function 'native_pudp_get_and_clear':
   arch/x86/include/asm/pgtable-3level.h:115:27: error: unknown type name 'pudval_t'; did you mean 'pgdval_t'?
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                           ^~~
   arch/x86/include/asm/pgtable-3level.h:23:9: note: in definition of macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |         ^~~~
   arch/x86/include/asm/pgtable-3level.h:115:27: error: 'pudval_t' undeclared (first use in this function); did you mean 'pgdval_t'?
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                           ^~~
   arch/x86/include/asm/pgtable-3level.h:23:28: note: in definition of macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                            ^~~~
>> arch/x86/include/asm/pgtable-3level.h:23:41: error: expected expression before ')' token
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                                         ^
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
>> arch/x86/include/asm/pgtable-3level.h:24:21: error: expected ';' before '_o'
      24 |         _pxx##val_t _o = *_p;                                           \
         |                     ^~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
>> arch/x86/include/asm/pgtable-3level.h:25:43: error: '_o' undeclared (first use in this function); did you mean '_p'?
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                                           ^~
   include/linux/atomic/atomic-instrumented.h:4914:16: note: in definition of macro 'try_cmpxchg64'
    4914 |         typeof(oldp) __ai_oldp = (oldp); \
         |                ^~~~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4917:49: error: invalid type argument of unary '*' (have 'int')
    4917 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4917:31: error: passing argument 1 of 'instrument_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4917 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
         |                               |
         |                               int
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
   include/linux/instrumented.h:52:72: note: expected 'const volatile void *' but argument is of type 'int'
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~^
>> include/linux/atomic/atomic-instrumented.h:4918:27: error: passing argument 1 of '__try_cmpxchg64' from incompatible pointer type [-Wincompatible-pointer-types]
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |                           ^~~~~~~~
         |                           |
         |                           int *
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:61:59: note: expected 'volatile u64 *' {aka 'volatile long long unsigned int *'} but argument is of type 'int *'
      61 | static __always_inline bool __try_cmpxchg64(volatile u64 *ptr, u64 *oldp, u64 new)
         |                                             ~~~~~~~~~~~~~~^~~
>> include/linux/atomic/atomic-instrumented.h:4918:37: error: passing argument 2 of '__try_cmpxchg64' makes pointer from integer without a cast [-Wint-conversion]
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |                                     ^~~~~~~~~
         |                                     |
         |                                     int
   arch/x86/include/asm/pgtable-3level.h:25:24: note: in expansion of macro 'try_cmpxchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                        ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
   arch/x86/include/asm/cmpxchg_32.h:61:69: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'int'
      61 | static __always_inline bool __try_cmpxchg64(volatile u64 *ptr, u64 *oldp, u64 new)
         |                                                                ~~~~~^~~~
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +58 arch/x86/include/asm/pgtable-3level.h

^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16   4  
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16   5  /*
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16   6   * Intel Physical Address Extension (PAE) Mode - three-level page
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16   7   * tables on PPro+ CPUs.
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16   8   *
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16   9   * Copyright (C) 1999 Ingo Molnar <mingo@redhat.com>
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  10   */
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  11  
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  12  #define pte_ERROR(e)							\
c767a54ba0657e arch/x86/include/asm/pgtable-3level.h Joe Perches         2012-05-21  13  	pr_err("%s:%d: bad pte %p(%08lx%08lx)\n",			\
4b01fef89a10ce include/asm-x86/pgtable-3level.h      Joe Perches         2008-03-23  14  	       __FILE__, __LINE__, &(e), (e).pte_high, (e).pte_low)
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  15  #define pmd_ERROR(e)							\
c767a54ba0657e arch/x86/include/asm/pgtable-3level.h Joe Perches         2012-05-21  16  	pr_err("%s:%d: bad pmd %p(%016Lx)\n",				\
4b01fef89a10ce include/asm-x86/pgtable-3level.h      Joe Perches         2008-03-23  17  	       __FILE__, __LINE__, &(e), pmd_val(e))
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  18  #define pgd_ERROR(e)							\
c767a54ba0657e arch/x86/include/asm/pgtable-3level.h Joe Perches         2012-05-21  19  	pr_err("%s:%d: bad pgd %p(%016Lx)\n",				\
4b01fef89a10ce include/asm-x86/pgtable-3level.h      Joe Perches         2008-03-23  20  	       __FILE__, __LINE__, &(e), pgd_val(e))
6194ba6ff6ccf8 include/asm-x86/pgtable-3level.h      Jeremy Fitzhardinge 2008-01-30  21  
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  22  #define pxx_xchg64(_pxx, _ptr, _val) ({					\
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21 @23  	_pxx##val_t *_p = (_pxx##val_t *)_ptr;				\
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21 @24  	_pxx##val_t _o = *_p;						\
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21 @25  	do { } while (!try_cmpxchg64(_p, &_o, (_val)));			\
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  26  	native_make_##_pxx(_o);						\
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  27  })
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  28  
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  29  /*
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  30   * Rules for using set_pte: the pte being assigned *must* be
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  31   * either not present or in a state where the hardware will
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  32   * not attempt to update the pte.  In places where this is
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  33   * not possible, use pte_get_and_clear to obtain the old pte
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  34   * value and then use set_pte to update it.  -ben
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  35   */
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  36  static inline void native_set_pte(pte_t *ptep, pte_t pte)
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  37  {
f7bcd4617de67a arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2020-11-26  38  	WRITE_ONCE(ptep->pte_high, pte.pte_high);
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  39  	smp_wmb();
f7bcd4617de67a arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2020-11-26  40  	WRITE_ONCE(ptep->pte_low, pte.pte_low);
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  41  }
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  42  
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  43  static inline void native_set_pte_atomic(pte_t *ptep, pte_t pte)
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  44  {
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  45  	pxx_xchg64(pte, ptep, native_pte_val(pte));
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  46  }
4b01fef89a10ce include/asm-x86/pgtable-3level.h      Joe Perches         2008-03-23  47  
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  48  static inline void native_set_pmd(pmd_t *pmdp, pmd_t pmd)
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  49  {
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21  50  	pxx_xchg64(pmd, pmdp, native_pmd_val(pmd));
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  51  }
4b01fef89a10ce include/asm-x86/pgtable-3level.h      Joe Perches         2008-03-23  52  
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  53  static inline void native_set_pud(pud_t *pudp, pud_t pud)
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  54  {
ea4654e0885348 arch/x86/include/asm/pgtable-3level.h Breno Leitao        2023-11-21  55  #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
9b7b8bbd7f6ba4 arch/x86/include/asm/pgtable-3level.h Joerg Roedel        2018-07-18  56  	pud.p4d.pgd = pti_set_user_pgtbl(&pudp->p4d.pgd, pud.p4d.pgd);
9b7b8bbd7f6ba4 arch/x86/include/asm/pgtable-3level.h Joerg Roedel        2018-07-18  57  #endif
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21 @58  	pxx_xchg64(pud, pudp, native_pud_val(pud));
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  59  }
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  60  

:::::: The code at line 58 was first introduced by commit
:::::: d4a72e7fe61a1ea9ad4accf3532411ca685eaead x86/mm/pae: Get rid of set_64bit()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
