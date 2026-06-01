Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C541C6A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 01:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780276386; cv=none; b=SWkj1FSbbM0HPPLqFg/GEqw+ZgOv6MXPeMFizovM6mJhBFqx7D6ErWoSwR8pkK0ULsxWyn4TnAsp8d9FNxI5NlJhHyp4lqHjB8wXDbDKHceeIUY0RsNa8XyQDwCVKZGeVzeI5qHqRy4hTWbeNt7Xz+6V/dp6a8pzNJjzN572F1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780276386; c=relaxed/simple;
	bh=XPMNf1dJGjGZJbUKqGTQ0kusVhKLTYaIqa/FUYQsBBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m25mk3RE78WiI+dbaIxWMeeSWDU0S5pVa500d8SKcSoSdkQhGG7t8aXxyl87XMbvIlfbyrarPqbji0sOhIJXjEVCfpz+5NO46mozlqAEUpZMX9qsMF2MCx8dqAcYKwSFj3uFgJi7nXyyr/jCDAnvrgwU9A5EeWszkbb5z2V5CuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csumZlSH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csumZlSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780276383; x=1811812383;
  h=date:from:to:cc:subject:message-id;
  bh=XPMNf1dJGjGZJbUKqGTQ0kusVhKLTYaIqa/FUYQsBBY=;
  b=csumZlSHIS4ijJKDbMPRXDLjJ+aQneyE730BFy3z+WbqLp/R7T7JldjO
   Wsc/F1Fb9x0gdHSfMai6lcW5l2vV9Spbn2bL4o2FKVl1xmsmT7YC/xcQf
   +x0rhV8cTiBeqS5NeQbsegajgnzfjfkzGA47zaU/mPkFLI9Iv/JcITm2o
   UkU6bXEfdGUPrUrnLy9LjTmSax7PM0cLG7Ptz9W27z9keioKw+01PcleD
   lrIVevNEWMyZi95cmAG0agIR8PPW8qDe1a8MXmX79Fqf8EhXWkBJlOAT7
   d56jmDTkiZTJ9lPPHoi7u3hTWBIoL9jGnXtVBGsXkW2pGOLHyx990TJtB
   A==;
X-CSE-ConnectionGUID: 3kX/oQm8RGiZfpdKdJXvcA==
X-CSE-MsgGUID: hszpYAiESROAZnSNDr2i0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103703167"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="103703167"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 18:13:03 -0700
X-CSE-ConnectionGUID: 078SA15BTF++SNhKWIXxww==
X-CSE-MsgGUID: SE7KxU+gSZyW31KnVC8gMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="243265036"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 May 2026 18:13:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTrD8-000000009vC-1Tfk;
	Mon, 01 Jun 2026 01:12:58 +0000
