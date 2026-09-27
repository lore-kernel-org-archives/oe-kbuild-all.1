Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BCE81724
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 17:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531703; cv=none; b=i8u9lWMOy+dIqIoEz/+y3nNRPwNz6einvAJuosghM0p36aYTu3+hjbd+yJibsW0K7+6JpJTKvkLsX0a5gk67VHttjxKAazlUZZRwrW6DXSrihORTo09SnYOgNLqq1+z2SDdX6dsGYy15fC7lC6ZJbtqRUUzN9MvyH2zNXQVkLwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531703; c=relaxed/simple;
	bh=bVuKiOeUEjP2ymqMzXgUBhmGxRpaDlVDgV9ExqVhgLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5SB/syGCiFecZCiiRZGZpnR1ZB5Sxaev7hq1uc5E+uhnN3JySclernwwhycqKIYyIWoWbucTLkJNu8v4DwnJBUf6ZkF3/g4SzTR71V9LGgsMgFDA9mu+8skBV6QX21wmjD8guyOrM9GXXEUXIh4QmxymWWEYHL2b0rHEadLrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbD8RyNS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbD8RyNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790531701; x=1822067701;
  h=date:from:to:cc:subject:message-id;
  bh=bVuKiOeUEjP2ymqMzXgUBhmGxRpaDlVDgV9ExqVhgLE=;
  b=dbD8RyNSAPSHHZPVOFO5RRyyctAYj4k2wT3mDk1HevPbPTXuMVS+I+O/
   gCjU+EjAhYlLfxeyo339WFwc8aVIp0y88Tgnj2BL57zxpXlZcKHgaFjwV
   JXmSIxGTC4zjm42X3/ESIWV92L60S7Geh6DTvnwoBubsEdn9v+2goIztB
   Ca0CC1SuN0G744E9t0XXIGWNcU2ZuEEsSATZ1Wsu/JoA+AH+mZWPy1lQd
   pwomCcJRmelDe987z193G6J5XLzt/Qm04tyIeHeaTvgp7TJGACNpxQn3Q
   xEW88cY9hKjYKpQPTUcG6H5CQNZzOtOF5h392qYIE7xVS8DkRscff9QZF
   Q==;
X-CSE-ConnectionGUID: 2ptF1PJGRUKSG+ztsRKvOw==
X-CSE-MsgGUID: YAvA5IdCS/uI0NIj7PfFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101411811"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="101411811"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 10:55:01 -0700
X-CSE-ConnectionGUID: VuRA7Ll/TlqFXD+kMUfjrQ==
X-CSE-MsgGUID: ninYoYsvTUyN+ffxPmgDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="301121517"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2026 10:54:58 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAt5N-000000000eH-2cdS;
	Sun, 27 Sep 2026 17:54:49 +0000
Date: Sun, 27 Sep 2026 19:54:25 +0200
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 464/10910]
 include/linux/pgtable.h:167:31: warning: passing argument 1 of 'pud_offset'
 makes pointer from integer without a cast
