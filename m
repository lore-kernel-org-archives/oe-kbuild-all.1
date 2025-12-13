Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AFF26E719
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765609213; cv=none; b=Ec82e4aNLSSHw/x0rgDya05JPcnm4ZXRDn+oDLO0OGcg3YAlhVX+7SUgG+SyrGQWwvpwHC+DRySqGNeKnETnDH/ti8dMAfTWc7+7D0fY9+3Yz4IUxzTonnEadLKREkHdF7z3i4hgGl5z2M6jyf4JTpIZHvvPaNBMR15IprEXvIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765609213; c=relaxed/simple;
	bh=NJJAtHnywgTGbmDcWP0qcMykmZ+A2s8+ywnIfAFGcf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NcfG5SQ0IoypAEdonk1RMLzzTYu0pB6MQbsmQq0Hm2KJvJP/r8m5sHME+JuvjMSFITvvUfG+uQ//qG2lDoxsUy5R5+Br/18MUHds+w0KT2UDwTcMI2z2P1Q8YnApEzxejph6njAnxjub/TleGxeHyhFcp6bwmTjZPiO7LoAkSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWZIL4aD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWZIL4aD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765609212; x=1797145212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJJAtHnywgTGbmDcWP0qcMykmZ+A2s8+ywnIfAFGcf8=;
  b=nWZIL4aD9J6S/1KC5CX/Zr9wpmRfDEnOdtBOYjQW8zz8oBZrleUT6yoB
   XvSTLddLuIPv0azrLJ/E9VyUcvxJd7VqP3WP79RqlBalKC/S9JrsDgsTP
   yUBtNZh+h0FQadWEszj45F3oNLC8VZ0efuPGj0PLC4fwtrVMHmiSmswFV
   hXN8NUdNa4ttOizjSV3MII+sygCewPdHyGpKiJitMAzotgqOSozdnB69Y
   UWU/KBwYMdAGBASEtDT4n5VxPsozvUP94A+RQxt9K8g3BozqQUSJ3aRzy
   xFV8OS6OI/FHHGcT/aZp2tF4rZZF4ZR5+rr3InmTo6BuJn7+UeNlaVM9g
   w==;
X-CSE-ConnectionGUID: LR7NHX5AQMG8E+0j0Gid8Q==
X-CSE-MsgGUID: UjlKHfgyRRSGAsGhI6yv9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66591555"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66591555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:00:11 -0800
X-CSE-ConnectionGUID: J4pfRXBWR+mbVhUbS/u8vA==
X-CSE-MsgGUID: ONCxnsCmTTiOeVsmVSO2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202353441"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2025 23:00:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJbr-000000007Cv-22gu;
	Sat, 13 Dec 2025 07:00:07 +0000
Date: Sat, 13 Dec 2025 14:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable20251212 1/2] include/linux/mm_types.h:607:36:
 error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is
 not compatible with any association
Message-ID: <202512131417.mRojYH1d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable20251212
head:   e5288cc28febf288d2453ca3b4895a0bfd53f28a
commit: f0d01cac9f10dfe6f6cd671dca7d02581c67587a [1/2] mm/pgtable: use ptdesc for pgtable pointer
config: sparc-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131417.mRojYH1d-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131417.mRojYH1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131417.mRojYH1d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/memory.c:43:
   mm/memory.c: In function 'deposit_prealloc_pte':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/memory.c:5316:6: note: in expansion of macro 'page_ptdesc'
         page_ptdesc(vmf->prealloc_pte));
         ^~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/huge_memory.c:8:
   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1274:7: note: in expansion of macro 'page_ptdesc'
          page_ptdesc(pgtable));
          ^~~~~~~~~~~
   mm/huge_memory.c: In function 'set_huge_zero_folio':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1335:38: note: in expansion of macro 'page_ptdesc'
     pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
                                         ^~~~~~~~~~~
   mm/huge_memory.c: In function 'insert_pmd':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1461:39: note: in expansion of macro 'page_ptdesc'
      pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
                                          ^~~~~~~~~~~
   mm/huge_memory.c: In function 'copy_huge_pmd':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1766:46: note: in expansion of macro 'page_ptdesc'
     pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
                                                 ^~~~~~~~~~~
   mm/huge_memory.c: In function 'move_huge_pmd':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:2323:8: note: in expansion of macro 'page_ptdesc'
           page_ptdesc(pgtable));
           ^~~~~~~~~~~
   mm/huge_memory.c: In function 'move_pages_huge_pmd':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:2646:42: note: in expansion of macro 'page_ptdesc'
     pgtable_trans_huge_deposit(mm, dst_pmd, page_ptdesc(src_pgtable));
                                             ^~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/khugepaged.c:4:
   mm/khugepaged.c: In function 'collapse_huge_page':
>> include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/khugepaged.c:1234:38: note: in expansion of macro 'page_ptdesc'
     pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
                                         ^~~~~~~~~~~
--
   arch/sparc/mm/tlb.c: In function 'pgtable_trans_huge_withdraw':
>> arch/sparc/mm/tlb.c:295:10: error: assignment to 'pgtable_t' {aka 'struct <anonymous> *'} from incompatible pointer type 'struct ptdesc *' [-Werror=incompatible-pointer-types]
     pgtable = pmd_huge_pte(mm, pmdp);
             ^
>> arch/sparc/mm/tlb.c:300:26: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' {aka 'struct <anonymous> *'} [-Werror=incompatible-pointer-types]
      pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
                             ^
   cc1: some warnings being treated as errors


vim +607 include/linux/mm_types.h

9a35de4ffc209b Vishal Moola (Oracle  2023-08-07  598) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  599) #define ptdesc_page(pt)			(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  600) 	const struct ptdesc *:		(const struct page *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  601) 	struct ptdesc *:		(struct page *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  602) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  603) #define ptdesc_folio(pt)		(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  604) 	const struct ptdesc *:		(const struct folio *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  605) 	struct ptdesc *:		(struct folio *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  606) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07 @607) #define page_ptdesc(p)			(_Generic((p),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  608) 	const struct page *:		(const struct ptdesc *)(p),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  609) 	struct page *:			(struct ptdesc *)(p)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  610) 

:::::: The code at line 607 was first introduced by commit
:::::: bf2d4334f72e4e033166c5a3bf1331a7238eab9d mm: add utility functions for ptdesc

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
