Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D939844
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaJ8qBgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697668713; x=1729204713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfwLp6f5MP6u116zuCLs8spdeGVUnCgOWxIuKuxigEk=;
  b=JaJ8qBgYa1Fa7uLZPm2vhbmvpAC22U+rijbsV3odkcHjHgXxp1vIPjJI
   cam7coVhjUVW7/XgD0QF6+DiJQsLFyv69v5sa+lRWpDcA/+GPgoVLIum/
   RdeKhg5G60WcbEOnqtzWdDg2EjbvwsL3dU333DFAnaEmeAU7dh2GT1m88
   RSDdXdxHENB18+r3v8y1ym1aShHFX6958TEn4xxAXhzcdXgHRaMhgfyVo
   804dqWdLRh4/WHH7COogmGz59cf5IxSfOjCXdWJHUqvF9LRIdTbllruVt
   TOJs6kj+LRlKz3TGmVexKeuLZgH0NvZq6+y+V/ZvgnCWU+jqlwY3nfBuV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4723675"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4723675"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 15:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930368956"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="930368956"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Oct 2023 15:38:30 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtFBM-0001BI-2U;
	Wed, 18 Oct 2023 22:38:28 +0000
Date: Thu, 19 Oct 2023 06:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:extron 183/183]
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1540:49:
 warning: '*15LCEC' directive output may be truncated writing 7 bytes into a
 region of size between 4 and 13
