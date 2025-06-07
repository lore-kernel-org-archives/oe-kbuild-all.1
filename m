Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CCE4C9D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749285330; cv=none; b=LD04l8p2SN2eHn8aKvxtcppJ7JZhOvvzw4uxU6gt4ePG9ddJhg8zn6LQxu+8tlrsWa9kRHfGN8+26uGwQwRHYtjhBiz+hJ2tjl/M8FmyVsKQ31m/LHhx29VK8aTAceyJNEohodUv/Y9P9RIF7wC+Zc/6hulYo37qA5XrYcdLAvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749285330; c=relaxed/simple;
	bh=3TnhZ6pr4oXD1e2SQrKa6oQbta2Evg6VWNba32R+Jz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IymKxiJAyPPuagc7eS1RCfBSOXErCEsNfeGH2JTvb8CuLBy2XJtcPFntn3vQJ6h7XEMEx64loAKpY4ROjTLcHJkCPfzfuN5GxmHLBA4grvnOEcG7yvxnet97fXGnJpvPxwuS5lK9pzWfZ02THOoi0IKpimemrvpZ+WQEwhCzsOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBuP1DxS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBuP1DxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749285328; x=1780821328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TnhZ6pr4oXD1e2SQrKa6oQbta2Evg6VWNba32R+Jz4=;
  b=VBuP1DxSwhq55YobyghZh7GyLvVKfIylS4DoQkuVpJ6RcdDm8BCI9+qe
   8ivWBvOLn529EQVxjGlpEoSJALua55yakYbq11AYaB+oFrkTsNgxjprX3
   HlZZVkDa8G+6y4E2kyhmRvsU9xub23k0rpvK5Midfgt9KOrzG/2/goJQd
   HP0O6Pwf8pPCGunOTgZp7pB7Yy42DJqwCMgMZdI+i+wxXdlfiWsSTtDf9
   8POlcTzUeDRXxGSfK3yVRn/miPdlucZIVBpIWOnKQD4ai8t1gcfVnqXXy
   zAqQt6a5+XfnEWYXE3ZYpMUfG09aTlRKTIV33AC/rqCe8RjF94mVUzoai
   g==;
X-CSE-ConnectionGUID: TkpLIY99QSm12w0GBuYSgQ==
X-CSE-MsgGUID: FaDuvAy0RBq0ICkFR4pnSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51336606"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51336606"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 01:35:27 -0700
X-CSE-ConnectionGUID: 5DEZ7K7cRzaeupOVjyPQ9g==
X-CSE-MsgGUID: pcE84auIT2mvHUS3tQKOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="150866818"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jun 2025 01:35:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNp1P-0005Z3-2G;
	Sat, 07 Jun 2025 08:35:23 +0000
Date: Sat, 7 Jun 2025 16:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:vm_normal_page_pud 15/15] mm/pagewalk.c:878:32:
 error: implicit declaration of function 'vm_normal_page_pud'; did you mean
 'vm_normal_page_pmd'?
Message-ID: <202506071618.2J7B6bp4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux vm_normal_page_pud
head:   5e55c4b55694005e4fb9300605ca3723623a61f9
commit: 5e55c4b55694005e4fb9300605ca3723623a61f9 [15/15] mm: introduce and use vm_normal_page_pud()
config: x86_64-buildonly-randconfig-004-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071618.2J7B6bp4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071618.2J7B6bp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071618.2J7B6bp4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/pagewalk.c: In function 'folio_walk_start':
>> mm/pagewalk.c:878:32: error: implicit declaration of function 'vm_normal_page_pud'; did you mean 'vm_normal_page_pmd'? [-Werror=implicit-function-declaration]
     878 |                         page = vm_normal_page_pud(vma, pud);
         |                                ^~~~~~~~~~~~~~~~~~
         |                                vm_normal_page_pmd
>> mm/pagewalk.c:878:30: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     878 |                         page = vm_normal_page_pud(vma, pud);
         |                              ^
   cc1: some warnings being treated as errors
--
>> mm/memory.c:697:14: warning: no previous prototype for 'vm_normal_page_pud' [-Wmissing-prototypes]
     697 | struct page *vm_normal_page_pud(struct vm_area_struct *vma, pud_t pud)
         |              ^~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'vm_normal_page_pud':
>> mm/memory.c:701:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     701 |         if (unlikely(pud_special(pud)))
         |         ^~
   mm/memory.c:703:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     703 |                 return NULL;
         |                 ^~~~~~
>> mm/memory.c:699:23: warning: unused variable 'pfn' [-Wunused-variable]
     699 |         unsigned long pfn = pud_pfn(pud);
         |                       ^~~
   mm/memory.c: At top level:
>> mm/memory.c:705:9: error: expected identifier or '(' before 'if'
     705 |         if (pud_devmap(pud))
         |         ^~
>> mm/memory.c:707:9: error: expected identifier or '(' before 'return'
     707 |         return vm_normal_page_pfn(vma, pfn);
         |         ^~~~~~
