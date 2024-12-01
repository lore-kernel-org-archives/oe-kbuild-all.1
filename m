Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F9134A8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733070207; cv=none; b=KptxQIQ/IuKT063l/A/b1g/bueTKy44pcCPHdolUiAOrto2GJqeRYgaeemagGVnShVclutdgk0NzshF9Vb1FEVI88JGpMYpdlBpYRoMCQjIoNH9U2UTmm3r14tEUKurOMXQjyA6pFxwWCCyN4mX2tAb7z8pvqr70Cx/x3jPgzwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733070207; c=relaxed/simple;
	bh=76NsZeTYh0bStweb+15X9DPuYD+wK6LyWn5pFZwa71M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctKwGTcm+nWvj6WJfVvkBtwYVhkryKVC5ttD/wHLoFSrwCdJ19AOnKssLiVpXlnhDDCBBd4QjBisr61NAW/4Fu6a6j0RM0XwnynkPS95sbLrvArMcPfXgzls8hwjLoA1zULlbp8hp+dyQu0VVLH6ctLhfi13nXBAbkp+iaADWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARxu/1C7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARxu/1C7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733070205; x=1764606205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=76NsZeTYh0bStweb+15X9DPuYD+wK6LyWn5pFZwa71M=;
  b=ARxu/1C7S4PW49C0PZOE0faQI78hrsL9w4+jgsqu+cYMnllvM2vugRRf
   JK8vnqmzsDxg79EhO0/LC9vwI+J11z2gsKKgVG3yfmkPDFq1Suhp9nkdl
   BhaZQWkMsmk8gZOG77LvhfBlgXA0dTcNzXYudCE/SCUfXSEQac8SI2C5A
   /HLGdmu3XwPedA3yLwPdlqXXUdJ8BCOKAPBfELDYCxYW9zheAodYSlKqT
   oFX9abzff8tcLbuPpWhD3tOHW8TbgN0wXrHISI/5PCuqI+3H66Eh3tIFq
   Ho3umX40Lu87c68YBDLwihOLD7lGbotArrGj+0cQj/s/zJ2l5xIBkYTRC
   w==;
X-CSE-ConnectionGUID: MryqbRM+T3WeUmi0vfOZpQ==
X-CSE-MsgGUID: 4w+/+eMhTTayrKr3fm9erg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44619311"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="44619311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 08:23:25 -0800
X-CSE-ConnectionGUID: YD2pqjlxSMaKQrCmYdGAHA==
X-CSE-MsgGUID: mK3gCupETCWbT0Z3JpocZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92808125"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2024 08:23:24 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHmjB-0001fb-0C;
	Sun, 01 Dec 2024 16:23:21 +0000
Date: Mon, 2 Dec 2024 00:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] mm/memblock.c:1409:20: sparse: sparse:
 symbol 'memblock_alloc_range_nid_flags' was not declared. Should it be
 static?
Message-ID: <202412020025.26TZQM2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 64018b291c1f49622c4b23b303364d760306d662 [1474/1474] mm/memblock: Introduce ability to alloc memory from specify memory region
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020025.26TZQM2V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020025.26TZQM2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020025.26TZQM2V-lkp@intel.com/

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
