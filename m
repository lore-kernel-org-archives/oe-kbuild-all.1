Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE93210
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682354818; x=1713890818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FuAPvL6vK1eCHj45dT4FpuT3gGk4z+h1zz9au7g4wZ8=;
  b=FBCb+KycNxjdH1nsMw6qdL1DJ7uGMagFfmA/DHWN6PL8gniYMrM7H9Oy
   LgXgKUYYD2nbjrO2iZu2Vw0zjbGcASOHoLuMzLx1eBABKX5qbrlHH8Udh
   9uxp1fHZbcj0ZLjZU7Yc1ER+56Bc42SYdnAZsZOMRCSmlmav2t8cSQjKv
   ZxeF2P7WBmtt9ItewmlZJ5Gsk++Vdd/AerPXEYww5SSy9wntH7zCSukbp
   JNV0dz+WM7oq6F46FnNYz4tLj1OyaMbwKGRMLG117wVx1x9hVmC337pas
   mN5MBUkYSHR07vseDtrrimWaxwasLH6ZWvVsYdF+28SfCp4II0Bc04PrR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432778857"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="432778857"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 09:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="804689830"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="804689830"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Apr 2023 09:46:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqzL5-000iY4-2m;
	Mon, 24 Apr 2023 16:46:55 +0000
Date: Tue, 25 Apr 2023 00:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v6 2/2] net: ti: icssg-prueth: Add ICSSG ethernet
 driver
Message-ID: <202304250036.4mVfo67v-lkp@intel.com>
References: <20230424053233.2338782-3-danishanwar@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424053233.2338782-3-danishanwar@ti.com>

