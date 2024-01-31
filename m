Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCC312CDBA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706722304; cv=none; b=Ptspw6DJoetO77d2zGE/CrtqR+iX/xwJTGm+84AgTW93FhW+huwDZcTMCkw0k1iWw4DlsC3MY/Vk6g2rtWlCCsyWUCZWBDwkCMfOUdnt8PlOiZwVJqSdCgkO1qiyCexLn3ltJg48cTha6S5gz6iINmkB2+gkxGzZDMAaOO6fMG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706722304; c=relaxed/simple;
	bh=wltGTMpfmaL2eMxzZxBnmsW4u6sqedo8E3jbKRXtVQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUmOR2U/1cesgqp7U8U4iviGqSV1A5ZYlmgK7AYeWk9ki6HCHH2XkvOZ2kTzFa2Wsue2mrUYTEow98CKeo7MqkWqD/EZ32f1+IC+mOWL+4Sj+ZIfZYze4RQAPA4XKlMNVXE2/7GPShxoSkpfte9W6t4fA26cZr0mvG6OWTCCJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzwmboUk; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzwmboUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706722301; x=1738258301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wltGTMpfmaL2eMxzZxBnmsW4u6sqedo8E3jbKRXtVQw=;
  b=RzwmboUkpHQ+9w83fEP3VQbmWl1EoPAs85r+rLppiDvNpalARWH6TRK1
   TjUFdbm6OPGzXj2jovp7EhYxqdqOOgdYP3sEUkGdH93X+cCQdjpeNQ9oJ
   2UeM/92rIub4UQEtoOeoz6PtqfaBr0uNNJ+6iuz8G3qfxsj6O8mJTuVo1
   p2cC+wUc6jrUC2s82Z1lY6KA40oJlP/sVSuT6CMPtf/hDVNWPXpPO0fr7
   cw9y0A2tjRuRwNXdo17JUgJ1qKOsN9UdIg+Q6zGvXK8mQfixZ3qdSmhvA
   /AwlZtepfA3AZxuA6toWkKoOxAHbfu6cfK7/1HAUnndjzsLQ+qSk0bfZA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403289251"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="403289251"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 09:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36931394"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 09:31:33 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVEQs-0001pw-2N;
	Wed, 31 Jan 2024 17:31:30 +0000
Date: Thu, 1 Feb 2024 01:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2392/2894] mm/memblock.c:1409:20: sparse: sparse:
 symbol 'memblock_alloc_range_nid_flags' was not declared. Should it be
 static?
Message-ID: <202402010125.UTtd3edB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: 64018b291c1f49622c4b23b303364d760306d662 [2392/2894] mm/memblock: Introduce ability to alloc memory from specify memory region
config: x86_64-randconfig-123-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010125.UTtd3edB-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010125.UTtd3edB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010125.UTtd3edB-lkp@intel.com/

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
