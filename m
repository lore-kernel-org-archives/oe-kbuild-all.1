Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865A280CD6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368699; cv=none; b=dthhe8N/iaQPTGHfemwAk4jkMh2AZGn8wGULDazfyTkMH9ltDa2K22uWm1vS9i/0ntajm2OHt93Sbv9BZjcesVAg/ofQtyns19ft+mAKU3rURthRo9Q2lHQMr4YwVVzwhOMlWUchO/YUaW/S0KIY+n+HL0avN2gQol5aDICKIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368699; c=relaxed/simple;
	bh=MJVNzW7q6UrQzvAyAG3H4ME8+tc73FfE4aEB42ZQinM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLSvtFfYsd7CEzw9hnPbdl6LbAh32unAlENZ1drq/5NewDVDicLnB6YXJy9t00vhTZzkR9VStdvbXiAcQOdINBtiACgkQcNKMVi3BCmmPdCxTEP6iWpsUAYAs4D0tO2KXEkiHLHb1A2QnTaghQGKQpozbfsZQGbavjORVbMKjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miIJJT1j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miIJJT1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748368697; x=1779904697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJVNzW7q6UrQzvAyAG3H4ME8+tc73FfE4aEB42ZQinM=;
  b=miIJJT1jNmwn36sJ3HmYCYB1wEOkJxlk5Jm6ewmdh7NTBJpvjaGjD+XQ
   iEcSAjy8fm/0F3rdZRcprsYc6bktO86XCguebwinAtdCjanUJ+dAgp3Vs
   oEoKQkZMO9ia1rinBL++RCEVBoAJxCwWI/9nNzcwFUdRav86vrPf8b6L6
   dj+oeAVL33jUNIjTkgIkkoagA48oBCAgTbw3ZrKp/HeWMoM5fBqGt6qEl
   MZ7xTISNu7MQwNmwDIvCbQ2y7TWCzM+u2gSfdrsWRXr6NhXKifq0cUOYw
   NvyDh/+PEEe9yl1wklTva1A87KoWIn6gSJSzQ/JERM6pmcshmJPErzm3e
   g==;
X-CSE-ConnectionGUID: OgJdJU6RQ+ad3kptttdtMQ==
X-CSE-MsgGUID: EM9KkFpRSdiZh+/tIZZ0Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50429292"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50429292"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:58:15 -0700
X-CSE-ConnectionGUID: wM+1b+vuQViJX1o1fqq+Gw==
X-CSE-MsgGUID: ovp8+9DpRmSseahkCSCFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142747888"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2025 10:58:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJyZ1-000Uoy-2g;
	Tue, 27 May 2025 17:58:11 +0000
Date: Wed, 28 May 2025 01:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/2] mm/mremap: Expose abnormal new_pte during
 move_ptes
Message-ID: <202505280152.hvGSNcAt-lkp@intel.com>
References: <20250527132351.2050820-3-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527132351.2050820-3-pulehui@huaweicloud.com>

Hi Pu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.15 next-20250527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pu-Lehui/mm-mremap-Fix-uprobe-anon-page-be-overwritten-when-expanding-vma-during-mremap/20250527-212250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250527132351.2050820-3-pulehui%40huaweicloud.com
patch subject: [RFC PATCH v2 2/2] mm/mremap: Expose abnormal new_pte during move_ptes
config: sparc-randconfig-001-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280152.hvGSNcAt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280152.hvGSNcAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280152.hvGSNcAt-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mremap.c: In function 'move_ptes':
>> mm/mremap.c:242:17: error: expected ';' before 'if'
     242 |                 if (pte_none(ptep_get(old_pte)))
         |                 ^~


vim +242 mm/mremap.c