>> mm/memory.c:708:1: error: expected identifier or '(' before '}' token
     708 | }
         | ^
   mm/memory.c: In function 'remap_pte_range':
   mm/memory.c:2726:21: error: implicit declaration of function 'vm_normal_page_in_pfnmap'; did you mean 'vm_normal_page_pfn'? [-Werror=implicit-function-declaration]
    2726 |                 if (vm_normal_page_in_pfnmap(vma, pfn)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     vm_normal_page_pfn
   cc1: some warnings being treated as errors


vim +878 mm/pagewalk.c

   773	
   774	/**
   775	 * folio_walk_start - walk the page tables to a folio
   776	 * @fw: filled with information on success.
   777	 * @vma: the VMA.
   778	 * @addr: the virtual address to use for the page table walk.
   779	 * @flags: flags modifying which folios to walk to.
   780	 *
   781	 * Walk the page tables using @addr in a given @vma to a mapped folio and
   782	 * return the folio, making sure that the page table entry referenced by
   783	 * @addr cannot change until folio_walk_end() was called.
   784	 *
   785	 * As default, this function returns only folios that are not special (e.g., not
   786	 * the zeropage) and never returns folios that are supposed to be ignored by the
   787	 * VM as documented by vm_normal_page(). If requested, zeropages will be
   788	 * returned as well.
   789	 *
   790	 * As default, this function only considers present page table entries.
   791	 * If requested, it will also consider migration entries.
   792	 *
   793	 * If this function returns NULL it might either indicate "there is nothing" or
   794	 * "there is nothing suitable".
   795	 *
   796	 * On success, @fw is filled and the function returns the folio while the PTL
   797	 * is still held and folio_walk_end() must be called to clean up,
   798	 * releasing any held locks. The returned folio must *not* be used after the
   799	 * call to folio_walk_end(), unless a short-term folio reference is taken before
   800	 * that call.
   801	 *
   802	 * @fw->page will correspond to the page that is effectively referenced by
   803	 * @addr. However, for migration entries and shared zeropages @fw->page is
   804	 * set to NULL. Note that large folios might be mapped by multiple page table
   805	 * entries, and this function will always only lookup a single entry as
   806	 * specified by @addr, which might or might not cover more than a single page of
   807	 * the returned folio.
   808	 *
   809	 * This function must *not* be used as a naive replacement for
   810	 * get_user_pages() / pin_user_pages(), especially not to perform DMA or
   811	 * to carelessly modify page content. This function may *only* be used to grab
   812	 * short-term folio references, never to grab long-term folio references.
   813	 *
   814	 * Using the page table entry pointers in @fw for reading or modifying the
   815	 * entry should be avoided where possible: however, there might be valid
   816	 * use cases.
   817	 *
   818	 * WARNING: Modifying page table entries in hugetlb VMAs requires a lot of care.
   819	 * For example, PMD page table sharing might require prior unsharing. Also,
   820	 * logical hugetlb entries might span multiple physical page table entries,
   821	 * which *must* be modified in a single operation (set_huge_pte_at(),
   822	 * huge_ptep_set_*, ...). Note that the page table entry stored in @fw might
   823	 * not correspond to the first physical entry of a logical hugetlb entry.
   824	 *
   825	 * The mmap lock must be held in read mode.
   826	 *
   827	 * Return: folio pointer on success, otherwise NULL.
   828	 */
   829	struct folio *folio_walk_start(struct folio_walk *fw,
   830			struct vm_area_struct *vma, unsigned long addr,
   831			folio_walk_flags_t flags)
   832	{
   833		unsigned long entry_size;
   834		bool expose_page = true;
   835		struct page *page;
   836		pud_t *pudp, pud;
   837		pmd_t *pmdp, pmd;
   838		pte_t *ptep, pte;
   839		spinlock_t *ptl;
   840		pgd_t *pgdp;
   841		p4d_t *p4dp;
   842	
   843		mmap_assert_locked(vma->vm_mm);
   844		vma_pgtable_walk_begin(vma);
   845	
   846		if (WARN_ON_ONCE(addr < vma->vm_start || addr >= vma->vm_end))
   847			goto not_found;
   848	
   849		pgdp = pgd_offset(vma->vm_mm, addr);
   850		if (pgd_none_or_clear_bad(pgdp))
   851			goto not_found;
   852	
   853		p4dp = p4d_offset(pgdp, addr);
   854		if (p4d_none_or_clear_bad(p4dp))
   855			goto not_found;
   856	
   857		pudp = pud_offset(p4dp, addr);
   858		pud = pudp_get(pudp);
   859		if (pud_none(pud))
   860			goto not_found;
   861		if (IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES) &&
   862		    (!pud_present(pud) || pud_leaf(pud))) {
   863			ptl = pud_lock(vma->vm_mm, pudp);
   864			pud = pudp_get(pudp);
   865	
   866			entry_size = PUD_SIZE;
   867			fw->level = FW_LEVEL_PUD;
   868			fw->pudp = pudp;
   869			fw->pud = pud;
   870	
   871			if (pud_none(pud)) {
   872				spin_unlock(ptl);
   873				goto not_found;
   874			} else if (pud_present(pud) && !pud_leaf(pud)) {
   875				spin_unlock(ptl);
   876				goto pmd_table;
   877			} else if (pud_present(pud)) {
 > 878				page = vm_normal_page_pud(vma, pud);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
