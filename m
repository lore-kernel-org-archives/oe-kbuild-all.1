Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3C4D796A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353875; cv=none; b=pqJvdpy9GzyCUnrAyAbPRwRlk2Cfb2psgteckTWM13LiAsRqiXrvdGEcDpWLv2IkOmKegnA/CFt+r9FxYUqNZmsbin44wEFqYfehBR+FaJVzKMgoYntRTLxxZoouVTIsJDm2WJ6EwF/unhnoOlyI1lhK/gHGtr6KO6DDIdJEi54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353875; c=relaxed/simple;
	bh=Z36NgaDtUmEG1duKwA3s9PcpXlJ6Z/EDU8SSxdjfa+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EmVg9RKSiBQEaSCjjcodcODFnKhfaRvSNihxTnalbsCI10p0NLEqM69CJwhb/Ff6XlhCshSA7mIvg5q/Fs0RkdEyUNadl7eaGc5bB5kiUP2EhCXwI6jMcTPj110vdvHUL0ycT9UOvxUS9AbI35zbTyMm0+jr4nSC0cIwpqmhGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yko24SOe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yko24SOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790353873; x=1821889873;
  h=date:from:to:cc:subject:message-id;
  bh=Z36NgaDtUmEG1duKwA3s9PcpXlJ6Z/EDU8SSxdjfa+o=;
  b=Yko24SOeh9YWmSzj9+IeQa24UAq3j5cKK0Ftz7MpiNZ1cUHtmzKd8mkY
   oUWE5rrInlA2hYWZdPL697jWqS1uN6OaBCrSdGOTPCxKJuXYUDwtfbLsl
   KRNW8jbvXvAIfI5Q1Q959qq4SUFk0zoGwQjjookfM3NURz41qLpTX9W8N
   OUbtrd28BeqhBdWK2kVuP2GriSxe1ID04jyBNWJbuXg9BSfvUVwwfgSMg
   9nSbzstgtuEA5fd8FZrNAL4t6fu9kT4rsEU/BJ5vJR3EgVd7v0dXgTOCA
   t26r8TqULu/9ZCJPInF2fiZUq9nJSKCWUuwBT5sRsuo6rCl3BkFu/ya1y
   A==;
X-CSE-ConnectionGUID: pVrAzffdRP+WU7RBH78V9g==
X-CSE-MsgGUID: BQzKqCW6RnaEw1aIUyoBLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91244393"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="91244393"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:31:12 -0700
X-CSE-ConnectionGUID: vxy2+kCFRVu77BYKQSLM3w==
X-CSE-MsgGUID: vRwWbTnpQf6mnrTmDdVgLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="303884868"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 09:31:10 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA8pH-000000000p0-49au;
	Fri, 25 Sep 2026 16:31:08 +0000
Date: Fri, 25 Sep 2026 18:30:12 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 539/673]
 drivers/tty/serial/8250/8250_bcm7271.c:962:25: warning: variable 'mapbase'
 set but not used
Message-ID: <202609251835.uNILEwgc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: c859e8d1c0dd5308ff6e4ab5c280b589a191e1a4 [539/673] 8250: port settings
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609251835.uNILEwgc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251835.uNILEwgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251835.uNILEwgc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_bcm7271.c:27:
   drivers/tty/serial/8250/8250.h: In function 'serial8250_apply_quirks':
   drivers/tty/serial/8250/8250.h:226:36: error: 'skip_txen_test' undeclared (first use in this function)
     226 |                 up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
         |                                    ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250.h:226:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/tty/serial/8250/8250_bcm7271.c: In function 'brcmuart_probe':
>> drivers/tty/serial/8250/8250_bcm7271.c:962:25: warning: variable 'mapbase' set but not used [-Wunused-but-set-variable=]
     962 |         resource_size_t mapbase = 0;
         |                         ^~~~~~~
>> drivers/tty/serial/8250/8250_bcm7271.c:961:23: warning: variable 'membase' set but not used [-Wunused-but-set-variable=]
     961 |         void __iomem *membase = NULL;
         |                       ^~~~~~~


vim +/mapbase +962 drivers/tty/serial/8250/8250_bcm7271.c

