Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E32AE90
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754713795; cv=none; b=FPbubJHACuV1D1syv0au5H6Wx7yUi2NAqyXR1rYIZZqpH8BVApkZpMbKV8hSCGhqcn66pfreb2OXP4WNB4Zwz82J28XqyO7A3IMi7nUgPTzLNqNyVgRPzSsQsMOSy8y3sE7NXqSTD4nd0s/VpwQf8tHHOAGrXMmuch3EAl0UXAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754713795; c=relaxed/simple;
	bh=JoLkUVDd1eialCfDLOn2nAYdUo7O9DBb1/tnzrJD29g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hs1UI6Ee1IxDHryB8GRWZu2UMxkZK01SYFiFiLxRyDMN1gR33X2qiyV9B8nvGDEEGO/sHzdfAKu4JIgMkMXCZmTKDmlUD68pHtI19I9exg1Z9EvC5jm/E1E5Kldr5bJzCCbD3cnKUYrFqkWSMQnyLT+gmQOxecmdkdGj2L0FWo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYcHtqhR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYcHtqhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754713794; x=1786249794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoLkUVDd1eialCfDLOn2nAYdUo7O9DBb1/tnzrJD29g=;
  b=TYcHtqhRfA9oowjMd0no01RyvQBIzolfcszcGAKEzBBzNu7jKZlEdBZi
   MvcC6GnkWpD24M4IUdqw9XSH2lXwEjPswwO9Y9FgCRc013kHYjZE1uoKb
   HIY/IMX/neHlmJzBnPiLQSyPNoMJYDNdcGsJcXfJzip9xhQ1wpJM0q4Au
   hv6e8wKwntWBiSUGukb7mHSxAfWjCl8tt9YFWXLTUMM4gVCTn1hqmMoY1
   S4yK3On7o/3UFMIwfGvSlz1ynycvuKD5QykfhBu30KoGqnCCgNpxZM1ba
   GhjH1Fop4fLXe7U0gyzi4/s56iNezI1EVQXbqlyoCP93gnhtXggw2/iIo
   Q==;
X-CSE-ConnectionGUID: bhQAReK1RXqGfQVjW6OVmw==
X-CSE-MsgGUID: RTr1lgpYQPGDaVX+ZWrT5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="74636996"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="74636996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 21:29:53 -0700
X-CSE-ConnectionGUID: 5m2gJewnTwO4TyvTVL3AIg==
X-CSE-MsgGUID: lhW4hchfRNy2RC4mfgb4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169590181"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Aug 2025 21:29:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukbDK-0004VQ-07;
	Sat, 09 Aug 2025 04:29:50 +0000
Date: Sat, 9 Aug 2025 12:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 3/13] mm/page_alloc.c:6857:53: error:
 'order' undeclared
Message-ID: <202508091241.dCYwg1I7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   0058c4860f2af0228513afaef99b542e793cb94b
commit: 54bfa64ac63ffcc0ddc2d555b6e8e3d5746a9971 [3/13] mm/page_alloc: reject unreasonable folio (compound page) size in alloc_contig_range_noprof()
config: x86_64-randconfig-001-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091241.dCYwg1I7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091241.dCYwg1I7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091241.dCYwg1I7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/page_alloc.c:19:
   mm/page_alloc.c: In function 'alloc_contig_range_noprof':
