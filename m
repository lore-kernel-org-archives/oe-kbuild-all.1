Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87E182
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715040211; cv=none; b=FzUzCOJ9ONvw84QGb/d0wztpO65Ef2UOZlSTPqCRFWQ6R7AuZTvizEfG185dAr44h+cVnnASJAgRfbiVRf0m/YQ69Sm16K1m8zIjO6ypYXGkfh53954r+seXq0hPJDNgChtQ41MF2CVBfK1/w+I3i2KJiSYBB+GJnsdfWgPGgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715040211; c=relaxed/simple;
	bh=kFSK2t0s4F+xejk/9Kc1DVu0B5r+0QfK0RzdPUVoPJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUrkm3oVqckDpmMiO4JKWm+WSaIX35BuNBusRlK8v1RN93rGQMkUcerPQM/zUs7JgpCl/ufzsPvnUEVO4WWSXNy05lbzKRnq06rZ/GFQAnXRyESt9hn0TNa9fInH6aKYCNJWExNCW9DXuN0L4eabn2a0JmZglJSNHXx2w88Ftng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d36BMw4h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d36BMw4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715040208; x=1746576208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFSK2t0s4F+xejk/9Kc1DVu0B5r+0QfK0RzdPUVoPJY=;
  b=d36BMw4hoeefxd3nMd8IvdrEpEDGj87gbN/M2Gfw8XWVgX4wbN0Uiou1
   dL7+sUAIbI74j0vVk6NrZBnXDH+MeFx0OK9NEpjRKmMlejJgdh7aqhF0Q
   dXoOykgj9EXljA+s91noyXEl9iMgie8sO5i+73lCFC18FkruJqPeU+w+t
   0FDsE0xR9Vz+w6+F15cDssBBDZ3poXildlx4SSaWjTfWdYl915K7ogZFs
   cUMJIMhe2LvsXVXNsncD7LqvARTBRE1UIc/1e3wq5buAes3oExsgYDuxU
   b0QVx0Db1SL8igULKNpY+hUu/ymSclrftQXm8U6acsRuX/GilmHbJ4B+7
   A==;
X-CSE-ConnectionGUID: grBw8ZIqRg6gag/vO/k2ZQ==
X-CSE-MsgGUID: 5gWifRp2TT6aKfg1ySdiOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14593550"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="14593550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 17:03:28 -0700
X-CSE-ConnectionGUID: OVSiCaEGQ0SUEBm9dqxJXw==
X-CSE-MsgGUID: QCko8vrBS5WEUipH63o37g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="51522537"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2024 17:02:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s48HX-00018l-0Z;
	Tue, 07 May 2024 00:02:07 +0000
Date: Tue, 7 May 2024 08:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 5/5] mm/internal.h:1584:33: error: array
 has incomplete element type 'struct cftype'
Message-ID: <202405070732.PYwPhLRF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   9b269ef160d984dc9ed844151a21384b4ad60fdc
commit: 9b269ef160d984dc9ed844151a21384b4ad60fdc [5/5] mm: memcg: move cgroup v1 interface files to memcontrol-v1.c
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240507/202405070732.PYwPhLRF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070732.PYwPhLRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070732.PYwPhLRF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:51:
>> mm/internal.h:1584:33: error: array has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                                 ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
   mm/internal.h:1585:45: error: array has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                                             ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
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
>> mm/internal.h:1584:33: error: array has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                                 ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
   mm/internal.h:1585:45: error: array has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                                             ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
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
>> mm/internal.h:1584:33: error: array has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                                 ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
   mm/internal.h:1585:45: error: array has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                                             ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
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
>> mm/internal.h:1584:33: error: array has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                                 ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
   mm/internal.h:1585:45: error: array has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                                             ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
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
>> mm/internal.h:1584:33: error: array has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                                 ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
   mm/internal.h:1585:45: error: array has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                                             ^
   mm/internal.h:1551:8: note: forward declaration of 'struct cftype'
    1551 | struct cftype;
         |        ^
   mm/slub.c:2649:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2649 |         unsigned int partial_slabs = 0;
         |                      ^
   mm/slub.c:3831:22: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3831 |         struct slabobj_ext *obj_exts;
         |                             ^
   3 warnings and 2 errors generated.


vim +1584 mm/internal.h

  1583	
> 1584	extern struct cftype memsw_files[];
  1585	extern struct cftype mem_cgroup_legacy_files[];
  1586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
