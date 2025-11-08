Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2593171C9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 04:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762575792; cv=none; b=aIcqVytY37SahsXSetydxXCG3EFjokWcwK9aHcXfW69WwcNMpPOe2wthYw0o9jwOxyk7QRUk9cctNiWbIBdzT4RYV9CdVIH9Yke7Sazlckdh27C0NvhG9AvFyYYRwKEIKTutn5f4n88BCNa06tVdy4b2QucJAl0jomfR1XMzvS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762575792; c=relaxed/simple;
	bh=chiORo9/rPVIqK89VMemWlE2VXDUawf0sVzlZsnPgwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7sv0HLPB7KWP42MlqabLlbEMohbUi/EgUvbkPkBW8DCk1+fx1a4kadmEO2qWb9KXfbdeQQxe2LZKPPcpme26afzJR8W00zhYqwaLpxEAGhlaQk4nU9epX1kG+3nJr48ucllakKeH/ymouWxz0nFg/L3T8lR+bzQ+KIApwl71so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMAlBn6I; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMAlBn6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762575789; x=1794111789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chiORo9/rPVIqK89VMemWlE2VXDUawf0sVzlZsnPgwQ=;
  b=VMAlBn6Iw9+zW9lRrGF6jxn3Xf1WFSOIWRKfEbRKzYluqLKiVdBb+bg+
   0LGAZVf2/qU7ttjulBaHOjIpD8W+w9KBVaQzNeRb8NJ+xkGBv6VwDbaw4
   v9BhNHiOIDH7A72eK8dy21fU34xfMbQLkh8QTMl0s2PPWFcpODlhnT13h
   iufoJn9JgU5p3Kwji8rVdhMIUWwiVvMpvgkyR2MjyxJCmlykHihm4vOMk
   vUou2x7YnsDgowSY4AgAhCoG2zgYFFsmgZSvRMlPzpVm6oikHm/RlHiWg
   KKN1SAgpug060COHWNul1cAx5Cu0d6kNK/jMoD68PHI3/jWngUMLNMUvo
   g==;
X-CSE-ConnectionGUID: WnmNAK/mRcCceqb29DXkvg==
X-CSE-MsgGUID: HgfifPYrRy+ADh2GR3PqoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="76171861"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="76171861"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 20:23:09 -0800
X-CSE-ConnectionGUID: GvgyxBGWTNqrZtozu5/wdw==
X-CSE-MsgGUID: 0M0Ey3ehTCajGVnHo1IgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="193232889"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2025 20:23:08 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHaTi-0000jH-01;
	Sat, 08 Nov 2025 04:23:06 +0000
Date: Sat, 8 Nov 2025 12:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 11/11]
 mm/memory_hotplug.c:1596:17: error: 'mt_compressed_nodelist' undeclared
Message-ID: <202511081212.XNxYZW3U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   67062e895b94cd27af5fa58d8a567086a53d0914
commit: 67062e895b94cd27af5fa58d8a567086a53d0914 [11/11] [HACK] mm/zswap: compressed ram integration example
config: s390-randconfig-002-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081212.XNxYZW3U-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081212.XNxYZW3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081212.XNxYZW3U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/machine.h:25,
                    from arch/s390/include/asm/lowcore.h:13,
                    from arch/s390/include/asm/current.h:13,
                    from arch/s390/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/memory_hotplug.c:9:
   mm/memory_hotplug.c: In function 'add_memory_resource':
   mm/memory_hotplug.c:1541:36: error: 'default_sysram_nodes' undeclared (first use in this function); did you mean 'default_dram_nodes'?
     node_is_sysram = node_isset(nid, *default_sysram_nodes);
                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:44:37: note: in definition of macro 'bitop'
       __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                        ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
    #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
                                       ^~~~~~~~
   mm/memory_hotplug.c:1541:19: note: in expansion of macro 'node_isset'
     node_is_sysram = node_isset(nid, *default_sysram_nodes);
                      ^~~~~~~~~~
   mm/memory_hotplug.c:1541:36: note: each undeclared identifier is reported only once for each function it appears in
     node_is_sysram = node_isset(nid, *default_sysram_nodes);
                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:44:37: note: in definition of macro 'bitop'
       __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                        ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
    #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
                                       ^~~~~~~~
   mm/memory_hotplug.c:1541:19: note: in expansion of macro 'node_isset'
     node_is_sysram = node_isset(nid, *default_sysram_nodes);
                      ^~~~~~~~~~
   In file included from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/memory_hotplug.c:9:
