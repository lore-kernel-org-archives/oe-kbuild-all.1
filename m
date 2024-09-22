Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0336C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726987065; cv=none; b=UrYwpzi75kAVQ8L0GmrcN7OMcjRpHATHt1+LSk+XrWxUawCBt33jTyzplANTTlLLectj0iJf7GVg8v5FVg1Q7ygzRWNKnSGfAOV5/KpsAY9TYNJHcwN5JzehF26uvG+RyQH1xCiqLcN5quthFBa4I60cVMFgvByOjB3DkRCgdHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726987065; c=relaxed/simple;
	bh=u2mxqdfXEsdVO4GTcmUBXXvyY9ZRGnVK9OodGdMOc/k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLC/zfvCzwXM5DW6LBfcYScMHiSsM02kTZ0TU32g5GQqSJ2hY2PzI9s/sNScR9HHc+U/8xBDJTCNw6iKzqCgM0j/6GO7umlUihFpissyrnZgvrAR/FxU6IKaHwOFViEkx5Lb/EHtRM7I8wTAu6rtWCA7KYSSofFtE+Xh09RNuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFPoliot; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFPoliot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726987063; x=1758523063;
  h=date:from:cc:subject:message-id:mime-version;
  bh=u2mxqdfXEsdVO4GTcmUBXXvyY9ZRGnVK9OodGdMOc/k=;
  b=UFPoliotbyPav2QU3vphp1j4fVDjV/CaAH7ycweA1lvFF2J0rl1DZ1nG
   Rn4YqxJVpjQ8dT3MLTflysxv1NfRZwvh4/7iFpsoAVbAlsJ9qoKshkIxv
   NLwwgOKgP7ek/ZBBD9t4KWJz58TCLDqAfC72GIhbiqJYFKHne7owqa4AN
   AvvJ99Bd6/dkAIDGY9UhfVfEq9NcFuFKvHAk5Af1WZS3PzPfUhAcAUU7E
   zK3kSKh817GHwEwc4Ye+EOkNm26Iulke/6qwsx+W7N37yAIEXV5uoo7Yg
   LdUf8XA8QxK40VUb0FCzQ3dROSqKtYIffNwh+vJUd4VJKBM5UUZLqqV5L
   Q==;
X-CSE-ConnectionGUID: eceR7EEYQDy5tzarDb1wow==
X-CSE-MsgGUID: Bm57tZc7SQeUiLJJ3XaibQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36533822"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36533822"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 23:37:43 -0700
X-CSE-ConnectionGUID: EtVyxDe6QhaAcOy+f9ZKdQ==
X-CSE-MsgGUID: EIyVFrMmRfOfKGYydv1WWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="94070856"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2024 23:37:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssGDy-000G5i-3B;
	Sun, 22 Sep 2024 06:37:38 +0000
Date: Sun, 22 Sep 2024 14:36:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 17/22]
 drivers/tty/serial/8250/8250_omap.c:1482:23: error: assignment to 'struct
 pinctrl *' from 'int' makes pointer from integer without a cast
Message-ID: <202409221412.NR9uvr8T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   c1c2f1971fbf6ddad93a8c94314fe8221e7aa6be
commit: 9a2c8fd78ca6eb30b1ea6aa3400d74871a51dca0 [17/22] serial: 8250: omap: Support wakeup pinctrl state
config: sh-randconfig-001-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221412.NR9uvr8T-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221412.NR9uvr8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221412.NR9uvr8T-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   drivers/tty/serial/8250/8250_omap.c: In function 'omap8250_sysoff_handler':
   drivers/tty/serial/8250/8250_omap.c:1251:15: error: implicit declaration of function 'pinctrl_select_state' [-Wimplicit-function-declaration]
    1251 |         ret = pinctrl_select_state(priv->pinctrl, priv->pinctrl_wakeup);
         |               ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_omap.c: In function 'omap8250_probe':
   drivers/tty/serial/8250/8250_omap.c:1482:25: error: implicit declaration of function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'? [-Wimplicit-function-declaration]
    1482 |         priv->pinctrl = devm_pinctrl_get(&pdev->dev);
         |                         ^~~~~~~~~~~~~~~~
         |                         of_pinctrl_get
>> drivers/tty/serial/8250/8250_omap.c:1482:23: error: assignment to 'struct pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1482 |         priv->pinctrl = devm_pinctrl_get(&pdev->dev);
         |                       ^
   drivers/tty/serial/8250/8250_omap.c:1484:41: error: implicit declaration of function 'pinctrl_lookup_state' [-Wimplicit-function-declaration]
    1484 |                 priv->pinctrl_default = pinctrl_lookup_state(priv->pinctrl, "default");
         |                                         ^~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_omap.c:1484:39: error: assignment to 'struct pinctrl_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1484 |                 priv->pinctrl_default = pinctrl_lookup_state(priv->pinctrl, "default");
         |                                       ^
   drivers/tty/serial/8250/8250_omap.c:1485:38: error: assignment to 'struct pinctrl_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1485 |                 priv->pinctrl_wakeup = pinctrl_lookup_state(priv->pinctrl, "wakeup");
         |                                      ^


