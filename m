Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C027144B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769932170; cv=none; b=jgeYiot3SIdumACVKZXuwweELy7vA+K4cgXrm2viOaO9wJ30m7vyE3ihg3yoAx5+HLwzVjkhwoEt1iEPPKffckmPm3UQiULhYtdxig/UEW14KpmFF4qGzS/GTjql2Mkbs2Ulkau5baOneheV0HJiSYLkuIQ6ytyl6+BV0AWE5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769932170; c=relaxed/simple;
	bh=BgYlm6hc70OoIvQcsdES2LuXiLPYCUsunRA3Ib8qX0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHOMsqo1XXQeZOaoqVQlrC6v3j7Vb0HsqBI3Oq45b6O+IrqJf+c4Z2NBOT1IACtncRQkpLxCns/EzYpW1z2oY21vliWRwQmmPvtarZDkQATxP6xk6z2T0PhCWjverddp+io/qE8VINNhmfhmWPtvtrMS541Y33w5vKvxLjxE+/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2TaDCLD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2TaDCLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769932168; x=1801468168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BgYlm6hc70OoIvQcsdES2LuXiLPYCUsunRA3Ib8qX0k=;
  b=Q2TaDCLDWXVcDELiN7xUJ54obZPCA3CK7WANFWwhaUcTkuXNhL4LEu5T
   f+cXZkHhHPcIyGliLBO35bD/buo6mupdiBA+ynY+E3M9NaUWFWy3B5bqG
   NkKWxuk554bt+HdybiPATFM+T2ytZ6Dkx0UUnmpqXUiPMA56PdH27N5Rk
   7Ij/p7ICFJODaoGJ0zp5ecjHlM1gqVJLNM/dgRQfRC7PUANuwQvwVad56
   s0/MhWkMJpJV+uW6yUyQBemtdBY0zyW7k1Y8y3S575qJJkfvoKMI/x7nR
   vn/A5BTTwtYcCQta+Ddv+lHQeU5y4x+GBY7LL/GJ0prYuU5MK8GUGSi9t
   A==;
X-CSE-ConnectionGUID: lCqow8THTEChWRbBx8XF7w==
X-CSE-MsgGUID: 4XyLfInyTYi5m+vSMDBSAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71020224"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71020224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 23:49:27 -0800
X-CSE-ConnectionGUID: QcaqVTKyRiK83walC5HhSw==
X-CSE-MsgGUID: 8ZwDQvxtSCCECvh1fRlbBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209130532"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jan 2026 23:49:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmSCy-000000002vV-0fKl;
	Sun, 01 Feb 2026 07:49:24 +0000
Date: Sun, 1 Feb 2026 08:48:48 +0100
From: kernel test robot <lkp@intel.com>
To: Youngjun Park <youngjun.park@lge.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/5] mm: memcontrol: add interface for swap tier
 selection
Message-ID: <202602010818.jW8u6PHX-lkp@intel.com>
References: <20260131125454.3187546-4-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131125454.3187546-4-youngjun.park@lge.com>

Hi Youngjun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5a3704ed2dce0b54a7f038b765bb752b87ee8cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260201-005914
base:   5a3704ed2dce0b54a7f038b765bb752b87ee8cc2
patch link:    https://lore.kernel.org/r/20260131125454.3187546-4-youngjun.park%40lge.com
patch subject: [RFC PATCH v3 3/5] mm: memcontrol: add interface for swap tier selection
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602010818.jW8u6PHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010818.jW8u6PHX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>> Documentation/admin-guide/cgroup-v2.rst:1876: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h


