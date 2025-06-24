Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A381876
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751150; cv=none; b=hrfuK6tcYcNIxI8mz6cV5/BkbJa0X1c+cYKWJofJLNHOldphztFFIPR/eiUMBlbVDTLGg8VXHXrrmF5aaez4QefNzqZ22CmBpkInyQhOF7W7KJBrNhhRtL93dzkLfFyR5zwEgsKXC8p2Zf/YwfiKkq6RiWTeKMAeh9FBTqQ5/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751150; c=relaxed/simple;
	bh=KNLWijiqaL5Zlu//9O5JeitZHv4wENSeGa4r54mQsuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lW2zqYEvGobKwuhqRIQBDCjo/yKJ+y/G6ekXJKKxNCieIPDYbfovQ1lrCFv3UFLPOmTDn3bpxoqR+yJu1LXZyKO6Y4/f0/pRH3HoRNMvuQsOdQVw/TkkGX0TXCF0lEd86eIuogBwDbfVUs6LHkCB6ARgwPif4pwxBgaTOXRJxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEms0xgc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEms0xgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750751148; x=1782287148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KNLWijiqaL5Zlu//9O5JeitZHv4wENSeGa4r54mQsuw=;
  b=AEms0xgcZneQkUegWupSnjnVvCWYwvfsrDzxaOYVNQsyb9aCTS7v1I1W
   Y64AnILzLowXypSamLecDN7gRGTyOFcbmp8KZshEj1uW6BfQrjHfz+EIC
   adswFp9rZDHsAOwWkJNUeX216oPW9ReGRF98SepXEJvAmh6hqbcik/uFW
   zUtdehE7LsoBX741Ki/Y/PWZAS4qgqM1pVnIklhDeT8zhF+6SRKgwHk3Q
   eATZ39h63OgVSvFUi5IwtXLdLMgXyHBNBCCckI7jczhOiLJ5Oyn88HA0H
   ug5fb6PrbvgAs4LLRHT7myqFc/QMSXEEpC92XNXx0XhOMGQeEq/UoxtZF
   g==;
X-CSE-ConnectionGUID: J+F+mq6BRkOYyipnUOlK0Q==
X-CSE-MsgGUID: h7MX4/6AR/Oae5OCrsSoJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52917135"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52917135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:45:48 -0700
X-CSE-ConnectionGUID: TantxQQLQ2efYqhsO0Y3tw==
X-CSE-MsgGUID: CjXGGa1+QnuUWpHGZNraLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151424423"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jun 2025 00:45:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTyLg-000Rsq-0x;
	Tue, 24 Jun 2025 07:45:44 +0000
Date: Tue, 24 Jun 2025 15:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 62/63]
 drivers/tty/serial/qcom_geni_serial.c:1754:7: error: 'struct uart_port' has
 no member named 'rs485_config'
