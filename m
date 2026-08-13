Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE4419314
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 10:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618397; cv=none; b=ujy1BGcvBkO6zR8FzFSlql+bqP+BD9yuaD6G0hsOj8Z+KZc0xAgXQAPDfdXdIZVeLE47ACEkeueWTlNcNiCxfbQ/HpGSRMkBbvgdl0xJscSnJNuCKbwyL3N8jHDtNnmrM2qZ9zzaHQGQMxOg9kTEKPrEZsM/VanMJIjDB8F3+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618397; c=relaxed/simple;
	bh=lWlLRWzYdmEcNe27I66m/ijRvQ4Z7Wvd0t4b8p3c61k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MRnDyWFJVF5p4Awl/fp00tlHpVa/ha/qpldQ7fgtlc5lmjeumNUdLV90AmgRGTtl04DX4xSZkKv1qg9U7uky3jR8+PoD/N/ZjiLV9mlZ1Sp+GV9y26D+xAuGdYUWwbleOfpWNjWh4EC1YcE7gfDlBCAyhkP0NwOiPpI1deFPWyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZhI7jiW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZhI7jiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786618386; x=1818154386;
  h=date:from:to:cc:subject:message-id;
  bh=lWlLRWzYdmEcNe27I66m/ijRvQ4Z7Wvd0t4b8p3c61k=;
  b=fZhI7jiW+5fRikKcGr+qOqYZUwc6YvwvTBgINLcEiBsOAYVCtrwopH/Y
   cH2XDe0q9BPgb+ge3aoH1pqhLIL3dRIvVh4jC58QP3Daf9+yia+/RY1Ak
   sxk3IutZ/XHNLP8gqwntg7/ojmv/8BbMvO0qRyzfwpGPROrAvGdERAvNJ
   p1xPSRalUClBrc/cU2ldNz1aKJniGn82l1IdmKnRhp9JIKZ0GZrlbB3Xt
   cEr00oLFvb7T7F8sH5ZlSQZd+lmAf3zKiZsgg1Nto1uGeCxffwH1qWw/a
   qj2pwXibyn/Ondpx7Jb1+efIU+kPhbCtZWz60M63Sjk1FvfJt/WtT5mgQ
   A==;
X-CSE-ConnectionGUID: 18RXZ/0mSq2Wg2pq5R+x3w==
X-CSE-MsgGUID: 8YBn7FbnT3i9Zjjl21Z7qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91000793"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91000793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 03:53:04 -0700
X-CSE-ConnectionGUID: HR4RisKtTTez6jkhGTASng==
X-CSE-MsgGUID: dwwaT80VTTefVV9RHST3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="293851678"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Aug 2026 03:53:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuT3T-00000000Tko-3nlK;
	Thu, 13 Aug 2026 10:52:59 +0000
Date: Thu, 13 Aug 2026 18:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 10/12]
 arch/alpha/include/asm/pgtable.h:205:40: warning: parameter 'pgd' set but not
 used
Message-ID: <202608131819.Ql2Wh3Tn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   6fa479fc028749b78a11511e466a5e46fc39c1d6
commit: 407c67a9d6183fc8f62b6a9cf1c153a8cd49cbf3 [10/12] drm: Remove pagemap from ttm_tt.h header
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260813/202608131819.Ql2Wh3Tn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131819.Ql2Wh3Tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131819.Ql2Wh3Tn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from arch/alpha/include/asm/pgtable.h:5,
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
   In file included from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from arch/alpha/include/asm/pgtable.h:14:
   arch/alpha/include/asm/pgtable.h: In function 'pud_set':
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:189:3: note: in expansion of macro 'pud_val'
     189 | { pud_val(*pudp) = _PAGE_TABLE | ((((unsigned long) pmdp) - PAGE_OFFSET) << (32-PAGE_SHIFT)); }
         |   ^~~~~~~
   arch/alpha/include/asm/pgtable.h: In function 'pud_pgtable':
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:207:42: note: in expansion of macro 'pud_val'
     207 |         return (pmd_t *)(PAGE_OFFSET + ((pud_val(pgd) & _PFN_MASK) >> (32-PAGE_SHIFT)));
         |                                          ^~~~~~~
>> arch/alpha/include/asm/pgtable.h:205:40: warning: parameter 'pgd' set but not used [-Wunused-but-set-parameter=]
     205 | extern inline pmd_t *pud_pgtable(pud_t pgd)
         |                                  ~~~~~~^~~
   arch/alpha/include/asm/pgtable.h: In function 'pud_none':
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:222:59: note: in expansion of macro 'pud_val'
     222 | extern inline int pud_none(pud_t pud)           { return !pud_val(pud); }
         |                                                           ^~~~~~~
