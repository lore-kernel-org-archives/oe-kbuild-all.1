Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76C243962
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739048105; cv=none; b=W+jUqvGZwM2t3oeK9kTZ7rRQ6YMA2NusGmH08lsuncTa4oGWUUX1s6Tx3vZOJoDUP1RSgERTasPYeOZkgrgS03jNLxzmD/MNyOOCEXiHP63wWtJSJR0mwbm838tjkKs1CyE1So5HHPzloy4cLANd+oku1QFVKE5GVLaGXTrMkPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739048105; c=relaxed/simple;
	bh=cEHu9dPAQxrZL7ar3Gvj/ZDcrSRViEU67fjtwe1gbtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvIVInAXgawdOmCZZBnKpFErdN4oV4F5o3wteNBHLv9KVFf2Ev4PX0lkLRQpPokt8VeraDqwF8NUFaffvKigpIDgWFff4R9PsctqUVMDOVdRSk4o2M1tj/vX3QcvB3bWZvzyuIWdqCaSOM8SlBv5xFtHWm7wraHt1/O7uURyMWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uew1o6Hq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uew1o6Hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739048103; x=1770584103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEHu9dPAQxrZL7ar3Gvj/ZDcrSRViEU67fjtwe1gbtM=;
  b=Uew1o6HqCHU/hSKG/KFbCDWvA0iZRzScoKe1ONVhPTRT8j1cWwwVs7/x
   1M/lYzB6Z3c/Y2ghBrop0ehg2g8BRS0mMZL/RkEe1Zu6yifTFh8TD5Utk
   ePstqDh8ZKJ+HpbyLJTUmaKepPUShpbFwXh8Kkxa++JZR5P2MP6pc17JK
   mnZaABRsDIYt7t2GjC4ppZNgPt9WqOPCHkQiansnwID8zv6PLvtOVV+5Y
   fA099czGy1Hy2wdSqvkqrb6sACxwq0WABR6CSqNMdzjgRVHbJlAGI/6Q/
   zkc8EOzxb0FApW389OY+3Nj3Vvak2b4T/wn9xL9RBOjwvZMut4qrCFDTE
   w==;
X-CSE-ConnectionGUID: 04TxNqbERqibTaI4gvDojQ==
X-CSE-MsgGUID: m38sGlV8RiKsPpdgnOER3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50295674"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="50295674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 12:55:02 -0800
X-CSE-ConnectionGUID: 6V5RuHB8S02ew9hXSDad2w==
X-CSE-MsgGUID: f1TIIJCBRjeuIBiwwFXyWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116432173"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 12:55:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgrqs-0010d7-2n;
	Sat, 08 Feb 2025 20:54:58 +0000
Date: Sun, 9 Feb 2025 04:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 17/22] mm/rmap.c:2461:9: error:
 'ret' undeclared; did you mean 'net'?
Message-ID: <202502090401.fJTxeZim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   ddc42f5fd72394838fc2d280ff2486ccb7178b9a
commit: 9c7678e94573361a0a89e3e79bf8311006d6b55d [17/22] mm/rmap: avoid -EBUSY from make_device_exclusive()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250209/202502090401.fJTxeZim-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090401.fJTxeZim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090401.fJTxeZim-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function 'make_device_exclusive':
>> mm/rmap.c:2461:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    2461 |         ret = folio_lock_killable(folio);
         |         ^~~
         |         net
   mm/rmap.c:2461:9: note: each undeclared identifier is reported only once for each function it appears in


