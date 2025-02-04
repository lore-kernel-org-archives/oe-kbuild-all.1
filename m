Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C7D27456
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 00:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629711; cv=none; b=rESTdT79azMVPM7vGDlUDXG1Xo8CWtFhrlFLW916JVgkLa5hxhf1Dm14tBLn2RI/PPlkFdIWdTS3X2xVrwYQV5x2pUsLjCW1K5sCfmGlROCdhyYXfPXY+abl43NjPVuPXzB8gOha2NA7eVtIjH2J2GBj4lRu9bky3+WaNijUwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629711; c=relaxed/simple;
	bh=6kUtzsPvVk7uRarlf0pU1EyhOxl+bEcdC6peLJ5fTgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCHmNFQYed6EchwmPMW6jvqOP1aadxesUoAgCeopC+UzwWPszYg0/xL5KqgyC2AtjVKyswmur+VchYNrkc1ruFEpOIC5kiH9aQbKm0Iag1lMwaVt3iL3O5IydIVD7qEcHMsEfA84GO0V+ntjm6G32KVCXnpuRmaY/gHXVLBjRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmLJaOys; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmLJaOys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738629710; x=1770165710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6kUtzsPvVk7uRarlf0pU1EyhOxl+bEcdC6peLJ5fTgU=;
  b=FmLJaOysCCk0ePjqH4Q+2yamCRlK8oApji1UKK0Dkb9xDYPqTHmTCVXD
   7ZKxSDcSLvwQB77Do5+HtTbnmS0Qnxt7tElEJQWuCMnMwEO0PDEN0DjNT
   r8g1EIKvXOBr5eA5buk7OW0sKQ9IqZ42cehkqS+r6fgjUhX4qzYjLW9u7
   ZLhfwd0nwomlEqaqyFVT9YVYiCeDRsq6dgIAZrGj+QkRlaFIdk5tjLVFq
   v4cOD5XELcdynTJOBWoREyTleMs6olZx1MVn97e3tBLnHBzFUCO0cGEab
   RAdjEPx0Bohl25U8z0z5yYHHI5XI7Kxth4IxHGcTsOvsC+TH+hCzXBhSI
   Q==;
X-CSE-ConnectionGUID: /CIco0R1SNGlNJFxelsbFg==
X-CSE-MsgGUID: RF4OFVg5T9Cd1kR4Sbl3UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49792368"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="49792368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 16:41:49 -0800
X-CSE-ConnectionGUID: rj/sUPzgSLinDM+PIAr9sg==
X-CSE-MsgGUID: dhPwd3fETgyW9U2iwCgfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110909568"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 16:41:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf70b-000rlT-11;
	Tue, 04 Feb 2025 00:41:45 +0000
Date: Tue, 4 Feb 2025 08:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5] mm/page_alloc.c:562:49:
 error: use of undeclared identifier 'MIGRATE_CMA'; did you mean
 'MIGRATE_SYNC'?
Message-ID: <202502040838.oMNSt1Ps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   88298f5bdf8b7de9d5aaf8979d13191d4c37622b
commit: 3f2cf700ae99c47444d68a8b10df2083fb080c89 [0/5] ANDROID: mm: add cma pcp list
config: i386-buildonly-randconfig-003-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040838.oMNSt1Ps-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040838.oMNSt1Ps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040838.oMNSt1Ps-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/page_alloc.c:562:49: error: use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
     562 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |                                                        ^~~~~~~~~~~
         |                                                        MIGRATE_SYNC
   include/linux/mmdebug.h:96:46: note: expanded from macro 'VM_BUG_ON'
      96 | #define VM_BUG_ON(cond) BUILD_BUG_ON_INVALID(cond)
         |                                              ^
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/migrate_mode.h:14:2: note: 'MIGRATE_SYNC' declared here
      14 |         MIGRATE_SYNC,
         |         ^
   mm/page_alloc.c:2749:44: error: use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
    2749 |                 if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                          ^~~~~~~~~~~
         |                                                          MIGRATE_SYNC
   include/linux/migrate_mode.h:14:2: note: 'MIGRATE_SYNC' declared here
      14 |         MIGRATE_SYNC,
         |         ^
   mm/page_alloc.c:2854:45: error: use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
    2854 |                         if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                                  ^~~~~~~~~~~
         |                                                                  MIGRATE_SYNC
   include/linux/migrate_mode.h:14:2: note: 'MIGRATE_SYNC' declared here
      14 |         MIGRATE_SYNC,
         |         ^
   mm/page_alloc.c:3020:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3020 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3162:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3162 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4823:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4823 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   5 warnings and 3 errors generated.


vim +562 mm/page_alloc.c

   552	
   553	static inline unsigned int order_to_pindex(int migratetype, int order)
   554	{
   555		bool __maybe_unused movable;
   556	
   557		/*
   558		 * We shouldn't get here for MIGRATE_CMA if those pages don't
   559		 * have their own pcp list. For instance, free_unref_page() sets
   560		 * pcpmigratetype to MIGRATE_MOVABLE.
   561		 */
 > 562		VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
