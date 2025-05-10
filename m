Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006EA27702
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746881178; cv=none; b=rCVnRNPkx90YWXoIi7ub1+cJYEdd3/3vWvhFC9cjhILPBIXB2SBnKrwniHH/tr4eL4ghXOq2JQei5+fvaxr5YNJItIOdSH2fon4xGcMYNf/XG9zUFshdLFWeXTxi6Cp63PuN1y23iXMc1jGU199d7wfScFlPa+3oMnWqdadZPS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746881178; c=relaxed/simple;
	bh=2lQv7fUr7PCSnDLTJvYoWjZMi9DuQ/XDWfQy+6/FSAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg9sk63gS8K5RqCZZkR5LeSj1wPG1q46xISGFEKhhXfKe7H0fg5OnJ9iXZuKSl+aT7FpDAkslmodm7Gncbh0D8lSzt31hZ8uO0bAzuN0wTs69qaA+mbCH6BwOQIJ4eNNYZZ5ojORT71ww/SgbcB+p8+0JQM414begUEUXZGzf1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWH4E5eQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWH4E5eQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746881176; x=1778417176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2lQv7fUr7PCSnDLTJvYoWjZMi9DuQ/XDWfQy+6/FSAk=;
  b=mWH4E5eQIVjDiXRXYuPHTrWMOEKDfboj9mZkTX0awOIsYLE6bX9CbWug
   WN5I4q7RGWUF80AHd6RcSc7IXcyNjCmEZcuRO0nC5gtfhXAEg/skElzQY
   NP9FxbZxlNQJGVVSjC9z3dx1JpXGSP9cBUAfVe9O25fSeVDVyaYN0VZcn
   xcc66EqZlNkCb2L82ZM24cHEIZ1LB7Dfy21rrEmUs7E7RZ+d+abTHVIlW
   RjAxESCs4F5lllc41ekXeE9XNiHmzhsSyu34Nk9Vu1Qi8ioPVw+aJ870d
   MCxBljF4peYzH6IXJt0ovwsFOk3NvS6ZXet1eO0tJshFXcWvebCUi5AW2
   w==;
X-CSE-ConnectionGUID: qr2NO4pyTQSsSL55TxN8CQ==
X-CSE-MsgGUID: dqfNeSQISyi6Z7DDrbDt3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48576401"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48576401"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 05:46:15 -0700
X-CSE-ConnectionGUID: rc/NufyRSVaYsKBK20zsBw==
X-CSE-MsgGUID: 30qVebdkS6Wq5uhzNmr9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="137857742"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 May 2025 05:46:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDjal-000D4t-2F;
	Sat, 10 May 2025 12:46:11 +0000
Date: Sat, 10 May 2025 20:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Message-ID: <202505102037.qTxGl3jk-lkp@intel.com>
References: <20250509200111.3372279-5-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509200111.3372279-5-ziy@nvidia.com>

