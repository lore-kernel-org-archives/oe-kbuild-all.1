Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD29953815
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710365651; cv=none; b=CaYtoqaLMCrXZozMp+ag5D2FoUklP7f6a6mNfWIVtKINOGwyM8/+40SxFnvjf98nPEjEertJrw376frCX5UBSCWjy540Re/gh9SFQYweAcOVw64nW0xpR7qqnvRv2MoNd57hjzDdtrrWwQ0fWZQOBkovW0EUbPPBX4cyttNQ/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710365651; c=relaxed/simple;
	bh=fN8vhnmn3A4KO5G6g9zOgoj+eio7k7NR1rCCoEDGuPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNCIJcscQRj8rsKgpzhn+L/lDUCMJbd3io3qAG2q9ipbHrI+kmQzr/e928klKzrQ39HP2rcL/i88mFOl+o51TQ4UQV0WLw3p4eO89uO9oWDY4lNWUigLeIu8K/PNtd4KwdOjeCv/ZZkiTJz3gh/vxwU7yvN6O5KlrErebKQAkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVFrpSi3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVFrpSi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710365649; x=1741901649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fN8vhnmn3A4KO5G6g9zOgoj+eio7k7NR1rCCoEDGuPo=;
  b=EVFrpSi3GuiDDO1F36GRnEjtHpnGpNoeP8PHS2zMc7Sy8WJoYkmIs2so
   wEsEG7wWxnAII/4HhASpggNev5jet8kHEXKBxvFaMY8tCcZqETHZPiDoR
   o5k+N8S58AN6oIHIkJR0gA4yaOdNouyLS4TVLy+nKQtZceLnxhKwJj6uZ
   VJwET3O3+lqCZuaUuhHjpf908yhBefGgUs71rfOqCr5Mxq1xb4PbNxPBv
   z0B6SpsFpYe3rpIIoCe6fsny6au7KW2QOGWsv3vBZ3WrMyZWaaC5qnWvJ
   youxl6/JapGuPA1a6jvRBdM5Vo9TGiObS1tQgUsyAcV7sVrMA/OYLB6so
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8982722"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="8982722"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 14:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="43103992"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2024 14:34:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkWEc-000Cmr-1H;
	Wed, 13 Mar 2024 21:34:02 +0000
Date: Thu, 14 Mar 2024 05:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/sysctl.c:1463:25: warning: tentative array definition assumed
 to have one element
