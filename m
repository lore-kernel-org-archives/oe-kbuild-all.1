Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD134414
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 13:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721569963; cv=none; b=fXpmTART6MpNxEPkLiIX4gPoiJ94WFQWVF6i7ltFhNX0W5KiOLcbqGb+FDdOHtvcZtOy3XqgjNT7/aj5yy9B6BXHo9jjbJ7BW4HBOB5lT3c642f/OPcLA0zOx5CfplZnTKBUghSgnDhgVQDAyMaR+o/agWd/eUv8dgvRBy27zig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721569963; c=relaxed/simple;
	bh=C44d/2uFdbkEM5j/bupI3f7IOsesQX5Mx3xiFd/yvGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qt3Rd5M5QazUsSurbn5wO3Li0MbrAnr4pmwtVJ527nUDjNQipqvwM4DMYINxxjomTAeUJMH255+38Wv3obarKWz8OE4z/YcYG4+IRjI80jiSCoPugTEgHj89t/+RerCwtBu0NQDGH6yjec6xW3ZCcHRj7q9mPXq+jVlWKlsih+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuTExIzX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuTExIzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721569961; x=1753105961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C44d/2uFdbkEM5j/bupI3f7IOsesQX5Mx3xiFd/yvGU=;
  b=YuTExIzXrDowC1EW6UaRfvsx2He/qmX72uH4nDrz9UO2jRfqdkOfbPC1
   FUSvwTEixZDy4eLCthncMz71qzilnw7e8pp/2D3nGfRsxwhZJeiheGx8E
   Bvj58U3DbgDlCpDbDZXjpKlFQ9SDEoJbj0X+94ZNyQOIYLcb48hsG2x9+
   cMm9Jmc7uoSRhR9feeBHRPt1ZKxt8t/MwpK4FdaE3BW1o6qYtzbSu/zsq
   zaPr3JVwHhayv4MdZRsBp9NOP5qxVCKJiFWfzeyDD4R/zqGr5ZYw5C0Q5
   ajQSzcpURVTz03CUt24luXfQlrU2bqtVBRO/QC6ynTN1tsWzKEttc7G8x
   w==;
X-CSE-ConnectionGUID: N4bvLYN+R2yeWd8aXpYqeg==
X-CSE-MsgGUID: 6y1Ve7vTS9a7uKKc24ahQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18982394"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="18982394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 06:52:41 -0700
X-CSE-ConnectionGUID: FsR8EMgeS+Cb5PqRvTXuSQ==
X-CSE-MsgGUID: IJKexGd/Rwyv2S69m9Mpig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56457416"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jul 2024 06:52:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVWzN-000kJ4-1I;
	Sun, 21 Jul 2024 13:52:37 +0000
Date: Sun, 21 Jul 2024 21:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 34/43] mm/huge_memory.c:1829:9: error:
 incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t'
 (aka 'pte_t *')
Message-ID: <202407212104.cPTXy5lS-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240721/202407212104.cPTXy5lS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407212104.cPTXy5lS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407212104.cPTXy5lS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/huge_memory.c:1013:24: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1013 |                 pte_free(vma->vm_mm, ptdesc);
         |                                      ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1064:38: error: incompatible pointer types passing 'struct page *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1064 |         pgtable_trans_huge_deposit(mm, pmd, ptdesc_page(ptdesc));
         |                                             ^~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:502:27: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:35: note: passing argument to parameter 'pgtable' here
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                                      ^
   mm/huge_memory.c:1096:25: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1096 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1106:26: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1106 |                                 pte_free(vma->vm_mm, ptdesc);
         |                                                      ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1109:26: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1109 |                                 pte_free(vma->vm_mm, ptdesc);
         |                                                      ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1120:25: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1120 |                         pte_free(vma->vm_mm, ptdesc);
         |                                              ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1167:39: error: incompatible pointer types passing 'struct page *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1167 |                 pgtable_trans_huge_deposit(mm, pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:502:27: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:35: note: passing argument to parameter 'pgtable' here
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                                      ^
   mm/huge_memory.c:1178:16: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1178 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1404:47: error: incompatible pointer types passing 'struct page *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1404 |                 pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
         |                                                             ^~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:502:27: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:35: note: passing argument to parameter 'pgtable' here
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                                      ^
   mm/huge_memory.c:1414:20: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1414 |                 pte_free(dst_mm, ptdesc);
         |                                  ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1440:20: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1440 |                 pte_free(dst_mm, ptdesc);
         |                                  ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1449:46: error: incompatible pointer types passing 'struct page *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1449 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
         |                                                     ^~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:502:27: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:35: note: passing argument to parameter 'pgtable' here
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                                      ^
>> mm/huge_memory.c:1829:9: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1829 |         ptdesc = pgtable_trans_huge_withdraw(mm, pmd);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:1830:15: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1830 |         pte_free(mm, ptdesc);
         |                      ^~~~~~
   arch/powerpc/include/asm/pgalloc.h:43:61: note: passing argument to parameter 'ptepage' here
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                             ^
   mm/huge_memory.c:1960:11: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1960 |                         ptdesc = pgtable_trans_huge_withdraw(mm, old_pmd);
         |                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:1961:44: error: incompatible pointer types passing 'struct page *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1961 |                         pgtable_trans_huge_deposit(mm, new_pmd, ptdesc_page(ptdesc));
         |                                                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:502:27: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:35: note: passing argument to parameter 'pgtable' here
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                                      ^
   mm/huge_memory.c:2235:13: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    2235 |         src_ptdesc = pgtable_trans_huge_withdraw(mm, src_pmd);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


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
