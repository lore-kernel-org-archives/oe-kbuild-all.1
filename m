Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314861170F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693493696; x=1725029696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NZsXSBAtwLWJeZ9iT/dHpvVYTT/o6Z447/Knd0tyFWE=;
  b=FzmNaKqSlYLgjFwVRhFRsS6J4RerWr/MyYxIRsdAxisIhklMfYlaMIKp
   LnkGjkw8BjL0R2MSMzw/7T8evG/PclUhysNBagSsqepAJKixdY+VxwXzi
   P5mjagOqoEB3nd+1Dkn+aOlePjWggr1qT0oPhsye4N4JGkMq1ec2WMSDB
   Bn4uYi4uVpi9qI/ElrC+Xq1kQRTv6NIbG933A2rQIsnwwXEWaxCDcFdFJ
   FVyL0n2YgC/iz36zIONFaInK/62tHPevIQLOJTAEPhAlZxgCeerbuCpDJ
   Bx0lAgfI9tYIxzP55kAWqFZsJFdBHXxouzh/AoxzkfO9zXI+H3gL4bg9U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356279881"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="356279881"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733135597"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="733135597"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Aug 2023 07:54:53 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbj4N-0000GC-17;
	Thu, 31 Aug 2023 14:54:51 +0000
Date: Thu, 31 Aug 2023 22:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 12691/24604]
 drivers/net/ethernet/freescale/fman/mac.c:719:13: warning: format specifies
 type 'unsigned long long' but the argument has type 'resource_size_t' (aka
 'unsigned int')
Message-ID: <202308312239.HhcJvLeT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi AnjanaSuraj,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: e849f19f9a2a7ece693148fa16ca9589cba09eee [12691/24604] fsl/fman: add MAC ACPI support
config: powerpc-randconfig-r023-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312239.HhcJvLeT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312239.HhcJvLeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312239.HhcJvLeT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/fman/mac.c:719:13: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   __func__, res.start, resource_size(mem_res));
                             ^~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   drivers/net/ethernet/freescale/fman/mac.c:719:24: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   __func__, res.start, resource_size(mem_res));
                                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
>> drivers/net/ethernet/freescale/fman/mac.c:860:36: warning: unused variable 'mac_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id mac_acpi_match[] = {
                                      ^
   3 warnings generated.


