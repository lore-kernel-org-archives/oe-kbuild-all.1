Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7D52773D3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 07:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350985; cv=none; b=CmwqvT/626vrnWKc02ibkOBiDauIe7b8XHjhKirAw8ZdDXGvJMmUxqAsP36Td+fjN6NG0+hnDU/1O7y+R7XVZwP9dJtliozI4Grd3rMOuBk+JyNf07HM0VMeDO/ObUVaGlivexgQizDAPt86aCclzOnN0UKkSlJjPHB7Y0bnAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350985; c=relaxed/simple;
	bh=q1FXn9kcsmHy88RDH5wcxVmOxlj/S2kj9CEtL/N87hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPPqPWaPbnVnHfjyjcy4KVLiWXMaMvsw0gFx8qDt4xrgQns2SVEHBdi7drikGA+cdJDWDpOffl9VMku1VvBZ5S6W6iZg/LCNYtoNqcPBTYvcewQdX2++eoO+2T3PjsGIWNUwiekPkvYhugaqSI39ZuTQfu0eGx3lE4m/xia9BYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEkSOvaG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEkSOvaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765350982; x=1796886982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1FXn9kcsmHy88RDH5wcxVmOxlj/S2kj9CEtL/N87hc=;
  b=IEkSOvaG2CA8WKV1ueqB4XDY99Y2zGgbbPa0d40KJ0b8jDaa73BCgCuI
   jS8Gtzi5mwrMUZE+dGjE/SHBWikqbdETYwQDuw0CqpY9/5z0Ep35sHqfd
   hTE9J8j8h0RU1xFdaL9qCI8oorQ2TC75C8+QOl0Z2RTX7JLekYW5St/X6
   mNQCi0pwFYTJYH0I7UBT/i6z6uubMbAGTMS7BB1OzcjZYbceYvkYiVREz
   LNQR1SrSRvS4PtExoSSYWinnBi3ibg0Y/ho8ywPUGib1Gu0222khsp2I2
   bkH6fi8D6/luo8KrpPQbEV36vj1BzU02Hxr5Y/LSP4Mcdyfy+dUT6SXA6
   w==;
X-CSE-ConnectionGUID: jJt1ovDBSemOVfWqvnbckQ==
X-CSE-MsgGUID: J/yFQOdkQY+l3fSPD/yNQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67204450"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67204450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 23:16:21 -0800
X-CSE-ConnectionGUID: srhBLJ/qRb6UlgUEgJPFMQ==
X-CSE-MsgGUID: bXGQF10iTPGAZ+yJ15Jcyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="227103848"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2025 23:16:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTEQr-000000000Wu-3Kc8;
	Wed, 10 Dec 2025 07:16:17 +0000
Date: Wed, 10 Dec 2025 08:15:31 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] mm/memblock.c:1409:20: warning: no
 previous prototype for 'memblock_alloc_range_nid_flags'
Message-ID: <202512100803.QFVpHYI3-lkp@intel.com>
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
head:   d7d7f131569485a9b6737b85cd8144196135b1a1
commit: 64018b291c1f49622c4b23b303364d760306d662 [3508/3508] mm/memblock: Introduce ability to alloc memory from specify memory region
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512100803.QFVpHYI3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100803.QFVpHYI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100803.QFVpHYI3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:1409:20: warning: no previous prototype for 'memblock_alloc_range_nid_flags' [-Wmissing-prototypes]
    1409 | phys_addr_t __init memblock_alloc_range_nid_flags(phys_addr_t size,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
