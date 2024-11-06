Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651C2022FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730907836; cv=none; b=tp2mdaQZxH2+HVSNwJHzVizA/LWqBgMjXCszNObvcnLFobCwHKhnfhJgSvnGIIYVutW9/vBc+KXWLDu3LWXuEOm9sAHdF1Q+9V2SqVxg47qQWiMzb2w0Ffwb3vVAjuYvGrP/G8zBESca9+FIOJxeDcYpNimlGQSlQrSEixn+yB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730907836; c=relaxed/simple;
	bh=STC3YIxvaW4ZTm8i6Fd5fOI5Bx7OSToI2/q8nYvl2gU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3qysBemW5gBub4cfT/cP0g7fA2Q48QNdtIPmK2cx/khjNV9wpM9eqt9WH4z9WCrRTR1klnW8qGzTyx32MeaUmIhcuhmS1u15brAZ7xUAR0CpkDavnyw368g5jIkfVgyOfFQ5Hn9l962qjabS3e7MJA3Ad2Aeqoa6bhUpa1JRxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mk224+Wy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mk224+Wy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730907835; x=1762443835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STC3YIxvaW4ZTm8i6Fd5fOI5Bx7OSToI2/q8nYvl2gU=;
  b=mk224+WyyRDHmfc+Jgz1mxovv20pHqzmmISEqIlTFgyj8seYItt60MXh
   Vuem/Iqj/e4eqQlqKGwKkxuGanUFrO5k3Y6COQYr3pmqV8/GvFfkcU2HC
   7EYq2wg9pYNAHHxp3/2pxv71luKuUmOEdaxlNrfNJOTcR6U8/JINar0gA
   7tEkK3oyzxtOQQsm1CWmxf15s/3S0+lSuk1XAghzfUV8KdnXAQ863DOoa
   V+o/nMprcWZkzNEnA6wDXe3dXy+zX1G51jv9nW5aFdCrqCcx+006fg95R
   K2VNg7yvxxwFFX/j50+ubKFMMrLkHuAifyM/8y+1RTRVT3wZ0mgNCiIux
   A==;
X-CSE-ConnectionGUID: jqHgaswQRjqc765auVJzbQ==
X-CSE-MsgGUID: BAA35DZ+QNqWvJbL1jzYPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48173835"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48173835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 07:43:54 -0800
X-CSE-ConnectionGUID: rWnN7dPaS9mlTAklgpKN5A==
X-CSE-MsgGUID: 8FxA6OCwTgi8M9hNvKIl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84703749"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Nov 2024 07:38:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8i6s-000p4Y-0e;
	Wed, 06 Nov 2024 15:38:18 +0000
Date: Wed, 6 Nov 2024 23:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-logically-offline 7/9]
 mm/page_alloc.c:6792: warning: Function parameter or struct member
 'nr_pages' not described in 'logically_offline_online_pages'
