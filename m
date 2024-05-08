Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125EB1388
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 03:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715139847; cv=none; b=VAJ/cBDA9P0pc2C5muLMTpLTCI4wKb7nAWLsfkzwKBi9i4nNeNUmILtKhHLGB3n2Ul+LD+I4RxDpbqrIL9zqdiur18TMVNmoQscRr6xGVsasD7kuCP0lyE8h8F1tHUuQGV8p+XDpfyNInzg1VH9HfcSqRFEolOqRyHHKWERbW7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715139847; c=relaxed/simple;
	bh=Xvl/++YY9cIdMUQT+RGhcyGibTthMGOhFoy9rKNPq28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZLp5GSlYSWf8n/9+wTMnxHALysMXJdbAo2G+W7i2zm64FKXq5m09LxZM8PUOKBUltErrj0uQ0eg424NkIbuMxHh1NzgQ/a6QsdlaHOBaz8ylHKOYj6fAt8nMzQZFotODrYkbs/JGY4kYiJ6dyRaLWgPH1a+xgo9ka5IWC4Z42s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKDYwBv8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKDYwBv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715139845; x=1746675845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xvl/++YY9cIdMUQT+RGhcyGibTthMGOhFoy9rKNPq28=;
  b=mKDYwBv8uajtl9roTJZ3NuCHD3J+ffqvrEJ2+PxvqVRzQA+w49mbP8lf
   NpYU8InSQLBf9/ELF0E+VRFge70W1kRhcerdBMAJBoXT1vzdP7a2uCJIA
   K05XCOg/qexW9MlYem//NXcL/ne9ZdbklVeDw0b6IF2Z2FtBV3xfH8OMh
   MiORtqETF6uU4ZiFhZ+7PzaU7nHOWlWNFVSHiSegceQocMOvdO+Un9WcY
   NZZIcEbwcO3FCtRsTjaJPIxZG+wvm3rXOLoTh7Ipc+0bboRgdit8nR3Yh
   U+W2Os5H2G4nBBX9H11T0RvHDpLG2vJdRe+AM/XAuVV/PZ/48pfdeynhU
   Q==;
X-CSE-ConnectionGUID: 8+K5F/xDSk2oVQANnaKV3Q==
X-CSE-MsgGUID: kBRXN5x+QCifi66ED+o+0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10913573"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="10913573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 20:44:04 -0700
X-CSE-ConnectionGUID: 55Ekl2emQx+Y//nNUJZm1A==
X-CSE-MsgGUID: FxUNVsfATKWC7f1zjrVe9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="59900258"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2024 20:44:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4YDo-0002vm-35;
	Wed, 08 May 2024 03:44:00 +0000
Date: Wed, 8 May 2024 11:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 4/5] mm/internal.h:1527:10: error: call
 to undeclared function 'cgroup_subsys_on_dfl'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202405081138.Dus3adUv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   9a677688ef8b39a000f682ac9bfb46453fd94685
commit: 8725b3ac18d0ce3a4cba970cfd0d28286a0b182e [4/5] mm: memcg: move legacy memcg event code into memcontrol-v1.c
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240508/202405081138.Dus3adUv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081138.Dus3adUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081138.Dus3adUv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:51:
>> mm/internal.h:1527:10: error: call to undeclared function 'cgroup_subsys_on_dfl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^
>> mm/internal.h:1527:31: error: use of undeclared identifier 'memory_cgrp_subsys'
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^
   1 warning and 2 errors generated.
--
   In file included from mm/page-writeback.c:20:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:40:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:43:
>> mm/internal.h:1527:10: error: call to undeclared function 'cgroup_subsys_on_dfl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^
>> mm/internal.h:1527:31: error: use of undeclared identifier 'memory_cgrp_subsys'
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^
   3 warnings and 2 errors generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:67:
>> mm/internal.h:1527:10: error: call to undeclared function 'cgroup_subsys_on_dfl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^
>> mm/internal.h:1527:31: error: use of undeclared identifier 'memory_cgrp_subsys'
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^
   mm/vmscan.c:398:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     398 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1729:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1729 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2234:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2234 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2235:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2235 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6240:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6240 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 2 errors generated.
--
   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:59:
>> mm/internal.h:1527:10: error: call to undeclared function 'cgroup_subsys_on_dfl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^
>> mm/internal.h:1527:31: error: use of undeclared identifier 'memory_cgrp_subsys'
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^
   mm/page_alloc.c:2876:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2876 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:2993:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2993 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4634:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4634 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings and 2 errors generated.
--
   In file included from mm/slub.c:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/slub.c:49:
>> mm/internal.h:1527:10: error: call to undeclared function 'cgroup_subsys_on_dfl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^
>> mm/internal.h:1527:31: error: use of undeclared identifier 'memory_cgrp_subsys'
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^
   mm/slub.c:2649:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2649 |         unsigned int partial_slabs = 0;
         |                      ^
   mm/slub.c:3831:22: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3831 |         struct slabobj_ext *obj_exts;
         |                             ^
   3 warnings and 2 errors generated.


vim +/cgroup_subsys_on_dfl +1527 mm/internal.h

  1523	
  1524	/* Whether legacy memory+swap accounting is active */
  1525	static inline bool do_memsw_account(void)
  1526	{
> 1527		return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
  1528	}
  1529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
