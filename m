Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEAF1FD2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689144286; x=1720680286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LwrPeB52w///sUHnaGojOmW9BIotAJuA+g6ydadzkZY=;
  b=Rzhkv/W3cxSEBRI+UHW268uFtUrg64YpoE0CBajt4FGTjlnlxP/NVcEC
   RqEWKJb/+cAQQG4xSG6uGY9nY+thcBZnFpp37L5y8IeDn+NreOUIQq3LF
   BRdvqVNCUNwiPWFRq8fOe+dYjhLEAvHspLF/qK0WtZJJtqjNiQNTvyAmy
   WAubSeSS3fxZdz9fa+4g/BSIM+bDIYHiXdAEq5LGIoc6lSnsaKXIIxgeF
   fo0YCVTbkKlUSbb1xie+0Fzdwf9PRW+bjjAiVqF7++L2J96SjxUXJSN72
   92NCBc5ITM+xITtuzpoqCdpVG+uEWARspOfS4PvbeXRxTxZtbQcnLP7nH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364852481"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="364852481"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 23:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="751047207"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="751047207"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2023 23:44:44 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJTad-0005TH-0t;
	Wed, 12 Jul 2023 06:44:43 +0000
Date: Wed, 12 Jul 2023 14:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 88/112]
 drivers/tty/serial/8250/8250_omap.c:1258:9: error: implicit declaration of
 function 'cpu_latency_qos_remove_request'; did you mean
 'dev_pm_qos_remove_request'?
Message-ID: <202307121445.wVGkoSA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   e85697251f8c41a6cc96a7e7b9ec143ebc3f1901
commit: 37ba6795a346e7cf8e91f488ed535ddfbc0260a1 [88/112] serial: 8250: omap: Fix freeing of resources on failed register
config: arm-randconfig-r001-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121445.wVGkoSA4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121445.wVGkoSA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121445.wVGkoSA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_omap.c: In function 'omap8250_probe':
>> drivers/tty/serial/8250/8250_omap.c:1258:9: error: implicit declaration of function 'cpu_latency_qos_remove_request'; did you mean 'dev_pm_qos_remove_request'? [-Werror=implicit-function-declaration]
    1258 |         cpu_latency_qos_remove_request(&priv->pm_qos_request);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         dev_pm_qos_remove_request
   cc1: some warnings being treated as errors