>> arch/alpha/include/asm/pgtable.h:222:34: warning: parameter 'pud' set but not used [-Wunused-but-set-parameter=]
     222 | extern inline int pud_none(pud_t pud)           { return !pud_val(pud); }
         |                            ~~~~~~^~~
   arch/alpha/include/asm/pgtable.h: In function 'pud_bad':
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:223:59: note: in expansion of macro 'pud_val'
     223 | extern inline int pud_bad(pud_t pud)            { return (pud_val(pud) & ~_PFN_MASK) != _PAGE_TABLE; }
         |                                                           ^~~~~~~
   arch/alpha/include/asm/pgtable.h:223:33: warning: parameter 'pud' set but not used [-Wunused-but-set-parameter=]
     223 | extern inline int pud_bad(pud_t pud)            { return (pud_val(pud) & ~_PFN_MASK) != _PAGE_TABLE; }
         |                           ~~~~~~^~~
   arch/alpha/include/asm/pgtable.h: In function 'pud_present':
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:224:58: note: in expansion of macro 'pud_val'
     224 | extern inline int pud_present(pud_t pud)        { return pud_val(pud) & _PAGE_VALID; }
         |                                                          ^~~~~~~
   arch/alpha/include/asm/pgtable.h:224:37: warning: parameter 'pud' set but not used [-Wunused-but-set-parameter=]
     224 | extern inline int pud_present(pud_t pud)        { return pud_val(pud) & _PAGE_VALID; }
         |                               ~~~~~~^~~
   arch/alpha/include/asm/pgtable.h: In function 'pud_clear':
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:225:51: note: in expansion of macro 'pud_val'
     225 | extern inline void pud_clear(pud_t * pudp)      { pud_val(*pudp) = 0; }
         |                                                   ^~~~~~~
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
   include/linux/pgtable.h: In function 'pud_same':
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1376:16: note: in expansion of macro 'pud_val'
    1376 |         return pud_val(pud_a) == pud_val(pud_b);
         |                ^~~~~~~
   arch/alpha/include/asm/page.h:32:29: error: request for member 'pgd' in something not a structure or union
      32 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1376:34: note: in expansion of macro 'pud_val'
    1376 |         return pud_val(pud_a) == pud_val(pud_b);
         |                                  ^~~~~~~
   include/linux/pgtable.h:1374:34: warning: parameter 'pud_a' set but not used [-Wunused-but-set-parameter=]
    1374 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1374:47: warning: parameter 'pud_b' set but not used [-Wunused-but-set-parameter=]
    1374 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                                         ~~~~~~^~~~~


vim +/pgd +205 arch/alpha/include/asm/pgtable.h

^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  204  
9cf6fa245844311 arch/alpha/include/asm/pgtable.h Aneesh Kumar K.V 2021-07-07 @205  extern inline pmd_t *pud_pgtable(pud_t pgd)
9cf6fa245844311 arch/alpha/include/asm/pgtable.h Aneesh Kumar K.V 2021-07-07  206  {
9cf6fa245844311 arch/alpha/include/asm/pgtable.h Aneesh Kumar K.V 2021-07-07  207  	return (pmd_t *)(PAGE_OFFSET + ((pud_val(pgd) & _PFN_MASK) >> (32-PAGE_SHIFT)));
9cf6fa245844311 arch/alpha/include/asm/pgtable.h Aneesh Kumar K.V 2021-07-07  208  }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  209  
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  210  extern inline int pte_none(pte_t pte)		{ return !pte_val(pte); }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  211  extern inline int pte_present(pte_t pte)	{ return pte_val(pte) & _PAGE_VALID; }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  212  extern inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  213  {
dd5712f3379cfe7 arch/alpha/include/asm/pgtable.h Magnus Lindholm  2026-01-02  214  	WRITE_ONCE(pte_val(*ptep), 0);
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  215  }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  216  
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  217  extern inline int pmd_none(pmd_t pmd)		{ return !pmd_val(pmd); }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  218  extern inline int pmd_bad(pmd_t pmd)		{ return (pmd_val(pmd) & ~_PFN_MASK) != _PAGE_TABLE; }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  219  extern inline int pmd_present(pmd_t pmd)	{ return pmd_val(pmd) & _PAGE_VALID; }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  220  extern inline void pmd_clear(pmd_t * pmdp)	{ pmd_val(*pmdp) = 0; }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  221  
a73c948952ccd66 arch/alpha/include/asm/pgtable.h Mike Rapoport    2019-12-04 @222  extern inline int pud_none(pud_t pud)		{ return !pud_val(pud); }
a73c948952ccd66 arch/alpha/include/asm/pgtable.h Mike Rapoport    2019-12-04  223  extern inline int pud_bad(pud_t pud)		{ return (pud_val(pud) & ~_PFN_MASK) != _PAGE_TABLE; }
a73c948952ccd66 arch/alpha/include/asm/pgtable.h Mike Rapoport    2019-12-04  224  extern inline int pud_present(pud_t pud)	{ return pud_val(pud) & _PAGE_VALID; }
a73c948952ccd66 arch/alpha/include/asm/pgtable.h Mike Rapoport    2019-12-04  225  extern inline void pud_clear(pud_t * pudp)	{ pud_val(*pudp) = 0; }
^1da177e4c3f415 include/asm-alpha/pgtable.h      Linus Torvalds   2005-04-16  226  

:::::: The code at line 205 was first introduced by commit
:::::: 9cf6fa2458443118b84090aa1bf7a3630b5940e8 mm: rename pud_page_vaddr to pud_pgtable and make it return pmd_t *

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
