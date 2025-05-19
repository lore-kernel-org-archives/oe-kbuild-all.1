Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599726D4C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645689; cv=none; b=PlcerrwSKBYaOJrfcdzDXkJxtoMQHdlUvBeOHtjGP04XmQqI3P97HZ1XqJEO+2024SgS+dk7LFJ7h0E9IejVr61EdYVhik7RDc+VUylGVUPOrUkPYdz9K2H5Ot/F/mZjlWCvRJTEbOT6oCAVtaGoLnaY6YtX9Ly8Thv43yfPcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645689; c=relaxed/simple;
	bh=gfZ9hNdM/Nwa4ZkeAXWHdFzf87a9mrPlG8uJNZw+bXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZHcjlEirpbYRrslGp9yqPxOiJBo15pOv8WKrDuyu54cY3fJuKCE612Ro5v9XF1C6taSgZwgX70zujLpRZQJKx1bOfD3PVdnJUlVfA7srg4IITXhKQvilB1XIRP+icc15ecm1dFFvyLiA6zkWbZyFnju0J03QumhThPoZl/aYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWcGyjUt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWcGyjUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747645687; x=1779181687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gfZ9hNdM/Nwa4ZkeAXWHdFzf87a9mrPlG8uJNZw+bXk=;
  b=EWcGyjUtaIzvWwqzT6Boa1kqI088RABGDsBxdg6zgm1CsbnqBpopfPw9
   o0b9cny5fbtBsAtuL1lGGakxybk4gLuCfSgWFyWVCFV6A8fN1tqbYFXXh
   2H23nSPHNopIkjO3cm2lgeeTlP9FKK+IAnTLsbH3UD64MVxKIZ71ShGI0
   YMtwnz+BsTnwOXs5ht0h3OPOovOTTNgmZySvIoHFQ3sRhKTPv3MT4+Oyd
   tUl5uD/bRcDAdRK7wdxQQm2xQudPPBrk/oXGliHtm4oHFX8tthLktDkOg
   IM5jGJxjjAFFJLPGqxlYk1fwzstlR56/HaumKLwuKqskZ4MOtGLqkftIB
   A==;
X-CSE-ConnectionGUID: OueupxtLSZKzHXfCb8eVPQ==
X-CSE-MsgGUID: EKHH/6RtTc24ztJ1I6IKfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60931012"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60931012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 02:08:06 -0700
X-CSE-ConnectionGUID: PBrOzyV7RuaS3NjQ3vG38w==
X-CSE-MsgGUID: m+gcB3cnT6WY5nIVK9+Vfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="176427061"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2025 02:08:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGwTa-000LJN-1w;
	Mon, 19 May 2025 09:08:02 +0000
Date: Mon, 19 May 2025 17:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 52/75] include/linux/huge_mm.h:445:37:
 warning: parameter 'pmd' set but not used
