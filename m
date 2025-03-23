Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD5AD24
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 03:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742700198; cv=none; b=EBFanTANm/s7NBrlCrZwERrZQtpXyAIWetCnA8AjJh2MEnjZ1q1bGZv3HFh+nzH7g8FRI2ljfpnC8/yWrLmPKQcY+dX2Y6NRj8pk65hCJyzeKMNMnsxMXiA51ZqWZKZCyjPMiAmt9GCNpRqJ22PGw0gryYFYl1SxoCLJjZziFT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742700198; c=relaxed/simple;
	bh=3ksD2gfWzxD14X9KJWuL5h60jgS49ppa04LHL6mV2rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UuEaQ8ZvfF0FZ6aV1EqIgX3D/6whmmwzrHxa9n8IzdCaAUHERDyH3ADvik+jGCJ7OzsAt4rlECe9zutrbZOG0PG9+fEWu79IYlrKez8biQ2C9IiVFu9Ds9SpOKdjO0w9Ql/ZCS1gCPMNtWy0/wkgniGZ76tjyxuo0u3kkXKCr/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpYJD0EQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpYJD0EQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742700196; x=1774236196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ksD2gfWzxD14X9KJWuL5h60jgS49ppa04LHL6mV2rg=;
  b=cpYJD0EQKp8J/OyAfuSCOsu/L1n4E2EBFsKVC+5RpEvtUvGB9QilPv4F
   0et1QpozZEfP+XJomJUiHhpotOfmyiaN1EBLMlBCjOcZwkoDteAVTU+6Y
   xIjA/NLZX+0w5sE5BhCULe3f9RNi4hVou/cyztoLy7Ry/gYtvclc6Ucjv
   h1Fc2aITNjC+gGPt+y5IN7O1mUEZnAp9hvjvlkaCmfQBNm6V5/hBvwf9+
   wttgCTgHObd83hHHVLP85r4nyyvgoEtePTUcVSH3Zx08tgi1yP0nVOOoT
   uhTekx5RV/8bgb2QmNs2mh66PY7pv1oIeFn4NToXla4pCUzhOreQTX0bC
   w==;
X-CSE-ConnectionGUID: RI0q3wX4RlG/Qn0pCoZXZQ==
X-CSE-MsgGUID: tQyjE8zESxm2SlTbrDTEmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="54140235"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="54140235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 20:23:16 -0700
X-CSE-ConnectionGUID: D9hUpE+IQViUmG1VYbvmxA==
X-CSE-MsgGUID: H74/dfBXQeCT/UgX83he+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="123703135"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Mar 2025 20:23:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twBvY-0002Yn-0e;
	Sun, 23 Mar 2025 03:23:09 +0000
Date: Sun, 23 Mar 2025 11:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2051/2051] mm/memblock.c:1409:20: sparse: sparse:
 symbol 'memblock_alloc_range_nid_flags' was not declared. Should it be
 static?
Message-ID: <202503231106.ZSS1yt6E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: 64018b291c1f49622c4b23b303364d760306d662 [2051/2051] mm/memblock: Introduce ability to alloc memory from specify memory region
config: loongarch-randconfig-r131-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231106.ZSS1yt6E-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250323/202503231106.ZSS1yt6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231106.ZSS1yt6E-lkp@intel.com/

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
