Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25547ACD7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069045; cv=none; b=klOjma9QUBf4hCnyEaqKAjhmFBFrFgcDMt26ZwsFUdQNnynx1lCbZdme40aIkRY+YybaX7RDH4qAxxPLDrW9MHFLLpbMxUYUd+eFD21AR221bayU2i4tZxO1oz1d3MLfRPveSV/M400pqp68SElswNnn0IhXNFPTWjHYaBYdAGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069045; c=relaxed/simple;
	bh=V2hL992bWHKqo2S/xTSl1HAmIATIXldQBe1piaU1+kE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mS1XKPc/Xqiku0WXLf1IwVkwBiaJntxiJQKV96jlXp/XLGNJnmrRJq2OLfdw+bU8hq0WvdFJWosjbdHgVbz0EGCfIEQ5a6//JUSQ2dwjz41nGmsW7dIw8NVE390/madnoGrsi76Qi8BL68H6x13NVFwrcnDnY2lyRuKpsGQEAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoqBFbba; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoqBFbba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787069044; x=1818605044;
  h=date:from:to:cc:subject:message-id;
  bh=V2hL992bWHKqo2S/xTSl1HAmIATIXldQBe1piaU1+kE=;
  b=QoqBFbbaDe3ZRaEw77poYxhrNe+F8qGxNsGC/ICrGVhJqqPKna9I8uBM
   MKm8s55y6NMdE/9XEjUXVcISTdw3njg7ip2mcaQZh4hNw9y+hzS9WbZOg
   3gAUlFsaCSPfYLW+uZPocBT0uLdRvSOz5uhiBTN/4T27z0XtHhs6dyGCJ
   FZJxXEKBKOSoU+C/0rblHZYafPTtePYpG1f4mUYSKfos/AJ7uYUdWDZjZ
   hmS8Voq9NMz8JZL+Tpe8khgfL4ZEoKMWGZzfs0JOwAh0MKBKFd69aid9D
   izj2BxpmrEceFLPqpYUIXC+2UEQfhgc24ZNiZtzM1BFUJxJpwuFrF5eRM
   A==;
X-CSE-ConnectionGUID: 79X9BXGkSvCEPDm8hWOj6w==
X-CSE-MsgGUID: x8A7/euKSfq6I0ns9AeQ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87634860"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87634860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:03:51 -0700
X-CSE-ConnectionGUID: XhM8BSMvSIeLQkxXaOMUUw==
X-CSE-MsgGUID: WHKWXgWdQVGCH047zknPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261985216"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2026 09:03:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwMHy-00000000eP0-3XSo;
	Tue, 18 Aug 2026 16:03:46 +0000
Date: Wed, 19 Aug 2026 00:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 13/19]
 arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in
 something not a structure or union
Message-ID: <202608182310.dHyWZgO8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   032f02810150ef15c319b0ac8f82f7ca9760fe47
commit: 2d6459dd8379df55b30ba4c0d2103a7af55d5416 [13/19] drm: Remove pagemap from ttm_tt.h header
config: sh-randconfig-001-20260818 (https://download.01.org/0day-ci/archive/20260818/202608182310.dHyWZgO8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608182310.dHyWZgO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608182310.dHyWZgO8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from arch/sh/include/asm/pgtable-3level.h:5,
                    from arch/sh/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'; did you mean 'pid_t'?
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
         |                  pid_t
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      21 | static inline int pgd_none(pgd_t pgd)           { return 0; }
         |                            ^~~~~
         |                            p4d_t
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                           ^~~~~
         |                           p4d_t
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      23 | static inline int pgd_present(pgd_t pgd)        { return 1; }
         |                               ^~~~~
         |                               p4d_t
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      24 | static inline void pgd_clear(pgd_t *pgd)        { }
         |                              ^~~~~
         |                              p4d_t
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      35 | static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
         |                                 ^~~~~
         |                                 p4d_t
   arch/sh/include/asm/pgtable-3level.h: In function 'pud_pgtable':
   include/asm-generic/pgtable-nop4d.h:40:50: error: implicit declaration of function 'pgd_val'; did you mean 'p4d_val'? [-Wimplicit-function-declaration]
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/sh/include/asm/pgtable-3level.h:43:40: note: in expansion of macro 'pud_val'
      43 |         return (pmd_t *)(unsigned long)pud_val(pud);
         |                                        ^~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:167:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Wimplicit-function-declaration]
     167 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pmd_offset
   include/linux/pgtable.h:167:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     167 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:172:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     172 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   In file included from arch/sh/include/asm/pgtable.h:17:
   include/linux/pgtable.h: In function 'pud_same':
>> arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in something not a structure or union
      78 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1395:16: note: in expansion of macro 'pud_val'
    1395 |         return pud_val(pud_a) == pud_val(pud_b);
         |                ^~~~~~~
>> arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in something not a structure or union
      78 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1395:34: note: in expansion of macro 'pud_val'
    1395 |         return pud_val(pud_a) == pud_val(pud_b);
         |                                  ^~~~~~~
   include/linux/pgtable.h:1393:34: warning: parameter 'pud_a' set but not used [-Wunused-but-set-parameter=]
    1393 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1393:47: warning: parameter 'pud_b' set but not used [-Wunused-but-set-parameter=]
    1393 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'p4d_same':
>> arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in something not a structure or union
      78 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1403:16: note: in expansion of macro 'p4d_val'
    1403 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                ^~~~~~~
>> arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in something not a structure or union
      78 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1403:34: note: in expansion of macro 'p4d_val'
    1403 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                                  ^~~~~~~
   include/linux/pgtable.h:1401:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter=]
    1401 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1401:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter=]
    1401 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1563:13: error: implicit declaration of function 'pgd_none'; did you mean 'p4d_none'? [-Wimplicit-function-declaration]
    1563 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             p4d_none
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
   include/linux/pgtable.h:1565:22: error: implicit declaration of function 'pgd_bad'; did you mean 'p4d_bad'? [-Wimplicit-function-declaration]
    1565 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/pgtable.h: In function 'pud_none_or_clear_bad':
>> arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in something not a structure or union
      78 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/sh/include/asm/pgtable-3level.h:48:27: note: in expansion of macro 'pud_val'
      48 | #define pud_none(x)     (!pud_val(x))
         |                           ^~~~~~~
   include/linux/pgtable.h:1585:13: note: in expansion of macro 'pud_none'
    1585 |         if (pud_none(*pud))
         |             ^~~~~~~~
>> arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in something not a structure or union
      78 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/sh/include/asm/pgtable-3level.h:51:26: note: in expansion of macro 'pud_val'
      51 | #define pud_bad(x)      (pud_val(x) & ~PAGE_MASK)
         |                          ^~~~~~~
   include/linux/pgtable.h:1587:22: note: in expansion of macro 'pud_bad'
    1587 |         if (unlikely(pud_bad(*pud))) {
         |                      ^~~~~~~
   In file included from include/linux/scatterlist.h:8,
                    from include/linux/dma-buf.h:19,
                    from include/drm/drm_gem.h:38,
                    from include/drm/ttm/ttm_bo.h:34,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:10,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:10:
   include/linux/mm.h: In function 'p4d_alloc':
   include/linux/mm.h:3589:22: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
    3589 |                 NULL : p4d_offset(pgd, address);
         |                      ^
   include/linux/mm.h: In function 'pmd_alloc':
>> arch/sh/include/asm/page.h:78:29: error: request for member 'pgd' in something not a structure or union
      78 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/sh/include/asm/pgtable-3level.h:48:27: note: in expansion of macro 'pud_val'
      48 | #define pud_none(x)     (!pud_val(x))
         |                           ^~~~~~~
   include/linux/mm.h:3601:26: note: in expansion of macro 'pud_none'
    3601 |         return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
         |                          ^~~~~~~~


vim +/pgd +78 arch/sh/include/asm/page.h

21440cf04a64cd include/asm-sh/page.h Paul Mundt     2006-11-20  77  
^1da177e4c3f41 include/asm-sh/page.h Linus Torvalds 2005-04-16 @78  #define pgd_val(x)	((x).pgd)
^1da177e4c3f41 include/asm-sh/page.h Linus Torvalds 2005-04-16  79  #define pgprot_val(x)	((x).pgprot)
^1da177e4c3f41 include/asm-sh/page.h Linus Torvalds 2005-04-16  80  

:::::: The code at line 78 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