6dec97dc92946e Cyrill Gorcunov   2013-08-27  172  
664dc4da2694fa Lorenzo Stoakes   2025-03-10  173  static int move_ptes(struct pagetable_move_control *pmc,
664dc4da2694fa Lorenzo Stoakes   2025-03-10  174  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
^1da177e4c3f41 Linus Torvalds    2005-04-16  175  {
664dc4da2694fa Lorenzo Stoakes   2025-03-10  176  	struct vm_area_struct *vma = pmc->old;
0cef0bb836e3cf Ryan Roberts      2025-01-07  177  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
^1da177e4c3f41 Linus Torvalds    2005-04-16  178  	struct mm_struct *mm = vma->vm_mm;
7be7a546994f12 Hugh Dickins      2005-10-29  179  	pte_t *old_pte, *new_pte, pte;
838d02354464c3 Qi Zheng          2024-09-26  180  	pmd_t dummy_pmdval;
4c21e2f2441dc5 Hugh Dickins      2005-10-29  181  	spinlock_t *old_ptl, *new_ptl;
5d1904204c9959 Aaron Lu          2016-11-10  182  	bool force_flush = false;
664dc4da2694fa Lorenzo Stoakes   2025-03-10  183  	unsigned long old_addr = pmc->old_addr;
664dc4da2694fa Lorenzo Stoakes   2025-03-10  184  	unsigned long new_addr = pmc->new_addr;
664dc4da2694fa Lorenzo Stoakes   2025-03-10  185  	unsigned long old_end = old_addr + extent;
5d1904204c9959 Aaron Lu          2016-11-10  186  	unsigned long len = old_end - old_addr;
a5be621ee2925b Hugh Dickins      2023-06-08  187  	int err = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  188  
^1da177e4c3f41 Linus Torvalds    2005-04-16  189  	/*
c8c06efa8b5526 Davidlohr Bueso   2014-12-12  190  	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
38a76013ad809b Michel Lespinasse 2012-10-08  191  	 * locks to ensure that rmap will always observe either the old or the
38a76013ad809b Michel Lespinasse 2012-10-08  192  	 * new ptes. This is the easiest way to avoid races with
38a76013ad809b Michel Lespinasse 2012-10-08  193  	 * truncate_pagecache(), page migration, etc...
38a76013ad809b Michel Lespinasse 2012-10-08  194  	 *
38a76013ad809b Michel Lespinasse 2012-10-08  195  	 * When need_rmap_locks is false, we use other ways to avoid
38a76013ad809b Michel Lespinasse 2012-10-08  196  	 * such races:
38a76013ad809b Michel Lespinasse 2012-10-08  197  	 *
38a76013ad809b Michel Lespinasse 2012-10-08  198  	 * - During exec() shift_arg_pages(), we use a specially tagged vma
222100eed264ba Anshuman Khandual 2020-04-01  199  	 *   which rmap call sites look for using vma_is_temporary_stack().
38a76013ad809b Michel Lespinasse 2012-10-08  200  	 *
38a76013ad809b Michel Lespinasse 2012-10-08  201  	 * - During mremap(), new_vma is often known to be placed after vma
38a76013ad809b Michel Lespinasse 2012-10-08  202  	 *   in rmap traversal order. This ensures rmap will always observe
38a76013ad809b Michel Lespinasse 2012-10-08  203  	 *   either the old pte, or the new pte, or both (the page table locks
38a76013ad809b Michel Lespinasse 2012-10-08  204  	 *   serialize access to individual ptes, but only rmap traversal
38a76013ad809b Michel Lespinasse 2012-10-08  205  	 *   order guarantees that we won't miss both the old and new ptes).
^1da177e4c3f41 Linus Torvalds    2005-04-16  206  	 */
664dc4da2694fa Lorenzo Stoakes   2025-03-10  207  	if (pmc->need_rmap_locks)
1d069b7dd56728 Hugh Dickins      2016-05-19  208  		take_rmap_locks(vma);
^1da177e4c3f41 Linus Torvalds    2005-04-16  209  
4c21e2f2441dc5 Hugh Dickins      2005-10-29  210  	/*
4c21e2f2441dc5 Hugh Dickins      2005-10-29  211  	 * We don't have to worry about the ordering of src and dst
c1e8d7c6a7a682 Michel Lespinasse 2020-06-08  212  	 * pte locks because exclusive mmap_lock prevents deadlock.
4c21e2f2441dc5 Hugh Dickins      2005-10-29  213  	 */
c74df32c724a16 Hugh Dickins      2005-10-29  214  	old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
a5be621ee2925b Hugh Dickins      2023-06-08  215  	if (!old_pte) {
a5be621ee2925b Hugh Dickins      2023-06-08  216  		err = -EAGAIN;
a5be621ee2925b Hugh Dickins      2023-06-08  217  		goto out;
a5be621ee2925b Hugh Dickins      2023-06-08  218  	}
838d02354464c3 Qi Zheng          2024-09-26  219  	/*
838d02354464c3 Qi Zheng          2024-09-26  220  	 * Now new_pte is none, so hpage_collapse_scan_file() path can not find
838d02354464c3 Qi Zheng          2024-09-26  221  	 * this by traversing file->f_mapping, so there is no concurrency with
838d02354464c3 Qi Zheng          2024-09-26  222  	 * retract_page_tables(). In addition, we already hold the exclusive
838d02354464c3 Qi Zheng          2024-09-26  223  	 * mmap_lock, so this new_pte page is stable, so there is no need to get
838d02354464c3 Qi Zheng          2024-09-26  224  	 * pmdval and do pmd_same() check.
838d02354464c3 Qi Zheng          2024-09-26  225  	 */
838d02354464c3 Qi Zheng          2024-09-26  226  	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
838d02354464c3 Qi Zheng          2024-09-26  227  					   &new_ptl);
a5be621ee2925b Hugh Dickins      2023-06-08  228  	if (!new_pte) {
a5be621ee2925b Hugh Dickins      2023-06-08  229  		pte_unmap_unlock(old_pte, old_ptl);
a5be621ee2925b Hugh Dickins      2023-06-08  230  		err = -EAGAIN;
a5be621ee2925b Hugh Dickins      2023-06-08  231  		goto out;
a5be621ee2925b Hugh Dickins      2023-06-08  232  	}
4c21e2f2441dc5 Hugh Dickins      2005-10-29  233  	if (new_ptl != old_ptl)
f20dc5f7c1adf1 Ingo Molnar       2006-07-03  234  		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
3ea277194daaea Mel Gorman        2017-08-02  235  	flush_tlb_batched_pending(vma->vm_mm);
6606c3e0da5360 Zachary Amsden    2006-09-30  236  	arch_enter_lazy_mmu_mode();
7be7a546994f12 Hugh Dickins      2005-10-29  237  
7be7a546994f12 Hugh Dickins      2005-10-29  238  	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
7be7a546994f12 Hugh Dickins      2005-10-29  239  				   new_pte++, new_addr += PAGE_SIZE) {
41d8ca0986951c Pu Lehui          2025-05-27  240  		WARN_ON_ONCE(!pte_none(*new_pte))
41d8ca0986951c Pu Lehui          2025-05-27  241  
c33c794828f212 Ryan Roberts      2023-06-12 @242  		if (pte_none(ptep_get(old_pte)))
7be7a546994f12 Hugh Dickins      2005-10-29  243  			continue;
5d1904204c9959 Aaron Lu          2016-11-10  244  
a2ce2666aa3509 Aaron Lu          2016-11-29  245  		pte = ptep_get_and_clear(mm, old_addr, old_pte);
5d1904204c9959 Aaron Lu          2016-11-10  246  		/*
eb66ae03082960 Linus Torvalds    2018-10-12  247  		 * If we are remapping a valid PTE, make sure
a2ce2666aa3509 Aaron Lu          2016-11-29  248  		 * to flush TLB before we drop the PTL for the
eb66ae03082960 Linus Torvalds    2018-10-12  249  		 * PTE.
a2ce2666aa3509 Aaron Lu          2016-11-29  250  		 *
eb66ae03082960 Linus Torvalds    2018-10-12  251  		 * NOTE! Both old and new PTL matter: the old one
a929e0d10f3db1 Kefeng Wang       2024-06-04  252  		 * for racing with folio_mkclean(), the new one to
eb66ae03082960 Linus Torvalds    2018-10-12  253  		 * make sure the physical page stays valid until
eb66ae03082960 Linus Torvalds    2018-10-12  254  		 * the TLB entry for the old mapping has been
eb66ae03082960 Linus Torvalds    2018-10-12  255  		 * flushed.
5d1904204c9959 Aaron Lu          2016-11-10  256  		 */
eb66ae03082960 Linus Torvalds    2018-10-12  257  		if (pte_present(pte))
5d1904204c9959 Aaron Lu          2016-11-10  258  			force_flush = true;
82a616d0f33b77 David Hildenbrand 2024-03-27  259  		pte = move_pte(pte, old_addr, new_addr);
6dec97dc92946e Cyrill Gorcunov   2013-08-27  260  		pte = move_soft_dirty_pte(pte);
0cef0bb836e3cf Ryan Roberts      2025-01-07  261  
0cef0bb836e3cf Ryan Roberts      2025-01-07  262  		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
0cef0bb836e3cf Ryan Roberts      2025-01-07  263  			pte_clear(mm, new_addr, new_pte);
0cef0bb836e3cf Ryan Roberts      2025-01-07  264  		else {
0cef0bb836e3cf Ryan Roberts      2025-01-07  265  			if (need_clear_uffd_wp) {
0cef0bb836e3cf Ryan Roberts      2025-01-07  266  				if (pte_present(pte))
0cef0bb836e3cf Ryan Roberts      2025-01-07  267  					pte = pte_clear_uffd_wp(pte);
0cef0bb836e3cf Ryan Roberts      2025-01-07  268  				else if (is_swap_pte(pte))
0cef0bb836e3cf Ryan Roberts      2025-01-07  269  					pte = pte_swp_clear_uffd_wp(pte);
0cef0bb836e3cf Ryan Roberts      2025-01-07  270  			}
6dec97dc92946e Cyrill Gorcunov   2013-08-27  271  			set_pte_at(mm, new_addr, new_pte, pte);
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  		}
0cef0bb836e3cf Ryan Roberts      2025-01-07  273  	}
7be7a546994f12 Hugh Dickins      2005-10-29  274  
6606c3e0da5360 Zachary Amsden    2006-09-30  275  	arch_leave_lazy_mmu_mode();
eb66ae03082960 Linus Torvalds    2018-10-12  276  	if (force_flush)
eb66ae03082960 Linus Torvalds    2018-10-12  277  		flush_tlb_range(vma, old_end - len, old_end);
4c21e2f2441dc5 Hugh Dickins      2005-10-29  278  	if (new_ptl != old_ptl)
4c21e2f2441dc5 Hugh Dickins      2005-10-29  279  		spin_unlock(new_ptl);
ece0e2b6406a99 Peter Zijlstra    2010-10-26  280  	pte_unmap(new_pte - 1);
c74df32c724a16 Hugh Dickins      2005-10-29  281  	pte_unmap_unlock(old_pte - 1, old_ptl);
a5be621ee2925b Hugh Dickins      2023-06-08  282  out:
664dc4da2694fa Lorenzo Stoakes   2025-03-10  283  	if (pmc->need_rmap_locks)
1d069b7dd56728 Hugh Dickins      2016-05-19  284  		drop_rmap_locks(vma);
a5be621ee2925b Hugh Dickins      2023-06-08  285  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  286  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  287  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
