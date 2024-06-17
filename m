Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6C155C8D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718650558; cv=none; b=CN81kTcaQAuKUoc6+DAmTj2WGC3uoOzMmv7fJG+NR3SmUU6yO/set5AvQxXWy+w2xm7BxT5kMppO/OCg52czU4wcw+6rarP5LPwAFApcNYY5ARS0JNFyfPNqLW1565DRDTAzDh4BfczRAIjiRU5y4dpt6EMR0NEP/qlw2spCzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718650558; c=relaxed/simple;
	bh=3cCS5CLtZZgUf1rTooXUZ5yprkNaqEnuY6YQaWCRyU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHD40gYhutrtj/irRiHjRiU0rOvKjq6LuKOnsCeAmPR3TvQGMkXw0cbT3YFYOPaudlQ9SIj9izgWwsqva7RUFeGRJCLi/nayYTa/qoLrFs33ZrymsBjzDXjZy0r3t2sNyb/kAibZ2WbQDwPEbOawQczw8h+Zv/Ch0TmzQABjdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7Nd/lfw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7Nd/lfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718650556; x=1750186556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3cCS5CLtZZgUf1rTooXUZ5yprkNaqEnuY6YQaWCRyU8=;
  b=e7Nd/lfwRH+2BL3Gu/5dkOB8cgzUpA05cEoLxpauhJV0Ws8ZzHVtutQR
   32qx39tr+pZWLH1RgX7cIPKi/ZZRf+KobQkYR0gu7KFpDw0tUStpXVZW7
   0SCdE1WIBv1UGarHS8jWbi73qQHqQceXI8qsBnYQ1qHN0u3F3pRqyJEFS
   LeVHf6Z2CxxbmJgXj+osL2McHag7gA39t+psw4TaZX61S0pIR2iWQD/Fm
   MNznLrek3P9fO1lt2Gg6kwj5PgGAUgZCgblthSVn+proL37C1Kv0Ko/wz
   UXb/Y7qB6bTaBNAuXbCuoplTWZVtdAASbyrgg+2gwaPPHvfe/M1H7FMhE
   g==;
X-CSE-ConnectionGUID: hBGnDWrWQOu97K1WS1LFFA==
X-CSE-MsgGUID: cwGAay+zRMGuTC9goZsJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18409791"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="18409791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 11:55:55 -0700
X-CSE-ConnectionGUID: cv/KYXWsTeunIH20aSIn5Q==
X-CSE-MsgGUID: JBY44EAlSB6umKpOuvwNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41759413"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2024 11:55:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJHWC-0004mx-0b;
	Mon, 17 Jun 2024 18:55:52 +0000
Date: Tue, 18 Jun 2024 02:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18311/22954] kernel/sysctl.c:1817:36:
 error: 'ten_thousand' undeclared here (not in a function); did you mean
 'one_thousand'?
Message-ID: <202406180227.YzvSYbqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   297a8114a17425dccc02597803b1c8049eb3b91b
commit: 5a2c074184137763d604ffb3f0178da26bee5260 [18311/22954] share_pool: Add sp_alloc trace
config: arm64-randconfig-004-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180227.YzvSYbqW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180227.YzvSYbqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180227.YzvSYbqW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:1817:36: error: 'ten_thousand' undeclared here (not in a function); did you mean 'one_thousand'?
    1817 |                 .extra2         = &ten_thousand,
         |                                    ^~~~~~~~~~~~
         |                                    one_thousand


