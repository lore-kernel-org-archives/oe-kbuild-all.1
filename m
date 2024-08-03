Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E8210FB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 20:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722718551; cv=none; b=pUgdGdxPQsLDnuyj+mlNZtg5EvIOptlR88xGZDL1dPvB7YJfAD5ftr1ENueB7/iE5XbLKSWnb59Io1TpKtI3ppPu4t8XVgYTPZU6Jq0HkV7GMp9zuKS5cctNiFjagopY251gV8yQJNfqHYv4YbKLI9vI1dLA3gVXHqEAWmlXZdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722718551; c=relaxed/simple;
	bh=rPf0zbG2iU3vt+fFz4Rxonobifn+1dOS1dne2VJ40kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hbCBe0oWrJXpZ05sL3EdeJ7usgKY0l1kF8EvoqY8EVqOdvvHjKuzb3+Mp4YPOzPtlEeS/cyJ//I7NtYFh7KNBoH/rikFIWCuBxiz+hCzGEInhGQrLekY4Mfz4y8oeYsPaM0ApV8I4nYAF71LuvKuBC9K2rG6u3AdgDOahRrbrqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFf1wvsi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFf1wvsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722718549; x=1754254549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rPf0zbG2iU3vt+fFz4Rxonobifn+1dOS1dne2VJ40kU=;
  b=PFf1wvsibd9qjykJwZMjvvtHHBbBGXtgMeCcbkrZHU7iLZWGrVCZPyH2
   zfFzxsegQq80jXOgwKWOVfqPyJ0JMhNETdE/EW5E/Vb0Jd0rR2YNJx+ER
   95p31S0Nuk40wnYE0Cy+fzWuu81jTjinsLHEEyfTrVB+nyyhxf1UaypNw
   tUT4U0IGgnbrMqG20+ou+H5AGWFK+XfX31ApjPU7R5S6KC4bTwU5KQVaA
   6Nn2+Frz/97k+WJhkk+YDsEuesxogm7vJ63Pj8LKOLiG+6NcKiIo++Mmz
   Ckam5aXlNCUSAQD0YyKizvLx58286bWJUCXzMsRoZBaGfQn3zITaIea/m
   A==;
X-CSE-ConnectionGUID: 8OyQkuKgSFOClBB27wfNfQ==
X-CSE-MsgGUID: /BRA6UppQdyzbc8V7rxGNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="32119751"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="32119751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 13:55:45 -0700
X-CSE-ConnectionGUID: rCUAWyyzSJ+uFGDOwhDsbQ==
X-CSE-MsgGUID: faNEHgm9SrmC79PBf8KV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="86707140"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2024 13:55:44 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saLmv-0000uA-2Y;
	Sat, 03 Aug 2024 20:55:41 +0000
Date: Sun, 4 Aug 2024 04:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 36/44] mm/damon/vaddr.c:311:22: error: implicit
 declaration of function 'pmd_present'; did you mean 'p4d_present'?
