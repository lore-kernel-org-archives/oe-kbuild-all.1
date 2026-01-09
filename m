Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8671421C9EA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 23:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768002661; cv=none; b=bhu5sQZ/Ri+d51fth4gZhtgQc9Ai1g3DHWvUOC6y6Ny+OpyvR7CphVgOPTXHRvHYtoxFV9Wgq+bHnxZJUGNzLD9gjlVFobjU+ndhPCsm/ds3KXp1VSNl8sG6793qH4ZjdA7dB3rda5Mtw24Hu3CFtffYMM1ZHrzZm4EESMYFqqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768002661; c=relaxed/simple;
	bh=NqelSKY23QhQmYhwp4ZkXaQeSe04dQAUjmeV2ppN7rw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VIdxAURV8kH/t79hKIxS0p3iJERI3/XRJiSj1xwYvz56tp4ta99LVgMsZ1cq1NRgW5abHZzmQ7fl3rfROypbHLRI/amXcfDDneRma1jjTjA7HAc2hdy76ZLfIbU5kVMGNuV6dYuDCYOnTpi299pSoveY2hWYfYWk2OH5Ih/BRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M143LvBX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M143LvBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768002659; x=1799538659;
  h=date:from:to:cc:subject:message-id;
  bh=NqelSKY23QhQmYhwp4ZkXaQeSe04dQAUjmeV2ppN7rw=;
  b=M143LvBX1OKhwn6N4TMflH897bRlpcNf/cWEYmk/5NJ/0/EtvHRWHvWl
   CzANxlpsi3/S8j2Wiea4FuSoAZQkxoMzNI1KlwLMuWvF/EOCEuC9NlimM
   m69GSfF9/iVE5AI8DK+6O5giEvEr/xoBRHSDq3GPWTV1dsyBy3WUWZCi3
   H5cE4817pU88ToOWjHYZcivS6olmBWiQPd7VdCsU3DL1odcsZ/7OYJbTx
   5H6cjrEPZDvzJv6F2Kuscw3KIsxDzj4SNNTRE+DLWjODQXYtvaY/YNbWj
   qsl/Dayj/CdR++1Mc3/rhwUzmM3j7FKV/gtX+nBNJ1Bj7YxxrJXIlcSFQ
   w==;
X-CSE-ConnectionGUID: 8kiwOxQKQEq0sU7cIJiT6A==
X-CSE-MsgGUID: 9KeRAKS7TcSC6gwrrcxUVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69314548"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69314548"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 15:50:59 -0800
X-CSE-ConnectionGUID: rCQDLkXrSkG7uXfnzZ5RIA==
X-CSE-MsgGUID: qzhGHJSTT7qL2wTBh0FwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="226938792"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2026 15:50:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veMFr-000000007r0-2d4K;
	Fri, 09 Jan 2026 23:50:55 +0000
Date: Sat, 10 Jan 2026 07:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4] mm/page_alloc.c:893:31:
 sparse: sparse: cast from restricted fpi_t
