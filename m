Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68C2E3380
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 05:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742706393; cv=none; b=JTl/WpS3uqDQmFm1y8GcxpHL1FDBM2nskcmW5iRZdabAyK29+nC/DZ/yo4/PKQ4K2IxminZRQUgzALh8+kjHGHrg1X4HTHiHT57+HDaf1vnxRtZfAU5a5citGsDinB+43u6nr3ey7dbqYKFQKnhFNR8U0gSVQ8Tzs3YNJeuKqnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742706393; c=relaxed/simple;
	bh=jL+BpofRkNF7/SZkcrlOQH8NGjL0tFfAB6LAO0HWH3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KcKumOGQ+kaUdNhQYJhTATWYX9jCllLzwdWro4xhClmLOi9swEa070uHlxt1lMEDw7zJMsT3J7C5bMGP7ZBELJZ5FzjPekdIa5r0XWd68nzroNvJi57DGG8XJYum+mkWWligfH6mxrApLYT+qmEuF+PzCXsTz9qLOFNXt/P0oYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLPhUmxu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLPhUmxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742706391; x=1774242391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jL+BpofRkNF7/SZkcrlOQH8NGjL0tFfAB6LAO0HWH3g=;
  b=GLPhUmxuRZj8pGSq0LVBZ9Ra0z6mahqDpxkQjc2JRbKnsXtIh0p8JroH
   XzGsdKmUBiMWsAhHEk0j5W2tbUeMVEj8aV4RczkNl7Mvp9dA5Kv4yVeoM
   4BCv4CEcxyX7KAkQN5dOUmV10OGIiivsn9hMp9OFr1XjNlpYMcWw6LD5t
   qUgs83Kdn9muTJHsnW0M2LzaQKmEbJVLuC+dS+669BsoEcQmetpn6lrYF
   6CqFi2Krg/sFDcToOtwLvB6SGJ7srQ18k1SBdQqP8CyzO18/OYQaG9Y9C
   DpLurXu1m4H6MMAS+3D3CUwiaSju3jI+6DesHIVWkX1AnImcfVroxb5Fh
   A==;
X-CSE-ConnectionGUID: 96uhet5xRRmLo0+MXMtH5w==
X-CSE-MsgGUID: qcDWz5MdSpaAzB4K4nSqdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="44115632"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="44115632"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 22:06:30 -0700
X-CSE-ConnectionGUID: HfcgX55JQgqcrNkVF0uCcA==
X-CSE-MsgGUID: +UKJn2UFS2ueEMrxpFei6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="123549782"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2025 22:06:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twDXX-0002b9-1p;
	Sun, 23 Mar 2025 05:06:27 +0000
Date: Sun, 23 Mar 2025 13:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1424/1424] mm/page_alloc.c:1645:3:
 warning: cast from 'int (*)(unsigned long, unsigned long, struct
 deferred_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void
 *)') converts to incompatible function type
Message-ID: <202503231236.qN1C5HOM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   abf385ef625e6aeb4923da42fef9ebce788f4ecf
commit: eb761d6521c32c006a4987260394a61c6684fb35 [1424/1424] mm: parallelize deferred struct page initialization within each node
config: x86_64-buildonly-randconfig-003-20250217 (https://download.01.org/0day-ci/archive/20250323/202503231236.qN1C5HOM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503231236.qN1C5HOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231236.qN1C5HOM-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> mm/page_alloc.c:1645:3: warning: cast from 'int (*)(unsigned long, unsigned long, struct deferred_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to incompatible function type [-Wcast-function-type-mismatch]
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
   mm/page_alloc.c:1661:3: warning: cast from 'int (*)(unsigned long, unsigned long, struct deferred_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to incompatible function type [-Wcast-function-type-mismatch]
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
   4 warnings generated.


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
