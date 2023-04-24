Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34B7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682330326; x=1713866326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TCdXC0iyamACalHWBPPx2sFwmI2LB95sDaieazdixGI=;
  b=Uie/m+YWwFUVgec8j/EfnwBwFXVheiqxk/9yHDKYb9bH/W73hlxUv1ym
   rVEaU3a1XrVrntGXKNrW3viF2Rm4NtVoAASpr7jq4tsesnfejoHP5sKnG
   Pwlnf6NM4J328s/EP0bZknnpH7XA1J7UPekFGw9XbOsO6l/ZFBeVYxRa9
   Xc+isar1qsS0JSpJFdOPxEHbOAar19SOt3oO0M9AtsGUr9Iqpwr/cxIfj
   za/2sRGrUse9Gny2ATpJW9Wn237m8NM60sE/lCMx5U0ZcJqTDfTSkt7Ld
   8Po7MF+ljdFJsda0msr051OP44VmUYhKCHA1jmy7pjBExcJNuAA58tAdg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="326020471"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="326020471"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 02:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="757631299"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="757631299"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Apr 2023 02:58:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqsy3-000iLm-0f;
	Mon, 24 Apr 2023 09:58:43 +0000
Date: Mon, 24 Apr 2023 17:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v6 2/2] net: ti: icssg-prueth: Add ICSSG ethernet
 driver