Hi MD,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on krzk-dt/for-next linus/master v6.3 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/MD-Danish-Anwar/dt-bindings-net-Add-ICSSG-Ethernet/20230424-133456
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230424053233.2338782-3-danishanwar%40ti.com
patch subject: [RFC PATCH v6 2/2] net: ti: icssg-prueth: Add ICSSG ethernet driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230425/202304250036.4mVfo67v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c533010d3e2d9f94cfbcd2760985a9ebda393882
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review MD-Danish-Anwar/dt-bindings-net-Add-ICSSG-Ethernet/20230424-133456
        git checkout c533010d3e2d9f94cfbcd2760985a9ebda393882
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250036.4mVfo67v-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/icssg_prueth.c: In function 'prueth_netdev_init':
>> drivers/net/ethernet/ti/icssg_prueth.c:1327:15: error: implicit declaration of function 'pruss_request_mem_region'; did you mean 'devm_request_mem_region'? [-Werror=implicit-function-declaration]
    1327 |         ret = pruss_request_mem_region(prueth->pruss,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               devm_request_mem_region
>> drivers/net/ethernet/ti/icssg_prueth.c:1411:9: error: implicit declaration of function 'pruss_release_mem_region'; did you mean 'devm_release_mem_region'? [-Werror=implicit-function-declaration]
    1411 |         pruss_release_mem_region(prueth->pruss, &emac->dram);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         devm_release_mem_region
   drivers/net/ethernet/ti/icssg_prueth.c: In function 'prueth_probe':
>> drivers/net/ethernet/ti/icssg_prueth.c:1600:17: error: implicit declaration of function 'pruss_get'; did you mean 'css_get'? [-Werror=implicit-function-declaration]
    1600 |         pruss = pruss_get(eth0_node ?
         |                 ^~~~~~~~~
         |                 css_get
   drivers/net/ethernet/ti/icssg_prueth.c:1600:15: warning: assignment to 'struct pruss *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1600 |         pruss = pruss_get(eth0_node ?
         |               ^
>> drivers/net/ethernet/ti/icssg_prueth.c:1614:17: error: implicit declaration of function 'pruss_put'; did you mean 'css_put'? [-Werror=implicit-function-declaration]
    1614 |                 pruss_put(prueth->pruss);
         |                 ^~~~~~~~~
         |                 css_put
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/ti/icssg_config.c: In function 'icssg_miig_queues_init':
   drivers/net/ethernet/ti/icssg_config.c:176:20: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     176 |                 mp = &hwq_map[slice][j];
         |                    ^
   drivers/net/ethernet/ti/icssg_config.c: In function 'icssg_config':
>> drivers/net/ethernet/ti/icssg_config.c:347:9: error: implicit declaration of function 'pruss_cfg_gpimode' [-Werror=implicit-function-declaration]
     347 |         pruss_cfg_gpimode(prueth->pruss, prueth->pru_id[slice],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg_config.c:348:27: error: 'PRUSS_GPI_MODE_MII' undeclared (first use in this function)
     348 |                           PRUSS_GPI_MODE_MII);
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg_config.c:348:27: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/ti/icssg_config.c:351:9: error: implicit declaration of function 'pruss_cfg_xfr_enable' [-Werror=implicit-function-declaration]
     351 |         pruss_cfg_xfr_enable(prueth->pruss, PRU_TYPE_PRU, true);
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg_config.c:351:45: error: 'PRU_TYPE_PRU' undeclared (first use in this function); did you mean 'IRQ_TYPE_PROBE'?
     351 |         pruss_cfg_xfr_enable(prueth->pruss, PRU_TYPE_PRU, true);
         |                                             ^~~~~~~~~~~~
         |                                             IRQ_TYPE_PROBE
>> drivers/net/ethernet/ti/icssg_config.c:352:45: error: 'PRU_TYPE_RTU' undeclared (first use in this function)
     352 |         pruss_cfg_xfr_enable(prueth->pruss, PRU_TYPE_RTU, true);
         |                                             ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1327 drivers/net/ethernet/ti/icssg_prueth.c

  1293	
  1294	static int prueth_netdev_init(struct prueth *prueth,
  1295				      struct device_node *eth_node)
  1296	{
  1297		int ret, num_tx_chn = PRUETH_MAX_TX_QUEUES;
  1298		struct prueth_emac *emac;
  1299		struct net_device *ndev;
  1300		enum prueth_port port;
  1301		enum prueth_mac mac;
  1302	
  1303		port = prueth_node_port(eth_node);
  1304		if (port < 0)
  1305			return -EINVAL;
  1306	
  1307		mac = prueth_node_mac(eth_node);
  1308		if (mac < 0)
  1309			return -EINVAL;
  1310	
  1311		ndev = alloc_etherdev_mq(sizeof(*emac), num_tx_chn);
  1312		if (!ndev)
  1313			return -ENOMEM;
  1314	
  1315		emac = netdev_priv(ndev);
  1316		prueth->emac[mac] = emac;
  1317		emac->prueth = prueth;
  1318		emac->ndev = ndev;
  1319		emac->port_id = port;
  1320		emac->cmd_wq = create_singlethread_workqueue("icssg_cmd_wq");
  1321		if (!emac->cmd_wq) {
  1322			ret = -ENOMEM;
  1323			goto free_ndev;
  1324		}
  1325		INIT_WORK(&emac->rx_mode_work, emac_ndo_set_rx_mode_work);
  1326	
> 1327		ret = pruss_request_mem_region(prueth->pruss,
  1328					       port == PRUETH_PORT_MII0 ?
  1329					       PRUSS_MEM_DRAM0 : PRUSS_MEM_DRAM1,
  1330					       &emac->dram);
  1331		if (ret) {
  1332			dev_err(prueth->dev, "unable to get DRAM: %d\n", ret);
  1333			ret = -ENOMEM;
  1334			goto free_wq;
  1335		}
  1336	
  1337		emac->tx_ch_num = 1;
  1338	
  1339		SET_NETDEV_DEV(ndev, prueth->dev);
  1340		spin_lock_init(&emac->lock);
  1341		mutex_init(&emac->cmd_lock);
  1342	
  1343		emac->phy_node = of_parse_phandle(eth_node, "phy-handle", 0);
  1344		if (!emac->phy_node && !of_phy_is_fixed_link(eth_node)) {
  1345			dev_err(prueth->dev, "couldn't find phy-handle\n");
  1346			ret = -ENODEV;
  1347			goto free;
  1348		} else if (of_phy_is_fixed_link(eth_node)) {
  1349			ret = of_phy_register_fixed_link(eth_node);
  1350			if (ret) {
  1351				ret = dev_err_probe(prueth->dev, ret,
  1352						    "failed to register fixed-link phy\n");
  1353				goto free;
  1354			}
  1355	
  1356			emac->phy_node = eth_node;
  1357		}
  1358	
  1359		ret = of_get_phy_mode(eth_node, &emac->phy_if);
  1360		if (ret) {
  1361			dev_err(prueth->dev, "could not get phy-mode property\n");
  1362			goto free;
  1363		}
  1364	
  1365		if (emac->phy_if != PHY_INTERFACE_MODE_MII &&
  1366		    !phy_interface_mode_is_rgmii(emac->phy_if)) {
  1367			dev_err(prueth->dev, "PHY mode unsupported %s\n", phy_modes(emac->phy_if));
  1368			goto free;
  1369		}
  1370	
  1371		/* AM65 SR2.0 has TX Internal delay always enabled by hardware
  1372		 * and it is not possible to disable TX Internal delay. The below
  1373		 * switch case block describes how we handle different phy modes
  1374		 * based on hardware restriction.
  1375		 */
  1376		switch (emac->phy_if) {
  1377		case PHY_INTERFACE_MODE_RGMII_ID:
  1378			emac->phy_if = PHY_INTERFACE_MODE_RGMII_RXID;
  1379			break;
  1380		case PHY_INTERFACE_MODE_RGMII_TXID:
  1381			emac->phy_if = PHY_INTERFACE_MODE_RGMII;
  1382			break;
  1383		case PHY_INTERFACE_MODE_RGMII:
  1384		case PHY_INTERFACE_MODE_RGMII_RXID:
  1385			dev_err(prueth->dev, "RGMII mode without TX delay is not supported");
  1386			return -EINVAL;
  1387		default:
  1388			break;
  1389		}
  1390	
  1391		/* get mac address from DT and set private and netdev addr */
  1392		ret = of_get_ethdev_address(eth_node, ndev);
  1393		if (!is_valid_ether_addr(ndev->dev_addr)) {
  1394			eth_hw_addr_random(ndev);
  1395			dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
  1396				 port, ndev->dev_addr);
  1397		}
  1398		ether_addr_copy(emac->mac_addr, ndev->dev_addr);
  1399	
  1400		ndev->netdev_ops = &emac_netdev_ops;
  1401		ndev->ethtool_ops = &icssg_ethtool_ops;
  1402		ndev->hw_features = NETIF_F_SG;
  1403		ndev->features = ndev->hw_features;
  1404	
  1405		netif_napi_add(ndev, &emac->napi_rx,
  1406			       emac_napi_rx_poll);
  1407	
  1408		return 0;
  1409	
  1410	free:
> 1411		pruss_release_mem_region(prueth->pruss, &emac->dram);
  1412	free_wq:
  1413		destroy_workqueue(emac->cmd_wq);
  1414	free_ndev:
  1415		free_netdev(ndev);
  1416		prueth->emac[mac] = NULL;
  1417	
  1418		return ret;
  1419	}
  1420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
