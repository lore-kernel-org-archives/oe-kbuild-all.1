Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E403931C567
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766425346; cv=none; b=IxFYg4UaA9PYOXVabt6W77CtayO7IILURmvpXK3NtJTUIMKHBgTtmUEpy6qrXLY5lVMKxRr+LiZOKODnk/UKk1VRQXxjtu26/3y93cy5hAI5rWyUXKz71GIigoXmUTPeRS3mdTy5gszhhrNqh9tu9XfDt8kMiGq6X6kH+jgVPo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766425346; c=relaxed/simple;
	bh=OmPECR7b5cVH5orCA/ZpVFUL6VtFKt99jmlg40EWCdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C2LnMQ000y70AFSZmoYepmxdVudfyRoeaVaGte1KAEilUeYZ60AZYTiFMnUUHP5W5jDglaKnuMtzbS84eoT4DyGbMv6AYzcs00Xl1aQlynYzRZGvujj3/Lx7fd5ftRCg24QGPYMvBO5eM1hGQlDfT6Opr34+zaEfqOcmZN3MN94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtMBJ8Aw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtMBJ8Aw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766425345; x=1797961345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmPECR7b5cVH5orCA/ZpVFUL6VtFKt99jmlg40EWCdM=;
  b=TtMBJ8AwgzSiSieujDhbWtKYnNsAxEPknTYVa6PRyEa5xID8XG3iZkzY
   id56XSHG/FYrIpKh0M6/z/kwG9c1UKvJDmEloYKdidkKelADaoK5LQQr1
   9tuRQModR8tKxPU0u4GyfyE1UJLDsd+gCR3ysVOt/S5tSZGNy/c/AMJ7y
   zWlFmLFh/yBrT1LCCtYnmgSl0niUUr4MHa34DzSSSyuhS+wZ5Kpv4/V81
   Ln2HGzJ6lV8D280PGKVuTyc2C5otWFybRktBb7s3l4fgZ+hdLFRY1Wa4c
   US8iXYtRIzC6+CdbE+UHNkztVKXsO77TQQteHMoK0XpOkPXQzgNniCgE/
   A==;
X-CSE-ConnectionGUID: rJIsKdMoRBuJ5subsj2jJw==
X-CSE-MsgGUID: gx7J5S3fRbCGk8whN9ZCDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67475404"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67475404"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:42:24 -0800
X-CSE-ConnectionGUID: sQ9ZxMowRnaQ/CoFZpxsJQ==
X-CSE-MsgGUID: KBa3Heb3Q+OcLVF35L0aXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="230233050"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 09:42:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjvI-000000005ZO-3Pzi;
	Mon, 22 Dec 2025 17:42:20 +0000
Date: Mon, 22 Dec 2025 18:42:14 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable14 1/2] ./include/linux/mm_types.h:633:51: error:
 '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not
 compatible with any association
Message-ID: <202512221855.U8xBOJci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable14
head:   d9bb8deea009b236ba354e09f922bfa97741bced
commit: 75736837bf306bf5c2a2d52cc5ac9e74f187a116 [1/2] mm/pgtable: use ptdesc for pgtable pointer-6.19
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512221855.U8xBOJci-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221855.U8xBOJci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221855.U8xBOJci-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/mmzone.h:22,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:7,
                    from mm/memory.c:43:
   mm/memory.c: In function 'deposit_prealloc_pte':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/memory.c:5355:41: note: in expansion of macro 'page_ptdesc'
    5355 |                                         page_ptdesc(vmf->prealloc_pte));
         |                                         ^~~~~~~~~~~
--
   In file included from ./include/linux/mmzone.h:22,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:7,
                    from mm/huge_memory.c:8:
   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1356:49: note: in expansion of macro 'page_ptdesc'
    1356 |                                                 page_ptdesc(pgtable));
         |                                                 ^~~~~~~~~~~
   mm/huge_memory.c: In function 'set_huge_zero_folio':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1454:45: note: in expansion of macro 'page_ptdesc'
    1454 |         pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
         |                                             ^~~~~~~~~~~
   mm/huge_memory.c: In function 'insert_pmd':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1580:53: note: in expansion of macro 'page_ptdesc'
    1580 |                 pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c: In function 'copy_huge_non_present_pmd':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1841:53: note: in expansion of macro 'page_ptdesc'
    1841 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c: In function 'copy_huge_pmd':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:1936:53: note: in expansion of macro 'page_ptdesc'
    1936 |         pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
         |                                                     ^~~~~~~~~~~
   mm/huge_memory.c: In function 'move_huge_pmd':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:2498:57: note: in expansion of macro 'page_ptdesc'
    2498 |                                                         page_ptdesc(pgtable));
         |                                                         ^~~~~~~~~~~
   mm/huge_memory.c: In function 'move_pages_huge_pmd':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/huge_memory.c:2804:49: note: in expansion of macro 'page_ptdesc'
    2804 |         pgtable_trans_huge_deposit(mm, dst_pmd, page_ptdesc(src_pgtable));
         |                                                 ^~~~~~~~~~~
--
   In file included from ./include/linux/mmzone.h:22,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:7,
                    from mm/khugepaged.c:4:
   mm/khugepaged.c: In function 'collapse_huge_page':
>> ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/khugepaged.c:1231:45: note: in expansion of macro 'page_ptdesc'
    1231 |         pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
         |                                             ^~~~~~~~~~~
--
   arch/s390/mm/pgtable.c: In function 'pgtable_trans_huge_withdraw':
>> arch/s390/mm/pgtable.c:546:17: error: assignment to 'pgtable_t' {aka 'long unsigned int *'} from incompatible pointer type 'struct ptdesc *' [-Wincompatible-pointer-types]
     546 |         pgtable = pmd_huge_pte(mm, pmdp);
         |                 ^
   In file included from ./arch/s390/include/asm/processor.h:37,
                    from ./include/linux/sched.h:13,
                    from arch/s390/mm/pgtable.c:9:
   ./arch/s390/include/asm/page.h:120:16: note: 'pgtable_t' declared here
     120 | typedef pte_t *pgtable_t;
         |                ^~~~~~~~~
>> arch/s390/mm/pgtable.c:551:40: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' {aka 'long unsigned int *'} [-Wincompatible-pointer-types]
     551 |                 pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
         |                                        ^


vim +633 ./include/linux/mm_types.h

9a35de4ffc209b Vishal Moola (Oracle  2023-08-07  624) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  625) #define ptdesc_page(pt)			(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  626) 	const struct ptdesc *:		(const struct page *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  627) 	struct ptdesc *:		(struct page *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  628) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  629) #define ptdesc_folio(pt)		(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  630) 	const struct ptdesc *:		(const struct folio *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  631) 	struct ptdesc *:		(struct folio *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  632) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07 @633) #define page_ptdesc(p)			(_Generic((p),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  634) 	const struct page *:		(const struct ptdesc *)(p),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  635) 	struct page *:			(struct ptdesc *)(p)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  636) 

:::::: The code at line 633 was first introduced by commit
:::::: bf2d4334f72e4e033166c5a3bf1331a7238eab9d mm: add utility functions for ptdesc

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
