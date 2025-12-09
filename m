Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BBC1E49F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 05:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765256417; cv=none; b=CyrN0hk0EO8eMAyncMpILsBjfAKx7QqVUdNjCu6aWwjgtsg16Yj8ISzLokboiq9S/5PFCHD+WKWLUBpgZMT2zluNO7mkFdVaz/Sa/mAU6RwtDK8ufIUSsRywK+KJh6GsZiuZZV2DxWNwYOolvK+GtoLLTnf8hzHKx+iBzvsv0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765256417; c=relaxed/simple;
	bh=whHY48NSL+xWjYoyaifwtSnJTdfYO3QeeWHWy+3x6Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZI4bOKzC+kZSMCCkbXWeEaIZzw9ZqStH+6Pe2TEf1glO92RANhA6mOU1I8TGE2wpnOzrj6BXRIgYPyjjuB9zbsJ8wymKrsVzS+HNowFCjJYjQHWV0zhISRTznTZWPwgvCI5vir4rxhcb44I3OQuWT+gXzDnM75H9JoVzgrzcJzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6MUjdqn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6MUjdqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765256414; x=1796792414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whHY48NSL+xWjYoyaifwtSnJTdfYO3QeeWHWy+3x6Wo=;
  b=e6MUjdqnFp8AErAScDqYy+PBg59KXsE4OWD66DU/QU8qO3f8FeVV2VPt
   Nw2qG0xVGaHSZuqLINDKaOAhpjIfuvSrBKUUyD6sAKpzq8w7CUvzhZ75n
   SlRn8E8eWUHR8zUhNMfAjbD7jI5bJFHFiM4/MSndfw2mPoFoI1gQ15T3j
   TFE03Npcd36tdSslcn3l3XflM2AlsVRIo+APIKQGH1Cm+A8Btj+olqcqF
   IgFGQcY+JIEQ5YQzyEuwfrRA+td1L2f6/23e8mRjD8ivrQE9yQnimpRFJ
   kZEJpkdImxk7d9+jO4/abKtIb+q0A89kP4K22o6XGjRQppWm5vAj56dbf
   w==;
X-CSE-ConnectionGUID: P8RyQBt9R7671P83famUFg==
X-CSE-MsgGUID: dSTDRULxRPexs8GFj5QTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67288210"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67288210"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 21:00:13 -0800
X-CSE-ConnectionGUID: /BYrTBjbS6qknxfEWKAnCw==
X-CSE-MsgGUID: 6VtrG/+ESYicbbQalL3xSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196181238"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2025 21:00:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSppZ-000000001Kv-0r4E;
	Tue, 09 Dec 2025 05:00:09 +0000
Date: Tue, 9 Dec 2025 12:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] mm/memblock.c:1409:20: warning: no
 previous prototype for function 'memblock_alloc_range_nid_flags'
Message-ID: <202512091204.Q8mSD8MC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d86ef4e1e96aa04c46e92dca30f98d069c1ad15a
commit: 64018b291c1f49622c4b23b303364d760306d662 [3493/3493] mm/memblock: Introduce ability to alloc memory from specify memory region
config: x86_64-randconfig-r122-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091204.Q8mSD8MC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091204.Q8mSD8MC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091204.Q8mSD8MC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memblock.c:18:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/memblock.c:1409:20: warning: no previous prototype for function 'memblock_alloc_range_nid_flags' [-Wmissing-prototypes]
    1409 | phys_addr_t __init memblock_alloc_range_nid_flags(phys_addr_t size,
         |                    ^
   mm/memblock.c:1409:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1409 | phys_addr_t __init memblock_alloc_range_nid_flags(phys_addr_t size,
         | ^
         | static 
   2 warnings generated.
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
