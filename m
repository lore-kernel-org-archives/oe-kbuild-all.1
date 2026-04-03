Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191FE37C915
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205661; cv=none; b=pmrRaLg+YlT31AWmW72t877pYUrQH8zQIOHrNFIV2YlAd+irzlk0LlhgaW5tBecCNUmC/jwgau5ehvW12DlWW+azCAlz/HtRvZWGD3pz/vYSYZBVNHIPQaauz5vqAIYt8g6WaAi6P2UDRW0xR2KGymKy+6sCuGNFNJodXntTJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205661; c=relaxed/simple;
	bh=RoRC5ZUIIjr2XnnKUrMMp45Q6qVhoCZSHRhjWLqPjIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OEeZnPNetoHFm3BN4S1qynDzVI1NwCuPf1VhzuRBTCySGPm2TvISQfl/NZlf8ibbS7pOd5LaPduSdUwmopM9n/7uWyBNRWnQXvSo0wsq6/HBrLieGNwLmEFzwZOV2Gk7sCC7Y5NIY5y9de5bcCk6t71KCmG46qqPEeKWIo/o8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7L1lLIM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7L1lLIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205661; x=1806741661;
  h=date:from:to:cc:subject:message-id;
  bh=RoRC5ZUIIjr2XnnKUrMMp45Q6qVhoCZSHRhjWLqPjIg=;
  b=c7L1lLIMQebgQUr/6HwKQ2A2VCvBpWMZo1L0pMFW15eykQ0KKGKNNapb
   NOcySOhQZe71qYyaKXQQK5C7pCJO7xsbU+exWYX4pv1/8JtmNQHck7Ua5
   Gu9p52d/lMdYIW+5/Q6iahsoHp809RjMp4HgVdHtjR9aSvviNMhOuIBHD
   dH2GZ/4cty1HtRntIF7PHH6x9WR8MmcfdYgidRRamG4jXvb6KSaV4lFuv
   L6uPYLIDNPxV8JeKH6wZ1kpTzY2cYeSAXA1u5pjgBU00WYn1CFZBJ9ebC
   fQKQ1Wdji+XX6xOly/zuZ8Mm18r1B9pPPLS+lgULnJI8GETCIATxXCuFG
   A==;
X-CSE-ConnectionGUID: PncE0BSVTr2J2doy9po6fw==
X-CSE-MsgGUID: AkCTYlzIQOGao4Am12efxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156626"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156626"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:40:59 -0700
X-CSE-ConnectionGUID: Jd+R/DvOT6m6v0012h7l9A==
X-CSE-MsgGUID: EEycJ3wkRfCKC2Tdp48e/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="224370756"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2026 01:40:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a5G-0000000012F-0h3C;
	Fri, 03 Apr 2026 08:40:54 +0000
Date: Fri, 03 Apr 2026 16:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 1/1]
 mm/vmscan.c:1039:15: warning: no previous prototype for function
 'shrink_slab'
Message-ID: <202604021946.fRbWvrdj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   1a029ed73e0c73261faa5c9cfc848e08ce285151
commit: 12ecd25a93059a8a26f97f90b7e015a82336ba56 [1/1] ANDROID: vendor_hooks: export shrink_slab
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260402/202604021946.fRbWvrdj-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021946.fRbWvrdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021946.fRbWvrdj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2191:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:674:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     674 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/vmscan.c:1039:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
    1039 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:1039:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1039 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
   mm/vmscan.c:2403:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2403 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2910:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2910 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2911:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2911 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:5085:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    5085 |                         __count_zid_vm_events(PGSCAN_SKIP, zone, skipped);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:6897:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6897 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   14 warnings generated.


vim +/shrink_slab +1039 mm/vmscan.c

  1018	
  1019	/**
  1020	 * shrink_slab - shrink slab caches
  1021	 * @gfp_mask: allocation context
  1022	 * @nid: node whose slab caches to target
  1023	 * @memcg: memory cgroup whose slab caches to target
  1024	 * @priority: the reclaim priority
  1025	 *
  1026	 * Call the shrink functions to age shrinkable caches.
  1027	 *
  1028	 * @nid is passed along to shrinkers with SHRINKER_NUMA_AWARE set,
  1029	 * unaware shrinkers will receive a node id of 0 instead.
  1030	 *
  1031	 * @memcg specifies the memory cgroup to target. Unaware shrinkers
  1032	 * are called only if it is the root cgroup.
  1033	 *
  1034	 * @priority is sc->priority, we take the number of objects and >> by priority
  1035	 * in order to get the scan target.
  1036	 *
  1037	 * Returns the number of reclaimed slab objects.
  1038	 */
> 1039	unsigned long shrink_slab(gfp_t gfp_mask, int nid,
  1040					 struct mem_cgroup *memcg,
  1041					 int priority)
  1042	{
  1043		unsigned long ret, freed = 0;
  1044		struct shrinker *shrinker;
  1045		bool bypass = false;
  1046	
  1047		trace_android_vh_shrink_slab_bypass(gfp_mask, nid, memcg, priority, &bypass);
  1048		if (bypass)
  1049			return 0;
  1050	
  1051		/*
  1052		 * The root memcg might be allocated even though memcg is disabled
  1053		 * via "cgroup_disable=memory" boot parameter.  This could make
  1054		 * mem_cgroup_is_root() return false, then just run memcg slab
  1055		 * shrink, but skip global shrink.  This may result in premature
  1056		 * oom.
  1057		 */
  1058		if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
  1059			return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
  1060	
  1061		if (!down_read_trylock(&shrinker_rwsem))
  1062			goto out;
  1063	
  1064		list_for_each_entry(shrinker, &shrinker_list, list) {
  1065			struct shrink_control sc = {
  1066				.gfp_mask = gfp_mask,
  1067				.nid = nid,
  1068				.memcg = memcg,
  1069			};
  1070	
  1071			ret = do_shrink_slab(&sc, shrinker, priority);
  1072			if (ret == SHRINK_EMPTY)
  1073				ret = 0;
  1074			freed += ret;
  1075			/*
  1076			 * Bail out if someone want to register a new shrinker to
  1077			 * prevent the registration from being stalled for long periods
  1078			 * by parallel ongoing shrinking.
  1079			 */
  1080			if (rwsem_is_contended(&shrinker_rwsem)) {
  1081				freed = freed ? : 1;
  1082				break;
  1083			}
  1084		}
  1085	
  1086		up_read(&shrinker_rwsem);
  1087	out:
  1088		cond_resched();
  1089		return freed;
  1090	}
  1091	EXPORT_SYMBOL_GPL(shrink_slab);
  1092	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
