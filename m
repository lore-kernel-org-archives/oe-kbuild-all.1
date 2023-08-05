Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2E1381
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 04:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691210477; x=1722746477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a7/Jr8fTHwApa11pziKbW5GeuOaqvV5geKlMz8Klkag=;
  b=DDdUfEze3XwluJtJ5dCEJ+A1ICQUcT0altqBmAcT9lr7TIiwVlhGUe/9
   18lHyx/vk1s+US/O+/kQxlKdRZ8W8z4OjdADPmcNv8v8JEI5y+zjtsxkz
   yjsZpJhup9okO0kd7CsFKdwiS5XfveN/uyMbga7/rAXDPxA05UP4r3XWl
   6qXKFEF1QIwzvUSCwbjw5KKqCpkeXmP0UXddgkIEL+oliz3TyOd7/fybd
   Y+Kt3YSBOxzAgOZuWxbqqLEznjrpe5h95CJxKvSMQYk1dvI0Z/tAxcQKo
   ShkCntPxFgnM/ajko2BCBamj9DdRzaRujspuJZuzxVZaIUlupZexxEItp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373037940"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="373037940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 21:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="904108098"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="904108098"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Aug 2023 21:41:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS96I-0003Ju-2Q;
	Sat, 05 Aug 2023 04:41:14 +0000
Date: Sat, 5 Aug 2023 12:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] mm/page_alloc.c:1167:31: sparse:
 sparse: cast from restricted fpi_t