Message-ID: <202310190654.eUxisZRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git extron
head:   7aeed1084a569d544f6ece3814376ad01d8e91d0
commit: 7aeed1084a569d544f6ece3814376ad01d8e91d0 [183/183] cec/extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190654.eUxisZRP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190654.eUxisZRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190654.eUxisZRP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_setup':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1540:49: warning: '*15LCEC' directive output may be truncated writing 7 bytes into a region of size between 4 and 13 [-Wformat-truncation=]
    1540 |                 snprintf(cmd, sizeof(cmd), "WO%u*15LCEC", p + 1);
         |                                                 ^~~~~~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1540:17: note: 'snprintf' output between 11 and 20 bytes into a destination of size 16
    1540 |                 snprintf(cmd, sizeof(cmd), "WO%u*15LCEC", p + 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1541:54: warning: '*15' directive output may be truncated writing 3 bytes into a region of size between 1 and 10 [-Wformat-truncation=]
    1541 |                 snprintf(resp, sizeof(resp), "LcecO%u*15", p + 1);
         |                                                      ^~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1541:17: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
    1541 |                 snprintf(resp, sizeof(resp), "LcecO%u*15", p + 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1540 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

  1372	
  1373	static int extron_setup(struct extron *extron)
  1374	{
  1375		struct serio *serio = extron->serio;
  1376		struct extron_port *port;
  1377		u8 *data = extron->data;
  1378		unsigned int p;
  1379		unsigned int major, minor;
  1380		int err;
  1381	
  1382		/* Obtain unit part number */
  1383		err = extron_send_and_wait(extron, NULL, "N", "Pno");
  1384		if (err)
  1385			return err;
  1386		dev_info(extron->dev, "Unit part number: %s\n", data + 3);
  1387		if (strcmp(data + 3, "60-1607-01") &&
  1388		    strcmp(data + 3, "60-1608-01") &&
  1389		    strcmp(data + 3, "60-1609-01")) {
  1390			dev_err(extron->dev, "Unsupported model\n");
  1391			return -ENODEV;
  1392		}
  1393		/* Up to 6 output ports and one input port */
  1394		extron->num_out_ports = 2 * (data[9] - '6');
  1395		extron->splitter.num_out_ports = extron->num_out_ports;
  1396		extron->splitter.ports = extron->splitter_ports;
  1397		extron->splitter.dev = extron->dev;
  1398		extron->num_in_ports = 1;
  1399		extron->num_ports = extron->num_out_ports + extron->num_in_ports;
  1400		dev_info(extron->dev, "Unit output ports: %d\n", extron->num_out_ports);
  1401		dev_info(extron->dev, "Unit input ports: %d\n", extron->num_in_ports);
  1402	
  1403		err = extron_send_and_wait(extron, NULL, "W CN", "Ipn ");
  1404		if (err)
  1405			return err;
  1406		dev_info(extron->dev, "Unit name: %s\n", data + 4);
  1407		strscpy(extron->unit_name, data + 4, sizeof(extron->unit_name));
  1408	
  1409		err = extron_send_and_wait(extron, NULL, "*Q", "Bld");
  1410		if (err)
  1411			return err;
  1412		dev_info(extron->dev, "Unit FW Version: %s\n", data + 3);
  1413		strscpy(extron->unit_fw_version, data + 3,
  1414			sizeof(extron->unit_fw_version));
  1415		if (sscanf(data + 3, "%u.%u.", &major, &minor) < 2 ||
  1416		    major < 1 || minor < 2) {
  1417			dev_err(extron->dev,
  1418				"Unsupported FW version (only 1.02 or up is supported)\n");
  1419			return -ENODEV;
  1420		}
  1421	
  1422		err = extron_send_and_wait(extron, NULL, "2i", "Inf02*");
  1423		if (err)
  1424			return err;
  1425		dev_info(extron->dev, "Unit Type: %s\n", data + 6);
  1426		strscpy(extron->unit_type, data + 6, sizeof(extron->unit_type));
  1427	
  1428		err = extron_send_and_wait(extron, NULL, "39Q", "Ver39*");
  1429		if (err)
  1430			return err;
  1431		dev_info(extron->dev, "CEC Engine Version: %s\n", data + 6);
  1432		strscpy(extron->unit_cec_engine_version, data + 6,
  1433			sizeof(extron->unit_cec_engine_version));
  1434	
  1435		/* Disable CEC */
  1436		err = extron_send_and_wait(extron, NULL, "WI1*0CCEC", "CcecI1*");
  1437		if (err)
  1438			return err;
  1439		err = extron_send_and_wait(extron, NULL, "WO0*CCEC", "CcecO0");
  1440		if (err)
  1441			return err;
  1442	
  1443		extron->hpd_never_low = hpd_never_low;
  1444	
  1445		/* Pull input port HPD low if all output ports also have a low HPD */
  1446		if (hpd_never_low) {
  1447			dev_info(extron->dev, "Always keep input HPD high\n");
  1448		} else {
  1449			dev_info(extron->dev, "Pull input HPD low if all output HPDs are low\n");
  1450			extron_send_and_wait(extron, NULL, "W1ihpd", "Ihpd1");
  1451		}
  1452	
  1453		for (p = 0; p < extron->num_ports; p++) {
  1454			u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL;
  1455	
  1456			if (vendor_id)
  1457				caps &= ~CEC_CAP_LOG_ADDRS;
  1458			port = kzalloc(sizeof(*port), GFP_KERNEL);
  1459			if (!port) {
  1460				err = -ENOMEM;
  1461				goto free_ports;
  1462			}
  1463			INIT_WORK(&port->irq_work, extron_irq_work_handler);
  1464			spin_lock_init(&port->msg_lock);
  1465			port->extron = extron;
  1466			port->is_input = p >= extron->num_out_ports;
  1467			port->direction = port->is_input ? 'I' : 'O';
  1468			port->port.port = 1 + (port->is_input ? p - extron->num_out_ports : p);
  1469			port->port.splitter = &extron->splitter;
  1470			port->phys_addr = CEC_PHYS_ADDR_INVALID;
  1471			snprintf(port->name, sizeof(port->name), "%s-%s-%u",
  1472				 dev_name(&serio->dev), port->is_input ? "in" : "out",
  1473				 port->port.port);
  1474	
  1475			port->dev = extron->dev;
  1476			port->adap = cec_allocate_adapter(&extron_cec_adap_ops, port,
  1477							  port->name, caps, 1);
  1478	
  1479			port->adap->xfer_timeout_ms = EXTRON_TIMEOUT_SECS * 1000;
  1480			port->port.adap = port->adap;
  1481			mutex_init(&port->video_lock);
  1482			port->vdev = extron_videodev;
  1483			port->vdev.lock = &port->video_lock;
  1484			port->vdev.v4l2_dev = &extron->v4l2_dev;
  1485			port->vdev.ctrl_handler = &port->hdl;
  1486			port->vdev.device_caps = V4L2_CAP_EDID;
  1487			video_set_drvdata(&port->vdev, port);
  1488	
  1489			v4l2_ctrl_handler_init(&port->hdl, 2);
  1490	
  1491			if (port->is_input) {
  1492				port->vdev.vfl_dir = VFL_DIR_RX;
  1493				port->ctrl_rx_power_present =
  1494					v4l2_ctrl_new_std(&port->hdl, NULL,
  1495							  V4L2_CID_DV_RX_POWER_PRESENT,
  1496							  0, 1, 0, 0);
  1497				port->has_edid = true;
  1498			} else {
  1499				port->vdev.vfl_dir = VFL_DIR_TX;
  1500				port->ctrl_tx_hotplug =
  1501					v4l2_ctrl_new_std(&port->hdl, NULL,
  1502							  V4L2_CID_DV_TX_HOTPLUG,
  1503							  0, 1, 0, 0);
  1504				port->ctrl_tx_edid_present =
  1505					v4l2_ctrl_new_std(&port->hdl, NULL,
  1506							  V4L2_CID_DV_TX_EDID_PRESENT,
  1507							  0, 1, 0, 0);
  1508			}
  1509	
  1510			extron->ports[p] = port;
  1511			extron->splitter_ports[p] = &port->port;
  1512			err = PTR_ERR_OR_ZERO(port->adap);
  1513			if (err < 0)
  1514				goto free_ports;
  1515			err = port->hdl.error;
  1516			if (err < 0)
  1517				goto free_ports;
  1518			if (port->is_input && manufacturer_name[0])
  1519				extron_write_edid(port, hdmi_edid, 2);
  1520		}
  1521	
  1522		/* Enable CEC (manual mode, i.e. controlled by the driver) */
  1523		err = extron_send_and_wait(extron, NULL, "WI1*20CCEC", "CcecI1*");
  1524		if (err)
  1525			goto free_ports;
  1526	
  1527		err = extron_send_and_wait(extron, NULL, "WO20*CCEC", "CcecO20");
  1528		if (err)
  1529			goto free_ports;
  1530	
  1531		/* Set logical addresses to 15 */
  1532		err = extron_send_and_wait(extron, NULL, "WI1*15LCEC", "LcecI1*15");
  1533		if (err)
  1534			goto free_ports;
  1535	
  1536		for (p = 0; p < extron->num_out_ports; p++) {
  1537			char cmd[16];
  1538			char resp[16];
  1539	
> 1540			snprintf(cmd, sizeof(cmd), "WO%u*15LCEC", p + 1);
> 1541			snprintf(resp, sizeof(resp), "LcecO%u*15", p + 1);
  1542			err = extron_send_and_wait(extron, extron->ports[p], cmd, resp);
  1543			if (err)
  1544				goto free_ports;
  1545		}
  1546	
  1547		/*
  1548		 * The Extron is now ready for operation. Specifically it is now
  1549		 * possible to retrieve EDIDs.
  1550		 */
  1551		extron->is_ready = true;
  1552	
  1553		/* Query HDCP and Signal states, used to update the initial state */
  1554		err = extron_send_and_wait(extron, NULL, "WHDCP", "Hdcp");
  1555		if (err)
  1556			goto free_ports;
  1557	
  1558		err = extron_send_and_wait(extron, NULL, "WLS", "Sig");
  1559		if (err)
  1560			goto free_ports;
  1561	
  1562		return 0;
  1563	
  1564	free_ports:
  1565		while (p--) {
  1566			struct extron_port *port = extron->ports[p];
  1567	
  1568			if (!port)
  1569				continue;
  1570			port->disconnected = true;
  1571			cancel_work_sync(&port->irq_work);
  1572			cec_delete_adapter(port->adap);
  1573			v4l2_ctrl_handler_free(&port->hdl);
  1574			mutex_destroy(&port->video_lock);
  1575			extron->ports[p] = NULL;
  1576			kfree(port);
  1577		}
  1578		extron->num_ports = 0;
  1579		extron->num_in_ports = 0;
  1580		extron->num_out_ports = 0;
  1581		return err;
  1582	}
  1583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