Message-ID: <202408040440.Oe31R40L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SeongJae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   fec73193b080d068291509554d3e4b21622ede2d
commit: 069dc62c4181e3c1a10fa833c176b52765c05564 [36/44] mm/damon/Kconfig: select DAMON modules to test when test config is set
config: arm-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240804/202408040440.Oe31R40L-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040440.Oe31R40L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040440.Oe31R40L-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/damon/vaddr.c: In function 'damon_mkold_pmd_entry':
   mm/damon/vaddr.c:307:13: error: implicit declaration of function 'pmd_trans_huge'; did you mean 'pmd_trans_huge_lock'? [-Wimplicit-function-declaration]
     307 |         if (pmd_trans_huge(pmdp_get(pmd))) {
         |             ^~~~~~~~~~~~~~
         |             pmd_trans_huge_lock
   mm/damon/vaddr.c:307:28: error: implicit declaration of function 'pmdp_get'; did you mean 'em_pd_get'? [-Wimplicit-function-declaration]
     307 |         if (pmd_trans_huge(pmdp_get(pmd))) {
         |                            ^~~~~~~~
         |                            em_pd_get
>> mm/damon/vaddr.c:311:22: error: implicit declaration of function 'pmd_present'; did you mean 'p4d_present'? [-Wimplicit-function-declaration]
     311 |                 if (!pmd_present(pmde)) {
         |                      ^~~~~~~~~~~
         |                      p4d_present
>> mm/damon/vaddr.c:329:14: error: implicit declaration of function 'pte_present'; did you mean 'p4d_present'? [-Wimplicit-function-declaration]
     329 |         if (!pte_present(ptep_get(pte)))
         |              ^~~~~~~~~~~
         |              p4d_present
   mm/damon/vaddr.c:329:26: error: implicit declaration of function 'ptep_get' [-Wimplicit-function-declaration]
     329 |         if (!pte_present(ptep_get(pte)))
         |                          ^~~~~~~~
   In file included from arch/arm/include/asm/cacheflush.h:10,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from mm/damon/vaddr.c:10:
   include/linux/mm.h:2945:9: error: implicit declaration of function 'pte_unmap'; did you mean 'memunmap'? [-Wimplicit-function-declaration]
    2945 |         pte_unmap(pte);                                 \
         |         ^~~~~~~~~
   mm/damon/vaddr.c:333:9: note: in expansion of macro 'pte_unmap_unlock'
     333 |         pte_unmap_unlock(pte, ptl);
         |         ^~~~~~~~~~~~~~~~
   mm/damon/vaddr.c: In function 'damon_young_pmd_entry':
>> mm/damon/vaddr.c:487:33: error: implicit declaration of function 'pte_pfn'; did you mean 'pud_pfn'? [-Wimplicit-function-declaration]
     487 |         folio = damon_get_folio(pte_pfn(ptent));
         |                                 ^~~~~~~
         |                                 pud_pfn
>> mm/damon/vaddr.c:490:13: error: implicit declaration of function 'pte_young' [-Wimplicit-function-declaration]
     490 |         if (pte_young(ptent) || !folio_test_idle(folio) ||
         |             ^~~~~~~~~
--
   mm/damon/ops-common.c: In function 'damon_ptep_mkold':
>> mm/damon/ops-common.c:42:47: error: implicit declaration of function 'pte_pfn'; did you mean 'pud_pfn'? [-Wimplicit-function-declaration]
      42 |         struct folio *folio = damon_get_folio(pte_pfn(ptep_get(pte)));
         |                                               ^~~~~~~
         |                                               pud_pfn
   mm/damon/ops-common.c:42:55: error: implicit declaration of function 'ptep_get' [-Wimplicit-function-declaration]
      42 |         struct folio *folio = damon_get_folio(pte_pfn(ptep_get(pte)));
         |                                                       ^~~~~~~~
   In file included from mm/damon/ops-common.c:8:
   include/linux/mmu_notifier.h:648:33: error: implicit declaration of function 'ptep_test_and_clear_young'; did you mean 'folio_test_clear_young'? [-Wimplicit-function-declaration]
     648 | #define ptep_clear_young_notify ptep_test_and_clear_young
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/ops-common.c:47:13: note: in expansion of macro 'ptep_clear_young_notify'
      47 |         if (ptep_clear_young_notify(vma, addr, pte))
         |             ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DAMON_VADDR
   Depends on [n]: DAMON [=y] && MMU [=n]
   Selected by [y]:
   - DAMON_VADDR_KUNIT_TEST [=y] && KUNIT [=y]=y [=y]
   WARNING: unmet direct dependencies detected for DAMON_DBGFS
   Depends on [n]: DAMON_DBGFS_DEPRECATED [=n]
   Selected by [y]:
   - DAMON_DBGFS_KUNIT_TEST [=y] && KUNIT [=y]=y [=y]


vim +311 mm/damon/vaddr.c

3f49584b262cf8 SeongJae Park      2021-09-07  299  
3f49584b262cf8 SeongJae Park      2021-09-07  300  static int damon_mkold_pmd_entry(pmd_t *pmd, unsigned long addr,
3f49584b262cf8 SeongJae Park      2021-09-07  301  		unsigned long next, struct mm_walk *walk)
3f49584b262cf8 SeongJae Park      2021-09-07  302  {
3f49584b262cf8 SeongJae Park      2021-09-07  303  	pte_t *pte;
e7ee3f9791f560 Levi Yun           2023-07-28  304  	pmd_t pmde;
3f49584b262cf8 SeongJae Park      2021-09-07  305  	spinlock_t *ptl;
3f49584b262cf8 SeongJae Park      2021-09-07  306  
e7ee3f9791f560 Levi Yun           2023-07-28  307  	if (pmd_trans_huge(pmdp_get(pmd))) {
3f49584b262cf8 SeongJae Park      2021-09-07  308  		ptl = pmd_lock(walk->mm, pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  309  		pmde = pmdp_get(pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  310  
e7ee3f9791f560 Levi Yun           2023-07-28 @311  		if (!pmd_present(pmde)) {
c8b9aff419303e Baolin Wang        2022-08-18  312  			spin_unlock(ptl);
c8b9aff419303e Baolin Wang        2022-08-18  313  			return 0;
c8b9aff419303e Baolin Wang        2022-08-18  314  		}
c8b9aff419303e Baolin Wang        2022-08-18  315  
e7ee3f9791f560 Levi Yun           2023-07-28  316  		if (pmd_trans_huge(pmde)) {
c11d34fa139e4b Ryan Roberts       2023-06-02  317  			damon_pmdp_mkold(pmd, walk->vma, addr);
3f49584b262cf8 SeongJae Park      2021-09-07  318  			spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  319  			return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  320  		}
3f49584b262cf8 SeongJae Park      2021-09-07  321  		spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  322  	}
3f49584b262cf8 SeongJae Park      2021-09-07  323  
3f49584b262cf8 SeongJae Park      2021-09-07  324  	pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
7780d04046a228 Hugh Dickins       2023-06-08  325  	if (!pte) {
7780d04046a228 Hugh Dickins       2023-06-08  326  		walk->action = ACTION_AGAIN;
7780d04046a228 Hugh Dickins       2023-06-08  327  		return 0;
7780d04046a228 Hugh Dickins       2023-06-08  328  	}
c33c794828f212 Ryan Roberts       2023-06-12 @329  	if (!pte_present(ptep_get(pte)))
3f49584b262cf8 SeongJae Park      2021-09-07  330  		goto out;
c11d34fa139e4b Ryan Roberts       2023-06-02  331  	damon_ptep_mkold(pte, walk->vma, addr);
3f49584b262cf8 SeongJae Park      2021-09-07  332  out:
3f49584b262cf8 SeongJae Park      2021-09-07  333  	pte_unmap_unlock(pte, ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  334  	return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  335  }
3f49584b262cf8 SeongJae Park      2021-09-07  336  
49f4203aae06ba Baolin Wang        2022-01-14  337  #ifdef CONFIG_HUGETLB_PAGE
49f4203aae06ba Baolin Wang        2022-01-14  338  static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
49f4203aae06ba Baolin Wang        2022-01-14  339  				struct vm_area_struct *vma, unsigned long addr)
49f4203aae06ba Baolin Wang        2022-01-14  340  {
49f4203aae06ba Baolin Wang        2022-01-14  341  	bool referenced = false;
e6c0c03245b14d Christophe Leroy   2024-07-02  342  	pte_t entry = huge_ptep_get(mm, addr, pte);
6b7cea90c82e10 Kefeng Wang        2022-12-30  343  	struct folio *folio = pfn_folio(pte_pfn(entry));
935d4f0c6dc8b3 Ryan Roberts       2023-09-22  344  	unsigned long psize = huge_page_size(hstate_vma(vma));
49f4203aae06ba Baolin Wang        2022-01-14  345  
6b7cea90c82e10 Kefeng Wang        2022-12-30  346  	folio_get(folio);
49f4203aae06ba Baolin Wang        2022-01-14  347  
49f4203aae06ba Baolin Wang        2022-01-14  348  	if (pte_young(entry)) {
49f4203aae06ba Baolin Wang        2022-01-14  349  		referenced = true;
49f4203aae06ba Baolin Wang        2022-01-14  350  		entry = pte_mkold(entry);
935d4f0c6dc8b3 Ryan Roberts       2023-09-22  351  		set_huge_pte_at(mm, addr, pte, entry, psize);
49f4203aae06ba Baolin Wang        2022-01-14  352  	}
49f4203aae06ba Baolin Wang        2022-01-14  353  
49f4203aae06ba Baolin Wang        2022-01-14  354  #ifdef CONFIG_MMU_NOTIFIER
49f4203aae06ba Baolin Wang        2022-01-14  355  	if (mmu_notifier_clear_young(mm, addr,
49f4203aae06ba Baolin Wang        2022-01-14  356  				     addr + huge_page_size(hstate_vma(vma))))
49f4203aae06ba Baolin Wang        2022-01-14  357  		referenced = true;
49f4203aae06ba Baolin Wang        2022-01-14  358  #endif /* CONFIG_MMU_NOTIFIER */
49f4203aae06ba Baolin Wang        2022-01-14  359  
49f4203aae06ba Baolin Wang        2022-01-14  360  	if (referenced)
6b7cea90c82e10 Kefeng Wang        2022-12-30  361  		folio_set_young(folio);
49f4203aae06ba Baolin Wang        2022-01-14  362  
6b7cea90c82e10 Kefeng Wang        2022-12-30  363  	folio_set_idle(folio);
6b7cea90c82e10 Kefeng Wang        2022-12-30  364  	folio_put(folio);
49f4203aae06ba Baolin Wang        2022-01-14  365  }
49f4203aae06ba Baolin Wang        2022-01-14  366  
49f4203aae06ba Baolin Wang        2022-01-14  367  static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
49f4203aae06ba Baolin Wang        2022-01-14  368  				     unsigned long addr, unsigned long end,
49f4203aae06ba Baolin Wang        2022-01-14  369  				     struct mm_walk *walk)
49f4203aae06ba Baolin Wang        2022-01-14  370  {
49f4203aae06ba Baolin Wang        2022-01-14  371  	struct hstate *h = hstate_vma(walk->vma);
49f4203aae06ba Baolin Wang        2022-01-14  372  	spinlock_t *ptl;
49f4203aae06ba Baolin Wang        2022-01-14  373  	pte_t entry;
49f4203aae06ba Baolin Wang        2022-01-14  374  
49f4203aae06ba Baolin Wang        2022-01-14  375  	ptl = huge_pte_lock(h, walk->mm, pte);
e6c0c03245b14d Christophe Leroy   2024-07-02  376  	entry = huge_ptep_get(walk->mm, addr, pte);
49f4203aae06ba Baolin Wang        2022-01-14  377  	if (!pte_present(entry))
49f4203aae06ba Baolin Wang        2022-01-14  378  		goto out;
49f4203aae06ba Baolin Wang        2022-01-14  379  
49f4203aae06ba Baolin Wang        2022-01-14  380  	damon_hugetlb_mkold(pte, walk->mm, walk->vma, addr);
49f4203aae06ba Baolin Wang        2022-01-14  381  
49f4203aae06ba Baolin Wang        2022-01-14  382  out:
49f4203aae06ba Baolin Wang        2022-01-14  383  	spin_unlock(ptl);
49f4203aae06ba Baolin Wang        2022-01-14  384  	return 0;
49f4203aae06ba Baolin Wang        2022-01-14  385  }
49f4203aae06ba Baolin Wang        2022-01-14  386  #else
49f4203aae06ba Baolin Wang        2022-01-14  387  #define damon_mkold_hugetlb_entry NULL
49f4203aae06ba Baolin Wang        2022-01-14  388  #endif /* CONFIG_HUGETLB_PAGE */
49f4203aae06ba Baolin Wang        2022-01-14  389  
199b50f4c9485c Rikard Falkeborn   2021-11-05  390  static const struct mm_walk_ops damon_mkold_ops = {
3f49584b262cf8 SeongJae Park      2021-09-07  391  	.pmd_entry = damon_mkold_pmd_entry,
49f4203aae06ba Baolin Wang        2022-01-14  392  	.hugetlb_entry = damon_mkold_hugetlb_entry,
49b0638502da09 Suren Baghdasaryan 2023-08-04  393  	.walk_lock = PGWALK_RDLOCK,
3f49584b262cf8 SeongJae Park      2021-09-07  394  };
3f49584b262cf8 SeongJae Park      2021-09-07  395  
3f49584b262cf8 SeongJae Park      2021-09-07  396  static void damon_va_mkold(struct mm_struct *mm, unsigned long addr)
3f49584b262cf8 SeongJae Park      2021-09-07  397  {
3f49584b262cf8 SeongJae Park      2021-09-07  398  	mmap_read_lock(mm);
3f49584b262cf8 SeongJae Park      2021-09-07  399  	walk_page_range(mm, addr, addr + 1, &damon_mkold_ops, NULL);
3f49584b262cf8 SeongJae Park      2021-09-07  400  	mmap_read_unlock(mm);
3f49584b262cf8 SeongJae Park      2021-09-07  401  }
3f49584b262cf8 SeongJae Park      2021-09-07  402  
3f49584b262cf8 SeongJae Park      2021-09-07  403  /*
3f49584b262cf8 SeongJae Park      2021-09-07  404   * Functions for the access checking of the regions
3f49584b262cf8 SeongJae Park      2021-09-07  405   */
3f49584b262cf8 SeongJae Park      2021-09-07  406  
8ef4d5caa66d62 Kaixu Xia          2022-09-13  407  static void __damon_va_prepare_access_check(struct mm_struct *mm,
8ef4d5caa66d62 Kaixu Xia          2022-09-13  408  					struct damon_region *r)
3f49584b262cf8 SeongJae Park      2021-09-07  409  {
3f49584b262cf8 SeongJae Park      2021-09-07  410  	r->sampling_addr = damon_rand(r->ar.start, r->ar.end);
3f49584b262cf8 SeongJae Park      2021-09-07  411  
3f49584b262cf8 SeongJae Park      2021-09-07  412  	damon_va_mkold(mm, r->sampling_addr);
3f49584b262cf8 SeongJae Park      2021-09-07  413  }
3f49584b262cf8 SeongJae Park      2021-09-07  414  
cdeed009f3bcee Xin Hao            2022-01-14  415  static void damon_va_prepare_access_checks(struct damon_ctx *ctx)
3f49584b262cf8 SeongJae Park      2021-09-07  416  {
3f49584b262cf8 SeongJae Park      2021-09-07  417  	struct damon_target *t;
3f49584b262cf8 SeongJae Park      2021-09-07  418  	struct mm_struct *mm;
3f49584b262cf8 SeongJae Park      2021-09-07  419  	struct damon_region *r;
3f49584b262cf8 SeongJae Park      2021-09-07  420  
3f49584b262cf8 SeongJae Park      2021-09-07  421  	damon_for_each_target(t, ctx) {
3f49584b262cf8 SeongJae Park      2021-09-07  422  		mm = damon_get_mm(t);
3f49584b262cf8 SeongJae Park      2021-09-07  423  		if (!mm)
3f49584b262cf8 SeongJae Park      2021-09-07  424  			continue;
3f49584b262cf8 SeongJae Park      2021-09-07  425  		damon_for_each_region(r, t)
8ef4d5caa66d62 Kaixu Xia          2022-09-13  426  			__damon_va_prepare_access_check(mm, r);
3f49584b262cf8 SeongJae Park      2021-09-07  427  		mmput(mm);
3f49584b262cf8 SeongJae Park      2021-09-07  428  	}
3f49584b262cf8 SeongJae Park      2021-09-07  429  }
3f49584b262cf8 SeongJae Park      2021-09-07  430  
3f49584b262cf8 SeongJae Park      2021-09-07  431  struct damon_young_walk_private {
fc8c7d2380ab7d SeongJae Park      2023-01-09  432  	/* size of the folio for the access checked virtual memory address */
fc8c7d2380ab7d SeongJae Park      2023-01-09  433  	unsigned long *folio_sz;
3f49584b262cf8 SeongJae Park      2021-09-07  434  	bool young;
3f49584b262cf8 SeongJae Park      2021-09-07  435  };
3f49584b262cf8 SeongJae Park      2021-09-07  436  
3f49584b262cf8 SeongJae Park      2021-09-07  437  static int damon_young_pmd_entry(pmd_t *pmd, unsigned long addr,
3f49584b262cf8 SeongJae Park      2021-09-07  438  		unsigned long next, struct mm_walk *walk)
3f49584b262cf8 SeongJae Park      2021-09-07  439  {
3f49584b262cf8 SeongJae Park      2021-09-07  440  	pte_t *pte;
c33c794828f212 Ryan Roberts       2023-06-12  441  	pte_t ptent;
3f49584b262cf8 SeongJae Park      2021-09-07  442  	spinlock_t *ptl;
dc1b78665b37ec Kefeng Wang        2022-12-30  443  	struct folio *folio;
3f49584b262cf8 SeongJae Park      2021-09-07  444  	struct damon_young_walk_private *priv = walk->private;
3f49584b262cf8 SeongJae Park      2021-09-07  445  
3f49584b262cf8 SeongJae Park      2021-09-07  446  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
e7ee3f9791f560 Levi Yun           2023-07-28  447  	if (pmd_trans_huge(pmdp_get(pmd))) {
e7ee3f9791f560 Levi Yun           2023-07-28  448  		pmd_t pmde;
e7ee3f9791f560 Levi Yun           2023-07-28  449  
3f49584b262cf8 SeongJae Park      2021-09-07  450  		ptl = pmd_lock(walk->mm, pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  451  		pmde = pmdp_get(pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  452  
e7ee3f9791f560 Levi Yun           2023-07-28  453  		if (!pmd_present(pmde)) {
c8b9aff419303e Baolin Wang        2022-08-18  454  			spin_unlock(ptl);
c8b9aff419303e Baolin Wang        2022-08-18  455  			return 0;
c8b9aff419303e Baolin Wang        2022-08-18  456  		}
c8b9aff419303e Baolin Wang        2022-08-18  457  
e7ee3f9791f560 Levi Yun           2023-07-28  458  		if (!pmd_trans_huge(pmde)) {
3f49584b262cf8 SeongJae Park      2021-09-07  459  			spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  460  			goto regular_page;
3f49584b262cf8 SeongJae Park      2021-09-07  461  		}
e7ee3f9791f560 Levi Yun           2023-07-28  462  		folio = damon_get_folio(pmd_pfn(pmde));
dc1b78665b37ec Kefeng Wang        2022-12-30  463  		if (!folio)
3f49584b262cf8 SeongJae Park      2021-09-07  464  			goto huge_out;
e7ee3f9791f560 Levi Yun           2023-07-28  465  		if (pmd_young(pmde) || !folio_test_idle(folio) ||
3f49584b262cf8 SeongJae Park      2021-09-07  466  					mmu_notifier_test_young(walk->mm,
7477d7560cb2c7 SeongJae Park      2023-01-09  467  						addr))
3f49584b262cf8 SeongJae Park      2021-09-07  468  			priv->young = true;
7477d7560cb2c7 SeongJae Park      2023-01-09  469  		*priv->folio_sz = HPAGE_PMD_SIZE;
dc1b78665b37ec Kefeng Wang        2022-12-30  470  		folio_put(folio);
3f49584b262cf8 SeongJae Park      2021-09-07  471  huge_out:
3f49584b262cf8 SeongJae Park      2021-09-07  472  		spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  473  		return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  474  	}
3f49584b262cf8 SeongJae Park      2021-09-07  475  
3f49584b262cf8 SeongJae Park      2021-09-07  476  regular_page:
3f49584b262cf8 SeongJae Park      2021-09-07  477  #endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
3f49584b262cf8 SeongJae Park      2021-09-07  478  
3f49584b262cf8 SeongJae Park      2021-09-07  479  	pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
7780d04046a228 Hugh Dickins       2023-06-08  480  	if (!pte) {
7780d04046a228 Hugh Dickins       2023-06-08  481  		walk->action = ACTION_AGAIN;
7780d04046a228 Hugh Dickins       2023-06-08  482  		return 0;
7780d04046a228 Hugh Dickins       2023-06-08  483  	}
c33c794828f212 Ryan Roberts       2023-06-12  484  	ptent = ptep_get(pte);
c33c794828f212 Ryan Roberts       2023-06-12  485  	if (!pte_present(ptent))
3f49584b262cf8 SeongJae Park      2021-09-07  486  		goto out;
c33c794828f212 Ryan Roberts       2023-06-12 @487  	folio = damon_get_folio(pte_pfn(ptent));
dc1b78665b37ec Kefeng Wang        2022-12-30  488  	if (!folio)
3f49584b262cf8 SeongJae Park      2021-09-07  489  		goto out;
c33c794828f212 Ryan Roberts       2023-06-12 @490  	if (pte_young(ptent) || !folio_test_idle(folio) ||
7477d7560cb2c7 SeongJae Park      2023-01-09  491  			mmu_notifier_test_young(walk->mm, addr))
3f49584b262cf8 SeongJae Park      2021-09-07  492  		priv->young = true;
7477d7560cb2c7 SeongJae Park      2023-01-09  493  	*priv->folio_sz = folio_size(folio);
dc1b78665b37ec Kefeng Wang        2022-12-30  494  	folio_put(folio);
3f49584b262cf8 SeongJae Park      2021-09-07  495  out:
3f49584b262cf8 SeongJae Park      2021-09-07  496  	pte_unmap_unlock(pte, ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  497  	return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  498  }
3f49584b262cf8 SeongJae Park      2021-09-07  499  

:::::: The code at line 311 was first introduced by commit
:::::: e7ee3f9791f5601fc032b222a70a02b9798784be damon: use pmdp_get instead of drectly dereferencing pmd

:::::: TO: Levi Yun <ppbuk5246@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