vim +719 drivers/net/ethernet/freescale/fman/mac.c

   619	
   620	static int acpi_mac_probe(struct platform_device *pdev)
   621	{
   622		int			err, i, nph;
   623		struct device		*dev;
   624		struct mac_device	*mac_dev;
   625		struct resource		res;
   626		struct mac_priv_s	*priv;
   627		const u8		*mac_addr;
   628		u32			val;
   629		u8			fman_id;
   630		phy_interface_t		phy_if;
   631		struct resource		*mem_res;
   632		u8			macbuff[ETH_ALEN];
   633		const char		*cp = NULL;
   634		struct device		*fman_dev = NULL;
   635		struct fwnode_handle	*fman_fwnode = NULL;
   636		struct device		*fman_port_dev = NULL;
   637		/* firmware node references */
   638		struct fwnode_reference_args args;
   639	
   640		dev = &pdev->dev;
   641	
   642		mac_dev = devm_kzalloc(dev, sizeof(*mac_dev), GFP_KERNEL);
   643		if (!mac_dev) {
   644			err = -ENOMEM;
   645			goto _return;
   646		}
   647		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   648		if (!priv) {
   649			err = -ENOMEM;
   650			goto _return;
   651		}
   652	
   653		/* Save private information */
   654		mac_dev->priv = priv;
   655		priv->dev = dev;
   656	
   657		fwnode_property_read_string(dev->fwnode, "compatible", &cp);
   658	
   659		if (!strcmp(cp, "fman-memac")) {
   660			setup_memac(mac_dev);
   661			priv->internal_phy_fwnode = fwnode_find_reference(dev->fwnode,
   662									  "pcsphy-handle", 0);
   663		} else if (!strcmp(cp, "fman-xgec")) {
   664			setup_tgec(mac_dev);
   665		} else if (!strcmp(cp, "fman-dtsec")) {
   666			setup_dtsec(mac_dev);
   667			priv->internal_phy_fwnode = fwnode_find_reference(dev->fwnode,
   668									  "tbi-handle", 0);
   669		} else {
   670			dev_err(dev, "%s : MAC node contains unsupported MAC\n",
   671				__func__);
   672			err = -EINVAL;
   673			goto _return;
   674		}
   675	
   676		INIT_LIST_HEAD(&priv->mc_addr_list);
   677	
   678		/* Get the FM node */
   679		fman_fwnode = fwnode_get_parent(dev->fwnode);
   680		if (!fman_fwnode) {
   681			err = -EINVAL;
   682			dev_err(dev, "%s : fetch fman node failed\n", __func__);
   683			goto _return;
   684		}
   685		if (fwnode_property_read_u32(fman_fwnode, "cell-index", &val)) {
   686			err = -EINVAL;
   687			goto _return;
   688		}
   689	
   690		/* cell-index 0 => FMan id 1 */
   691		fman_id = (u8)(val + 1);
   692	
   693		fman_dev = bus_find_device(&platform_bus_type, NULL, fman_fwnode,
   694					   fwnode_match_devnode);
   695		if (!fman_dev) {
   696			dev_err(dev, "%s : bus_find_device failed\n", __func__);
   697			err = -ENODEV;
   698			goto _return;
   699		}
   700	
   701		priv->fman = fman_bind(fman_dev);
   702		if (!priv->fman) {
   703			dev_err(dev, "%s : fman_bind failed\n", __func__);
   704			err = -ENODEV;
   705			goto _return;
   706		}
   707	
   708		/* Get the address of the memory mapped registers */
   709		mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   710		if (!mem_res) {
   711			dev_err(dev, "%s: Can't get MAC memory resource\n",
   712				__func__);
   713			err = -EINVAL;
   714			goto _return;
   715		}
   716		res.start = mem_res->start;
   717		res.end = mem_res->end;
   718		dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
 > 719			__func__, res.start, resource_size(mem_res));
   720		mac_dev->res = mem_res;
   721	
   722		priv->vaddr = ioremap(mac_dev->res->start, resource_size(mac_dev->res));
   723		if (!priv->vaddr) {
   724			dev_err(dev, "%s : ioremap() failed\n", __func__);
   725			err = -EIO;
   726			goto _return;
   727		}
   728	
   729		if (!fwnode_device_is_available(dev->fwnode)) {
   730			err = -ENODEV;
   731			goto _return;
   732		}
   733	
   734		/* Get the cell-index */
   735		if (device_property_read_u32(dev, "cell-index", &val)) {
   736			dev_err(dev, "%s : failed to read cell-index\n", __func__);
   737			err = -EINVAL;
   738			goto _return;
   739		}
   740		priv->cell_index = (u8)val;
   741	
   742		/* Get the MAC address */
   743		if (device_get_mac_address(dev, macbuff, ETH_ALEN)) {
   744			mac_addr = macbuff;
   745			ether_addr_copy(mac_dev->addr, mac_addr);
   746		}
   747	
   748		/* Get the port handles */
   749		nph = device_property_count_u32(dev, "fsl,fman-ports");
   750	
   751		if (unlikely(nph < 0)) {
   752			dev_err(dev, "%s : reading port count failed\n", __func__);
   753			err = nph;
   754			goto _return;
   755		}
   756	
   757		if (nph != ARRAY_SIZE(mac_dev->port)) {
   758			dev_err(dev, "Not supported number of fman-ports handles of mac node from DSD property\n");
   759			err = -EINVAL;
   760			goto _return;
   761		}
   762	
   763		for (i = 0; i < ARRAY_SIZE(mac_dev->port); i++) {
   764			/* Find the port node */
   765			struct fwnode_handle *fw_node =
   766				acpi_fwnode_handle(ACPI_COMPANION(dev));
   767			err = acpi_node_get_property_reference(fw_node, "fsl,fman-ports",
   768							       i, &args);
   769			if (ACPI_FAILURE(err) ||
   770			    !is_acpi_device_node(args.fwnode)) {
   771				dev_err(dev, "%s : reading fsl,fman-ports handle failed\n",
   772					__func__);
   773				goto _return;
   774			}
   775	
   776			/* Bind to a specific FMan Port */
   777			fman_port_dev = bus_find_device(&platform_bus_type, NULL,
   778							args.fwnode,
   779							fwnode_match_devnode);
   780			if (!fman_port_dev) {
   781				dev_err(dev, "%s : bus_find_device failed\n", __func__);
   782				err = -ENODEV;
   783				goto _return;
   784			}
   785	
   786			mac_dev->port[i] = fman_port_bind(fman_port_dev);
   787		}
   788	
   789		/* Get the PHY connection type */
   790		phy_if = fwnode_get_phy_mode(dev->fwnode);
   791		if (phy_if < 0) {
   792			dev_warn(dev, "fwnode_get_phy_mode failed. Defaulting to SGMII\n");
   793			phy_if = PHY_INTERFACE_MODE_SGMII;
   794		}
   795		mac_dev->phy_if = phy_if;
   796	
   797		priv->speed		= phy2speed[mac_dev->phy_if];
   798		priv->max_speed		= priv->speed;
   799		mac_dev->if_support	= DTSEC_SUPPORTED;
   800	
   801		/* We don't support half-duplex in SGMII mode */
   802		if (mac_dev->phy_if == PHY_INTERFACE_MODE_SGMII)
   803			mac_dev->if_support &= ~(SUPPORTED_10baseT_Half |
   804					SUPPORTED_100baseT_Half);
   805	
   806		/* Gigabit support (no half-duplex) */
   807		if (priv->max_speed == 1000)
   808			mac_dev->if_support |= SUPPORTED_1000baseT_Full;
   809	
   810		/* The 10G interface only supports one mode */
   811		if (mac_dev->phy_if == PHY_INTERFACE_MODE_XGMII)
   812			mac_dev->if_support = SUPPORTED_10000baseT_Full;
   813	
   814		/* Get the rest of the PHY information */
   815		mac_dev->fwnode_phy =
   816			fwnode_find_reference(dev->fwnode, "phy-handle", 0);
   817		if (IS_ERR_OR_NULL(mac_dev->fwnode_phy) &&
   818		    fwnode_property_present(dev->fwnode, "fixed-link")) {
   819			dev_err(dev, "%s : No fixed-link phy support available.\n",
   820				__func__);
   821			goto _return;
   822		}
   823	
   824		err = mac_dev->init(mac_dev);
   825		if (err < 0) {
   826			dev_err(dev, "%s : mac_dev->init() = %d\n", __func__, err);
   827			goto _return;
   828		}
   829	
   830		/* pause frame autonegotiation enabled */
   831		mac_dev->autoneg_pause = true;
   832	
   833		/* By intializing the values to false, force FMD to enable PAUSE frames
   834		 * on RX and TX
   835		 */
   836		mac_dev->rx_pause_req = true;
   837		mac_dev->tx_pause_req = true;
   838		mac_dev->rx_pause_active = false;
   839		mac_dev->tx_pause_active = false;
   840		err = fman_set_mac_active_pause(mac_dev, true, true);
   841		if (err < 0)
   842			dev_err(dev, "%s : fman_set_mac_active_pause() = %d\n",
   843				__func__, err);
   844	
   845		dev_info(dev, "FMan MAC address: %pM\n", mac_dev->addr);
   846	
   847		priv->eth_dev = dpaa_eth_add_device(fman_id, mac_dev);
   848		if (IS_ERR(priv->eth_dev)) {
   849			dev_err(dev, "%s : failed to add Ethernet platform device for MAC %d\n",
   850				__func__, priv->cell_index);
   851			priv->eth_dev = NULL;
   852		}
   853	
   854		goto _return;
   855	
   856	_return:
   857		return err;
   858	}
   859	
 > 860	static const struct acpi_device_id mac_acpi_match[] = {
   861		{"NXP0025", 0}
   862	};
   863	MODULE_DEVICE_TABLE(acpi, mac_acpi_match);
   864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
