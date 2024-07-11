Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EFA16D33F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720721380; cv=none; b=ekB394DHtAF/1eo83QteC/rcoPwN+VqYTrYLLAtVzLRYU8dSDyY67AE4eLrksg54HwffvzHQbzV+q+cntx/nH8ONmeun6E0ble8J/nZ8X0wfCiQKp3v65Lh2RJDuCUDJ/8DHdbD+qCpMwrLP4tbhJ7DOQHSoUr0eDY29Z04uDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720721380; c=relaxed/simple;
	bh=6pZct871FtOjeYmVLNIez5679egcP8p/w/Wp1JsrpZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDwqZE9h9qVclPXfcKL2oE1OAAIPdwKx7ncYKKhL8QNJxunnYpgtTDbKv2TBQs8BuuDytEljRByoxPL6hCQ/4aInQ0tLTx1p6ROkWBdb1RMRqN/aYaxu7BuIjbxw6uWf8XAdrg0Ueni0D6/O9Zn+y7B0GvAQWXOpfTDwwjMuPq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9ATMKb8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9ATMKb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720721378; x=1752257378;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6pZct871FtOjeYmVLNIez5679egcP8p/w/Wp1JsrpZk=;
  b=h9ATMKb8TJoFjCEjfwui2Mz5rN8qtT8/XVHKRcaHvvnMLd1sUI+zjspu
   l5eoDXr23t3YsK3ewHzkTHCszMKNpBhhhGlB36osc8gJG6oG4uXtQsqGY
   /Wb/u1NGVopSWWnJQDMeEm8E9+ybynuh9OoHGdX5dN9/5JC7AH1NpRu5f
   0OUVjXfju5rEthJwQERB6A1bPAAdfZPoGqOISg7H0j3LzMyr26TQ7EbrE
   wPlPyqrlz0H32u8chgZiOsT6u3fHClFHRX+WOPKDreHAKuI6shRmV5cFD
   xakC+7HpqQha07FDxATntRBJHV5RADlTXP/iNe0JAWM9ANZ0F6DR/2pmI
   w==;
X-CSE-ConnectionGUID: kY9WEELFT3K4KNo01DJwwg==
X-CSE-MsgGUID: MGGgKTzhRFmhnxqcvNyYMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17835471"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17835471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 11:09:38 -0700
X-CSE-ConnectionGUID: okujvP/TSS62zvS+DAfQ7A==
X-CSE-MsgGUID: mNe+ooAqQP+EjhHeDebHMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48717372"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2024 11:09:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRyEY-000Zbm-1z;
	Thu, 11 Jul 2024 18:09:34 +0000
Date: Fri, 12 Jul 2024 02:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2431/10661]
 drivers/char/virtio_console.c:1460:63: warning: '%u' directive output may be
 truncated writing between 1 and 10 bytes into a region of size between 0 and
 9
Message-ID: <202407120236.foVeyRg9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   15f539c4a521c5ae892554d0046e24f050ec0e00
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2431/10661] make OPTIMIZE_INLINING config editable
config: arm64-randconfig-003-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120236.foVeyRg9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120236.foVeyRg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120236.foVeyRg9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/virtio_console.c: In function 'add_port.isra':
>> drivers/char/virtio_console.c:1460:63: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
    1460 |         snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
         |                                                               ^~
   drivers/char/virtio_console.c:1460:54: note: directive argument in the range [0, 4294967294]
    1460 |         snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
         |                                                      ^~~~~~~~~~~~
   drivers/char/virtio_console.c:1460:9: note: 'snprintf' output between 9 and 27 bytes into a destination of size 16
    1460 |         snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1461 |                  port->portdev->vdev->index, id);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1460 drivers/char/virtio_console.c

