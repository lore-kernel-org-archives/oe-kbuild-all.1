Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C26188713
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328656; cv=none; b=nGY7MMEqwI89EXwa/FUrg2gGg/UOITmOq/iur5EefUwKWmg2SbAnJch/lYhCEQomxoWeRRboWRKUSgS52KwURYHrQDt3UCaNOMyMMkm7llJ6t6tN5Jdwc0G9HzTTgDxHdLGmG5g/MkEnKDV+OIA0pckuKmCwKuS93+x45Xz+tK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328656; c=relaxed/simple;
	bh=OJlkDbwtUFzbrRQkROGMVAzjgmF2ZMLFx6CSKdT6bd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FeyU4iyWqVWEc4TaMcwGojSlDF/J7oMzanZgRDqSNFj28i5H8X6t67n1/jlhRL4ummn8kculSxpugN5HK42m0dtXLuk4Gng4N/MTwVH6HbPP5bRgwwfAUDCYc+0UMffnZBV5jqDSf+9VsPvNZH5rQLeWMC3uMbAPOfDU7OAND70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTTHHXEH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTTHHXEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736328652; x=1767864652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJlkDbwtUFzbrRQkROGMVAzjgmF2ZMLFx6CSKdT6bd0=;
  b=CTTHHXEHE0HBZ1rl7E6vq28htVIaFlwuzcJ2NtRTcdES2u8fmpHaNZvP
   fzP/s3efy0eOLwu6W+6h0TQx6GU8cGD2EUA1eVjQp3i55Hky9zMx/1jiT
   ZflfDjBasRf+Dt5QQ5xgI6SD9TqQzJmq80DLtw2nXqseJxxrBOHNfw0Z+
   H2J1yX01npg9kUkpF1dwlajWWQybLgO6zslaCs89dSoITVxHKCwCnUZ8b
   +4s4CvtktBAuWH4/x480dUVrVh8E41qTcBA+9EkYU8uaA453oNAe0Sc56
   nyeHS9YfWEJb8qiM6N6pxXLPXitzclFcwPG9gYj0ThSieXhCZym8jPYtm
   A==;
X-CSE-ConnectionGUID: 6I7V4s/QTjaeu/D1A4sMpA==
X-CSE-MsgGUID: tzDEZZNHSHO3eG+XYD4z2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="35774429"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="35774429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:30:51 -0800
X-CSE-ConnectionGUID: nt+mC3KlTm+Zj9l8EwmtZw==
X-CSE-MsgGUID: TTuJHghiQK2ANyeDM9XI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108143034"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 01:30:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVSOk-000Fsh-26;
	Wed, 08 Jan 2025 09:30:46 +0000
Date: Wed, 8 Jan 2025 17:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/mm/book3s64/hash_tlb.c:54:16: warning: variable
 'offset' set but not used
Message-ID: <202501081741.AYFwybsq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 47d99948eee48a84a4b242c17915a4ff59a29b5d powerpc/mm: Move book3s64 specifics in subdirectory mm/book3s64
date:   6 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250108/202501081741.AYFwybsq-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081741.AYFwybsq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081741.AYFwybsq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
>> arch/powerpc/mm/book3s64/hash_tlb.c:54:16: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
      54 |         int i, offset;
         |                ^~~~~~
--
   arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range':
>> arch/powerpc/mm/book3s64/hash_native.c:786:29: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     786 |         unsigned long hash, index, hidx, shift, slot;
         |                             ^~~~~


vim +/offset +54 arch/powerpc/mm/book3s64/hash_tlb.c

