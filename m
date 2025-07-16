Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339F341AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670583; cv=none; b=oLs68NLsenOKA0TzIfWg6gvdTJYKhsY7KRHtpOOAyarvgWw9vCqDHKEnhfrPlYfMmmkufdxHxobf+BtKmOhce+Cq7xui+uiXY3/IS1e/NqjsEDnyvwGgjyghC05S/0xzpUNn5iHJmRxTBRQjB7bMAS7lRjFT5T8rfLAGyqWJbj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670583; c=relaxed/simple;
	bh=uvZNAOESG0NTD9jqV5GGWbMCLK+aHeeqVad8Ir5EvIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTyCtWW7jjfQ4WxQ4/WbTfP9oGwKSJW6S+x6FL4vwZeMvVqTor3BuSVQywB587nkU98qWteEscJupEzLv3vGxZD81WXuP+xKeRhfqNIAvh661T+j+06gskp3WiJbt1VTO4mEyGpCM6hnqoz1WnwVGSjkKPUb5rh9ii9Qh12Upjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vpe9Ynlq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vpe9Ynlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752670581; x=1784206581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvZNAOESG0NTD9jqV5GGWbMCLK+aHeeqVad8Ir5EvIM=;
  b=Vpe9YnlqBKmA3JsvEsJHEunGLL+cmfK8QkIausPiOH1a0IYTJTyuCrNy
   wU6Bx0Ki0QgoUrVpbGK1uG1HL59tq3xMEPLVQMgEzIf45uHT+Ga+AQKIq
   bbHwJb111WaLfMnOkSTTQ1UK1PBLthzNjZuXs4gFNuBnN/D78Ock8XnGG
   Mtw+jcSWTxwA5/BlOi8XKi/fIReXgSfLXJhywXb55eLx1RYWT3agqFsHq
   Gsvsq3cE1IWLZennVh7YSZrZw6YGBvZ2giQ2ASsNXQSl1sbONtyFfk2fD
   ZXOHUrSGOI7gJ+9+0xaWkOvRCZe+91CxdpdcZIKglyGtqfrsgy/3Y70Jh
   A==;
X-CSE-ConnectionGUID: txRI3L9+QGe2qWv2XsDwyg==
X-CSE-MsgGUID: tNdGjMAsQLuv3XeyEGgJWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57522116"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="57522116"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 05:56:21 -0700
X-CSE-ConnectionGUID: 7HxZLb6uTTagKKdS7dGh3g==
X-CSE-MsgGUID: glCnnYDIRhqh5u0eNgUrsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="163133448"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2025 05:56:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc1gH-000COx-1Z;
	Wed, 16 Jul 2025 12:56:17 +0000
Date: Wed, 16 Jul 2025 20:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 6/6] mm/memory_hotplug.c:664:12:
 warning: no previous prototype for function '__move_pfn_range_to_zone'
Message-ID: <202507162044.llc5U1lr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   1535649a0387dabbc4baec56dbc329c3046d3ad1
commit: 6c4a83f3c62b8ef3f8bd1ec3c1d374bf0e12713d [6/6] anolis: mm/memory_hotplug: refactor move_pfn_range_to_zone()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250716/202507162044.llc5U1lr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507162044.llc5U1lr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507162044.llc5U1lr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:664:12: warning: no previous prototype for function '__move_pfn_range_to_zone' [-Wmissing-prototypes]
     664 | void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
         |            ^
   mm/memory_hotplug.c:664:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     664 | void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
         | ^
         | static 
   mm/memory_hotplug.c:995:6: warning: no previous prototype for function '__adjust_present_page_count' [-Wmissing-prototypes]
     995 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         |      ^
   mm/memory_hotplug.c:995:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     995 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         | ^
         | static 
   2 warnings generated.


vim +/__move_pfn_range_to_zone +664 mm/memory_hotplug.c

   663	
 > 664	void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
   665					  unsigned long nr_pages, struct vmem_altmap *altmap,
   666					  int migratetype, int phase)
   667	{
   668		struct pglist_data *pgdat = zone->zone_pgdat;
   669		int nid = pgdat->node_id;
   670		unsigned long flags;
   671	
   672		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_PREPARE) {
   673	#ifdef KIDLED_AGE_NOT_IN_PAGE_FLAGS
   674			kidled_free_page_age(pgdat);
   675	#endif
   676			clear_zone_contiguous(zone);
   677	
   678			/* TODO Huh pgdat is irqsave while zone is not. It used to be like that before */
   679			pgdat_resize_lock(pgdat, &flags);
   680			zone_span_writelock(zone);
   681			if (zone_is_empty(zone))
   682				init_currently_empty_zone(zone, start_pfn, nr_pages);
   683			resize_zone_range(zone, start_pfn, nr_pages);
   684			zone_span_writeunlock(zone);
   685			resize_pgdat_range(pgdat, start_pfn, nr_pages);
   686			pgdat_resize_unlock(pgdat, &flags);
   687		}
   688	
   689		/*
   690		 * TODO now we have a visible range of pages which are not associated
   691		 * with their zone properly. Not nice but set_pfnblock_flags_mask
   692		 * expects the zone spans the pfn range. All the pages in the range
   693		 * are reserved so nobody should be touching them so we should be safe
   694		 */
   695		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_DEFERRED)
   696			memmap_init_zone(nr_pages, nid, zone_idx(zone), start_pfn, 0,
   697				 MEMINIT_HOTPLUG, altmap, migratetype);
   698	
   699		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_PREPARE)
   700			set_zone_contiguous(zone);
   701	}
   702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
