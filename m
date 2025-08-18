Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0DA2E22AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518719; cv=none; b=eSzUBhutNt0L/osmU0Fj+uLehREZ07Oxh0wO6xJxgqveT9DMk9GqnafI/mdo1maNIeKgsSvXKMPzUYYyvV4Kf3XGUFqI8D+jutt9cMwFhF9ZyZcwQ2IFnVnYnZE/LNLlusu75uwnPl5jIc0CpASMgQDdUOcv1B7beE8kYVIyiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518719; c=relaxed/simple;
	bh=Z/f6IcTXK1GixhGeALjt9w+Gnu5C3SDmQ71ag8XvENo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5/rnac4vjDwnksGQfZ09CQ39vxsEmOr7DQdSgDwaUMTWCvV5XFEe3h7aHCdlAhbvKrrBY6PVV/LtVxkE9eterJSLKge/paZX9zjrZAjCInDrZkmuexPlO4Xb4bt1CFV2rAeN5wPTc7YnZoJIE0mb/pIFxSzfrNGZTZXd47bh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JifIuB2x; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JifIuB2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755518717; x=1787054717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/f6IcTXK1GixhGeALjt9w+Gnu5C3SDmQ71ag8XvENo=;
  b=JifIuB2xuYvHuegmQaBX1tQ7eHV6E8+t3V1tU86LsdVKq/42obKTBp6p
   5VWwW05+2F+rjO6COQpzNX6X4KvAEYOfCzZuMdLUP3KPcHtr6JMhKLBNx
   +bw05elt28s67WaapIZ/kMtr3lY+cREuX62QlugGS+e2jL3gh4zWFhO/0
   0ofIBQlfNfSFJvNd8YAFJo4Bop68SbvdexwUGW/5Lko4sbKmI88V/+EkN
   eSxCuxoq0kJnG78JOoLzEbFQRZt48r+7BaWztzJvAC/LK3YFHYdfZwYTX
   KDRgVKh50tz8JXjZIIERoGSReFSV1vPkfGQ8WPhER9GwOdLz3wqUFbReR
   Q==;
X-CSE-ConnectionGUID: /0+GSncrS5mOQGjddPTXHQ==
X-CSE-MsgGUID: W7ChRtSJQ0GMZSa5YZiUuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69187027"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69187027"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:05:16 -0700
X-CSE-ConnectionGUID: 1bdMf18PTi+aBq21bltQBw==
X-CSE-MsgGUID: 9PP+sMb6S5Wzy06dNrStow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172767413"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2025 05:05:15 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unybw-00015H-14;
	Mon, 18 Aug 2025 12:05:12 +0000
Date: Mon, 18 Aug 2025 14:04:45 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] mm/memblock.c:1409:20: warning: no
 previous prototype for function 'memblock_alloc_range_nid_flags'
Message-ID: <202508181425.Y4IdsW4X-lkp@intel.com>
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
head:   57dc07b15d29507022f36882532a0fe229cf2805
commit: 64018b291c1f49622c4b23b303364d760306d662 [2687/2687] mm/memblock: Introduce ability to alloc memory from specify memory region
config: x86_64-buildonly-randconfig-2004-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181425.Y4IdsW4X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181425.Y4IdsW4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181425.Y4IdsW4X-lkp@intel.com/

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