Message-ID: <202308051227.nS4zaaAP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f9dbe76124d63e620471a49c356ea93dfcaa7ce8
commit: 00b1ba8b15f9d161d165afee26d7409a12deca98 [1/1] ANDROID: vendor_hooks: vendor hook for MM
config: i386-randconfig-i063-20230730 (https://download.01.org/0day-ci/archive/20230805/202308051227.nS4zaaAP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051227.nS4zaaAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051227.nS4zaaAP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:1167:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:1167:31: sparse: sparse: cast from restricted fpi_t
>> mm/page_alloc.c:1167:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3614:9: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:3693:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
>> mm/page_alloc.c:1167:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3895:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:383:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:383:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:5622:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   include/linux/gfp.h:383:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:383:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:383:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:383:27: sparse: sparse: restricted gfp_t degrades to integer

vim +1167 mm/page_alloc.c

  1128	
  1129	/*
  1130	 * Freeing function for a buddy system allocator.
  1131	 *
  1132	 * The concept of a buddy system is to maintain direct-mapped table
  1133	 * (containing bit values) for memory blocks of various "orders".
  1134	 * The bottom level table contains the map for the smallest allocatable
  1135	 * units of memory (here, pages), and each level above it describes
  1136	 * pairs of units from the levels below, hence, "buddies".
  1137	 * At a high level, all that happens here is marking the table entry
  1138	 * at the bottom level available, and propagating the changes upward
  1139	 * as necessary, plus some accounting needed to play nicely with other
  1140	 * parts of the VM system.
  1141	 * At each level, we keep a list of pages, which are heads of continuous
  1142	 * free pages of length of (1 << order) and marked with PageBuddy.
  1143	 * Page's order is recorded in page_private(page) field.
  1144	 * So when we are allocating or freeing one, we can derive the state of the
  1145	 * other.  That is, if we allocate a small block, and both were
  1146	 * free, the remainder of the region must be split into blocks.
  1147	 * If a block is freed, and its buddy is also free, then this
  1148	 * triggers coalescing into a block of larger size.
  1149	 *
  1150	 * -- nyc
  1151	 */
  1152	
  1153	static inline void __free_one_page(struct page *page,
  1154			unsigned long pfn,
  1155			struct zone *zone, unsigned int order,
  1156			int migratetype, fpi_t fpi_flags)
  1157	{
  1158		struct capture_control *capc = task_capc(zone);
  1159		unsigned long buddy_pfn;
  1160		unsigned long combined_pfn;
  1161		unsigned int max_order;
  1162		struct page *buddy;
  1163		bool to_tail;
  1164		bool bypass = false;
  1165	
  1166		trace_android_vh_free_one_page_bypass(page, zone, order,
> 1167			migratetype, (int)fpi_flags, &bypass);
  1168	
  1169		if (bypass)
  1170			return;
  1171	
  1172		max_order = min_t(unsigned int, MAX_ORDER - 1, pageblock_order);
  1173	
  1174		VM_BUG_ON(!zone_is_initialized(zone));
  1175		VM_BUG_ON_PAGE(page->flags & PAGE_FLAGS_CHECK_AT_PREP, page);
  1176	
  1177		VM_BUG_ON(migratetype == -1);
  1178		if (likely(!is_migrate_isolate(migratetype)))
  1179			__mod_zone_freepage_state(zone, 1 << order, migratetype);
  1180	
  1181		VM_BUG_ON_PAGE(pfn & ((1 << order) - 1), page);
  1182		VM_BUG_ON_PAGE(bad_range(zone, page), page);
  1183	
  1184	continue_merging:
  1185		while (order < max_order) {
  1186			if (compaction_capture(capc, page, order, migratetype)) {
  1187				__mod_zone_freepage_state(zone, -(1 << order),
  1188									migratetype);
  1189				return;
  1190			}
  1191			buddy_pfn = __find_buddy_pfn(pfn, order);
  1192			buddy = page + (buddy_pfn - pfn);
  1193	
  1194			if (!page_is_buddy(page, buddy, order))
  1195				goto done_merging;
  1196			/*
  1197			 * Our buddy is free or it is CONFIG_DEBUG_PAGEALLOC guard page,
  1198			 * merge with it and move up one order.
  1199			 */
  1200			if (page_is_guard(buddy))
  1201				clear_page_guard(zone, buddy, order, migratetype);
  1202			else
  1203				del_page_from_free_list(buddy, zone, order);
  1204			combined_pfn = buddy_pfn & pfn;
  1205			page = page + (combined_pfn - pfn);
  1206			pfn = combined_pfn;
  1207			order++;
  1208		}
  1209		if (order < MAX_ORDER - 1) {
  1210			/* If we are here, it means order is >= pageblock_order.
  1211			 * We want to prevent merge between freepages on isolate
  1212			 * pageblock and normal pageblock. Without this, pageblock
  1213			 * isolation could cause incorrect freepage or CMA accounting.
  1214			 *
  1215			 * We don't want to hit this code for the more frequent
  1216			 * low-order merging.
  1217			 */
  1218			if (unlikely(has_isolate_pageblock(zone))) {
  1219				int buddy_mt;
  1220	
  1221				buddy_pfn = __find_buddy_pfn(pfn, order);
  1222				buddy = page + (buddy_pfn - pfn);
  1223				buddy_mt = get_pageblock_migratetype(buddy);
  1224	
  1225				if (migratetype != buddy_mt
  1226						&& (is_migrate_isolate(migratetype) ||
  1227							is_migrate_isolate(buddy_mt)))
  1228					goto done_merging;
  1229			}
  1230			max_order = order + 1;
  1231			goto continue_merging;
  1232		}
  1233	
  1234	done_merging:
  1235		set_buddy_order(page, order);
  1236	
  1237		if (fpi_flags & FPI_TO_TAIL)
  1238			to_tail = true;
  1239		else if (is_shuffle_order(order))
  1240			to_tail = shuffle_pick_tail();
  1241		else
  1242			to_tail = buddy_merge_likely(pfn, buddy_pfn, page, order);
  1243	
  1244		if (to_tail)
  1245			add_to_free_list_tail(page, zone, order, migratetype);
  1246		else
  1247			add_to_free_list(page, zone, order, migratetype);
  1248	
  1249		/* Notify page reporting subsystem of freed page */
  1250		if (!(fpi_flags & FPI_SKIP_REPORT_NOTIFY))
  1251			page_reporting_notify_free(order);
  1252	}
  1253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