vim +1876 Documentation/admin-guide/cgroup-v2.rst

  1430	
  1431		  ==========            ================================
  1432		  swappiness            Swappiness value to reclaim with
  1433		  ==========            ================================
  1434	
  1435		Specifying a swappiness value instructs the kernel to perform
  1436		the reclaim with that swappiness value. Note that this has the
  1437		same semantics as vm.swappiness applied to memcg reclaim with
  1438		all the existing limitations and potential future extensions.
  1439	
  1440		The valid range for swappiness is [0-200, max], setting
  1441		swappiness=max exclusively reclaims anonymous memory.
  1442	
  1443	  memory.peak
  1444		A read-write single value file which exists on non-root cgroups.
  1445	
  1446		The max memory usage recorded for the cgroup and its descendants since
  1447		either the creation of the cgroup or the most recent reset for that FD.
  1448	
  1449		A write of any non-empty string to this file resets it to the
  1450		current memory usage for subsequent reads through the same
  1451		file descriptor.
  1452	
  1453	  memory.oom.group
  1454		A read-write single value file which exists on non-root
  1455		cgroups.  The default value is "0".
  1456	
  1457		Determines whether the cgroup should be treated as
  1458		an indivisible workload by the OOM killer. If set,
  1459		all tasks belonging to the cgroup or to its descendants
  1460		(if the memory cgroup is not a leaf cgroup) are killed
  1461		together or not at all. This can be used to avoid
  1462		partial kills to guarantee workload integrity.
  1463	
  1464		Tasks with the OOM protection (oom_score_adj set to -1000)
  1465		are treated as an exception and are never killed.
  1466	
  1467		If the OOM killer is invoked in a cgroup, it's not going
  1468		to kill any tasks outside of this cgroup, regardless
  1469		memory.oom.group values of ancestor cgroups.
  1470	
  1471	  memory.events
  1472		A read-only flat-keyed file which exists on non-root cgroups.
  1473		The following entries are defined.  Unless specified
  1474		otherwise, a value change in this file generates a file
  1475		modified event.
  1476	
  1477		Note that all fields in this file are hierarchical and the
  1478		file modified event can be generated due to an event down the
  1479		hierarchy. For the local events at the cgroup level see
  1480		memory.events.local.
  1481	
  1482		  low
  1483			The number of times the cgroup is reclaimed due to
  1484			high memory pressure even though its usage is under
  1485			the low boundary.  This usually indicates that the low
  1486			boundary is over-committed.
  1487	
  1488		  high
  1489			The number of times processes of the cgroup are
  1490			throttled and routed to perform direct memory reclaim
  1491			because the high memory boundary was exceeded.  For a
  1492			cgroup whose memory usage is capped by the high limit
  1493			rather than global memory pressure, this event's
  1494			occurrences are expected.
  1495	
  1496		  max
  1497			The number of times the cgroup's memory usage was
  1498			about to go over the max boundary.  If direct reclaim
  1499			fails to bring it down, the cgroup goes to OOM state.
  1500	
  1501		  oom
  1502			The number of time the cgroup's memory usage was
  1503			reached the limit and allocation was about to fail.
  1504	
  1505			This event is not raised if the OOM killer is not
  1506			considered as an option, e.g. for failed high-order
  1507			allocations or if caller asked to not retry attempts.
  1508	
  1509		  oom_kill
  1510			The number of processes belonging to this cgroup
  1511			killed by any kind of OOM killer.
  1512	
  1513	          oom_group_kill
  1514	                The number of times a group OOM has occurred.
  1515	
  1516	          sock_throttled
  1517	                The number of times network sockets associated with
  1518	                this cgroup are throttled.
  1519	
  1520	  memory.events.local
  1521		Similar to memory.events but the fields in the file are local
  1522		to the cgroup i.e. not hierarchical. The file modified event
  1523		generated on this file reflects only the local events.
  1524	
  1525	  memory.stat
  1526		A read-only flat-keyed file which exists on non-root cgroups.
  1527	
  1528		This breaks down the cgroup's memory footprint into different
  1529		types of memory, type-specific details, and other information
  1530		on the state and past events of the memory management system.
  1531	
  1532		All memory amounts are in bytes.
  1533	
  1534		The entries are ordered to be human readable, and new entries
  1535		can show up in the middle. Don't rely on items remaining in a
  1536		fixed position; use the keys to look up specific values!
  1537	
  1538		If the entry has no per-node counter (or not show in the
  1539		memory.numa_stat). We use 'npn' (non-per-node) as the tag
  1540		to indicate that it will not show in the memory.numa_stat.
  1541	
  1542		  anon
  1543			Amount of memory used in anonymous mappings such as
  1544			brk(), sbrk(), and mmap(MAP_ANONYMOUS). Note that
  1545			some kernel configurations might account complete larger
  1546			allocations (e.g., THP) if only some, but not all the
  1547			memory of such an allocation is mapped anymore.
  1548	
  1549		  file
  1550			Amount of memory used to cache filesystem data,
  1551			including tmpfs and shared memory.
  1552	
  1553		  kernel (npn)
  1554			Amount of total kernel memory, including
  1555			(kernel_stack, pagetables, percpu, vmalloc, slab) in
  1556			addition to other kernel memory use cases.
  1557	
  1558		  kernel_stack
  1559			Amount of memory allocated to kernel stacks.
  1560	
  1561		  pagetables
  1562	                Amount of memory allocated for page tables.
  1563	
  1564		  sec_pagetables
  1565			Amount of memory allocated for secondary page tables,
  1566			this currently includes KVM mmu allocations on x86
  1567			and arm64 and IOMMU page tables.
  1568	
  1569		  percpu (npn)
  1570			Amount of memory used for storing per-cpu kernel
  1571			data structures.
  1572	
  1573		  sock (npn)
  1574			Amount of memory used in network transmission buffers
  1575	
  1576		  vmalloc (npn)
  1577			Amount of memory used for vmap backed memory.
  1578	
  1579		  shmem
  1580			Amount of cached filesystem data that is swap-backed,
  1581			such as tmpfs, shm segments, shared anonymous mmap()s
  1582	
  1583		  zswap
  1584			Amount of memory consumed by the zswap compression backend.
  1585	
  1586		  zswapped
  1587			Amount of application memory swapped out to zswap.
  1588	
  1589		  file_mapped
  1590			Amount of cached filesystem data mapped with mmap(). Note
  1591			that some kernel configurations might account complete
  1592			larger allocations (e.g., THP) if only some, but not
  1593			not all the memory of such an allocation is mapped.
  1594	
  1595		  file_dirty
  1596			Amount of cached filesystem data that was modified but
  1597			not yet written back to disk
  1598	
  1599		  file_writeback
  1600			Amount of cached filesystem data that was modified and
  1601			is currently being written back to disk
  1602	
  1603		  swapcached
  1604			Amount of swap cached in memory. The swapcache is accounted
  1605			against both memory and swap usage.
  1606	
  1607		  anon_thp
  1608			Amount of memory used in anonymous mappings backed by
  1609			transparent hugepages
  1610	
  1611		  file_thp
  1612			Amount of cached filesystem data backed by transparent
  1613			hugepages
  1614	
  1615		  shmem_thp
  1616			Amount of shm, tmpfs, shared anonymous mmap()s backed by
  1617			transparent hugepages
  1618	
  1619		  inactive_anon, active_anon, inactive_file, active_file, unevictable
  1620			Amount of memory, swap-backed and filesystem-backed,
  1621			on the internal memory management lists used by the
  1622			page reclaim algorithm.
  1623	
  1624			As these represent internal list state (eg. shmem pages are on anon
  1625			memory management lists), inactive_foo + active_foo may not be equal to
  1626			the value for the foo counter, since the foo counter is type-based, not
  1627			list-based.
  1628	
  1629		  slab_reclaimable
  1630			Part of "slab" that might be reclaimed, such as
  1631			dentries and inodes.
  1632	
  1633		  slab_unreclaimable
  1634			Part of "slab" that cannot be reclaimed on memory
  1635			pressure.
  1636	
  1637		  slab (npn)
  1638			Amount of memory used for storing in-kernel data
  1639			structures.
  1640	
  1641		  workingset_refault_anon
  1642			Number of refaults of previously evicted anonymous pages.
  1643	
  1644		  workingset_refault_file
  1645			Number of refaults of previously evicted file pages.
  1646	
  1647		  workingset_activate_anon
  1648			Number of refaulted anonymous pages that were immediately
  1649			activated.
  1650	
  1651		  workingset_activate_file
  1652			Number of refaulted file pages that were immediately activated.
  1653	
  1654		  workingset_restore_anon
  1655			Number of restored anonymous pages which have been detected as
  1656			an active workingset before they got reclaimed.
  1657	
  1658		  workingset_restore_file
  1659			Number of restored file pages which have been detected as an
  1660			active workingset before they got reclaimed.
  1661	
  1662		  workingset_nodereclaim
  1663			Number of times a shadow node has been reclaimed
  1664	
  1665		  pswpin (npn)
  1666			Number of pages swapped into memory
  1667	
  1668		  pswpout (npn)
  1669			Number of pages swapped out of memory
  1670	
  1671		  pgscan (npn)
  1672			Amount of scanned pages (in an inactive LRU list)
  1673	
  1674		  pgsteal (npn)
  1675			Amount of reclaimed pages
  1676	
  1677		  pgscan_kswapd (npn)
  1678			Amount of scanned pages by kswapd (in an inactive LRU list)
  1679	
  1680		  pgscan_direct (npn)
  1681			Amount of scanned pages directly  (in an inactive LRU list)
  1682	
  1683		  pgscan_khugepaged (npn)
  1684			Amount of scanned pages by khugepaged  (in an inactive LRU list)
  1685	
  1686		  pgscan_proactive (npn)
  1687			Amount of scanned pages proactively (in an inactive LRU list)
  1688	
  1689		  pgsteal_kswapd (npn)
  1690			Amount of reclaimed pages by kswapd
  1691	
  1692		  pgsteal_direct (npn)
  1693			Amount of reclaimed pages directly
  1694	
  1695		  pgsteal_khugepaged (npn)
  1696			Amount of reclaimed pages by khugepaged
  1697	
  1698		  pgsteal_proactive (npn)
  1699			Amount of reclaimed pages proactively
  1700	
  1701		  pgfault (npn)
  1702			Total number of page faults incurred
  1703	
  1704		  pgmajfault (npn)
  1705			Number of major page faults incurred
  1706	
  1707		  pgrefill (npn)
  1708			Amount of scanned pages (in an active LRU list)
  1709	
  1710		  pgactivate (npn)
  1711			Amount of pages moved to the active LRU list
  1712	
  1713		  pgdeactivate (npn)
  1714			Amount of pages moved to the inactive LRU list
  1715	
  1716		  pglazyfree (npn)
  1717			Amount of pages postponed to be freed under memory pressure
  1718	
  1719		  pglazyfreed (npn)
  1720			Amount of reclaimed lazyfree pages
  1721	
  1722		  swpin_zero
  1723			Number of pages swapped into memory and filled with zero, where I/O
  1724			was optimized out because the page content was detected to be zero
  1725			during swapout.
  1726	
  1727		  swpout_zero
  1728			Number of zero-filled pages swapped out with I/O skipped due to the
  1729			content being detected as zero.
  1730	
  1731		  zswpin
  1732			Number of pages moved in to memory from zswap.
  1733	
  1734		  zswpout
  1735			Number of pages moved out of memory to zswap.
  1736	
  1737		  zswpwb
  1738			Number of pages written from zswap to swap.
  1739	
  1740		  thp_fault_alloc (npn)
  1741			Number of transparent hugepages which were allocated to satisfy
  1742			a page fault. This counter is not present when CONFIG_TRANSPARENT_HUGEPAGE
  1743	                is not set.
  1744	
  1745		  thp_collapse_alloc (npn)
  1746			Number of transparent hugepages which were allocated to allow
  1747			collapsing an existing range of pages. This counter is not
  1748			present when CONFIG_TRANSPARENT_HUGEPAGE is not set.
  1749	
  1750		  thp_swpout (npn)
  1751			Number of transparent hugepages which are swapout in one piece
  1752			without splitting.
  1753	
  1754		  thp_swpout_fallback (npn)
  1755			Number of transparent hugepages which were split before swapout.
  1756			Usually because failed to allocate some continuous swap space
  1757			for the huge page.
  1758	
  1759		  numa_pages_migrated (npn)
  1760			Number of pages migrated by NUMA balancing.
  1761	
  1762		  numa_pte_updates (npn)
  1763			Number of pages whose page table entries are modified by
  1764			NUMA balancing to produce NUMA hinting faults on access.
  1765	
  1766		  numa_hint_faults (npn)
  1767			Number of NUMA hinting faults.
  1768	
  1769		  pgdemote_kswapd
  1770			Number of pages demoted by kswapd.
  1771	
  1772		  pgdemote_direct
  1773			Number of pages demoted directly.
  1774	
  1775		  pgdemote_khugepaged
  1776			Number of pages demoted by khugepaged.
  1777	
  1778		  pgdemote_proactive
  1779			Number of pages demoted by proactively.
  1780	
  1781		  hugetlb
  1782			Amount of memory used by hugetlb pages. This metric only shows
  1783			up if hugetlb usage is accounted for in memory.current (i.e.
  1784			cgroup is mounted with the memory_hugetlb_accounting option).
  1785	
  1786	  memory.numa_stat
  1787		A read-only nested-keyed file which exists on non-root cgroups.
  1788	
  1789		This breaks down the cgroup's memory footprint into different
  1790		types of memory, type-specific details, and other information
  1791		per node on the state of the memory management system.
  1792	
  1793		This is useful for providing visibility into the NUMA locality
  1794		information within an memcg since the pages are allowed to be
  1795		allocated from any physical node. One of the use case is evaluating
  1796		application performance by combining this information with the
  1797		application's CPU allocation.
  1798	
  1799		All memory amounts are in bytes.
  1800	
  1801		The output format of memory.numa_stat is::
  1802	
  1803		  type N0=<bytes in node 0> N1=<bytes in node 1> ...
  1804	
  1805		The entries are ordered to be human readable, and new entries
  1806		can show up in the middle. Don't rely on items remaining in a
  1807		fixed position; use the keys to look up specific values!
  1808	
  1809		The entries can refer to the memory.stat.
  1810	
  1811	  memory.swap.current
  1812		A read-only single value file which exists on non-root
  1813		cgroups.
  1814	
  1815		The total amount of swap currently being used by the cgroup
  1816		and its descendants.
  1817	
  1818	  memory.swap.high
  1819		A read-write single value file which exists on non-root
  1820		cgroups.  The default is "max".
  1821	
  1822		Swap usage throttle limit.  If a cgroup's swap usage exceeds
  1823		this limit, all its further allocations will be throttled to
  1824		allow userspace to implement custom out-of-memory procedures.
  1825	
  1826		This limit marks a point of no return for the cgroup. It is NOT
  1827		designed to manage the amount of swapping a workload does
  1828		during regular operation. Compare to memory.swap.max, which
  1829		prohibits swapping past a set amount, but lets the cgroup
  1830		continue unimpeded as long as other memory can be reclaimed.
  1831	
  1832		Healthy workloads are not expected to reach this limit.
  1833	
  1834	  memory.swap.peak
  1835		A read-write single value file which exists on non-root cgroups.
  1836	
  1837		The max swap usage recorded for the cgroup and its descendants since
  1838		the creation of the cgroup or the most recent reset for that FD.
  1839	
  1840		A write of any non-empty string to this file resets it to the
  1841		current memory usage for subsequent reads through the same
  1842		file descriptor.
  1843	
  1844	  memory.swap.max
  1845		A read-write single value file which exists on non-root
  1846		cgroups.  The default is "max".
  1847	
  1848		Swap usage hard limit.  If a cgroup's swap usage reaches this
  1849		limit, anonymous memory of the cgroup will not be swapped out.
  1850	
  1851	  memory.swap.tiers
  1852	        A read-write nested-keyed file which exists on non-root
  1853	        cgroups. The default is to enable all tiers.
  1854	
  1855	        This interface allows selecting which swap tiers a cgroup can
  1856	        use for swapping out memory.
  1857	
  1858	        The effective tiers are inherited from the parent. Only tiers
  1859	        effective in the parent can be effective in the child. However,
  1860	        the child can explicitly disable tiers allowed by the parent.
  1861	
  1862	        When read, the file shows two lines:
  1863	          - The first line shows the operation string that was
  1864	            written to this file.
  1865	          - The second line shows the effective operation after
  1866	            merging with parent settings.
  1867	
  1868	        When writing, the format is:
  1869	          (+/-)(TIER_NAME) (+/-)(TIER_NAME) ...
  1870	
  1871	        Valid tier names are those configured in
  1872	        /sys/kernel/mm/swap/tiers.
  1873	
  1874	        Each tier can be prefixed with:
  1875	          +    Enable this tier