Message-ID: <202304241747.hwcC64PX-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.3 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/MD-Danish-Anwar/dt-bindings-net-Add-ICSSG-Ethernet/20230424-133456
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230424053233.2338782-3-danishanwar%40ti.com
patch subject: [RFC PATCH v6 2/2] net: ti: icssg-prueth: Add ICSSG ethernet driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230424/202304241747.hwcC64PX-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/ti/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304241747.hwcC64PX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/icssg_prueth.c: In function 'prueth_netdev_init':
   drivers/net/ethernet/ti/icssg_prueth.c:1327:15: error: implicit declaration of function 'pruss_request_mem_region'; did you mean 'devm_request_mem_region'? [-Werror=implicit-function-declaration]
    1327 |         ret = pruss_request_mem_region(prueth->pruss,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               devm_request_mem_region
   drivers/net/ethernet/ti/icssg_prueth.c:1411:9: error: implicit declaration of function 'pruss_release_mem_region'; did you mean 'devm_release_mem_region'? [-Werror=implicit-function-declaration]
    1411 |         pruss_release_mem_region(prueth->pruss, &emac->dram);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         devm_release_mem_region
   drivers/net/ethernet/ti/icssg_prueth.c: In function 'prueth_probe':
   drivers/net/ethernet/ti/icssg_prueth.c:1600:17: error: implicit declaration of function 'pruss_get'; did you mean 'css_get'? [-Werror=implicit-function-declaration]
    1600 |         pruss = pruss_get(eth0_node ?
         |                 ^~~~~~~~~
         |                 css_get
>> drivers/net/ethernet/ti/icssg_prueth.c:1600:15: warning: assignment to 'struct pruss *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1600 |         pruss = pruss_get(eth0_node ?
         |               ^
   drivers/net/ethernet/ti/icssg_prueth.c:1614:17: error: implicit declaration of function 'pruss_put'; did you mean 'css_put'? [-Werror=implicit-function-declaration]
    1614 |                 pruss_put(prueth->pruss);
         |                 ^~~~~~~~~
         |                 css_put
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/ti/icssg_config.c: In function 'icssg_miig_queues_init':
>> drivers/net/ethernet/ti/icssg_config.c:176:20: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     176 |                 mp = &hwq_map[slice][j];
         |                    ^
   drivers/net/ethernet/ti/icssg_config.c: In function 'icssg_config':
   drivers/net/ethernet/ti/icssg_config.c:347:9: error: implicit declaration of function 'pruss_cfg_gpimode' [-Werror=implicit-function-declaration]
     347 |         pruss_cfg_gpimode(prueth->pruss, prueth->pru_id[slice],
         |         ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg_config.c:348:27: error: 'PRUSS_GPI_MODE_MII' undeclared (first use in this function)
     348 |                           PRUSS_GPI_MODE_MII);
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg_config.c:348:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/ti/icssg_config.c:351:9: error: implicit declaration of function 'pruss_cfg_xfr_enable' [-Werror=implicit-function-declaration]
     351 |         pruss_cfg_xfr_enable(prueth->pruss, PRU_TYPE_PRU, true);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg_config.c:351:45: error: 'PRU_TYPE_PRU' undeclared (first use in this function); did you mean 'IRQ_TYPE_PROBE'?
     351 |         pruss_cfg_xfr_enable(prueth->pruss, PRU_TYPE_PRU, true);
         |                                             ^~~~~~~~~~~~
         |                                             IRQ_TYPE_PROBE
   drivers/net/ethernet/ti/icssg_config.c:352:45: error: 'PRU_TYPE_RTU' undeclared (first use in this function)
     352 |         pruss_cfg_xfr_enable(prueth->pruss, PRU_TYPE_RTU, true);
         |                                             ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1600 drivers/net/ethernet/ti/icssg_prueth.c

  1504	
  1505	static int prueth_probe(struct platform_device *pdev)
  1506	{
  1507		struct prueth *prueth;
  1508		struct device *dev = &pdev->dev;
  1509		struct device_node *np = dev->of_node;
  1510		struct device_node *eth_ports_node;
  1511		struct device_node *eth_node;
  1512		struct device_node *eth0_node, *eth1_node;
  1513		const struct of_device_id *match;
  1514		struct pruss *pruss;
  1515		int i, ret;
  1516		u32 msmc_ram_size;
  1517		struct genpool_data_align gp_data = {
  1518			.align = SZ_64K,
  1519		};
  1520	
  1521		match = of_match_device(prueth_dt_match, dev);
  1522		if (!match)
  1523			return -ENODEV;
  1524	
  1525		prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
  1526		if (!prueth)
  1527			return -ENOMEM;
  1528	
  1529		dev_set_drvdata(dev, prueth);
  1530		prueth->pdev = pdev;
  1531		prueth->pdata = *(const struct prueth_pdata *)match->data;
  1532	
  1533		prueth->dev = dev;
  1534		eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
  1535		if (!eth_ports_node)
  1536			return -ENOENT;
  1537	
  1538		for_each_child_of_node(eth_ports_node, eth_node) {
  1539			u32 reg;
  1540	
  1541			if (strcmp(eth_node->name, "port"))
  1542				continue;
  1543			ret = of_property_read_u32(eth_node, "reg", &reg);
  1544			if (ret < 0) {
  1545				dev_err(dev, "%pOF error reading port_id %d\n",
  1546					eth_node, ret);
  1547			}
  1548	
  1549			of_node_get(eth_node);
  1550	
  1551			if (reg == 0)
  1552				eth0_node = eth_node;
  1553			else if (reg == 1)
  1554				eth1_node = eth_node;
  1555			else
  1556				dev_err(dev, "port reg should be 0 or 1\n");
  1557		}
  1558	
  1559		of_node_put(eth_ports_node);
  1560	
  1561		/* At least one node must be present and available else we fail */
  1562		if (!eth0_node && !eth1_node) {
  1563			dev_err(dev, "neither port0 nor port1 node available\n");
  1564			return -ENODEV;
  1565		}
  1566	
  1567		if (eth0_node == eth1_node) {
  1568			dev_err(dev, "port0 and port1 can't have same reg\n");
  1569			of_node_put(eth0_node);
  1570			return -ENODEV;
  1571		}
  1572	
  1573		prueth->eth_node[PRUETH_MAC0] = eth0_node;
  1574		prueth->eth_node[PRUETH_MAC1] = eth1_node;
  1575	
  1576		prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
  1577		if (IS_ERR(prueth->miig_rt)) {
  1578			dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
  1579			return -ENODEV;
  1580		}
  1581	
  1582		prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
  1583		if (IS_ERR(prueth->mii_rt)) {
  1584			dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
  1585			return -ENODEV;
  1586		}
  1587	
  1588		if (eth0_node) {
  1589			ret = prueth_get_cores(prueth, ICSS_SLICE0);
  1590			if (ret)
  1591				goto put_cores;
  1592		}
  1593	
  1594		if (eth1_node) {
  1595			ret = prueth_get_cores(prueth, ICSS_SLICE1);
  1596			if (ret)
  1597				goto put_cores;
  1598		}
  1599	
> 1600		pruss = pruss_get(eth0_node ?
  1601				  prueth->pru[ICSS_SLICE0] : prueth->pru[ICSS_SLICE1]);
  1602		if (IS_ERR(pruss)) {
  1603			ret = PTR_ERR(pruss);
  1604			dev_err(dev, "unable to get pruss handle\n");
  1605			goto put_cores;
  1606		}
  1607	
  1608		prueth->pruss = pruss;
  1609	
  1610		ret = pruss_request_mem_region(pruss, PRUSS_MEM_SHRD_RAM2,
  1611					       &prueth->shram);
  1612		if (ret) {
  1613			dev_err(dev, "unable to get PRUSS SHRD RAM2: %d\n", ret);
  1614			pruss_put(prueth->pruss);
  1615		}
  1616	
  1617		prueth->sram_pool = of_gen_pool_get(np, "sram", 0);
  1618		if (!prueth->sram_pool) {
  1619			dev_err(dev, "unable to get SRAM pool\n");
  1620			ret = -ENODEV;
  1621	
  1622			goto put_mem;
  1623		}
  1624	
  1625		msmc_ram_size = MSMC_RAM_SIZE;
  1626	
  1627		/* NOTE: FW bug needs buffer base to be 64KB aligned */
  1628		prueth->msmcram.va =
  1629			(void __iomem *)gen_pool_alloc_algo(prueth->sram_pool,
  1630							    msmc_ram_size,
  1631							    gen_pool_first_fit_align,
  1632							    &gp_data);
  1633	
  1634		if (!prueth->msmcram.va) {
  1635			ret = -ENOMEM;
  1636			dev_err(dev, "unable to allocate MSMC resource\n");
  1637			goto put_mem;
  1638		}
  1639		prueth->msmcram.pa = gen_pool_virt_to_phys(prueth->sram_pool,
  1640							   (unsigned long)prueth->msmcram.va);
  1641		prueth->msmcram.size = msmc_ram_size;
  1642		memset(prueth->msmcram.va, 0, msmc_ram_size);
  1643		dev_dbg(dev, "sram: pa %llx va %p size %zx\n", prueth->msmcram.pa,
  1644			prueth->msmcram.va, prueth->msmcram.size);
  1645	
  1646		/* setup netdev interfaces */
  1647		if (eth0_node) {
  1648			ret = prueth_netdev_init(prueth, eth0_node);
  1649			if (ret) {
  1650				dev_err_probe(dev, ret, "netdev init %s failed\n",
  1651					      eth0_node->name);
  1652				goto netdev_exit;
  1653			}
  1654		}
  1655	
  1656		if (eth1_node) {
  1657			ret = prueth_netdev_init(prueth, eth1_node);
  1658			if (ret) {
  1659				dev_err_probe(dev, ret, "netdev init %s failed\n",
  1660					      eth1_node->name);
  1661				goto netdev_exit;
  1662			}
  1663		}
  1664	
  1665		/* register the network devices */
  1666		if (eth0_node) {
  1667			ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
  1668			if (ret) {
  1669				dev_err(dev, "can't register netdev for port MII0");
  1670				goto netdev_exit;
  1671			}
  1672	
  1673			prueth->registered_netdevs[PRUETH_MAC0] = prueth->emac[PRUETH_MAC0]->ndev;
  1674	
  1675			emac_phy_connect(prueth->emac[PRUETH_MAC0]);
  1676			phy_attached_info(prueth->emac[PRUETH_MAC0]->ndev->phydev);
  1677		}
  1678	
  1679		if (eth1_node) {
  1680			ret = register_netdev(prueth->emac[PRUETH_MAC1]->ndev);
  1681			if (ret) {
  1682				dev_err(dev, "can't register netdev for port MII1");
  1683				goto netdev_unregister;
  1684			}
  1685	
  1686			prueth->registered_netdevs[PRUETH_MAC1] = prueth->emac[PRUETH_MAC1]->ndev;
  1687			emac_phy_connect(prueth->emac[PRUETH_MAC1]);
  1688			phy_attached_info(prueth->emac[PRUETH_MAC1]->ndev->phydev);
  1689		}
  1690	
  1691		dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
  1692			 (!eth0_node || !eth1_node) ? "single" : "dual");
  1693	
  1694		if (eth1_node)
  1695			of_node_put(eth1_node);
  1696		if (eth0_node)
  1697			of_node_put(eth0_node);
  1698		return 0;
  1699	
  1700	netdev_unregister:
  1701		for (i = 0; i < PRUETH_NUM_MACS; i++) {
  1702			if (!prueth->registered_netdevs[i])
  1703				continue;
  1704			if (prueth->emac[i]->ndev->phydev) {
  1705				phy_disconnect(prueth->emac[i]->ndev->phydev);
  1706				prueth->emac[i]->ndev->phydev = NULL;
  1707			}
  1708			unregister_netdev(prueth->registered_netdevs[i]);
  1709		}
  1710	
  1711	netdev_exit:
  1712		for (i = 0; i < PRUETH_NUM_MACS; i++) {
  1713			eth_node = prueth->eth_node[i];
  1714			if (!eth_node)
  1715				continue;
  1716	
  1717			prueth_netdev_exit(prueth, eth_node);
  1718		}
  1719	
  1720		gen_pool_free(prueth->sram_pool,
  1721			      (unsigned long)prueth->msmcram.va, msmc_ram_size);
  1722	
  1723	put_mem:
  1724		pruss_release_mem_region(prueth->pruss, &prueth->shram);
  1725		pruss_put(prueth->pruss);
  1726	
  1727	put_cores:
  1728		if (eth1_node) {
  1729			prueth_put_cores(prueth, ICSS_SLICE1);
  1730			of_node_put(eth1_node);
  1731		}
  1732	
  1733		if (eth0_node) {
  1734			prueth_put_cores(prueth, ICSS_SLICE0);
  1735			of_node_put(eth0_node);
  1736		}
  1737	
  1738		return ret;
  1739	}
  1740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
