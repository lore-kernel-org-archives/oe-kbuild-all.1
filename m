Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210823B60A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Oct 2025 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759359720; cv=none; b=ZEy8BIqLRGITCvJcba2F2LzWFzpp7JJ2DZEBNOC1VbBr1B6zP8NDC7/3Mqm3OsVn68LqWf6BbTlmjGCAXyHz/eW/ojOhOe+OYx4iLa/j5OXyXqdc9zTFMs2tI+aGBxTWG7qWf9AEJHDmIbQ+khpTZGA7tEwFRdkpN6+nyxFwXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759359720; c=relaxed/simple;
	bh=potifNh3695uR4Au2dTvJq3n/GvksCm56OimOrClK4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KIrMHerbd5XmGtCcmk2siyGnYS1A9Ccu/gaeN7/K2jyvR5ZW4NgCnIMKXIc7094P9K09AEIIKOyYBbNofEZVYE13N8sATdNMCYBjbn3Kvr+a/IFuPRED5O/IGzmp99IbUznNR4PYmPtF7bisEk/bET2hAKscunGc51xzF9NUowk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQZOu9lf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQZOu9lf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759359719; x=1790895719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=potifNh3695uR4Au2dTvJq3n/GvksCm56OimOrClK4o=;
  b=JQZOu9lf0OV2QC4/v3gwE5pdKNn7PjNgvgQtfl0DFYp6+extkP5VDPzD
   dGF2Oms77ACO51QGxk3ceLtXmovqvLRKkPPTrWMLJHc5DqermVN1E9jfc
   WIJnPisyMOkr86tWPt2E1WhrgnqNYMt8/3py3NfqOmIt8U7uR9Motu81n
   vRAL4zsOFDwkgCZpImQE6lbfV16KMGigiFKgj9ev5A8fdyFjP94AAj19X
   X6IMBYP2bYdEK5g2fqkVZ+MsEl2umEuid3c/+Qf3S28/ErcoNcoIN7abo
   w6ja4SrOH6h+QOExSvz13arknP+fYnmG2EhPsQBkWNBvMAnMgSjb/wpu6
   w==;
X-CSE-ConnectionGUID: 6cCHDtQeSWCG8zcEaNE0Qw==
X-CSE-MsgGUID: U2liZr0fQTK5z5EJTCer4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61686490"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="61686490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 16:01:58 -0700
X-CSE-ConnectionGUID: WAtnrj8VTBm501YOKHI5Dw==
X-CSE-MsgGUID: jnxsRPs7Sd6ULzlbyNbILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="179350365"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2025 16:01:57 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v45pa-0003QR-2e;
	Wed, 01 Oct 2025 23:01:54 +0000
Date: Thu, 2 Oct 2025 07:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/memory_hotplug.c:664:12:
 warning: no previous prototype for function '__move_pfn_range_to_zone'
Message-ID: <202510020650.UhtQ6RNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6e46858a22077fce652e4757d5624bf5816c6639
commit: 6c4a83f3c62b8ef3f8bd1ec3c1d374bf0e12713d [2/2] anolis: mm/memory_hotplug: refactor move_pfn_range_to_zone()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251002/202510020650.UhtQ6RNI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510020650.UhtQ6RNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510020650.UhtQ6RNI-lkp@intel.com/

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
