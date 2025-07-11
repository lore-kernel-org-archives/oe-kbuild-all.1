Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2A2AE66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255300; cv=none; b=L4zI741gHDCfJwqmGYXLy5TO/hCh6+Fud3V96ZFMcpdNSMRJsU8u7c4T48z/BCqTnLq+vr5DOuX9JJ3vKDTMGPGt2I7QHni7fdiUQ4x1yEff3IHLOGf5YBDKSFw/eke8+/Xp/d2UpYyDcV3xu0HYWYQZYln78B+cBEdzxAEOfzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255300; c=relaxed/simple;
	bh=vZXHlED7p2CD1XgTgRcNUYhVanXZZCUAjfqH7hUrfzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GblCdUbZKVjyXTsfa8fpZfbTAKySCjhkqpf/z1zLrOt8fi76UsTdtwRGK/7oKFkjMDwshp/vqkBa7AUq/qrAbFMmI8HpYQZXRHoJmYuWHSAk1WvgdSrBvaRt6Z6OZGRTBaVbq83n3JqF2vXU+SysRvR8pQYBniK+Eef5SoqhIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bdw86xvV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bdw86xvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752255299; x=1783791299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vZXHlED7p2CD1XgTgRcNUYhVanXZZCUAjfqH7hUrfzI=;
  b=Bdw86xvVKvOH7YwByzED0gv/GM0Sac1gj5FD8EX5lQcCHj9KfIov806S
   ngdgi+kgQ/5vjR1yT+HO+LZFMqzat/ZcpVNDAYRwvA0w9LDkt0Rm0MO0d
   V5rW+Hyd/i7mT3UYdOWj8yExrs3YV4IgUDB9Cr8FuovPoX+IgBr4ysBG7
   yKmQ3thuEZsnqDiAZKObKxvWAWZy3MwBNGVzzKL9FQwkydIZ3YiDr5/sX
   PJLUgiqob0vz1+Y0pE+REgMnaeOg+KH54NPKroQ8C77jazpf1x4McyfJs
   cZdJPo+vzGbgKPji4am2d3om3KsDoZJd9QmcPUHmxFt8CgIToSWlYWJjX
   A==;
X-CSE-ConnectionGUID: XVTUhu7uRECuvbB9RkiQcA==
X-CSE-MsgGUID: X9DvVWxjT3uFx35Hlzuo+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54415885"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="54415885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 10:34:58 -0700
X-CSE-ConnectionGUID: cePHxF82Q+GBX80vC8bWdw==
X-CSE-MsgGUID: 7CruzdfeQ+qy1ADm0zFmbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="156758533"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2025 10:34:56 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaHeA-0006bv-0K;
	Fri, 11 Jul 2025 17:34:54 +0000
Date: Sat, 12 Jul 2025 01:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:lru_note_cost.1 1/1] mm/vmscan.c:2076:34: error: passing
 argument 1 of 'scan_balance_biased' from incompatible pointer type
