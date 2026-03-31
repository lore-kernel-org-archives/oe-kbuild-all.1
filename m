Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E13E1CE8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964326; cv=none; b=RIdmLl0bIazTNoMgienWdTtjEfltxYwxMMttgf64hWWGq+R1d9ZuPS45OgSpAE5CdQgAu2/Ome4TtEROdPDfsFrz6OQuEYtx+Lcol8csWol0r+tvGdeEGSC53pD58ktwrsZPrAHhD/eJUKN0w7YyipGCwGSwMCp8eO7/o+vTgJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964326; c=relaxed/simple;
	bh=ikEnFbC44B6DIcepFjapHbreNELTikZC2G7LYo/woZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJHyD2SiVyumodKNhybxJkmzy9+FCZMUUG1n4oGpDOwJN8RxLa+a8wua0y7heMZeZfKI/biBkMSmKi2M4rHPxczRWaqxCcodnY1N6hy4uY9XP8Gai+ul0iPLPcmSPSsgsiWHIlmEpCXKoATqctJRJervpHo3YeddoBM1UvX/4yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkDaWveN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkDaWveN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774964323; x=1806500323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ikEnFbC44B6DIcepFjapHbreNELTikZC2G7LYo/woZ0=;
  b=FkDaWveNXffzhd9K5KmMtZvvIkQGJNHHXFdIFqB8xo/gv3KHulwGiprG
   6B5cwg4v/Rp+nHj9mV4UUwcmsQQzihs3PKRGikTJ9E8FECg4H6lJ4AFV1
   l1qZvD+q1BxGEzdQD+sFAHiuIh0RynxENJxBK5NKtjiMMPqXykOUSSsbm
   RvMcL47KAxRp6kkoWoKxeInssLGzLRsu30HJlzzJIyMZau44mWtnlL3XU
   urFdSVSxR7r/8PkQZwfXto07HHkiYW49+Jz+OEI/5NJ5vKR5nf4DZEPzR
   rThhjJQV7xUn114iQbo73YCxNTdsJY0hiwu33BMuSkOXrl0AOSgOjHILg
   Q==;
X-CSE-ConnectionGUID: I2d5IphBQcOyOp/wVW2i4w==
X-CSE-MsgGUID: ApqVhRYMTKCh/9oEXDgmQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76168793"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76168793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:38:43 -0700
X-CSE-ConnectionGUID: h0N9GazRTu+oN9I+F0jYBw==
X-CSE-MsgGUID: R+wFaG8SQruuDIkWoVamIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226622609"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 06:38:39 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ZIi-000000002hJ-1Bhm;
	Tue, 31 Mar 2026 13:38:36 +0000
Date: Tue, 31 Mar 2026 21:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ke Zhao <ke.zhao.kernel@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ke Zhao <ke.zhao.kernel@gmail.com>,
	syzbot+2aee6839a252e612ce34@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm, KMSAN: Add missing shadow memory initialization in
 special allocation paths
Message-ID: <202603312101.BSxDJ969-lkp@intel.com>
References: <20260330-fix-kmsan-v1-1-e9c672a4b9eb@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-fix-kmsan-v1-1-e9c672a4b9eb@gmail.com>

Hi Ke,

kernel test robot noticed the following build errors:

[auto build test ERROR on bbeb83d3182abe0d245318e274e8531e5dd7a948]

url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Zhao/mm-KMSAN-Add-missing-shadow-memory-initialization-in-special-allocation-paths/20260331-050740
base:   bbeb83d3182abe0d245318e274e8531e5dd7a948
patch link:    https://lore.kernel.org/r/20260330-fix-kmsan-v1-1-e9c672a4b9eb%40gmail.com
patch subject: [PATCH] mm, KMSAN: Add missing shadow memory initialization in special allocation paths
config: hexagon-randconfig-r073-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312101.BSxDJ969-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312101.BSxDJ969-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312101.BSxDJ969-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:7131:23: error: use of undeclared identifier 'page'
    7131 |                 trace_mm_page_alloc(page, order, gfp_mask, get_pageblock_migratetype(page));
         |                                     ^~~~
   mm/page_alloc.c:7131:72: error: use of undeclared identifier 'page'
    7131 |                 trace_mm_page_alloc(page, order, gfp_mask, get_pageblock_migratetype(page));
         |                                                                                      ^~~~
   mm/page_alloc.c:7131:72: error: use of undeclared identifier 'page'
    7131 |                 trace_mm_page_alloc(page, order, gfp_mask, get_pageblock_migratetype(page));
         |                                                                                      ^~~~
   mm/page_alloc.c:7132:20: error: use of undeclared identifier 'page'
    7132 |                 kmsan_alloc_page(page, order, gfp_mask);
         |                                  ^~~~
   4 errors generated.


