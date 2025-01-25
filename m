Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F019E997
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737792094; cv=none; b=Pm6tXYFUMsa43pUYCenkGjLl7+AzSEWAytnlL4mtxfM84rMEMvpYNJhDcXgwXop+LOfLQqqzAvGHQEyEtD/z271zIamfpIcOeWeZJN8W8p6YHHWNAGyOD5Vl3+2ThNCQDLCEylMkuGRYI/R8EDjNJNjVsVCv/l7gN3q7S5e7kQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737792094; c=relaxed/simple;
	bh=xqXWpunpaZE3AOPRn8LiZME23XC67NIqSqUse7eKOJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhK7iW4wSQHogmOlemS/3ezNW9YYNv01gTUaCzq4QUfeh3GZR9Hpy60EKGkEOFbjKhaTJwLjbUcgkeIaCi5x7pdUYvuZYTHAeawGul8pecNnwKnw9LB/h9Tk4LfJdSki6oBckgnD9+bpwEHdW9JJDBPvc+F4+h1TEv/CXl0nbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjkX1EXK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjkX1EXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737792093; x=1769328093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xqXWpunpaZE3AOPRn8LiZME23XC67NIqSqUse7eKOJ0=;
  b=UjkX1EXKM0NkIR547sPYiQjgnaAH6O0VHeg+NU5KqO/wogQptYdBh9MN
   F77R0XsnL7rj1XVmeLmgVly3VkD5hDXP1yPjuykTycSOaR3t0bDhu41Sv
   fpCD6B+2ccukQko3SJySUnanwkGC2kK5O5oGmonvsFkVxy5CFuz9HU/dP
   eR0rmR3Rn86SZNamxZq6Xq1Ue8rx9hSuC/M3UfV8fWzW14Q4HKq1xZk+S
   PPXjqi5U2V2AaTvn+G/NAeEbcHWwesgvDTJFew1b/esyqgnQwPwv5H5Jf
   H/ZUNQW/zutZx40XUpEzE9kMkj7HOtD+msrrlauIbf8eVY56eCCTcFzcG
   A==;
X-CSE-ConnectionGUID: qLSXuoJMSMWpjEpHUtrNhg==
X-CSE-MsgGUID: iRqfJpSdSZ+enK8e8Kvwzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38026675"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="38026675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 00:01:33 -0800
X-CSE-ConnectionGUID: s34UFXpNSr6MJbSNLgUN1w==
X-CSE-MsgGUID: yKrnVaOoS/quu9rSBsx5PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112594224"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2025 00:01:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbb6f-000dct-0B;
	Sat, 25 Jan 2025 08:01:29 +0000
Date: Sat, 25 Jan 2025 16:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 12/12] mm/migrate.c:294:33: error:
 implicit declaration of function 'make_device_private_entry'; did you mean
 'is_device_private_entry'?
Message-ID: <202501251551.At4FVF82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   1693aa537b530ade1b82a54169a772386b4b7af7
commit: 1693aa537b530ade1b82a54169a772386b4b7af7 [12/12] mm: combine readable and writable device exclusive entries into SWP_DEVICE_EXCLUSIVE
config: arc-randconfig-001-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251551.At4FVF82-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251551.At4FVF82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251551.At4FVF82-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate.c: In function 'remove_migration_pte':
>> mm/migrate.c:294:33: error: implicit declaration of function 'make_device_private_entry'; did you mean 'is_device_private_entry'? [-Werror=implicit-function-declaration]
     294 |                         entry = make_device_private_entry(page_to_pfn(new));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 is_device_private_entry
>> mm/migrate.c:294:33: error: incompatible types when assigning to type 'swp_entry_t' from type 'int'
   cc1: some warnings being treated as errors


vim +294 mm/migrate.c

   235	
   236	/*
   237	 * Restore a potential migration pte to a working pte entry
   238	 */
   239	static bool remove_migration_pte(struct folio *folio,
   240			struct vm_area_struct *vma, unsigned long addr, void *arg)
   241	{
   242		struct rmap_walk_arg *rmap_walk_arg = arg;
   243		DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
   244	
   245		while (page_vma_mapped_walk(&pvmw)) {
   246			rmap_t rmap_flags = RMAP_NONE;
   247			pte_t old_pte;
   248			pte_t pte;
   249			swp_entry_t entry;
   250			struct page *new;
   251			unsigned long idx = 0;
   252	
   253			/* pgoff is invalid for ksm pages, but they are never large */
   254			if (folio_test_large(folio) && !folio_test_hugetlb(folio))
   255				idx = linear_page_index(vma, pvmw.address) - pvmw.pgoff;
   256			new = folio_page(folio, idx);
   257	
   258	#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
   259			/* PMD-mapped THP migration entry */
   260			if (!pvmw.pte) {
   261				VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
   262						!folio_test_pmd_mappable(folio), folio);
   263				remove_migration_pmd(&pvmw, new);
   264				continue;
   265			}
   266	#endif
   267			if (rmap_walk_arg->map_unused_to_zeropage &&
   268			    try_to_map_unused_to_zeropage(&pvmw, folio, idx))
   269				continue;
   270	
   271			folio_get(folio);
   272			pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
   273			old_pte = ptep_get(pvmw.pte);
   274	
   275			entry = pte_to_swp_entry(old_pte);
   276			if (!is_migration_entry_young(entry))
   277				pte = pte_mkold(pte);
   278			if (folio_test_dirty(folio) && is_migration_entry_dirty(entry))
   279				pte = pte_mkdirty(pte);
   280			if (pte_swp_soft_dirty(old_pte))
   281				pte = pte_mksoft_dirty(pte);
   282			else
   283				pte = pte_clear_soft_dirty(pte);
   284	
   285			if (is_writable_migration_entry(entry))
   286				pte = pte_mkwrite(pte, vma);
   287			else if (pte_swp_uffd_wp(old_pte))
   288				pte = pte_mkuffd_wp(pte);
   289	
   290			if (folio_test_anon(folio) && !is_readable_migration_entry(entry))
   291				rmap_flags |= RMAP_EXCLUSIVE;
   292	
   293			if (unlikely(is_device_private_page(new))) {
 > 294				entry = make_device_private_entry(page_to_pfn(new));
   295				pte = swp_entry_to_pte(entry);
   296				if (pte_swp_soft_dirty(old_pte))
   297					pte = pte_swp_mksoft_dirty(pte);
   298				if (pte_swp_uffd_wp(old_pte))
   299					pte = pte_swp_mkuffd_wp(pte);
   300			}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