Message-ID: <202506241550.xTYnxVtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   c646414b6e35ac5bc7ae2ddf4800e9cb03dacd36
commit: a7fac01096e4ac1600b6b4f96822854fa3859c62 [62/63] ops2
config: arm64-randconfig-002-20250624 (https://download.01.org/0day-ci/archive/20250624/202506241550.xTYnxVtH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241550.xTYnxVtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241550.xTYnxVtH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/qcom_geni_serial.c: In function 'qcom_geni_serial_probe':
>> drivers/tty/serial/qcom_geni_serial.c:1754:7: error: 'struct uart_port' has no member named 'rs485_config'
    1754 |  uport->rs485_config = qcom_geni_rs485_config;
         |       ^~


vim +1754 drivers/tty/serial/qcom_geni_serial.c

c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1701  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1702  static int qcom_geni_serial_probe(struct platform_device *pdev)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1703  {
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1704  	int ret = 0;
71581242164f11 Colin Ian King              2021-04-23  1705  	int line;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1706  	struct qcom_geni_serial_port *port;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1707  	struct uart_port *uport;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1708  	struct resource *res;
066cd1c4e4b9b4 Karthikeyan Ramasubramanian 2018-04-06  1709  	int irq;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1710  	struct uart_driver *drv;
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1711  	const struct qcom_geni_device_data *data;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1712  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1713  	data = of_device_get_match_data(&pdev->dev);
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1714  	if (!data)
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1715  		return -EINVAL;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1716  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1717  	if (data->console) {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1718  		drv = &qcom_geni_console_driver;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1719  		line = of_alias_get_id(pdev->dev.of_node, "serial");
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1720  	} else {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1721  		drv = &qcom_geni_uart_driver;
08b0adb1ae5456 Dmitry Baryshkov            2021-06-22  1722  		line = of_alias_get_id(pdev->dev.of_node, "serial");
08b0adb1ae5456 Dmitry Baryshkov            2021-06-22  1723  		if (line == -ENODEV) /* compat with non-standard aliases */
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1724  			line = of_alias_get_id(pdev->dev.of_node, "hsuart");
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1725  	}
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1726  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1727  	port = get_port_from_line(line, data->console);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1728  	if (IS_ERR(port)) {
6a10635e90e8cb Karthikeyan Ramasubramanian 2018-05-03  1729  		dev_err(&pdev->dev, "Invalid line %d\n", line);
6a10635e90e8cb Karthikeyan Ramasubramanian 2018-05-03  1730  		return PTR_ERR(port);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1731  	}
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1732  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1733  	uport = &port->uport;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1734  	/* Don't allow 2 drivers to access the same port */
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1735  	if (uport->private_data)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1736  		return -ENODEV;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1737  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1738  	uport->dev = &pdev->dev;
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1739  	port->dev_data = data;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1740  	port->se.dev = &pdev->dev;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1741  	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1742  	port->se.clk = devm_clk_get(&pdev->dev, "se");
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1743  	if (IS_ERR(port->se.clk)) {
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1744  		ret = PTR_ERR(port->se.clk);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1745  		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1746  		return ret;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1747  	}
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1748  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1749  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
7693b331d033ec Wei Yongjun                 2018-03-22  1750  	if (!res)
7693b331d033ec Wei Yongjun                 2018-03-22  1751  		return -EINVAL;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1752  	uport->mapbase = res->start;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1753  
4fcc287f3c6924 Anup Kulkarni               2025-06-03 @1754  	uport->rs485_config = qcom_geni_rs485_config;
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1755  	uport->rs485_supported = qcom_geni_rs485_supported;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1756  	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1757  	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1758  	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1759  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1760  	if (!data->console) {
2aaa43c7077833 Bartosz Golaszewski         2022-12-29  1761  		port->rx_buf = devm_kzalloc(uport->dev,
2aaa43c7077833 Bartosz Golaszewski         2022-12-29  1762  					    DMA_RX_BUF_SIZE, GFP_KERNEL);
2aaa43c7077833 Bartosz Golaszewski         2022-12-29  1763  		if (!port->rx_buf)
f9d690b6ece7ec satya priya                 2020-03-06  1764  			return -ENOMEM;
f9d690b6ece7ec satya priya                 2020-03-06  1765  	}
f9d690b6ece7ec satya priya                 2020-03-06  1766  
7cf563b2c84624 Akash Asthana               2020-06-23  1767  	ret = geni_icc_get(&port->se, NULL);
7cf563b2c84624 Akash Asthana               2020-06-23  1768  	if (ret)
7cf563b2c84624 Akash Asthana               2020-06-23  1769  		return ret;
7cf563b2c84624 Akash Asthana               2020-06-23  1770  	port->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
7cf563b2c84624 Akash Asthana               2020-06-23  1771  	port->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
7cf563b2c84624 Akash Asthana               2020-06-23  1772  
7cf563b2c84624 Akash Asthana               2020-06-23  1773  	/* Set BW for register access */
7cf563b2c84624 Akash Asthana               2020-06-23  1774  	ret = geni_icc_set_bw(&port->se);
7cf563b2c84624 Akash Asthana               2020-06-23  1775  	if (ret)
7cf563b2c84624 Akash Asthana               2020-06-23  1776  		return ret;
7cf563b2c84624 Akash Asthana               2020-06-23  1777  
f3974413cf0209 Akash Asthana               2020-01-06  1778  	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
f3974413cf0209 Akash Asthana               2020-01-06  1779  			"qcom_geni_serial_%s%d",
f3974413cf0209 Akash Asthana               2020-01-06  1780  			uart_console(uport) ? "console" : "uart", uport->line);
f3974413cf0209 Akash Asthana               2020-01-06  1781  	if (!port->name)
f3974413cf0209 Akash Asthana               2020-01-06  1782  		return -ENOMEM;
f3974413cf0209 Akash Asthana               2020-01-06  1783  
066cd1c4e4b9b4 Karthikeyan Ramasubramanian 2018-04-06  1784  	irq = platform_get_irq(pdev, 0);
1df217868178bd Stephen Boyd                2019-07-30  1785  	if (irq < 0)
066cd1c4e4b9b4 Karthikeyan Ramasubramanian 2018-04-06  1786  		return irq;
066cd1c4e4b9b4 Karthikeyan Ramasubramanian 2018-04-06  1787  	uport->irq = irq;
8f122698a64b87 Dmitry Safonov              2019-12-13  1788  	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1789  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1790  	if (!data->console)
f3974413cf0209 Akash Asthana               2020-01-06  1791  		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
f3974413cf0209 Akash Asthana               2020-01-06  1792  
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1793  	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1794  		port->rx_tx_swap = true;
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1795  
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1796  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1797  		port->cts_rts_swap = true;
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1798  
300894a6fef7f7 Yangtao Li                  2021-03-14  1799  	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
300894a6fef7f7 Yangtao Li                  2021-03-14  1800  	if (ret)
300894a6fef7f7 Yangtao Li                  2021-03-14  1801  		return ret;
a5819b548af0cc Rajendra Nayak              2020-06-15  1802  	/* OPP table is optional */
300894a6fef7f7 Yangtao Li                  2021-03-14  1803  	ret = devm_pm_opp_of_add_table(&pdev->dev);
c7ac46dac74445 Viresh Kumar                2020-08-28  1804  	if (ret && ret != -ENODEV) {
a5819b548af0cc Rajendra Nayak              2020-06-15  1805  		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
300894a6fef7f7 Yangtao Li                  2021-03-14  1806  		return ret;
a5819b548af0cc Rajendra Nayak              2020-06-15  1807  	}
a5819b548af0cc Rajendra Nayak              2020-06-15  1808  
e42d6c3ec0c7ad Douglas Anderson            2020-06-26  1809  	port->private_data.drv = drv;
e42d6c3ec0c7ad Douglas Anderson            2020-06-26  1810  	uport->private_data = &port->private_data;
f3974413cf0209 Akash Asthana               2020-01-06  1811  	platform_set_drvdata(pdev, port);
f3974413cf0209 Akash Asthana               2020-01-06  1812  
3e4aaea7a0391d Akash Asthana               2019-10-10  1813  	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
3e4aaea7a0391d Akash Asthana               2019-10-10  1814  	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
3e4aaea7a0391d Akash Asthana               2019-10-10  1815  			IRQF_TRIGGER_HIGH, port->name, uport);
3e4aaea7a0391d Akash Asthana               2019-10-10  1816  	if (ret) {
3e4aaea7a0391d Akash Asthana               2019-10-10  1817  		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
300894a6fef7f7 Yangtao Li                  2021-03-14  1818  		return ret;
3e4aaea7a0391d Akash Asthana               2019-10-10  1819  	}
3e4aaea7a0391d Akash Asthana               2019-10-10  1820  
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1821  	ret = uart_get_rs485_mode(uport);
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1822  	if (ret)
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1823  		return ret;
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1824  
5f949f140f7369 Krzysztof Kozlowski         2023-05-05  1825  	ret = uart_add_one_port(drv, uport);
5f949f140f7369 Krzysztof Kozlowski         2023-05-05  1826  	if (ret)
5f949f140f7369 Krzysztof Kozlowski         2023-05-05  1827  		return ret;
5f949f140f7369 Krzysztof Kozlowski         2023-05-05  1828  
f3974413cf0209 Akash Asthana               2020-01-06  1829  	if (port->wakeup_irq > 0) {
f3974413cf0209 Akash Asthana               2020-01-06  1830  		device_init_wakeup(&pdev->dev, true);
f3974413cf0209 Akash Asthana               2020-01-06  1831  		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
8b7103f3195044 Akash Asthana               2019-10-10  1832  						port->wakeup_irq);
8b7103f3195044 Akash Asthana               2019-10-10  1833  		if (ret) {
f3974413cf0209 Akash Asthana               2020-01-06  1834  			device_init_wakeup(&pdev->dev, false);
a53be6945f5123 Viken Dadhaniya             2025-03-27  1835  			ida_free(&port_ida, uport->line);
f3974413cf0209 Akash Asthana               2020-01-06  1836  			uart_remove_one_port(drv, uport);
300894a6fef7f7 Yangtao Li                  2021-03-14  1837  			return ret;
8b7103f3195044 Akash Asthana               2019-10-10  1838  		}
8b7103f3195044 Akash Asthana               2019-10-10  1839  	}
f3974413cf0209 Akash Asthana               2020-01-06  1840  
f3974413cf0209 Akash Asthana               2020-01-06  1841  	return 0;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1842  }
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1843  

:::::: The code at line 1754 was first introduced by commit
:::::: 4fcc287f3c692450ffd91c72a19c58740494491a serial: qcom-geni: Enable support for half-duplex mode

:::::: TO: Anup Kulkarni <quic_anupkulk@quicinc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
