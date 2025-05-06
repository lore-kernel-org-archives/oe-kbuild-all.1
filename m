Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054729AAE2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 03:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503786; cv=none; b=QtKyJK2ey7OVjaNEElISjNRyhEEDwyZnq6Jty0FnOV3vyfYsK1INFgwOnJPvaaowSSGPZX1UQNAh2KjmvRsEBuaArpZ2S2ufc/wPjwd/dIFwYE1poEZuZh2mMVIP5XaslEi8orE88Nvoca7tFuaxZhMVOyHDkIyNVjDBDpGkkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503786; c=relaxed/simple;
	bh=sbJ/Kxhgt7A897h3W0zmrqYsMcHDHXikOA1pCzHjsqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=duaNAtZxAE++Uyn3XMq7z+BbzO5geLn1TcdONK+SuN8kxhclOchSvhCu1DUKHkkVBer7Ywkf9POjPg2pr1pkJ+9+we6eG5WSaS7v0V802QukPPycmvDkDL2Wh1Rg9eNVIf4+HfI+OYfDLU5RdkP2+3gRpUN6H1Hlao8aefuhU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRAAiUQD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRAAiUQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746503784; x=1778039784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbJ/Kxhgt7A897h3W0zmrqYsMcHDHXikOA1pCzHjsqU=;
  b=WRAAiUQDyarbYDSvu+TQcwQZNfnlavHeHGFzXYErMOvR4mDhf6+rIqR/
   Zq8j9fL72mJ5v7zxL8yze59ErDURXZAicYrNrrBYWidBiElWGCfZgJzH2
   oBvOgbsuj+gkasQ/LPC4r8MN/54liIOJYOa0pdSRzn93g3ivqwBVDsqW+
   LeLUQm/PwOIbWOByxEQrp5JmyoPMMxuikQR9NKHf/g7bOPFItRdoEOfZE
   cL1WVm0oZz0rVVWfZTNbm+33+FmlYWW0S4dGQ6N/FeMSgmx0O0Y+TbGei
   07EMH+5MXyAhOaVioeH6z6mR35/Xb1t3o05LH36lNmvBPSthuNdmqhf/9
   Q==;
X-CSE-ConnectionGUID: JTxzsOlwTyqdgiP64amhtQ==
X-CSE-MsgGUID: C2ioH6Q4T/qS3hq+yq2dVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48157825"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48157825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:56:24 -0700
X-CSE-ConnectionGUID: +QzbVeoORkemCsqsv394fg==
X-CSE-MsgGUID: 71VsKlBTTMqoCUnRu2DIXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135471696"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 May 2025 20:56:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC9Po-0006Ej-33;
	Tue, 06 May 2025 03:56:20 +0000
Date: Tue, 6 May 2025 11:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-05 0/1] mm/vmscan.c:5102:6:
 warning: no previous prototype for function 'isolate_folio'
Message-ID: <202505061100.0UU6qSPh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-05
head:   b2cebbc8442459530cec110543dbdf25e6bdd480
commit: b4c5ce4fc75510ee4e1051ee1d608ad2307ef738 [0/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: i386-randconfig-063-20250505 (https://download.01.org/0day-ci/archive/20250506/202505061100.0UU6qSPh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061100.0UU6qSPh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061100.0UU6qSPh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2238:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:49:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:51:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      51 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:681:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     681 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1046:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
    1046 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:1046:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1046 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
   mm/vmscan.c:2445:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2445 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2626:15: warning: no previous prototype for function 'shrink_inactive_list' [-Wmissing-prototypes]
    2626 | unsigned long shrink_inactive_list(unsigned long nr_to_scan,
         |               ^
   mm/vmscan.c:2626:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2626 | unsigned long shrink_inactive_list(unsigned long nr_to_scan,
         | ^
         | static 
   mm/vmscan.c:2986:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2986 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2987:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2987 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
>> mm/vmscan.c:5102:6: warning: no previous prototype for function 'isolate_folio' [-Wmissing-prototypes]
    5102 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^
   mm/vmscan.c:5102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5102 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         | ^
         | static 
   mm/vmscan.c:5191:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    5191 |                         __count_zid_vm_events(PGSCAN_SKIP, zone, skipped_zone);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:7034:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    7034 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   12 warnings generated.


vim +/isolate_folio +5102 mm/vmscan.c

  5101	
> 5102	bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
  5103	{
  5104		bool success;
  5105	
  5106		/* swapping inhibited */
  5107		if (!(sc->gfp_mask & __GFP_IO) &&
  5108		    (folio_test_dirty(folio) ||
  5109		     (folio_test_anon(folio) && !folio_test_swapcache(folio))))
  5110			return false;
  5111	
  5112		/* raced with release_pages() */
  5113		if (!folio_try_get(folio))
  5114			return false;
  5115	
  5116		/* raced with another isolation */
  5117		if (!folio_test_clear_lru(folio)) {
  5118			folio_put(folio);
  5119			return false;
  5120		}
  5121	
  5122		/* see the comment on MAX_NR_TIERS */
  5123		if (!folio_test_referenced(folio))
  5124			set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
  5125	
  5126		/* for shrink_folio_list() */
  5127		folio_clear_reclaim(folio);
  5128		folio_clear_referenced(folio);
  5129	
  5130		success = lru_gen_del_folio(lruvec, folio, true);
  5131		VM_WARN_ON_ONCE_FOLIO(!success, folio);
  5132	
  5133		return true;
  5134	}
  5135	EXPORT_SYMBOL_GPL(isolate_folio);
  5136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