vim +1258 drivers/tty/serial/8250/8250_omap.c

  1109	
  1110	static int omap8250_probe(struct platform_device *pdev)
  1111	{
  1112		struct resource *regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  1113		struct resource *irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
  1114		struct omap8250_priv *priv;
  1115		struct uart_8250_port up;
  1116		int ret;
  1117		void __iomem *membase;
  1118	
  1119		if (!regs || !irq) {
  1120			dev_err(&pdev->dev, "missing registers or irq\n");
  1121			return -EINVAL;
  1122		}
  1123	
  1124		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
  1125		if (!priv)
  1126			return -ENOMEM;
  1127	
  1128		membase = devm_ioremap_nocache(&pdev->dev, regs->start,
  1129					       resource_size(regs));
  1130		if (!membase)
  1131			return -ENODEV;
  1132	
  1133		memset(&up, 0, sizeof(up));
  1134		up.port.dev = &pdev->dev;
  1135		up.port.mapbase = regs->start;
  1136		up.port.membase = membase;
  1137		up.port.irq = irq->start;
  1138		/*
  1139		 * It claims to be 16C750 compatible however it is a little different.
  1140		 * It has EFR and has no FCR7_64byte bit. The AFE (which it claims to
  1141		 * have) is enabled via EFR instead of MCR. The type is set here 8250
  1142		 * just to get things going. UNKNOWN does not work for a few reasons and
  1143		 * we don't need our own type since we don't use 8250's set_termios()
  1144		 * or pm callback.
  1145		 */
  1146		up.port.type = PORT_8250;
  1147		up.port.iotype = UPIO_MEM;
  1148		up.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SOFT_FLOW |
  1149			UPF_HARD_FLOW;
  1150		up.port.private_data = priv;
  1151	
  1152		up.port.regshift = 2;
  1153		up.port.fifosize = 64;
  1154		up.tx_loadsz = 64;
  1155		up.capabilities = UART_CAP_FIFO;
  1156	#ifdef CONFIG_PM
  1157		/*
  1158		 * Runtime PM is mostly transparent. However to do it right we need to a
  1159		 * TX empty interrupt before we can put the device to auto idle. So if
  1160		 * PM is not enabled we don't add that flag and can spare that one extra
  1161		 * interrupt in the TX path.
  1162		 */
  1163		up.capabilities |= UART_CAP_RPM;
  1164	#endif
  1165		up.port.set_termios = omap_8250_set_termios;
  1166		up.port.set_mctrl = omap8250_set_mctrl;
  1167		up.port.pm = omap_8250_pm;
  1168		up.port.startup = omap_8250_startup;
  1169		up.port.shutdown = omap_8250_shutdown;
  1170		up.port.throttle = omap_8250_throttle;
  1171		up.port.unthrottle = omap_8250_unthrottle;
  1172		up.port.rs485_config = omap_8250_rs485_config;
  1173	
  1174		if (pdev->dev.of_node) {
  1175			const struct of_device_id *id;
  1176	
  1177			ret = of_alias_get_id(pdev->dev.of_node, "serial");
  1178	
  1179			of_property_read_u32(pdev->dev.of_node, "clock-frequency",
  1180					     &up.port.uartclk);
  1181			priv->wakeirq = irq_of_parse_and_map(pdev->dev.of_node, 1);
  1182	
  1183			id = of_match_device(of_match_ptr(omap8250_dt_ids), &pdev->dev);
  1184			if (id && id->data)
  1185				priv->habit |= *(u8 *)id->data;
  1186		} else {
  1187			ret = pdev->id;
  1188		}
  1189		if (ret < 0) {
  1190			dev_err(&pdev->dev, "failed to get alias/pdev id\n");
  1191			return ret;
  1192		}
  1193		up.port.line = ret;
  1194	
  1195		if (!up.port.uartclk) {
  1196			up.port.uartclk = DEFAULT_CLK_SPEED;
  1197			dev_warn(&pdev->dev,
  1198				 "No clock speed specified: using default: %d\n",
  1199				 DEFAULT_CLK_SPEED);
  1200		}
  1201	
  1202		priv->latency = PM_QOS_CPU_DMA_LAT_DEFAULT_VALUE;
  1203		priv->calc_latency = PM_QOS_CPU_DMA_LAT_DEFAULT_VALUE;
  1204		pm_qos_add_request(&priv->pm_qos_request, PM_QOS_CPU_DMA_LATENCY,
  1205				   priv->latency);
  1206		INIT_WORK(&priv->qos_work, omap8250_uart_qos_work);
  1207	
  1208		spin_lock_init(&priv->rx_dma_lock);
  1209	
  1210		device_init_wakeup(&pdev->dev, true);
  1211		pm_runtime_enable(&pdev->dev);
  1212		pm_runtime_use_autosuspend(&pdev->dev);
  1213		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
  1214	
  1215		pm_runtime_irq_safe(&pdev->dev);
  1216	
  1217		pm_runtime_get_sync(&pdev->dev);
  1218	
  1219		omap_serial_fill_features_erratas(&up, priv);
  1220		up.port.handle_irq = omap8250_no_handle_irq;
  1221	#ifdef CONFIG_SERIAL_8250_DMA
  1222		if (pdev->dev.of_node) {
  1223			/*
  1224			 * Oh DMA support. If there are no DMA properties in the DT then
  1225			 * we will fall back to a generic DMA channel which does not
  1226			 * really work here. To ensure that we do not get a generic DMA
  1227			 * channel assigned, we have the the_no_dma_filter_fn() here.
  1228			 * To avoid "failed to request DMA" messages we check for DMA
  1229			 * properties in DT.
  1230			 */
  1231			ret = of_property_count_strings(pdev->dev.of_node, "dma-names");
  1232			if (ret == 2) {
  1233				up.dma = &priv->omap8250_dma;
  1234				priv->omap8250_dma.fn = the_no_dma_filter_fn;
  1235				priv->omap8250_dma.tx_dma = omap_8250_tx_dma;
  1236				priv->omap8250_dma.rx_dma = omap_8250_rx_dma;
  1237				priv->omap8250_dma.rx_size = RX_TRIGGER;
  1238				priv->omap8250_dma.rxconf.src_maxburst = RX_TRIGGER;
  1239				priv->omap8250_dma.txconf.dst_maxburst = TX_TRIGGER;
  1240			}
  1241		}
  1242	#endif
  1243		ret = serial8250_register_8250_port(&up);
  1244		if (ret < 0) {
  1245			dev_err(&pdev->dev, "unable to register 8250 port\n");
  1246			goto err;
  1247		}
  1248		priv->line = ret;
  1249		platform_set_drvdata(pdev, priv);
  1250		pm_runtime_mark_last_busy(&pdev->dev);
  1251		pm_runtime_put_autosuspend(&pdev->dev);
  1252		return 0;
  1253	err:
  1254		pm_runtime_dont_use_autosuspend(&pdev->dev);
  1255		pm_runtime_put_sync(&pdev->dev);
  1256		flush_work(&priv->qos_work);
  1257		pm_runtime_disable(&pdev->dev);
> 1258		cpu_latency_qos_remove_request(&priv->pm_qos_request);
  1259		return ret;
  1260	}
  1261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