vim +1482 drivers/tty/serial/8250/8250_omap.c

  1299	
  1300	static int omap8250_probe(struct platform_device *pdev)
  1301	{
  1302		struct device_node *np = pdev->dev.of_node;
  1303		struct omap8250_priv *priv;
  1304		const struct omap8250_platdata *pdata;
  1305		struct uart_8250_port up;
  1306		struct resource *regs;
  1307		void __iomem *membase;
  1308		int irq, ret;
  1309	
  1310		irq = platform_get_irq(pdev, 0);
  1311		if (irq < 0)
  1312			return irq;
  1313	
  1314		regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  1315		if (!regs) {
  1316			dev_err(&pdev->dev, "missing registers\n");
  1317			return -EINVAL;
  1318		}
  1319	
  1320		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
  1321		if (!priv)
  1322			return -ENOMEM;
  1323	
  1324		membase = devm_ioremap(&pdev->dev, regs->start,
  1325					       resource_size(regs));
  1326		if (!membase)
  1327			return -ENODEV;
  1328	
  1329		memset(&up, 0, sizeof(up));
  1330		up.port.dev = &pdev->dev;
  1331		up.port.mapbase = regs->start;
  1332		up.port.membase = membase;
  1333		up.port.irq = irq;
  1334		/*
  1335		 * It claims to be 16C750 compatible however it is a little different.
  1336		 * It has EFR and has no FCR7_64byte bit. The AFE (which it claims to
  1337		 * have) is enabled via EFR instead of MCR. The type is set here 8250
  1338		 * just to get things going. UNKNOWN does not work for a few reasons and
  1339		 * we don't need our own type since we don't use 8250's set_termios()
  1340		 * or pm callback.
  1341		 */
  1342		up.port.type = PORT_8250;
  1343		up.port.iotype = UPIO_MEM;
  1344		up.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SOFT_FLOW |
  1345			UPF_HARD_FLOW;
  1346		up.port.private_data = priv;
  1347	
  1348		up.port.regshift = 2;
  1349		up.port.fifosize = 64;
  1350		up.tx_loadsz = 64;
  1351		up.capabilities = UART_CAP_FIFO;
  1352	#ifdef CONFIG_PM
  1353		/*
  1354		 * Runtime PM is mostly transparent. However to do it right we need to a
  1355		 * TX empty interrupt before we can put the device to auto idle. So if
  1356		 * PM is not enabled we don't add that flag and can spare that one extra
  1357		 * interrupt in the TX path.
  1358		 */
  1359		up.capabilities |= UART_CAP_RPM;
  1360	#endif
  1361		up.port.set_termios = omap_8250_set_termios;
  1362		up.port.set_mctrl = omap8250_set_mctrl;
  1363		up.port.pm = omap_8250_pm;
  1364		up.port.startup = omap_8250_startup;
  1365		up.port.shutdown = omap_8250_shutdown;
  1366		up.port.throttle = omap_8250_throttle;
  1367		up.port.unthrottle = omap_8250_unthrottle;
  1368		up.port.rs485_config = serial8250_em485_config;
  1369		up.port.rs485_supported = serial8250_em485_supported;
  1370		up.rs485_start_tx = serial8250_em485_start_tx;
  1371		up.rs485_stop_tx = serial8250_em485_stop_tx;
  1372		up.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
  1373	
  1374		ret = of_alias_get_id(np, "serial");
  1375		if (ret < 0) {
  1376			dev_err(&pdev->dev, "failed to get alias\n");
  1377			return ret;
  1378		}
  1379		up.port.line = ret;
  1380	
  1381		if (of_property_read_u32(np, "clock-frequency", &up.port.uartclk)) {
  1382			struct clk *clk;
  1383	
  1384			clk = devm_clk_get(&pdev->dev, NULL);
  1385			if (IS_ERR(clk)) {
  1386				if (PTR_ERR(clk) == -EPROBE_DEFER)
  1387					return -EPROBE_DEFER;
  1388			} else {
  1389				up.port.uartclk = clk_get_rate(clk);
  1390			}
  1391		}
  1392	
  1393		if (of_property_read_u32(np, "overrun-throttle-ms",
  1394					 &up.overrun_backoff_time_ms) != 0)
  1395			up.overrun_backoff_time_ms = 0;
  1396	
  1397		priv->wakeirq = irq_of_parse_and_map(np, 1);
  1398	
  1399		pdata = of_device_get_match_data(&pdev->dev);
  1400		if (pdata)
  1401			priv->habit |= pdata->habit;
  1402	
  1403		if (!up.port.uartclk) {
  1404			up.port.uartclk = DEFAULT_CLK_SPEED;
  1405			dev_warn(&pdev->dev,
  1406				 "No clock speed specified: using default: %d\n",
  1407				 DEFAULT_CLK_SPEED);
  1408		}
  1409	
  1410		priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
  1411		priv->calc_latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
  1412		cpu_latency_qos_add_request(&priv->pm_qos_request, priv->latency);
  1413		INIT_WORK(&priv->qos_work, omap8250_uart_qos_work);
  1414	
  1415		spin_lock_init(&priv->rx_dma_lock);
  1416	
  1417		device_set_wakeup_capable(&pdev->dev, true);
  1418		pm_runtime_enable(&pdev->dev);
  1419		pm_runtime_use_autosuspend(&pdev->dev);
  1420	
  1421		/*
  1422		 * Disable runtime PM until autosuspend delay unless specifically
  1423		 * enabled by the user via sysfs. This is the historic way to
  1424		 * prevent an unsafe default policy with lossy characters on wake-up.
  1425		 * For serdev devices this is not needed, the policy can be managed by
  1426		 * the serdev driver.
  1427		 */
  1428		if (!of_get_available_child_count(pdev->dev.of_node))
  1429			pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
  1430	
  1431		pm_runtime_irq_safe(&pdev->dev);
  1432	
  1433		pm_runtime_get_sync(&pdev->dev);
  1434	
  1435		omap_serial_fill_features_erratas(&up, priv);
  1436		up.port.handle_irq = omap8250_no_handle_irq;
  1437		priv->rx_trigger = RX_TRIGGER;
  1438		priv->tx_trigger = TX_TRIGGER;
  1439	#ifdef CONFIG_SERIAL_8250_DMA
  1440		/*
  1441		 * Oh DMA support. If there are no DMA properties in the DT then
  1442		 * we will fall back to a generic DMA channel which does not
  1443		 * really work here. To ensure that we do not get a generic DMA
  1444		 * channel assigned, we have the the_no_dma_filter_fn() here.
  1445		 * To avoid "failed to request DMA" messages we check for DMA
  1446		 * properties in DT.
  1447		 */
  1448		ret = of_property_count_strings(np, "dma-names");
  1449		if (ret == 2) {
  1450			struct omap8250_dma_params *dma_params = NULL;
  1451	
  1452			up.dma = &priv->omap8250_dma;
  1453			up.dma->fn = the_no_dma_filter_fn;
  1454			up.dma->tx_dma = omap_8250_tx_dma;
  1455			up.dma->rx_dma = omap_8250_rx_dma;
  1456			if (pdata)
  1457				dma_params = pdata->dma_params;
  1458	
  1459			if (dma_params) {
  1460				up.dma->rx_size = dma_params->rx_size;
  1461				up.dma->rxconf.src_maxburst = dma_params->rx_trigger;
  1462				up.dma->txconf.dst_maxburst = dma_params->tx_trigger;
  1463				priv->rx_trigger = dma_params->rx_trigger;
  1464				priv->tx_trigger = dma_params->tx_trigger;
  1465			} else {
  1466				up.dma->rx_size = RX_TRIGGER;
  1467				up.dma->rxconf.src_maxburst = RX_TRIGGER;
  1468				up.dma->txconf.dst_maxburst = TX_TRIGGER;
  1469			}
  1470		}
  1471	#endif
  1472		ret = serial8250_register_8250_port(&up);
  1473		if (ret < 0) {
  1474			dev_err(&pdev->dev, "unable to register 8250 port\n");
  1475			goto err;
  1476		}
  1477		priv->line = ret;
  1478		platform_set_drvdata(pdev, priv);
  1479		pm_runtime_mark_last_busy(&pdev->dev);
  1480		pm_runtime_put_autosuspend(&pdev->dev);
  1481	
> 1482		priv->pinctrl = devm_pinctrl_get(&pdev->dev);
  1483		if (!IS_ERR_OR_NULL(priv->pinctrl)) {
> 1484			priv->pinctrl_default = pinctrl_lookup_state(priv->pinctrl, "default");
  1485			priv->pinctrl_wakeup = pinctrl_lookup_state(priv->pinctrl, "wakeup");
  1486		}
  1487	
  1488		devm_register_sys_off_handler(&pdev->dev,
  1489					      SYS_OFF_MODE_POWER_OFF_PREPARE,
  1490					      SYS_OFF_PRIO_DEFAULT,
  1491					      omap8250_sysoff_handler, NULL);
  1492	
  1493		return 0;
  1494	err:
  1495		pm_runtime_dont_use_autosuspend(&pdev->dev);
  1496		pm_runtime_put_sync(&pdev->dev);
  1497		flush_work(&priv->qos_work);
  1498		pm_runtime_disable(&pdev->dev);
  1499		cpu_latency_qos_remove_request(&priv->pm_qos_request);
  1500		return ret;
  1501	}
  1502	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