41a469482de257 Al Cooper       2021-03-25   950  
41a469482de257 Al Cooper       2021-03-25   951  
41a469482de257 Al Cooper       2021-03-25   952  static int brcmuart_probe(struct platform_device *pdev)
41a469482de257 Al Cooper       2021-03-25   953  {
41a469482de257 Al Cooper       2021-03-25   954  	struct resource *regs;
41a469482de257 Al Cooper       2021-03-25   955  	const struct of_device_id *of_id = NULL;
41a469482de257 Al Cooper       2021-03-25   956  	struct uart_8250_port *new_port;
41a469482de257 Al Cooper       2021-03-25   957  	struct device *dev = &pdev->dev;
41a469482de257 Al Cooper       2021-03-25   958  	struct brcmuart_priv *priv;
41a469482de257 Al Cooper       2021-03-25   959  	struct clk *baud_mux_clk;
41a469482de257 Al Cooper       2021-03-25   960  	struct uart_8250_port up;
8a66b31a15966e Colin Ian King  2021-07-19  @961  	void __iomem *membase = NULL;
41a469482de257 Al Cooper       2021-03-25  @962  	resource_size_t mapbase = 0;
41a469482de257 Al Cooper       2021-03-25   963  	int ret;
41a469482de257 Al Cooper       2021-03-25   964  	int x;
41a469482de257 Al Cooper       2021-03-25   965  	int dma_irq;
41a469482de257 Al Cooper       2021-03-25   966  	static const char * const reg_names[REGS_MAX] = {
41a469482de257 Al Cooper       2021-03-25   967  		"uart", "dma_rx", "dma_tx", "dma_intr2", "dma_arb"
41a469482de257 Al Cooper       2021-03-25   968  	};
41a469482de257 Al Cooper       2021-03-25   969  
41a469482de257 Al Cooper       2021-03-25   970  	priv = devm_kzalloc(dev, sizeof(struct brcmuart_priv),
41a469482de257 Al Cooper       2021-03-25   971  			GFP_KERNEL);
41a469482de257 Al Cooper       2021-03-25   972  	if (!priv)
41a469482de257 Al Cooper       2021-03-25   973  		return -ENOMEM;
41a469482de257 Al Cooper       2021-03-25   974  
573d97545c2ec5 Andy Shevchenko 2024-03-04   975  	of_id = of_match_node(brcmuart_dt_ids, dev->of_node);
41a469482de257 Al Cooper       2021-03-25   976  	if (!of_id || !of_id->data)
41a469482de257 Al Cooper       2021-03-25   977  		priv->rate_table = brcmstb_rate_table;
41a469482de257 Al Cooper       2021-03-25   978  	else
41a469482de257 Al Cooper       2021-03-25   979  		priv->rate_table = of_id->data;
41a469482de257 Al Cooper       2021-03-25   980  
41a469482de257 Al Cooper       2021-03-25   981  	for (x = 0; x < REGS_MAX; x++) {
41a469482de257 Al Cooper       2021-03-25   982  		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
41a469482de257 Al Cooper       2021-03-25   983  						reg_names[x]);
41a469482de257 Al Cooper       2021-03-25   984  		if (!regs)
41a469482de257 Al Cooper       2021-03-25   985  			break;
41a469482de257 Al Cooper       2021-03-25   986  		priv->regs[x] =	devm_ioremap(dev, regs->start,
41a469482de257 Al Cooper       2021-03-25   987  					     resource_size(regs));
64b1510642f845 Wei Yongjun     2021-03-29   988  		if (!priv->regs[x])
64b1510642f845 Wei Yongjun     2021-03-29   989  			return -ENOMEM;
41a469482de257 Al Cooper       2021-03-25   990  		if (x == REGS_8250) {
41a469482de257 Al Cooper       2021-03-25   991  			mapbase = regs->start;
41a469482de257 Al Cooper       2021-03-25   992  			membase = priv->regs[x];
41a469482de257 Al Cooper       2021-03-25   993  		}
41a469482de257 Al Cooper       2021-03-25   994  	}
41a469482de257 Al Cooper       2021-03-25   995  
41a469482de257 Al Cooper       2021-03-25   996  	/* We should have just the uart base registers or all the registers */
c77247a52be235 Andy Shevchenko 2023-09-18   997  	if (x != 1 && x != REGS_MAX)
c77247a52be235 Andy Shevchenko 2023-09-18   998  		return dev_err_probe(dev, -EINVAL, "%s registers not specified\n",
c77247a52be235 Andy Shevchenko 2023-09-18   999  				     reg_names[x]);
41a469482de257 Al Cooper       2021-03-25  1000  
41a469482de257 Al Cooper       2021-03-25  1001  	/* if the DMA registers were specified, try to enable DMA */
41a469482de257 Al Cooper       2021-03-25  1002  	if (x > REGS_DMA_RX) {
41a469482de257 Al Cooper       2021-03-25  1003  		if (brcmuart_arbitration(priv, 1) == 0) {
41a469482de257 Al Cooper       2021-03-25  1004  			u32 txrev = 0;
41a469482de257 Al Cooper       2021-03-25  1005  			u32 rxrev = 0;
41a469482de257 Al Cooper       2021-03-25  1006  
41a469482de257 Al Cooper       2021-03-25  1007  			txrev = udma_readl(priv, REGS_DMA_RX, UDMA_RX_REVISION);
41a469482de257 Al Cooper       2021-03-25  1008  			rxrev = udma_readl(priv, REGS_DMA_TX, UDMA_TX_REVISION);
41a469482de257 Al Cooper       2021-03-25  1009  			if ((txrev >= UDMA_TX_REVISION_REQUIRED) &&
41a469482de257 Al Cooper       2021-03-25  1010  				(rxrev >= UDMA_RX_REVISION_REQUIRED)) {
41a469482de257 Al Cooper       2021-03-25  1011  
41a469482de257 Al Cooper       2021-03-25  1012  				/* Enable the use of the DMA hardware */
41a469482de257 Al Cooper       2021-03-25  1013  				priv->dma_enabled = true;
41a469482de257 Al Cooper       2021-03-25  1014  			} else {
41a469482de257 Al Cooper       2021-03-25  1015  				brcmuart_arbitration(priv, 0);
41a469482de257 Al Cooper       2021-03-25  1016  				dev_err(dev,
41a469482de257 Al Cooper       2021-03-25  1017  					"Unsupported DMA Hardware Revision\n");
41a469482de257 Al Cooper       2021-03-25  1018  			}
41a469482de257 Al Cooper       2021-03-25  1019  		} else {
41a469482de257 Al Cooper       2021-03-25  1020  			dev_err(dev,
41a469482de257 Al Cooper       2021-03-25  1021  				"Timeout arbitrating for UART DMA hardware\n");
41a469482de257 Al Cooper       2021-03-25  1022  		}
41a469482de257 Al Cooper       2021-03-25  1023  	}
41a469482de257 Al Cooper       2021-03-25  1024  
573d97545c2ec5 Andy Shevchenko 2024-03-04  1025  	dev_dbg(dev, "DMA is %senabled\n", priv->dma_enabled ? "" : "not ");
573d97545c2ec5 Andy Shevchenko 2024-03-04  1026  
573d97545c2ec5 Andy Shevchenko 2024-03-04  1027  	memset(&up, 0, sizeof(up));
573d97545c2ec5 Andy Shevchenko 2024-03-04  1028  
573d97545c2ec5 Andy Shevchenko 2024-03-04  1029  	ret = uart_read_port_properties(&up.port);
573d97545c2ec5 Andy Shevchenko 2024-03-04  1030  	if (ret)
573d97545c2ec5 Andy Shevchenko 2024-03-04  1031  		goto release_dma;
573d97545c2ec5 Andy Shevchenko 2024-03-04  1032  
41a469482de257 Al Cooper       2021-03-25  1033  
41a469482de257 Al Cooper       2021-03-25  1034  	/* See if a Baud clock has been specified */
1f34e3defb5c0a Andy Shevchenko 2023-10-05  1035  	baud_mux_clk = devm_clk_get_optional_enabled(dev, "sw_baud");
1f34e3defb5c0a Andy Shevchenko 2023-10-05  1036  	ret = PTR_ERR_OR_ZERO(baud_mux_clk);
41a469482de257 Al Cooper       2021-03-25  1037  	if (ret)
15ac1122fd6d4b Doug Berger     2023-03-09  1038  		goto release_dma;
1f34e3defb5c0a Andy Shevchenko 2023-10-05  1039  	if (baud_mux_clk) {
1f34e3defb5c0a Andy Shevchenko 2023-10-05  1040  		dev_dbg(dev, "BAUD MUX clock found\n");
1f34e3defb5c0a Andy Shevchenko 2023-10-05  1041  
41a469482de257 Al Cooper       2021-03-25  1042  		priv->baud_mux_clk = baud_mux_clk;
41a469482de257 Al Cooper       2021-03-25  1043  		init_real_clk_rates(dev, priv);
1f34e3defb5c0a Andy Shevchenko 2023-10-05  1044  	} else {
1f34e3defb5c0a Andy Shevchenko 2023-10-05  1045  		dev_dbg(dev, "BAUD MUX clock not specified\n");
41a469482de257 Al Cooper       2021-03-25  1046  	}
41a469482de257 Al Cooper       2021-03-25  1047  
41a469482de257 Al Cooper       2021-03-25  1048  	/* setup HR timer */
6bf9bb76b3af17 Nam Cao         2025-02-05  1049  	hrtimer_setup(&priv->hrt, brcmuart_hrtimer_func, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
41a469482de257 Al Cooper       2021-03-25  1050  
41a469482de257 Al Cooper       2021-03-25  1051  
41a469482de257 Al Cooper       2021-03-25  1052  	if (priv->dma_enabled) {
41a469482de257 Al Cooper       2021-03-25  1053  		priv->rx_size = RX_BUF_SIZE * RX_BUFS_COUNT;
41a469482de257 Al Cooper       2021-03-25  1054  		priv->rx_bufs = dma_alloc_coherent(dev,
41a469482de257 Al Cooper       2021-03-25  1055  						   priv->rx_size,
41a469482de257 Al Cooper       2021-03-25  1056  						   &priv->rx_addr, GFP_KERNEL);
c195438f1e84de Lad Prabhakar   2021-12-24  1057  		if (!priv->rx_bufs) {
0e479b460e342c Lad Prabhakar   2022-01-05  1058  			ret = -ENOMEM;
41a469482de257 Al Cooper       2021-03-25  1059  			goto err;
c195438f1e84de Lad Prabhakar   2021-12-24  1060  		}
41a469482de257 Al Cooper       2021-03-25  1061  		priv->tx_size = UART_XMIT_SIZE;
41a469482de257 Al Cooper       2021-03-25  1062  		priv->tx_buf = dma_alloc_coherent(dev,
41a469482de257 Al Cooper       2021-03-25  1063  						  priv->tx_size,
41a469482de257 Al Cooper       2021-03-25  1064  						  &priv->tx_addr, GFP_KERNEL);
c195438f1e84de Lad Prabhakar   2021-12-24  1065  		if (!priv->tx_buf) {
0e479b460e342c Lad Prabhakar   2022-01-05  1066  			ret = -ENOMEM;
41a469482de257 Al Cooper       2021-03-25  1067  			goto err;
41a469482de257 Al Cooper       2021-03-25  1068  		}
c195438f1e84de Lad Prabhakar   2021-12-24  1069  	}
41a469482de257 Al Cooper       2021-03-25  1070  
41a469482de257 Al Cooper       2021-03-25  1071  	ret = serial8250_register_8250_port(&up);
41a469482de257 Al Cooper       2021-03-25  1072  	if (ret < 0) {
c77247a52be235 Andy Shevchenko 2023-09-18  1073  		dev_err_probe(dev, ret, "unable to register 8250 port\n");
41a469482de257 Al Cooper       2021-03-25  1074  		goto err;
41a469482de257 Al Cooper       2021-03-25  1075  	}
41a469482de257 Al Cooper       2021-03-25  1076  	priv->line = ret;
41a469482de257 Al Cooper       2021-03-25  1077  	new_port = serial8250_get_port(ret);
41a469482de257 Al Cooper       2021-03-25  1078  	priv->up = &new_port->port;
41a469482de257 Al Cooper       2021-03-25  1079  	if (priv->dma_enabled) {
41a469482de257 Al Cooper       2021-03-25  1080  		dma_irq = platform_get_irq_byname(pdev,  "dma");
41a469482de257 Al Cooper       2021-03-25  1081  		if (dma_irq < 0) {
c77247a52be235 Andy Shevchenko 2023-09-18  1082  			ret = dev_err_probe(dev, dma_irq, "no IRQ resource info\n");
41a469482de257 Al Cooper       2021-03-25  1083  			goto err1;
41a469482de257 Al Cooper       2021-03-25  1084  		}
41a469482de257 Al Cooper       2021-03-25  1085  		ret = devm_request_irq(dev, dma_irq, brcmuart_isr,
41a469482de257 Al Cooper       2021-03-25  1086  				IRQF_SHARED, "uart DMA irq", &new_port->port);
1654731536344f Pan Chuang      2026-07-22  1087  		if (ret)
41a469482de257 Al Cooper       2021-03-25  1088  			goto err1;
41a469482de257 Al Cooper       2021-03-25  1089  	}
41a469482de257 Al Cooper       2021-03-25  1090  	platform_set_drvdata(pdev, priv);
41a469482de257 Al Cooper       2021-03-25  1091  	brcmuart_init_debugfs(priv, dev_name(&pdev->dev));
41a469482de257 Al Cooper       2021-03-25  1092  	return 0;
41a469482de257 Al Cooper       2021-03-25  1093  
41a469482de257 Al Cooper       2021-03-25  1094  err1:
41a469482de257 Al Cooper       2021-03-25  1095  	serial8250_unregister_port(priv->line);
41a469482de257 Al Cooper       2021-03-25  1096  err:
41a469482de257 Al Cooper       2021-03-25  1097  	brcmuart_free_bufs(dev, priv);
15ac1122fd6d4b Doug Berger     2023-03-09  1098  release_dma:
15ac1122fd6d4b Doug Berger     2023-03-09  1099  	if (priv->dma_enabled)
41a469482de257 Al Cooper       2021-03-25  1100  		brcmuart_arbitration(priv, 0);
c195438f1e84de Lad Prabhakar   2021-12-24  1101  	return ret;
41a469482de257 Al Cooper       2021-03-25  1102  }
41a469482de257 Al Cooper       2021-03-25  1103  

:::::: The code at line 962 was first introduced by commit
:::::: 41a469482de257ea8db43cf74b6311bd055de030 serial: 8250: Add new 8250-core based Broadcom STB driver

:::::: TO: Al Cooper <alcooperx@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
