Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2069D3209
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721484780; cv=none; b=CsygI+GiCtSc0RTCn57tWGecww8Wo6Aq8JN4KsQm9U19kbUbutFaevqAV8C223SNM5uHPrNvYl5BX02EzXD/afHLlxy5LyCmEcdpqmoVQz4pBOtGzWfBpgybAypJbpI2efamEWWEQoq5PDcbsUciNXid9OvtksOOJtyjX02CQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721484780; c=relaxed/simple;
	bh=Kwy/anJBMXPnVkiOXsCcKHHKUifA3EXtWSu3ncrbVb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZwkeSjaRSvuP2BU3lwV+c9Le6aXts1hEw2xuRmg1DypUNEW+SSrZXuqJRaF+RQ4ahd+eJ00nzNM8QdwbJTeT9lWxj60DVXlHExzvxMMoyIUGS++UuyeENtH+CeezM+UzyLU/6w42XlDG4yjTya6kh8QOCRJMlOxMGxH9icOMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMoBgMSs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMoBgMSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721484778; x=1753020778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kwy/anJBMXPnVkiOXsCcKHHKUifA3EXtWSu3ncrbVb8=;
  b=LMoBgMSsImlFHR9eIvowOVv0QhNeG47r9i38CE9oPz9mdNr3Z43cVqTD
   oKWIFLvsGg0x3ScuJkMjVpd6sOG2MoWW25uI8krHyAHuezqI5DfnGMLGj
   XX3nq29YbEIehftJjUUp65xK4iGqDx1wohDnm/p1PZS0F2OTuwNr84mHR
   HyfhUBbMtr1XjRBKka2CUiIcuL4rv1bHg9sAW0x+5P5XetR5pU8gTs0A7
   UcPKZOxFrn4KYn/LbDqrGq+eR+8zuXidYqvZBeM4kQNk290p6uEArog9k
   GXWGIjvwRnZM+Y4hXcvyFV8qJtSDbns3qW3iSNKAyHknNt5G9cbgraA+p
   g==;
X-CSE-ConnectionGUID: tpYT0g3xRROEyn8ikhBgKw==
X-CSE-MsgGUID: kKMzCsTCRBOOdqWwZZq4TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18806044"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="18806044"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 07:12:57 -0700
X-CSE-ConnectionGUID: A4ok0BBiSjSQTQQvVaj+AA==
X-CSE-MsgGUID: EkhLaRF5RQOqWwacSJMEbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51372152"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jul 2024 07:12:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVApS-000jGg-1m;
	Sat, 20 Jul 2024 14:12:54 +0000
Date: Sat, 20 Jul 2024 22:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 36/42] mm/khugepaged.c:772:39: error: implicit
 declaration of function 'pmd_ptdesc'; did you mean 'page_ptdesc'?
Message-ID: <202407202207.xwEGNYRV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 84368e4373e673f216fd9b354366ea118ae56b0f [36/42] mm/pgtable: pass ptdesc to pmd_populate
config: i386-buildonly-randconfig-002-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202207.xwEGNYRV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202207.xwEGNYRV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202207.xwEGNYRV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/mremap.c: In function 'move_normal_pmd':
   mm/mremap.c:286:35: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'page_ptdesc'? [-Werror=implicit-function-declaration]
     286 |         pmd_populate(mm, new_pmd, pmd_ptdesc(&pmd));
         |                                   ^~~~~~~~~~
         |                                   page_ptdesc
>> mm/mremap.c:286:35: warning: passing argument 3 of 'pmd_populate' makes pointer from integer without a cast [-Wint-conversion]
     286 |         pmd_populate(mm, new_pmd, pmd_ptdesc(&pmd));
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   int
   In file included from mm/mremap.c:31:
   arch/x86/include/asm/pgalloc.h:79:48: note: expected 'struct ptdesc *' but argument is of type 'int'
      79 |                                 struct ptdesc *pte)
         |                                 ~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   mm/khugepaged.c: In function '__collapse_huge_page_copy_failed':
>> mm/khugepaged.c:772:39: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'page_ptdesc'? [-Werror=implicit-function-declaration]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^~~~~~~~~~
         |                                       page_ptdesc
>> mm/khugepaged.c:772:39: warning: passing argument 3 of 'pmd_populate' makes pointer from integer without a cast [-Wint-conversion]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   In file included from mm/khugepaged.c:26:
   arch/x86/include/asm/pgalloc.h:79:48: note: expected 'struct ptdesc *' but argument is of type 'int'
      79 |                                 struct ptdesc *pte)
         |                                 ~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +772 mm/khugepaged.c

   756	
   757	static void __collapse_huge_page_copy_failed(pte_t *pte,
   758						     pmd_t *pmd,
   759						     pmd_t orig_pmd,
   760						     struct vm_area_struct *vma,
   761						     struct list_head *compound_pagelist)
   762	{
   763		spinlock_t *pmd_ptl;
   764	
   765		/*
   766		 * Re-establish the PMD to point to the original page table
   767		 * entry. Restoring PMD needs to be done prior to releasing
   768		 * pages. Since pages are still isolated and locked here,
   769		 * acquiring anon_vma_lock_write is unnecessary.
   770		 */
   771		pmd_ptl = pmd_lock(vma->vm_mm, pmd);
 > 772		pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
   773		spin_unlock(pmd_ptl);
   774		/*
   775		 * Release both raw and compound pages isolated
   776		 * in __collapse_huge_page_isolate.
   777		 */
   778		release_pte_pages(pte, pte + HPAGE_PMD_NR, compound_pagelist);
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
