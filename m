Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1212BB13
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914344; cv=none; b=PyrRZT/FXkheDlkeZ9qTLIP95YZ5tAO0MgfDrT6HGvHyr/+w10Ha6TwIDCiX155vGv54Zk+i55MLMdyWB5SpbicTlh/UnIfDy5fcScMpKV6zU8Ie6qlt29tpuyWsln2pYxzfAXpTo0px6VoPq75CdBvmP6frptKXs8eGYgCZ20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914344; c=relaxed/simple;
	bh=ivNrAbsC27MAVgrwBZDQmbKEvb05ngbTj6Ly3E7OGeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEz9VieQAImhoGfUxg4mJiEFBU0ym2XXKYQYP3uBQYuamQtbNq1+tYagG3HGKFuBD/xghSGfbuERVizg1a8G3kX4wWMk+CQS4QcMIq2QGHumhfhlKFdbP9NnfAVFxtuwmM90gJ2C9r0+dl1qjbF29uvd/l+rN1hr7NLIHkXm5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUdMWgLQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUdMWgLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749914342; x=1781450342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ivNrAbsC27MAVgrwBZDQmbKEvb05ngbTj6Ly3E7OGeo=;
  b=eUdMWgLQTtLPg0BtBVPb6x75QJotty/Q3OEb30vcFgbBdW+A3TpXFVfy
   7NYqMAjLwfU4fV7xQoXYO4RlFwSzI1ob016NRV7N+Vr3zSWvhZgSXndjR
   6HMll9dIP+gjh7pdvQeDhpkccZxN1yGEFtue0OjlwXvqKgrygsbS0E9h7
   pjkwTt6wBaRIWdfE2b3fvEz0D0wUdQbB876awGOqX5Vf0AHQeKV/t9/rO
   jwRrjg6lFmI2FvJwd5vXCgi8xJ0aO56Dai2+vW62yXHlDeBngV5kygNPn
   x71PtqKb/FyomVpQ6PsR6mZrqKCTlnfAuLugtLpDiHAebX5gkbmbHqP6R
   Q==;
X-CSE-ConnectionGUID: pidXi3XJQ6e39KoFhqZAig==
X-CSE-MsgGUID: jVUiK5s2QfeGtrK4JOgL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="63147175"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63147175"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 08:19:02 -0700
X-CSE-ConnectionGUID: PlaEvGCkR8WhDohBjXODLg==
X-CSE-MsgGUID: qjXSmZcMTqSB2Scak6HXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="147971166"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2025 08:19:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQSeo-000DcJ-0G;
	Sat, 14 Jun 2025 15:18:58 +0000
Date: Sat, 14 Jun 2025 23:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] mm/page_alloc.c:1147:31: sparse:
 sparse: cast from restricted fpi_t
Message-ID: <202506142357.4ZasuUtb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6246d345f5505e8706cee3b1dfddc39f6079b4ea
commit: ff8496749db9c34c8a8c0056e4701e2c4a693bd7 [1/1] ANDROID: vendor_hooks: vendor hook for MM
config: x86_64-randconfig-r111-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142357.4ZasuUtb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142357.4ZasuUtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142357.4ZasuUtb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:1147:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:1147:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:1147:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:1147:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3571:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:3678:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
>> mm/page_alloc.c:1147:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3869:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:5610:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
>> mm/page_alloc.c:1147:31: sparse: sparse: cast from restricted fpi_t