^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   38  
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   39  /*
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   40   * A linux PTE was changed and the corresponding hash table entry
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   41   * neesd to be flushed. This function will either perform the flush
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   42   * immediately or will batch it up if the current CPU has an active
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   43   * batch on it.
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   44   */
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   45  void hpte_need_flush(struct mm_struct *mm, unsigned long addr,
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   46  		     pte_t *ptep, unsigned long pte, int huge)
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   47  {
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10   48  	unsigned long vpn;
f342552b917a18 arch/powerpc/mm/tlb_hash64.c        Peter Zijlstra         2011-02-24   49  	struct ppc64_tlb_batch *batch = &get_cpu_var(ppc64_tlb_batch);
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10   50  	unsigned long vsid;
bf72aeba2ffef5 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2006-06-15   51  	unsigned int psize;
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   52  	int ssize;
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   53  	real_pte_t rpte;
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11  @54  	int i, offset;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   55  
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   56  	i = batch->index;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   57  
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   58  	/*
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   59  	 * Get page size (maybe move back to caller).
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   60  	 *
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   61  	 * NOTE: when using special 64K mappings in 4K environment like
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   62  	 * for SPEs, we obtain the page size from the slice, which thus
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   63  	 * must still exist (and thus the VMA not reused) at the time
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   64  	 * of this call
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   65  	 */
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   66  	if (huge) {
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   67  #ifdef CONFIG_HUGETLB_PAGE
d258e64ef59579 arch/powerpc/mm/tlb_hash64.c        Joe Perches            2009-06-28   68  		psize = get_slice_psize(mm, addr);
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   69  		/* Mask the address for the correct page size */
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   70  		addr &= ~((1UL << mmu_psize_defs[psize].shift) - 1);
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   71  		if (unlikely(psize == MMU_PAGE_16G))
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   72  			offset = PTRS_PER_PUD;
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   73  		else
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   74  			offset = PTRS_PER_PMD;
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   75  #else
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   76  		BUG();
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   77  		psize = pte_pagesize_index(mm, addr, pte); /* shutup gcc */
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   78  #endif
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   79  	} else {
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   80  		psize = pte_pagesize_index(mm, addr, pte);
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   81  		/*
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   82  		 * Mask the address for the standard page size.  If we
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   83  		 * have a 64k page kernel, but the hardware does not
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   84  		 * support 64k pages, this might be different from the
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   85  		 * hardware page size encoded in the slice table.
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   86  		 */
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   87  		addr &= PAGE_MASK;
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   88  		offset = PTRS_PER_PTE;
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   89  	}
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   90  
f71dc176aa0635 arch/powerpc/mm/tlb_hash64.c        David Gibson           2009-10-26   91  
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   92  	/* Build full vaddr */
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   93  	if (!is_kernel_addr(addr)) {
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   94  		ssize = user_segment_size(addr);
f384796c40dc55 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-03-26   95  		vsid = get_user_vsid(&mm->context, addr, ssize);
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   96  	} else {
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   97  		vsid = get_kernel_vsid(addr, mmu_kernel_ssize);
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   98  		ssize = mmu_kernel_ssize;
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   99  	}
c60ac5693c47df arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2013-03-13  100  	WARN_ON(vsid == 0);
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10  101  	vpn = hpt_vpn(addr, vsid, ssize);
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11  102  	rpte = __real_pte(__pte(pte), ptep, offset);
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  103  
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  104  	/*
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  105  	 * Check if we have an active batch on this CPU. If not, just
c5cee6421cd651 arch/powerpc/mm/tlb_hash64.c        Balbir Singh           2017-05-25  106  	 * flush now and return.
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  107  	 */
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  108  	if (!batch->active) {
c5cee6421cd651 arch/powerpc/mm/tlb_hash64.c        Balbir Singh           2017-05-25  109  		flush_hash_page(vpn, rpte, psize, ssize, mm_is_thread_local(mm));
f342552b917a18 arch/powerpc/mm/tlb_hash64.c        Peter Zijlstra         2011-02-24  110  		put_cpu_var(ppc64_tlb_batch);
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  111  		return;
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  112  	}
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  113  
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  114  	/*
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  115  	 * This can happen when we are in the middle of a TLB batch and
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  116  	 * we encounter memory pressure (eg copy_page_range when it tries
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  117  	 * to allocate a new pte). If we have to reclaim memory and end
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  118  	 * up scanning and resetting referenced bits then our batch context
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  119  	 * will change mid stream.
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  120  	 *
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  121  	 * We also need to ensure only one page size is present in a given
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  122  	 * batch
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  123  	 */
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11  124  	if (i != 0 && (mm != batch->mm || batch->psize != psize ||
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11  125  		       batch->ssize != ssize)) {
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  126  		__flush_tlb_pending(batch);
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  127  		i = 0;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  128  	}
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  129  	if (i == 0) {
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  130  		batch->mm = mm;
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  131  		batch->psize = psize;
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11  132  		batch->ssize = ssize;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  133  	}
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  134  	batch->pte[i] = rpte;
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10  135  	batch->vpn[i] = vpn;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  136  	batch->index = ++i;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  137  	if (i >= PPC64_TLB_BATCH_NR)
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  138  		__flush_tlb_pending(batch);
f342552b917a18 arch/powerpc/mm/tlb_hash64.c        Peter Zijlstra         2011-02-24  139  	put_cpu_var(ppc64_tlb_batch);
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  140  }
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  141  

:::::: The code at line 54 was first introduced by commit
:::::: ff31e105464d8c8c973019646827020aed9c2d9f powerpc/mm/hash64: Store the slot information at the right offset for hugetlb

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
