Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA55521CC44
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756148633; cv=none; b=W7rRjcUPhTf9YZ68OCTolIR6v7mfN1Hxlpj6ow5CfkU08i6FcKwnKAy2DFXu5e0K7k0+MgIBRSAeyrvI/uQBYWqZ1+7+0mpIKFUcvWtI4j16sMAgTHGlHKvA/psKECUJGGDIRDRodK2NJCy/55xJovE0VgAuMVfFMZV8LLC0Vys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756148633; c=relaxed/simple;
	bh=zhuhRNMhZZPdQH0Nk7F8pSVd3sfOGWRA5uoVWFNRWXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqoQ6SlpQFHf5Tn0eZlukLlbMus8kwUI0FbhzELGJEERpNl3HYtUv7TSkjQ2TeJUZhrwogxlhfs0B8WyJUvMTgL0YJ85z56gtKovqbI5Bp0Ftf6wJCG+B6bfngXPGS/6tmzxm1aDvcGdP0YjJyr5uu5kQ8DoECXpRcm0tiDrHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2T/VHbr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2T/VHbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756148631; x=1787684631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhuhRNMhZZPdQH0Nk7F8pSVd3sfOGWRA5uoVWFNRWXA=;
  b=L2T/VHbrlxQj3wr2Um36qFrZ4I6AslioBZZJKKYXr05CabFTJ9GgyGLu
   2v10aXMv11Q8nkgcWO2IQwiyC1LhnENemiOgl8qqoR2RYQ3/4n6Mcq3vt
   H6GWRI0Zay5JaYvOuqEYmAEv5u7aFUUKmI0fAULP1GWoNbmT9ojuL2/zA
   c1D99C0LchGjXpvhEG3XkT0YHCWarkA7oV5IxMJoj3UbYFwYjwa9LDYqt
   sDq6JuIwOQrOr6ZkRzazD3peTYU/LGtmjyFOT5++MnTQ2D6o3joEoLVvu
   VdHQTVE++2j/R9AINMFUOWkAw4ZAbQjgC3tF4DK5SxISGU0vp46WJ24AR
   w==;
X-CSE-ConnectionGUID: rMKOe+82Rkm/j+fyrl5fYw==
X-CSE-MsgGUID: CgWnb13fQJqYRBEmwaL4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58078609"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="58078609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:03:49 -0700
X-CSE-ConnectionGUID: VotcSsvqQ5G4CdeiPtb1cQ==
X-CSE-MsgGUID: K0ZZqjy2SV2rZ3NkU2mcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="174647307"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Aug 2025 12:03:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqcTp-000Nwb-2c;
	Mon, 25 Aug 2025 19:03:45 +0000
Date: Tue, 26 Aug 2025 03:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/memory_hotplug.c:664:12: warning: no previous prototype for function
 '__move_pfn_range_to_zone'
Message-ID: <202508260242.OmVRDV6a-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-GNR-perf-uncore-ANBZ24140
head:   5b97140220e2f9196fa5de48f6be468691f8b43b
commit: 6c4a83f3c62b8ef3f8bd1ec3c1d374bf0e12713d [0/2] anolis: mm/memory_hotplug: refactor move_pfn_range_to_zone()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250826/202508260242.OmVRDV6a-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508260242.OmVRDV6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260242.OmVRDV6a-lkp@intel.com/

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