> 1876	          -    Disable this tier
  1877	
  1878	  memory.swap.events
  1879		A read-only flat-keyed file which exists on non-root cgroups.
  1880		The following entries are defined.  Unless specified
  1881		otherwise, a value change in this file generates a file
  1882		modified event.
  1883	
  1884		  high
  1885			The number of times the cgroup's swap usage was over
  1886			the high threshold.
  1887	
  1888		  max
  1889			The number of times the cgroup's swap usage was about
  1890			to go over the max boundary and swap allocation
  1891			failed.
  1892	
  1893		  fail
  1894			The number of times swap allocation failed either
  1895			because of running out of swap system-wide or max
  1896			limit.
  1897	
  1898		When reduced under the current usage, the existing swap
  1899		entries are reclaimed gradually and the swap usage may stay
  1900		higher than the limit for an extended period of time.  This
  1901		reduces the impact on the workload and memory management.
  1902	
  1903	  memory.zswap.current
  1904		A read-only single value file which exists on non-root
  1905		cgroups.
  1906	
  1907		The total amount of memory consumed by the zswap compression
  1908		backend.
  1909	
  1910	  memory.zswap.max
  1911		A read-write single value file which exists on non-root
  1912		cgroups.  The default is "max".
  1913	
  1914		Zswap usage hard limit. If a cgroup's zswap pool reaches this
  1915		limit, it will refuse to take any more stores before existing
  1916		entries fault back in or are written out to disk.
  1917	
  1918	  memory.zswap.writeback
  1919		A read-write single value file. The default value is "1".
  1920		Note that this setting is hierarchical, i.e. the writeback would be
  1921		implicitly disabled for child cgroups if the upper hierarchy
  1922		does so.
  1923	
  1924		When this is set to 0, all swapping attempts to swapping devices
  1925		are disabled. This included both zswap writebacks, and swapping due
  1926		to zswap store failures. If the zswap store failures are recurring
  1927		(for e.g if the pages are incompressible), users can observe
  1928		reclaim inefficiency after disabling writeback (because the same
  1929		pages might be rejected again and again).
  1930	
  1931		Note that this is subtly different from setting memory.swap.max to
  1932		0, as it still allows for pages to be written to the zswap pool.
  1933		This setting has no effect if zswap is disabled, and swapping
  1934		is allowed unless memory.swap.max is set to 0.
  1935	
  1936	  memory.pressure
  1937		A read-only nested-keyed file.
  1938	
  1939		Shows pressure stall information for memory. See
  1940		:ref:`Documentation/accounting/psi.rst <psi>` for details.
  1941	
  1942	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