Message-ID: <202411062314.HQwyP2zC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-logically-offline
head:   0b0c0b591915c51fb3c6662845d2815a85d71185
commit: 9b397edd85513244beeefcb49b2c26c8fcd205ea [7/9] mm: factor out code to logically offlining+online page ranges from virtio-mem
config: arc-randconfig-001-20241106 (https://download.01.org/0day-ci/archive/20241106/202411062314.HQwyP2zC-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062314.HQwyP2zC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411062314.HQwyP2zC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:6792: warning: Function parameter or struct member 'nr_pages' not described in 'logically_offline_online_pages'
>> mm/page_alloc.c:6792: warning: Excess function parameter 'pages' description in 'logically_offline_online_pages'
>> mm/page_alloc.c:6854: warning: Function parameter or struct member 'nr_pages' not described in 'online_logically_offline_pages'
>> mm/page_alloc.c:6854: warning: Excess function parameter 'pages' description in 'online_logically_offline_pages'


vim +6792 mm/page_alloc.c

  6764	
  6765	/**
  6766	 * logically_offline_online_pages: logically offline pages in online memory
  6767	 *				   sections
  6768	 * @pfn: the start PFN specifying the first page to logically offline
  6769	 * @pages: the number of pages to logically offline
  6770	 *
  6771	 * Try to free up the given range, for example, by migrating movable allocations
  6772	 * away, so we can remove the now-free pages from the buddy and logically
  6773	 * offline the pages.
  6774	 *
  6775	 * Once pages are logically offline, they can either be re-onlined using
  6776	 * online_logically_offline_pages(), or fully offlined when implemented by
  6777	 * the caller using the MEM_GOING_OFFLINE+MEM_GOING_OFFLINE memory notifier
  6778	 * approach as documented for PageOffline().
  6779	 *
  6780	 * The caller must make sure that all pages are within the same zone, that
  6781	 * all covered memory sections are online, and that the memory sections
  6782	 * cannot get offlined concurrently.
  6783	 *
  6784	 * The range must cover full pageblocks. This function will fail if the
  6785	 * range already contains logically offline pages.
  6786	 *
  6787	 * Returns: 0 on success, -ENOMEM when out of memory, and -EBUSY if freeing up
  6788	 * the pages to mark them logically offline failed because some pages are
  6789	 * unmovable.
  6790	 */
  6791	int logically_offline_online_pages(unsigned long pfn, unsigned long nr_pages)
> 6792	{
  6793		unsigned long cur_pfn;
  6794		int rc;
  6795	
  6796		if (WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pageblock_nr_pages)))
  6797			return -EINVAL;
  6798	
  6799		/*
  6800		 * Use noprof: we're allocating the memory to unplug it, not to
  6801		 * use it. We might offline and remove these pages without
  6802		 * ever handing them back to the buddy.
  6803		 */
  6804		rc = alloc_contig_range_noprof(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
  6805					       GFP_KERNEL);
  6806		if (rc)
  6807			return rc;
  6808	
  6809		/*
  6810		 * Mark the pages offline and remember that they were
  6811		 * obtained through alloc_contig_range().
  6812		 */
  6813		page_offline_begin();
  6814		for (cur_pfn = pfn; cur_pfn < pfn + nr_pages; cur_pfn++) {
  6815			struct page *page = pfn_to_page(cur_pfn);
  6816	
  6817			__SetPageOffline(page);
  6818			if (IS_ALIGNED(cur_pfn, pageblock_nr_pages))
  6819				SetPageDirty(page);
  6820		}
  6821		page_offline_end();
  6822		adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
  6823		return 0;
  6824	}
  6825	EXPORT_SYMBOL_GPL(logically_offline_online_pages);
  6826	
  6827	/**
  6828	 * online_logically_offline_pages: online logically offline pages in online
  6829	 *				   memory sections
  6830	 * @pfn: the start PFN specifying the first logically offline page to online
  6831	 * @pages: the number of logically offline pages to online
  6832	 *
  6833	 * Online all pages in the range, releasing them to the buddy.
  6834	 *
  6835	 * The pages must be logically offline, either because (a) they were kept
  6836	 * logically offline when the memory section was onlined using the
  6837	 * online_page_callback; or (b) because they were logically offlined using
  6838	 * logically_offline_online_pages(). The range may contain a mixture of
  6839	 * both types (on pageblock granularity, which is implied).
  6840	 *
  6841	 * The caller must make sure that all pages are within the same zone, that
  6842	 * all memory sections are online, and that the memory sections cannot get
  6843	 * offlined concurrently.
  6844	 *
  6845	 * The range must cover full pageblocks.
  6846	 *
  6847	 * Note: there is no requirement regarding the page ranges passed to
  6848	 * this function and the page ranges passed to logically_offline_online_pages().
  6849	 * For example, it is valid to call logically_offline_online_pages() on to
  6850	 * adjacent page ranges and have a single online_logically_offline_pages()
  6851	 * call that spans the whole page range.
  6852	 */
  6853	void online_logically_offline_pages(unsigned long pfn, unsigned long nr_pages)
> 6854	{
  6855		if (WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pageblock_nr_pages)))
  6856			return;
  6857	
  6858		while (nr_pages) {
  6859			struct page *page = pfn_to_page(pfn);
  6860			unsigned long cur_pfn;
  6861			bool dirty;
  6862			int order;
  6863	
  6864			/*
  6865			 * The alignment of our PFN defines the maximum order we can
  6866			 * use. But we are limited by the maximum buddy order and
  6867			 * the remaining number of pages.
  6868			 *
  6869			 * pfn and nr_pages are never 0.
  6870			 */
  6871			order = min(__ffs(pfn), MAX_PAGE_ORDER);
  6872			order = min(order, ilog2(nr_pages));
  6873	
  6874			/*
  6875			 * All pages in a pageblock are alike, so avoid scanning all
  6876			 * pages. But we might get called on ranges where individual
  6877			 * pageblocks differ.
  6878			 */
  6879			dirty = PageDirty(page);
  6880			for (cur_pfn = pfn + pageblock_nr_pages;
  6881			     cur_pfn < pfn + (1 << order);
  6882			     cur_pfn += pageblock_nr_pages)
  6883				if (dirty != !!PageDirty(pfn_to_page(cur_pfn)))
  6884					break;
  6885	
  6886			/* Use the order that actually fits into our detected range. */
  6887			order = ilog2(cur_pfn - pfn);
  6888			VM_WARN_ON_ONCE(!IS_ALIGNED(order, pageblock_order));
  6889	
  6890			/*
  6891			 * If a pageblock is marked "dirty", it was obtained through
  6892			 * alloc_contig_range().
  6893			 */
  6894			if (!dirty) {
  6895	#ifdef CONFIG_MEMORY_HOTPLUG
  6896				generic_online_page(page, order);
  6897	#else
  6898				WARN_ON_ONCE(1);
  6899	#endif
  6900			} else {
  6901				adjust_managed_page_count(page, 1 << order);
  6902				for (cur_pfn = pfn; cur_pfn < pfn + (1 << order); cur_pfn++)
  6903					/* No need to clear PageDirty(). */
  6904					__ClearPageOffline(pfn_to_page(cur_pfn));
  6905				free_contig_range(pfn, 1 << order);
  6906			}
  6907	
  6908			pfn += 1 << order;
  6909			nr_pages -= 1 << order;
  6910		}
  6911	}
  6912	EXPORT_SYMBOL_GPL(online_logically_offline_pages);
  6913	#endif /* CONFIG_CONTIG_ALLOC */
  6914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