Message-ID: <202505191913.1tfQTWNB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 4f9ec797adddb85edd77bc785348b440d8025dc9 [52/75] mm: guestmem_hugetlb: Wrap HugeTLB as an allocator for guest_memfd
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250519/202505191913.1tfQTWNB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191913.1tfQTWNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191913.1tfQTWNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/pgtable.h:1076:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
    1076 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1076:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
    1076 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1238:13: error: implicit declaration of function 'pgd_none'; did you mean 'pud_none'? [-Wimplicit-function-declaration]
    1238 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             pud_none
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from arch/arc/include/asm/pgtable.h:9:
   include/linux/pgtable.h:1240:22: error: implicit declaration of function 'pgd_bad'; did you mean 'pud_bad'? [-Wimplicit-function-declaration]
    1240 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/pgtable.h: In function 'pmd_none_or_clear_bad':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
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
   arch/arc/include/asm/pgtable-levels.h:156:35: note: in expansion of macro 'pmd_val'
     156 | #define pmd_none(x)             (!pmd_val(x))
         |                                   ^~~~~~~
   include/linux/pgtable.h:1271:13: note: in expansion of macro 'pmd_none'
    1271 |         if (pmd_none(*pmd))
         |             ^~~~~~~~
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
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
   arch/arc/include/asm/pgtable-levels.h:157:35: note: in expansion of macro 'pmd_val'
     157 | #define pmd_bad(x)              ((pmd_val(x) & ~PAGE_MASK))
         |                                   ^~~~~~~
   include/linux/pgtable.h:1273:22: note: in expansion of macro 'pmd_bad'
    1273 |         if (unlikely(pmd_bad(*pmd))) {
         |                      ^~~~~~~
   include/linux/huge_mm.h: In function 'is_swap_pmd':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
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
   arch/arc/include/asm/pgtable-levels.h:156:35: note: in expansion of macro 'pmd_val'
     156 | #define pmd_none(x)             (!pmd_val(x))
         |                                   ^~~~~~~
   include/linux/huge_mm.h:447:17: note: in expansion of macro 'pmd_none'
     447 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                 ^~~~~~~~
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
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
   arch/arc/include/asm/pgtable-levels.h:158:34: note: in expansion of macro 'pmd_val'
     158 | #define pmd_present(x)          (pmd_val(x))
         |                                  ^~~~~~~
   include/linux/huge_mm.h:447:35: note: in expansion of macro 'pmd_present'
     447 |         return !pmd_none(pmd) && !pmd_present(pmd);
         |                                   ^~~~~~~~~~~
   In file included from include/linux/mm.h:1238,
                    from include/linux/bootmem_info.h:5,
                    from mm/hugetlb_vmemmap.c:15:
>> include/linux/huge_mm.h:445:37: warning: parameter 'pmd' set but not used [-Wunused-but-set-parameter]
     445 | static inline int is_swap_pmd(pmd_t pmd)
         |                               ~~~~~~^~~
   include/linux/huge_mm.h: In function 'pmd_trans_huge_lock':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
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
   arch/arc/include/asm/hugepage.h:45:34: note: in expansion of macro 'pmd_val'
      45 | #define pmd_trans_huge(pmd)     (pmd_val(pmd) & _PAGE_HW_SZ)
         |                                  ^~~~~~~
   include/linux/huge_mm.h:454:34: note: in expansion of macro 'pmd_trans_huge'
     454 |         if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd))
         |                                  ^~~~~~~~~~~~~~
   include/linux/huge_mm.h: In function 'is_huge_zero_pmd':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
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
   arch/arc/include/asm/pgtable-levels.h:158:34: note: in expansion of macro 'pmd_val'
     158 | #define pmd_present(x)          (pmd_val(x))
         |                                  ^~~~~~~
   include/linux/huge_mm.h:492:16: note: in expansion of macro 'pmd_present'
     492 |         return pmd_present(pmd) && READ_ONCE(huge_zero_pfn) == pmd_pfn(pmd);
         |                ^~~~~~~~~~~
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
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
   arch/arc/include/asm/pgtable-levels.h:161:35: note: in expansion of macro 'pmd_val'
     161 | #define pmd_pfn(pmd)            ((pmd_val(pmd) & PAGE_MASK) >> PAGE_SHIFT)
         |                                   ^~~~~~~
   include/linux/huge_mm.h:492:64: note: in expansion of macro 'pmd_pfn'
     492 |         return pmd_present(pmd) && READ_ONCE(huge_zero_pfn) == pmd_pfn(pmd);
         |                                                                ^~~~~~~
   include/linux/huge_mm.h:490:43: warning: parameter 'pmd' set but not used [-Wunused-but-set-parameter]
     490 | static inline bool is_huge_zero_pmd(pmd_t pmd)
         |                                     ~~~~~~^~~
   include/linux/mm.h: In function 'p4d_alloc':
   include/linux/mm.h:2953:22: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
    2953 |                 NULL : p4d_offset(pgd, address);
         |                      ^
   In file included from include/linux/pgtable.h:14:
   include/linux/mm.h: In function 'pte_lockptr':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/linux/mm_types.h:611:52: note: in definition of macro 'page_ptdesc'
     611 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                    ^
   include/asm-generic/memory_model.h:66:21: note: in expansion of macro '__pfn_to_page'
      66 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/pgtable-levels.h:162:33: note: in expansion of macro 'virt_to_page'
     162 | #define pmd_page(pmd)           virt_to_page((void *)pmd_page_vaddr(pmd))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:160:34: note: in expansion of macro 'pmd_val'
     160 | #define pmd_page_vaddr(pmd)     (pmd_val(pmd) & PAGE_MASK)
         |                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:162:54: note: in expansion of macro 'pmd_page_vaddr'
     162 | #define pmd_page(pmd)           virt_to_page((void *)pmd_page_vaddr(pmd))
         |                                                      ^~~~~~~~~~~~~~
   include/linux/mm.h:3054:39: note: in expansion of macro 'pmd_page'
    3054 |         return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
         |                                       ^~~~~~~~
   arch/arc/include/asm/pgalloc.h: In function 'pmd_populate_kernel':
   arch/arc/include/asm/page.h:42:25: error: incompatible types when initializing type 'int' using type 'pgd_t'
      42 | #define __pgd(x)        ((pgd_t) { (x) })

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HUGETLB_PAGE_OPTIMIZE_VMEMMAP
   Depends on [n]: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP [=n] && SPARSEMEM_VMEMMAP [=n]
   Selected by [y]:
   - GUESTMEM_HUGETLB [=y]
   WARNING: unmet direct dependencies detected for HUGETLBFS
   Depends on [n]: (X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=n] || BROKEN [=n]) && (SYSFS [=y] || SYSCTL [=y])
   Selected by [y]:
   - GUESTMEM_HUGETLB [=y]


vim +/pmd +445 include/linux/huge_mm.h

84c3fc4e9c563d Zi Yan 2017-09-08  444  
84c3fc4e9c563d Zi Yan 2017-09-08 @445  static inline int is_swap_pmd(pmd_t pmd)
84c3fc4e9c563d Zi Yan 2017-09-08  446  {
84c3fc4e9c563d Zi Yan 2017-09-08  447  	return !pmd_none(pmd) && !pmd_present(pmd);
84c3fc4e9c563d Zi Yan 2017-09-08  448  }
84c3fc4e9c563d Zi Yan 2017-09-08  449  

:::::: The code at line 445 was first introduced by commit
:::::: 84c3fc4e9c563d8fb91cfdf5948da48fe1af34d3 mm: thp: check pmd migration entry in common path

:::::: TO: Zi Yan <zi.yan@cs.rutgers.edu>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
