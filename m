Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558176BB3E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VayxIxux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705068579; x=1736604579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gs8zCdavKcneW5GYcfdaFOc6Uxozgo32oA4YkhyJEl0=;
  b=VayxIxuxm75aypLzeZeUzVaHo8enVfEqyDaXKyrF6OfGHyKrYTmXl9Nc
   2fqC2f/2na0MdgEO9hFhcVjnIc7hg2sW8KLWbjN1qIa1gJ3WmLwI3rNkB
   xXWMH88mGTgKFIhnkoqb7Fgnf0v40H31cbyMx7EmnQXwpiZ6J/AsjaZz2
   3mpHS4urzbzGFjPYSHHsgrEGaFeMSzcR0mDl6vOWEGqLqdjSSjyaSX1Ql
   uA4m/WShlDHIedxncSTNWt0srpJBvvahkCkKUZOliQfnT/3tZiiGTc6yj
   UvdrIE9F/a6dbNXWg8sMxMaD07KkawD58sXW1GJAbvHkXr4bKfoYNMtrg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="402947390"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="402947390"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 06:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906333901"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="906333901"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 06:09:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOIDz-0009YO-0j;
	Fri, 12 Jan 2024 14:09:33 +0000
Date: Fri, 12 Jan 2024 22:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2340/2356] mm/memblock.c:1409:20: warning: no
 previous prototype for 'memblock_alloc_range_nid_flags'