Message-ID: <202403140539.Os3dRBJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   ef4270af264f76e609dfd098345acae7e024b403
commit: 06d37efeef4689ee10a610bbe91d85de62b88d6c mm: pagecache limit per cgroup support
date:   2 years, 5 months ago
config: x86_64-randconfig-075-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140539.Os3dRBJI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140539.Os3dRBJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140539.Os3dRBJI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sysctl.c:1634:13: error: use of undeclared identifier 'vm_pagecache_limit_retry_times'
    1634 |                 .data           = &vm_pagecache_limit_retry_times,
         |                                    ^
   kernel/sysctl.c:1635:21: error: use of undeclared identifier 'vm_pagecache_limit_retry_times'
    1635 |                 .maxlen         = sizeof(vm_pagecache_limit_retry_times),
         |                                          ^
   kernel/sysctl.c:2649:5: warning: no previous prototype for function 'setup_pagecache_limit' [-Wmissing-prototypes]
    2649 | int setup_pagecache_limit(void)
         |     ^
   kernel/sysctl.c:2649:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2649 | int setup_pagecache_limit(void)
         | ^
         | static 
   kernel/sysctl.c:3014:44: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
    3014 |         struct do_proc_dointvec_minmax_conv_param param = {
         |                                                   ^
>> kernel/sysctl.c:1463:25: warning: tentative array definition assumed to have one element
    1463 | static struct ctl_table vm_table[] = {
         |                         ^
   3 warnings and 2 errors generated.


vim +1463 kernel/sysctl.c

^590eaf1fec755 Kaixu Xia 2021-03-16  1453  
^590eaf1fec755 Kaixu Xia 2021-03-16  1454  static int pc_limit_proc_dointvec(struct ctl_table *table, int write,
^590eaf1fec755 Kaixu Xia 2021-03-16  1455  		     void __user *buffer, size_t *lenp, loff_t *ppos);
^590eaf1fec755 Kaixu Xia 2021-03-16  1456  
^590eaf1fec755 Kaixu Xia 2021-03-16  1457  static int pc_reclaim_limit_proc_dointvec(struct ctl_table *table, int write,
^590eaf1fec755 Kaixu Xia 2021-03-16  1458  		     void __user *buffer, size_t *lenp, loff_t *ppos);
^590eaf1fec755 Kaixu Xia 2021-03-16  1459  
^590eaf1fec755 Kaixu Xia 2021-03-16  1460  static int pc_limit_async_handler(struct ctl_table *table, int write,
^590eaf1fec755 Kaixu Xia 2021-03-16  1461   		     void __user *buffer, size_t *lenp, loff_t *ppos);
^590eaf1fec755 Kaixu Xia 2021-03-16  1462  
^590eaf1fec755 Kaixu Xia 2021-03-16 @1463  static struct ctl_table vm_table[] = {
^590eaf1fec755 Kaixu Xia 2021-03-16  1464  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1465  		.procname	= "overcommit_memory",
^590eaf1fec755 Kaixu Xia 2021-03-16  1466  		.data		= &sysctl_overcommit_memory,
^590eaf1fec755 Kaixu Xia 2021-03-16  1467  		.maxlen		= sizeof(sysctl_overcommit_memory),
^590eaf1fec755 Kaixu Xia 2021-03-16  1468  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1469  		.proc_handler	= proc_dointvec_minmax,
^590eaf1fec755 Kaixu Xia 2021-03-16  1470  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1471  		.extra2		= &two,
^590eaf1fec755 Kaixu Xia 2021-03-16  1472  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1473  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1474  		.procname	= "panic_on_oom",
^590eaf1fec755 Kaixu Xia 2021-03-16  1475  		.data		= &sysctl_panic_on_oom,
^590eaf1fec755 Kaixu Xia 2021-03-16  1476  		.maxlen		= sizeof(sysctl_panic_on_oom),
^590eaf1fec755 Kaixu Xia 2021-03-16  1477  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1478  		.proc_handler	= proc_dointvec_minmax,
^590eaf1fec755 Kaixu Xia 2021-03-16  1479  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1480  		.extra2		= &two,
^590eaf1fec755 Kaixu Xia 2021-03-16  1481  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1482  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1483  		.procname	= "oom_kill_allocating_task",
^590eaf1fec755 Kaixu Xia 2021-03-16  1484  		.data		= &sysctl_oom_kill_allocating_task,
^590eaf1fec755 Kaixu Xia 2021-03-16  1485  		.maxlen		= sizeof(sysctl_oom_kill_allocating_task),
^590eaf1fec755 Kaixu Xia 2021-03-16  1486  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1487  		.proc_handler	= proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1488  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1489  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1490  		.procname	= "oom_dump_tasks",
^590eaf1fec755 Kaixu Xia 2021-03-16  1491  		.data		= &sysctl_oom_dump_tasks,
^590eaf1fec755 Kaixu Xia 2021-03-16  1492  		.maxlen		= sizeof(sysctl_oom_dump_tasks),
^590eaf1fec755 Kaixu Xia 2021-03-16  1493  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1494  		.proc_handler	= proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1495  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1496  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1497  		.procname	= "overcommit_ratio",
^590eaf1fec755 Kaixu Xia 2021-03-16  1498  		.data		= &sysctl_overcommit_ratio,
^590eaf1fec755 Kaixu Xia 2021-03-16  1499  		.maxlen		= sizeof(sysctl_overcommit_ratio),
^590eaf1fec755 Kaixu Xia 2021-03-16  1500  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1501  		.proc_handler	= overcommit_ratio_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1502  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1503  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1504  		.procname	= "overcommit_kbytes",
^590eaf1fec755 Kaixu Xia 2021-03-16  1505  		.data		= &sysctl_overcommit_kbytes,
^590eaf1fec755 Kaixu Xia 2021-03-16  1506  		.maxlen		= sizeof(sysctl_overcommit_kbytes),
^590eaf1fec755 Kaixu Xia 2021-03-16  1507  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1508  		.proc_handler	= overcommit_kbytes_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1509  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1510  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1511  		.procname	= "page-cluster", 
^590eaf1fec755 Kaixu Xia 2021-03-16  1512  		.data		= &page_cluster,
^590eaf1fec755 Kaixu Xia 2021-03-16  1513  		.maxlen		= sizeof(int),
^590eaf1fec755 Kaixu Xia 2021-03-16  1514  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1515  		.proc_handler	= proc_dointvec_minmax,
^590eaf1fec755 Kaixu Xia 2021-03-16  1516  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1517  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1518  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1519  		.procname	= "dirty_background_ratio",
^590eaf1fec755 Kaixu Xia 2021-03-16  1520  		.data		= &dirty_background_ratio,
^590eaf1fec755 Kaixu Xia 2021-03-16  1521  		.maxlen		= sizeof(dirty_background_ratio),
^590eaf1fec755 Kaixu Xia 2021-03-16  1522  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1523  		.proc_handler	= dirty_background_ratio_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1524  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1525  		.extra2		= &one_hundred,
^590eaf1fec755 Kaixu Xia 2021-03-16  1526  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1527  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1528  		.procname	= "dirty_background_bytes",
^590eaf1fec755 Kaixu Xia 2021-03-16  1529  		.data		= &dirty_background_bytes,
^590eaf1fec755 Kaixu Xia 2021-03-16  1530  		.maxlen		= sizeof(dirty_background_bytes),
^590eaf1fec755 Kaixu Xia 2021-03-16  1531  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1532  		.proc_handler	= dirty_background_bytes_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1533  		.extra1		= &one_ul,
^590eaf1fec755 Kaixu Xia 2021-03-16  1534  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1535  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1536  		.procname	= "dirty_ratio",
^590eaf1fec755 Kaixu Xia 2021-03-16  1537  		.data		= &vm_dirty_ratio,
^590eaf1fec755 Kaixu Xia 2021-03-16  1538  		.maxlen		= sizeof(vm_dirty_ratio),
^590eaf1fec755 Kaixu Xia 2021-03-16  1539  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1540  		.proc_handler	= dirty_ratio_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1541  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1542  		.extra2		= &one_hundred,
^590eaf1fec755 Kaixu Xia 2021-03-16  1543  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1544  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1545  		.procname	= "dirty_bytes",
^590eaf1fec755 Kaixu Xia 2021-03-16  1546  		.data		= &vm_dirty_bytes,
^590eaf1fec755 Kaixu Xia 2021-03-16  1547  		.maxlen		= sizeof(vm_dirty_bytes),
^590eaf1fec755 Kaixu Xia 2021-03-16  1548  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1549  		.proc_handler	= dirty_bytes_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1550  		.extra1		= &dirty_bytes_min,
^590eaf1fec755 Kaixu Xia 2021-03-16  1551  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1552  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1553  		.procname	= "dirty_writeback_centisecs",
^590eaf1fec755 Kaixu Xia 2021-03-16  1554  		.data		= &dirty_writeback_interval,
^590eaf1fec755 Kaixu Xia 2021-03-16  1555  		.maxlen		= sizeof(dirty_writeback_interval),
^590eaf1fec755 Kaixu Xia 2021-03-16  1556  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1557  		.proc_handler	= dirty_writeback_centisecs_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1558  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1559  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1560  		.procname	= "dirty_expire_centisecs",
^590eaf1fec755 Kaixu Xia 2021-03-16  1561  		.data		= &dirty_expire_interval,
^590eaf1fec755 Kaixu Xia 2021-03-16  1562  		.maxlen		= sizeof(dirty_expire_interval),
^590eaf1fec755 Kaixu Xia 2021-03-16  1563  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1564  		.proc_handler	= proc_dointvec_minmax,
^590eaf1fec755 Kaixu Xia 2021-03-16  1565  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1566  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1567  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1568  		.procname	= "dirtytime_expire_seconds",
^590eaf1fec755 Kaixu Xia 2021-03-16  1569  		.data		= &dirtytime_expire_interval,
^590eaf1fec755 Kaixu Xia 2021-03-16  1570  		.maxlen		= sizeof(dirtytime_expire_interval),
^590eaf1fec755 Kaixu Xia 2021-03-16  1571  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1572  		.proc_handler	= dirtytime_interval_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1573  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1574  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1575  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1576  		.procname	= "swappiness",
^590eaf1fec755 Kaixu Xia 2021-03-16  1577  		.data		= &vm_swappiness,
^590eaf1fec755 Kaixu Xia 2021-03-16  1578  		.maxlen		= sizeof(vm_swappiness),
^590eaf1fec755 Kaixu Xia 2021-03-16  1579  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1580  		.proc_handler	= proc_dointvec_minmax,
^590eaf1fec755 Kaixu Xia 2021-03-16  1581  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1582  		.extra2		= &one_hundred,
^590eaf1fec755 Kaixu Xia 2021-03-16  1583  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1584  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1585  		.procname	= "pagecache_limit_ratio",
^590eaf1fec755 Kaixu Xia 2021-03-16  1586  		.data		= &vm_pagecache_limit_ratio,
^590eaf1fec755 Kaixu Xia 2021-03-16  1587  		.maxlen		= sizeof(vm_pagecache_limit_ratio),
^590eaf1fec755 Kaixu Xia 2021-03-16  1588  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1589  		.proc_handler	= &pc_limit_proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1590  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1591  		.extra2		= &one_hundred,
^590eaf1fec755 Kaixu Xia 2021-03-16  1592  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1593  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1594  		.procname	= "pagecache_limit_reclaim_ratio",
^590eaf1fec755 Kaixu Xia 2021-03-16  1595  		.data		= &vm_pagecache_limit_reclaim_ratio,
^590eaf1fec755 Kaixu Xia 2021-03-16  1596  		.maxlen		= sizeof(vm_pagecache_limit_reclaim_ratio),
^590eaf1fec755 Kaixu Xia 2021-03-16  1597  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1598  		.proc_handler	= &pc_reclaim_limit_proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1599  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1600  		.extra2		= &one_hundred,
^590eaf1fec755 Kaixu Xia 2021-03-16  1601  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1602  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1603  		.procname	= "pagecache_limit_ignore_dirty",
^590eaf1fec755 Kaixu Xia 2021-03-16  1604  		.data		= &vm_pagecache_ignore_dirty,
^590eaf1fec755 Kaixu Xia 2021-03-16  1605  		.maxlen		= sizeof(vm_pagecache_ignore_dirty),
^590eaf1fec755 Kaixu Xia 2021-03-16  1606  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1607  		.proc_handler	= &proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1608  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1609  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1610  		.procname	= "pagecache_limit_async",
^590eaf1fec755 Kaixu Xia 2021-03-16  1611  		.data		= &vm_pagecache_limit_async,
^590eaf1fec755 Kaixu Xia 2021-03-16  1612  		.maxlen		= sizeof(vm_pagecache_limit_async),
^590eaf1fec755 Kaixu Xia 2021-03-16  1613  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1614  		.proc_handler	= &pc_limit_async_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1615  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1616  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1617  		.procname	= "pagecache_limit_ignore_slab",
^590eaf1fec755 Kaixu Xia 2021-03-16  1618  		.data		= &vm_pagecache_ignore_slab,
^590eaf1fec755 Kaixu Xia 2021-03-16  1619  		.maxlen		= sizeof(vm_pagecache_ignore_slab),
^590eaf1fec755 Kaixu Xia 2021-03-16  1620  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1621  		.proc_handler	= &proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1622  	},
06d37efeef4689 linuszeng 2021-10-08  1623  	{
06d37efeef4689 linuszeng 2021-10-08  1624  		.procname	= "pagecache_limit_global",
06d37efeef4689 linuszeng 2021-10-08  1625  		.data		= &vm_pagecache_limit_global,
06d37efeef4689 linuszeng 2021-10-08  1626  		.maxlen		= sizeof(vm_pagecache_limit_global),
06d37efeef4689 linuszeng 2021-10-08  1627  		.mode		= 0644,
06d37efeef4689 linuszeng 2021-10-08  1628  		.proc_handler	= &proc_dointvec_minmax,
06d37efeef4689 linuszeng 2021-10-08  1629  		.extra1		= SYSCTL_ZERO,
06d37efeef4689 linuszeng 2021-10-08  1630  		.extra2		= SYSCTL_ONE,
06d37efeef4689 linuszeng 2021-10-08  1631  	},
06d37efeef4689 linuszeng 2021-10-08  1632  	{
06d37efeef4689 linuszeng 2021-10-08  1633  		.procname	= "pagecache_limit_retry_times",
06d37efeef4689 linuszeng 2021-10-08  1634  		.data		= &vm_pagecache_limit_retry_times,
06d37efeef4689 linuszeng 2021-10-08  1635  		.maxlen		= sizeof(vm_pagecache_limit_retry_times),
06d37efeef4689 linuszeng 2021-10-08  1636  		.mode		= 0644,
06d37efeef4689 linuszeng 2021-10-08  1637  		.proc_handler	= &proc_dointvec_minmax,
06d37efeef4689 linuszeng 2021-10-08  1638  		.extra1		= SYSCTL_ZERO,
06d37efeef4689 linuszeng 2021-10-08  1639  		.extra2		= &one_hundred,
06d37efeef4689 linuszeng 2021-10-08  1640  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1641  #ifdef CONFIG_HUGETLB_PAGE
^590eaf1fec755 Kaixu Xia 2021-03-16  1642  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1643  		.procname	= "nr_hugepages",
^590eaf1fec755 Kaixu Xia 2021-03-16  1644  		.data		= NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  1645  		.maxlen		= sizeof(unsigned long),
^590eaf1fec755 Kaixu Xia 2021-03-16  1646  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1647  		.proc_handler	= hugetlb_sysctl_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1648  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1649  #ifdef CONFIG_NUMA
^590eaf1fec755 Kaixu Xia 2021-03-16  1650  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1651  		.procname       = "nr_hugepages_mempolicy",
^590eaf1fec755 Kaixu Xia 2021-03-16  1652  		.data           = NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  1653  		.maxlen         = sizeof(unsigned long),
^590eaf1fec755 Kaixu Xia 2021-03-16  1654  		.mode           = 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1655  		.proc_handler   = &hugetlb_mempolicy_sysctl_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1656  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1657  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1658  		.procname		= "numa_stat",
^590eaf1fec755 Kaixu Xia 2021-03-16  1659  		.data			= &sysctl_vm_numa_stat,
^590eaf1fec755 Kaixu Xia 2021-03-16  1660  		.maxlen			= sizeof(int),
^590eaf1fec755 Kaixu Xia 2021-03-16  1661  		.mode			= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1662  		.proc_handler	= sysctl_vm_numa_stat_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1663  		.extra1			= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1664  		.extra2			= SYSCTL_ONE,
^590eaf1fec755 Kaixu Xia 2021-03-16  1665  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1666  #endif
^590eaf1fec755 Kaixu Xia 2021-03-16  1667  	 {
^590eaf1fec755 Kaixu Xia 2021-03-16  1668  		.procname	= "hugetlb_shm_group",
^590eaf1fec755 Kaixu Xia 2021-03-16  1669  		.data		= &sysctl_hugetlb_shm_group,
^590eaf1fec755 Kaixu Xia 2021-03-16  1670  		.maxlen		= sizeof(gid_t),
^590eaf1fec755 Kaixu Xia 2021-03-16  1671  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1672  		.proc_handler	= proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1673  	 },
^590eaf1fec755 Kaixu Xia 2021-03-16  1674  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1675  		.procname	= "nr_overcommit_hugepages",
^590eaf1fec755 Kaixu Xia 2021-03-16  1676  		.data		= NULL,
^590eaf1fec755 Kaixu Xia 2021-03-16  1677  		.maxlen		= sizeof(unsigned long),
^590eaf1fec755 Kaixu Xia 2021-03-16  1678  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1679  		.proc_handler	= hugetlb_overcommit_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1680  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1681  #endif
^590eaf1fec755 Kaixu Xia 2021-03-16  1682  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1683  		.procname	= "lowmem_reserve_ratio",
^590eaf1fec755 Kaixu Xia 2021-03-16  1684  		.data		= &sysctl_lowmem_reserve_ratio,
^590eaf1fec755 Kaixu Xia 2021-03-16  1685  		.maxlen		= sizeof(sysctl_lowmem_reserve_ratio),
^590eaf1fec755 Kaixu Xia 2021-03-16  1686  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1687  		.proc_handler	= lowmem_reserve_ratio_sysctl_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1688  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1689  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1690  		.procname	= "drop_caches",
^590eaf1fec755 Kaixu Xia 2021-03-16  1691  		.data		= &sysctl_drop_caches,
^590eaf1fec755 Kaixu Xia 2021-03-16  1692  		.maxlen		= sizeof(int),
^590eaf1fec755 Kaixu Xia 2021-03-16  1693  		.mode		= 0200,
^590eaf1fec755 Kaixu Xia 2021-03-16  1694  		.proc_handler	= drop_caches_sysctl_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1695  		.extra1		= SYSCTL_ONE,
^590eaf1fec755 Kaixu Xia 2021-03-16  1696  		.extra2		= &four,
^590eaf1fec755 Kaixu Xia 2021-03-16  1697  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1698  #ifdef CONFIG_COMPACTION
^590eaf1fec755 Kaixu Xia 2021-03-16  1699  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1700  		.procname	= "compact_memory",
^590eaf1fec755 Kaixu Xia 2021-03-16  1701  		.data		= &sysctl_compact_memory,
^590eaf1fec755 Kaixu Xia 2021-03-16  1702  		.maxlen		= sizeof(int),
^590eaf1fec755 Kaixu Xia 2021-03-16  1703  		.mode		= 0200,
^590eaf1fec755 Kaixu Xia 2021-03-16  1704  		.proc_handler	= sysctl_compaction_handler,
^590eaf1fec755 Kaixu Xia 2021-03-16  1705  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1706  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1707  		.procname	= "extfrag_threshold",
^590eaf1fec755 Kaixu Xia 2021-03-16  1708  		.data		= &sysctl_extfrag_threshold,
^590eaf1fec755 Kaixu Xia 2021-03-16  1709  		.maxlen		= sizeof(int),
^590eaf1fec755 Kaixu Xia 2021-03-16  1710  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1711  		.proc_handler	= proc_dointvec_minmax,
^590eaf1fec755 Kaixu Xia 2021-03-16  1712  		.extra1		= &min_extfrag_threshold,
^590eaf1fec755 Kaixu Xia 2021-03-16  1713  		.extra2		= &max_extfrag_threshold,
^590eaf1fec755 Kaixu Xia 2021-03-16  1714  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1715  	{
^590eaf1fec755 Kaixu Xia 2021-03-16  1716  		.procname	= "compact_unevictable_allowed",
^590eaf1fec755 Kaixu Xia 2021-03-16  1717  		.data		= &sysctl_compact_unevictable_allowed,
^590eaf1fec755 Kaixu Xia 2021-03-16  1718  		.maxlen		= sizeof(int),
^590eaf1fec755 Kaixu Xia 2021-03-16  1719  		.mode		= 0644,
^590eaf1fec755 Kaixu Xia 2021-03-16  1720  		.proc_handler	= proc_dointvec,
^590eaf1fec755 Kaixu Xia 2021-03-16  1721  		.extra1		= SYSCTL_ZERO,
^590eaf1fec755 Kaixu Xia 2021-03-16  1722  		.extra2		= SYSCTL_ONE,
^590eaf1fec755 Kaixu Xia 2021-03-16  1723  	},
^590eaf1fec755 Kaixu Xia 2021-03-16  1724  

:::::: The code at line 1463 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
