Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA1D39F190
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741566; cv=none; b=RZ4xZtWJnigDeEviMHkDR1agfO5fPCucmrXhgAz+KwlgvC6QoXYtsJNNX4YTXMI9nEUe77rkd6zmuol7AIAeyu1FfObaJ795dYcphD20u7/nHV+F2w7a/0jm4NWg04l7toU/ldyzBR3w1w9plUTClqgqK7zY8sxLsPKBJ7snGAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741566; c=relaxed/simple;
	bh=XTtHueL5Dg9nn7PAa8rpVSMmC2LrxSMpsa6buQIL1KQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L2KV9nl1xxYeGTLvSdJPsn0emPv3wfRURVHgnM4pCzVF5cjUXlnVVWyf/e6jMWkiLNeNLbwQvIMngcOKH1k+kp3oT+HQrNZ5UyepvIvt3HTS/gHw2klSdx1JShbhzbD97EddQ78+kGMLrziyHRcgyM+e7L93gsjuixW+uKJ07Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1EqSt3G; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1EqSt3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789741563; x=1821277563;
  h=date:from:to:cc:subject:message-id;
  bh=XTtHueL5Dg9nn7PAa8rpVSMmC2LrxSMpsa6buQIL1KQ=;
  b=E1EqSt3GEETVGI1emOzJQA6pJC1RpwTwq3BijkmHP9Ghp7ryldEWn2/G
   lgYNyjl7mLubTjiFqjqDeCxkF+ejSoC3ztwwSKKK0ExoHWE2BzhYaJSud
   0JRA02DOy2KR4GgDTm7XVz/EGik3aB/HBLuz4F1cM1UEPk9KvS3QzwA2s
   hfBoUQ77WnTTdPJ2uWIyFoK1BsmYcIubEUB32XHuo/J0MnAKKIx/U7tq1
   nTnAU4bB5mx0LRe+Xp9Yiq4Pakk4dZLflFrQX5z4YQyMWkBa847N7sR+4
   tAXEy/Lw6EsvTt/CRPyOfMi50Nortnz8WTC6qnt1IeLDy5BSVjCQFvdj8
   Q==;
X-CSE-ConnectionGUID: y0VJMhJPS/awXmv23BCMeg==
X-CSE-MsgGUID: PcCbdruMQcCCvJMPF8OcQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="90117157"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90117157"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:26:03 -0700
X-CSE-ConnectionGUID: yAMTOWB2SGiMzMb1SblaiA==
X-CSE-MsgGUID: CTv+a3a7QXyXxw9DyE0tTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2626520"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Sep 2026 07:26:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7ZXK-000000009vF-35Mg;
	Fri, 18 Sep 2026 14:25:58 +0000
Date: Fri, 18 Sep 2026 22:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 479/7047]
 include/linux/pgtable.h:1367:34: warning: parameter 'pmd_a' set but not used
Message-ID: <202609182220.nt5XVqtu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0d9d0dbf2fddcff5859d623e90ca73c4054276e1
commit: 2854902575ac6d6cfa97e1bf0f134b718d65b16b [479/7047] drm: Remove pagemap from ttm_tt.h header
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260918/202609182220.nt5XVqtu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609182220.nt5XVqtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609182220.nt5XVqtu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:323:9: note: in expansion of macro 'pmd_val'
     323 |         pmd_val(*pmdp) = _KERNPG_TABLE | (unsigned long) ptep;
         |         ^~~~~~~
   arch/openrisc/include/asm/pgtable.h: In function 'pmd_page_vaddr':
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   arch/openrisc/include/asm/page.h:62:43: note: in definition of macro '__va'
      62 | #define __va(x) ((void *)((unsigned long)(x) + PAGE_OFFSET))
         |                                           ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:331:38: note: in expansion of macro 'pmd_val'
     331 |         return ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK));
         |                                      ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:329:50: warning: parameter 'pmd' set but not used [-Wunused-but-set-parameter=]
     329 | static inline unsigned long pmd_page_vaddr(pmd_t pmd)
         |                                            ~~~~~~^~~
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
   include/linux/pgtable.h: In function 'virt_to_kpte':
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:186:27: note: in expansion of macro 'pmd_val'
     186 | #define pmd_none(x)     (!pmd_val(x))
         |                           ^~~~~~~
   include/linux/pgtable.h:179:16: note: in expansion of macro 'pmd_none'
     179 |         return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                ^~~~~~~~
   include/linux/pgtable.h: In function 'pmd_same':
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1369:16: note: in expansion of macro 'pmd_val'
    1369 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                ^~~~~~~
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1369:34: note: in expansion of macro 'pmd_val'
    1369 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                                  ^~~~~~~
>> include/linux/pgtable.h:1367:34: warning: parameter 'pmd_a' set but not used [-Wunused-but-set-parameter=]
    1367 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                            ~~~~~~^~~~~
>> include/linux/pgtable.h:1367:47: warning: parameter 'pmd_b' set but not used [-Wunused-but-set-parameter=]
    1367 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pud_same':
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
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
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
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
>> include/linux/pgtable.h:1374:34: warning: parameter 'pud_a' set but not used [-Wunused-but-set-parameter=]
    1374 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                            ~~~~~~^~~~~
