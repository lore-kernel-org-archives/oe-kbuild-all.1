Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDFF19B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679676529; x=1711212529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6HbnlaWKIeCSn7z8Pss9zJsJO0WPfmgYktuw1mwm+Y=;
  b=AZH7mhdr4yi1iGAsIKsxayliy+rg7WfzFzmyZQghD9ajdpz7dYH3LDRw
   n2OPAL94eNSfK5l76QyNuPVwmTSf+Z7ePDpNWmc1KmtY2pLUh/D8qYo5L
   Ba/P6Xh1icVEAaJjv6AAlU6Q/qpJYIBW9B+mLVAauEnFiZ3Yo0sEyLCLC
   X4bn1eVkTpc4KOs6fObAe14oHGKFiT/dXf4csSg/zgV/bFc4zln1yc38E
   J9dKzcs/097YB2pE/NuejSr/p6XmCDqlUwJNQA9veB776Wu7su2rRKsYz
   DWQdN8haxXMKD2WFDJnc4Mp3INaBrCt4IKtGDWF2fXZ7qgz+SX7PVpgUq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323703366"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="323703366"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 09:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="793511341"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="793511341"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2023 09:45:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfkXb-000FTM-1S;
	Fri, 24 Mar 2023 16:45:23 +0000
Date: Sat, 25 Mar 2023 00:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 6/7] net: ethernet: altera-tse: Convert to mdio-regmap and
 use PCS Lynx
Message-ID: <202303250021.BjLa7zxR-lkp@intel.com>
References: <20230324093644.464704-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324093644.464704-7-maxime.chevallier@bootlin.com>

Hi Maxime,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on broonie-regmap/for-next]
[also build test ERROR on lee-mfd/for-mfd-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.3-rc3 next-20230324]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/regmap-add-a-helper-to-translate-the-register-address/20230324-173909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
patch link:    https://lore.kernel.org/r/20230324093644.464704-7-maxime.chevallier%40bootlin.com
patch subject: [RFC 6/7] net: ethernet: altera-tse: Convert to mdio-regmap and use PCS Lynx
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230325/202303250021.BjLa7zxR-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/38972c069ffca67815b706f76938d49e7a8a48a6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Chevallier/regmap-add-a-helper-to-translate-the-register-address/20230324-173909
        git checkout 38972c069ffca67815b706f76938d49e7a8a48a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250021.BjLa7zxR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/altera/altera_tse_main.c: In function 'altera_tse_probe':
>> drivers/net/ethernet/altera/altera_tse_main.c:1152:30: error: storage size of 'pcs_regmap_cfg' isn't known
    1152 |         struct regmap_config pcs_regmap_cfg;
         |                              ^~~~~~~~~~~~~~