Message-ID: <202401122208.qok7pgPS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: 64018b291c1f49622c4b23b303364d760306d662 [2340/2356] mm/memblock: Introduce ability to alloc memory from specify memory region
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240112/202401122208.qok7pgPS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122208.qok7pgPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122208.qok7pgPS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:1409:20: warning: no previous prototype for 'memblock_alloc_range_nid_flags' [-Wmissing-prototypes]
    1409 | phys_addr_t __init memblock_alloc_range_nid_flags(phys_addr_t size,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> mm/memblock.c:1579: warning: expecting prototype for memblock_alloc_internal(). Prototype was for __memblock_alloc_internal() instead


vim +/memblock_alloc_range_nid_flags +1409 mm/memblock.c

  1386	
  1387	/**
  1388	 * memblock_alloc_range_nid_flags - allocate boot memory block with specify flag
  1389	 * @size: size of memory block to be allocated in bytes
  1390	 * @align: alignment of the region and block's size
  1391	 * @start: the lower bound of the memory region to allocate (phys address)
  1392	 * @end: the upper bound of the memory region to allocate (phys address)
  1393	 * @nid: nid of the free area to find, %NUMA_NO_NODE for any node
  1394	 * @exact_nid: control the allocation fall back to other nodes
  1395	 * @flags: alloc memory from specify memblock flag
  1396	 *
  1397	 * The allocation is performed from memory region limited by
  1398	 * memblock.current_limit if @end == %MEMBLOCK_ALLOC_ACCESSIBLE.
  1399	 *
  1400	 * If the specified node can not hold the requested memory and @exact_nid
  1401	 * is false, the allocation falls back to any node in the system.
  1402	 *
  1403	 * In addition, function sets the min_count to 0 using kmemleak_alloc_phys for
  1404	 * allocated boot memory block, so that it is never reported as leaks.
  1405	 *
  1406	 * Return:
  1407	 * Physical address of allocated memory block on success, %0 on failure.
  1408	 */
> 1409	phys_addr_t __init memblock_alloc_range_nid_flags(phys_addr_t size,
  1410						phys_addr_t align, phys_addr_t start,
  1411						phys_addr_t end, int nid,
  1412						bool exact_nid,
  1413						enum memblock_flags flags)
  1414	{
  1415		phys_addr_t found;
  1416	
  1417		if (WARN_ONCE(nid == MAX_NUMNODES, "Usage of MAX_NUMNODES is deprecated. Use NUMA_NO_NODE instead\n"))
  1418			nid = NUMA_NO_NODE;
  1419	
  1420		if (!align) {
  1421			/* Can't use WARNs this early in boot on powerpc */
  1422			dump_stack();
  1423			align = SMP_CACHE_BYTES;
  1424		}
  1425	
  1426	again:
  1427		found = memblock_find_in_range_node(size, align, start, end, nid,
  1428						    flags);
  1429		if (found && !memblock_reserve(found, size))
  1430			goto done;
  1431	
  1432		if (nid != NUMA_NO_NODE && !exact_nid) {
  1433			found = memblock_find_in_range_node(size, align, start,
  1434							    end, NUMA_NO_NODE,
  1435							    flags);
  1436			if (found && !memblock_reserve(found, size))
  1437				goto done;
  1438		}
  1439	
  1440		if (flags & MEMBLOCK_MIRROR) {
  1441			flags &= ~MEMBLOCK_MIRROR;
  1442			pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
  1443				&size);
  1444			goto again;
  1445		}
  1446	
  1447		return 0;
  1448	
  1449	done:
  1450		/*
  1451		 * Skip kmemleak for those places like kasan_init() and
  1452		 * early_pgtable_alloc() due to high volume.
  1453		 */
  1454		if (end != MEMBLOCK_ALLOC_NOLEAKTRACE)
  1455			/*
  1456			 * Memblock allocated blocks are never reported as
  1457			 * leaks. This is because many of these blocks are
  1458			 * only referred via the physical address which is
  1459			 * not looked up by kmemleak.
  1460			 */
  1461			kmemleak_alloc_phys(found, size, 0);
  1462	
  1463		/*
  1464		 * Some Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP,
  1465		 * require memory to be accepted before it can be used by the
  1466		 * guest.
  1467		 *
  1468		 * Accept the memory of the allocated buffer.
  1469		 */
  1470		accept_memory(found, found + size);
  1471	
  1472		return found;
  1473	}
  1474	
  1475	/**
  1476	 * memblock_alloc_range_nid - allocate boot memory block
  1477	 * @size: size of memory block to be allocated in bytes
  1478	 * @align: alignment of the region and block's size
  1479	 * @start: the lower bound of the memory region to allocate (phys address)
  1480	 * @end: the upper bound of the memory region to allocate (phys address)
  1481	 * @nid: nid of the free area to find, %NUMA_NO_NODE for any node
  1482	 * @exact_nid: control the allocation fall back to other nodes
  1483	 *
  1484	 * The allocation is performed from memory region limited by
  1485	 * memblock.current_limit if @end == %MEMBLOCK_ALLOC_ACCESSIBLE.
  1486	 *
  1487	 * If the specified node can not hold the requested memory and @exact_nid
  1488	 * is false, the allocation falls back to any node in the system.
  1489	 *
  1490	 * For systems with memory mirroring, the allocation is attempted first
  1491	 * from the regions with mirroring enabled and then retried from any
  1492	 * memory region.
  1493	 *
  1494	 * In addition, function using kmemleak_alloc_phys for allocated boot
  1495	 * memory block, it is never reported as leaks.
  1496	 *
  1497	 * Return:
  1498	 * Physical address of allocated memory block on success, %0 on failure.
  1499	 */
  1500	phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
  1501						phys_addr_t align, phys_addr_t start,
  1502						phys_addr_t end, int nid,
  1503						bool exact_nid)
  1504	{
  1505		return memblock_alloc_range_nid_flags(size, align, start, end, nid,
  1506						      exact_nid,
  1507						      choose_memblock_flags());
  1508	}
  1509	
  1510	/**
  1511	 * memblock_phys_alloc_range - allocate a memory block inside specified range
  1512	 * @size: size of memory block to be allocated in bytes
  1513	 * @align: alignment of the region and block's size
  1514	 * @start: the lower bound of the memory region to allocate (physical address)
  1515	 * @end: the upper bound of the memory region to allocate (physical address)
  1516	 *
  1517	 * Allocate @size bytes in the between @start and @end.
  1518	 *
  1519	 * Return: physical address of the allocated memory block on success,
  1520	 * %0 on failure.
  1521	 */
  1522	phys_addr_t __init memblock_phys_alloc_range(phys_addr_t size,
  1523						     phys_addr_t align,
  1524						     phys_addr_t start,
  1525						     phys_addr_t end)
  1526	{
  1527		memblock_dbg("%s: %llu bytes align=0x%llx from=%pa max_addr=%pa %pS\n",
  1528			     __func__, (u64)size, (u64)align, &start, &end,
  1529			     (void *)_RET_IP_);
  1530		return memblock_alloc_range_nid(size, align, start, end, NUMA_NO_NODE,
  1531						false);
  1532	}
  1533	
  1534	/**
  1535	 * memblock_phys_alloc_try_nid - allocate a memory block from specified NUMA node
  1536	 * @size: size of memory block to be allocated in bytes
  1537	 * @align: alignment of the region and block's size
  1538	 * @nid: nid of the free area to find, %NUMA_NO_NODE for any node
  1539	 *
  1540	 * Allocates memory block from the specified NUMA node. If the node
  1541	 * has no available memory, attempts to allocated from any node in the
  1542	 * system.
  1543	 *
  1544	 * Return: physical address of the allocated memory block on success,
  1545	 * %0 on failure.
  1546	 */
  1547	phys_addr_t __init memblock_phys_alloc_try_nid(phys_addr_t size, phys_addr_t align, int nid)
  1548	{
  1549		return memblock_alloc_range_nid(size, align, 0,
  1550						MEMBLOCK_ALLOC_ACCESSIBLE, nid, false);
  1551	}
  1552	
  1553	/**
  1554	 * memblock_alloc_internal - allocate boot memory block
  1555	 * @size: size of memory block to be allocated in bytes
  1556	 * @align: alignment of the region and block's size
  1557	 * @min_addr: the lower bound of the memory region to allocate (phys address)
  1558	 * @max_addr: the upper bound of the memory region to allocate (phys address)
  1559	 * @nid: nid of the free area to find, %NUMA_NO_NODE for any node
  1560	 * @exact_nid: control the allocation fall back to other nodes
  1561	 * @flags: alloc memory from specify memblock flag
  1562	 *
  1563	 * Allocates memory block using memblock_alloc_range_nid() and
  1564	 * converts the returned physical address to virtual.
  1565	 *
  1566	 * The @min_addr limit is dropped if it can not be satisfied and the allocation
  1567	 * will fall back to memory below @min_addr. Other constraints, such
  1568	 * as node and mirrored memory will be handled again in
  1569	 * memblock_alloc_range_nid().
  1570	 *
  1571	 * Return:
  1572	 * Virtual address of allocated memory block on success, NULL on failure.
  1573	 */
  1574	static void * __init __memblock_alloc_internal(
  1575					phys_addr_t size, phys_addr_t align,
  1576					phys_addr_t min_addr, phys_addr_t max_addr,
  1577					int nid, bool exact_nid,
  1578					enum memblock_flags flags)
> 1579	{
  1580		phys_addr_t alloc;
  1581	
  1582		/*
  1583		 * Detect any accidental use of these APIs after slab is ready, as at
  1584		 * this moment memblock may be deinitialized already and its
  1585		 * internal data may be destroyed (after execution of memblock_free_all)
  1586		 */
  1587		if (WARN_ON_ONCE(slab_is_available()))
  1588			return kzalloc_node(size, GFP_NOWAIT, nid);
  1589	
  1590		if (max_addr > memblock.current_limit)
  1591			max_addr = memblock.current_limit;
  1592	
  1593		alloc = memblock_alloc_range_nid_flags(size, align, min_addr, max_addr, nid,
  1594						exact_nid, flags);
  1595	
  1596		/* retry allocation without lower limit */
  1597		if (!alloc && min_addr)
  1598			alloc = memblock_alloc_range_nid_flags(size, align, 0, max_addr, nid,
  1599							exact_nid, flags);
  1600	
  1601		if (!alloc)
  1602			return NULL;
  1603	
  1604		return phys_to_virt(alloc);
  1605	}
  1606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