Date: Mon, 01 Jun 2026 09:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 6164/9870]
 drivers/net/dsa/netc/netc_main.c:241: undefined reference to `ntmp_free_cbdr'
Message-ID: <202606010951.E3Dcv5v3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 187fbae024c8439533d7f075f4ab4b594dc19992 [6164/9870] net: dsa: netc: introduce NXP NETC switch driver for i.MX94
config: arm-randconfig-r072-20260601 (https://download.01.org/0day-ci/archive/20260601/202606010951.E3Dcv5v3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606010951.E3Dcv5v3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606010951.E3Dcv5v3-lkp@intel.com/

Note: the linux-next/master HEAD 7da7f07112610a520567421dd2ffcb51beaefbcc builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_remove_all_cbdrs':
>> drivers/net/dsa/netc/netc_main.c:241: undefined reference to `ntmp_free_cbdr'
>> arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:241: undefined reference to `ntmp_free_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_create_emdio_bus':
>> drivers/net/dsa/netc/netc_main.c:72: undefined reference to `enetc_hw_alloc'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_init_all_cbdrs':
>> drivers/net/dsa/netc/netc_main.c:222: undefined reference to `ntmp_init_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:231: undefined reference to `ntmp_free_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_setup':
   drivers/net/dsa/netc/netc_main.c:371: undefined reference to `enetc_mdio_read_c22'
>> arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:371: undefined reference to `enetc_mdio_write_c22'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:371: undefined reference to `enetc_mdio_read_c45'
>> arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:371: undefined reference to `enetc_mdio_write_c45'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NXP_NTMP
   Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=n]
   Selected by [y]:
   - NET_DSA_NETC_SWITCH [=y] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=y] && PCI [=y]
   WARNING: unmet direct dependencies detected for NXP_NETC_LIB
   Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=n]
   Selected by [y]:
   - NET_DSA_NETC_SWITCH [=y] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=y] && PCI [=y]
   WARNING: unmet direct dependencies detected for FSL_ENETC_MDIO
   Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=n] && PCI [=y] && PHYLIB [=y]
   Selected by [y]:
   - NET_DSA_NETC_SWITCH [=y] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=y] && PCI [=y]


vim +241 drivers/net/dsa/netc/netc_main.c

    61	
    62	static int netc_port_create_emdio_bus(struct netc_port *np,
    63					      struct device_node *node)
    64	{
    65		struct netc_switch *priv = np->switch_priv;
    66		struct enetc_mdio_priv *mdio_priv;
    67		struct device *dev = priv->dev;
    68		struct enetc_hw *hw;
    69		struct mii_bus *bus;
    70		int err;
    71	
  > 72		hw = enetc_hw_alloc(dev, np->iobase);
    73		if (IS_ERR(hw))
    74			return dev_err_probe(dev, PTR_ERR(hw),
    75					     "Failed to allocate enetc_hw\n");
    76	
    77		bus = devm_mdiobus_alloc_size(dev, sizeof(*mdio_priv));
    78		if (!bus)
    79			return -ENOMEM;
    80	
    81		bus->name = "NXP NETC switch external MDIO Bus";
    82		bus->read = enetc_mdio_read_c22;
    83		bus->write = enetc_mdio_write_c22;
    84		bus->read_c45 = enetc_mdio_read_c45;
    85		bus->write_c45 = enetc_mdio_write_c45;
    86		bus->parent = dev;
    87		mdio_priv = bus->priv;
    88		mdio_priv->hw = hw;
    89		mdio_priv->mdio_base = NETC_EMDIO_BASE;
    90		snprintf(bus->id, MII_BUS_ID_SIZE, "%s-p%d-emdio",
    91			 dev_name(dev), np->dp->index);
    92	
    93		err = devm_of_mdiobus_register(dev, bus, node);
    94		if (err)
    95			return dev_err_probe(dev, err,
    96					     "Cannot register EMDIO bus\n");
    97	
    98		np->emdio = bus;
    99	
   100		return 0;
   101	}
   102	
   103	static int netc_port_create_mdio_bus(struct netc_port *np,
   104					     struct device_node *node)
   105	{
   106		struct device_node *mdio_node;
   107		int err;
   108	
   109		mdio_node = of_get_child_by_name(node, "mdio");
   110		if (mdio_node) {
   111			err = netc_port_create_emdio_bus(np, mdio_node);
   112			of_node_put(mdio_node);
   113			if (err)
   114				return err;
   115		}
   116	
   117		return 0;
   118	}
   119	
   120	static int netc_init_switch_id(struct netc_switch *priv)
   121	{
   122		struct netc_switch_regs *regs = &priv->regs;
   123		struct dsa_switch *ds = priv->ds;
   124	
   125		/* The value of 0 is reserved for the VEPA switch and cannot
   126		 * be used. So 'dsa,member' is a required property for NETC
   127		 * switch, the member is used to specify the switch ID, which
   128		 * cannot be zero. This way, the hardware switch ID and the
   129		 * software switch ID are consistent.
   130		 */
   131		if (ds->index > FIELD_MAX(SWCR_SWID) || !ds->index) {
   132			dev_err(priv->dev, "Switch index %d out of range\n",
   133				ds->index);
   134			return -ERANGE;
   135		}
   136	
   137		netc_base_wr(regs, NETC_SWCR, ds->index);
   138	
   139		return 0;
   140	}
   141	
   142	static int netc_init_all_ports(struct netc_switch *priv)
   143	{
   144		struct device *dev = priv->dev;
   145		struct netc_port *np;
   146		struct dsa_port *dp;
   147		int err;
   148	
   149		priv->ports = devm_kcalloc(dev, priv->info->num_ports,
   150					   sizeof(struct netc_port *),
   151					   GFP_KERNEL);
   152		if (!priv->ports)
   153			return -ENOMEM;
   154	
   155		/* Some DSA interfaces may set the port even it is disabled, such
   156		 * as .port_disable(), .port_stp_state_set() and so on. To avoid
   157		 * crash caused by accessing NULL port pointer, each port is
   158		 * allocated its own memory. Otherwise, we need to check whether
   159		 * the port pointer is NULL in these interfaces. The latter is
   160		 * difficult for us to cover.
   161		 */
   162		for (int i = 0; i < priv->info->num_ports; i++) {
   163			np = devm_kzalloc(dev, sizeof(*np), GFP_KERNEL);
   164			if (!np)
   165				return -ENOMEM;
   166	
   167			np->switch_priv = priv;
   168			np->iobase = priv->regs.port + PORT_IOBASE(i);
   169			netc_port_get_capability(np);
   170			priv->ports[i] = np;
   171		}
   172	
   173		dsa_switch_for_each_available_port(dp, priv->ds) {
   174			np = priv->ports[dp->index];
   175			np->dp = dp;
   176	
   177			if (dsa_port_is_user(dp)) {
   178				err = netc_port_create_mdio_bus(np, dp->dn);
   179				if (err) {
   180					dev_err(dev, "Failed to create MDIO bus\n");
   181					return err;
   182				}
   183			}
   184		}
   185	
   186		return 0;
   187	}
   188	
   189	static void netc_init_ntmp_tbl_versions(struct netc_switch *priv)
   190	{
   191		struct ntmp_user *ntmp = &priv->ntmp;
   192	
   193		/* All tables default to version 0 */
   194		memset(&ntmp->tbl, 0, sizeof(ntmp->tbl));
   195	}
   196	
   197	static int netc_init_all_cbdrs(struct netc_switch *priv)
   198	{
   199		struct netc_switch_regs *regs = &priv->regs;
   200		struct ntmp_user *ntmp = &priv->ntmp;
   201		int i, err;
   202	
   203		ntmp->cbdr_num = NETC_CBDR_NUM;
   204		ntmp->dev = priv->dev;
   205		ntmp->ring = devm_kcalloc(ntmp->dev, ntmp->cbdr_num,
   206					  sizeof(struct netc_cbdr),
   207					  GFP_KERNEL);
   208		if (!ntmp->ring)
   209			return -ENOMEM;
   210	
   211		for (i = 0; i < ntmp->cbdr_num; i++) {
   212			struct netc_cbdr *cbdr = &ntmp->ring[i];
   213			struct netc_cbdr_regs cbdr_regs;
   214	
   215			cbdr_regs.pir = regs->base + NETC_CBDRPIR(i);
   216			cbdr_regs.cir = regs->base + NETC_CBDRCIR(i);
   217			cbdr_regs.mr = regs->base + NETC_CBDRMR(i);
   218			cbdr_regs.bar0 = regs->base + NETC_CBDRBAR0(i);
   219			cbdr_regs.bar1 = regs->base + NETC_CBDRBAR1(i);
   220			cbdr_regs.lenr = regs->base + NETC_CBDRLENR(i);
   221	
 > 222			err = ntmp_init_cbdr(cbdr, ntmp->dev, &cbdr_regs);
   223			if (err)
   224				goto free_cbdrs;
   225		}
   226	
   227		return 0;
   228	
   229	free_cbdrs:
   230		for (i--; i >= 0; i--)
   231			ntmp_free_cbdr(&ntmp->ring[i]);
   232	
   233		return err;
   234	}
   235	
   236	static void netc_remove_all_cbdrs(struct netc_switch *priv)
   237	{
   238		struct ntmp_user *ntmp = &priv->ntmp;
   239	
   240		for (int i = 0; i < NETC_CBDR_NUM; i++)
 > 241			ntmp_free_cbdr(&ntmp->ring[i]);
   242	}
   243	
   244	static int netc_init_ntmp_user(struct netc_switch *priv)
   245	{
   246		netc_init_ntmp_tbl_versions(priv);
   247	
   248		return netc_init_all_cbdrs(priv);
   249	}
   250	
   251	static void netc_free_ntmp_user(struct netc_switch *priv)
   252	{
   253		netc_remove_all_cbdrs(priv);
   254	}
   255	
   256	static void netc_switch_dos_default_config(struct netc_switch *priv)
   257	{
   258		struct netc_switch_regs *regs = &priv->regs;
   259		u32 val;
   260	
   261		val = DOSL2CR_SAMEADDR | DOSL2CR_MSAMCC;
   262		netc_base_wr(regs, NETC_DOSL2CR, val);
   263	
   264		val = DOSL3CR_SAMEADDR | DOSL3CR_IPSAMCC;
   265		netc_base_wr(regs, NETC_DOSL3CR, val);
   266	}
   267	
   268	static void netc_switch_vfht_default_config(struct netc_switch *priv)
   269	{
   270		struct netc_switch_regs *regs = &priv->regs;
   271		u32 val;
   272	
   273		val = netc_base_rd(regs, NETC_VFHTDECR2);
   274	
   275		/* If no match is found in the VLAN Filter table, then VFHTDECR2[MLO]
   276		 * will take effect. VFHTDECR2[MLO] is set to "Software MAC learning
   277		 * secure" by default. Notice BPCR[MLO] will override VFHTDECR2[MLO]
   278		 * if its value is not zero.
   279		 */
   280		val = u32_replace_bits(val, MLO_SW_SEC, VFHTDECR2_MLO);
   281		val = u32_replace_bits(val, MFO_NO_MATCH_DISCARD, VFHTDECR2_MFO);
   282		netc_base_wr(regs, NETC_VFHTDECR2, val);
   283	}
   284	
   285	static void netc_port_set_max_frame_size(struct netc_port *np,
   286						 u32 max_frame_size)
   287	{
   288		netc_mac_port_wr(np, NETC_PM_MAXFRM(0),
   289				 max_frame_size & PM_MAXFRAM);
   290	}
   291	
   292	static void netc_switch_fixed_config(struct netc_switch *priv)
   293	{
   294		netc_switch_dos_default_config(priv);
   295		netc_switch_vfht_default_config(priv);
   296	}
   297	
   298	static void netc_port_set_tc_max_sdu(struct netc_port *np,
   299					     int tc, u32 max_sdu)
   300	{
   301		u32 val = FIELD_PREP(PTCTMSDUR_MAXSDU, max_sdu) |
   302			  FIELD_PREP(PTCTMSDUR_SDU_TYPE, SDU_TYPE_MPDU);
   303	
   304		netc_port_wr(np, NETC_PTCTMSDUR(tc), val);
   305	}
   306	
   307	static void netc_port_set_all_tc_msdu(struct netc_port *np)
   308	{
   309		for (int tc = 0; tc < NETC_TC_NUM; tc++)
   310			netc_port_set_tc_max_sdu(np, tc, NETC_MAX_FRAME_LEN);
   311	}
   312	
   313	static void netc_port_set_mlo(struct netc_port *np, enum netc_mlo mlo)
   314	{
   315		netc_port_rmw(np, NETC_BPCR, BPCR_MLO, FIELD_PREP(BPCR_MLO, mlo));
   316	}
   317	
   318	static void netc_port_fixed_config(struct netc_port *np)
   319	{
   320		/* Default IPV and DR setting */
   321		netc_port_rmw(np, NETC_PQOSMR, PQOSMR_VS | PQOSMR_VE,
   322			      PQOSMR_VS | PQOSMR_VE);
   323	
   324		/* Enable L2 and L3 DOS */
   325		netc_port_rmw(np, NETC_PCR, PCR_L2DOSE | PCR_L3DOSE,
   326			      PCR_L2DOSE | PCR_L3DOSE);
   327	}
   328	
   329	static void netc_port_default_config(struct netc_port *np)
   330	{
   331		netc_port_fixed_config(np);
   332	
   333		/* Default VLAN unaware */
   334		netc_port_rmw(np, NETC_BPDVR, BPDVR_RXVAM, BPDVR_RXVAM);
   335	
   336		if (dsa_port_is_cpu(np->dp))
   337			/* For CPU port, source port pruning is disabled */
   338			netc_port_rmw(np, NETC_BPCR, BPCR_SRCPRND, BPCR_SRCPRND);
   339		else
   340			netc_port_set_mlo(np, MLO_DISABLE);
   341	
   342		netc_port_set_max_frame_size(np, NETC_MAX_FRAME_LEN);
   343		netc_port_set_all_tc_msdu(np);
   344	}
   345	
   346	static int netc_setup(struct dsa_switch *ds)
   347	{
   348		struct netc_switch *priv = ds->priv;
   349		struct dsa_port *dp;
   350		int err;
   351	
   352		err = netc_init_switch_id(priv);
   353		if (err)
   354			return err;
   355	
   356		err = netc_init_all_ports(priv);
   357		if (err)
   358			return err;
   359	
   360		err = netc_init_ntmp_user(priv);
   361		if (err)
   362			return err;
   363	
   364		netc_switch_fixed_config(priv);
   365	
   366		/* default setting for ports */
   367		dsa_switch_for_each_available_port(dp, ds)
   368			netc_port_default_config(priv->ports[dp->index]);
   369	
   370		return 0;
 > 371	}
   372	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
