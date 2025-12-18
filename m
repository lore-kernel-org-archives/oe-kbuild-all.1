Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607C36C5A2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074398; cv=none; b=rametrmLk2232RZEoHHfUP0/7wpQeocan+nHQSU55M4Kablq025KalIimhu1uF5lfNpHK4BEdpLYlQ4FwoszVYqMH5+GWpkT6XsFe6baNxLexzIHWlemNwpL9EpNY9a2IqtzrSr5ZLrnjS0wmejDenZjKK3K6zQ0MVodfbK6gI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074398; c=relaxed/simple;
	bh=9bq+OqK8xAeILq1ij6Zy1mH7w3fz6KAM1ngvrQG7FBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/z6/BIlGknJpo2kTqv3nNgfNAyaBQlERVEFCFaRMqd4dO1Szzg2Rs0xfpLVrP9Y8oV9hF83LsvPsuunbdeCjShySRrHPTnUHbdYDi0A0l8/+1q+QclGN1NUWxbmkuxDQJ7FciMBEcv5Z9+GHz4WBIKiZu0Cp0m9Gw4VI/OnEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYIXb+ll; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYIXb+ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766074396; x=1797610396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bq+OqK8xAeILq1ij6Zy1mH7w3fz6KAM1ngvrQG7FBs=;
  b=VYIXb+llO5C7gGUBLXuDmho3HIg/pdLG2JGBPVgzJohqzKxyd9WURrhG
   n03NrSMmLKrBZ0tqTAzpEiaBQr1sJKUTbCaHXaUUXMXPi7p5/q7xS8Et7
   WhmKqSYcCocgG3rL7iKQtkpa+Lwdbrd86RRgMozY3unGtDz3IGN3l2Ryz
   MbelKMHwbcioIFVfulYscDJk7TyDWteQo1cQxfKK8xm/931+mQ0fi75ML
   8iFH3gXKQsZ1zGcRS7XG34kpH8iim4TCRClAlucAc+AR6ErPZ5g6lhRYD
   Vb1uS+2y1ARjxXe4TSmGwGzKKSl7X+jnTCSTZ1G7BLabV+p3GocVCKmV2
   Q==;
X-CSE-ConnectionGUID: OGHStrx0TKaye1Wr+/wgsA==
X-CSE-MsgGUID: iucHEB+6Rg2pULDhhhNZ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67910151"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="67910151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 08:13:15 -0800
X-CSE-ConnectionGUID: ISxo+dATS2KUw7zVle4r4g==
X-CSE-MsgGUID: BtgVnDrjRd66y1xQAkVeUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203703343"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Dec 2025 08:13:14 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWGcp-000000002IB-2DAe;
	Thu, 18 Dec 2025 16:13:11 +0000
Date: Fri, 19 Dec 2025 00:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [linux-next:master 2108/2322]
 arch/powerpc/mm/book3s64/hash_tlb.c:45:42: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202512190021.gfS4qj45-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1058ca9db0edaedcb16480cc74b78ed06f0d1f54
commit: 0445738de4d8874ee6d87873effe92b1cb67c031 [2108/2322] mm-add-basic-tests-for-lazy_mmu-fix
config: powerpc64-randconfig-r131-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190021.gfS4qj45-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190021.gfS4qj45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190021.gfS4qj45-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/mm/book3s64/hash_tlb.c:45:42: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct ppc64_tlb_batch * @@
   arch/powerpc/mm/book3s64/hash_tlb.c:45:42: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/mm/book3s64/hash_tlb.c:45:42: sparse:     got struct ppc64_tlb_batch *
   arch/powerpc/mm/book3s64/hash_tlb.c:162:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct ppc64_tlb_batch * @@
   arch/powerpc/mm/book3s64/hash_tlb.c:162:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/mm/book3s64/hash_tlb.c:162:45: sparse:     got struct ppc64_tlb_batch *

vim +45 arch/powerpc/mm/book3s64/hash_tlb.c

