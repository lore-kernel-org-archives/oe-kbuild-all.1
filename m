Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EBC17EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 06:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnpz6Bo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702794753; x=1734330753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Of5NTlsssQefIpbn/Pm4my7yG923qi8X/xr1ANyoR8E=;
  b=fnpz6Bo8qsPQkCD/meDdgtlwb4T8qyO+uFNMhf7KXQgWvuIXKhsCftl1
   QGiaiM+WmrtnyYl36+3gO4gxCUvu2wDvU6b2kLTlfiDkRcVgQ86b2Qko6
   +UGziyvRJnsJ5wrY7g2EB9zpVy8kuAkJv+R7aZ+QqeavpyvwZ1LZVOYqv
   kygVDzBVdgqNzQU/EgArZp3XoFSGw0Z23QUXcTkQ0bHPVNf5GuTdtrwiJ
   /9lgSZzy/WlrIppWce3Gpa+Mg4LyFyIn9hAWQjqjffyrNsCXEa1JsFvVC
   8LdNoFAJGtPQ6WVrF8lv6cl+5oeeL4pyelCkKOCTEgiCxmNhMbkqxVoJL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="395139716"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="395139716"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 22:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="778730042"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="778730042"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2023 22:32:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEkhR-0002l2-1O;
	Sun, 17 Dec 2023 06:32:29 +0000
Date: Sun, 17 Dec 2023 14:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4300/16025]
 drivers/net/ethernet/freescale/fman/mac.c:359:13: warning: format specifies
 type 'unsigned long long' but the argument has type 'resource_size_t' (aka
 'unsigned int')
Message-ID: <202312171406.LYzOI1Bb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 9eddcd885aeb305820f06e648271f50ceb6b1db3 [4300/16025] fsl/fman: add MAC ACPI support
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171406.LYzOI1Bb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171406.LYzOI1Bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171406.LYzOI1Bb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/fman/mac.c:359:13: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   __func__, mac_dev->res->start, resource_size(mac_dev->res));
                             ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/net/ethernet/freescale/fman/mac.c:359:34: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   __func__, mac_dev->res->start, resource_size(mac_dev->res));
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   2 warnings generated.