vim +2461 mm/rmap.c

  2385	
  2386	#ifdef CONFIG_DEVICE_PRIVATE
  2387	/**
  2388	 * make_device_exclusive() - Mark a page for exclusive use by a device
  2389	 * @mm: mm_struct of associated target process
  2390	 * @addr: the virtual address to mark for exclusive device access
  2391	 * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
  2392	 * @foliop: folio pointer will be stored here on success.
  2393	 *
  2394	 * This function looks up the page mapped at the given address, grabs a
  2395	 * folio reference, locks the folio and replaces the PTE with special
  2396	 * device-exclusive PFN swap entry, preventing access through the process
  2397	 * page tables. The function will return with the folio locked and referenced.
  2398	 *
  2399	 * On fault, the device-exclusive entries are replaced with the original PTE
  2400	 * under folio lock, after calling MMU notifiers.
  2401	 *
  2402	 * Only anonymous non-hugetlb folios are supported and the VMA must have
  2403	 * write permissions such that we can fault in the anonymous page writable
  2404	 * in order to mark it exclusive. The caller must hold the mmap_lock in read
  2405	 * mode.
  2406	 *
  2407	 * A driver using this to program access from a device must use a mmu notifier
  2408	 * critical section to hold a device specific lock during programming. Once
  2409	 * programming is complete it should drop the folio lock and reference after
  2410	 * which point CPU access to the page will revoke the exclusive access.
  2411	 *
  2412	 * Notes:
  2413	 *   #. This function always operates on individual PTEs mapping individual
  2414	 *      pages. PMD-sized THPs are first remapped to be mapped by PTEs before
  2415	 *      the conversion happens on a single PTE corresponding to @addr.
  2416	 *   #. While concurrent access through the process page tables is prevented,
  2417	 *      concurrent access through other page references (e.g., earlier GUP
  2418	 *      invocation) is not handled and not supported.
  2419	 *   #. device-exclusive entries are considered "clean" and "old" by core-mm.
  2420	 *      Device drivers must update the folio state when informed by MMU
  2421	 *      notifiers.
  2422	 *
  2423	 * Returns: pointer to mapped page on success, otherwise a negative error.
  2424	 */
  2425	struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
  2426			void *owner, struct folio **foliop)
  2427	{
  2428		struct mmu_notifier_range range;
  2429		struct folio *folio, *fw_folio;
  2430		struct vm_area_struct *vma;
  2431		struct folio_walk fw;
  2432		struct page *page;
  2433		swp_entry_t entry;
  2434		pte_t swp_pte;
  2435	
  2436		mmap_assert_locked(mm);
  2437		addr = PAGE_ALIGN_DOWN(addr);
  2438	
  2439		/*
  2440		 * Fault in the page writable and try to lock it; note that if the
  2441		 * address would already be marked for exclusive use by a device,
  2442		 * the GUP call would undo that first by triggering a fault.
  2443		 *
  2444		 * If any other device would already map this page exclusively, the
  2445		 * fault will trigger a conversion to an ordinary
  2446		 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
  2447		 */
  2448	retry:
  2449		page = get_user_page_vma_remote(mm, addr,
  2450						FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
  2451						&vma);
  2452		if (IS_ERR(page))
  2453			return page;
  2454		folio = page_folio(page);
  2455	
  2456		if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
  2457			folio_put(folio);
  2458			return ERR_PTR(-EOPNOTSUPP);
  2459		}
  2460	
> 2461		ret = folio_lock_killable(folio);
  2462		if (ret) {
  2463			folio_put(folio);
  2464			return ERR_PTR(ret);
  2465		}
  2466	
  2467		/*
  2468		 * Inform secondary MMUs that we are going to convert this PTE to
  2469		 * device-exclusive, such that they unmap it now. Note that the
  2470		 * caller must filter this event out to prevent livelocks.
  2471		 */
  2472		mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0,
  2473					      mm, addr, addr + PAGE_SIZE, owner);
  2474		mmu_notifier_invalidate_range_start(&range);
  2475	
  2476		/*
  2477		 * Let's do a second walk and make sure we still find the same page
  2478		 * mapped writable. Note that a page of an anonymous folio can
  2479		 * only be mapped writable using exactly one page table mapping
  2480		 * ("exclusive"), so there cannot be other mappings.
  2481		 */
  2482		fw_folio = folio_walk_start(&fw, vma, addr, 0);
  2483		if (fw_folio != folio || fw.page != page ||
  2484		    fw.level != FW_LEVEL_PTE || !pte_write(fw.pte)) {
  2485			if (fw_folio)
  2486				folio_walk_end(&fw, vma);
  2487			mmu_notifier_invalidate_range_end(&range);
  2488			folio_unlock(folio);
  2489			folio_put(folio);
  2490			goto retry;
  2491		}
  2492	
  2493		/* Nuke the page table entry so we get the uptodate dirty bit. */
  2494		flush_cache_page(vma, addr, page_to_pfn(page));
  2495		fw.pte = ptep_clear_flush(vma, addr, fw.ptep);
  2496	
  2497		/* Set the dirty flag on the folio now the PTE is gone. */
  2498		if (pte_dirty(fw.pte))
  2499			folio_mark_dirty(folio);
  2500	
  2501		/*
  2502		 * Store the pfn of the page in a special device-exclusive PFN swap PTE.
  2503		 * do_swap_page() will trigger the conversion back while holding the
  2504		 * folio lock.
  2505		 */
  2506		entry = make_device_exclusive_entry(page_to_pfn(page));
  2507		swp_pte = swp_entry_to_pte(entry);
  2508		if (pte_soft_dirty(fw.pte))
  2509			swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2510		/* The pte is writable, uffd-wp does not apply. */
  2511		set_pte_at(mm, addr, fw.ptep, swp_pte);
  2512	
  2513		folio_walk_end(&fw, vma);
  2514		mmu_notifier_invalidate_range_end(&range);
  2515		*foliop = folio;
  2516		return page;
  2517	}
  2518	EXPORT_SYMBOL_GPL(make_device_exclusive);
  2519	#endif
  2520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
