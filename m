Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3B433A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 16:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722357413; cv=none; b=XsUPnpmcWjMsd78taaY41XewUiLbOPC3GCv1QRbF/Np0dI23wP4gsvFLAuubYWsDDnlMQvYZq0ZlLlukW5HUDfU3Dk09I/a6CoF5tX9bDvgYnWPqdBOGueuKzzjxNetahMoSMe01h6ir/WqyOBgEcA9J3jHxAUPmvM7E6FBdoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722357413; c=relaxed/simple;
	bh=tBXOdRcPQ7yHNtR1UIz+tQuT5rnEfUmOdIutB1iLRbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBLUUYDAcFaRIHmxBrXnd8zX9GOK4DOkZtN32q3+LvDecQyTrj38EvHKmyBDE4FOg+1Sad36jppq2cyzIhxBzSlbzpg/e1zQEg1xILg2MfbJUe34FtBCjCojJCQh7XnJHSUIGU6+tbt1OMFaRFTP+MTqMv5OJAyva1jgY+DQ+jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qv1hFtsL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv1hFtsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722357412; x=1753893412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBXOdRcPQ7yHNtR1UIz+tQuT5rnEfUmOdIutB1iLRbM=;
  b=Qv1hFtsLFg+m30bURkfhfB+ncADhPZ1C56PCpIxqs/UKjux7UqYtpgJ2
   7k+JXjcpKJ5uSan0pEWTexwduXRTa4enZunirdsig48il/R6+EBSl/kqi
   sChuSkVjvmxvahE/hBdNhjZULsW60FupJzFYaQwzSyDH8DIeM5tyw+7ZI
   U6kKaHPcZDZXNWZTiDGA7aanLMcPhOTvS0TN2FmwQZ3btICgpkKhIHWiw
   Q67AGN0r1leD4iq5XtIF0Nu5ubcGbDi45mQ0NXlKPblicEMrt0Ba4hYla
   YO1vHWm+VdUghBNW3pcJueuRxOKlnM+erfQTPjDQQgy2YrqnPzzYKinyD
   A==;
X-CSE-ConnectionGUID: iw7IZGHMROKGjm0XgSriVA==
X-CSE-MsgGUID: D5h5eymnS6q3iC6/ukgVGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20349013"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20349013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 09:36:51 -0700
X-CSE-ConnectionGUID: XVVxIqjZRTeMF58kmVWmEQ==
X-CSE-MsgGUID: a/QJFxfEQSK9g6Uwwa0b8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54068177"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2024 09:36:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYpqC-000t7Q-0S;
	Tue, 30 Jul 2024 16:36:48 +0000
Date: Wed, 31 Jul 2024 00:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 15/17] mm/khugepaged.c:772:39: error: passing
 argument 3 of 'pmd_set' from incompatible pointer type
Message-ID: <202407310037.UEmbyvb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   e9eb6331a5abf0a71cf90c2d7d349fc32e12ae2e
commit: 91aef8fb59bf6f8e0c5966caac5813139c10e818 [15/17] mm/pgtable: pass ptdesc to pmd_populate
config: sparc64-randconfig-r071-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310037.UEmbyvb2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310037.UEmbyvb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310037.UEmbyvb2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgalloc.h:5,
                    from mm/khugepaged.c:26:
   mm/khugepaged.c: In function '__collapse_huge_page_copy_failed':
>> mm/khugepaged.c:772:39: error: passing argument 3 of 'pmd_set' from incompatible pointer type [-Wincompatible-pointer-types]
     772 |         pmd_populate(vma->vm_mm, pmd, (struct ptdesc *)pmd_pgtable(orig_pmd));
   arch/sparc/include/asm/pgalloc_64.h:73:66: note: in definition of macro 'pmd_populate'
      73 | #define pmd_populate(MM, PMD, PTE)              pmd_set(MM, PMD, PTE)
         |                                                                  ^~~
   In file included from arch/sparc/include/asm/pgtable.h:5,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/khugepaged.c:4:
   arch/sparc/include/asm/pgtable_64.h:828:70: note: expected 'pte_t *' but argument is of type 'struct ptdesc *'
     828 | static inline void pmd_set(struct mm_struct *mm, pmd_t *pmdp, pte_t *ptep)
         |                                                               ~~~~~~~^~~~
   mm/khugepaged.c: In function 'collapse_huge_page':
   mm/khugepaged.c:1201:39: error: passing argument 3 of 'pmd_set' from incompatible pointer type [-Wincompatible-pointer-types]
    1201 |                 pmd_populate(mm, pmd, (struct ptdesc *)pmd_pgtable(_pmd));
   arch/sparc/include/asm/pgalloc_64.h:73:66: note: in definition of macro 'pmd_populate'
      73 | #define pmd_populate(MM, PMD, PTE)              pmd_set(MM, PMD, PTE)
         |                                                                  ^~~
   arch/sparc/include/asm/pgtable_64.h:828:70: note: expected 'pte_t *' but argument is of type 'struct ptdesc *'
     828 | static inline void pmd_set(struct mm_struct *mm, pmd_t *pmdp, pte_t *ptep)
         |                                                               ~~~~~~~^~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/mm_types.h:515:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     515 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/khugepaged.c:1235:45: note: in expansion of macro 'page_ptdesc'
    1235 |         pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
         |                                             ^~~~~~~~~~~


vim +/pmd_set +772 mm/khugepaged.c

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
