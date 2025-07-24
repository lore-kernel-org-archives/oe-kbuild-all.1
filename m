Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215061F872D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753380494; cv=none; b=Chha56BxD2xR1MLiNLvHlCdDFs/J5VmdJlGo+BSwiXM5Rbo0NLHWTsw1AwXqY9uZZuDV2uLxvTe0NILre1r6Ch/noQNMhJrMvKtqKWlMond2ztqUSDX9q+oPCMEo80ZVivdpO87pUs9Ix/ja+DQV/xz7R3oT477SilzaRnulHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753380494; c=relaxed/simple;
	bh=LTuJw3X+NfowN/EnyzrAibJ8QGzl3C8GyxR61fGznrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+8GkhhzkF96dY9MfPRq7aGeEKMrFvISo2LJwlZtVoWUZnECf2R+PVhzuMaBuj8FWZf3jwxBjnoL2xl09RsQyjBy9cc9jFffnSyV45nZ7J0VyXkbWL/x2UxNJJs/LWXv3n+gOlPYeUFll4CXiqZ7T4VYkHJ2ddYq4KxoK6eDEtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMhpc6CZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMhpc6CZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753380492; x=1784916492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LTuJw3X+NfowN/EnyzrAibJ8QGzl3C8GyxR61fGznrA=;
  b=fMhpc6CZVBMpstjIEDFChlWRtK8ZosbZtGurDII4pSRn/0iM7gzXW9Ft
   9YNcsBpuSDRlhOfCDE1Rdi8JjSuviS6gEjbqvmMyIZQocYR59hzBsLwjl
   itd06PRxXaUJmoHDWRVL/b7RpfFT6DTJK+BENPeeY+gdfZNF6um2N8dNW
   sLPfz69tDzXncJ8ct1aJTH5MLClF7gXdo8x5qknqx4xP14rJiaKe2W0EM
   fINug/Iy7lYPD9PAyJxbk2m4MRAroOGp1XgtSCcTEJqFAM29NpvdCnjy5
   3TWYY9O2koNXza230VFTuPTJAi4QfPQO06sUo5Dc/Xn7DnYr0sMbvuY90
   w==;
X-CSE-ConnectionGUID: eUx7IK6aRSWxHBijz0h2Pg==
X-CSE-MsgGUID: /Wanik/sRvKwYU+jdTo58w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55567032"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="55567032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 11:08:09 -0700
X-CSE-ConnectionGUID: HTsdSXDHRX6+5vtp8VS/mA==
X-CSE-MsgGUID: 3/Tvpo4uTduysjSTfigvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="159966701"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 11:08:08 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf0MP-00005D-1Z;
	Thu, 24 Jul 2025 18:08:05 +0000
Date: Thu, 24 Jul 2025 20:07:08 +0200
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:lru_note_cost.1 1/1] mm/vmscan.c:2076:27: error:
 incompatible pointer types passing 'struct scan_control **' to parameter of
 type 'struct scan_control *'; remove &
Message-ID: <202507242052.y0d0fxLh-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250724/202507242052.y0d0fxLh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507242052.y0d0fxLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507242052.y0d0fxLh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:2076:27: error: incompatible pointer types passing 'struct scan_control **' to parameter of type 'struct scan_control *'; remove & [-Werror,-Wincompatible-pointer-types]
    2076 |         if (!scan_balance_biased(&sc))
         |                                  ^~~
   mm/vmscan.c:1999:54: note: passing argument to parameter 'sc' here
    1999 | static bool scan_balance_biased(struct scan_control *sc)
         |                                                      ^
   mm/vmscan.c:2226:41: error: incompatible pointer types passing 'struct scan_control **' to parameter of type 'struct scan_control *'; remove & [-Werror,-Wincompatible-pointer-types]
    2226 |         if (nr_rotated && !scan_balance_biased(&sc))
         |                                                ^~~
   mm/vmscan.c:1999:54: note: passing argument to parameter 'sc' here
    1999 | static bool scan_balance_biased(struct scan_control *sc)
         |                                                      ^
   2 errors generated.


vim +2076 mm/vmscan.c

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
