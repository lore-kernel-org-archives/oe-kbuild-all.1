Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC08EC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 04:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732595567; cv=none; b=N9LLrRtBudDsZniuQ2QwcJYdSTBtNM0oJAMYxWjNVL/7kE2dGT2+nkWW+caaB5jzWghJLWFFUwyDb9549Cj8KL+Xj0E7m/pVdk/MY4Gp4rs13SIASq0ASXNlxxfl8UNZ4WWegc24dicNiO8yHZXoVJJs2Z9hL0cndYdNxUrcL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732595567; c=relaxed/simple;
	bh=8zW5I58owLoIUratJpdrS4wbsM36Qq4B80lgFBBfzQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5vNGtOL9/ODz5y1BfjcMM5JZ2W6oqGiw5XzjcGxLLQG42BzU/6R/7oUqQmp18SZrec0u4JTm+0IxalD0SV7xtXZUpnTk5v339coXOaB8zNFlDMo46LHFyijLfU6vzdZMNQkdncU2oCgFTPc+teHHAWhNct/skmAGlVHJA74+oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2dEDAfR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2dEDAfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732595566; x=1764131566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zW5I58owLoIUratJpdrS4wbsM36Qq4B80lgFBBfzQo=;
  b=N2dEDAfRaO1MnRcve4JzSviCEdJJLGfniLAKTuhUSS6clxRXLS4VrO1I
   QiaLOv/vqt8KR1zdaL0HkuXDwUAVD/8B3EdIfUWF5oeZooY6wfEOKl90+
   zM5Q0xIxWR5e4oaM4nv4NQI8TEKZvNR3cdPKzg/P6LcujTppNxa3ury6m
   dXurGtCdI5I/404AS41ZXqrRjR5o9fkU5vQOJF195Kjsz94/ZuIleeEAj
   xkaBoVGxFxHFYOvLeT8luiImhHLD1Xp6q4587XtKGEzGqLRITz1yvR+Kc
   rZhDm4/+BPgMKa9scuCUcIZ9oncZVPGH2P/qqgrp2BhQPe6JgIW9BlRQh
   Q==;
X-CSE-ConnectionGUID: LiW2RRD/TRGU3Ajqa8BP3w==
X-CSE-MsgGUID: e8njG/vCQAGgjVzQ/OdHdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32792980"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32792980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 20:32:45 -0800
X-CSE-ConnectionGUID: AFcNRZMQR6CzM+IYIcMa3g==
X-CSE-MsgGUID: u+miaTOUSmC2/4qE4SBF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="92300191"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2024 20:32:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFnFi-000749-01;
	Tue, 26 Nov 2024 04:32:42 +0000
Date: Tue, 26 Nov 2024 12:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 4/4] mm/migrate.c:2750:34: error:
 expected expression
Message-ID: <202411261205.RwVExUxZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   bc46f47dbd9b1e365d338f89a0ab10eadce13982
commit: bc46f47dbd9b1e365d338f89a0ab10eadce13982 [4/4] migrate,sysfs: add pagecache promotion
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241126/202411261205.RwVExUxZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261205.RwVExUxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261205.RwVExUxZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/migrate.c:16:
   In file included from include/linux/migrate.h:5:
   In file included from include/linux/mm.h:2211:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/migrate.c:22:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/migrate.c:2750:34: error: expected expression
    2750 |             folio_test_isolated(folio)) ||
         |                                         ^
   6 warnings and 1 error generated.


vim +2750 mm/migrate.c

  2716	
  2717	/**
  2718	 * promotion_candidate() - report a promotion candidate folio
  2719	 *
  2720	 * @folio: The folio reported as a candidate
  2721	 *
  2722	 * Records folio access time and places the folio on the task promotion list
  2723	 * if access time is less than the threshhold. The folio will be isolated from
  2724	 * LRU if selected, and task_work will putback the folio on promotion failure.
  2725	 *
  2726	 * Takes a folio reference that will be released in task work.
  2727	 */
  2728	void promotion_candidate(struct folio *folio)
  2729	{
  2730		struct task_struct *task = current;
  2731		struct list_head *promo_list= &task->promo_list;
  2732		struct callback_head *work = &task->numa_promo_work;
  2733		struct address_space *mapping = folio_mapping(folio);
  2734		bool write = mapping ? mapping->gfp_mask & __GFP_WRITE : false;
  2735		int nid = folio_nid(folio);
  2736		int flags, last_cpupid;
  2737	
  2738		/*
  2739		 * Only do this work if:
  2740		 *     1) tiering and pagecache promotion are enabled
  2741		 *     2) the page can actually be promoted
  2742		 *     3) The hint-fault latency is relatively hot
  2743		 *     4) the folio is not already isolated
  2744		 *     5) This is not a kernel thread context
  2745		 */
  2746		if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) ||
  2747		    !numa_pagecache_promotion_enabled ||
  2748		    node_is_toptier(nid) ||
  2749		    numa_hint_fault_latency(folio) >= PAGE_ACCESS_TIME_MASK ||
> 2750		    folio_test_isolated(folio)) ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