Hi Zi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250509]
[cannot apply to akpm-mm/mm-everything trace/for-next linus/master v6.15-rc5 v6.15-rc4 v6.15-rc3 v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-page_isolation-make-page-isolation-a-standalone-bit/20250510-040418
base:   next-20250509
patch link:    https://lore.kernel.org/r/20250509200111.3372279-5-ziy%40nvidia.com
patch subject: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter from more functions.
config: x86_64-randconfig-122-20250510 (https://download.01.org/0day-ci/archive/20250510/202505102037.qTxGl3jk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505102037.qTxGl3jk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505102037.qTxGl3jk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:6656:62: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long nr_migrated @@     got restricted acr_flags_t [usertype] alloc_flags @@
   mm/page_alloc.c:6656:62: sparse:     expected unsigned long nr_migrated
   mm/page_alloc.c:6656:62: sparse:     got restricted acr_flags_t [usertype] alloc_flags
   mm/page_alloc.c:6659:50: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected restricted acr_flags_t [usertype] alloc_flags @@     got unsigned long [assigned] total_mapped @@
   mm/page_alloc.c:6659:50: sparse:     expected restricted acr_flags_t [usertype] alloc_flags
   mm/page_alloc.c:6659:50: sparse:     got unsigned long [assigned] total_mapped
>> mm/page_alloc.c:6760:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted isolate_mode_t [usertype] mode @@     got int @@
   mm/page_alloc.c:6760:55: sparse:     expected restricted isolate_mode_t [usertype] mode
   mm/page_alloc.c:6760:55: sparse:     got int
   mm/page_alloc.c:2761:13: sparse: sparse: context imbalance in '__free_frozen_pages' - different lock contexts for basic block
   mm/page_alloc.c:2864:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:3154:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4982:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block

vim +6760 mm/page_alloc.c

  6722	
  6723	/**
  6724	 * alloc_contig_range() -- tries to allocate given range of pages
  6725	 * @start:	start PFN to allocate
  6726	 * @end:	one-past-the-last PFN to allocate
  6727	 * @alloc_flags:	allocation information
  6728	 * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  6729	 *		action and reclaim modifiers are supported. Reclaim modifiers
  6730	 *		control allocation behavior during compaction/migration/reclaim.
  6731	 *
  6732	 * The PFN range does not have to be pageblock aligned. The PFN range must
  6733	 * belong to a single zone.
  6734	 *
  6735	 * The first thing this routine does is attempt to MIGRATE_ISOLATE all
  6736	 * pageblocks in the range.  Once isolated, the pageblocks should not
  6737	 * be modified by others.
  6738	 *
  6739	 * Return: zero on success or negative error code.  On success all
  6740	 * pages which PFN is in [start, end) are allocated for the caller and
  6741	 * need to be freed with free_contig_range().
  6742	 */
  6743	int alloc_contig_range_noprof(unsigned long start, unsigned long end,
  6744				acr_flags_t alloc_flags, gfp_t gfp_mask)
  6745	{
  6746		unsigned long outer_start, outer_end;
  6747		int ret = 0;
  6748	
  6749		struct compact_control cc = {
  6750			.nr_migratepages = 0,
  6751			.order = -1,
  6752			.zone = page_zone(pfn_to_page(start)),
  6753			.mode = MIGRATE_SYNC,
  6754			.ignore_skip_hint = true,
  6755			.no_set_skip_hint = true,
  6756			.alloc_contig = true,
  6757		};
  6758		INIT_LIST_HEAD(&cc.migratepages);
  6759		bool is_range_aligned;
> 6760		isolate_mode_t mode = (alloc_flags & ACR_CMA) ? CMA_ALLOCATION :
  6761								ISOLATE_MODE_NONE;
  6762	
  6763		gfp_mask = current_gfp_context(gfp_mask);
  6764		if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
  6765			return -EINVAL;
  6766	
  6767		/*
  6768		 * What we do here is we mark all pageblocks in range as
  6769		 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
  6770		 * have different sizes, and due to the way page allocator
  6771		 * work, start_isolate_page_range() has special handlings for this.
  6772		 *
  6773		 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
  6774		 * migrate the pages from an unaligned range (ie. pages that
  6775		 * we are interested in). This will put all the pages in
  6776		 * range back to page allocator as MIGRATE_ISOLATE.
  6777		 *
  6778		 * When this is done, we take the pages in range from page
  6779		 * allocator removing them from the buddy system.  This way
  6780		 * page allocator will never consider using them.
  6781		 *
  6782		 * This lets us mark the pageblocks back as
  6783		 * MIGRATE_CMA/MIGRATE_MOVABLE so that free pages in the
  6784		 * aligned range but not in the unaligned, original range are
  6785		 * put back to page allocator so that buddy can use them.
  6786		 */
  6787	
  6788		ret = start_isolate_page_range(start, end, mode, 0);
  6789		if (ret)
  6790			goto done;
  6791	
  6792		drain_all_pages(cc.zone);
  6793	
  6794		/*
  6795		 * In case of -EBUSY, we'd like to know which page causes problem.
  6796		 * So, just fall through. test_pages_isolated() has a tracepoint
  6797		 * which will report the busy page.
  6798		 *
  6799		 * It is possible that busy pages could become available before
  6800		 * the call to test_pages_isolated, and the range will actually be
  6801		 * allocated.  So, if we fall through be sure to clear ret so that
  6802		 * -EBUSY is not accidentally used or returned to caller.
  6803		 */
  6804		ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
  6805		if (ret && ret != -EBUSY)
  6806			goto done;
  6807	
  6808		/*
  6809		 * When in-use hugetlb pages are migrated, they may simply be released
  6810		 * back into the free hugepage pool instead of being returned to the
  6811		 * buddy system.  After the migration of in-use huge pages is completed,
  6812		 * we will invoke replace_free_hugepage_folios() to ensure that these
  6813		 * hugepages are properly released to the buddy system.
  6814		 */
  6815		ret = replace_free_hugepage_folios(start, end);
  6816		if (ret)
  6817			goto done;
  6818	
  6819		/*
  6820		 * Pages from [start, end) are within a pageblock_nr_pages
  6821		 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
  6822		 * more, all pages in [start, end) are free in page allocator.
  6823		 * What we are going to do is to allocate all pages from
  6824		 * [start, end) (that is remove them from page allocator).
  6825		 *
  6826		 * The only problem is that pages at the beginning and at the
  6827		 * end of interesting range may be not aligned with pages that
  6828		 * page allocator holds, ie. they can be part of higher order
  6829		 * pages.  Because of this, we reserve the bigger range and
  6830		 * once this is done free the pages we are not interested in.
  6831		 *
  6832		 * We don't have to hold zone->lock here because the pages are
  6833		 * isolated thus they won't get removed from buddy.
  6834		 */
  6835		outer_start = find_large_buddy(start);
  6836	
  6837		/* Make sure the range is really isolated. */
  6838		if (test_pages_isolated(outer_start, end, mode)) {
  6839			ret = -EBUSY;
  6840			goto done;
  6841		}
  6842	
  6843		/* Grab isolated pages from freelists. */
  6844		outer_end = isolate_freepages_range(&cc, outer_start, end);
  6845		if (!outer_end) {
  6846			ret = -EBUSY;
  6847			goto done;
  6848		}
  6849	
  6850		/*
  6851		 * With __GFP_COMP and the requested order < MAX_PAGE_ORDER,
  6852		 * isolated free pages can have higher order than the requested
  6853		 * one. Use split_free_pages() to free out of range pages.
  6854		 */
  6855		is_range_aligned = is_power_of_2(end - start);
  6856		if (!(gfp_mask & __GFP_COMP) ||
  6857			(is_range_aligned && ilog2(end - start) < MAX_PAGE_ORDER)) {
  6858			split_free_pages(cc.freepages, gfp_mask);
  6859	
  6860			/* Free head and tail (if any) */
  6861			if (start != outer_start)
  6862				free_contig_range(outer_start, start - outer_start);
  6863			if (end != outer_end)
  6864				free_contig_range(end, outer_end - end);
  6865	
  6866			outer_start = start;
  6867			outer_end = end;
  6868	
  6869			if (!(gfp_mask & __GFP_COMP))
  6870				goto done;
  6871		}
  6872	
  6873		if (start == outer_start && end == outer_end && is_range_aligned) {
  6874			struct page *head = pfn_to_page(start);
  6875			int order = ilog2(end - start);
  6876	
  6877			check_new_pages(head, order);
  6878			prep_new_page(head, order, gfp_mask, 0);
  6879			set_page_refcounted(head);
  6880		} else {
  6881			ret = -EINVAL;
  6882			WARN(true, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
  6883			     start, end, outer_start, outer_end);
  6884		}
  6885	done:
  6886		undo_isolate_page_range(start, end);
  6887		return ret;
  6888	}
  6889	EXPORT_SYMBOL(alloc_contig_range_noprof);
  6890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