^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   34  
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   35  /*
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   36   * A linux PTE was changed and the corresponding hash table entry
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   37   * neesd to be flushed. This function will either perform the flush
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   38   * immediately or will batch it up if the current CPU has an active
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   39   * batch on it.
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   40   */
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   41  void hpte_need_flush(struct mm_struct *mm, unsigned long addr,
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   42  		     pte_t *ptep, unsigned long pte, int huge)
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   43  {
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10   44  	unsigned long vpn;
f342552b917a18 arch/powerpc/mm/tlb_hash64.c        Peter Zijlstra         2011-02-24  @45  	struct ppc64_tlb_batch *batch = &get_cpu_var(ppc64_tlb_batch);
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10   46  	unsigned long vsid;
bf72aeba2ffef5 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2006-06-15   47  	unsigned int psize;
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   48  	int ssize;
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   49  	real_pte_t rpte;
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   50  	int i, offset;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   51  
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   52  	i = batch->index;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16   53  
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   54  	/*
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   55  	 * Get page size (maybe move back to caller).
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   56  	 *
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   57  	 * NOTE: when using special 64K mappings in 4K environment like
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   58  	 * for SPEs, we obtain the page size from the slice, which thus
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   59  	 * must still exist (and thus the VMA not reused) at the time
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   60  	 * of this call
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   61  	 */
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   62  	if (huge) {
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   63  #ifdef CONFIG_HUGETLB_PAGE
d258e64ef59579 arch/powerpc/mm/tlb_hash64.c        Joe Perches            2009-06-28   64  		psize = get_slice_psize(mm, addr);
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   65  		/* Mask the address for the correct page size */
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   66  		addr &= ~((1UL << mmu_psize_defs[psize].shift) - 1);
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   67  		if (unlikely(psize == MMU_PAGE_16G))
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   68  			offset = PTRS_PER_PUD;
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   69  		else
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   70  			offset = PTRS_PER_PMD;
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   71  #else
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   72  		BUG();
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   73  		psize = pte_pagesize_index(mm, addr, pte); /* shutup gcc */
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   74  #endif
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   75  	} else {
16c2d476232523 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-05-08   76  		psize = pte_pagesize_index(mm, addr, pte);
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   77  		/*
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   78  		 * Mask the address for the standard page size.  If we
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   79  		 * have a 64k page kernel, but the hardware does not
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   80  		 * support 64k pages, this might be different from the
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   81  		 * hardware page size encoded in the slice table.
47d99948eee48a arch/powerpc/mm/book3s64/hash_tlb.c Christophe Leroy       2019-03-29   82  		 */
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   83  		addr &= PAGE_MASK;
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   84  		offset = PTRS_PER_PTE;
77058e1adcc439 arch/powerpc/mm/tlb_hash64.c        David Gibson           2010-02-08   85  	}
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07   86  
f71dc176aa0635 arch/powerpc/mm/tlb_hash64.c        David Gibson           2009-10-26   87  
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   88  	/* Build full vaddr */
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   89  	if (!is_kernel_addr(addr)) {
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   90  		ssize = user_segment_size(addr);
f384796c40dc55 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-03-26   91  		vsid = get_user_vsid(&mm->context, addr, ssize);
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   92  	} else {
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   93  		vsid = get_kernel_vsid(addr, mmu_kernel_ssize);
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   94  		ssize = mmu_kernel_ssize;
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11   95  	}
c60ac5693c47df arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2013-03-13   96  	WARN_ON(vsid == 0);
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10   97  	vpn = hpt_vpn(addr, vsid, ssize);
ff31e105464d8c arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2018-02-11   98  	rpte = __real_pte(__pte(pte), ptep, offset);
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10   99  
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  100  	/*
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  101  	 * Check if we have an active batch on this CPU. If not, just
c5cee6421cd651 arch/powerpc/mm/tlb_hash64.c        Balbir Singh           2017-05-25  102  	 * flush now and return.
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  103  	 */
b6f14de2f3a78f arch/powerpc/mm/book3s64/hash_tlb.c Kevin Brodsky          2025-12-15  104  	if (!is_lazy_mmu_mode_active()) {
c5cee6421cd651 arch/powerpc/mm/tlb_hash64.c        Balbir Singh           2017-05-25  105  		flush_hash_page(vpn, rpte, psize, ssize, mm_is_thread_local(mm));
f342552b917a18 arch/powerpc/mm/tlb_hash64.c        Peter Zijlstra         2011-02-24  106  		put_cpu_var(ppc64_tlb_batch);
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  107  		return;
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  108  	}
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  109  
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  110  	/*
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  111  	 * This can happen when we are in the middle of a TLB batch and
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  112  	 * we encounter memory pressure (eg copy_page_range when it tries
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  113  	 * to allocate a new pte). If we have to reclaim memory and end
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  114  	 * up scanning and resetting referenced bits then our batch context
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  115  	 * will change mid stream.
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  116  	 *
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  117  	 * We also need to ensure only one page size is present in a given
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  118  	 * batch
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  119  	 */
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11  120  	if (i != 0 && (mm != batch->mm || batch->psize != psize ||
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11  121  		       batch->ssize != ssize)) {
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  122  		__flush_tlb_pending(batch);
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  123  		i = 0;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  124  	}
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  125  	if (i == 0) {
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  126  		batch->mm = mm;
3c726f8dee6f55 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2005-11-07  127  		batch->psize = psize;
1189be6508d451 arch/powerpc/mm/tlb_64.c            Paul Mackerras         2007-10-11  128  		batch->ssize = ssize;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  129  	}
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  130  	batch->pte[i] = rpte;
5524a27d39b687 arch/powerpc/mm/tlb_hash64.c        Aneesh Kumar K.V       2012-09-10  131  	batch->vpn[i] = vpn;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  132  	batch->index = ++i;
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  133  	if (i >= PPC64_TLB_BATCH_NR)
a741e679695771 arch/powerpc/mm/tlb_64.c            Benjamin Herrenschmidt 2007-04-10  134  		__flush_tlb_pending(batch);
f342552b917a18 arch/powerpc/mm/tlb_hash64.c        Peter Zijlstra         2011-02-24  135  	put_cpu_var(ppc64_tlb_batch);
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  136  }
^1da177e4c3f41 arch/ppc64/mm/tlb.c                 Linus Torvalds         2005-04-16  137  

:::::: The code at line 45 was first introduced by commit
:::::: f342552b917a18a7a1fa2c10625df85fac828c36 powerpc/mm: Make hpte_need_flush() safe for preemption

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
