Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0592F19306F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739776142; cv=none; b=PHMy9aDdVvfaWTzw+lIYVsWIuq0Z9eMC1JdeFTGVKH3u+/QRvnJsKzkpGMqUu0ycyDu3pyoaVjdyjpJNtXkPNyZxc5YIjfTWAwSdt/D5DSbGd0pGGpyNs3MLaVMI+YR57lMf7qD4EY6mF61SuM4WYXHrYacPTZAUlRgiK06KTZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739776142; c=relaxed/simple;
	bh=J4qh1EkShIZZd5EQ2KnAJqKyCciNxgrFfatNFeNS6t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evrS8axOVZ/B4ckHeLHNxvKFNQ7bSoST8aM+HLgsIqp8bLbrbv9bQURFJ2VlHq48rKcbomiQOsicqUhkwV4pYl50QHdDWT2G4KTp80mWq6PhOt+a7YniUa7BUOAZ9KR+nr4R/cf4ToOeWWZFfCymnYh0EuwzXUqu1E3skPWgoUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTmrYulZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTmrYulZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739776140; x=1771312140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4qh1EkShIZZd5EQ2KnAJqKyCciNxgrFfatNFeNS6t8=;
  b=BTmrYulZ8+H2/RLO3ZyVF4G+xaPZzHBAdCytaqZU1JzDd7YOowYXTamN
   Xb9whcgWYREGv00xwg2zxf/ks8JSF23yP5RD+nQgWpIwRsS1x6m5KzIQJ
   22azLyeAk0x2ad68Ze2BlXGEg46ynJajzxquRWH5pTCe+IapIcWRaz8Ua
   FdJtKFcnrqAQ16T8ih1O1wAf/R+P2IgtDSlGhxTWlgkxAUN/MmcAenyem
   0vJ8UOOOiLmCtVR14NixEIcS0x4zFz7LlvPcWlLtMaIW1sm78rmDEq8pr
   D+J3EG/duEIHJfYRTSjQxd9XUzhQVWnKDyT94LRMMdKFiGtcXEAz0z+lu
   g==;
X-CSE-ConnectionGUID: OUhaHH/ZRz6fvrpSKHv9GQ==
X-CSE-MsgGUID: uOo4WA6+SZOrgrDdnKuuiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="39634129"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="39634129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 23:08:57 -0800
X-CSE-ConnectionGUID: ElGTJByeRzmMpz5jc8io9w==
X-CSE-MsgGUID: PUBetyOpSHaAxmn2wh4jww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151212113"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2025 23:08:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjvFN-001CiT-1n;
	Mon, 17 Feb 2025 07:08:53 +0000
Date: Mon, 17 Feb 2025 15:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1424/1424] mm/page_alloc.c:1645:3:
 warning: cast from 'int (*)(unsigned long, unsigned long, struct
 deferred_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void
 *)') converts to incompatible function type
Message-ID: <202502171430.Coc968oj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bd6fde5ff5b73d04068bdad2dc7730479d4df355
commit: eb761d6521c32c006a4987260394a61c6684fb35 [1424/1424] mm: parallelize deferred struct page initialization within each node
config: x86_64-buildonly-randconfig-003-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171430.Coc968oj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171430.Coc968oj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171430.Coc968oj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_alloc.c:21:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:58:
   include/linux/mm_inline.h:32:43: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      32 |         __mod_node_page_state(pgdat, NR_LRU_BASE + lru, nr_pages);
         |                                      ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:34:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/page_alloc.c:1412:6: warning: no previous prototype for function 'set_zone_contiguous' [-Wmissing-prototypes]
    1412 | void set_zone_contiguous(struct zone *zone)
         |      ^
   mm/page_alloc.c:1412:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1412 | void set_zone_contiguous(struct zone *zone)
         | ^
         | static 
   mm/page_alloc.c:1433:6: warning: no previous prototype for function 'clear_zone_contiguous' [-Wmissing-prototypes]
    1433 | void clear_zone_contiguous(struct zone *zone)
         |      ^
   mm/page_alloc.c:1433:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1433 | void clear_zone_contiguous(struct zone *zone)
         | ^
         | static 
>> mm/page_alloc.c:1645:3: warning: cast from 'int (*)(unsigned long, unsigned long, struct deferred_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    1645 |                 DEFINE_KTASK_CTL(ctl, deferred_init_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1646 |                                  KTASK_PTE_MINCHUNK);
         |                                  ~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:139:3: note: expanded from macro 'DEFINE_KTASK_CTL'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:123:21: note: expanded from macro 'KTASK_CTL_INITIALIZER'
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1661:3: warning: cast from 'int (*)(unsigned long, unsigned long, struct deferred_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    1661 |                 DEFINE_KTASK_CTL(ctl, deferred_free_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1662 |                                  KTASK_PTE_MINCHUNK);
         |                                  ~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:139:3: note: expanded from macro 'DEFINE_KTASK_CTL'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:123:21: note: expanded from macro 'KTASK_CTL_INITIALIZER'
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3050:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3050 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:126:34: note: expanded from macro '__count_zid_vm_events'
     126 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3098:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3098 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:126:34: note: expanded from macro '__count_zid_vm_events'
     126 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   9 warnings generated.


