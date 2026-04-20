Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A543939BFEF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689522; cv=none; b=sdOCS+yW4oZXN/PK57TsT3wJk9enRdL/pstvWiqr88k1OA950zoBqV5746f+M/DUYqB72G3LIEXVpRYSq9jr3A7x1fkRyDnnUI3iF8QFm+mM81DvrUyjSPH97UQ0vUm1pnldQPDpxAWDK+CqFCLHEjVBANHj/Jg2AUWn5etSf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689522; c=relaxed/simple;
	bh=GL1d9n5uDG7hkvwwgGwI0l7+8qI/zIq6eU8gOYrlN8g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iq/vRywU9VWvz1D8HOelR3Cl2tbiuREK1iUb3UoROKN0tfw75alGamNtLo7rRauL+wdsdnda3+ASD8+qGY8svuWrKgUzoDCPa9gLRR5WbMtNKSTRpRNDqI9If+dKKjlh97zvZSXXX2Nn1Dwol3yDtv8PIyXviJ5Qa1NsTaRCqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEHnFyOY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEHnFyOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776689520; x=1808225520;
  h=date:from:to:cc:subject:message-id;
  bh=GL1d9n5uDG7hkvwwgGwI0l7+8qI/zIq6eU8gOYrlN8g=;
  b=EEHnFyOYBCVJRDzEmxee4SZvyrZS4nGdOlR5D3+zfiyYn/PXrY4woGJU
   R40TBmuFQQ9rGjfU4T2yRg2PibVQsvq3LWcbErAhPsghLn/s4L0/GrkzI
   j1cXtBwvsMuptQIvMiCuXisi3/99ZZ4O76KzlrJdE0uhz3tJ+P7Un/1em
   vwkZtlWqizj2lQeUAnwiq6gkHKuaD+YH5CL9Pztj4Khp7jVE7TooCcBvi
   p1LkuJgvNBNjYIwWvM3kC1lxRBj4wGr+QaJWfronATIGRTmqo3t1PTkVd
   L+zn2XdtIl/NmRFwJhRG5/DG0DWilWnLiCbfgh5HX4Dky4HVUVEZd3OeG
   w==;
X-CSE-ConnectionGUID: IYGEY/PTQEya3zIowKYGDw==
X-CSE-MsgGUID: 8yJeJOlpQYKDi1q9PARCIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88978950"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="88978950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 05:51:59 -0700
X-CSE-ConnectionGUID: siBlYYNLRByETnclmdCReA==
X-CSE-MsgGUID: AMU7n2YeSoOAUDaVOD71zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="254967812"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Apr 2026 05:51:58 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEo6W-000000002PA-1phz;
	Mon, 20 Apr 2026 12:51:56 +0000
Date: Mon, 20 Apr 2026 20:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd/rfc-v3 2/9] mm/migrate.c:399:47: error:
 'PAGE_NONE' undeclared; did you mean 'PAGE_SIZE'?
Message-ID: <202604202008.iUFq1lAx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/rfc-v3
head:   fa6a4bc0ae172e756264bbe74bea1d95acb29b02
commit: 25dab3d3a0ffa02119bbf5873d46ba0af562a502 [2/9] mm: add MM_CP_UFFD_RWP change_protection() flag
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260420/202604202008.iUFq1lAx-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604202008.iUFq1lAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604202008.iUFq1lAx-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate.c: In function 'remove_migration_pte':
>> mm/migrate.c:399:47: error: 'PAGE_NONE' undeclared (first use in this function); did you mean 'PAGE_SIZE'?
     399 |                         pte = pte_modify(pte, PAGE_NONE);
         |                                               ^~~~~~~~~
         |                                               PAGE_SIZE
   mm/migrate.c:399:47: note: each undeclared identifier is reported only once for each function it appears in


vim +399 mm/migrate.c

   342	
   343	/*
   344	 * Restore a potential migration pte to a working pte entry
   345	 */
   346	static bool remove_migration_pte(struct folio *folio,
   347			struct vm_area_struct *vma, unsigned long addr, void *arg)
   348	{
   349		struct rmap_walk_arg *rmap_walk_arg = arg;
   350		DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
   351	
   352		while (page_vma_mapped_walk(&pvmw)) {
   353			rmap_t rmap_flags = RMAP_NONE;
   354			pte_t old_pte;
   355			pte_t pte;
   356			softleaf_t entry;
   357			struct page *new;
   358			unsigned long idx = 0;
   359	
   360			/* pgoff is invalid for ksm pages, but they are never large */
   361			if (folio_test_large(folio) && !folio_test_hugetlb(folio))
   362				idx = linear_page_index(vma, pvmw.address) - pvmw.pgoff;
   363			new = folio_page(folio, idx);
   364	
   365	#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
   366			/* PMD-mapped THP migration entry */
   367			if (!pvmw.pte) {
   368				VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
   369						!folio_test_pmd_mappable(folio), folio);
   370				remove_migration_pmd(&pvmw, new);
   371				continue;
   372			}
   373	#endif
   374			old_pte = ptep_get(pvmw.pte);
   375			if (rmap_walk_arg->map_unused_to_zeropage &&
   376			    try_to_map_unused_to_zeropage(&pvmw, folio, old_pte, idx))
   377				continue;
   378	
   379			folio_get(folio);
   380			pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
   381	
   382			entry = softleaf_from_pte(old_pte);
   383			if (!softleaf_is_migration_young(entry))
   384				pte = pte_mkold(pte);
   385			if (folio_test_dirty(folio) && softleaf_is_migration_dirty(entry))
   386				pte = pte_mkdirty(pte);
   387			if (pte_swp_soft_dirty(old_pte))
   388				pte = pte_mksoft_dirty(pte);
   389			else
   390				pte = pte_clear_soft_dirty(pte);
   391	
   392			if (softleaf_is_migration_write(entry))
   393				pte = pte_mkwrite(pte, vma);
   394			else if (pte_swp_uffd_wp(old_pte))
   395				pte = pte_mkuffd_wp(pte);
   396	
   397			/* See do_swap_page(): restore PAGE_NONE for RWP */
   398			if (pte_swp_uffd_wp(old_pte) && userfaultfd_rwp(vma))
 > 399				pte = pte_modify(pte, PAGE_NONE);
   400	
   401			if (folio_test_anon(folio) && !softleaf_is_migration_read(entry))
   402				rmap_flags |= RMAP_EXCLUSIVE;
   403	
   404			if (unlikely(is_device_private_page(new))) {
   405				if (pte_write(pte))
   406					entry = make_writable_device_private_entry(
   407								page_to_pfn(new));
   408				else
   409					entry = make_readable_device_private_entry(
   410								page_to_pfn(new));
   411				pte = softleaf_to_pte(entry);
   412				if (pte_swp_soft_dirty(old_pte))
   413					pte = pte_swp_mksoft_dirty(pte);
   414				if (pte_swp_uffd_wp(old_pte))
   415					pte = pte_swp_mkuffd_wp(pte);
   416			}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
