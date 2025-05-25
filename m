Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2053D156C6F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748196253; cv=none; b=WN/+wCUYTl7LfihKINwBDttMm6w9UYbjr6be4OJtLDXdTPB7JyqUWhjXyVLfYKerWdRElJGp8paf796rrzb8u/5gkSAI2yKGtWZyJYT15AwLL/6j2NL6D7vzJI7XrPnRs7K1ym2S4YNQChg/bls9QcVjx0tOoIisQNyWyYOMybQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748196253; c=relaxed/simple;
	bh=uxckPVzF/+odr7PwuFdtBPWRw9leNuC8kPGoY06ikFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoC0V3fov8uR47HSKfrR3YqVCvfCLfTYhIDYCH/zePUoWOByj2Q5YY23WDOjAbTNEeJYHCGLpw738iZt2b3RBtyW7VO72p/LhmNBh18K7NCQ+E0w+OAUDuSVsCzBj9FUY/BgVA5sLGo76zg6yE2mHmPeQlTF2ydurTtPojNPyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKM/5+tc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKM/5+tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748196251; x=1779732251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uxckPVzF/+odr7PwuFdtBPWRw9leNuC8kPGoY06ikFQ=;
  b=GKM/5+tcdHcK/eUuZ8rOCelXEUGRgUTleSauMBAIgrdDUM2JCvDxMLza
   5W995G0eAq6E3kbEzDH9XZ1ayBVdY+H1ONbyLsu49KqlVMdZThXkwwRb1
   aEVD9nN0ZwnPdYqXlF0x6NTVRi4rKksSs4KZ8ujhWMHqCVUq3COh26c3z
   VX8LEo7vo4JeM7oDcCE7Kd17+FeHvMmjzKeWbQHg6ptQJDumpcMnOAyB2
   /McSC9W+aWrz5PYSe83DsxNQCZaRvbyqmBSjOosY18sdfAG3GTGZ3lA1M
   Y+n6jpzU2/35Qi96k25vECdnGyttEgpz0EbiH7JU02sC/wqjz2MX/yPip
   A==;
X-CSE-ConnectionGUID: vm9mDVaRRJOhsPNsd8YxfQ==
X-CSE-MsgGUID: GulIpZqWReWQ93MRq8pT4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="60836804"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="60836804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 11:04:11 -0700
X-CSE-ConnectionGUID: BVBIXl2lQlSEMggZcFBisQ==
X-CSE-MsgGUID: Ky+wQ2ZYTb+qtvztlEf2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="172948891"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2025 11:04:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJFhf-000Rwq-0S;
	Sun, 25 May 2025 18:04:07 +0000
Date: Mon, 26 May 2025 02:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Message-ID: <202505260251.PcqnvPsb-lkp@intel.com>
References: <20250523191258.339826-7-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523191258.339826-7-ziy@nvidia.com>