vim +1817 kernel/sysctl.c

  1274	
  1275	static struct ctl_table vm_table[] = {
  1276		{
  1277			.procname	= "overcommit_memory",
  1278			.data		= &sysctl_overcommit_memory,
  1279			.maxlen		= sizeof(sysctl_overcommit_memory),
  1280			.mode		= 0644,
  1281			.proc_handler	= proc_dointvec_minmax,
  1282			.extra1		= &zero,
  1283			.extra2		= &two,
  1284		},
  1285		{
  1286			.procname	= "panic_on_oom",
  1287			.data		= &sysctl_panic_on_oom,
  1288			.maxlen		= sizeof(sysctl_panic_on_oom),
  1289			.mode		= 0644,
  1290			.proc_handler	= proc_dointvec_minmax,
  1291			.extra1		= &zero,
  1292			.extra2		= &two,
  1293		},
  1294	#ifdef CONFIG_ASCEND_OOM
  1295		{
  1296			/* 0: diasable, 1: enable, 2: disable and panic on oom */
  1297			.procname	= "enable_oom_killer",
  1298			.data		= &sysctl_enable_oom_killer,
  1299			.maxlen		= sizeof(sysctl_enable_oom_killer),
  1300			.mode		= 0644,
  1301			.proc_handler	= proc_dointvec_minmax,
  1302			.extra1		= &zero,
  1303			.extra2		= &two,
  1304		},
  1305	#endif
  1306		{
  1307			.procname	= "oom_kill_allocating_task",
  1308			.data		= &sysctl_oom_kill_allocating_task,
  1309			.maxlen		= sizeof(sysctl_oom_kill_allocating_task),
  1310			.mode		= 0644,
  1311			.proc_handler	= proc_dointvec,
  1312		},
  1313		{
  1314			.procname	= "oom_dump_tasks",
  1315			.data		= &sysctl_oom_dump_tasks,
  1316			.maxlen		= sizeof(sysctl_oom_dump_tasks),
  1317			.mode		= 0644,
  1318			.proc_handler	= proc_dointvec,
  1319		},
  1320		{
  1321			.procname	= "overcommit_ratio",
  1322			.data		= &sysctl_overcommit_ratio,
  1323			.maxlen		= sizeof(sysctl_overcommit_ratio),
  1324			.mode		= 0644,
  1325			.proc_handler	= overcommit_ratio_handler,
  1326		},
  1327		{
  1328			.procname	= "overcommit_kbytes",
  1329			.data		= &sysctl_overcommit_kbytes,
  1330			.maxlen		= sizeof(sysctl_overcommit_kbytes),
  1331			.mode		= 0644,
  1332			.proc_handler	= overcommit_kbytes_handler,
  1333		},
  1334		{
  1335			.procname	= "page-cluster", 
  1336			.data		= &page_cluster,
  1337			.maxlen		= sizeof(int),
  1338			.mode		= 0644,
  1339			.proc_handler	= proc_dointvec_minmax,
  1340			.extra1		= &zero,
  1341		},
  1342		{
  1343			.procname	= "dirty_background_ratio",
  1344			.data		= &dirty_background_ratio,
  1345			.maxlen		= sizeof(dirty_background_ratio),
  1346			.mode		= 0644,
  1347			.proc_handler	= dirty_background_ratio_handler,
  1348			.extra1		= &zero,
  1349			.extra2		= &one_hundred,
  1350		},
  1351		{
  1352			.procname	= "dirty_background_bytes",
  1353			.data		= &dirty_background_bytes,
  1354			.maxlen		= sizeof(dirty_background_bytes),
  1355			.mode		= 0644,
  1356			.proc_handler	= dirty_background_bytes_handler,
  1357			.extra1		= &one_ul,
  1358		},
  1359		{
  1360			.procname	= "dirty_ratio",
  1361			.data		= &vm_dirty_ratio,
  1362			.maxlen		= sizeof(vm_dirty_ratio),
  1363			.mode		= 0644,
  1364			.proc_handler	= dirty_ratio_handler,
  1365			.extra1		= &zero,
  1366			.extra2		= &one_hundred,
  1367		},
  1368		{
  1369			.procname	= "dirty_bytes",
  1370			.data		= &vm_dirty_bytes,
  1371			.maxlen		= sizeof(vm_dirty_bytes),
  1372			.mode		= 0644,
  1373			.proc_handler	= dirty_bytes_handler,
  1374			.extra1		= &dirty_bytes_min,
  1375		},
  1376		{
  1377			.procname	= "dirty_writeback_centisecs",
  1378			.data		= &dirty_writeback_interval,
  1379			.maxlen		= sizeof(dirty_writeback_interval),
  1380			.mode		= 0644,
  1381			.proc_handler	= dirty_writeback_centisecs_handler,
  1382		},
  1383		{
  1384			.procname	= "dirty_expire_centisecs",
  1385			.data		= &dirty_expire_interval,
  1386			.maxlen		= sizeof(dirty_expire_interval),
  1387			.mode		= 0644,
  1388			.proc_handler	= proc_dointvec_minmax,
  1389			.extra1		= &zero,
  1390		},
  1391		{
  1392			.procname	= "dirtytime_expire_seconds",
  1393			.data		= &dirtytime_expire_interval,
  1394			.maxlen		= sizeof(dirtytime_expire_interval),
  1395			.mode		= 0644,
  1396			.proc_handler	= dirtytime_interval_handler,
  1397			.extra1		= &zero,
  1398		},
  1399		{
  1400			.procname	= "swappiness",
  1401			.data		= &vm_swappiness,
  1402			.maxlen		= sizeof(vm_swappiness),
  1403			.mode		= 0644,
  1404			.proc_handler	= proc_dointvec_minmax,
  1405			.extra1		= &zero,
  1406			.extra2		= &one_hundred,
  1407		},
  1408	#ifdef CONFIG_SHRINK_PAGECACHE
  1409		{
  1410			.procname       = "cache_reclaim_s",
  1411			.data           = &vm_cache_reclaim_s,
  1412			.maxlen         = sizeof(vm_cache_reclaim_s),
  1413			.mode           = 0644,
  1414			.proc_handler   = cache_reclaim_sysctl_handler,
  1415			.extra1         = &vm_cache_reclaim_s_min,
  1416			.extra2         = &vm_cache_reclaim_s_max,
  1417		},
  1418		{
  1419			.procname       = "cache_reclaim_weight",
  1420			.data           = &vm_cache_reclaim_weight,
  1421			.maxlen         = sizeof(vm_cache_reclaim_weight),
  1422			.mode           = 0644,
  1423			.proc_handler   = proc_dointvec_minmax,
  1424			.extra1         = &vm_cache_reclaim_weight_min,
  1425			.extra2         = &vm_cache_reclaim_weight_max,
  1426		},
  1427		{
  1428			.procname	= "cache_reclaim_enable",
  1429			.data		= &vm_cache_reclaim_enable,
  1430			.maxlen		= sizeof(vm_cache_reclaim_enable),
  1431			.mode		= 0644,
  1432			.proc_handler	= cache_reclaim_enable_handler,
  1433			.extra1		= &zero,
  1434			.extra2		= &one,
  1435		},
  1436	#endif
  1437	#ifdef CONFIG_HUGETLB_PAGE
  1438		{
  1439			.procname	= "nr_hugepages",
  1440			.data		= NULL,
  1441			.maxlen		= sizeof(unsigned long),
  1442			.mode		= 0644,
  1443			.proc_handler	= hugetlb_sysctl_handler,
  1444		},
  1445	#ifdef CONFIG_NUMA
  1446		{
  1447			.procname       = "nr_hugepages_mempolicy",
  1448			.data           = NULL,
  1449			.maxlen         = sizeof(unsigned long),
  1450			.mode           = 0644,
  1451			.proc_handler   = &hugetlb_mempolicy_sysctl_handler,
  1452		},
  1453		{
  1454			.procname		= "numa_stat",
  1455			.data			= &sysctl_vm_numa_stat,
  1456			.maxlen			= sizeof(int),
  1457			.mode			= 0644,
  1458			.proc_handler	= sysctl_vm_numa_stat_handler,
  1459			.extra1			= &zero,
  1460			.extra2			= &one,
  1461		},
  1462	#endif
  1463		 {
  1464			.procname	= "hugetlb_shm_group",
  1465			.data		= &sysctl_hugetlb_shm_group,
  1466			.maxlen		= sizeof(gid_t),
  1467			.mode		= 0644,
  1468			.proc_handler	= proc_dointvec,
  1469		 },
  1470		{
  1471			.procname	= "nr_overcommit_hugepages",
  1472			.data		= NULL,
  1473			.maxlen		= sizeof(unsigned long),
  1474			.mode		= 0644,
  1475			.proc_handler	= hugetlb_overcommit_handler,
  1476		},
  1477	#endif
  1478	#ifdef CONFIG_MEMCG_QOS
  1479		{
  1480			.procname	= "memcg_qos_enable",
  1481			.data		= &sysctl_memcg_qos_stat,
  1482			.maxlen		= sizeof(int),
  1483			.mode		= 0644,
  1484			.proc_handler	= sysctl_memcg_qos_handler,
  1485			.extra1		= &zero,
  1486			.extra2		= &one,
  1487		},
  1488	#endif
  1489		{
  1490			.procname	= "lowmem_reserve_ratio",
  1491			.data		= &sysctl_lowmem_reserve_ratio,
  1492			.maxlen		= sizeof(sysctl_lowmem_reserve_ratio),
  1493			.mode		= 0644,
  1494			.proc_handler	= lowmem_reserve_ratio_sysctl_handler,
  1495		},
  1496		{
  1497			.procname	= "drop_caches",
  1498			.data		= &sysctl_drop_caches,
  1499			.maxlen		= sizeof(int),
  1500			.mode		= 0200,
  1501			.proc_handler	= drop_caches_sysctl_handler,
  1502			.extra1		= &one,
  1503			.extra2		= &four,
  1504		},
  1505		{
  1506			.procname	= "drop_caches_loop_limit",
  1507			.data		= &drop_caches_loop_limit,
  1508			.maxlen		= sizeof(unsigned int),
  1509			.mode		= 0644,
  1510			.proc_handler	= proc_douintvec,
  1511		},
  1512	
  1513	#ifdef CONFIG_COMPACTION
  1514		{
  1515			.procname	= "compact_memory",
  1516			.data		= &sysctl_compact_memory,
  1517			.maxlen		= sizeof(int),
  1518			.mode		= 0200,
  1519			.proc_handler	= sysctl_compaction_handler,
  1520		},
  1521		{
  1522			.procname	= "extfrag_threshold",
  1523			.data		= &sysctl_extfrag_threshold,
  1524			.maxlen		= sizeof(int),
  1525			.mode		= 0644,
  1526			.proc_handler	= sysctl_extfrag_handler,
  1527			.extra1		= &min_extfrag_threshold,
  1528			.extra2		= &max_extfrag_threshold,
  1529		},
  1530		{
  1531			.procname	= "compact_unevictable_allowed",
  1532			.data		= &sysctl_compact_unevictable_allowed,
  1533			.maxlen		= sizeof(int),
  1534			.mode		= 0644,
  1535			.proc_handler	= proc_dointvec,
  1536			.extra1		= &zero,
  1537			.extra2		= &one,
  1538		},
  1539	
  1540	#endif /* CONFIG_COMPACTION */
  1541		{
  1542			.procname	= "min_free_kbytes",
  1543			.data		= &min_free_kbytes,
  1544			.maxlen		= sizeof(min_free_kbytes),
  1545			.mode		= 0644,
  1546			.proc_handler	= min_free_kbytes_sysctl_handler,
  1547			.extra1		= &zero,
  1548		},
  1549		{
  1550			.procname	= "watermark_scale_factor",
  1551			.data		= &watermark_scale_factor,
  1552			.maxlen		= sizeof(watermark_scale_factor),
  1553			.mode		= 0644,
  1554			.proc_handler	= watermark_scale_factor_sysctl_handler,
  1555			.extra1		= &one,
  1556			.extra2		= &one_thousand,
  1557		},
  1558		{
  1559			.procname	= "percpu_pagelist_fraction",
  1560			.data		= &percpu_pagelist_fraction,
  1561			.maxlen		= sizeof(percpu_pagelist_fraction),
  1562			.mode		= 0644,
  1563			.proc_handler	= percpu_pagelist_fraction_sysctl_handler,
  1564			.extra1		= &zero,
  1565		},
  1566	#ifdef CONFIG_MMU
  1567		{
  1568			.procname	= "max_map_count",
  1569			.data		= &sysctl_max_map_count,
  1570			.maxlen		= sizeof(sysctl_max_map_count),
  1571			.mode		= 0644,
  1572			.proc_handler	= proc_dointvec_minmax,
  1573			.extra1		= &zero,
  1574		},
  1575	#else
  1576		{
  1577			.procname	= "nr_trim_pages",
  1578			.data		= &sysctl_nr_trim_pages,
  1579			.maxlen		= sizeof(sysctl_nr_trim_pages),
  1580			.mode		= 0644,
  1581			.proc_handler	= proc_dointvec_minmax,
  1582			.extra1		= &zero,
  1583		},
  1584	#endif
  1585		{
  1586			.procname	= "laptop_mode",
  1587			.data		= &laptop_mode,
  1588			.maxlen		= sizeof(laptop_mode),
  1589			.mode		= 0644,
  1590			.proc_handler	= proc_dointvec_jiffies,
  1591		},
  1592		{
  1593			.procname	= "block_dump",
  1594			.data		= &block_dump,
  1595			.maxlen		= sizeof(block_dump),
  1596			.mode		= 0644,
  1597			.proc_handler	= proc_dointvec,
  1598			.extra1		= &zero,
  1599		},
  1600		{
  1601			.procname	= "vfs_cache_pressure",
  1602			.data		= &sysctl_vfs_cache_pressure,
  1603			.maxlen		= sizeof(sysctl_vfs_cache_pressure),
  1604			.mode		= 0644,
  1605			.proc_handler	= proc_dointvec,
  1606			.extra1		= &zero,
  1607		},
  1608	#ifdef HAVE_ARCH_PICK_MMAP_LAYOUT
  1609		{
  1610			.procname	= "legacy_va_layout",
  1611			.data		= &sysctl_legacy_va_layout,
  1612			.maxlen		= sizeof(sysctl_legacy_va_layout),
  1613			.mode		= 0644,
  1614			.proc_handler	= proc_dointvec,
  1615			.extra1		= &zero,
  1616		},
  1617	#endif
  1618	#ifdef CONFIG_NUMA
  1619		{
  1620			.procname	= "zone_reclaim_mode",
  1621			.data		= &node_reclaim_mode,
  1622			.maxlen		= sizeof(node_reclaim_mode),
  1623			.mode		= 0644,
  1624			.proc_handler	= proc_dointvec,
  1625			.extra1		= &zero,
  1626		},
  1627		{
  1628			.procname	= "min_unmapped_ratio",
  1629			.data		= &sysctl_min_unmapped_ratio,
  1630			.maxlen		= sizeof(sysctl_min_unmapped_ratio),
  1631			.mode		= 0644,
  1632			.proc_handler	= sysctl_min_unmapped_ratio_sysctl_handler,
  1633			.extra1		= &zero,
  1634			.extra2		= &one_hundred,
  1635		},
  1636		{
  1637			.procname	= "min_slab_ratio",
  1638			.data		= &sysctl_min_slab_ratio,
  1639			.maxlen		= sizeof(sysctl_min_slab_ratio),
  1640			.mode		= 0644,
  1641			.proc_handler	= sysctl_min_slab_ratio_sysctl_handler,
  1642			.extra1		= &zero,
  1643			.extra2		= &one_hundred,
  1644		},
  1645	#endif
  1646	#ifdef CONFIG_SMP
  1647		{
  1648			.procname	= "stat_interval",
  1649			.data		= &sysctl_stat_interval,
  1650			.maxlen		= sizeof(sysctl_stat_interval),
  1651			.mode		= 0644,
  1652			.proc_handler	= proc_dointvec_jiffies,
  1653		},
  1654		{
  1655			.procname	= "stat_refresh",
  1656			.data		= NULL,
  1657			.maxlen		= 0,
  1658			.mode		= 0600,
  1659			.proc_handler	= vmstat_refresh,
  1660		},
  1661	#endif
  1662	#ifdef CONFIG_MMU
  1663		{
  1664			.procname	= "mmap_min_addr",
  1665			.data		= &dac_mmap_min_addr,
  1666			.maxlen		= sizeof(unsigned long),
  1667			.mode		= 0644,
  1668			.proc_handler	= mmap_min_addr_handler,
  1669		},
  1670	#endif
  1671	#ifdef CONFIG_NUMA
  1672		{
  1673			.procname	= "numa_zonelist_order",
  1674			.data		= &numa_zonelist_order,
  1675			.maxlen		= NUMA_ZONELIST_ORDER_LEN,
  1676			.mode		= 0644,
  1677			.proc_handler	= numa_zonelist_order_handler,
  1678		},
  1679	#endif
  1680	#if (defined(CONFIG_X86_32) && !defined(CONFIG_UML))|| \
  1681	   (defined(CONFIG_SUPERH) && defined(CONFIG_VSYSCALL))
  1682		{
  1683			.procname	= "vdso_enabled",
  1684	#ifdef CONFIG_X86_32
  1685			.data		= &vdso32_enabled,
  1686			.maxlen		= sizeof(vdso32_enabled),
  1687	#else
  1688			.data		= &vdso_enabled,
  1689			.maxlen		= sizeof(vdso_enabled),
  1690	#endif
  1691			.mode		= 0644,
  1692			.proc_handler	= proc_dointvec,
  1693			.extra1		= &zero,
  1694		},
  1695	#endif
  1696	#ifdef CONFIG_HIGHMEM
  1697		{
  1698			.procname	= "highmem_is_dirtyable",
  1699			.data		= &vm_highmem_is_dirtyable,
  1700			.maxlen		= sizeof(vm_highmem_is_dirtyable),
  1701			.mode		= 0644,
  1702			.proc_handler	= proc_dointvec_minmax,
  1703			.extra1		= &zero,
  1704			.extra2		= &one,
  1705		},
  1706	#endif
  1707	#ifdef CONFIG_MEMORY_FAILURE
  1708		{
  1709			.procname	= "memory_failure_early_kill",
  1710			.data		= &sysctl_memory_failure_early_kill,
  1711			.maxlen		= sizeof(sysctl_memory_failure_early_kill),
  1712			.mode		= 0644,
  1713			.proc_handler	= proc_dointvec_minmax,
  1714			.extra1		= &zero,
  1715			.extra2		= &one,
  1716		},
  1717		{
  1718			.procname	= "memory_failure_recovery",
  1719			.data		= &sysctl_memory_failure_recovery,
  1720			.maxlen		= sizeof(sysctl_memory_failure_recovery),
  1721			.mode		= 0644,
  1722			.proc_handler	= proc_dointvec_minmax,
  1723			.extra1		= &zero,
  1724			.extra2		= &one,
  1725		},
  1726	#endif
  1727		{
  1728			.procname	= "user_reserve_kbytes",
  1729			.data		= &sysctl_user_reserve_kbytes,
  1730			.maxlen		= sizeof(sysctl_user_reserve_kbytes),
  1731			.mode		= 0644,
  1732			.proc_handler	= proc_doulongvec_minmax,
  1733		},
  1734		{
  1735			.procname	= "admin_reserve_kbytes",
  1736			.data		= &sysctl_admin_reserve_kbytes,
  1737			.maxlen		= sizeof(sysctl_admin_reserve_kbytes),
  1738			.mode		= 0644,
  1739			.proc_handler	= proc_doulongvec_minmax,
  1740		},
  1741	#ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
  1742		{
  1743			.procname	= "mmap_rnd_bits",
  1744			.data		= &mmap_rnd_bits,
  1745			.maxlen		= sizeof(mmap_rnd_bits),
  1746			.mode		= 0600,
  1747			.proc_handler	= proc_dointvec_minmax,
  1748			.extra1		= (void *)&mmap_rnd_bits_min,
  1749			.extra2		= (void *)&mmap_rnd_bits_max,
  1750		},
  1751	#endif
  1752	#ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
  1753		{
  1754			.procname	= "mmap_rnd_compat_bits",
  1755			.data		= &mmap_rnd_compat_bits,
  1756			.maxlen		= sizeof(mmap_rnd_compat_bits),
  1757			.mode		= 0600,
  1758			.proc_handler	= proc_dointvec_minmax,
  1759			.extra1		= (void *)&mmap_rnd_compat_bits_min,
  1760			.extra2		= (void *)&mmap_rnd_compat_bits_max,
  1761		},
  1762	#endif
  1763	#ifdef CONFIG_ASCEND_SHARE_POOL
  1764		{
  1765			.procname	= "sharepool_ac_mode",
  1766			.data		= &sysctl_ac_mode,
  1767			.maxlen		= sizeof(sysctl_ac_mode),
  1768			.mode		= 0600,
  1769			.proc_handler	= proc_dointvec_minmax,
  1770			.extra1		= &zero,
  1771			.extra2		= &one,
  1772		},
  1773		{
  1774			.procname	= "sharepool_debug_mode",
  1775			.data		= &sysctl_sp_debug_mode,
  1776			.maxlen		= sizeof(sysctl_sp_debug_mode),
  1777			.mode		= 0600,
  1778			.proc_handler	= proc_dointvec_minmax,
  1779			.extra1		= &zero,
  1780			.extra2		= &one,
  1781		},
  1782		{
  1783			/* 0: map_unlock, 1: map_lock */
  1784			.procname	= "share_pool_map_lock_enable",
  1785			.data		= &sysctl_share_pool_map_lock_enable,
  1786			.maxlen		= sizeof(int),
  1787			.mode		= 0644,
  1788			.proc_handler	= proc_dointvec_minmax,
  1789			.extra1		= &zero,
  1790			.extra2		= &one,
  1791		},
  1792		{
  1793			.procname	= "sharepool_compact_enable",
  1794			.data		= &sysctl_sp_compact_enable,
  1795			.maxlen		= sizeof(sysctl_sp_compact_enable),
  1796			.mode		= 0600,
  1797			.proc_handler	= proc_dointvec_minmax,
  1798			.extra1		= &zero,
  1799			.extra2		= &one,
  1800		},
  1801		{
  1802			.procname	= "sharepool_compact_interval",
  1803			.data		= &sysctl_sp_compact_interval,
  1804			.maxlen		= sizeof(sysctl_sp_compact_interval),
  1805			.mode		= 0600,
  1806			.proc_handler	= proc_doulongvec_minmax,
  1807			.extra1		= &zero_ul,
  1808			.extra2		= &sysctl_sp_compact_interval_max,
  1809		},
  1810		{
  1811			.procname	= "sharepool_perf_alloc",
  1812			.data		= &sysctl_sp_perf_alloc,
  1813			.maxlen		= sizeof(sysctl_sp_perf_alloc),
  1814			.mode		= 0600,
  1815			.proc_handler	= proc_dointvec_minmax,
  1816			.extra1		= &zero,
> 1817			.extra2		= &ten_thousand,
  1818		},
  1819	#endif
  1820		{ }
  1821	};
  1822	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
