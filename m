Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306152459DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766824156; cv=none; b=E0k4qbPbs7i5Y68GzyRdIMmclTLk3bVz7TcL2MmEWMoUu5sV2WRsaEk5uwQ/53yhda/EN01ViI+ukR+KRmpORHJwUh8bK0wQv5WAQLc5St/bcXPF+8rCZVCEWtjGKg7GEnQg153EwGY5DjW+0wgFo5+qLb9ICssFZ0LdewkToVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766824156; c=relaxed/simple;
	bh=rgbioE1kNuN4IB/0y7On2ZcDv/ZZzU/hnI8SplipHFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BRdPj8AM3mIpw/z2NJueHQrsbyMlInxQhTSUEUM47Z2bo+Chr85xNPRwtwlBLjrUSY0gL2xmBDvfrgY1YNeNiDNnNPz6FGJ5tk37GpaBXK2GG4vBjRYUB9GX1u2Q2EOe/pr2cJj+8G1rBLlG+sF+MQ8Adyn0AFbiVeHj2zQMhcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nScwh65u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nScwh65u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766824154; x=1798360154;
  h=date:from:to:cc:subject:message-id;
  bh=rgbioE1kNuN4IB/0y7On2ZcDv/ZZzU/hnI8SplipHFs=;
  b=nScwh65u8oskKjrHnLKtczqyiHJ4aooOeQDYIuwKVR+g/IKZ7szOYosx
   d4bOKzIAQbd8LGKP7MPvPJDbzIYFiBbRhoibUABmNZ0+HwmRzuAufxuB4
   1vysburUs0BlQs6qcQQriSEVVGtqki3VmBG5fZLutJKle5hCsuiLLj1R7
   mzfk/WVT6xfiGd9+TQsq419GSaLcu7hy7dY8ATkO9iF7xqXQ5l4xNAmwr
   2rTSKfC0yab0bvJjvg++eN82+YNF9Y9XXtD1m8lysbxfEI6K0vWkboVTd
   VwEV5VkS+sbPBFbuLLW2qWmsSqvvTLPvw0IzE0jFp0qK7oMrcryyFKpY+
   g==;
X-CSE-ConnectionGUID: zUh/t3GAQAOLSQVIq1L/7A==
X-CSE-MsgGUID: uXZ46KrZRquXVQtklGLC/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79988945"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79988945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 00:29:13 -0800
X-CSE-ConnectionGUID: ReprT1WKR9G7geCjm7hxvQ==
X-CSE-MsgGUID: TsVFkOKlTECpUyNLMdWsJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205009704"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2025 00:29:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZPfh-000000005g5-21RM;
	Sat, 27 Dec 2025 08:29:09 +0000
Date: Sat, 27 Dec 2025 16:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 3/6]
 arch/x86/include/asm/pgtable-3level.h:144:41: error: 'pmd_t' has no member
 named 'entry'
Message-ID: <202512271636.dCQ1m2IM-lkp@intel.com>
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
commit: 38ff6617fbf7d3b0ad7fda7fb1c5b0cdca9f7123 [3/6] arch/x86: unify pmd_t/pud_t/p4d_t member name to entry
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251227/202512271636.dCQ1m2IM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271636.dCQ1m2IM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271636.dCQ1m2IM-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/atomic/atomic-instrumented.h:4918:37: error: passing argument 2 of '__try_cmpxchg64' makes pointer from integer without a cast [-Wint-conversion]
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
   arch/x86/include/asm/pgtable-3level.h:23:41: error: expected expression before ')' token
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                                         ^
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:24:21: error: expected ';' before '_o'
      24 |         _pxx##val_t _o = *_p;                                           \
         |                     ^~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:25:43: error: '_o' undeclared (first use in this function); did you mean '_p'?
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                                           ^~
   include/linux/atomic/atomic-instrumented.h:4914:16: note: in definition of macro 'try_cmpxchg64'
    4914 |         typeof(oldp) __ai_oldp = (oldp); \
         |                ^~~~
   arch/x86/include/asm/pgtable-3level.h:115:16: note: in expansion of macro 'pxx_xchg64'
     115 |         return pxx_xchg64(pud, pudp, 0ULL);
         |                ^~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4917:49: error: invalid type argument of unary '*' (have 'int')
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
   include/linux/atomic/atomic-instrumented.h:4918:27: error: passing argument 1 of '__try_cmpxchg64' from incompatible pointer type [-Wincompatible-pointer-types]
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
   include/linux/atomic/atomic-instrumented.h:4918:37: error: passing argument 2 of '__try_cmpxchg64' makes pointer from integer without a cast [-Wint-conversion]
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
   arch/x86/include/asm/pgtable-3level.h: In function 'pmdp_establish':
>> arch/x86/include/asm/pgtable-3level.h:144:41: error: 'pmd_t' has no member named 'entry'
     144 |         return pxx_xchg64(pmd, pmdp, pmd.entry);
         |                                         ^
   include/linux/atomic/atomic-instrumented.h:4918:48: note: in definition of macro 'try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |                                                ^~~~~~~~~~~
   arch/x86/include/asm/pgtable-3level.h:144:16: note: in expansion of macro 'pxx_xchg64'
     144 |         return pxx_xchg64(pmd, pmdp, pmd.entry);
         |                ^~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +144 arch/x86/include/asm/pgtable-3level.h

   112	
   113	static inline pud_t native_pudp_get_and_clear(pud_t *pudp)
   114	{
 > 115		return pxx_xchg64(pud, pudp, 0ULL);
   116	}
   117	#else
   118	#define native_ptep_get_and_clear(xp) native_local_ptep_get_and_clear(xp)
   119	#define native_pmdp_get_and_clear(xp) native_local_pmdp_get_and_clear(xp)
   120	#define native_pudp_get_and_clear(xp) native_local_pudp_get_and_clear(xp)
   121	#endif
   122	
   123	#ifndef pmdp_establish
   124	#define pmdp_establish pmdp_establish
   125	static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
   126			unsigned long address, pmd_t *pmdp, pmd_t pmd)
   127	{
   128		pmd_t old;
   129	
   130		/*
   131		 * If pmd has present bit cleared we can get away without expensive
   132		 * cmpxchg64: we can update pmdp half-by-half without racing with
   133		 * anybody.
   134		 */
   135		if (!(pmd_val(pmd) & _PAGE_PRESENT)) {
   136			/* xchg acts as a barrier before setting of the high bits */
   137			old.pmd_low = xchg(&pmdp->pmd_low, pmd.pmd_low);
   138			old.pmd_high = READ_ONCE(pmdp->pmd_high);
   139			WRITE_ONCE(pmdp->pmd_high, pmd.pmd_high);
   140	
   141			return old;
   142		}
   143	
 > 144		return pxx_xchg64(pmd, pmdp, pmd.entry);
   145	}
   146	#endif
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
