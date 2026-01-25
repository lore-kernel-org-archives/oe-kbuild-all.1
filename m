Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF42248880
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769364736; cv=none; b=Ohb0tXWZJjJJ3GuYFkynyzS/QFdltwmSo4gF3zbdRu0oHI/e2N9m+GVciYDgat4CwdprAJkNdKx1/lsXbCtgwU7QLip+JBTm8ivASLQc/pVDveaiZJz3rLZlJyjbGL/QI6Ow/Z7y9XNJ3Oouv+srgz9pNuOr4PB0dkqmHXoGivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769364736; c=relaxed/simple;
	bh=CpXTdHzQy3CDYlcEJ6ngOF8pklmjLgNqg8fDJZW40MA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nqdcEDbQIUxeE9Cuj0blqao45pUHp3/Bd86lk8EVlM4ixmP6QEws3jYwjUAi+ZJGebFgs47U+ST40Q1n73lWlWcvccHhOFyg343B4sJDZFr0Hj4uloHW4D0aLOSdyyoueYjueZ2T7w8KXVZby/dRVBaMwzihQ85LkcZEktONgAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h18aMqvT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h18aMqvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769364735; x=1800900735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CpXTdHzQy3CDYlcEJ6ngOF8pklmjLgNqg8fDJZW40MA=;
  b=h18aMqvT20tK4eqnH9oTVMhAIAJwNx2UvHqJ+SmumyMkW45poSYPXxpC
   rqzfG9v/8z7a1oa8GVSVyxXv4SRMVvbj6udGs2LRT0lC4ytW/RSRK8BCW
   rBJwD+0K63F3zy7gGBAP2Pur8aFBzxSaA+NvY0jdL/jz0cqcRvR+HWHms
   3gZJB1//KFWBQzZYIYKIxGCPXyIQ75MYgvrubx08uwDaaoF7MRneNtftE
   ZwGQJokj95JaLke8D4Rwtm+EeCMVn7ToOfsOz3PJjpMS3pOddBmZybLDg
   NH/Eh6tNXIblt5fRsOIlQtgeWdEacakW/eengR0wF+xrOJvCG1GrllayZ
   w==;
X-CSE-ConnectionGUID: R7MwXVOvTTWw+Kt10ztmMA==
X-CSE-MsgGUID: 2GcjUHv5THyNUsv0qdp9xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81987816"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81987816"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 10:12:14 -0800
X-CSE-ConnectionGUID: OTvGg0p4R8Gtm5TyWO6xNA==
X-CSE-MsgGUID: 8qqHX2bASrSvBhHvz9qlHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207311738"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 25 Jan 2026 10:12:13 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4an-000000001Kf-3m72;
	Sun, 25 Jan 2026 18:12:09 +0000
Date: Sun, 25 Jan 2026 19:11:56 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 17/17]
 drivers/i2c/i2c-core-base.c:1602:53: error: passing argument 4 of
 'bus_for_each_drv' from incompatible pointer type
Message-ID: <202601251908.GS4UedzG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-driver-attribute
head:   92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d
commit: 92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d [17/17] bus_for_each_drv
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260125/202601251908.GS4UedzG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251908.GS4UedzG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251908.GS4UedzG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/i2c-core-base.c: In function 'i2c_register_adapter':
>> drivers/i2c/i2c-core-base.c:1602:53: error: passing argument 4 of 'bus_for_each_drv' from incompatible pointer type [-Wincompatible-pointer-types]
    1602 |         bus_for_each_drv(&i2c_bus_type, NULL, adap, __process_new_adapter);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     int (*)(struct device_driver *, void *)
   In file included from include/linux/device.h:29,
                    from include/linux/acpi.h:15,
                    from drivers/i2c/i2c-core-base.c:16:
   include/linux/device/bus.h:241:40: note: expected 'int (*)(const struct device_driver *, void *)' but argument is of type 'int (*)(struct device_driver *, void *)'
     241 |                      void *data, int (*fn)(const struct device_driver *, void *));
         |                                  ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c: In function 'i2c_del_adapter':
   drivers/i2c/i2c-core-base.c:1773:32: error: passing argument 4 of 'bus_for_each_drv' from incompatible pointer type [-Wincompatible-pointer-types]
    1773 |                                __process_removed_adapter);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                |
         |                                int (*)(struct device_driver *, void *)
   include/linux/device/bus.h:241:40: note: expected 'int (*)(const struct device_driver *, void *)' but argument is of type 'int (*)(struct device_driver *, void *)'
     241 |                      void *data, int (*fn)(const struct device_driver *, void *));
         |                                  ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bus_for_each_drv +1602 drivers/i2c/i2c-core-base.c

