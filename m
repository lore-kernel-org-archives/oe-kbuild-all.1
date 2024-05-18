Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26491DFC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716046604; cv=none; b=Ury9qwrS5AouGoNl3pXbTTm50VrQIycqcFnzR4hKzBly2emjC13xg7JBgqtgojO2647cTxzj2HUyjn9q+FUL9txJk05DMUSY66EtGoREmCIHGwM8yk9nCMsY7jNPZ8d9HTgsAuGlJ+aT/KE89g0tUwLC1fg+TncOJ+8btNaV3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716046604; c=relaxed/simple;
	bh=vLWwPoDLE71RIVySYFFrg0qQ851ba4ACwZpvWAJAZXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8IvILC435XXO9ExhzIRis8Nfb4dXWommB7oVGSAvj1f1colKNAsORvHPIznA6eVQlrNz7ITtutkovfvXDMagPcPCePG4Rh/qnN6Rdp8Uiaj1mlImHrPU1PN3cI3N/g6IOBauC8LZiav07uU93n1yfjvRrbjSG6c0I3Q/12cOVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+tEcr/K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+tEcr/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716046602; x=1747582602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vLWwPoDLE71RIVySYFFrg0qQ851ba4ACwZpvWAJAZXc=;
  b=A+tEcr/K2RBNqkZ6KdV0ZRgOELAFrnD579GK9oYGYZ1lOQJCzQ3VU1sM
   2LhgQKa74/Zdo4IceJ+Ci3suOj/Juz178JyNji3QhW7B1GYyEcgFjbrMg
   z3IDAWG/a714weYFRPxpTaH/gtWYLdrj4jn8ZrIjpxETt1mMI/wGVvTsl
   iYnBFXFZFGEkmqq6dZLLZZ0BtzobTGVtdqkkYjNEU/k1giHLbK/wDzrdq
   +4uc72C/ojByk/D7TElLCUR/mZefgdPm2+O0FG2kmMvXS131eaOWDqedW
   84l4d7c4GTztjA65key2Y93oq7N8mgJ3ue7keLDED0jd0NmgskeFE20h6
   g==;
X-CSE-ConnectionGUID: cq8JBYFOSWKiGkSHQx0bGQ==
X-CSE-MsgGUID: evKWOf2/TSW5rLB8PhmJaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12394759"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12394759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 08:36:41 -0700
X-CSE-ConnectionGUID: HpAc5ilTRGGGJICAyPE6Ag==
X-CSE-MsgGUID: 4l9hSGDFTmWSabeDbzuZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="37001018"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 May 2024 08:36:40 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8M5S-0002KS-0b;
	Sat, 18 May 2024 15:35:24 +0000
Date: Sat, 18 May 2024 23:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 04/20] mm: Provide mm_struct and address to
 huge_ptep_get()
Message-ID: <202405182329.8fv09qdW-lkp@intel.com>
References: <52ef59b206e8082a173965dee11712c9394f2e83.1715971869.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ef59b206e8082a173965dee11712c9394f2e83.1715971869.git.christophe.leroy@csgroup.eu>