vim +/page +7131 mm/page_alloc.c

  6977	
  6978	/**
  6979	 * alloc_contig_frozen_range() -- tries to allocate given range of frozen pages
  6980	 * @start:	start PFN to allocate
  6981	 * @end:	one-past-the-last PFN to allocate
  6982	 * @alloc_flags:	allocation information
  6983	 * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  6984	 *		action and reclaim modifiers are supported. Reclaim modifiers
  6985	 *		control allocation behavior during compaction/migration/reclaim.
  6986	 *
  6987	 * The PFN range does not have to be pageblock aligned. The PFN range must
  6988	 * belong to a single zone.
  6989	 *
  6990	 * The first thing this routine does is attempt to MIGRATE_ISOLATE all
  6991	 * pageblocks in the range.  Once isolated, the pageblocks should not
  6992	 * be modified by others.
  6993	 *
  6994	 * All frozen pages which PFN is in [start, end) are allocated for the
  6995	 * caller, and they could be freed with free_contig_frozen_range(),
  6996	 * free_frozen_pages() also could be used to free compound frozen pages
  6997	 * directly.
  6998	 *
  6999	 * Return: zero on success or negative error code.
  7000	 */
  7001	int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
  7002			acr_flags_t alloc_flags, gfp_t gfp_mask)
  7003	{
  7004		const unsigned int order = ilog2(end - start);
  7005		unsigned long outer_start, outer_end;
  7006		int ret = 0;
  7007	
  7008		struct compact_control cc = {
  7009			.nr_migratepages = 0,
  7010			.order = -1,
  7011			.zone = page_zone(pfn_to_page(start)),
  7012			.mode = MIGRATE_SYNC,
  7013			.ignore_skip_hint = true,
  7014			.no_set_skip_hint = true,
  7015			.alloc_contig = true,
  7016		};
  7017		INIT_LIST_HEAD(&cc.migratepages);
  7018		enum pb_isolate_mode mode = (alloc_flags & ACR_FLAGS_CMA) ?
  7019						    PB_ISOLATE_MODE_CMA_ALLOC :
  7020						    PB_ISOLATE_MODE_OTHER;
  7021	
  7022		/*
  7023		 * In contrast to the buddy, we allow for orders here that exceed
  7024		 * MAX_PAGE_ORDER, so we must manually make sure that we are not
  7025		 * exceeding the maximum folio order.
  7026		 */
  7027		if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
  7028			return -EINVAL;
  7029	
  7030		gfp_mask = current_gfp_context(gfp_mask);
  7031		if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
  7032			return -EINVAL;
  7033	
  7034		/*
  7035		 * What we do here is we mark all pageblocks in range as
  7036		 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
  7037		 * have different sizes, and due to the way page allocator
  7038		 * work, start_isolate_page_range() has special handlings for this.
  7039		 *
  7040		 * Once the pageblocks are marked as MIGRATE_ISOLATE, we
  7041		 * migrate the pages from an unaligned range (ie. pages that
  7042		 * we are interested in). This will put all the pages in
  7043		 * range back to page allocator as MIGRATE_ISOLATE.
  7044		 *
  7045		 * When this is done, we take the pages in range from page
  7046		 * allocator removing them from the buddy system.  This way
  7047		 * page allocator will never consider using them.
  7048		 *
  7049		 * This lets us mark the pageblocks back as
  7050		 * MIGRATE_CMA/MIGRATE_MOVABLE so that free pages in the
  7051		 * aligned range but not in the unaligned, original range are
  7052		 * put back to page allocator so that buddy can use them.
  7053		 */
  7054	
  7055		ret = start_isolate_page_range(start, end, mode);
  7056		if (ret)
  7057			goto done;
  7058	
  7059		drain_all_pages(cc.zone);
  7060	
  7061		/*
  7062		 * In case of -EBUSY, we'd like to know which page causes problem.
  7063		 * So, just fall through. test_pages_isolated() has a tracepoint
  7064		 * which will report the busy page.
  7065		 *
  7066		 * It is possible that busy pages could become available before
  7067		 * the call to test_pages_isolated, and the range will actually be
  7068		 * allocated.  So, if we fall through be sure to clear ret so that
  7069		 * -EBUSY is not accidentally used or returned to caller.
  7070		 */
  7071		ret = __alloc_contig_migrate_range(&cc, start, end);
  7072		if (ret && ret != -EBUSY)
  7073			goto done;
  7074	
  7075		/*
  7076		 * When in-use hugetlb pages are migrated, they may simply be released
  7077		 * back into the free hugepage pool instead of being returned to the
  7078		 * buddy system.  After the migration of in-use huge pages is completed,
  7079		 * we will invoke replace_free_hugepage_folios() to ensure that these
  7080		 * hugepages are properly released to the buddy system.
  7081		 */
  7082		ret = replace_free_hugepage_folios(start, end);
  7083		if (ret)
  7084			goto done;
  7085	
  7086		/*
  7087		 * Pages from [start, end) are within a pageblock_nr_pages
  7088		 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
  7089		 * more, all pages in [start, end) are free in page allocator.
  7090		 * What we are going to do is to allocate all pages from
  7091		 * [start, end) (that is remove them from page allocator).
  7092		 *
  7093		 * The only problem is that pages at the beginning and at the
  7094		 * end of interesting range may be not aligned with pages that
  7095		 * page allocator holds, ie. they can be part of higher order
  7096		 * pages.  Because of this, we reserve the bigger range and
  7097		 * once this is done free the pages we are not interested in.
  7098		 *
  7099		 * We don't have to hold zone->lock here because the pages are
  7100		 * isolated thus they won't get removed from buddy.
  7101		 */
  7102		outer_start = find_large_buddy(start);
  7103	
  7104		/* Make sure the range is really isolated. */
  7105		if (test_pages_isolated(outer_start, end, mode)) {
  7106			ret = -EBUSY;
  7107			goto done;
  7108		}
  7109	
  7110		/* Grab isolated pages from freelists. */
  7111		outer_end = isolate_freepages_range(&cc, outer_start, end);
  7112		if (!outer_end) {
  7113			ret = -EBUSY;
  7114			goto done;
  7115		}
  7116	
  7117		if (!(gfp_mask & __GFP_COMP)) {
  7118			split_free_frozen_pages(cc.freepages, gfp_mask);
  7119	
  7120			/* Free head and tail (if any) */
  7121			if (start != outer_start)
  7122				__free_contig_frozen_range(outer_start, start - outer_start);
  7123			if (end != outer_end)
  7124				__free_contig_frozen_range(end, outer_end - end);
  7125		} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
  7126			struct page *head = pfn_to_page(start);
  7127	
  7128			check_new_pages(head, order);
  7129			prep_new_page(head, order, gfp_mask, 0);
  7130	
> 7131			trace_mm_page_alloc(page, order, gfp_mask, get_pageblock_migratetype(page));
  7132			kmsan_alloc_page(page, order, gfp_mask);
  7133		} else {
  7134			ret = -EINVAL;
  7135			WARN(true, "PFN range: requested [%lu, %lu), allocated [%lu, %lu)\n",
  7136			     start, end, outer_start, outer_end);
  7137		}
  7138	done:
  7139		undo_isolate_page_range(start, end);
  7140		return ret;
  7141	}
  7142	EXPORT_SYMBOL(alloc_contig_frozen_range_noprof);
  7143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