vim +1147 mm/page_alloc.c

  1109	
  1110	/*
  1111	 * Freeing function for a buddy system allocator.
  1112	 *
  1113	 * The concept of a buddy system is to maintain direct-mapped table
  1114	 * (containing bit values) for memory blocks of various "orders".
  1115	 * The bottom level table contains the map for the smallest allocatable
  1116	 * units of memory (here, pages), and each level above it describes
  1117	 * pairs of units from the levels below, hence, "buddies".
  1118	 * At a high level, all that happens here is marking the table entry
  1119	 * at the bottom level available, and propagating the changes upward
  1120	 * as necessary, plus some accounting needed to play nicely with other
  1121	 * parts of the VM system.
  1122	 * At each level, we keep a list of pages, which are heads of continuous
  1123	 * free pages of length of (1 << order) and marked with PageBuddy.
  1124	 * Page's order is recorded in page_private(page) field.
  1125	 * So when we are allocating or freeing one, we can derive the state of the
  1126	 * other.  That is, if we allocate a small block, and both were
  1127	 * free, the remainder of the region must be split into blocks.
  1128	 * If a block is freed, and its buddy is also free, then this
  1129	 * triggers coalescing into a block of larger size.
  1130	 *
  1131	 * -- nyc
  1132	 */
  1133	
  1134	static inline void __free_one_page(struct page *page,
  1135			unsigned long pfn,
  1136			struct zone *zone, unsigned int order,
  1137			int migratetype, fpi_t fpi_flags)
  1138	{
  1139		struct capture_control *capc = task_capc(zone);
  1140		unsigned long buddy_pfn = 0;
  1141		unsigned long combined_pfn;
  1142		struct page *buddy;
  1143		bool to_tail;
  1144		bool bypass = false;
  1145	
  1146		trace_android_vh_free_one_page_bypass(page, zone, order,
> 1147			migratetype, (int)fpi_flags, &bypass);
  1148	
  1149		if (bypass)
  1150			return;
  1151	
  1152		VM_BUG_ON(!zone_is_initialized(zone));
  1153		VM_BUG_ON_PAGE(page->flags & PAGE_FLAGS_CHECK_AT_PREP, page);
  1154	
  1155		VM_BUG_ON(migratetype == -1);
  1156		if (likely(!is_migrate_isolate(migratetype)))
  1157			__mod_zone_freepage_state(zone, 1 << order, migratetype);
  1158	
  1159		VM_BUG_ON_PAGE(pfn & ((1 << order) - 1), page);
  1160		VM_BUG_ON_PAGE(bad_range(zone, page), page);
  1161	
  1162		while (order < MAX_ORDER - 1) {
  1163			if (compaction_capture(capc, page, order, migratetype)) {
  1164				__mod_zone_freepage_state(zone, -(1 << order),
  1165									migratetype);
  1166				return;
  1167			}
  1168	
  1169			buddy = find_buddy_page_pfn(page, pfn, order, &buddy_pfn);
  1170			if (!buddy)
  1171				goto done_merging;
  1172	
  1173			if (unlikely(order >= pageblock_order)) {
  1174				/*
  1175				 * We want to prevent merge between freepages on pageblock
  1176				 * without fallbacks and normal pageblock. Without this,
  1177				 * pageblock isolation could cause incorrect freepage or CMA
  1178				 * accounting or HIGHATOMIC accounting.
  1179				 */
  1180				int buddy_mt = get_pageblock_migratetype(buddy);
  1181	
  1182				if (migratetype != buddy_mt
  1183						&& (!migratetype_is_mergeable(migratetype) ||
  1184							!migratetype_is_mergeable(buddy_mt)))
  1185					goto done_merging;
  1186			}
  1187	
  1188			/*
  1189			 * Our buddy is free or it is CONFIG_DEBUG_PAGEALLOC guard page,
  1190			 * merge with it and move up one order.
  1191			 */
  1192			if (page_is_guard(buddy))
  1193				clear_page_guard(zone, buddy, order, migratetype);
  1194			else
  1195				del_page_from_free_list(buddy, zone, order);
  1196			combined_pfn = buddy_pfn & pfn;
  1197			page = page + (combined_pfn - pfn);
  1198			pfn = combined_pfn;
  1199			order++;
  1200		}
  1201	
  1202	done_merging:
  1203		set_buddy_order(page, order);
  1204	
  1205		if (fpi_flags & FPI_TO_TAIL)
  1206			to_tail = true;
  1207		else if (is_shuffle_order(order))
  1208			to_tail = shuffle_pick_tail();
  1209		else
  1210			to_tail = buddy_merge_likely(pfn, buddy_pfn, page, order);
  1211	
  1212		if (to_tail)
  1213			add_to_free_list_tail(page, zone, order, migratetype);
  1214		else
  1215			add_to_free_list(page, zone, order, migratetype);
  1216	
  1217		/* Notify page reporting subsystem of freed page */
  1218		if (!(fpi_flags & FPI_SKIP_REPORT_NOTIFY))
  1219			page_reporting_notify_free(order);
  1220	}
  1221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