Message-ID: <202601100753.LYZP8mU8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ab8dd06cde55677f939e0642df31f06126d507d4
commit: 77affcdd1796d9e83305587b1ecf9668ae3d06be [4/4] ANDROID: vendor_hooks: vendor hook for MM
config: arm-randconfig-r132-20260110 (https://download.01.org/0day-ci/archive/20260110/202601100753.LYZP8mU8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100753.LYZP8mU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100753.LYZP8mU8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:195:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:1423:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1423:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1423:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1431:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1431:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1431:25: sparse:     got restricted fpi_t [usertype] fpi_flags
>> mm/page_alloc.c:893:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:893:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:893:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:893:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:2664:9: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2751:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
>> mm/page_alloc.c:893:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:2985:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4723:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block

vim +893 mm/page_alloc.c

   854	
   855	/*
   856	 * Freeing function for a buddy system allocator.
   857	 *
   858	 * The concept of a buddy system is to maintain direct-mapped table
   859	 * (containing bit values) for memory blocks of various "orders".
   860	 * The bottom level table contains the map for the smallest allocatable
   861	 * units of memory (here, pages), and each level above it describes
   862	 * pairs of units from the levels below, hence, "buddies".
   863	 * At a high level, all that happens here is marking the table entry
   864	 * at the bottom level available, and propagating the changes upward
   865	 * as necessary, plus some accounting needed to play nicely with other
   866	 * parts of the VM system.
   867	 * At each level, we keep a list of pages, which are heads of continuous
   868	 * free pages of length of (1 << order) and marked with PageBuddy.
   869	 * Page's order is recorded in page_private(page) field.
   870	 * So when we are allocating or freeing one, we can derive the state of the
   871	 * other.  That is, if we allocate a small block, and both were
   872	 * free, the remainder of the region must be split into blocks.
   873	 * If a block is freed, and its buddy is also free, then this
   874	 * triggers coalescing into a block of larger size.
   875	 *
   876	 * -- nyc
   877	 */
   878	
   879	static inline void __free_one_page(struct page *page,
   880			unsigned long pfn,
   881			struct zone *zone, unsigned int order,
   882			int migratetype, fpi_t fpi_flags)
   883	{
   884		struct capture_control *capc = task_capc(zone);
   885		unsigned long buddy_pfn = 0;
   886		unsigned long combined_pfn;
   887		struct page *buddy;
   888		bool to_tail;
   889		int max_order = zone_max_order(zone);
   890		bool bypass = false;
   891	
   892		trace_android_vh_free_one_page_bypass(page, zone, order,
 > 893			migratetype, (int)fpi_flags, &bypass);
   894	
   895		if (bypass)
   896			return;
   897	
   898		VM_BUG_ON(!zone_is_initialized(zone));
   899		VM_BUG_ON_PAGE(page->flags & PAGE_FLAGS_CHECK_AT_PREP, page);
   900	
   901		VM_BUG_ON(migratetype == -1);
   902		if (likely(!is_migrate_isolate(migratetype)))
   903			__mod_zone_freepage_state(zone, 1 << order, migratetype);
   904	
   905		VM_BUG_ON_PAGE(pfn & ((1 << order) - 1), page);
   906		VM_BUG_ON_PAGE(bad_range(zone, page), page);
   907	
   908		while (order < max_order) {
   909			if (compaction_capture(capc, page, order, migratetype)) {
   910				__mod_zone_freepage_state(zone, -(1 << order),
   911									migratetype);
   912				return;
   913			}
   914	
   915			buddy = find_buddy_page_pfn(page, pfn, order, &buddy_pfn);
   916			if (!buddy)
   917				goto done_merging;
   918	
   919			if (unlikely(order >= pageblock_order)) {
   920				/*
   921				 * We want to prevent merge between freepages on pageblock
   922				 * without fallbacks and normal pageblock. Without this,
   923				 * pageblock isolation could cause incorrect freepage or CMA
   924				 * accounting or HIGHATOMIC accounting.
   925				 */
   926				int buddy_mt = get_pfnblock_migratetype(buddy, buddy_pfn);
   927	
   928				if (migratetype != buddy_mt
   929						&& (!migratetype_is_mergeable(migratetype) ||
   930							!migratetype_is_mergeable(buddy_mt)))
   931					goto done_merging;
   932			}
   933	
   934			/*
   935			 * Our buddy is free or it is CONFIG_DEBUG_PAGEALLOC guard page,
   936			 * merge with it and move up one order.
   937			 */
   938			if (page_is_guard(buddy))
   939				clear_page_guard(zone, buddy, order, migratetype);
   940			else
   941				del_page_from_free_list(buddy, zone, order);
   942			combined_pfn = buddy_pfn & pfn;
   943			page = page + (combined_pfn - pfn);
   944			pfn = combined_pfn;
   945			order++;
   946		}
   947	
   948	done_merging:
   949		set_buddy_order(page, order);
   950	
   951		if (fpi_flags & FPI_TO_TAIL)
   952			to_tail = true;
   953		else if (is_shuffle_order(order))
   954			to_tail = shuffle_pick_tail();
   955		else if (order + 1 >= max_order)
   956			to_tail = false;
   957		else
   958			to_tail = buddy_merge_likely(pfn, buddy_pfn, page, order);
   959	
   960		if (to_tail)
   961			add_to_free_list_tail(page, zone, order, migratetype);
   962		else
   963			add_to_free_list(page, zone, order, migratetype);
   964	
   965		/* Notify page reporting subsystem of freed page */
   966		if (!(fpi_flags & FPI_SKIP_REPORT_NOTIFY))
   967			page_reporting_notify_free(order);
   968	}
   969	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
