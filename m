Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A985568F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjQYoHFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699182173; x=1730718173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E061TDIPgb4d6bR+TBBiM1iZgnu01HfL0CSRb+E3+hM=;
  b=FjQYoHFhhofU730F3gTR2rXKPG2ndiRAp80DIvASbhrBYIXaf8a9kO7B
   oAUnOFZgjlx+QLUeloCnKTn1nrQvRMVwrJhTiIEY2fGU+cOTI+jFncYgc
   P8m/qBYN7ydRyi/NrWj/EK8t47Sh7PdUra9WtCYvkkbrPCd82F1NoHFab
   mJMBhek6V9To8dq8NQLU8+dcJb6cIdbl+TctaQHRZrADNWNBF4BmD9P3L
   I+lvcu4Ll8cfocRbuztO3EVbSPEVbCzEW9AvDChNieB30woq+02WHN6jL
   Lra7vAbO4gPMPQMl8/hiCi04FqkUgxCg48J2akHZu1s+SWO4MA+QQMsZO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379531946"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="379531946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 03:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="3363641"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2023 03:02:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzau0-0005LI-12;
	Sun, 05 Nov 2023 11:02:48 +0000
Date: Sun, 5 Nov 2023 19:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 157/382]
 drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c:1309:12: warning: cast from
 'void (*)(struct rpmsg_remotedev *)' to 'void (*)(void *)' converts to
 incompatible function type
Message-ID: <202311051840.pYLIit7b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   765670365233dc7ad139e5e96c437d333ae94543
commit: 3fed924f0c664f5f28d3eae9f62d20d773f0a87c [157/382] net: ethernet: ti: introduce j721e virt cpsw-nuss mac driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311051840.pYLIit7b-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051840.pYLIit7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051840.pYLIit7b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c:1119:36: warning: variable 'mac_addr' is uninitialized when used here [-Wuninitialized]
    1119 |         ret = of_get_mac_address(port_np, mac_addr);
         |                                           ^~~~~~~~
   drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c:1101:14: note: initialize the variable 'mac_addr' to silence this warning
    1101 |         u8 *mac_addr;
         |                     ^
         |                      = NULL
>> drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c:1309:12: warning: cast from 'void (*)(struct rpmsg_remotedev *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
    1309 |                                        (void(*)(void *))rpmsg_remotedev_put_device,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +1309 drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c

  1095	
  1096	static int virt_cpsw_nuss_of(struct virt_cpsw_common *common)
  1097	{
  1098		struct device *dev = common->dev;
  1099		struct device_node *port_np;
  1100		struct virt_cpsw_port *port;
  1101		u8 *mac_addr;
  1102		int ret;
  1103	
  1104		ret = of_property_read_u32(dev->of_node, "ti,psil-base",
  1105					   &common->tx_psil_id_base);
  1106		if (ret) {
  1107			dev_err(dev, "ti,psil-base read fail %d\n", ret);
  1108			return ret;
  1109		}
  1110	
  1111		port_np = of_get_child_by_name(dev->of_node, "virt-emac-port");
  1112		if (!port_np)
  1113			return -ENOENT;
  1114	
  1115		port = &common->ports;
  1116		port->common = common;
  1117		port->name = of_get_property(port_np, "ti,label", NULL);
  1118	
> 1119		ret = of_get_mac_address(port_np, mac_addr);
  1120		if (!ret)
  1121			ether_addr_copy(port->local_mac_addr, mac_addr);
  1122	
  1123		of_node_put(port_np);
  1124		return 0;
  1125	}
  1126	
  1127	static int virt_cpsw_nuss_rdev_init(struct virt_cpsw_common *common)
  1128	{
  1129		struct rpmsg_rdev_eth_switch_attach_ext_info attach_info = { 0 };
  1130		struct device *dev = common->dev;
  1131		int ret;
  1132	
  1133		ret = common->rdev_switch_ops->attach_ext(common->rdev, &attach_info);
  1134		if (ret) {
  1135			dev_err(dev, "rpmsg attach - fail %d\n", ret);
  1136			return ret;
  1137		}
  1138		dev_dbg(dev, "rpmsg attach_ext - rx_mtu:%d features:%08X tx_mtu[0]:%d flow_idx:%d tx_cpsw_psil_dst_id:%d mac_addr:%pM\n",
  1139			attach_info.rx_mtu, attach_info.features,
  1140			attach_info.tx_mtu[0],
  1141			attach_info.flow_idx,
  1142			attach_info.tx_cpsw_psil_dst_id,
  1143			attach_info.mac_addr);
  1144		common->rdev_features = attach_info.features;
  1145		common->rdev_mtu = VIRT_CPSW_MAX_PACKET_SIZE;
  1146		common->rdev_tx_psil_dst_id = attach_info.tx_cpsw_psil_dst_id &
  1147					     (~0x8000);
  1148		common->rdev_rx_flow_id = attach_info.flow_idx;
  1149		ether_addr_copy(common->rdev_mac_addr, attach_info.mac_addr);
  1150	
  1151		return 0;
  1152	}
  1153	
  1154	static int virt_cpsw_nuss_init_ndev(struct virt_cpsw_common *common)
  1155	{
  1156		struct virt_cpsw_ndev_priv *ndev_priv;
  1157		struct device *dev = common->dev;
  1158		struct virt_cpsw_port *port;
  1159		int ret;
  1160	
  1161		port = &common->ports;
  1162	
  1163		/* alloc netdev */
  1164		port->ndev = devm_alloc_etherdev_mqs(common->dev,
  1165						     sizeof(struct virt_cpsw_ndev_priv),
  1166						     1, 1);
  1167		if (!port->ndev) {
  1168			dev_err(dev, "error allocating net_device\n");
  1169			return -ENOMEM;
  1170		}
  1171	
  1172		ndev_priv = netdev_priv(port->ndev);
  1173		ndev_priv->port = port;
  1174		SET_NETDEV_DEV(port->ndev, dev);
  1175	
  1176		if (is_valid_ether_addr(port->local_mac_addr))
  1177			eth_hw_addr_set(port->ndev, port->local_mac_addr);
  1178		else if (is_valid_ether_addr(common->rdev_mac_addr))
  1179			eth_hw_addr_set(port->ndev, common->rdev_mac_addr);
  1180	
  1181		port->ndev->min_mtu = VIRT_CPSW_MIN_PACKET_SIZE;
  1182		port->ndev->max_mtu = VIRT_CPSW_MAX_PACKET_SIZE;
  1183		port->ndev->hw_features = NETIF_F_SG |
  1184					  NETIF_F_RXCSUM;
  1185		port->ndev->features = port->ndev->hw_features;
  1186		port->ndev->vlan_features |=  NETIF_F_SG;
  1187		port->ndev->netdev_ops = &virt_cpsw_nuss_netdev_ops;
  1188		port->ndev->ethtool_ops = &virt_cpsw_nuss_ethtool_ops;
  1189	
  1190		/* TX checksum offload if supported */
  1191		if (common->rdev_features & RPMSG_KDRV_ETHSWITCH_FEATURE_TXCSUM)
  1192			port->ndev->features |= NETIF_F_HW_CSUM;
  1193	
  1194		ndev_priv->stats = netdev_alloc_pcpu_stats(struct virt_cpsw_ndev_stats);
  1195		if (!ndev_priv->stats)
  1196			return -ENOMEM;
  1197	
  1198		ret = devm_add_action_or_reset(dev, (void(*)(void *))free_percpu,
  1199					       ndev_priv->stats);
  1200		if (ret) {
  1201			dev_err(dev, "failed to add percpu stat free action %d", ret);
  1202			return ret;
  1203		}
  1204	
  1205		netif_napi_add_tx(port->ndev, &common->napi_tx,
  1206				  virt_cpsw_nuss_tx_poll);
  1207		netif_napi_add(port->ndev, &common->napi_rx,
  1208			       virt_cpsw_nuss_rx_poll);
  1209	
  1210		ret = register_netdev(port->ndev);
  1211		if (ret)
  1212			dev_err(dev, "error registering slave net device %d\n", ret);
  1213	
  1214		/* can't auto unregister ndev using devm_add_action() due to broken
  1215		 * devres release sequence in DD core
  1216		 */
  1217	
  1218		return ret;
  1219	}
  1220	
  1221	static void virt_cpsw_nuss_cleanup_ndev(struct virt_cpsw_common *common)
  1222	{
  1223		if (common->ports.ndev)
  1224			unregister_netdev(common->ports.ndev);
  1225	}
  1226	
  1227	static bool virt_cpsw_dev_check(const struct net_device *ndev)
  1228	{
  1229		return ndev->netdev_ops == &virt_cpsw_nuss_netdev_ops;
  1230	}
  1231	
  1232	static int virt_cpsw_inetaddr_event(struct notifier_block *unused,
  1233					    unsigned long event, void *ptr)
  1234	{
  1235		struct in_ifaddr *ifa = (struct in_ifaddr *)ptr;
  1236		struct rpmsg_remotedev_eth_switch_ops *rdev_ops;
  1237		struct net_device *ndev = ifa->ifa_dev->dev;
  1238		struct virt_cpsw_common *common;
  1239		int ret = 0;
  1240	
  1241		if (!virt_cpsw_dev_check(ndev))
  1242			goto out;
  1243	
  1244		common = virt_ndev_to_common(ndev);
  1245		rdev_ops = common->rdev_switch_ops;
  1246		switch (event) {
  1247		case NETDEV_UP:
  1248			ret = rdev_ops->register_ipv4(common->rdev,
  1249						      (void *)ndev->dev_addr,
  1250						      ifa->ifa_address);
  1251			if (ret)
  1252				dev_err(common->dev, "register_ipv4 rpmsg - fail %d\n",
  1253					ret);
  1254			dev_dbg(common->dev, "NETDEV_UP %pI4 %s\n",
  1255				&ifa->ifa_address, ifa->ifa_label);
  1256			break;
  1257	
  1258		case NETDEV_DOWN:
  1259			ret = rdev_ops->unregister_ipv4(common->rdev,
  1260							ifa->ifa_address);
  1261			if (ret)
  1262				dev_err(common->dev, "unregister_ipv4 rpmsg - fail %d\n",
  1263					ret);
  1264			dev_dbg(common->dev, "NETDEV_DOWN %pI4\n", &ifa->ifa_address);
  1265			break;
  1266		}
  1267	
  1268	out:
  1269		return notifier_from_errno(ret);
  1270	}
  1271	
  1272	static struct notifier_block virt_cpsw_inetaddr_nb __read_mostly = {
  1273		.notifier_call = virt_cpsw_inetaddr_event,
  1274	};
  1275	
  1276	static const struct of_device_id virt_cpsw_virt_of_mtable[] = {
  1277		{ .compatible = "ti,j721e-cpsw-virt-mac", },
  1278		{ /* sentinel */ },
  1279	};
  1280	MODULE_DEVICE_TABLE(of, virt_cpsw_virt_of_mtable);
  1281	
  1282	static int virt_cpsw_nuss_probe(struct platform_device *pdev)
  1283	{
  1284		struct device *dev = &pdev->dev;
  1285		struct virt_cpsw_common *common;
  1286		int ret;
  1287	
  1288		common = devm_kzalloc(dev, sizeof(struct virt_cpsw_common), GFP_KERNEL);
  1289		if (!common)
  1290			return -ENOMEM;
  1291		common->dev = dev;
  1292	
  1293		ret = of_property_read_string(dev->of_node, "ti,remote-name",
  1294					      &common->rdev_name);
  1295		if (ret < 0) {
  1296			dev_info(dev, "remote-name is not set %d\n", ret);
  1297			return ret;
  1298		}
  1299	
  1300		common->rdev = rpmsg_remotedev_get_named_device(common->rdev_name);
  1301		if (!common->rdev)
  1302			return -EPROBE_DEFER;
  1303		if (IS_ERR(common->rdev)) {
  1304			ret = PTR_ERR(common->rdev);
  1305			return ret;
  1306		}
  1307		common->rdev_switch_ops = common->rdev->device.eth_switch.ops;
  1308		ret = devm_add_action_or_reset(dev,
> 1309					       (void(*)(void *))rpmsg_remotedev_put_device,
  1310					       common->rdev);
  1311		if (ret) {
  1312			dev_err(dev, "add remotedev put device action fail:%d", ret);
  1313			return ret;
  1314		}
  1315	
  1316		ret = virt_cpsw_nuss_of(common);
  1317		if (ret)
  1318			return ret;
  1319	
  1320		ret = virt_cpsw_nuss_rdev_init(common);
  1321		if (ret)
  1322			return ret;
  1323		/* init tx channels */
  1324		ret = virt_cpsw_nuss_init_tx_chns(common);
  1325		if (ret)
  1326			return ret;
  1327		ret = virt_cpsw_nuss_init_rx_chns(common);
  1328		if (ret)
  1329			return ret;
  1330	
  1331		if (common->tx_chns.irq == 0 || common->rx_chns.irq == 0)
  1332			return -ENXIO;
  1333	
  1334		dev_set_drvdata(dev, common);
  1335	
  1336		ret = virt_cpsw_nuss_init_ndev(common);
  1337		if (ret)
  1338			return ret;
  1339	
  1340		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(48));
  1341		if (ret) {
  1342			dev_err(dev, "error setting dma mask: %d\n", ret);
  1343			goto unreg_ndev;
  1344		}
  1345	
  1346		ret = devm_request_irq(dev, common->tx_chns.irq,
  1347				       virt_cpsw_nuss_tx_irq,
  1348				       IRQF_TRIGGER_HIGH, dev_name(dev), common);
  1349		if (ret) {
  1350			dev_err(dev, "failure requesting tx irq %u, %d\n",
  1351				common->tx_chns.irq, ret);
  1352			goto unreg_ndev;
  1353		}
  1354	
  1355		ret = devm_request_irq(dev, common->rx_chns.irq,
  1356				       virt_cpsw_nuss_rx_irq,
  1357				       IRQF_TRIGGER_HIGH, dev_name(dev), common);
  1358		if (ret) {
  1359			dev_err(dev, "failure requesting rx irq %u, %d\n",
  1360				common->rx_chns.irq, ret);
  1361			goto unreg_ndev;
  1362		}
  1363	
  1364		register_inetaddr_notifier(&virt_cpsw_inetaddr_nb);
  1365	
  1366		dev_info(common->dev, "virt_cpsw_nuss mac loaded\n");
  1367		dev_info(dev, "rdev_features:%08X rdev_mtu:%d flow_id:%d tx_psil_dst_id:%04X\n",
  1368			 common->rdev_features,
  1369			 common->rdev_mtu,
  1370			 common->rdev_rx_flow_id,
  1371			 common->rdev_tx_psil_dst_id);
  1372		dev_info(dev, "local_mac_addr:%pM rdev_mac_addr:%pM\n",
  1373			 common->ports.local_mac_addr,
  1374			 common->rdev_mac_addr);
  1375	
  1376		return 0;
  1377	
  1378	unreg_ndev:
  1379		virt_cpsw_nuss_cleanup_ndev(common);
  1380		return ret;
  1381	}
  1382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
