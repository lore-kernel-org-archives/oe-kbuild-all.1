Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995A2366074
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329499; cv=none; b=SQHOkKIHSdJ2cxlIAC0PBUNtaKQsX+kk7+YuBv8CN6uQhbXhxnhiM/7pJu9OTqbF+Sb3V9Tc0cA1Y68dh52NFIo+X7wUHjOVpPuwQqJdFghsyc+qMds5ews4WSywiXD63e1+BabW3wRWHKf4iAT80nfRmjmAY39A4eXGHGlVU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329499; c=relaxed/simple;
	bh=i8Dwpq7mryGUTzU/aqHOfbTR4UVfTiWBvh8llzDlrY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r2Rz+8ufSRBPoLEbWMMQ/RlKFB+h2q9WvkUwQPwjseEhhnwoaf9LUATUAPnFkY+a184FJXsw09Fdevvk+FQG13ImGvatXV7B0gWx7L2bPOiLfoBZGWAXe3cV12aaZ3m8X3DR7fl/Ar3IUJfh3OPg7MCaKagHxClFwkaERKEkzbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJBLCNoS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJBLCNoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776329497; x=1807865497;
  h=date:from:to:cc:subject:message-id;
  bh=i8Dwpq7mryGUTzU/aqHOfbTR4UVfTiWBvh8llzDlrY4=;
  b=CJBLCNoSKXmQ7pUsdRnBmJfhnqd9/CGsvCXk7cNl4ZclKAz6lD/eoMDz
   iRHoO2frC4u1sIOXLhiIiSkbI0+2b6yPry2MeCsq4AqT8yOUnKQuJ9RAK
   oiKcW7oU0x1Ngf2koTYchfUklv6LQKETIVmfmdN82QDCMFxapgovx61A+
   HPXBkQxEH1loNaSpYJnXrcXDsCivtyS7MZeN97t2R9Ow/P/gId18+wc02
   AULZGQtvpd40ZfAUnEZjx88hMufO247LYJU1uZeW1DPELQVmOQ8sblsx2
   D0h1wN1X8pj5Gn6ebRxNs5HN2YJzpTvEUrzDpmTqqTlZRYi/4Qg8M+v6Y
   w==;
X-CSE-ConnectionGUID: 47OJxd7HSny0wVaI/RiRBg==
X-CSE-MsgGUID: NDzY5pFXSWyTaCAF0OqAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76490264"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="76490264"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:51:36 -0700
X-CSE-ConnectionGUID: MtDeESO1QNyIlwmvVR4Kpw==
X-CSE-MsgGUID: sULFrHEzTfaEgvfRdH2+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="232413643"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2026 01:51:34 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDIRg-000000001Pm-1F0L;
	Thu, 16 Apr 2026 08:51:32 +0000
Date: Thu, 16 Apr 2026 16:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-04 1/1]
 include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used
Message-ID: <202604161652.Ogs6jnBt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Feng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-04
head:   f782563dd4b9e9f005d55d232946ffaa340a1f61
commit: c65b1bd0af076fa5a1da26b9cf780097b14b1543 [1/1] mm/page_alloc: detect allocation forbidden by cpuset and bail out early
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604161652.Ogs6jnBt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161652.Ogs6jnBt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161652.Ogs6jnBt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/fs.h:15,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   mm/filemap.c: At top level:
   mm/filemap.c:830:14: warning: no previous prototype for '__add_to_page_cache_locked' [-Wmissing-prototypes]
     830 | noinline int __add_to_page_cache_locked(struct page *page,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from mm/util.c:2:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   mm/util.c: In function 'page_mapping':
   mm/util.c:791:29: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
     791 |                 swp_entry_t entry;
         |                             ^~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/fs.h:15,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from mm/workingset.c:8:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   mm/workingset.c: In function 'unpack_shadow':
   mm/workingset.c:201:22: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
     201 |         int memcgid, nid;
         |                      ^~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from mm/vmalloc.c:12:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   mm/vmalloc.c: At top level:
   mm/vmalloc.c:1324:6: warning: no previous prototype for 'set_iounmap_nonlazy' [-Wmissing-prototypes]
    1324 | void set_iounmap_nonlazy(void)
         |      ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from mm/page_alloc.c:19:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:2602:5: warning: no previous prototype for 'find_suitable_fallback' [-Wmissing-prototypes]
    2602 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3563:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3563 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6364:20: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
    6364 | void __init __weak memmap_init(void)
         |                    ^~~~~~~~~~~
   mm/page_alloc.c:6402:23: warning: no previous prototype for 'arch_memmap_init' [-Wmissing-prototypes]
    6402 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from mm/early_ioremap.c:14:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   mm/early_ioremap.c: At top level:
   mm/early_ioremap.c:34:24: warning: no previous prototype for 'early_memremap_pgprot_adjust' [-Wmissing-prototypes]
      34 | pgprot_t __init __weak early_memremap_pgprot_adjust(resource_size_t phys_addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~


vim +/nid +1136 include/linux/mmzone.h

  1094	
  1095	/**
  1096	 * for_each_zone_zonelist_nodemask - helper macro to iterate over valid zones in a zonelist at or below a given zone index and within a nodemask
  1097	 * @zone - The current zone in the iterator
  1098	 * @z - The current pointer within zonelist->_zonerefs being iterated
  1099	 * @zlist - The zonelist being iterated
  1100	 * @highidx - The zone index of the highest zone to return
  1101	 * @nodemask - Nodemask allowed by the allocator
  1102	 *
  1103	 * This iterator iterates though all zones at or below a given zone index and
  1104	 * within a given nodemask
  1105	 */
  1106	#define for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, nodemask) \
  1107		for (z = first_zones_zonelist(zlist, highidx, nodemask), zone = zonelist_zone(z);	\
  1108			zone;							\
  1109			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1110				zone = zonelist_zone(z))
  1111	
  1112	#define for_next_zone_zonelist_nodemask(zone, z, highidx, nodemask) \
  1113		for (zone = z->zone;	\
  1114			zone;							\
  1115			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1116				zone = zonelist_zone(z))
  1117	
  1118	
  1119	/**
  1120	 * for_each_zone_zonelist - helper macro to iterate over valid zones in a zonelist at or below a given zone index
  1121	 * @zone - The current zone in the iterator
  1122	 * @z - The current pointer within zonelist->zones being iterated
  1123	 * @zlist - The zonelist being iterated
  1124	 * @highidx - The zone index of the highest zone to return
  1125	 *
  1126	 * This iterator iterates though all zones at or below a given zone index.
  1127	 */
  1128	#define for_each_zone_zonelist(zone, z, zlist, highidx) \
  1129		for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, NULL)
  1130	
  1131	/* Whether the 'nodes' are all movable nodes */
  1132	static inline bool movable_only_nodes(nodemask_t *nodes)
  1133	{
  1134		struct zonelist *zonelist;
  1135		struct zoneref *z;
> 1136		int nid;
  1137	
  1138		if (nodes_empty(*nodes))
  1139			return false;
  1140	
  1141		/*
  1142		 * We can chose arbitrary node from the nodemask to get a
  1143		 * zonelist as they are interlinked. We just need to find
  1144		 * at least one zone that can satisfy kernel allocations.
  1145		 */
  1146		nid = first_node(*nodes);
  1147		zonelist = &NODE_DATA(nid)->node_zonelists[ZONELIST_FALLBACK];
  1148		z = first_zones_zonelist(zonelist, ZONE_NORMAL,	nodes);
  1149		return (!z->zone) ? true : false;
  1150	}
  1151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
