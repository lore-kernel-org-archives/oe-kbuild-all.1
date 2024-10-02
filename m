Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DDE15252D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899358; cv=none; b=s5HaC5fsKkfQP/cnzZhd2tSejHRvYkJM+tvhGbBfb7y2jOFtfMh7ekywjzGpYw5rTWvYmNT2nLRISY3EFcpfwPezLGs4Z1g4OR9JRYk+pI6nZNcEjv7iSZECmXjIRg3Q2rhpoNNH/bNpPxT2IFNlq442AviNrEjJMi3GVcIRNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899358; c=relaxed/simple;
	bh=MmOCNjyColSDOlq391dzeXo5AjRxgGqSkQlmuDsDDPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FJgubOVhpqo6DruleShhv6MZom+3DDagJ89Z2rpIZPBSWcy6e1envwdZQJyaULVz4imB3Cz7/bPS/srX3sXXkvUU4dg5GDBIub7MTzqFDq/QSRAl1blQE5yuFdayfFQimLobfcM2fwB2Kpn1pZhU1u+jBBUo3t2b+tbxlLPzfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LO2y6557; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LO2y6557"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727899357; x=1759435357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmOCNjyColSDOlq391dzeXo5AjRxgGqSkQlmuDsDDPk=;
  b=LO2y6557Xo8eqTSj9b6xYCdrXTLt4sy6VhUZ2wjn5R5dpRl2CRyrSRwW
   +PuHSqPQIFfHJlN0qdYE3+CSutpKyp5+TNNbbbbBQ3nNRN6a6qb4XqYut
   61gDXflsZxKINsPQs3LyZ7u39QsJkbBfEjJ13x4hYyv2gpkwk0tniiPtw
   tf670XxXOYfVxsHJYbTqfjOS70MDmfIcH0tEN5d9SStSaufAgQUpb37Td
   iIGltQ0nYTq/orBNVAURbUQKxKzvPBjLbxND6WIxtxd4tIbo6p7gU9/tQ
   uwOn6pUMjON/IztEpy5GTA1GYMugATwNDNFcarFBjxPFv/ArfZ8Wr3/jW
   Q==;
X-CSE-ConnectionGUID: K7jlyoA7QcSAIycCu+7Z1w==
X-CSE-MsgGUID: bm3jEkmrQ/eAB/7dIM5Mwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38438695"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="38438695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 13:02:36 -0700
X-CSE-ConnectionGUID: OIcHqcF/SHK98a6G7IIknw==
X-CSE-MsgGUID: W1ya/+F4TCm7NobEjg+f8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74532343"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2024 13:02:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw5YO-000UVv-2V;
	Wed, 02 Oct 2024 20:02:32 +0000
Date: Thu, 3 Oct 2024 04:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4693/16788]
 drivers/net/ethernet/freescale/fman/mac.c:238:22: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 5 has type
 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202410030345.oyJWWrlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 0b01a18857fec40c9929313790beda2175f5d47d [4693/16788] fsl/fman: add MAC ACPI support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241003/202410030345.oyJWWrlA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030345.oyJWWrlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030345.oyJWWrlA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/net/ethernet/freescale/fman/mac.c:9:
   drivers/net/ethernet/freescale/fman/mac.c: In function 'acpi_mac_probe':
>> drivers/net/ethernet/freescale/fman/mac.c:238:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     238 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/net/ethernet/freescale/fman/mac.c:238:9: note: in expansion of macro 'dev_dbg'
     238 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |         ^~~~~~~
   drivers/net/ethernet/freescale/fman/mac.c:238:49: note: format string is defined here
     238 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |                                              ~~~^
         |                                                 |
         |                                                 long long unsigned int
         |                                              %x
   drivers/net/ethernet/freescale/fman/mac.c:238:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     238 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/net/ethernet/freescale/fman/mac.c:238:9: note: in expansion of macro 'dev_dbg'
     238 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |         ^~~~~~~
   drivers/net/ethernet/freescale/fman/mac.c:238:61: note: format string is defined here
     238 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |                                                          ~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                          %x