>> include/linux/pgtable.h:1374:47: warning: parameter 'pud_b' set but not used [-Wunused-but-set-parameter=]
    1374 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'p4d_same':
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1384:16: note: in expansion of macro 'p4d_val'
    1384 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                ^~~~~~~
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1384:34: note: in expansion of macro 'p4d_val'
    1384 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                                  ^~~~~~~
>> include/linux/pgtable.h:1382:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter=]
    1382 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
>> include/linux/pgtable.h:1382:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter=]
    1382 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1544:13: error: implicit declaration of function 'pgd_none'; did you mean 'pud_none'? [-Wimplicit-function-declaration]
    1544 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             pud_none
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
   include/linux/pgtable.h:1546:22: error: implicit declaration of function 'pgd_bad'; did you mean 'pud_bad'? [-Wimplicit-function-declaration]
    1546 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/pgtable.h: In function 'pmd_none_or_clear_bad':
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:186:27: note: in expansion of macro 'pmd_val'
     186 | #define pmd_none(x)     (!pmd_val(x))
         |                           ^~~~~~~
   include/linux/pgtable.h:1577:13: note: in expansion of macro 'pmd_none'
    1577 |         if (pmd_none(*pmd))
         |             ^~~~~~~~
   arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
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
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:187:27: note: in expansion of macro 'pmd_val'
     187 | #define pmd_bad(x)      ((pmd_val(x) & (~PAGE_MASK)) != _KERNPG_TABLE)
         |                           ^~~~~~~
   include/linux/pgtable.h:1579:22: note: in expansion of macro 'pmd_bad'
    1579 |         if (unlikely(pmd_bad(*pmd))) {
         |                      ^~~~~~~
   In file included from arch/openrisc/include/asm/pgalloc.h:20,
                    from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:12,
                    from include/linux/iosys-map.h:10,
                    from include/drm/ttm/ttm_resource.h:31,
                    from include/drm/ttm/ttm_device.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:9,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:10:
   include/linux/mm.h: In function 'p4d_alloc':
   include/linux/mm.h:3639:22: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
    3639 |                 NULL : p4d_offset(pgd, address);
         |                      ^
   arch/openrisc/include/asm/pgalloc.h: In function 'pmd_populate':
   arch/openrisc/include/asm/page.h:54:25: error: incompatible types when initializing type 'int' using type 'pgd_t'
      54 | #define __pgd(x)        ((pgd_t) { (x) })
         |                         ^
   arch/openrisc/include/asm/pgalloc.h:34:9: note: in expansion of macro 'set_pmd'
      34 |         set_pmd(pmd, __pmd(_KERNPG_TABLE +
         |         ^~~~~~~
   include/asm-generic/pgtable-nop4d.h:41:60: note: in expansion of macro '__pgd'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopud.h:49:60: note: in expansion of macro '__p4d'
      49 | #define __pud(x)                                ((pud_t) { __p4d(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopmd.h:53:60: note: in expansion of macro '__pud'
      53 | #define __pmd(x)                                ((pmd_t) { __pud(x) } )
         |                                                            ^~~~~
   arch/openrisc/include/asm/pgalloc.h:34:22: note: in expansion of macro '__pmd'
      34 |         set_pmd(pmd, __pmd(_KERNPG_TABLE +
         |                      ^~~~~


vim +/pmd_a +1367 include/linux/pgtable.h

e7884f8ead4a30 include/asm-generic/pgtable.h Kiryl Shutsemau  2017-03-16  1365  
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  1366  #ifndef __HAVE_ARCH_PMD_SAME
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13 @1367  static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  1368  {
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13 @1369  	return pmd_val(pmd_a) == pmd_val(pmd_b);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli 2011-01-13  1370  }
973bf6800cf378 include/linux/pgtable.h       Aneesh Kumar K.V 2023-07-25  1371  #endif
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox   2017-02-24  1372  
973bf6800cf378 include/linux/pgtable.h       Aneesh Kumar K.V 2023-07-25  1373  #ifndef pud_same
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox   2017-02-24 @1374  static inline int pud_same(pud_t pud_a, pud_t pud_b)
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox   2017-02-24  1375  {
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox   2017-02-24 @1376  	return pud_val(pud_a) == pud_val(pud_b);
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox   2017-02-24  1377  }
973bf6800cf378 include/linux/pgtable.h       Aneesh Kumar K.V 2023-07-25  1378  #define pud_same pud_same
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds   2005-04-16  1379  #endif
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds   2005-04-16  1380  
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams     2018-12-04  1381  #ifndef __HAVE_ARCH_P4D_SAME
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams     2018-12-04 @1382  static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams     2018-12-04  1383  {
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams     2018-12-04 @1384  	return p4d_val(p4d_a) == p4d_val(p4d_b);
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams     2018-12-04  1385  }
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams     2018-12-04  1386  #endif
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams     2018-12-04  1387  

:::::: The code at line 1367 was first introduced by commit
:::::: e2cda322648122dc400c85ada80eaddbc612ef6a thp: add pmd mangling generic functions

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