Message-ID: <202609271911.RuEDWNPU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 2854902575ac6d6cfa97e1bf0f134b718d65b16b [464/10910] drm: Remove pagemap from ttm_tt.h header
config: openrisc-randconfig-r2107-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271911.RuEDWNPU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271911.RuEDWNPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271911.RuEDWNPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/openrisc/include/asm/pgtable.h:24,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      21 | static inline int pgd_none(pgd_t pgd)  { return 0; }
         |                            ^~~~~
         |                            p4d_t
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      22 | static inline int pgd_bad(pgd_t pgd)  { return 0; }
         |                           ^~~~~
         |                           p4d_t
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      23 | static inline int pgd_present(pgd_t pgd) { return 1; }
         |                               ^~~~~
         |                               p4d_t
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      24 | static inline void pgd_clear(pgd_t *pgd) { }
         |                              ^~~~~
         |                              p4d_t
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      35 | static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
         |                                 ^~~~~
         |                                 p4d_t
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   arch/openrisc/include/asm/pgtable.h: In function 'pmd_set':
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)    (p4d_val((x).p4d))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)    (pud_val((x).pud))
         |                        ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:323:2: note: in expansion of macro 'pmd_val'
     323 |  pmd_val(*pmdp) = _KERNPG_TABLE | (unsigned long) ptep;
         |  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h: In function 'pmd_page_vaddr':
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   arch/openrisc/include/asm/page.h:62:43: note: in definition of macro '__va'
      62 | #define __va(x) ((void *)((unsigned long)(x) + PAGE_OFFSET))
         |                                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)    (p4d_val((x).p4d))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)    (pud_val((x).pud))
         |                        ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:331:31: note: in expansion of macro 'pmd_val'
     331 |  return ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK));
         |                               ^~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   arch/openrisc/include/asm/pgtable.h:329:50: warning: parameter 'pmd' set but not used [-Wunused-but-set-parameter]
     329 | static inline unsigned long pmd_page_vaddr(pmd_t pmd)
         |                                            ~~~~~~^~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:167:31: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Werror=implicit-function-declaration]
     167 |  return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                               ^~~~~~~~~~
         |                               pmd_offset