4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1518  
6e13e641841833 drivers/i2c/i2c-core.c      David Brownell     2007-05-01  1519  static int i2c_register_adapter(struct i2c_adapter *adap)
^1da177e4c3f41 drivers/i2c/i2c-core.c      Linus Torvalds     2005-04-16  1520  {
ce0dffafd403e7 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1521  	int res = -EINVAL;
^1da177e4c3f41 drivers/i2c/i2c-core.c      Linus Torvalds     2005-04-16  1522  
1d0b19c9a0612c drivers/i2c/i2c-core.c      David Brownell     2008-10-14  1523  	/* Can't register until after driver model init */
95026658c46ea2 drivers/i2c/i2c-core.c      Sudip Mukherjee    2016-03-07  1524  	if (WARN_ON(!is_registered)) {
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1525  		res = -EAGAIN;
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1526  		goto out_list;
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1527  	}
1d0b19c9a0612c drivers/i2c/i2c-core.c      David Brownell     2008-10-14  1528  
2236baa75f7048 drivers/i2c/i2c-core.c      Jean Delvare       2010-11-15  1529  	/* Sanity checks */
8ddfe4108e0a16 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1530  	if (WARN(!adap->name[0], "i2c adapter has no name"))
ce0dffafd403e7 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1531  		goto out_list;
8ddfe4108e0a16 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1532  
8ddfe4108e0a16 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1533  	if (!adap->algo) {
44239a5afd7c56 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1534  		pr_err("adapter '%s': no algo supplied!\n", adap->name);
ce0dffafd403e7 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1535  		goto out_list;
2236baa75f7048 drivers/i2c/i2c-core.c      Jean Delvare       2010-11-15  1536  	}
2236baa75f7048 drivers/i2c/i2c-core.c      Jean Delvare       2010-11-15  1537  
d1ed7985b9a6b8 drivers/i2c/i2c-core.c      Peter Rosin        2016-08-25  1538  	if (!adap->lock_ops)
d1ed7985b9a6b8 drivers/i2c/i2c-core.c      Peter Rosin        2016-08-25  1539  		adap->lock_ops = &i2c_adapter_lock_ops;
8320f495cf441d drivers/i2c/i2c-core.c      Peter Rosin        2016-05-04  1540  
9ac6cb5fbb1781 drivers/i2c/i2c-core-base.c Wolfram Sang       2018-12-19  1541  	adap->locked_flags = 0;
194684e596af4b drivers/i2c/i2c-core.c      Mika Kuoppala      2009-12-06  1542  	rt_mutex_init(&adap->bus_lock);
6ef91fcca8a8ba drivers/i2c/i2c-core.c      Peter Rosin        2016-05-04  1543  	rt_mutex_init(&adap->mux_lock);
c4d3dfd8ccaef2 drivers/i2c/i2c-core-base.c Wolfram Sang       2025-02-05  1544  	mutex_init(&adap->userspace_clients_lock);
c4d3dfd8ccaef2 drivers/i2c/i2c-core-base.c Wolfram Sang       2025-02-05  1545  	INIT_LIST_HEAD(&adap->userspace_clients);
^1da177e4c3f41 drivers/i2c/i2c-core.c      Linus Torvalds     2005-04-16  1546  
8fcfef6e65c5b5 drivers/i2c/i2c-core.c      Jean Delvare       2009-03-28  1547  	/* Set default timeout to 1 second if not already set */
8fcfef6e65c5b5 drivers/i2c/i2c-core.c      Jean Delvare       2009-03-28  1548  	if (adap->timeout == 0)
8fcfef6e65c5b5 drivers/i2c/i2c-core.c      Jean Delvare       2009-03-28  1549  		adap->timeout = HZ;
8fcfef6e65c5b5 drivers/i2c/i2c-core.c      Jean Delvare       2009-03-28  1550  
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1551  	/* register soft irqs for Host Notify */
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1552  	res = i2c_setup_host_notify_irq_domain(adap);
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1553  	if (res) {
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1554  		pr_err("adapter '%s': can't create Host Notify IRQs (%d)\n",
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1555  		       adap->name, res);
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1556  		goto out_list;
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1557  	}
4d5538f5882a6b drivers/i2c/i2c-core.c      Benjamin Tissoires 2016-10-13  1558  
27d9c1838f65cc drivers/i2c/i2c-core.c      Kay Sievers        2009-01-07  1559  	dev_set_name(&adap->dev, "i2c-%d", adap->nr);
4f8cf8240a0c8b drivers/i2c/i2c-core.c      Jean Delvare       2009-09-18  1560  	adap->dev.bus = &i2c_bus_type;
4f8cf8240a0c8b drivers/i2c/i2c-core.c      Jean Delvare       2009-09-18  1561  	adap->dev.type = &i2c_adapter_type;
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1562  	device_initialize(&adap->dev);
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1563  
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1564  	/*
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1565  	 * This adapter can be used as a parent immediately after device_add(),
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1566  	 * setup runtime-pm (especially ignore-children) before hand.
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1567  	 */
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1568  	device_enable_async_suspend(&adap->dev);
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1569  	pm_runtime_no_callbacks(&adap->dev);
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1570  	pm_suspend_ignore_children(&adap->dev, true);
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1571  	pm_runtime_enable(&adap->dev);
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1572  
60f68597024d5a drivers/i2c/i2c-core-base.c Hans de Goede      2024-08-12  1573  	res = device_add(&adap->dev);
8ddfe4108e0a16 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1574  	if (res) {
44239a5afd7c56 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1575  		pr_err("adapter '%s': can't register device (%d)\n", adap->name, res);
3f8c4f5e9a5786 drivers/i2c/i2c-core-base.c Joe Hattori        2024-12-11  1576  		put_device(&adap->dev);
b119c6c952a086 drivers/i2c/i2c-core.c      Jean Delvare       2006-08-15  1577  		goto out_list;
8ddfe4108e0a16 drivers/i2c/i2c-core.c      Wolfram Sang       2016-07-09  1578  	}
^1da177e4c3f41 drivers/i2c/i2c-core.c      Linus Torvalds     2005-04-16  1579  
73febd775bdbdb drivers/i2c/i2c-core-base.c Wolfram Sang       2023-11-12  1580  	adap->debugfs = debugfs_create_dir(dev_name(&adap->dev), i2c_debugfs_root);
73febd775bdbdb drivers/i2c/i2c-core-base.c Wolfram Sang       2023-11-12  1581  
a263a84088f689 drivers/i2c/i2c-core-base.c Akhil R            2022-01-28  1582  	res = i2c_setup_smbus_alert(adap);
f8756c67b3de71 drivers/i2c/i2c-core-base.c Phil Reid          2017-08-24  1583  	if (res)
f8756c67b3de71 drivers/i2c/i2c-core-base.c Phil Reid          2017-08-24  1584  		goto out_reg;
f8756c67b3de71 drivers/i2c/i2c-core-base.c Phil Reid          2017-08-24  1585  
23a698fe65eca1 drivers/i2c/i2c-core-base.c Codrin Ciubotariu  2020-08-04  1586  	res = i2c_init_recovery(adap);
23a698fe65eca1 drivers/i2c/i2c-core-base.c Codrin Ciubotariu  2020-08-04  1587  	if (res == -EPROBE_DEFER)
23a698fe65eca1 drivers/i2c/i2c-core-base.c Codrin Ciubotariu  2020-08-04  1588  		goto out_reg;
23a698fe65eca1 drivers/i2c/i2c-core-base.c Codrin Ciubotariu  2020-08-04  1589  
23a698fe65eca1 drivers/i2c/i2c-core-base.c Codrin Ciubotariu  2020-08-04  1590  	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
23a698fe65eca1 drivers/i2c/i2c-core-base.c Codrin Ciubotariu  2020-08-04  1591  
729d6dd5714649 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1592  	/* create pre-declared device nodes */
687b81d083c082 drivers/i2c/i2c-core.c      Wolfram Sang       2013-07-11  1593  	of_i2c_register_devices(adap);
aec809fc63f61a drivers/i2c/i2c-core.c      Jarkko Nikula      2016-08-12  1594  	i2c_acpi_install_space_handler(adap);
21653a4181ff29 drivers/i2c/i2c-core-base.c Hans de Goede      2020-09-09  1595  	i2c_acpi_register_devices(adap);
687b81d083c082 drivers/i2c/i2c-core.c      Wolfram Sang       2013-07-11  1596  
6e13e641841833 drivers/i2c/i2c-core.c      David Brownell     2007-05-01  1597  	if (adap->nr < __i2c_first_dynamic_bus_num)
6e13e641841833 drivers/i2c/i2c-core.c      David Brownell     2007-05-01  1598  		i2c_scan_static_board_info(adap);
6e13e641841833 drivers/i2c/i2c-core.c      David Brownell     2007-05-01  1599  
4735c98f8447ac drivers/i2c/i2c-core.c      Jean Delvare       2008-07-14  1600  	/* Notify drivers */
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1601  	mutex_lock(&core_lock);
d6703281ff20df drivers/i2c/i2c-core.c      Jean Delvare       2010-08-11 @1602  	bus_for_each_drv(&i2c_bus_type, NULL, adap, __process_new_adapter);
caada32afe0d18 drivers/i2c/i2c-core.c      Jean Delvare       2008-01-27  1603  	mutex_unlock(&core_lock);
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1604  
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1605  	return 0;
b119c6c952a086 drivers/i2c/i2c-core.c      Jean Delvare       2006-08-15  1606  
f8756c67b3de71 drivers/i2c/i2c-core-base.c Phil Reid          2017-08-24  1607  out_reg:
73febd775bdbdb drivers/i2c/i2c-core-base.c Wolfram Sang       2023-11-12  1608  	debugfs_remove_recursive(adap->debugfs);
f8756c67b3de71 drivers/i2c/i2c-core-base.c Phil Reid          2017-08-24  1609  	init_completion(&adap->dev_released);
f8756c67b3de71 drivers/i2c/i2c-core-base.c Phil Reid          2017-08-24  1610  	device_unregister(&adap->dev);
f8756c67b3de71 drivers/i2c/i2c-core-base.c Phil Reid          2017-08-24  1611  	wait_for_completion(&adap->dev_released);
b119c6c952a086 drivers/i2c/i2c-core.c      Jean Delvare       2006-08-15  1612  out_list:
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1613  	mutex_lock(&core_lock);
b119c6c952a086 drivers/i2c/i2c-core.c      Jean Delvare       2006-08-15  1614  	idr_remove(&i2c_adapter_idr, adap->nr);
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1615  	mutex_unlock(&core_lock);
35fc37f8188177 drivers/i2c/i2c-core.c      Jean Delvare       2009-06-19  1616  	return res;
^1da177e4c3f41 drivers/i2c/i2c-core.c      Linus Torvalds     2005-04-16  1617  }
^1da177e4c3f41 drivers/i2c/i2c-core.c      Linus Torvalds     2005-04-16  1618  

:::::: The code at line 1602 was first introduced by commit
:::::: d6703281ff20df6c2c0ea7c39a0cc2fa8be3e680 i2c: Drop dummy variable

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Jean Delvare <khali@linux-fr.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
