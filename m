Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB543165
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692302; cv=none; b=iHgpbtJMyfOtyHllizGIIO0B7dbREb/fkIwABr3flSu+kMT1ovuxvXoiIQIJf6kBjDJxYrKYoSSLmWXhYdjcfiVFjM2tL3+StJyAfTmExLSOWZb/U/eNP0Y4pdExHz0ID7CxDZWVXGHqC2quEVK8XMAsNM/AlbZ1nTd1c41Fga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692302; c=relaxed/simple;
	bh=p8O9Jwkx8+GAXoI8bhTSOZIxgTdtERpQR7OR2KsP17M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcGGFnfiJbOqEkoNCmbgYbtYT6g55EWjcUa9jUBruW44ji9PM8EjN431YSM+goXcNzfeRMlnEWcrETx2f4HJG3HQmY2ZA5Y/98J8WSBJmhAnTmLgAfyBaiy/z/XumtglGGJggBKYRiUmTV5twItB79Jqi30uHS2sxlDHYa8HIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAVKQHF6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAVKQHF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718692301; x=1750228301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8O9Jwkx8+GAXoI8bhTSOZIxgTdtERpQR7OR2KsP17M=;
  b=nAVKQHF6llpv1Ff65uE7nziDg7MC+hNG+WSTBHx1Mqlc1yezgCYlshWT
   UlmKZNEgfn98NYwJsXx4OsKrEBhUN8NmXcqkxO1OvIQwIC2YE18hZLpGi
   Ts3WNWOY733tg5q23vbWaWXAWegGBRQ4s4lMQMXcIv5HKtEOQTytlJNcH
   DhgRupGpz/pfvaJwg/w7VGTzS7vEg/vreWhh3bGD3Kak/vfp3t7oKXyRH
   XwNDGjutWpew1zjnCUcKJutqNlTiocZrNC9yEFyL2AySSI2yXHyYe5Blf
   m5zOZa7wwRMzFVMDo/wENQG8ZZ0RG+IF2jo9bDIq/Y0mrwMLF5lyWXRQz
   Q==;
X-CSE-ConnectionGUID: XGvxTjr8R5OrqQuG8Xo5nQ==
X-CSE-MsgGUID: WrfFW7p+Rbmbai4KLC03Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15419527"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15419527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 23:31:38 -0700
X-CSE-ConnectionGUID: s+P/mnA+S7qXdMmQMGk3wA==
X-CSE-MsgGUID: whedfBPjTsOdUz/xSaWkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42144588"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2024 23:31:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJSNS-0005Gw-1q;
	Tue, 18 Jun 2024 06:31:34 +0000
Date: Tue, 18 Jun 2024 14:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2] mm/vmscan.c:6575:53: error:
 'struct scan_control' has no member named 'android_vendor_data1'
Message-ID: <202406181635.F7vzsyPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7ee86e5b15bf7d3e3970570ab1886afb42b898e0
commit: 047f3eded89ec3a0095877a7b4c4f79d52c55289 [1/2] ANDROID: mm: create vendor hooks for memory reclaim
config: i386-randconfig-141-20240618 (https://download.01.org/0day-ci/archive/20240618/202406181635.F7vzsyPJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181635.F7vzsyPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181635.F7vzsyPJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:1043:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
    1043 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'should_continue_reclaim':
>> mm/vmscan.c:6575:53: error: 'struct scan_control' has no member named 'android_vendor_data1'
    6575 |         trace_android_vh_should_continue_reclaim(&sc->android_vendor_data1,
         |                                                     ^~
   mm/vmscan.c: In function 'modify_scan_control':
   mm/vmscan.c:6936:49: error: 'struct scan_control' has no member named 'android_vendor_data1'
    6936 |         trace_android_vh_modify_scan_control(&sc->android_vendor_data1,
         |                                                 ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +6575 mm/vmscan.c

  6517	
  6518	/*
  6519	 * Reclaim/compaction is used for high-order allocation requests. It reclaims
  6520	 * order-0 pages before compacting the zone. should_continue_reclaim() returns
  6521	 * true if more pages should be reclaimed such that when the page allocator
  6522	 * calls try_to_compact_pages() that it will have enough free pages to succeed.
  6523	 * It will give up earlier than that if there is difficulty reclaiming pages.
  6524	 */
  6525	static inline bool should_continue_reclaim(struct pglist_data *pgdat,
  6526						unsigned long nr_reclaimed,
  6527						struct scan_control *sc)
  6528	{
  6529		unsigned long pages_for_compaction;
  6530		unsigned long inactive_lru_pages;
  6531		int z;
  6532		bool continue_reclaim = true;
  6533	
  6534		/* If not in reclaim/compaction mode, stop */
  6535		if (!in_reclaim_compaction(sc))
  6536			return false;
  6537	
  6538		/*
  6539		 * Stop if we failed to reclaim any pages from the last SWAP_CLUSTER_MAX
  6540		 * number of pages that were scanned. This will return to the caller
  6541		 * with the risk reclaim/compaction and the resulting allocation attempt
  6542		 * fails. In the past we have tried harder for __GFP_RETRY_MAYFAIL
  6543		 * allocations through requiring that the full LRU list has been scanned
  6544		 * first, by assuming that zero delta of sc->nr_scanned means full LRU
  6545		 * scan, but that approximation was wrong, and there were corner cases
  6546		 * where always a non-zero amount of pages were scanned.
  6547		 */
  6548		if (!nr_reclaimed)
  6549			return false;
  6550	
  6551		/* If compaction would go ahead or the allocation would succeed, stop */
  6552		for (z = 0; z <= sc->reclaim_idx; z++) {
  6553			struct zone *zone = &pgdat->node_zones[z];
  6554			if (!managed_zone(zone))
  6555				continue;
  6556	
  6557			/* Allocation can already succeed, nothing to do */
  6558			if (zone_watermark_ok(zone, sc->order, min_wmark_pages(zone),
  6559					      sc->reclaim_idx, 0))
  6560				return false;
  6561	
  6562			if (compaction_suitable(zone, sc->order, sc->reclaim_idx))
  6563				return false;
  6564		}
  6565	
  6566		/*
  6567		 * If we have not reclaimed enough pages for compaction and the
  6568		 * inactive lists are large enough, continue reclaiming
  6569		 */
  6570		pages_for_compaction = compact_gap(sc->order);
  6571		inactive_lru_pages = node_page_state(pgdat, NR_INACTIVE_FILE);
  6572		if (can_reclaim_anon_pages(NULL, pgdat->node_id, sc))
  6573			inactive_lru_pages += node_page_state(pgdat, NR_INACTIVE_ANON);
  6574	
> 6575		trace_android_vh_should_continue_reclaim(&sc->android_vendor_data1,
  6576			&sc->nr_to_reclaim, &sc->nr_reclaimed, &continue_reclaim);
  6577		if (!continue_reclaim)
  6578			return false;
  6579	
  6580		return inactive_lru_pages > pages_for_compaction;
  6581	}
  6582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
