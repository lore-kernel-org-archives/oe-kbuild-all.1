Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFA62F44
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721549114; cv=none; b=R/oex68vrmsCH86G7BY0zJBWs43UH1w+mFSdxr3FlyIAzkMoQqzLQFwj3lAIxo3rtQRB7hYdgY16JdgsufJBIlbBCKk+ugGzB+kvj+2yO8SJyOtXDrXkzSaJKP7Xz12b7ydavcjezH5tbE0s6hWV5vp+7zvD4E3qiHqD/fYzEjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721549114; c=relaxed/simple;
	bh=05LqlKmjyKdCcyehXnqvnVpLjsLbmSebeNEI9GvgSUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pG1woG5YvZjwRwP4kB/v2kSKwgt73x0drbEjFQL7cVRYVKESR/CSQtHtQZsflxvrlsRRml7lRojQVyd336bCTtWGwpHy/JXErRxyuucMaB5Bb+OhOHc9b06jl74/UxdKbuZl0Dk8WbTPuT5J/kZJekpEfar7On4kGaiXYmaFlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSNOGBK7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSNOGBK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721549113; x=1753085113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05LqlKmjyKdCcyehXnqvnVpLjsLbmSebeNEI9GvgSUU=;
  b=HSNOGBK7+axjApwwjmlVR7TfrR1pOS8y7OmRTHjDXsVZQEH18wtxtO3L
   02DGFdMc3MoSTSVBrr38IiJmgh2P2zcxnPWHxtK3Z3QV57WmXQ5XMpZyc
   5X7ngZ1WfLA8W3feNI0UOFeMiu+OxZoNqvPqAgO2o5+zx/9TRNBBFTIPP
   RUaoFrVcKbEsO9P4Hsh8e0EDNabudYEOGBtlln00DWKQWC47t6+PuVm4y
   bzqtadRh9D4owoOZxu0xwLYR8Z20mY2Va3AkRKPNil+eh79BB5kKP163f
   i/CpY9qsDZsjs9JXjqqysmCSF1nGDFA4qFLm3r9p1/cjbHpOkZ2xX+REY
   g==;
X-CSE-ConnectionGUID: 017XpiNsRX6WDJlOnaocrw==
X-CSE-MsgGUID: jjIcae+NRBug66uEtdADOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19258145"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="19258145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 01:05:12 -0700
X-CSE-ConnectionGUID: 0xEfI6syRGqN3xZTL4X1Cw==
X-CSE-MsgGUID: yoca78CMTeS4R/zx//efTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56394040"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jul 2024 01:05:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVRZ5-000k4Q-2a;
	Sun, 21 Jul 2024 08:05:07 +0000
Date: Sun, 21 Jul 2024 16:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 34/43] mm/huge_memory.c:1829:16: error:
 assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t'
 {aka 'pte_t *'}
Message-ID: <202407211526.uoGLAJfs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6c298a18633e397b8be4d6f48fc8cd1f860dd896
commit: 8b464a88364f8c7a51ee0baf4a79c6a22f1ae9ef [34/43] mm/pgtable: return ptdesc pointer in pgtable_trans_huge_withdraw
config: powerpc64-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211526.uoGLAJfs-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211526.uoGLAJfs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211526.uoGLAJfs-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1106:54: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1106 |                                 pte_free(vma->vm_mm, ptdesc);
         |                                                      ^~~~~~
         |                                                      |
         |                                                      struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1109:54: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1109 |                                 pte_free(vma->vm_mm, ptdesc);
         |                                                      ^~~~~~
         |                                                      |
         |                                                      struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1120:46: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1120 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
         |                                              |
         |                                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'insert_pfn_pmd':
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1167:53: note: in expansion of macro 'ptdesc_page'
    1167 |                 pgtable_trans_huge_deposit(mm, pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1178:30: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1178 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
         |                              |
         |                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'copy_huge_pmd':
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1404:61: note: in expansion of macro 'ptdesc_page'
    1404 |                 pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
         |                                                             ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1414:34: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1414 |                 pte_free(dst_mm, ptdesc);
         |                                  ^~~~~~
         |                                  |
         |                                  struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c:1440:34: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1440 |                 pte_free(dst_mm, ptdesc);
         |                                  ^~~~~~
         |                                  |
         |                                  struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1449:53: note: in expansion of macro 'ptdesc_page'
    1449 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'zap_deposited_table':
>> mm/huge_memory.c:1829:16: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    1829 |         ptdesc = pgtable_trans_huge_withdraw(mm, pmd);
         |                ^
   mm/huge_memory.c:1830:22: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1830 |         pte_free(mm, ptdesc);
         |                      ^~~~~~
         |                      |
         |                      struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'move_huge_pmd':
   mm/huge_memory.c:1960:32: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    1960 |                         ptdesc = pgtable_trans_huge_withdraw(mm, old_pmd);
         |                                ^
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:1961:65: note: in expansion of macro 'ptdesc_page'
    1961 |                         pgtable_trans_huge_deposit(mm, new_pmd, ptdesc_page(ptdesc));
         |                                                                 ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function 'move_pages_huge_pmd':
   mm/huge_memory.c:2235:20: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    2235 |         src_ptdesc = pgtable_trans_huge_withdraw(mm, src_pmd);
         |                    ^
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:2236:49: note: in expansion of macro 'ptdesc_page'
    2236 |         pgtable_trans_huge_deposit(mm, dst_pmd, ptdesc_page(src_ptdesc));
         |                                                 ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/huge_memory.c: In function '__split_huge_zero_page_pmd':
   mm/huge_memory.c:2364:16: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    2364 |         ptdesc = pgtable_trans_huge_withdraw(mm, pmd);
         |                ^
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:2365:33: note: in expansion of macro 'ptdesc_page'
    2365 |         pmd_populate(mm, &_pmd, ptdesc_page(ptdesc));
         |                                 ^~~~~~~~~~~
   In file included from arch/powerpc/include/asm/book3s/pgalloc.h:10,
                    from arch/powerpc/include/asm/pgalloc.h:72:
   arch/powerpc/include/asm/book3s/64/pgalloc.h:165:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
     165 |                                 pgtable_t pte_page)
         |                                 ~~~~~~~~~~^~~~~~~~
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:2382:31: note: in expansion of macro 'ptdesc_page'
    2382 |         pmd_populate(mm, pmd, ptdesc_page(ptdesc));
         |                               ^~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgalloc.h:165:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
     165 |                                 pgtable_t pte_page)
         |                                 ~~~~~~~~~~^~~~~~~~
   mm/huge_memory.c: In function '__split_huge_pmd_locked':
   mm/huge_memory.c:2536:16: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
    2536 |         ptdesc = pgtable_trans_huge_withdraw(mm, pmd);
         |                ^
   include/linux/mm_types.h:504:41: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/huge_memory.c:2537:33: note: in expansion of macro 'ptdesc_page'
    2537 |         pmd_populate(mm, &_pmd, ptdesc_page(ptdesc));
         |                                 ^~~~~~~~~~~


vim +1829 mm/huge_memory.c

  1824	
  1825	static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
  1826	{
  1827		struct ptdesc *ptdesc;
  1828	
> 1829		ptdesc = pgtable_trans_huge_withdraw(mm, pmd);
  1830		pte_free(mm, ptdesc);
  1831		mm_dec_nr_ptes(mm);
  1832	}
  1833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
