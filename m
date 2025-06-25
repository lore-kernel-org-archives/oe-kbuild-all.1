Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309A2673BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862089; cv=none; b=U0GkGgxHXVQWaguaKWVcwww4xy+zqZVDwwGLxZR8a8/Ynpeww9LGTtcY3F0CPnPzRGer8dq8BcxVVRtcmZVtR/fwxNzpRisVKc7Kvlf2bGWHgErtT+Ylju7RBeemlV0hHYtIyYIbYiW6Pif8bNl0aexTtXjTgvNyZYxtDB/auOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862089; c=relaxed/simple;
	bh=R/DlI/eAWHGDYnoaFyT9N17UHjTpV+AyhGIKUilf4BI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fzt2Zcq5Sdoln0vIEeqOAFBBWq79NqhC6FKVkJnccsQm4Mjg3kDsZ+I+WmD0hRWYYSIHYRCNl/rRFP4jNzKp1cR4jWQ3LoqQEyI3e5tCXkd6bdrMWlWgL5+bgH2sReVLahJiEOZoeijch9LBmkghQSLfwXQ1JfUrwDWy4GL26AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpFUiLG2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpFUiLG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750862087; x=1782398087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/DlI/eAWHGDYnoaFyT9N17UHjTpV+AyhGIKUilf4BI=;
  b=cpFUiLG2pLxGxktXjq2P4sYVxvQT1uUasNoiSww0xM7JSd7NpOhBFw06
   9dIouyjHLzUDJ7QZcSkkIXsEzIgOc9jdLBUt6vsm1tsjTrK4RCg4gFUid
   XWyk8y973Q5D2CWendD5SrnencaHGUmulByAyyN0OxPOv0Tb4X4AyCjUk
   lsJAnmt9SRgpwZ6zseIF1Dzc9cyTCNuHTk+luLCgHOEJ1DOHsA4iHE/QE
   WDeZU2YBC1tWNEDmGQse++QTtC8Pe1RERrkgX+fAiEZBWSrsWUUubCt0J
   qZhP5ixZJafT5TB1RAUR1v7XHQmL7JZcEz6NtvyvWmkknZgGV5Iz2/828
   A==;
X-CSE-ConnectionGUID: q+KxTwM3SFyteZ10uznZ5A==
X-CSE-MsgGUID: XGDp/pGdTeGDjvpk/cTODg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921003"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56921003"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:34:43 -0700
X-CSE-ConnectionGUID: SJVQ+6KIRpCwlDPec3vx9g==
X-CSE-MsgGUID: YiVlrkSKRjulFecywvOzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175878924"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jun 2025 07:34:39 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uURCu-00003D-1i;
	Wed, 25 Jun 2025 14:34:36 +0000
Date: Wed, 25 Jun 2025 16:33:54 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] mm/memblock.c:1409:20: warning: no
 previous prototype for 'memblock_alloc_range_nid_flags'
Message-ID: <202506252231.3JnNvuLi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 64018b291c1f49622c4b23b303364d760306d662 [2195/2195] mm/memblock: Introduce ability to alloc memory from specify memory region
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250625/202506252231.3JnNvuLi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252231.3JnNvuLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252231.3JnNvuLi-lkp@intel.com/

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
