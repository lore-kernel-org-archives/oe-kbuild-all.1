Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A542DBC3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686089478; x=1717625478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hl+djzm5yN6FFh8Rw2TMawc/tI4umhvN/9QU4IAcNq8=;
  b=OlSVAAipJxvAQRY42wEaO3Y6MVpTPJJe86S8wbeLDdR/6EeQUjtifVkF
   Pi36/731c1VJ8deIDOmEO106/kjqSGHy+AHJezPSQnBsInk8mS8DRXOQ5
   fSf5PHtJnewQLo0lbk3eaQNuoPwdAFI0op8uZpMVE55nssl6rsiArPH6I
   z9UArLkh6BI3L+jGaYmlfjVdUI573z6a2LtOaNNdIwO+KbiG6sQWtyNJI
   Aa7BHTAw3bru7NQhWLQIyPGX8bN4OkrlO4M1tshhjyl2c/vCUbMBvq3lj
   Xup0Kr+d+oKQNgdvRzVk3EFCfAEH9mu3nHdQs+HgwhSPKIjyWHmgzn0+4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="346419299"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="346419299"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 15:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="821846142"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="821846142"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2023 15:11:16 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6etX-0005nT-2V;
	Tue, 06 Jun 2023 22:11:15 +0000
Date: Wed, 7 Jun 2023 06:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/4] mm/vmscan.c:6384:53: error:
 'struct scan_control' has no member named 'android_vendor_data1'
Message-ID: <202306070638.LXYPKjeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   312dfb3b7ec3beb9ff305db3b194e19eec7f2bc3
commit: 3e2dc32f5930c3928c4a241ad11ef752f13b196b [1/4] ANDROID: mm: create vendor hooks for memory reclaim
config: i386-randconfig-i054-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070638.LXYPKjeR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 3e2dc32f5930c3928c4a241ad11ef752f13b196b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070638.LXYPKjeR-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'should_continue_reclaim':
>> mm/vmscan.c:6384:53: error: 'struct scan_control' has no member named 'android_vendor_data1'
    6384 |         trace_android_vh_should_continue_reclaim(&sc->android_vendor_data1,
         |                                                     ^~
   mm/vmscan.c: In function 'modify_scan_control':
   mm/vmscan.c:6747:49: error: 'struct scan_control' has no member named 'android_vendor_data1'
    6747 |         trace_android_vh_modify_scan_control(&sc->android_vendor_data1,
         |                                                 ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +6384 mm/vmscan.c

  6325	
  6326	/*
  6327	 * Reclaim/compaction is used for high-order allocation requests. It reclaims
  6328	 * order-0 pages before compacting the zone. should_continue_reclaim() returns
  6329	 * true if more pages should be reclaimed such that when the page allocator
  6330	 * calls try_to_compact_pages() that it will have enough free pages to succeed.
  6331	 * It will give up earlier than that if there is difficulty reclaiming pages.
  6332	 */
  6333	static inline bool should_continue_reclaim(struct pglist_data *pgdat,
  6334						unsigned long nr_reclaimed,
  6335						struct scan_control *sc)
  6336	{
  6337		unsigned long pages_for_compaction;
  6338		unsigned long inactive_lru_pages;
  6339		int z;
  6340		bool continue_reclaim = true;
  6341	
  6342		/* If not in reclaim/compaction mode, stop */
  6343		if (!in_reclaim_compaction(sc))
  6344			return false;
  6345	
  6346		/*
  6347		 * Stop if we failed to reclaim any pages from the last SWAP_CLUSTER_MAX
  6348		 * number of pages that were scanned. This will return to the caller
  6349		 * with the risk reclaim/compaction and the resulting allocation attempt
  6350		 * fails. In the past we have tried harder for __GFP_RETRY_MAYFAIL
  6351		 * allocations through requiring that the full LRU list has been scanned
  6352		 * first, by assuming that zero delta of sc->nr_scanned means full LRU
  6353		 * scan, but that approximation was wrong, and there were corner cases
  6354		 * where always a non-zero amount of pages were scanned.
  6355		 */
  6356		if (!nr_reclaimed)
  6357			return false;
  6358	
  6359		/* If compaction would go ahead or the allocation would succeed, stop */
  6360		for (z = 0; z <= sc->reclaim_idx; z++) {
  6361			struct zone *zone = &pgdat->node_zones[z];
  6362			if (!managed_zone(zone))
  6363				continue;
  6364	
  6365			switch (compaction_suitable(zone, sc->order, 0, sc->reclaim_idx)) {
  6366			case COMPACT_SUCCESS:
  6367			case COMPACT_CONTINUE:
  6368				return false;
  6369			default:
  6370				/* check next zone */
  6371				;
  6372			}
  6373		}
  6374	
  6375		/*
  6376		 * If we have not reclaimed enough pages for compaction and the
  6377		 * inactive lists are large enough, continue reclaiming
  6378		 */
  6379		pages_for_compaction = compact_gap(sc->order);
  6380		inactive_lru_pages = node_page_state(pgdat, NR_INACTIVE_FILE);
  6381		if (can_reclaim_anon_pages(NULL, pgdat->node_id, sc))
  6382			inactive_lru_pages += node_page_state(pgdat, NR_INACTIVE_ANON);
  6383	
> 6384		trace_android_vh_should_continue_reclaim(&sc->android_vendor_data1,
  6385			&sc->nr_to_reclaim, &sc->nr_reclaimed, &continue_reclaim);
  6386		if (!continue_reclaim)
  6387			return false;
  6388	
  6389		return inactive_lru_pages > pages_for_compaction;
  6390	}
  6391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