Message-ID: <202507120159.xJZov3rL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git lru_note_cost.1
head:   d5e513cdf1ec233fa62389576f6ddb1c730d9994
commit: d5e513cdf1ec233fa62389576f6ddb1c730d9994 [1/1] mm: skip lru_note_cost() when scanning only file or anon
config: i386-buildonly-randconfig-002-20250712 (https://download.01.org/0day-ci/archive/20250712/202507120159.xJZov3rL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120159.xJZov3rL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120159.xJZov3rL-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'shrink_inactive_list':
>> mm/vmscan.c:2076:34: error: passing argument 1 of 'scan_balance_biased' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2076 |         if (!scan_balance_biased(&sc))
         |                                  ^~~
         |                                  |
         |                                  struct scan_control **
   mm/vmscan.c:1999:54: note: expected 'struct scan_control *' but argument is of type 'struct scan_control **'
    1999 | static bool scan_balance_biased(struct scan_control *sc)
         |                                 ~~~~~~~~~~~~~~~~~~~~~^~
   mm/vmscan.c: In function 'shrink_active_list':
   mm/vmscan.c:2226:48: error: passing argument 1 of 'scan_balance_biased' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2226 |         if (nr_rotated && !scan_balance_biased(&sc))
         |                                                ^~~
         |                                                |
         |                                                struct scan_control **
   mm/vmscan.c:1999:54: note: expected 'struct scan_control *' but argument is of type 'struct scan_control **'
    1999 | static bool scan_balance_biased(struct scan_control *sc)
         |                                 ~~~~~~~~~~~~~~~~~~~~~^~
   cc1: some warnings being treated as errors


vim +/scan_balance_biased +2076 mm/vmscan.c

  2009	
  2010	/*
  2011	 * shrink_inactive_list() is a helper for shrink_node().  It returns the number
  2012	 * of reclaimed pages
  2013	 */
  2014	static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
  2015			struct lruvec *lruvec, struct scan_control *sc,
  2016			enum lru_list lru)
  2017	{
  2018		LIST_HEAD(folio_list);
  2019		unsigned long nr_scanned;
  2020		unsigned int nr_reclaimed = 0;
  2021		unsigned long nr_taken;
  2022		struct reclaim_stat stat;
  2023		bool file = is_file_lru(lru);
  2024		enum vm_event_item item;
  2025		struct pglist_data *pgdat = lruvec_pgdat(lruvec);
  2026		bool stalled = false;
  2027	
  2028		while (unlikely(too_many_isolated(pgdat, file, sc))) {
  2029			if (stalled)
  2030				return 0;
  2031	
  2032			/* wait a bit for the reclaimer. */
  2033			stalled = true;
  2034			reclaim_throttle(pgdat, VMSCAN_THROTTLE_ISOLATED);
  2035	
  2036			/* We are about to die and free our memory. Return now. */
  2037			if (fatal_signal_pending(current))
  2038				return SWAP_CLUSTER_MAX;
  2039		}
  2040	
  2041		lru_add_drain();
  2042	
  2043		spin_lock_irq(&lruvec->lru_lock);
  2044	
  2045		nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &folio_list,
  2046					     &nr_scanned, sc, lru);
  2047	
  2048		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, nr_taken);
  2049		item = PGSCAN_KSWAPD + reclaimer_offset(sc);
  2050		if (!cgroup_reclaim(sc))
  2051			__count_vm_events(item, nr_scanned);
  2052		count_memcg_events(lruvec_memcg(lruvec), item, nr_scanned);
  2053		__count_vm_events(PGSCAN_ANON + file, nr_scanned);
  2054	
  2055		spin_unlock_irq(&lruvec->lru_lock);
  2056	
  2057		if (nr_taken == 0)
  2058			return 0;
  2059	
  2060		nr_reclaimed = shrink_folio_list(&folio_list, pgdat, sc, &stat, false,
  2061						 lruvec_memcg(lruvec));
  2062	
  2063		spin_lock_irq(&lruvec->lru_lock);
  2064		move_folios_to_lru(lruvec, &folio_list);
  2065	
  2066		__mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
  2067						stat.nr_demoted);
  2068		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -nr_taken);
  2069		item = PGSTEAL_KSWAPD + reclaimer_offset(sc);
  2070		if (!cgroup_reclaim(sc))
  2071			__count_vm_events(item, nr_reclaimed);
  2072		count_memcg_events(lruvec_memcg(lruvec), item, nr_reclaimed);
  2073		__count_vm_events(PGSTEAL_ANON + file, nr_reclaimed);
  2074		spin_unlock_irq(&lruvec->lru_lock);
  2075	
> 2076		if (!scan_balance_biased(&sc))
  2077			lru_note_cost(lruvec, file, stat.nr_pageout,
  2078				      nr_scanned - nr_reclaimed);
  2079	
  2080		/*
  2081		 * If dirty folios are scanned that are not queued for IO, it
  2082		 * implies that flushers are not doing their job. This can
  2083		 * happen when memory pressure pushes dirty folios to the end of
  2084		 * the LRU before the dirty limits are breached and the dirty
  2085		 * data has expired. It can also happen when the proportion of
  2086		 * dirty folios grows not through writes but through memory
  2087		 * pressure reclaiming all the clean cache. And in some cases,
  2088		 * the flushers simply cannot keep up with the allocation
  2089		 * rate. Nudge the flusher threads in case they are asleep.
  2090		 */
  2091		if (stat.nr_unqueued_dirty == nr_taken) {
  2092			wakeup_flusher_threads(WB_REASON_VMSCAN);
  2093			/*
  2094			 * For cgroupv1 dirty throttling is achieved by waking up
  2095			 * the kernel flusher here and later waiting on folios
  2096			 * which are in writeback to finish (see shrink_folio_list()).
  2097			 *
  2098			 * Flusher may not be able to issue writeback quickly
  2099			 * enough for cgroupv1 writeback throttling to work
  2100			 * on a large system.
  2101			 */
  2102			if (!writeback_throttling_sane(sc))
  2103				reclaim_throttle(pgdat, VMSCAN_THROTTLE_WRITEBACK);
  2104		}
  2105	
  2106		sc->nr.dirty += stat.nr_dirty;
  2107		sc->nr.congested += stat.nr_congested;
  2108		sc->nr.unqueued_dirty += stat.nr_unqueued_dirty;
  2109		sc->nr.writeback += stat.nr_writeback;
  2110		sc->nr.immediate += stat.nr_immediate;
  2111		sc->nr.taken += nr_taken;
  2112		if (file)
  2113			sc->nr.file_taken += nr_taken;
  2114	
  2115		trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
  2116				nr_scanned, nr_reclaimed, &stat, sc->priority, file);
  2117		return nr_reclaimed;
  2118	}
  2119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