>> mm/page_alloc.c:6857:53: error: 'order' undeclared (first use in this function)
    6857 |         if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_NR_PAGES))
         |                                                     ^~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/page_alloc.c:6857:53: note: each undeclared identifier is reported only once for each function it appears in
    6857 |         if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_NR_PAGES))
         |                                                     ^~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +/order +6857 mm/page_alloc.c

  6816	
  6817	/**
  6818	 * alloc_contig_range() -- tries to allocate given range of pages
  6819	 * @start:	start PFN to allocate
  6820	 * @end:	one-past-the-last PFN to allocate
  6821	 * @alloc_flags:	allocation information
  6822	 * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  6823	 *		action and reclaim modifiers are supported. Reclaim modifiers
  6824	 *		control allocation behavior during compaction/migration/reclaim.
  6825	 *
  6826	 * The PFN range does not have to be pageblock aligned. The PFN range must
  6827	 * belong to a single zone.
  6828	 *
  6829	 * The first thing this routine does is attempt to MIGRATE_ISOLATE all
  6830	 * pageblocks in the range.  Once isolated, the pageblocks should not
  6831	 * be modified by others.
  6832	 *
  6833	 * Return: zero on success or negative error code.  On success all
  6834	 * pages which PFN is in [start, end) are allocated for the caller and
  6835	 * need to be freed with free_contig_range().
  6836	 */
  6837	int alloc_contig_range_noprof(unsigned long start, unsigned long end,
  6838				      acr_flags_t alloc_flags, gfp_t gfp_mask)
  6839	{
  6840		unsigned long outer_start, outer_end;
  6841		int ret = 0;
  6842	
  6843		struct compact_control cc = {
  6844			.nr_migratepages = 0,
  6845			.order = -1,
  6846			.zone = page_zone(pfn_to_page(start)),
  6847			.mode = MIGRATE_SYNC,
  6848			.ignore_skip_hint = true,
  6849			.no_set_skip_hint = true,
  6850			.alloc_contig = true,
  6851		};
  6852		INIT_LIST_HEAD(&cc.migratepages);
  6853		enum pb_isolate_mode mode = (alloc_flags & ACR_FLAGS_CMA) ?
  6854						    PB_ISOLATE_MODE_CMA_ALLOC :
  6855						    PB_ISOLATE_MODE_OTHER;
  6856	
> 6857		if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_NR_PAGES))
  6858			return -EINVAL;
  6859	
  6860		gfp_mask = current_gfp_context(gfp_mask);
  6861		if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
  6862			return -EINVAL;
  6863	
  6864		/*
  6865		 * What we do here is we mark all pageblocks in range as
  6866		 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
  6867		 * have different sizes, and due to the way page allocator
  6868		 * work, start_isolate_page_range() has special handlings for this.
  6869		 *
  6870		 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
  6871		 * migrate the pages from an unaligned range (ie. pages that
  6872		 * we are interested in). This will put all the pages in
  6873		 * range back to page allocator as MIGRATE_ISOLATE.
  6874		 *
  6875		 * When this is done, we take the pages in range from page
  6876		 * allocator removing them from the buddy system.  This way
  6877		 * page allocator will never consider using them.
  6878		 *
  6879		 * This lets us mark the pageblocks back as
  6880		 * MIGRATE_CMA/MIGRATE_MOVABLE so that free pages in the
  6881		 * aligned range but not in the unaligned, original range are
  6882		 * put back to page allocator so that buddy can use them.
  6883		 */
  6884	
  6885		ret = start_isolate_page_range(start, end, mode);
  6886		if (ret)
  6887			goto done;
  6888	
  6889		drain_all_pages(cc.zone);
  6890	
  6891		/*
  6892		 * In case of -EBUSY, we'd like to know which page causes problem.
  6893		 * So, just fall through. test_pages_isolated() has a tracepoint
  6894		 * which will report the busy page.
  6895		 *
  6896		 * It is possible that busy pages could become available before
  6897		 * the call to test_pages_isolated, and the range will actually be
  6898		 * allocated.  So, if we fall through be sure to clear ret so that
  6899		 * -EBUSY is not accidentally used or returned to caller.
  6900		 */
  6901		ret = __alloc_contig_migrate_range(&cc, start, end);
  6902		if (ret && ret != -EBUSY)
  6903			goto done;
  6904	
  6905		/*
  6906		 * When in-use hugetlb pages are migrated, they may simply be released
  6907		 * back into the free hugepage pool instead of being returned to the
  6908		 * buddy system.  After the migration of in-use huge pages is completed,
  6909		 * we will invoke replace_free_hugepage_folios() to ensure that these
  6910		 * hugepages are properly released to the buddy system.
  6911		 */
  6912		ret = replace_free_hugepage_folios(start, end);
  6913		if (ret)
  6914			goto done;
  6915	
  6916		/*
  6917		 * Pages from [start, end) are within a pageblock_nr_pages
  6918		 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
  6919		 * more, all pages in [start, end) are free in page allocator.
  6920		 * What we are going to do is to allocate all pages from
  6921		 * [start, end) (that is remove them from page allocator).
  6922		 *
  6923		 * The only problem is that pages at the beginning and at the
  6924		 * end of interesting range may be not aligned with pages that
  6925		 * page allocator holds, ie. they can be part of higher order
  6926		 * pages.  Because of this, we reserve the bigger range and
  6927		 * once this is done free the pages we are not interested in.
  6928		 *
  6929		 * We don't have to hold zone->lock here because the pages are
  6930		 * isolated thus they won't get removed from buddy.
  6931		 */
  6932		outer_start = find_large_buddy(start);
  6933	
  6934		/* Make sure the range is really isolated. */
  6935		if (test_pages_isolated(outer_start, end, mode)) {
  6936			ret = -EBUSY;
  6937			goto done;
  6938		}
  6939	
  6940		/* Grab isolated pages from freelists. */
  6941		outer_end = isolate_freepages_range(&cc, outer_start, end);
  6942		if (!outer_end) {
  6943			ret = -EBUSY;
  6944			goto done;
  6945		}
  6946	
  6947		if (!(gfp_mask & __GFP_COMP)) {
  6948			split_free_pages(cc.freepages, gfp_mask);
  6949	
  6950			/* Free head and tail (if any) */
  6951			if (start != outer_start)
  6952				free_contig_range(outer_start, start - outer_start);
  6953			if (end != outer_end)
  6954				free_contig_range(end, outer_end - end);
  6955		} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
  6956			struct page *head = pfn_to_page(start);
  6957			int order = ilog2(end - start);
  6958	
  6959			check_new_pages(head, order);
  6960			prep_new_page(head, order, gfp_mask, 0);
  6961			set_page_refcounted(head);
  6962		} else {
  6963			ret = -EINVAL;
  6964			WARN(true, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
  6965			     start, end, outer_start, outer_end);
  6966		}
  6967	done:
  6968		undo_isolate_page_range(start, end);
  6969		return ret;
  6970	}
  6971	EXPORT_SYMBOL(alloc_contig_range_noprof);
  6972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