>> include/linux/pgtable.h:167:31: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     167 |  return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               int
   In file included from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/openrisc/include/asm/pgtable.h:24,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' {aka 'struct <anonymous> *'} but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:172:31: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     172 |  return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               int
   In file included from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/openrisc/include/asm/pgtable.h:24,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' {aka 'struct <anonymous> *'} but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'virt_to_kpte':
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)    (p4d_val((x).p4d))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)    (pud_val((x).pud))
         |                        ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:186:23: note: in expansion of macro 'pmd_val'
     186 | #define pmd_none(x) (!pmd_val(x))
         |                       ^~~~~~~
   include/linux/pgtable.h:179:9: note: in expansion of macro 'pmd_none'
     179 |  return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |         ^~~~~~~~
   include/linux/pgtable.h: In function 'pmd_same':
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)    (p4d_val((x).p4d))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)    (pud_val((x).pud))
         |                        ^~~~~~~
   include/linux/pgtable.h:1369:9: note: in expansion of macro 'pmd_val'
    1369 |  return pmd_val(pmd_a) == pmd_val(pmd_b);
         |         ^~~~~~~
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)    (p4d_val((x).p4d))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)    (pud_val((x).pud))
         |                        ^~~~~~~
   include/linux/pgtable.h:1369:27: note: in expansion of macro 'pmd_val'
    1369 |  return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                           ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h:1367:34: warning: parameter 'pmd_a' set but not used [-Wunused-but-set-parameter]
    1367 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1367:47: warning: parameter 'pmd_b' set but not used [-Wunused-but-set-parameter]
    1367 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                                         ~~~~~~^~~~~
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
--
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'p4d_same':
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/linux/pgtable.h:1384:9: note: in expansion of macro 'p4d_val'
    1384 |  return p4d_val(p4d_a) == p4d_val(p4d_b);
         |         ^~~~~~~
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/linux/pgtable.h:1384:27: note: in expansion of macro 'p4d_val'
    1384 |  return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                           ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h:1382:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
    1382 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1382:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
    1382 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1544:6: error: implicit declaration of function 'pgd_none'; did you mean 'pud_none'? [-Werror=implicit-function-declaration]
    1544 |  if (pgd_none(*pgd))
         |      ^~~~~~~~
         |      pud_none
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
   include/linux/pgtable.h:1546:15: error: implicit declaration of function 'pgd_bad'; did you mean 'pud_bad'? [-Werror=implicit-function-declaration]
    1546 |  if (unlikely(pgd_bad(*pgd))) {
         |               ^~~~~~~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pmd_none_or_clear_bad':
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)    (p4d_val((x).p4d))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)    (pud_val((x).pud))
         |                        ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:186:23: note: in expansion of macro 'pmd_val'
     186 | #define pmd_none(x) (!pmd_val(x))
         |                       ^~~~~~~
   include/linux/pgtable.h:1577:6: note: in expansion of macro 'pmd_none'
    1577 |  if (pmd_none(*pmd))
         |      ^~~~~~~~
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
   arch/openrisc/include/asm/page.h:50:24: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x) ((x).pgd)
         |                        ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)    (pgd_val((x).pgd))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)    (p4d_val((x).p4d))
         |                        ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)    (pud_val((x).pud))
         |                        ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:187:22: note: in expansion of macro 'pmd_val'
     187 | #define pmd_bad(x) ((pmd_val(x) & (~PAGE_MASK)) != _KERNPG_TABLE)
         |                      ^~~~~~~
   include/linux/pgtable.h:1579:15: note: in expansion of macro 'pmd_bad'
    1579 |  if (unlikely(pmd_bad(*pmd))) {
         |               ^~~~~~~
   In file included from arch/openrisc/include/asm/pgalloc.h:20,
                    from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:12,
                    from include/linux/iosys-map.h:10,
                    from include/drm/ttm/ttm_resource.h:31,
                    from include/drm/ttm/ttm_device.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:9,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:10:
   include/linux/mm.h: In function 'p4d_alloc':
>> include/linux/mm.h:3639:8: warning: pointer/integer type mismatch in conditional expression
    3639 |   NULL : p4d_offset(pgd, address);
         |        ^
   In file included from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   arch/openrisc/include/asm/pgalloc.h: In function 'pmd_populate':
   arch/openrisc/include/asm/page.h:54:18: error: incompatible types when initializing type 'int' using type 'pgd_t' {aka 'struct <anonymous>'}
      54 | #define __pgd(x) ((pgd_t) { (x) })
         |                  ^
   arch/openrisc/include/asm/pgalloc.h:34:2: note: in expansion of macro 'set_pmd'
      34 |  set_pmd(pmd, __pmd(_KERNPG_TABLE +
         |  ^~~~~~~
   include/asm-generic/pgtable-nop4d.h:41:32: note: in expansion of macro '__pgd'
      41 | #define __p4d(x)    ((p4d_t) { __pgd(x) })
         |                                ^~~~~
   include/asm-generic/pgtable-nopud.h:49:32: note: in expansion of macro '__p4d'
      49 | #define __pud(x)    ((pud_t) { __p4d(x) })
         |                                ^~~~~
   include/asm-generic/pgtable-nopmd.h:53:32: note: in expansion of macro '__pud'
      53 | #define __pmd(x)    ((pmd_t) { __pud(x) } )
         |                                ^~~~~
   arch/openrisc/include/asm/pgalloc.h:34:15: note: in expansion of macro '__pmd'
      34 |  set_pmd(pmd, __pmd(_KERNPG_TABLE +
         |               ^~~~~
   cc1: some warnings being treated as errors


vim +/pud_offset +167 include/linux/pgtable.h

974b9b2c68f3d3 Mike Rapoport 2020-06-08  157  
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  158  /*
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  159   * In many cases it is known that a virtual address is mapped at PMD or PTE
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  160   * level, so instead of traversing all the page table levels, we can get a
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  161   * pointer to the PMD entry in user or kernel page table or translate a virtual
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  162   * address to the pointer in the PTE in the kernel page tables with simple
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  163   * helpers.
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  164   */
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  165  static inline pmd_t *pmd_off(struct mm_struct *mm, unsigned long va)
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  166  {
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08 @167  	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  168  }
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  169  

:::::: The code at line 167 was first introduced by commit
:::::: e05c7b1f2bc4b7b28199b9a7572f73436d97317e mm: pgtable: add shortcuts for accessing kernel PMD and PTE

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