Hi Zi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20250523]
[cannot apply to trace/for-next linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-page_alloc-pageblock-flags-functions-clean-up/20250524-031558
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250523191258.339826-7-ziy%40nvidia.com
patch subject: [PATCH v5 6/6] mm/page_isolation: remove migratetype parameter from more functions.
config: x86_64-randconfig-121-20250525 (https://download.01.org/0day-ci/archive/20250526/202505260251.PcqnvPsb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260251.PcqnvPsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260251.PcqnvPsb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:6800:62: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long nr_migrated @@     got restricted acr_flags_t [usertype] alloc_flags @@
   mm/page_alloc.c:6800:62: sparse:     expected unsigned long nr_migrated
   mm/page_alloc.c:6800:62: sparse:     got restricted acr_flags_t [usertype] alloc_flags
   mm/page_alloc.c:6803:50: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected restricted acr_flags_t [usertype] alloc_flags @@     got unsigned long [assigned] total_mapped @@
   mm/page_alloc.c:6803:50: sparse:     expected restricted acr_flags_t [usertype] alloc_flags
   mm/page_alloc.c:6803:50: sparse:     got unsigned long [assigned] total_mapped
   mm/page_alloc.c:6904:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted isolate_mode_t [usertype] mode @@     got int @@
   mm/page_alloc.c:6904:55: sparse:     expected restricted isolate_mode_t [usertype] mode
   mm/page_alloc.c:6904:55: sparse:     got int
>> mm/page_alloc.c:6932:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int enum pb_isolate_mode mode @@     got restricted isolate_mode_t [usertype] mode @@
   mm/page_alloc.c:6932:52: sparse:     expected unsigned int enum pb_isolate_mode mode
   mm/page_alloc.c:6932:52: sparse:     got restricted isolate_mode_t [usertype] mode
   mm/page_alloc.c:6982:51: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int enum pb_isolate_mode mode @@     got restricted isolate_mode_t [usertype] mode @@
   mm/page_alloc.c:6982:51: sparse:     expected unsigned int enum pb_isolate_mode mode
   mm/page_alloc.c:6982:51: sparse:     got restricted isolate_mode_t [usertype] mode
   mm/page_alloc.c:2952:9: sparse: sparse: context imbalance in '__free_frozen_pages' - different lock contexts for basic block
   mm/page_alloc.c:3008:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:3298:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:5123:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block

vim +6932 mm/page_alloc.c

  6720	
  6721	/*
  6722	 * [start, end) must belong to a single zone.
  6723	 * @alloc_flags: using acr_flags_t to filter the type of migration in
  6724	 *		trace_mm_alloc_contig_migrate_range_info.
  6725	 */
  6726	static int __alloc_contig_migrate_range(struct compact_control *cc,
  6727						unsigned long start, unsigned long end,
  6728						acr_flags_t alloc_flags)
  6729	{
  6730		/* This function is based on compact_zone() from compaction.c. */
  6731		unsigned int nr_reclaimed;
  6732		unsigned long pfn = start;
  6733		unsigned int tries = 0;
  6734		int ret = 0;
  6735		struct migration_target_control mtc = {
  6736			.nid = zone_to_nid(cc->zone),
  6737			.gfp_mask = cc->gfp_mask,
  6738			.reason = MR_CONTIG_RANGE,
  6739		};
  6740		struct page *page;
  6741		unsigned long total_mapped = 0;
  6742		unsigned long total_migrated = 0;
  6743		unsigned long total_reclaimed = 0;
  6744	
  6745		lru_cache_disable();
  6746	
  6747		while (pfn < end || !list_empty(&cc->migratepages)) {
  6748			if (fatal_signal_pending(current)) {
  6749				ret = -EINTR;
  6750				break;
  6751			}
  6752	
  6753			if (list_empty(&cc->migratepages)) {
  6754				cc->nr_migratepages = 0;
  6755				ret = isolate_migratepages_range(cc, pfn, end);
  6756				if (ret && ret != -EAGAIN)
  6757					break;
  6758				pfn = cc->migrate_pfn;
  6759				tries = 0;
  6760			} else if (++tries == 5) {
  6761				ret = -EBUSY;
  6762				break;
  6763			}
  6764	
  6765			nr_reclaimed = reclaim_clean_pages_from_list(cc->zone,
  6766								&cc->migratepages);
  6767			cc->nr_migratepages -= nr_reclaimed;
  6768	
  6769			if (trace_mm_alloc_contig_migrate_range_info_enabled()) {
  6770				total_reclaimed += nr_reclaimed;
  6771				list_for_each_entry(page, &cc->migratepages, lru) {
  6772					struct folio *folio = page_folio(page);
  6773	
  6774					total_mapped += folio_mapped(folio) *
  6775							folio_nr_pages(folio);
  6776				}
  6777			}
  6778	
  6779			ret = migrate_pages(&cc->migratepages, alloc_migration_target,
  6780				NULL, (unsigned long)&mtc, cc->mode, MR_CONTIG_RANGE, NULL);
  6781	
  6782			if (trace_mm_alloc_contig_migrate_range_info_enabled() && !ret)
  6783				total_migrated += cc->nr_migratepages;
  6784	
  6785			/*
  6786			 * On -ENOMEM, migrate_pages() bails out right away. It is pointless
  6787			 * to retry again over this error, so do the same here.
  6788			 */
  6789			if (ret == -ENOMEM)
  6790				break;
  6791		}
  6792	
  6793		lru_cache_enable();
  6794		if (ret < 0) {
  6795			if (!(cc->gfp_mask & __GFP_NOWARN) && ret == -EBUSY)
  6796				alloc_contig_dump_pages(&cc->migratepages);
  6797			putback_movable_pages(&cc->migratepages);
  6798		}
  6799	
> 6800		trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
  6801							 total_migrated,
  6802							 total_reclaimed,
  6803							 total_mapped);
  6804		return (ret < 0) ? ret : 0;
  6805	}
  6806	
  6807	static void split_free_pages(struct list_head *list, gfp_t gfp_mask)
  6808	{
  6809		int order;
  6810	
  6811		for (order = 0; order < NR_PAGE_ORDERS; order++) {
  6812			struct page *page, *next;
  6813			int nr_pages = 1 << order;
  6814	
  6815			list_for_each_entry_safe(page, next, &list[order], lru) {
  6816				int i;
  6817	
  6818				post_alloc_hook(page, order, gfp_mask);
  6819				set_page_refcounted(page);
  6820				if (!order)
  6821					continue;
  6822	
  6823				split_page(page, order);
  6824	
  6825				/* Add all subpages to the order-0 head, in sequence. */
  6826				list_del(&page->lru);
  6827				for (i = 0; i < nr_pages; i++)
  6828					list_add_tail(&page[i].lru, &list[0]);
  6829			}
  6830		}
  6831	}
  6832	
  6833	static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  6834	{
  6835		const gfp_t reclaim_mask = __GFP_IO | __GFP_FS | __GFP_RECLAIM;
  6836		const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN |
  6837					  __GFP_ZERO | __GFP_ZEROTAGS | __GFP_SKIP_ZERO;
  6838		const gfp_t cc_action_mask = __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
  6839	
  6840		/*
  6841		 * We are given the range to allocate; node, mobility and placement
  6842		 * hints are irrelevant at this point. We'll simply ignore them.
  6843		 */
  6844		gfp_mask &= ~(GFP_ZONEMASK | __GFP_RECLAIMABLE | __GFP_WRITE |
  6845			      __GFP_HARDWALL | __GFP_THISNODE | __GFP_MOVABLE);
  6846	
  6847		/*
  6848		 * We only support most reclaim flags (but not NOFAIL/NORETRY), and
  6849		 * selected action flags.
  6850		 */
  6851		if (gfp_mask & ~(reclaim_mask | action_mask))
  6852			return -EINVAL;
  6853	
  6854		/*
  6855		 * Flags to control page compaction/migration/reclaim, to free up our
  6856		 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
  6857		 * for them.
  6858		 *
  6859		 * Traditionally we always had __GFP_RETRY_MAYFAIL set, keep doing that
  6860		 * to not degrade callers.
  6861		 */
  6862		*gfp_cc_mask = (gfp_mask & (reclaim_mask | cc_action_mask)) |
  6863				__GFP_MOVABLE | __GFP_RETRY_MAYFAIL;
  6864		return 0;
  6865	}
  6866	
  6867	/**
  6868	 * alloc_contig_range() -- tries to allocate given range of pages
  6869	 * @start:	start PFN to allocate
  6870	 * @end:	one-past-the-last PFN to allocate
  6871	 * @alloc_flags:	allocation information
  6872	 * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  6873	 *		action and reclaim modifiers are supported. Reclaim modifiers
  6874	 *		control allocation behavior during compaction/migration/reclaim.
  6875	 *
  6876	 * The PFN range does not have to be pageblock aligned. The PFN range must
  6877	 * belong to a single zone.
  6878	 *
  6879	 * The first thing this routine does is attempt to MIGRATE_ISOLATE all
  6880	 * pageblocks in the range.  Once isolated, the pageblocks should not
  6881	 * be modified by others.
  6882	 *
  6883	 * Return: zero on success or negative error code.  On success all
  6884	 * pages which PFN is in [start, end) are allocated for the caller and
  6885	 * need to be freed with free_contig_range().
  6886	 */
  6887	int alloc_contig_range_noprof(unsigned long start, unsigned long end,
  6888				acr_flags_t alloc_flags, gfp_t gfp_mask)
  6889	{
  6890		unsigned long outer_start, outer_end;
  6891		int ret = 0;
  6892	
  6893		struct compact_control cc = {
  6894			.nr_migratepages = 0,
  6895			.order = -1,
  6896			.zone = page_zone(pfn_to_page(start)),
  6897			.mode = MIGRATE_SYNC,
  6898			.ignore_skip_hint = true,
  6899			.no_set_skip_hint = true,
  6900			.alloc_contig = true,
  6901		};
  6902		INIT_LIST_HEAD(&cc.migratepages);
  6903		bool is_range_aligned;
  6904		isolate_mode_t mode = (alloc_flags & ACR_CMA) ? CMA_ALLOCATION :
  6905								ISOLATE_MODE_OTHERS;
  6906	
  6907		gfp_mask = current_gfp_context(gfp_mask);
  6908		if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
  6909			return -EINVAL;
  6910	
  6911		/*
  6912		 * What we do here is we mark all pageblocks in range as
  6913		 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
  6914		 * have different sizes, and due to the way page allocator
  6915		 * work, start_isolate_page_range() has special handlings for this.
  6916		 *
  6917		 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
  6918		 * migrate the pages from an unaligned range (ie. pages that
  6919		 * we are interested in). This will put all the pages in
  6920		 * range back to page allocator as MIGRATE_ISOLATE.
  6921		 *
  6922		 * When this is done, we take the pages in range from page
  6923		 * allocator removing them from the buddy system.  This way
  6924		 * page allocator will never consider using them.
  6925		 *
  6926		 * This lets us mark the pageblocks back as
  6927		 * MIGRATE_CMA/MIGRATE_MOVABLE so that free pages in the
  6928		 * aligned range but not in the unaligned, original range are
  6929		 * put back to page allocator so that buddy can use them.
  6930		 */
  6931	
> 6932		ret = start_isolate_page_range(start, end, mode);
  6933		if (ret)
  6934			goto done;
  6935	
  6936		drain_all_pages(cc.zone);
  6937	
  6938		/*
  6939		 * In case of -EBUSY, we'd like to know which page causes problem.
  6940		 * So, just fall through. test_pages_isolated() has a tracepoint
  6941		 * which will report the busy page.
  6942		 *
  6943		 * It is possible that busy pages could become available before
  6944		 * the call to test_pages_isolated, and the range will actually be
  6945		 * allocated.  So, if we fall through be sure to clear ret so that
  6946		 * -EBUSY is not accidentally used or returned to caller.
  6947		 */
  6948		ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
  6949		if (ret && ret != -EBUSY)
  6950			goto done;
  6951	
  6952		/*
  6953		 * When in-use hugetlb pages are migrated, they may simply be released
  6954		 * back into the free hugepage pool instead of being returned to the
  6955		 * buddy system.  After the migration of in-use huge pages is completed,
  6956		 * we will invoke replace_free_hugepage_folios() to ensure that these
  6957		 * hugepages are properly released to the buddy system.
  6958		 */
  6959		ret = replace_free_hugepage_folios(start, end);
  6960		if (ret)
  6961			goto done;
  6962	
  6963		/*
  6964		 * Pages from [start, end) are within a pageblock_nr_pages
  6965		 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
  6966		 * more, all pages in [start, end) are free in page allocator.
  6967		 * What we are going to do is to allocate all pages from
  6968		 * [start, end) (that is remove them from page allocator).
  6969		 *
  6970		 * The only problem is that pages at the beginning and at the
  6971		 * end of interesting range may be not aligned with pages that
  6972		 * page allocator holds, ie. they can be part of higher order
  6973		 * pages.  Because of this, we reserve the bigger range and
  6974		 * once this is done free the pages we are not interested in.
  6975		 *
  6976		 * We don't have to hold zone->lock here because the pages are
  6977		 * isolated thus they won't get removed from buddy.
  6978		 */
  6979		outer_start = find_large_buddy(start);
  6980	
  6981		/* Make sure the range is really isolated. */
  6982		if (test_pages_isolated(outer_start, end, mode)) {
  6983			ret = -EBUSY;
  6984			goto done;
  6985		}
  6986	
  6987		/* Grab isolated pages from freelists. */
  6988		outer_end = isolate_freepages_range(&cc, outer_start, end);
  6989		if (!outer_end) {
  6990			ret = -EBUSY;
  6991			goto done;
  6992		}
  6993	
  6994		/*
  6995		 * With __GFP_COMP and the requested order < MAX_PAGE_ORDER,
  6996		 * isolated free pages can have higher order than the requested
  6997		 * one. Use split_free_pages() to free out of range pages.
  6998		 */
  6999		is_range_aligned = is_power_of_2(end - start);
  7000		if (!(gfp_mask & __GFP_COMP) ||
  7001			(is_range_aligned && ilog2(end - start) < MAX_PAGE_ORDER)) {
  7002			split_free_pages(cc.freepages, gfp_mask);
  7003	
  7004			/* Free head and tail (if any) */
  7005			if (start != outer_start)
  7006				free_contig_range(outer_start, start - outer_start);
  7007			if (end != outer_end)
  7008				free_contig_range(end, outer_end - end);
  7009	
  7010			outer_start = start;
  7011			outer_end = end;
  7012	
  7013			if (!(gfp_mask & __GFP_COMP))
  7014				goto done;
  7015		}
  7016	
  7017		if (start == outer_start && end == outer_end && is_range_aligned) {
  7018			struct page *head = pfn_to_page(start);
  7019			int order = ilog2(end - start);
  7020	
  7021			check_new_pages(head, order);
  7022			prep_new_page(head, order, gfp_mask, 0);
  7023			set_page_refcounted(head);
  7024		} else {
  7025			ret = -EINVAL;
  7026			WARN(true, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
  7027			     start, end, outer_start, outer_end);
  7028		}
  7029	done:
  7030		undo_isolate_page_range(start, end);
  7031		return ret;
  7032	}
  7033	EXPORT_SYMBOL(alloc_contig_range_noprof);
  7034	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