vim +238 drivers/net/ethernet/freescale/fman/mac.c

   159	
   160	static int acpi_mac_probe(struct platform_device *pdev)
   161	{
   162		int			err, i, nph;
   163		int (*init)(struct mac_device *mac_dev, struct device_node *mac_node,
   164			    struct fman_mac_params *params);
   165		struct device		*dev;
   166		struct device_node	*mac_node;
   167		struct mac_device	*mac_dev;
   168		struct mac_priv_s	*priv;
   169		u32			val;
   170		u8			fman_id;
   171		phy_interface_t		phy_if;
   172		struct device		*fman_dev = NULL;
   173		struct fwnode_handle	*fman_fwnode = NULL;
   174		struct device		*fman_port_dev = NULL;
   175		/* firmware node references */
   176		struct fwnode_reference_args args;
   177		struct fman_mac_params	 params;
   178	
   179		dev = &pdev->dev;
   180	
   181		mac_node = dev->of_node;
   182		init = device_get_match_data(dev);
   183	
   184		mac_dev = devm_kzalloc(dev, sizeof(*mac_dev), GFP_KERNEL);
   185		if (!mac_dev) {
   186			err = -ENOMEM;
   187			goto _return;
   188		}
   189		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   190		if (!priv) {
   191			err = -ENOMEM;
   192			goto _return;
   193		}
   194	
   195		/* Save private information */
   196		mac_dev->priv = priv;
   197		mac_dev->dev = dev;
   198	
   199		INIT_LIST_HEAD(&priv->mc_addr_list);
   200	
   201		/* Get the FM node */
   202		fman_fwnode = fwnode_get_parent(dev->fwnode);
   203		if (!fman_fwnode) {
   204			err = -EINVAL;
   205			dev_err(dev, "%s : fetch fman node failed\n", __func__);
   206			goto _return;
   207		}
   208		if (fwnode_property_read_u32(fman_fwnode, "cell-index", &val)) {
   209			err = -EINVAL;
   210			goto _return;
   211		}
   212	
   213		/* cell-index 0 => FMan id 1 */
   214		fman_id = (u8)(val + 1);
   215	
   216		fman_dev = bus_find_device(&platform_bus_type, NULL, fman_fwnode,
   217					   fwnode_match_devnode);
   218		if (!fman_dev) {
   219			dev_err(dev, "%s : bus_find_device failed\n", __func__);
   220			err = -ENODEV;
   221			goto _return;
   222		}
   223	
   224		priv->fman = fman_bind(fman_dev);
   225		if (!priv->fman) {
   226			dev_err(dev, "%s : fman_bind failed\n", __func__);
   227			err = -ENODEV;
   228			goto _return;
   229		}
   230	
   231		/* Get the address of the memory mapped registers */
   232		mac_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   233		if (!mac_dev->res) {
   234			dev_err(dev, "%s: Can't get MAC memory resource\n",  __func__);
   235			err = -EINVAL;
   236			goto _return;
   237		}
 > 238		dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
   239			__func__, mac_dev->res->start, resource_size(mac_dev->res));
   240	
   241		mac_dev->vaddr = ioremap(mac_dev->res->start, resource_size(mac_dev->res));
   242		if (!mac_dev->vaddr) {
   243			dev_err(dev, "%s : ioremap() failed\n", __func__);
   244			err = -EIO;
   245			goto _return;
   246		}
   247	
   248		if (!fwnode_device_is_available(dev->fwnode)) {
   249			err = -ENODEV;
   250			goto _return;
   251		}
   252	
   253		/* Get the cell-index */
   254		if (device_property_read_u32(dev, "cell-index", &val)) {
   255			dev_err(dev, "%s : failed to read cell-index\n", __func__);
   256			err = -EINVAL;
   257			goto _return;
   258		}
   259		priv->cell_index = (u8)val;
   260	
   261		/* Get the MAC address */
   262		device_get_mac_address(dev, mac_dev->addr);
   263	
   264		/* Get the port handles */
   265		nph = device_property_count_u32(dev, "fsl,fman-ports");
   266	
   267		if (unlikely(nph < 0)) {
   268			dev_err(dev, "%s : reading port count failed\n", __func__);
   269			err = nph;
   270			goto _return;
   271		}
   272	
   273		if (nph != ARRAY_SIZE(mac_dev->port)) {
   274			dev_err(dev, "Not supported number of fman-ports handles of mac node from DSD property\n");
   275			err = -EINVAL;
   276			goto _return;
   277		}
   278	
   279		for (i = 0; i < ARRAY_SIZE(mac_dev->port); i++) {
   280			/* Find the port node */
   281			struct fwnode_handle *fw_node =
   282				acpi_fwnode_handle(ACPI_COMPANION(dev));
   283			err = acpi_node_get_property_reference(fw_node, "fsl,fman-ports",
   284							       i, &args);
   285			if (ACPI_FAILURE(err) ||
   286			    !is_acpi_device_node(args.fwnode)) {
   287				dev_err(dev, "%s : reading fsl,fman-ports handle failed\n",
   288					__func__);
   289				goto _return;
   290			}
   291	
   292			/* Bind to a specific FMan Port */
   293			fman_port_dev = bus_find_device(&platform_bus_type, NULL,
   294							args.fwnode,
   295							fwnode_match_devnode);
   296			if (!fman_port_dev) {
   297				dev_err(dev, "%s : bus_find_device failed\n", __func__);
   298				err = -ENODEV;
   299				goto _return;
   300			}
   301	
   302			mac_dev->port[i] = fman_port_bind(fman_port_dev);
   303		}
   304	
   305		/* Get the PHY connection type */
   306		phy_if = fwnode_get_phy_mode(dev->fwnode);
   307		if (phy_if < 0) {
   308			dev_warn(dev, "fwnode_get_phy_mode failed. Defaulting to SGMII\n");
   309			phy_if = PHY_INTERFACE_MODE_SGMII;
   310		}
   311		mac_dev->phy_if = phy_if;
   312	
   313		params.mac_id		= priv->cell_index;
   314		params.fm		= (void *)priv->fman;
   315		params.exception_cb	= mac_exception;
   316		params.event_cb		= mac_exception;
   317	
   318		err = init(mac_dev, mac_node, &params);
   319		if (err < 0) {
   320			dev_err(dev, "%s: mac_dev->init() = %d\n", __func__, err);
   321			goto _return;
   322		}
   323	
   324		if (!is_zero_ether_addr(mac_dev->addr))
   325			dev_info(dev, "FMan MAC address: %pM\n", mac_dev->addr);
   326	
   327		priv->eth_dev = dpaa_eth_add_device(fman_id, mac_dev);
   328		if (IS_ERR(priv->eth_dev)) {
   329			dev_err(dev, "%s : failed to add Ethernet platform device for MAC %d\n",
   330				__func__, priv->cell_index);
   331			priv->eth_dev = NULL;
   332		}
   333	
   334		goto _return;
   335	
   336	_return:
   337		return err;
   338	}
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