vim +359 drivers/net/ethernet/freescale/fman/mac.c

   279	
   280	static int acpi_mac_probe(struct platform_device *pdev)
   281	{
   282		int			err, i, nph;
   283		int (*init)(struct mac_device *mac_dev, struct device_node *mac_node,
   284			    struct fman_mac_params *params);
   285		struct device		*dev;
   286		struct device_node	*mac_node;
   287		struct mac_device	*mac_dev;
   288		struct mac_priv_s	*priv;
   289		u32			val;
   290		u8			fman_id;
   291		phy_interface_t		phy_if;
   292		struct device		*fman_dev = NULL;
   293		struct fwnode_handle	*fman_fwnode = NULL;
   294		struct device		*fman_port_dev = NULL;
   295		/* firmware node references */
   296		struct fwnode_reference_args args;
   297		struct fman_mac_params	 params;
   298	
   299		dev = &pdev->dev;
   300	
   301		mac_node = dev->of_node;
   302		init = device_get_match_data(dev);
   303	
   304		mac_dev = devm_kzalloc(dev, sizeof(*mac_dev), GFP_KERNEL);
   305		if (!mac_dev) {
   306			err = -ENOMEM;
   307			goto _return;
   308		}
   309		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   310		if (!priv) {
   311			err = -ENOMEM;
   312			goto _return;
   313		}
   314	
   315		/* Save private information */
   316		mac_dev->priv = priv;
   317		mac_dev->dev = dev;
   318	
   319		INIT_LIST_HEAD(&priv->mc_addr_list);
   320	
   321		/* Get the FM node */
   322		fman_fwnode = fwnode_get_parent(dev->fwnode);
   323		if (!fman_fwnode) {
   324			err = -EINVAL;
   325			dev_err(dev, "%s : fetch fman node failed\n", __func__);
   326			goto _return;
   327		}
   328		if (fwnode_property_read_u32(fman_fwnode, "cell-index", &val)) {
   329			err = -EINVAL;
   330			goto _return;
   331		}
   332	
   333		/* cell-index 0 => FMan id 1 */
   334		fman_id = (u8)(val + 1);
   335	
   336		fman_dev = bus_find_device(&platform_bus_type, NULL, fman_fwnode,
   337					   fwnode_match_devnode);
   338		if (!fman_dev) {
   339			dev_err(dev, "%s : bus_find_device failed\n", __func__);
   340			err = -ENODEV;
   341			goto _return;
   342		}
   343	
   344		priv->fman = fman_bind(fman_dev);
   345		if (!priv->fman) {
   346			dev_err(dev, "%s : fman_bind failed\n", __func__);
   347			err = -ENODEV;
   348			goto _return;
   349		}
   350	
   351		/* Get the address of the memory mapped registers */
   352		mac_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   353		if (!mac_dev->res) {
   354			dev_err(dev, "%s: Can't get MAC memory resource\n",  __func__);
   355			err = -EINVAL;
   356			goto _return;
   357		}
   358		dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
 > 359			__func__, mac_dev->res->start, resource_size(mac_dev->res));
   360	
   361		mac_dev->vaddr = ioremap(mac_dev->res->start, resource_size(mac_dev->res));
   362		if (!mac_dev->vaddr) {
   363			dev_err(dev, "%s : ioremap() failed\n", __func__);
   364			err = -EIO;
   365			goto _return;
   366		}
   367	
   368		if (!fwnode_device_is_available(dev->fwnode)) {
   369			err = -ENODEV;
   370			goto _return;
   371		}
   372	
   373		/* Get the cell-index */
   374		if (device_property_read_u32(dev, "cell-index", &val)) {
   375			dev_err(dev, "%s : failed to read cell-index\n", __func__);
   376			err = -EINVAL;
   377			goto _return;
   378		}
   379		priv->cell_index = (u8)val;
   380	
   381		/* Get the MAC address */
   382		device_get_mac_address(dev, mac_dev->addr);
   383	
   384		/* Get the port handles */
   385		nph = device_property_count_u32(dev, "fsl,fman-ports");
   386	
   387		if (unlikely(nph < 0)) {
   388			dev_err(dev, "%s : reading port count failed\n", __func__);
   389			err = nph;
   390			goto _return;
   391		}
   392	
   393		if (nph != ARRAY_SIZE(mac_dev->port)) {
   394			dev_err(dev, "Not supported number of fman-ports handles of mac node from DSD property\n");
   395			err = -EINVAL;
   396			goto _return;
   397		}
   398	
   399		for (i = 0; i < ARRAY_SIZE(mac_dev->port); i++) {
   400			/* Find the port node */
   401			struct fwnode_handle *fw_node =
   402				acpi_fwnode_handle(ACPI_COMPANION(dev));
   403			err = acpi_node_get_property_reference(fw_node, "fsl,fman-ports",
   404							       i, &args);
   405			if (ACPI_FAILURE(err) ||
   406			    !is_acpi_device_node(args.fwnode)) {
   407				dev_err(dev, "%s : reading fsl,fman-ports handle failed\n",
   408					__func__);
   409				goto _return;
   410			}
   411	
   412			/* Bind to a specific FMan Port */
   413			fman_port_dev = bus_find_device(&platform_bus_type, NULL,
   414							args.fwnode,
   415							fwnode_match_devnode);
   416			if (!fman_port_dev) {
   417				dev_err(dev, "%s : bus_find_device failed\n", __func__);
   418				err = -ENODEV;
   419				goto _return;
   420			}
   421	
   422			mac_dev->port[i] = fman_port_bind(fman_port_dev);
   423		}
   424	
   425		/* Get the PHY connection type */
   426		phy_if = fwnode_get_phy_mode(dev->fwnode);
   427		if (phy_if < 0) {
   428			dev_warn(dev, "fwnode_get_phy_mode failed. Defaulting to SGMII\n");
   429			phy_if = PHY_INTERFACE_MODE_SGMII;
   430		}
   431		mac_dev->phy_if = phy_if;
   432	
   433		priv->speed		= phy2speed[mac_dev->phy_if];
   434		params.max_speed	= priv->speed;
   435		mac_dev->if_support	= DTSEC_SUPPORTED;
   436		/* We don't support half-duplex in SGMII mode */
   437		if (mac_dev->phy_if == PHY_INTERFACE_MODE_SGMII)
   438			mac_dev->if_support &= ~(SUPPORTED_10baseT_Half |
   439						 SUPPORTED_100baseT_Half);
   440	
   441		/* Gigabit support (no half-duplex) */
   442		if (params.max_speed == 1000)
   443			mac_dev->if_support |= SUPPORTED_1000baseT_Full;
   444	
   445		/* The 10G interface only supports one mode */
   446		if (mac_dev->phy_if == PHY_INTERFACE_MODE_XGMII)
   447			mac_dev->if_support = SUPPORTED_10000baseT_Full;
   448	
   449		/* Get the rest of the PHY information */
   450		mac_dev->fwnode_phy =
   451			fwnode_find_reference(dev->fwnode, "phy-handle", 0);
   452		if (IS_ERR_OR_NULL(mac_dev->fwnode_phy) &&
   453		    fwnode_property_present(dev->fwnode, "fixed-link")) {
   454			dev_err(dev, "%s : No fixed-link phy support available.\n",
   455				__func__);
   456			goto _return;
   457		}
   458	
   459		params.basex_if		= false;
   460		params.mac_id		= priv->cell_index;
   461		params.fm		= (void *)priv->fman;
   462		params.exception_cb	= mac_exception;
   463		params.event_cb		= mac_exception;
   464	
   465		err = init(mac_dev, mac_node, &params);
   466		if (err < 0) {
   467			dev_err(dev, "%s: mac_dev->init() = %d\n", __func__, err);
   468			goto _return;
   469		}
   470	
   471		/* pause frame autonegotiation enabled */
   472		mac_dev->autoneg_pause = true;
   473	
   474		/* By intializing the values to false, force FMD to enable PAUSE frames
   475		 * on RX and TX
   476		 */
   477		mac_dev->rx_pause_req = true;
   478		mac_dev->tx_pause_req = true;
   479		mac_dev->rx_pause_active = false;
   480		mac_dev->tx_pause_active = false;
   481		err = fman_set_mac_active_pause(mac_dev, true, true);
   482		if (err < 0)
   483			dev_err(dev, "%s : fman_set_mac_active_pause() = %d\n",
   484				__func__, err);
   485	
   486		if (!is_zero_ether_addr(mac_dev->addr))
   487			dev_info(dev, "FMan MAC address: %pM\n", mac_dev->addr);
   488	
   489		priv->eth_dev = dpaa_eth_add_device(fman_id, mac_dev);
   490		if (IS_ERR(priv->eth_dev)) {
   491			dev_err(dev, "%s : failed to add Ethernet platform device for MAC %d\n",
   492				__func__, priv->cell_index);
   493			priv->eth_dev = NULL;
   494		}
   495	
   496		goto _return;
   497	
   498	_return:
   499		return err;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
