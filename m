Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206353EC839
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446106; cv=none; b=UxtoJAQmJaYG+c4hbXZYTKt5GzTW9cahKwu0V7sIrU06HiamWKr1dk5ShVtS07qTChXOrvq4DRDU2ehdhYTxhrCH/umWcne9vG16CD9kzSp4orSpOwi8gAE6bwjg2OLSxPSVr45zjXN/N187FLAlimdQ8Cl+u9G3TQ0UC1seWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446106; c=relaxed/simple;
	bh=sh2OIe5b4fTTBZI4skuY5L/Vj/kXbqF9dBE+SAp4zQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qj76iM1aF+tONV/bCcpbInfY1FERg0Codar9gHFQdsH2px2H3pxuQMU0lx2JY2Zi0xZNN+Ru2Ywxnp32icRc8EOZnVUJNe8117MFqG5SAljIX542xHEqNMKN2mEzoc5HTsTyc9rZgzi2+YNq85C+r/t8dD9yVlorxxh6ID1LAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0+QSloX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0+QSloX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791446105; x=1822982105;
  h=date:from:to:cc:subject:message-id;
  bh=sh2OIe5b4fTTBZI4skuY5L/Vj/kXbqF9dBE+SAp4zQI=;
  b=T0+QSloXdZKzHeTxPx8e2d9/o9ZUON21+wKjtCI3+XempgVXrSC3belf
   6G3TbuZDHgrAwPBUJF5975s7OxELJbHW47K7qa65V5+TN7Rpgmkf4Zlqa
   MpA30Kw17bGuh3ilpwtGxlH8982oNV4jK95kGi3PXVczeSLYSOqugGx7/
   1YQwFgWnPHQi3YR4xtkJHlszEsTutt3WOKTyoeHxcJFTXXicSR6ScNVJQ
   6c2Cu/v2hgvpdYHeKF7vtagdhmb2WKYkZfJ5N2A9z2QuGOTwtyI/x/chO
   mFRrqaLH0SS96MmxM7CA0XuaN3y6gH2jsffZFeyOlrmCuay1iTp8xGmgy
   A==;
X-CSE-ConnectionGUID: 50BbrSA/Sjartpe9OnSQ1w==
X-CSE-MsgGUID: jIyxPuXvT4yR5ZiH6SscCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="219825"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="219825"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:54:33 -0700
X-CSE-ConnectionGUID: cgH7EYn8SuuxINHeI4vEjw==
X-CSE-MsgGUID: LfrZdwiuRICCQeFXHF4xeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="72633"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2026 00:54:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEixR-0000000054V-3qW1;
	Thu, 08 Oct 2026 07:54:29 +0000
Date: Thu, 08 Oct 2026 09:54:00 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] mm/vmscan.c:5285:59:
 error: 'root_mem_cgroup' undeclared; did you mean 'parent_mem_cgroup'?
Message-ID: <202610080912.dCrKVMaZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c7ad8c94d6193bff72b385b1cf3fb753de09f780
commit: aa438a63587f2d9dc1888265365ff3de338ba16f [0/2] ANDROID: mm: mglru: invoke root shrinker before memcg-specific ones
config: x86_64-randconfig-2101-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080912.dCrKVMaZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080912.dCrKVMaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080912.dCrKVMaZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:4695:6: warning: no previous prototype for 'isolate_folio' [-Wmissing-prototypes]
    4695 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^~~~~~~~~~~~~
   mm/vmscan.c: In function 'lru_gen_shrink_node':
>> mm/vmscan.c:5285:59: error: 'root_mem_cgroup' undeclared (first use in this function); did you mean 'parent_mem_cgroup'?
    5285 |                 shrink_slab(sc->gfp_mask, pgdat->node_id, root_mem_cgroup,
         |                                                           ^~~~~~~~~~~~~~~
         |                                                           parent_mem_cgroup
   mm/vmscan.c:5285:59: note: each undeclared identifier is reported only once for each function it appears in


vim +5285 mm/vmscan.c

  5255	
  5256	static void lru_gen_shrink_node(struct pglist_data *pgdat, struct scan_control *sc)
  5257	{
  5258		struct blk_plug plug;
  5259		unsigned long reclaimed = sc->nr_reclaimed;
  5260	
  5261		VM_WARN_ON_ONCE(!root_reclaim(sc));
  5262	
  5263		/*
  5264		 * Unmapped clean folios are already prioritized. Scanning for more of
  5265		 * them is likely futile and can cause high reclaim latency when there
  5266		 * is a large number of memcgs.
  5267		 */
  5268		if (!sc->may_writepage || !sc->may_unmap)
  5269			goto done;
  5270	
  5271		lru_add_drain();
  5272	
  5273		blk_start_plug(&plug);
  5274	
  5275		set_mm_walk(pgdat, sc->proactive);
  5276	
  5277		set_initial_priority(pgdat, sc);
  5278	
  5279		if (current_is_kswapd())
  5280			sc->nr_reclaimed = 0;
  5281	
  5282		if (mem_cgroup_disabled()) {
  5283			shrink_one(&pgdat->__lruvec, sc);
  5284		} else {
> 5285			shrink_slab(sc->gfp_mask, pgdat->node_id, root_mem_cgroup,
  5286				    sc->priority);
  5287			if (sc->nr_reclaimed < sc->nr_to_reclaim)
  5288				shrink_many(pgdat, sc);
  5289		}
  5290		if (current_is_kswapd())
  5291			sc->nr_reclaimed += reclaimed;
  5292	
  5293		clear_mm_walk();
  5294	
  5295		blk_finish_plug(&plug);
  5296	done:
  5297		if (sc->nr_reclaimed > reclaimed)
  5298			pgdat->kswapd_failures = 0;
  5299	}
  5300	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
