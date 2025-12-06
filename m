Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A12F39D6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765036087; cv=none; b=QdYR1m0nmdXiFEhtAEYt6ORWNFYXRMKqxPB+hCieRWjyKa+ZEQ0SJxatKNqvTaLPFjenPTFPP6KkPq/Db+wrUqvDP+n/ck8OSfAOwkxs7eqRdEz4xflXWXOgcuOpgIoSwDBa1fjcCGAUmDMvqhuTD/eagxf/3UCk2ZVAfUe6FuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765036087; c=relaxed/simple;
	bh=a1p96pIPVOOSo69kiqDsMIooxv+GG43BVpWFcOK8YfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfwJG1Ax1xP6hi/CNzbvutfCV9dnuoFCE1G1Lr3miNoZmoC6h+K9IQCXbBASA6eb/WZvTZvZ7cTBvGOBiSMvovZRtUeB1pwDez/VU2nO7NvD+U5Ls7+ads0s/vMoqKQ43904VyOn+aXTW7PAPvS9MZSpXQxx42R38IqBHLW4WAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/w0V5YB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/w0V5YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765036085; x=1796572085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a1p96pIPVOOSo69kiqDsMIooxv+GG43BVpWFcOK8YfM=;
  b=B/w0V5YBTivCjFrNlqcgM4wcC5awl8pD8yzT2NKZ325c5vogfPQKg4Gt
   eMPghFPD1ocsKeWuWx86wJOBemyWFDiEN+sTkW4HlBfnjo/uLT5jOQ3px
   Ummqlp7/oEYBmezihIhLcfL9bvi/1/Zuq44MPFz7GdEXRpcyyZ1rrj5Py
   EwVatzOqV+ETEVnWMf3O3TDmLt+9PeY5GkKzfvaYOnB07fUOXJr3aM5jR
   ncugWwApnDoeoOkA+UQDIlMmk6MPs59SXei0cBF6r29Q+I2PRyPq2kl1X
   yKE7XPbGcjjdV+Q6GpPeKK07clHtvlJ+7r/JutFYYUIKXAOoefGtG4Re7
   A==;
X-CSE-ConnectionGUID: 7OX8eqPGTQOK2dGr9rIAbw==
X-CSE-MsgGUID: dCM6QYn4Ru6KmPH+g66NMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="84453691"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="84453691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 07:48:05 -0800
X-CSE-ConnectionGUID: VpYeeAevQgCGHrKB01Gggg==
X-CSE-MsgGUID: L3FmWL84R2e3B9mB+uGQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226560833"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Dec 2025 07:48:03 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRuVs-00000000IIT-3A11;
	Sat, 06 Dec 2025 15:48:00 +0000
Date: Sat, 6 Dec 2025 23:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] mm/page_alloc.c:4110:9: error: call to
 undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202512062342.w7DAW6VJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [3482/3482] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251206/202512062342.w7DAW6VJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512062342.w7DAW6VJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512062342.w7DAW6VJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2204:
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
   In file included from mm/page_alloc.c:43:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/page_alloc.c:2769:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2769 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:2886:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2886 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
>> mm/page_alloc.c:4110:9: error: call to undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4110 |         return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
         |                ^
   mm/page_alloc.c:4596:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4596 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   10 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/dynamic_pool_should_alloc +4110 mm/page_alloc.c

  4101	
  4102	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4103	{
  4104		if (!reliable_allow_fb_enabled())
  4105			return false;
  4106	
  4107		if (!(gfp_mask & GFP_RELIABLE))
  4108			return false;
  4109	
> 4110		return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
  4111	}
  4112	#else
  4113	static inline struct zone *mem_reliable_fallback_zone(gfp_t gfp_mask,
  4114							      struct alloc_context *ac)
  4115	{
  4116		return NULL;
  4117	}
  4118	static inline void mem_reliable_fallback_slowpath(gfp_t gfp_mask,
  4119							  struct alloc_context *ac) {}
  4120	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4121	{
  4122		return false;
  4123	}
  4124	#endif
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
