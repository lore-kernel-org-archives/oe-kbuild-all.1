Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C62AD00
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751800906; cv=none; b=Huh8uhBOtBz5EHbo52BGarqXf15qgcNNHt/m1Nh6WqWmYNu8iSXtSbakhra38FdYaIU15BQKkvintpMe4EJsJhYjZBAcF9g02Qil2jp768ebFFlx52xLF9/OnC96Y0ggb4ZvNgo21T98XIcyjolAEW9o13ehNF8TTdzJLr+lGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751800906; c=relaxed/simple;
	bh=cCeGKBNquo6WM75vwFGVKznwR1w66GtqoCxRjWXQoL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9pukLnqwaDkYYMBBk8UAFCTKEDpE2B4Tb5Vsqkdi9j+gN/zmYgL/Anvq2Lw1q56BIRIMPJTAWRTKjEU4rDNXyXwG3VDZIqehsK906gIW87nKjwtHtd56Ym+hWatNMKEvoWEYWra9lWjvCraxqTPE/5tJlyKzNvOyEYmvhcW91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1RlstBZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1RlstBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751800904; x=1783336904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cCeGKBNquo6WM75vwFGVKznwR1w66GtqoCxRjWXQoL4=;
  b=B1RlstBZhBtpiL3cug3wUWx6lXah+n8HMs5YWBAHgAxmKPIlt3JVVfIL
   z/SSrwqs2+h8Yh7W2ORvDVsW4oCioCkzbHMj/e9FuG0L2p0LQw0dwAVG7
   Lxr4cYlZ7W4Lzm8HywlCo/GR2KHLjYVzqDsHDcqnwjzVEnOtylGwlmwaY
   e4kqjx7MMqAp9pLJ82+V9dHnKg3jt4W0z0rx7xXi68Cx/a48a9NYBvBZK
   hOkV7JOtkWs0P5hnXnXhcrp9xv08XvGOpHYQnc0skbeytCSo9XHTElzR8
   Sd4VdNK3rGdZWGRvw0aTZF6mYA7HvkZRtx4hV92lZVbmHXl33KDl9lCT9
   w==;
X-CSE-ConnectionGUID: jKZMg4hfTkyx3g4ZoFVZ6A==
X-CSE-MsgGUID: N/RjYdKBTRSGt3RnU1gYdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53966180"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53966180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 04:21:42 -0700
X-CSE-ConnectionGUID: ih5MVqyvQ9iTUnfRYnSJ5w==
X-CSE-MsgGUID: a1Gi1VGwQjmUel11j99LRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="178647486"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2025 04:21:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYNRD-00052h-0N;
	Sun, 06 Jul 2025 11:21:39 +0000
Date: Sun, 6 Jul 2025 19:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464] mm/memblock.c:1409:20: sparse: sparse:
 symbol 'memblock_alloc_range_nid_flags' was not declared. Should it be
 static?
Message-ID: <202507061912.dAsXiJp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9f7917e90ec872036160e2cb3a1d3c1856cb406
commit: 64018b291c1f49622c4b23b303364d760306d662 [2464/2464] mm/memblock: Introduce ability to alloc memory from specify memory region
config: arm64-randconfig-r111-20250705 (https://download.01.org/0day-ci/archive/20250706/202507061912.dAsXiJp3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce: (https://download.01.org/0day-ci/archive/20250706/202507061912.dAsXiJp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061912.dAsXiJp3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memblock.c:1409:20: sparse: sparse: symbol 'memblock_alloc_range_nid_flags' was not declared. Should it be static?

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