>> mm/memory_hotplug.c:1596:17: error: 'mt_compressed_nodelist' undeclared (first use in this function)
      node_set(nid, mt_compressed_nodelist);
                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:124:50: note: in definition of macro 'node_set'
    #define node_set(node, dst) __node_set((node), &(dst))
                                                     ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/mt_compressed_nodelist +1596 mm/memory_hotplug.c

  1496	
  1497	/*
  1498	 * NOTE: The caller must call lock_device_hotplug() to serialize hotplug
  1499	 * and online/offline operations (triggered e.g. by sysfs).
  1500	 *
  1501	 * we are OK calling __meminit stuff here - we have CONFIG_MEMORY_HOTPLUG
  1502	 */
  1503	int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
  1504	{
  1505		struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
  1506		enum memblock_flags memblock_flags = MEMBLOCK_NONE;
  1507		struct memory_group *group = NULL;
  1508		u64 start, size;
  1509		bool new_node = false;
  1510		bool node_has_blocks, protected_mem, node_is_sysram;
  1511		int ret;
  1512	
  1513		start = res->start;
  1514		size = resource_size(res);
  1515	
  1516		ret = check_hotplug_memory_range(start, size);
  1517		if (ret)
  1518			return ret;
  1519	
  1520		if (mhp_flags & MHP_NID_IS_MGID) {
  1521			group = memory_group_find_by_id(nid);
  1522			if (!group)
  1523				return -EINVAL;
  1524			nid = group->nid;
  1525		}
  1526	
  1527		if (!node_possible(nid)) {
  1528			WARN(1, "node %d was absent from the node_possible_map\n", nid);
  1529			return -EINVAL;
  1530		}
  1531	
  1532		mem_hotplug_begin();
  1533	
  1534		/*
  1535		 * If the NUMA node already has memory blocks, then we can only allow
  1536		 * additional memory blocks of the same protection type (protected or
  1537		 * un-protected).  Online/offline does not matter at this point.
  1538		 */
  1539		node_has_blocks = node_has_memory_blocks(nid);
  1540		protected_mem = !!(mhp_flags & MHP_PROTECTED_MEMORY);
  1541		node_is_sysram = node_isset(nid, *default_sysram_nodes);
  1542		if (node_has_blocks && (protected_mem ^ node_is_sysram)) {
  1543			ret = -EINVAL;
  1544			goto error_mem_hotplug_end;
  1545		}
  1546	
  1547		if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
  1548			if (res->flags & IORESOURCE_SYSRAM_DRIVER_MANAGED)
  1549				memblock_flags = MEMBLOCK_DRIVER_MANAGED;
  1550			ret = memblock_add_node(start, size, nid, memblock_flags);
  1551			if (ret)
  1552				goto error_mem_hotplug_end;
  1553		}
  1554	
  1555		ret = __try_online_node(nid, false);
  1556		if (ret < 0)
  1557			goto error_memblock_remove;
  1558		if (ret) {
  1559			node_set_online(nid);
  1560			ret = register_one_node(nid);
  1561			if (WARN_ON(ret)) {
  1562				node_set_offline(nid);
  1563				goto error_memblock_remove;
  1564			}
  1565			new_node = true;
  1566		}
  1567	
  1568		/*
  1569		 * Self hosted memmap array
  1570		 */
  1571		if ((mhp_flags & MHP_MEMMAP_ON_MEMORY) &&
  1572		    mhp_supports_memmap_on_memory()) {
  1573			ret = create_altmaps_and_memory_blocks(nid, group, start, size, mhp_flags);
  1574			if (ret)
  1575				goto error;
  1576		} else {
  1577			ret = arch_add_memory(nid, start, size, &params);
  1578			if (ret < 0)
  1579				goto error;
  1580	
  1581			/* create memory block devices after memory was added */
  1582			ret = create_memory_block_devices(start, size, nid, NULL, group);
  1583			if (ret) {
  1584				arch_remove_memory(start, size, params.altmap);
  1585				goto error;
  1586			}
  1587		}
  1588	
  1589		register_memory_blocks_under_node_hotplug(nid, PFN_DOWN(start),
  1590						  PFN_UP(start + size - 1));
  1591	
  1592		/* At this point if not protected, we can add node to sysram nodes */
  1593		if (!(mhp_flags & MHP_PROTECTED_MEMORY))
  1594			node_set(nid, *default_sysram_nodes);
  1595		else /* HACK: We would create a proper interface for something like this */
> 1596			node_set(nid, mt_compressed_nodelist);
  1597	
  1598		/* create new memmap entry */
  1599		if (!strcmp(res->name, "System RAM"))
  1600			firmware_map_add_hotplug(start, start + size, "System RAM");
  1601	
  1602		/* device_online() will take the lock when calling online_pages() */
  1603		mem_hotplug_done();
  1604	
  1605		/*
  1606		 * In case we're allowed to merge the resource, flag it and trigger
  1607		 * merging now that adding succeeded.
  1608		 */
  1609		if (mhp_flags & MHP_MERGE_RESOURCE)
  1610			merge_system_ram_resource(res);
  1611	
  1612		/* online pages if requested */
  1613		if (mhp_get_default_online_type() != MMOP_OFFLINE)
  1614			walk_memory_blocks(start, size, NULL, online_memory_block);
  1615	
  1616		return ret;
  1617	error:
  1618		if (new_node) {
  1619			node_set_offline(nid);
  1620			unregister_one_node(nid);
  1621		}
  1622	error_memblock_remove:
  1623		if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
  1624			memblock_remove(start, size);
  1625	error_mem_hotplug_end:
  1626		mem_hotplug_done();
  1627		return ret;
  1628	}
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