3eae0adea949d8 Amit Shah          2010-09-02  1354  
c446f8fcc9fba3 Amit Shah          2010-05-19  1355  static int add_port(struct ports_device *portdev, u32 id)
c446f8fcc9fba3 Amit Shah          2010-05-19  1356  {
c446f8fcc9fba3 Amit Shah          2010-05-19  1357  	char debugfs_name[16];
c446f8fcc9fba3 Amit Shah          2010-05-19  1358  	struct port *port;
c446f8fcc9fba3 Amit Shah          2010-05-19  1359  	dev_t devt;
c446f8fcc9fba3 Amit Shah          2010-05-19  1360  	int err;
c446f8fcc9fba3 Amit Shah          2010-05-19  1361  
c446f8fcc9fba3 Amit Shah          2010-05-19  1362  	port = kmalloc(sizeof(*port), GFP_KERNEL);
c446f8fcc9fba3 Amit Shah          2010-05-19  1363  	if (!port) {
c446f8fcc9fba3 Amit Shah          2010-05-19  1364  		err = -ENOMEM;
c446f8fcc9fba3 Amit Shah          2010-05-19  1365  		goto fail;
c446f8fcc9fba3 Amit Shah          2010-05-19  1366  	}
b353a6b8216270 Amit Shah          2010-09-02  1367  	kref_init(&port->kref);
c446f8fcc9fba3 Amit Shah          2010-05-19  1368  
c446f8fcc9fba3 Amit Shah          2010-05-19  1369  	port->portdev = portdev;
c446f8fcc9fba3 Amit Shah          2010-05-19  1370  	port->id = id;
c446f8fcc9fba3 Amit Shah          2010-05-19  1371  
c446f8fcc9fba3 Amit Shah          2010-05-19  1372  	port->name = NULL;
c446f8fcc9fba3 Amit Shah          2010-05-19  1373  	port->inbuf = NULL;
c446f8fcc9fba3 Amit Shah          2010-05-19  1374  	port->cons.hvc = NULL;
3eae0adea949d8 Amit Shah          2010-09-02  1375  	port->async_queue = NULL;
c446f8fcc9fba3 Amit Shah          2010-05-19  1376  
9778829cffd4d8 Amit Shah          2010-05-06  1377  	port->cons.ws.ws_row = port->cons.ws.ws_col = 0;
4b0a2c5ff72152 Pankaj Gupta       2019-03-19  1378  	port->cons.vtermno = 0;
9778829cffd4d8 Amit Shah          2010-05-06  1379  
c446f8fcc9fba3 Amit Shah          2010-05-19  1380  	port->host_connected = port->guest_connected = false;
17e5b4f20adbe2 Amit Shah          2011-09-14  1381  	port->stats = (struct port_stats) { 0 };
c446f8fcc9fba3 Amit Shah          2010-05-19  1382  
cdfadfc1adb87f Amit Shah          2010-05-19  1383  	port->outvq_full = false;
cdfadfc1adb87f Amit Shah          2010-05-19  1384  
c446f8fcc9fba3 Amit Shah          2010-05-19  1385  	port->in_vq = portdev->in_vqs[port->id];
c446f8fcc9fba3 Amit Shah          2010-05-19  1386  	port->out_vq = portdev->out_vqs[port->id];
c446f8fcc9fba3 Amit Shah          2010-05-19  1387  
d22a69892bd8f2 Amit Shah          2010-09-02  1388  	port->cdev = cdev_alloc();
d22a69892bd8f2 Amit Shah          2010-09-02  1389  	if (!port->cdev) {
d22a69892bd8f2 Amit Shah          2010-09-02  1390  		dev_err(&port->portdev->vdev->dev, "Error allocating cdev\n");
d22a69892bd8f2 Amit Shah          2010-09-02  1391  		err = -ENOMEM;
d22a69892bd8f2 Amit Shah          2010-09-02  1392  		goto free_port;
d22a69892bd8f2 Amit Shah          2010-09-02  1393  	}
d22a69892bd8f2 Amit Shah          2010-09-02  1394  	port->cdev->ops = &port_fops;
c446f8fcc9fba3 Amit Shah          2010-05-19  1395  
c446f8fcc9fba3 Amit Shah          2010-05-19  1396  	devt = MKDEV(portdev->chr_major, id);
d22a69892bd8f2 Amit Shah          2010-09-02  1397  	err = cdev_add(port->cdev, devt, 1);
c446f8fcc9fba3 Amit Shah          2010-05-19  1398  	if (err < 0) {
c446f8fcc9fba3 Amit Shah          2010-05-19  1399  		dev_err(&port->portdev->vdev->dev,
c446f8fcc9fba3 Amit Shah          2010-05-19  1400  			"Error %d adding cdev for port %u\n", err, id);
d22a69892bd8f2 Amit Shah          2010-09-02  1401  		goto free_cdev;
c446f8fcc9fba3 Amit Shah          2010-05-19  1402  	}
11680fdf29cec5 Ivan Orlov         2023-06-20  1403  	port->dev = device_create(&port_class, &port->portdev->vdev->dev,
c446f8fcc9fba3 Amit Shah          2010-05-19  1404  				  devt, port, "vport%up%u",
dc18f0800f5f16 Sjur Brændeland    2013-02-12  1405  				  port->portdev->vdev->index, id);
c446f8fcc9fba3 Amit Shah          2010-05-19  1406  	if (IS_ERR(port->dev)) {
c446f8fcc9fba3 Amit Shah          2010-05-19  1407  		err = PTR_ERR(port->dev);
c446f8fcc9fba3 Amit Shah          2010-05-19  1408  		dev_err(&port->portdev->vdev->dev,
c446f8fcc9fba3 Amit Shah          2010-05-19  1409  			"Error %d creating device for port %u\n",
c446f8fcc9fba3 Amit Shah          2010-05-19  1410  			err, id);
c446f8fcc9fba3 Amit Shah          2010-05-19  1411  		goto free_cdev;
c446f8fcc9fba3 Amit Shah          2010-05-19  1412  	}
c446f8fcc9fba3 Amit Shah          2010-05-19  1413  
c446f8fcc9fba3 Amit Shah          2010-05-19  1414  	spin_lock_init(&port->inbuf_lock);
cdfadfc1adb87f Amit Shah          2010-05-19  1415  	spin_lock_init(&port->outvq_lock);
c446f8fcc9fba3 Amit Shah          2010-05-19  1416  	init_waitqueue_head(&port->waitqueue);
c446f8fcc9fba3 Amit Shah          2010-05-19  1417  
d791cfcbf98191 Laurent Vivier     2019-11-14  1418  	/* We can safely ignore ENOSPC because it means
d791cfcbf98191 Laurent Vivier     2019-11-14  1419  	 * the queue already has buffers. Buffers are removed
d791cfcbf98191 Laurent Vivier     2019-11-14  1420  	 * only by virtcons_remove(), not by unplug_port()
d791cfcbf98191 Laurent Vivier     2019-11-14  1421  	 */
d791cfcbf98191 Laurent Vivier     2019-11-14  1422  	err = fill_queue(port->in_vq, &port->inbuf_lock);
d791cfcbf98191 Laurent Vivier     2019-11-14  1423  	if (err < 0 && err != -ENOSPC) {
c446f8fcc9fba3 Amit Shah          2010-05-19  1424  		dev_err(port->dev, "Error allocating inbufs\n");
c446f8fcc9fba3 Amit Shah          2010-05-19  1425  		goto free_device;
c446f8fcc9fba3 Amit Shah          2010-05-19  1426  	}
c446f8fcc9fba3 Amit Shah          2010-05-19  1427  
1b6370463e88b0 Sjur Brændeland    2012-12-14  1428  	if (is_rproc_serial(port->portdev->vdev))
c446f8fcc9fba3 Amit Shah          2010-05-19  1429  		/*
1b6370463e88b0 Sjur Brændeland    2012-12-14  1430  		 * For rproc_serial assume remote processor is connected.
1b6370463e88b0 Sjur Brændeland    2012-12-14  1431  		 * rproc_serial does not want the console port, only
1b6370463e88b0 Sjur Brændeland    2012-12-14  1432  		 * the generic port implementation.
1b6370463e88b0 Sjur Brændeland    2012-12-14  1433  		 */
aabd6a8fa5a933 Sjur BrÃ¦ndeland   2013-03-18  1434  		port->host_connected = true;
1b6370463e88b0 Sjur Brændeland    2012-12-14  1435  	else if (!use_multiport(port->portdev)) {
c446f8fcc9fba3 Amit Shah          2010-05-19  1436  		/*
1b6370463e88b0 Sjur Brændeland    2012-12-14  1437  		 * If we're not using multiport support,
1b6370463e88b0 Sjur Brændeland    2012-12-14  1438  		 * this has to be a console port.
c446f8fcc9fba3 Amit Shah          2010-05-19  1439  		 */
c446f8fcc9fba3 Amit Shah          2010-05-19  1440  		err = init_port_console(port);
c446f8fcc9fba3 Amit Shah          2010-05-19  1441  		if (err)
c446f8fcc9fba3 Amit Shah          2010-05-19  1442  			goto free_inbufs;
c446f8fcc9fba3 Amit Shah          2010-05-19  1443  	}
c446f8fcc9fba3 Amit Shah          2010-05-19  1444  
c446f8fcc9fba3 Amit Shah          2010-05-19  1445  	spin_lock_irq(&portdev->ports_lock);
c446f8fcc9fba3 Amit Shah          2010-05-19  1446  	list_add_tail(&port->list, &port->portdev->ports);
c446f8fcc9fba3 Amit Shah          2010-05-19  1447  	spin_unlock_irq(&portdev->ports_lock);
c446f8fcc9fba3 Amit Shah          2010-05-19  1448  
c446f8fcc9fba3 Amit Shah          2010-05-19  1449  	/*
c446f8fcc9fba3 Amit Shah          2010-05-19  1450  	 * Tell the Host we're set so that it can send us various
c446f8fcc9fba3 Amit Shah          2010-05-19  1451  	 * configuration parameters for this port (eg, port name,
c446f8fcc9fba3 Amit Shah          2010-05-19  1452  	 * caching, whether this is a console port, etc.)
c446f8fcc9fba3 Amit Shah          2010-05-19  1453  	 */
c446f8fcc9fba3 Amit Shah          2010-05-19  1454  	send_control_msg(port, VIRTIO_CONSOLE_PORT_READY, 1);
c446f8fcc9fba3 Amit Shah          2010-05-19  1455  
c446f8fcc9fba3 Amit Shah          2010-05-19  1456  	/*
c446f8fcc9fba3 Amit Shah          2010-05-19  1457  	 * Finally, create the debugfs file that we can use to
c446f8fcc9fba3 Amit Shah          2010-05-19  1458  	 * inspect a port's state at any time
c446f8fcc9fba3 Amit Shah          2010-05-19  1459  	 */
db1700685c0ad2 Dan Carpenter      2015-05-08 @1460  	snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
dc18f0800f5f16 Sjur Brændeland    2013-02-12  1461  		 port->portdev->vdev->index, id);
c446f8fcc9fba3 Amit Shah          2010-05-19  1462  	port->debugfs_file = debugfs_create_file(debugfs_name, 0444,
c446f8fcc9fba3 Amit Shah          2010-05-19  1463  						 pdrvdata.debugfs_dir,
fb11de92ac6e4a Greg Kroah-Hartman 2021-02-16  1464  						 port, &port_debugfs_fops);
c446f8fcc9fba3 Amit Shah          2010-05-19  1465  	return 0;
c446f8fcc9fba3 Amit Shah          2010-05-19  1466  
c446f8fcc9fba3 Amit Shah          2010-05-19  1467  free_inbufs:
c446f8fcc9fba3 Amit Shah          2010-05-19  1468  free_device:
11680fdf29cec5 Ivan Orlov         2023-06-20  1469  	device_destroy(&port_class, port->dev->devt);
c446f8fcc9fba3 Amit Shah          2010-05-19  1470  free_cdev:
d22a69892bd8f2 Amit Shah          2010-09-02  1471  	cdev_del(port->cdev);
c446f8fcc9fba3 Amit Shah          2010-05-19  1472  free_port:
c446f8fcc9fba3 Amit Shah          2010-05-19  1473  	kfree(port);
c446f8fcc9fba3 Amit Shah          2010-05-19  1474  fail:
c446f8fcc9fba3 Amit Shah          2010-05-19  1475  	/* The host might want to notify management sw about port add failure */
0643e4c6e4fd67 Julia Lawall       2010-05-15  1476  	__send_control_msg(portdev, id, VIRTIO_CONSOLE_PORT_READY, 0);
c446f8fcc9fba3 Amit Shah          2010-05-19  1477  	return err;
c446f8fcc9fba3 Amit Shah          2010-05-19  1478  }
c446f8fcc9fba3 Amit Shah          2010-05-19  1479  

:::::: The code at line 1460 was first introduced by commit
:::::: db1700685c0ad2ecb9e42af6a568435a03bbc3fd virtio_console: silence a static checker warning

:::::: TO: Dan Carpenter <dan.carpenter@oracle.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