vim +1645 mm/page_alloc.c

  1587	
  1588	/* Initialise remaining memory on a node */
  1589	static int __init deferred_init_memmap(void *data)
  1590	{
  1591		pg_data_t *pgdat = data;
  1592		int nid = pgdat->node_id;
  1593		unsigned long start = jiffies;
  1594		unsigned long nr_init = 0, nr_free = 0;
  1595		unsigned long spfn, epfn, first_init_pfn, flags;
  1596		phys_addr_t spa, epa;
  1597		int zid;
  1598		struct zone *zone;
  1599		const struct cpumask *cpumask = cpumask_of_node(pgdat->node_id);
  1600		u64 i;
  1601		unsigned long nr_node_cpus;
  1602		struct ktask_node kn;
  1603	
  1604		/* Bind memory initialisation thread to a local node if possible */
  1605		if (!cpumask_empty(cpumask))
  1606			set_cpus_allowed_ptr(current, cpumask);
  1607	
  1608		pgdat_resize_lock(pgdat, &flags);
  1609		first_init_pfn = pgdat->first_deferred_pfn;
  1610		if (first_init_pfn == ULONG_MAX) {
  1611			pgdat_resize_unlock(pgdat, &flags);
  1612			pgdat_init_report_one_done();
  1613			return 0;
  1614		}
  1615	
  1616		/*
  1617		 * We'd like to know the memory bandwidth of the chip to calculate the
  1618		 * most efficient number of threads to start, but we can't.  In
  1619		 * testing, a good value for a variety of systems was a quarter of the
  1620		 * CPUs on the node.
  1621		 */
  1622		nr_node_cpus = DIV_ROUND_UP(cpumask_weight(cpumask), 4);
  1623	
  1624		/* Sanity check boundaries */
  1625		BUG_ON(pgdat->first_deferred_pfn < pgdat->node_start_pfn);
  1626		BUG_ON(pgdat->first_deferred_pfn > pgdat_end_pfn(pgdat));
  1627		pgdat->first_deferred_pfn = ULONG_MAX;
  1628	
  1629		/* Only the highest zone is deferred so find it */
  1630		for (zid = 0; zid < MAX_NR_ZONES; zid++) {
  1631			zone = pgdat->node_zones + zid;
  1632			if (first_init_pfn < zone_end_pfn(zone))
  1633				break;
  1634		}
  1635		first_init_pfn = max(zone->zone_start_pfn, first_init_pfn);
  1636	
  1637		/*
  1638		 * Initialize and free pages. We do it in two loops: first we initialize
  1639		 * struct page, than free to buddy allocator, because while we are
  1640		 * freeing pages we can access pages that are ahead (computing buddy
  1641		 * page in __free_one_page()).
  1642		 */
  1643		for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &spa, &epa, NULL) {
  1644			struct deferred_args args = { nid, zid, ATOMIC64_INIT(0) };
> 1645			DEFINE_KTASK_CTL(ctl, deferred_init_chunk, &args,
  1646					 KTASK_PTE_MINCHUNK);
  1647			ktask_ctl_set_max_threads(&ctl, nr_node_cpus);
  1648	
  1649			spfn = max_t(unsigned long, first_init_pfn, PFN_UP(spa));
  1650			epfn = min_t(unsigned long, zone_end_pfn(zone), PFN_DOWN(epa));
  1651	
  1652			kn.kn_start	= (void *)spfn;
  1653			kn.kn_task_size	= (spfn < epfn) ? epfn - spfn : 0;
  1654			kn.kn_nid	= nid;
  1655			(void) ktask_run_numa(&kn, 1, &ctl);
  1656	
  1657			nr_init += atomic64_read(&args.nr_pages);
  1658		}
  1659		for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &spa, &epa, NULL) {
  1660			struct deferred_args args = { nid, zid, ATOMIC64_INIT(0) };
  1661			DEFINE_KTASK_CTL(ctl, deferred_free_chunk, &args,
  1662					 KTASK_PTE_MINCHUNK);
  1663			ktask_ctl_set_max_threads(&ctl, nr_node_cpus);
  1664	
  1665			spfn = max_t(unsigned long, first_init_pfn, PFN_UP(spa));
  1666			epfn = min_t(unsigned long, zone_end_pfn(zone), PFN_DOWN(epa));
  1667	
  1668			kn.kn_start	= (void *)spfn;
  1669			kn.kn_task_size	= (spfn < epfn) ? epfn - spfn : 0;
  1670			kn.kn_nid	= nid;
  1671			(void) ktask_run_numa(&kn, 1, &ctl);
  1672	
  1673			nr_free += atomic64_read(&args.nr_pages);
  1674		}
  1675		pgdat_resize_unlock(pgdat, &flags);
  1676	
  1677		/* Sanity check that the next zone really is unpopulated */
  1678		WARN_ON(++zid < MAX_NR_ZONES && populated_zone(++zone));
  1679		VM_BUG_ON(nr_init != nr_free);
  1680	
  1681		zone->managed_pages += nr_free;
  1682	
  1683		pr_info("node %d initialised, %lu pages in %ums\n", nid, nr_free,
  1684						jiffies_to_msecs(jiffies - start));
  1685	
  1686		pgdat_init_report_one_done();
  1687		return 0;
  1688	}
  1689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