Hi Christophe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core linus/master v6.9]
[cannot apply to akpm-mm/mm-everything next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/mm-Provide-pagesize-to-pmd_populate/20240518-030701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/52ef59b206e8082a173965dee11712c9394f2e83.1715971869.git.christophe.leroy%40csgroup.eu
patch subject: [RFC PATCH v2 04/20] mm: Provide mm_struct and address to huge_ptep_get()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240518/202405182329.8fv09qdW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182329.8fv09qdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182329.8fv09qdW-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb.c: In function 'hugetlb_mfill_atomic_pte':
>> mm/hugetlb.c:6692:50: error: 'mm' undeclared (first use in this function); did you mean 'tm'?
    6692 |                 if (!huge_pte_none(huge_ptep_get(mm, dst_addr, dst_pte))) {
         |                                                  ^~
         |                                                  tm
   mm/hugetlb.c:6692:50: note: each undeclared identifier is reported only once for each function it appears in


vim +6692 mm/hugetlb.c

  6661	
  6662	/*
  6663	 * Used by userfaultfd UFFDIO_* ioctls. Based on userfaultfd's mfill_atomic_pte
  6664	 * with modifications for hugetlb pages.
  6665	 */
  6666	int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
  6667				     struct vm_area_struct *dst_vma,
  6668				     unsigned long dst_addr,
  6669				     unsigned long src_addr,
  6670				     uffd_flags_t flags,
  6671				     struct folio **foliop)
  6672	{
  6673		struct mm_struct *dst_mm = dst_vma->vm_mm;
  6674		bool is_continue = uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE);
  6675		bool wp_enabled = (flags & MFILL_ATOMIC_WP);
  6676		struct hstate *h = hstate_vma(dst_vma);
  6677		struct address_space *mapping = dst_vma->vm_file->f_mapping;
  6678		pgoff_t idx = vma_hugecache_offset(h, dst_vma, dst_addr);
  6679		unsigned long size;
  6680		int vm_shared = dst_vma->vm_flags & VM_SHARED;
  6681		pte_t _dst_pte;
  6682		spinlock_t *ptl;
  6683		int ret = -ENOMEM;
  6684		struct folio *folio;
  6685		int writable;
  6686		bool folio_in_pagecache = false;
  6687	
  6688		if (uffd_flags_mode_is(flags, MFILL_ATOMIC_POISON)) {
  6689			ptl = huge_pte_lock(h, dst_mm, dst_pte);
  6690	
  6691			/* Don't overwrite any existing PTEs (even markers) */
> 6692			if (!huge_pte_none(huge_ptep_get(mm, dst_addr, dst_pte))) {
  6693				spin_unlock(ptl);
  6694				return -EEXIST;
  6695			}
  6696	
  6697			_dst_pte = make_pte_marker(PTE_MARKER_POISONED);
  6698			set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte,
  6699					huge_page_size(h));
  6700	
  6701			/* No need to invalidate - it was non-present before */
  6702			update_mmu_cache(dst_vma, dst_addr, dst_pte);
  6703	
  6704			spin_unlock(ptl);
  6705			return 0;
  6706		}
  6707	
  6708		if (is_continue) {
  6709			ret = -EFAULT;
  6710			folio = filemap_lock_hugetlb_folio(h, mapping, idx);
  6711			if (IS_ERR(folio))
  6712				goto out;
  6713			folio_in_pagecache = true;
  6714		} else if (!*foliop) {
  6715			/* If a folio already exists, then it's UFFDIO_COPY for
  6716			 * a non-missing case. Return -EEXIST.
  6717			 */
  6718			if (vm_shared &&
  6719			    hugetlbfs_pagecache_present(h, dst_vma, dst_addr)) {
  6720				ret = -EEXIST;
  6721				goto out;
  6722			}
  6723	
  6724			folio = alloc_hugetlb_folio(dst_vma, dst_addr, 0);
  6725			if (IS_ERR(folio)) {
  6726				ret = -ENOMEM;
  6727				goto out;
  6728			}
  6729	
  6730			ret = copy_folio_from_user(folio, (const void __user *) src_addr,
  6731						   false);
  6732	
  6733			/* fallback to copy_from_user outside mmap_lock */
  6734			if (unlikely(ret)) {
  6735				ret = -ENOENT;
  6736				/* Free the allocated folio which may have
  6737				 * consumed a reservation.
  6738				 */
  6739				restore_reserve_on_error(h, dst_vma, dst_addr, folio);
  6740				folio_put(folio);
  6741	
  6742				/* Allocate a temporary folio to hold the copied
  6743				 * contents.
  6744				 */
  6745				folio = alloc_hugetlb_folio_vma(h, dst_vma, dst_addr);
  6746				if (!folio) {
  6747					ret = -ENOMEM;
  6748					goto out;
  6749				}
  6750				*foliop = folio;
  6751				/* Set the outparam foliop and return to the caller to
  6752				 * copy the contents outside the lock. Don't free the
  6753				 * folio.
  6754				 */
  6755				goto out;
  6756			}
  6757		} else {
  6758			if (vm_shared &&
  6759			    hugetlbfs_pagecache_present(h, dst_vma, dst_addr)) {
  6760				folio_put(*foliop);
  6761				ret = -EEXIST;
  6762				*foliop = NULL;
  6763				goto out;
  6764			}
  6765	
  6766			folio = alloc_hugetlb_folio(dst_vma, dst_addr, 0);
  6767			if (IS_ERR(folio)) {
  6768				folio_put(*foliop);
  6769				ret = -ENOMEM;
  6770				*foliop = NULL;
  6771				goto out;
  6772			}
  6773			ret = copy_user_large_folio(folio, *foliop, dst_addr, dst_vma);
  6774			folio_put(*foliop);
  6775			*foliop = NULL;
  6776			if (ret) {
  6777				folio_put(folio);
  6778				goto out;
  6779			}
  6780		}
  6781	
  6782		/*
  6783		 * If we just allocated a new page, we need a memory barrier to ensure
  6784		 * that preceding stores to the page become visible before the
  6785		 * set_pte_at() write. The memory barrier inside __folio_mark_uptodate
  6786		 * is what we need.
  6787		 *
  6788		 * In the case where we have not allocated a new page (is_continue),
  6789		 * the page must already be uptodate. UFFDIO_CONTINUE already includes
  6790		 * an earlier smp_wmb() to ensure that prior stores will be visible
  6791		 * before the set_pte_at() write.
  6792		 */
  6793		if (!is_continue)
  6794			__folio_mark_uptodate(folio);
  6795		else
  6796			WARN_ON_ONCE(!folio_test_uptodate(folio));
  6797	
  6798		/* Add shared, newly allocated pages to the page cache. */
  6799		if (vm_shared && !is_continue) {
  6800			size = i_size_read(mapping->host) >> huge_page_shift(h);
  6801			ret = -EFAULT;
  6802			if (idx >= size)
  6803				goto out_release_nounlock;
  6804	
  6805			/*
  6806			 * Serialization between remove_inode_hugepages() and
  6807			 * hugetlb_add_to_page_cache() below happens through the
  6808			 * hugetlb_fault_mutex_table that here must be hold by
  6809			 * the caller.
  6810			 */
  6811			ret = hugetlb_add_to_page_cache(folio, mapping, idx);
  6812			if (ret)
  6813				goto out_release_nounlock;
  6814			folio_in_pagecache = true;
  6815		}
  6816	
  6817		ptl = huge_pte_lock(h, dst_mm, dst_pte);
  6818	
  6819		ret = -EIO;
  6820		if (folio_test_hwpoison(folio))
  6821			goto out_release_unlock;
  6822	
  6823		/*
  6824		 * We allow to overwrite a pte marker: consider when both MISSING|WP
  6825		 * registered, we firstly wr-protect a none pte which has no page cache
  6826		 * page backing it, then access the page.
  6827		 */
  6828		ret = -EEXIST;
  6829		if (!huge_pte_none_mostly(huge_ptep_get(mm, dst_addr, dst_pte)))
  6830			goto out_release_unlock;
  6831	
  6832		if (folio_in_pagecache)
  6833			hugetlb_add_file_rmap(folio);
  6834		else
  6835			hugetlb_add_new_anon_rmap(folio, dst_vma, dst_addr);
  6836	
  6837		/*
  6838		 * For either: (1) CONTINUE on a non-shared VMA, or (2) UFFDIO_COPY
  6839		 * with wp flag set, don't set pte write bit.
  6840		 */
  6841		if (wp_enabled || (is_continue && !vm_shared))
  6842			writable = 0;
  6843		else
  6844			writable = dst_vma->vm_flags & VM_WRITE;
  6845	
  6846		_dst_pte = make_huge_pte(dst_vma, &folio->page, writable);
  6847		/*
  6848		 * Always mark UFFDIO_COPY page dirty; note that this may not be
  6849		 * extremely important for hugetlbfs for now since swapping is not
  6850		 * supported, but we should still be clear in that this page cannot be
  6851		 * thrown away at will, even if write bit not set.
  6852		 */
  6853		_dst_pte = huge_pte_mkdirty(_dst_pte);
  6854		_dst_pte = pte_mkyoung(_dst_pte);
  6855	
  6856		if (wp_enabled)
  6857			_dst_pte = huge_pte_mkuffd_wp(_dst_pte);
  6858	
  6859		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte, huge_page_size(h));
  6860	
  6861		hugetlb_count_add(pages_per_huge_page(h), dst_mm);
  6862	
  6863		/* No need to invalidate - it was non-present before */
  6864		update_mmu_cache(dst_vma, dst_addr, dst_pte);
  6865	
  6866		spin_unlock(ptl);
  6867		if (!is_continue)
  6868			folio_set_hugetlb_migratable(folio);
  6869		if (vm_shared || is_continue)
  6870			folio_unlock(folio);
  6871		ret = 0;
  6872	out:
  6873		return ret;
  6874	out_release_unlock:
  6875		spin_unlock(ptl);
  6876		if (vm_shared || is_continue)
  6877			folio_unlock(folio);
  6878	out_release_nounlock:
  6879		if (!folio_in_pagecache)
  6880			restore_reserve_on_error(h, dst_vma, dst_addr, folio);
  6881		folio_put(folio);
  6882		goto out;
  6883	}
  6884	#endif /* CONFIG_USERFAULTFD */
  6885	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
