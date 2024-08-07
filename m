Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EC53612D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723026103; cv=none; b=Xqu8r9FkVpBCQJyDK8+cgSLwqYv2hroi/iraQULh2Yg0MHmjbNRe0GHqSUiaCI/8qMNUPJARVuEJIH33j5JSsLtOjbqx1zicuAAD/h4oCeL2jnnlWLBLrqZp3T7dhvzC+Ifk+b6S8Ld8AKvFBtVr9WD4wF9TeubOMgT/kiual8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723026103; c=relaxed/simple;
	bh=HnpfusNJjQyqOrsGWQ88E5yEo8ECihLbqG96DuUrTDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AaiR/rnrCtD2yNCn4Q2z2wb1k4qiwaEc15prr2h2p4Z5WFwAdDDWxNMezM9tpOhsb/uzMjmwKpTdSNaHF1nGT+jajp1kJise/kaZiI/IptbG0t5uptyETh9SGh7ywnAaAFXb3ucspXi99w9tWLGH6thq5L1cU2ju03F2rLZSf00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nq/YXWGi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nq/YXWGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723026102; x=1754562102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnpfusNJjQyqOrsGWQ88E5yEo8ECihLbqG96DuUrTDo=;
  b=nq/YXWGiuUAh2tMOeoBveV6F6sjQS/MosmGjfkBUazEEHZyfvwXVZenX
   JI2pFOX8xnkGbX96EJ+qQqKfPGhH8Z3MJiryC8sbAQE/01PePSnp/hk6w
   Hhq84DzlChbFd8Hh0wDl95KqW0jsoJnE4Sqzt0tPgI9GNN7MsStImCY7R
   ytV8T9ii4attp8/Gd+u7vYLf+LQhlUup3mnr8GvrrfcGEwMQU2IcpGJDJ
   dkAgHeXEzwxq1Qu2fvxUv0qIH4s5feRcDhxCOdNThuNxzFBQFib7vQVgx
   CFyCfQ1fBos3VjQD7S46fUZkg505afgRq5EfWYs2hd6QxNXlZS8jdxKmq
   g==;
X-CSE-ConnectionGUID: fjAzax+0R8ifMC8+C7/3Ww==
X-CSE-MsgGUID: 1pKRpWEzTl+OhgZkmSnZvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24848708"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="24848708"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 03:21:41 -0700
X-CSE-ConnectionGUID: IZUbq2eFQYqhFF/bKPfQOg==
X-CSE-MsgGUID: Bo1TO1xNSEWFOp2VQg71PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="87742410"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2024 03:21:39 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbdnU-0005Ho-2Z;
	Wed, 07 Aug 2024 10:21:36 +0000
Date: Wed, 7 Aug 2024 18:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 15/18] mm/khugepaged.c:772:39: error: passing
 argument 3 of 'pmd_populate' from incompatible pointer type
Message-ID: <202408071832.Dw0jpbT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   105a369317c56f14df26b6ddbd83d0bd4e20a9cc
commit: 88a0f2a1182f58bd4e05ad4c8efd4d7824f4a225 [15/18] mm/pgtable: pass ptdesc to pmd_populate
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240807/202408071832.Dw0jpbT0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071832.Dw0jpbT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071832.Dw0jpbT0-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/khugepaged.c: In function '__collapse_huge_page_copy_failed':
>> mm/khugepaged.c:772:39: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     772 |         pmd_populate(vma->vm_mm, pmd, (struct ptdesc *)pmd_pgtable(orig_pmd));
   In file included from arch/s390/include/asm/mmu_context.h:11,
                    from arch/s390/include/asm/elf.h:181,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/rmap.h:12,
                    from mm/khugepaged.c:9:
   arch/s390/include/asm/pgalloc.h:129:55: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
     129 |                                 pmd_t *pmd, pgtable_t pte)
         |                                             ~~~~~~~~~~^~~
   mm/khugepaged.c: In function 'collapse_huge_page':
   mm/khugepaged.c:1201:39: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
    1201 |                 pmd_populate(mm, pmd, (struct ptdesc *)pmd_pgtable(_pmd));
   arch/s390/include/asm/pgalloc.h:129:55: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
     129 |                                 pmd_t *pmd, pgtable_t pte)
         |                                             ~~~~~~~~~~^~~


vim +/pmd_populate +772 mm/khugepaged.c

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
 > 772		pmd_populate(vma->vm_mm, pmd, (struct ptdesc *)pmd_pgtable(orig_pmd));
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
