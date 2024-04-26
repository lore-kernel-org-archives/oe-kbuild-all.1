Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A7145358
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714148406; cv=none; b=OWhhE0x5ujbJrYdX4/v9QzbOi3M2se6caqzHiaO+dz7iJ0jw2v5F/kiL17qxqUcgj4H9Dr9NBXteqqtMeMF1F1b3zUJQ/ojdt2BCcMYLX7iH7GO05yJfKp5gPHO+msmfpRX3uF1USMycvbvacBX89DtMuj969BRVLJgHWNO3P0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714148406; c=relaxed/simple;
	bh=WDTB08bO5n1jWOR7xptXgl+RCQcZH1AwSKCTht1pKSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrU0EeyNEx6AywGHb3i8QbR1GAYicabeIJP5AhBjC1x6mQCttO7h15xrBDNRyFV0tkPrIqRlrFz8gL6FbDBObA49Y9yhzyynaextDmoBrHMtrCwXOep8cUlikuXwhkT4o/5ya4Gv1Oog4p6mjPcapEYZR9QB0az/gHVQA2N5es8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X23luhem; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X23luhem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714148404; x=1745684404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDTB08bO5n1jWOR7xptXgl+RCQcZH1AwSKCTht1pKSY=;
  b=X23luhemJUP5op24kYtYfR2XKIqbB52OqTMpsCY1I5oz7dHhdDUJHquN
   wjWwPKlrP8CJKYOR1hZdfuwZLfFUWQ0gDoKovBkkTJ41SQNpdWO3PMFUi
   GHDB3ieeSsQjG8b6RG5g7qXuE9k/oVNBZ7hsADLSaIs5jOzs/062ILKuC
   0MGW1qcx/mVL1fgnjd4Kfix+oZsH2FR+YNffHItdNy9KuBXf+JSjtMWyQ
   5Mv+U4/+oPsZplzXIFPP46qo2MydJ95Ek5DPq7d61eWOODQY/C09YKVEz
   vTxs2Zah4hf8TWoov3ujobIutw85zXAn0IJq78O3XhyLhdmxxi1GtoP6u
   w==;
X-CSE-ConnectionGUID: tW5WdAjhQ0yZnLosI4sSKA==
X-CSE-MsgGUID: jbj1zWUsQLOnOaY01ZlBDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10422214"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="10422214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 09:20:01 -0700
X-CSE-ConnectionGUID: 0VuwDLUbSdiZId3MCqwzuA==
X-CSE-MsgGUID: VQ1n4H/mSDCsvfEw9e3hsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56388220"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Apr 2024 09:19:57 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0OIk-0003vq-2E;
	Fri, 26 Apr 2024 16:19:54 +0000
Date: Sat, 27 Apr 2024 00:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 39/245] mm/page_alloc.c:594:49: error:
 use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
Message-ID: <202404270020.zy354gmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a483dde38073d7097405656305f05dcc5175b3a
commit: 634c33ee9d167bb46f3472c1cc2db5ce2f5a6408 [39/245] ANDROID: mm: add cma pcp list
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240427/202404270020.zy354gmz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404270020.zy354gmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270020.zy354gmz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2191:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:43:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/page_alloc.c:594:49: error: use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
     594 |         VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
         |                                                        ^~~~~~~~~~~
         |                                                        MIGRATE_SYNC
   include/linux/mmdebug.h:96:46: note: expanded from macro 'VM_BUG_ON'
      96 | #define VM_BUG_ON(cond) BUILD_BUG_ON_INVALID(cond)
         |                                              ^
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/migrate_mode.h:18:2: note: 'MIGRATE_SYNC' declared here
      18 |         MIGRATE_SYNC,
         |         ^
   mm/page_alloc.c:2513:44: error: use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
    2513 |                 if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                          ^~~~~~~~~~~
         |                                                          MIGRATE_SYNC
   include/linux/migrate_mode.h:18:2: note: 'MIGRATE_SYNC' declared here
      18 |         MIGRATE_SYNC,
         |         ^
   mm/page_alloc.c:2601:45: error: use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
    2601 |                         if (!cma_has_pcplist() || migratetype != MIGRATE_CMA)
         |                                                                  ^~~~~~~~~~~
         |                                                                  MIGRATE_SYNC
   include/linux/migrate_mode.h:18:2: note: 'MIGRATE_SYNC' declared here
      18 |         MIGRATE_SYNC,
         |         ^
   mm/page_alloc.c:2768:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2768 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:2869:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2869 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4510:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4510 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings and 3 errors generated.


vim +594 mm/page_alloc.c

   586	
   587	static inline unsigned int order_to_pindex(int migratetype, int order)
   588	{
   589		/*
   590		 * We shouldn't get here for MIGRATE_CMA if those pages don't
   591		 * have their own pcp list. For instance, free_unref_page() sets
   592		 * pcpmigratetype to MIGRATE_MOVABLE.
   593		 */
 > 594		VM_BUG_ON(!cma_has_pcplist() && migratetype == MIGRATE_CMA);
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
