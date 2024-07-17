Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E810617E91B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222356; cv=none; b=Ag/QoQPJoF+aW+d93xuGDkZ/e90BdNDyt7FEbPeAmIUyCilX3xxim5spgyCHEfdxr+f/G7Iix9Dz32od/gLURQgHEMJLSt9omamEVuTbZzUEEE3ZyL0xaCbCecggIwj0M0F1jCBZrM7XM7RfwheRt35dqAKNMnnCvcHG1aUj2/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222356; c=relaxed/simple;
	bh=tdNJhL+kQzULBw4Hul+mScJtVieh+/hbg2l8sjR47wY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKPiFUhciy3cN0TUdeLoWC5hgmNrf3q8VMei3ZQfugF8JeL0TKwHoaocXyhGGGR3WLy/HpSGrn3DPSLDYoZPD87eO9oXUHT38v5r2e7s8n3nSA4/8FrQVCgf/L/wem61g79OAzthhkAZSLOq53zmWhMdW2o+Ptu8x2oqgQkK0bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvxD0Jse; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvxD0Jse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721222355; x=1752758355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tdNJhL+kQzULBw4Hul+mScJtVieh+/hbg2l8sjR47wY=;
  b=MvxD0JseUq6+IMejuHFro35EDsdslnHNbKePS+QkHtmc9BsubZRpsuOV
   q1dK03mR4HvaCytrIJQK3obnWblsH2/JDhgBP+MlWyeZJ4OO3eqiDtnUE
   X6fceOeEnL+uJFsJsOuEM1dOjDauyDiEEOAvV+HtVRG2r8FBhdGIJRVSJ
   aieDRruxEweYiICZ1MMn5Vug1qIYbb7yjgVL0sVsbglgjZH5gg/ZN15OB
   AEVejo3xN8QQkA2bKtQ057v5dJrRWUKYZ+/E5wcnvfHZLupBayzRmNRW4
   qixlnqpHO9uHvGIINSVml3k32rBkviIxIrL761CatuiWbermyLH99dshg
   w==;
X-CSE-ConnectionGUID: kFVRKVPzQFS0O8CJJZrRRg==
X-CSE-MsgGUID: 8G7jRaNxQlqfMUSBKUyOpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18860547"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18860547"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 06:19:14 -0700
X-CSE-ConnectionGUID: 8KBgCoDGTWyRXFbGZkgJTw==
X-CSE-MsgGUID: 2QYk1lhXRpGWfQ48l9YjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50439843"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jul 2024 06:19:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU4Yo-000gLq-2v;
	Wed, 17 Jul 2024 13:19:10 +0000
Date: Wed, 17 Jul 2024 21:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 24/24] arch/s390/mm/pgtable.c:589:17: error:
 assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type
 'struct ptdesc *'
Message-ID: <202407172139.U12LktqS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   a158e7e787b56bc7f1b4bb582a0e8ec65cacec4b
commit: a158e7e787b56bc7f1b4bb582a0e8ec65cacec4b [24/24] mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407172139.U12LktqS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172139.U12LktqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407172139.U12LktqS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/mm/pgtable.c: In function 'pgtable_trans_huge_deposit':
>> arch/s390/mm/pgtable.c:577:32: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
     577 |         pmd_huge_pte(mm, pmdp) = pgtable;
         |                                ^
   arch/s390/mm/pgtable.c: In function 'pgtable_trans_huge_withdraw':
>> arch/s390/mm/pgtable.c:589:17: error: assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type 'struct ptdesc *' [-Wincompatible-pointer-types]
     589 |         pgtable = pmd_huge_pte(mm, pmdp);
         |                 ^
>> arch/s390/mm/pgtable.c:594:40: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
     594 |                 pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
         |                                        ^


vim +589 arch/s390/mm/pgtable.c

d08de8e2d86744 Gerald Schaefer    2016-07-04  563  
75077afbec1ac8 Gerald Schaefer    2012-10-08  564  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
6b0b50b0617fad Aneesh Kumar K.V   2013-06-05  565  void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
6b0b50b0617fad Aneesh Kumar K.V   2013-06-05  566  				pgtable_t pgtable)
9501d09fa3c4ca Gerald Schaefer    2012-10-08  567  {
9501d09fa3c4ca Gerald Schaefer    2012-10-08  568  	struct list_head *lh = (struct list_head *) pgtable;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  569  
ec66ad66a0de87 Martin Schwidefsky 2014-02-12  570  	assert_spin_locked(pmd_lockptr(mm, pmdp));
9501d09fa3c4ca Gerald Schaefer    2012-10-08  571  
9501d09fa3c4ca Gerald Schaefer    2012-10-08  572  	/* FIFO */
c389a250ab4cfa Kirill A. Shutemov 2013-11-14  573  	if (!pmd_huge_pte(mm, pmdp))
9501d09fa3c4ca Gerald Schaefer    2012-10-08  574  		INIT_LIST_HEAD(lh);
9501d09fa3c4ca Gerald Schaefer    2012-10-08  575  	else
c389a250ab4cfa Kirill A. Shutemov 2013-11-14  576  		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
c389a250ab4cfa Kirill A. Shutemov 2013-11-14 @577  	pmd_huge_pte(mm, pmdp) = pgtable;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  578  }
9501d09fa3c4ca Gerald Schaefer    2012-10-08  579  
6b0b50b0617fad Aneesh Kumar K.V   2013-06-05  580  pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
9501d09fa3c4ca Gerald Schaefer    2012-10-08  581  {
9501d09fa3c4ca Gerald Schaefer    2012-10-08  582  	struct list_head *lh;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  583  	pgtable_t pgtable;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  584  	pte_t *ptep;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  585  
ec66ad66a0de87 Martin Schwidefsky 2014-02-12  586  	assert_spin_locked(pmd_lockptr(mm, pmdp));
9501d09fa3c4ca Gerald Schaefer    2012-10-08  587  
9501d09fa3c4ca Gerald Schaefer    2012-10-08  588  	/* FIFO */
c389a250ab4cfa Kirill A. Shutemov 2013-11-14 @589  	pgtable = pmd_huge_pte(mm, pmdp);
9501d09fa3c4ca Gerald Schaefer    2012-10-08  590  	lh = (struct list_head *) pgtable;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  591  	if (list_empty(lh))
c389a250ab4cfa Kirill A. Shutemov 2013-11-14  592  		pmd_huge_pte(mm, pmdp) = NULL;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  593  	else {
c389a250ab4cfa Kirill A. Shutemov 2013-11-14 @594  		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  595  		list_del(lh);
9501d09fa3c4ca Gerald Schaefer    2012-10-08  596  	}
9501d09fa3c4ca Gerald Schaefer    2012-10-08  597  	ptep = (pte_t *) pgtable;
b8e3b37900a57f Heiko Carstens     2022-02-21  598  	set_pte(ptep, __pte(_PAGE_INVALID));
9501d09fa3c4ca Gerald Schaefer    2012-10-08  599  	ptep++;
b8e3b37900a57f Heiko Carstens     2022-02-21  600  	set_pte(ptep, __pte(_PAGE_INVALID));
9501d09fa3c4ca Gerald Schaefer    2012-10-08  601  	return pgtable;
9501d09fa3c4ca Gerald Schaefer    2012-10-08  602  }
75077afbec1ac8 Gerald Schaefer    2012-10-08  603  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
1e133ab296f3ff Martin Schwidefsky 2016-03-08  604  

:::::: The code at line 589 was first introduced by commit
:::::: c389a250ab4cfa4a3775d9f2c45271618af6d5b2 mm, thp: do not access mm->pmd_huge_pte directly

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