>> drivers/net/ethernet/altera/altera_tse_main.c:1293:22: error: implicit declaration of function 'devm_regmap_init_mmio' [-Werror=implicit-function-declaration]
    1293 |         pcs_regmap = devm_regmap_init_mmio(&pdev->dev, priv->pcs_base,
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/altera/altera_tse_main.c:1152:30: warning: unused variable 'pcs_regmap_cfg' [-Wunused-variable]
    1152 |         struct regmap_config pcs_regmap_cfg;
         |                              ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1152 drivers/net/ethernet/altera/altera_tse_main.c

  1136	
  1137	/* Probe Altera TSE MAC device
  1138	 */
  1139	static int altera_tse_probe(struct platform_device *pdev)
  1140	{
  1141		const struct of_device_id *of_id = NULL;
  1142		struct altera_tse_private *priv;
  1143		struct resource *control_port;
  1144		struct regmap *pcs_regmap;
  1145		struct resource *dma_res;
  1146		struct resource *pcs_res;
  1147		struct mii_bus *pcs_bus;
  1148		struct net_device *ndev;
  1149		void __iomem *descmap;
  1150		int ret = -ENODEV;
  1151	
> 1152		struct regmap_config pcs_regmap_cfg;
  1153	
  1154		struct mdio_regmap_config mrc = {
  1155			.parent = &pdev->dev,
  1156			.valid_addr = 0x1,
  1157		};
  1158	
  1159		ndev = alloc_etherdev(sizeof(struct altera_tse_private));
  1160		if (!ndev) {
  1161			dev_err(&pdev->dev, "Could not allocate network device\n");
  1162			return -ENODEV;
  1163		}
  1164	
  1165		SET_NETDEV_DEV(ndev, &pdev->dev);
  1166	
  1167		priv = netdev_priv(ndev);
  1168		priv->device = &pdev->dev;
  1169		priv->dev = ndev;
  1170		priv->msg_enable = netif_msg_init(debug, default_msg_level);
  1171	
  1172		of_id = of_match_device(altera_tse_ids, &pdev->dev);
  1173	
  1174		if (of_id)
  1175			priv->dmaops = (struct altera_dmaops *)of_id->data;
  1176	
  1177	
  1178		if (priv->dmaops &&
  1179		    priv->dmaops->altera_dtype == ALTERA_DTYPE_SGDMA) {
  1180			/* Get the mapped address to the SGDMA descriptor memory */
  1181			ret = request_and_map(pdev, "s1", &dma_res, &descmap);
  1182			if (ret)
  1183				goto err_free_netdev;
  1184	
  1185			/* Start of that memory is for transmit descriptors */
  1186			priv->tx_dma_desc = descmap;
  1187	
  1188			/* First half is for tx descriptors, other half for tx */
  1189			priv->txdescmem = resource_size(dma_res)/2;
  1190	
  1191			priv->txdescmem_busaddr = (dma_addr_t)dma_res->start;
  1192	
  1193			priv->rx_dma_desc = (void __iomem *)((uintptr_t)(descmap +
  1194							     priv->txdescmem));
  1195			priv->rxdescmem = resource_size(dma_res)/2;
  1196			priv->rxdescmem_busaddr = dma_res->start;
  1197			priv->rxdescmem_busaddr += priv->txdescmem;
  1198	
  1199			if (upper_32_bits(priv->rxdescmem_busaddr)) {
  1200				dev_dbg(priv->device,
  1201					"SGDMA bus addresses greater than 32-bits\n");
  1202				ret = -EINVAL;
  1203				goto err_free_netdev;
  1204			}
  1205			if (upper_32_bits(priv->txdescmem_busaddr)) {
  1206				dev_dbg(priv->device,
  1207					"SGDMA bus addresses greater than 32-bits\n");
  1208				ret = -EINVAL;
  1209				goto err_free_netdev;
  1210			}
  1211		} else if (priv->dmaops &&
  1212			   priv->dmaops->altera_dtype == ALTERA_DTYPE_MSGDMA) {
  1213			ret = request_and_map(pdev, "rx_resp", &dma_res,
  1214					      &priv->rx_dma_resp);
  1215			if (ret)
  1216				goto err_free_netdev;
  1217	
  1218			ret = request_and_map(pdev, "tx_desc", &dma_res,
  1219					      &priv->tx_dma_desc);
  1220			if (ret)
  1221				goto err_free_netdev;
  1222	
  1223			priv->txdescmem = resource_size(dma_res);
  1224			priv->txdescmem_busaddr = dma_res->start;
  1225	
  1226			ret = request_and_map(pdev, "rx_desc", &dma_res,
  1227					      &priv->rx_dma_desc);
  1228			if (ret)
  1229				goto err_free_netdev;
  1230	
  1231			priv->rxdescmem = resource_size(dma_res);
  1232			priv->rxdescmem_busaddr = dma_res->start;
  1233	
  1234		} else {
  1235			ret = -ENODEV;
  1236			goto err_free_netdev;
  1237		}
  1238	
  1239		if (!dma_set_mask(priv->device, DMA_BIT_MASK(priv->dmaops->dmamask))) {
  1240			dma_set_coherent_mask(priv->device,
  1241					      DMA_BIT_MASK(priv->dmaops->dmamask));
  1242		} else if (!dma_set_mask(priv->device, DMA_BIT_MASK(32))) {
  1243			dma_set_coherent_mask(priv->device, DMA_BIT_MASK(32));
  1244		} else {
  1245			ret = -EIO;
  1246			goto err_free_netdev;
  1247		}
  1248	
  1249		/* MAC address space */
  1250		ret = request_and_map(pdev, "control_port", &control_port,
  1251				      (void __iomem **)&priv->mac_dev);
  1252		if (ret)
  1253			goto err_free_netdev;
  1254	
  1255		/* xSGDMA Rx Dispatcher address space */
  1256		ret = request_and_map(pdev, "rx_csr", &dma_res,
  1257				      &priv->rx_dma_csr);
  1258		if (ret)
  1259			goto err_free_netdev;
  1260	
  1261	
  1262		/* xSGDMA Tx Dispatcher address space */
  1263		ret = request_and_map(pdev, "tx_csr", &dma_res,
  1264				      &priv->tx_dma_csr);
  1265		if (ret)
  1266			goto err_free_netdev;
  1267	
  1268		/* SGMII PCS address space. The location can vary depending on how the
  1269		 * IP is integrated. We can have a resource dedicated to it at a specific
  1270		 * address space, but if it's not the case, we fallback to the mdiophy0
  1271		 * from the MAC's address space
  1272		 */
  1273		ret = request_and_map(pdev, "pcs", &pcs_res,
  1274				      &priv->pcs_base);
  1275		if (ret) {
  1276			/* If we can't find a dedicated resource for the PCS, fallback
  1277			 * to the internal PCS, that has a different address stride
  1278			 */
  1279			priv->pcs_base = priv->mac_dev + tse_csroffs(mdio_phy0);
  1280			pcs_regmap_cfg.reg_bits = 32;
  1281			/* Values are MDIO-like values, on 16 bits */
  1282			pcs_regmap_cfg.val_bits = 16;
  1283			pcs_regmap_cfg.reg_stride = 4;
  1284			pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(2);
  1285		} else {
  1286			pcs_regmap_cfg.reg_bits = 16;
  1287			pcs_regmap_cfg.val_bits = 16;
  1288			pcs_regmap_cfg.reg_stride = 2;
  1289			pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(1);
  1290		}
  1291	
  1292		/* Create a regmap for the PCS so that it can be used by the PCS driver */
> 1293		pcs_regmap = devm_regmap_init_mmio(&pdev->dev, priv->pcs_base,
  1294						   &pcs_regmap_cfg);
  1295		if (IS_ERR(pcs_regmap)) {
  1296			ret = PTR_ERR(pcs_regmap);
  1297			goto err_free_netdev;
  1298		}
  1299		mrc.regmap = pcs_regmap;
  1300	
  1301		/* Rx IRQ */
  1302		priv->rx_irq = platform_get_irq_byname(pdev, "rx_irq");
  1303		if (priv->rx_irq == -ENXIO) {
  1304			dev_err(&pdev->dev, "cannot obtain Rx IRQ\n");
  1305			ret = -ENXIO;
  1306			goto err_free_netdev;
  1307		}
  1308	
  1309		/* Tx IRQ */
  1310		priv->tx_irq = platform_get_irq_byname(pdev, "tx_irq");
  1311		if (priv->tx_irq == -ENXIO) {
  1312			dev_err(&pdev->dev, "cannot obtain Tx IRQ\n");
  1313			ret = -ENXIO;
  1314			goto err_free_netdev;
  1315		}
  1316	
  1317		/* get FIFO depths from device tree */
  1318		if (of_property_read_u32(pdev->dev.of_node, "rx-fifo-depth",
  1319					 &priv->rx_fifo_depth)) {
  1320			dev_err(&pdev->dev, "cannot obtain rx-fifo-depth\n");
  1321			ret = -ENXIO;
  1322			goto err_free_netdev;
  1323		}
  1324	
  1325		if (of_property_read_u32(pdev->dev.of_node, "tx-fifo-depth",
  1326					 &priv->tx_fifo_depth)) {
  1327			dev_err(&pdev->dev, "cannot obtain tx-fifo-depth\n");
  1328			ret = -ENXIO;
  1329			goto err_free_netdev;
  1330		}
  1331	
  1332		/* get hash filter settings for this instance */
  1333		priv->hash_filter =
  1334			of_property_read_bool(pdev->dev.of_node,
  1335					      "altr,has-hash-multicast-filter");
  1336	
  1337		/* Set hash filter to not set for now until the
  1338		 * multicast filter receive issue is debugged
  1339		 */
  1340		priv->hash_filter = 0;
  1341	
  1342		/* get supplemental address settings for this instance */
  1343		priv->added_unicast =
  1344			of_property_read_bool(pdev->dev.of_node,
  1345					      "altr,has-supplementary-unicast");
  1346	
  1347		priv->dev->min_mtu = ETH_ZLEN + ETH_FCS_LEN;
  1348		/* Max MTU is 1500, ETH_DATA_LEN */
  1349		priv->dev->max_mtu = ETH_DATA_LEN;
  1350	
  1351		/* Get the max mtu from the device tree. Note that the
  1352		 * "max-frame-size" parameter is actually max mtu. Definition
  1353		 * in the ePAPR v1.1 spec and usage differ, so go with usage.
  1354		 */
  1355		of_property_read_u32(pdev->dev.of_node, "max-frame-size",
  1356				     &priv->dev->max_mtu);
  1357	
  1358		/* The DMA buffer size already accounts for an alignment bias
  1359		 * to avoid unaligned access exceptions for the NIOS processor,
  1360		 */
  1361		priv->rx_dma_buf_sz = ALTERA_RXDMABUFFER_SIZE;
  1362	
  1363		/* get default MAC address from device tree */
  1364		ret = of_get_ethdev_address(pdev->dev.of_node, ndev);
  1365		if (ret)
  1366			eth_hw_addr_random(ndev);
  1367	
  1368		/* get phy addr and create mdio */
  1369		ret = altera_tse_phy_get_addr_mdio_create(ndev);
  1370	
  1371		if (ret)
  1372			goto err_free_netdev;
  1373	
  1374		/* initialize netdev */
  1375		ndev->mem_start = control_port->start;
  1376		ndev->mem_end = control_port->end;
  1377		ndev->netdev_ops = &altera_tse_netdev_ops;
  1378		altera_tse_set_ethtool_ops(ndev);
  1379	
  1380		altera_tse_netdev_ops.ndo_set_rx_mode = tse_set_rx_mode;
  1381	
  1382		if (priv->hash_filter)
  1383			altera_tse_netdev_ops.ndo_set_rx_mode =
  1384				tse_set_rx_mode_hashfilter;
  1385	
  1386		/* Scatter/gather IO is not supported,
  1387		 * so it is turned off
  1388		 */
  1389		ndev->hw_features &= ~NETIF_F_SG;
  1390		ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
  1391	
  1392		/* VLAN offloading of tagging, stripping and filtering is not
  1393		 * supported by hardware, but driver will accommodate the
  1394		 * extra 4-byte VLAN tag for processing by upper layers
  1395		 */
  1396		ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
  1397	
  1398		/* setup NAPI interface */
  1399		netif_napi_add(ndev, &priv->napi, tse_poll);
  1400	
  1401		spin_lock_init(&priv->mac_cfg_lock);
  1402		spin_lock_init(&priv->tx_lock);
  1403		spin_lock_init(&priv->rxdma_irq_lock);
  1404	
  1405		netif_carrier_off(ndev);
  1406		ret = register_netdev(ndev);
  1407		if (ret) {
  1408			dev_err(&pdev->dev, "failed to register TSE net device\n");
  1409			goto err_register_netdev;
  1410		}
  1411	
  1412		platform_set_drvdata(pdev, ndev);
  1413	
  1414		priv->revision = ioread32(&priv->mac_dev->megacore_revision);
  1415	
  1416		if (netif_msg_probe(priv))
  1417			dev_info(&pdev->dev, "Altera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
  1418				 (priv->revision >> 8) & 0xff,
  1419				 priv->revision & 0xff,
  1420				 (unsigned long) control_port->start, priv->rx_irq,
  1421				 priv->tx_irq);
  1422	
  1423		snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", ndev->name);
  1424		pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
  1425		priv->pcs_mdiodev = mdio_device_create(pcs_bus, 0);
  1426	
  1427		priv->pcs = lynx_pcs_create(priv->pcs_mdiodev);
  1428		if (!priv->pcs) {
  1429			ret = -ENODEV;
  1430			goto err_init_phy;
  1431		}
  1432	
  1433		priv->phylink_config.dev = &ndev->dev;
  1434		priv->phylink_config.type = PHYLINK_NETDEV;
  1435		priv->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_10 |
  1436							MAC_100 | MAC_1000FD;
  1437	
  1438		phy_interface_set_rgmii(priv->phylink_config.supported_interfaces);
  1439		__set_bit(PHY_INTERFACE_MODE_MII,
  1440			  priv->phylink_config.supported_interfaces);
  1441		__set_bit(PHY_INTERFACE_MODE_GMII,
  1442			  priv->phylink_config.supported_interfaces);
  1443		__set_bit(PHY_INTERFACE_MODE_SGMII,
  1444			  priv->phylink_config.supported_interfaces);
  1445		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
  1446			  priv->phylink_config.supported_interfaces);
  1447	
  1448		priv->phylink = phylink_create(&priv->phylink_config,
  1449					       of_fwnode_handle(priv->device->of_node),
  1450					       priv->phy_iface, &alt_tse_phylink_ops);
  1451		if (IS_ERR(priv->phylink)) {
  1452			dev_err(&pdev->dev, "failed to create phylink\n");
  1453			ret = PTR_ERR(priv->phylink);
  1454			goto err_pcs;
  1455		}
  1456	
  1457		return 0;
  1458	err_pcs:
  1459		mdio_device_free(priv->pcs_mdiodev);
  1460	err_init_phy:
  1461		unregister_netdev(ndev);
  1462	err_register_netdev:
  1463		netif_napi_del(&priv->napi);
  1464		altera_tse_mdio_destroy(ndev);
  1465	err_free_netdev:
  1466		free_netdev(ndev);
  1467		return ret;
  1468	}
  1469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
