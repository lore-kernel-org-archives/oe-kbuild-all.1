Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078F21A92F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376610; cv=none; b=W8IbR+TaT+R3MoPBzxCfUwweNZb5pbUru1q8wFb3n4AlWz2Qyy4PhM/LnksAkaGPnKxAKIAZax1a+vXOzB89L4fHi6cjJvMOSA4ebVl7KqKE+s31/jUB0cyqY56G1mdSI8e44cqu2mQNK6odekG53gscdQywivuiRhqGl1mNHSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376610; c=relaxed/simple;
	bh=serZ7oG4V4Hw9AskAIjsKqZEZ7uXVijvXnwDmoarGzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r5Kvpe4b0oAASAyw/EcgvVktBSrRhsObfzp/4wBjXks4hwF7EBLz1b2oQ4+RwQKCbp4gsEf8hvhCzZBw77mFw//LMTOj7WwFWJZF6Z4Vsn0UG5ENo7VATReDvvtTz3NjinE3rQGvuIGCwhJl2r7LojQuWVcOmtleQiSf7jyPeOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMyMJ5Zt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMyMJ5Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778376608; x=1809912608;
  h=date:from:to:cc:subject:message-id;
  bh=serZ7oG4V4Hw9AskAIjsKqZEZ7uXVijvXnwDmoarGzY=;
  b=kMyMJ5ZtdQCciUJTNk4zSmFX+jKW2e7Hw+5jS/FKCqHF6p7If+ctewwp
   xxlNLdssjgSw0RBNaVMthAZo71acmGq3jD9feidwtzzvh1p/QyvvgiF9s
   KWaAwMrbwdRjaPYvTeUkHbAESEkFfn+GneeQh8uQW6fZKqfvMwuD+9HyS
   0YMGAo32WVa2+mNEguJW6staWLHctAeOXEhStWdlvyoAJgMaSzJRIttN0
   UTlBo+NjzP/fEZHf9/7K6bFmOTtYc7lCL0FnyevsZTejDO6Uf/3K15owr
   vIU3R8QWGI+471HDvg+1+P+r72t3Aa85HyBiF908/u6OUVRiC5Hm3B8hJ
   A==;
X-CSE-ConnectionGUID: +bSJrw1VTlij2ApfQnpMFg==
X-CSE-MsgGUID: 1UFfyX7hT1mPEeK2Ey2EDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79209384"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79209384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 18:30:08 -0700
X-CSE-ConnectionGUID: yjVhV8KxQX+tBpk3CZQUlg==
X-CSE-MsgGUID: DbDvmvmPTo+LEZ2E7X96Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="242072404"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 May 2026 18:30:06 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLszb-000000001ct-1rhp;
	Sun, 10 May 2026 01:30:03 +0000
Date: Sun, 10 May 2026 09:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 23/162]
 drivers/net/phy/phylink.c:2081:undefined reference to
 `register_fwnode_pcs_notifier'
Message-ID: <202605100936.ho9h06Ae-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: 631ef2ea9e25591248d4d3ff0038123488473ce8 [23/162] net: pcs: airoha: add PCS driver for Airoha SoC
config: csky-randconfig-002-20260510 (https://download.01.org/0day-ci/archive/20260510/202605100936.ho9h06Ae-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100936.ho9h06Ae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100936.ho9h06Ae-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
>> drivers/net/phy/phylink.c:2081:(.text+0x2996): undefined reference to `register_fwnode_pcs_notifier'
>> csky-linux-ld: drivers/net/phy/phylink.c:2096:(.text+0x2a48): undefined reference to `register_fwnode_pcs_notifier'
   csky-linux-ld: drivers/net/phy/phylink.o: in function `pcs_provider_notify':
>> drivers/net/phy/phylink.c:1989:(.text+0x39c0): undefined reference to `fwnode_phylink_pcs_get_from_fwnode'
>> csky-linux-ld: drivers/net/phy/phylink.c:2022:(.text+0x3a8c): undefined reference to `fwnode_phylink_pcs_get_from_fwnode'


vim +2081 drivers/net/phy/phylink.c

4b3fc475c61fa8 Russell King          2024-09-06  1978  
6fc45db08a29e9 Christian Marangi     2025-04-06  1979  static int pcs_provider_notify(struct notifier_block *self,
6fc45db08a29e9 Christian Marangi     2025-04-06  1980  			       unsigned long val, void *data)
6fc45db08a29e9 Christian Marangi     2025-04-06  1981  {
6fc45db08a29e9 Christian Marangi     2025-04-06  1982  	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
6fc45db08a29e9 Christian Marangi     2025-04-06  1983  	struct fwnode_handle *pcs_fwnode = data;
6fc45db08a29e9 Christian Marangi     2025-04-06  1984  	struct phylink_pcs *pcs;
6fc45db08a29e9 Christian Marangi     2025-04-06  1985  
6fc45db08a29e9 Christian Marangi     2025-04-06  1986  	/* Check if the just added PCS provider is
6fc45db08a29e9 Christian Marangi     2025-04-06  1987  	 * in the phylink instance phy-handle property
6fc45db08a29e9 Christian Marangi     2025-04-06  1988  	 */
6fc45db08a29e9 Christian Marangi     2025-04-06 @1989  	pcs = fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
6fc45db08a29e9 Christian Marangi     2025-04-06  1990  						 pcs_fwnode);
6fc45db08a29e9 Christian Marangi     2025-04-06  1991  	if (IS_ERR(pcs))
6fc45db08a29e9 Christian Marangi     2025-04-06  1992  		return NOTIFY_DONE;
6fc45db08a29e9 Christian Marangi     2025-04-06  1993  
6fc45db08a29e9 Christian Marangi     2025-04-06  1994  	/* Add the PCS */
6fc45db08a29e9 Christian Marangi     2025-04-06  1995  	rtnl_lock();
6fc45db08a29e9 Christian Marangi     2025-04-06  1996  
6fc45db08a29e9 Christian Marangi     2025-04-06  1997  	list_add(&pcs->list, &pl->pcs_list);
6fc45db08a29e9 Christian Marangi     2025-04-06  1998  
6fc45db08a29e9 Christian Marangi     2025-04-06  1999  	/* Link phylink if we are started */
6fc45db08a29e9 Christian Marangi     2025-04-06  2000  	if (!pl->phylink_disable_state)
6fc45db08a29e9 Christian Marangi     2025-04-06  2001  		pcs->phylink = pl;
6fc45db08a29e9 Christian Marangi     2025-04-06  2002  
6fc45db08a29e9 Christian Marangi     2025-04-06  2003  	/* Refresh supported interfaces */
6fc45db08a29e9 Christian Marangi     2025-04-06  2004  	phy_interface_copy(pl->supported_interfaces,
6fc45db08a29e9 Christian Marangi     2025-04-06  2005  			   pl->config->supported_interfaces);
6fc45db08a29e9 Christian Marangi     2025-04-06  2006  	list_for_each_entry(pcs, &pl->pcs_list, list)
6fc45db08a29e9 Christian Marangi     2025-04-06  2007  		phy_interface_or(pl->supported_interfaces,
6fc45db08a29e9 Christian Marangi     2025-04-06  2008  				 pl->supported_interfaces,
6fc45db08a29e9 Christian Marangi     2025-04-06  2009  				 pcs->supported_interfaces);
6fc45db08a29e9 Christian Marangi     2025-04-06  2010  
6fc45db08a29e9 Christian Marangi     2025-04-06  2011  	mutex_lock(&pl->state_mutex);
6fc45db08a29e9 Christian Marangi     2025-04-06  2012  	/* Force an interface reconfig if major config fail */
6fc45db08a29e9 Christian Marangi     2025-04-06  2013  	if (pl->major_config_failed)
6fc45db08a29e9 Christian Marangi     2025-04-06  2014  		pl->reconfig_interface = true;
6fc45db08a29e9 Christian Marangi     2025-04-06  2015  	mutex_unlock(&pl->state_mutex);
6fc45db08a29e9 Christian Marangi     2025-04-06  2016  
6fc45db08a29e9 Christian Marangi     2025-04-06  2017  	rtnl_unlock();
6fc45db08a29e9 Christian Marangi     2025-04-06  2018  
6fc45db08a29e9 Christian Marangi     2025-04-06  2019  	phylink_run_resolve(pl);
6fc45db08a29e9 Christian Marangi     2025-04-06  2020  
6fc45db08a29e9 Christian Marangi     2025-04-06  2021  	return NOTIFY_OK;
6fc45db08a29e9 Christian Marangi     2025-04-06 @2022  }
6fc45db08a29e9 Christian Marangi     2025-04-06  2023  
8796c8923d9c42 Russell King          2017-12-01  2024  /**
8796c8923d9c42 Russell King          2017-12-01  2025   * phylink_create() - create a phylink instance
9db74e51ec08d7 Randy Dunlap          2019-10-08  2026   * @config: a pointer to the target &struct phylink_config
8fa7b9b6af252c Russell King          2017-12-01  2027   * @fwnode: a pointer to a &struct fwnode_handle describing the network
8fa7b9b6af252c Russell King          2017-12-01  2028   *	interface
8796c8923d9c42 Russell King          2017-12-01  2029   * @iface: the desired link mode defined by &typedef phy_interface_t
e7765d634aaa9d Russell King          2020-03-30  2030   * @mac_ops: a pointer to a &struct phylink_mac_ops for the MAC.
8796c8923d9c42 Russell King          2017-12-01  2031   *
8796c8923d9c42 Russell King          2017-12-01  2032   * Create a new phylink instance, and parse the link parameters found in @np.
8796c8923d9c42 Russell King          2017-12-01  2033   * This will parse in-band modes, fixed-link or SFP configuration.
8796c8923d9c42 Russell King          2017-12-01  2034   *
269a6b5f23a688 Russell King          2019-11-19  2035   * Note: the rtnl lock must not be held when calling this function.
269a6b5f23a688 Russell King          2019-11-19  2036   *
8796c8923d9c42 Russell King          2017-12-01  2037   * Returns a pointer to a &struct phylink, or an error-pointer value. Users
8796c8923d9c42 Russell King          2017-12-01  2038   * must use IS_ERR() to check for errors from this function.
8796c8923d9c42 Russell King          2017-12-01  2039   */
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2040  struct phylink *phylink_create(struct phylink_config *config,
a0b7955310a445 Russell King (Oracle  2023-05-12  2041) 			       const struct fwnode_handle *fwnode,
516b29edc3b332 Florian Fainelli      2017-10-30  2042  			       phy_interface_t iface,
e7765d634aaa9d Russell King          2020-03-30  2043  			       const struct phylink_mac_ops *mac_ops)
9525ae83959b60 Russell King          2017-07-25  2044  {
908b918b78d9c0 Christian Marangi     2025-03-31  2045  	struct phylink_pcs *pcs;
9525ae83959b60 Russell King          2017-07-25  2046  	struct phylink *pl;
908b918b78d9c0 Christian Marangi     2025-03-31  2047  	int i, ret;
9525ae83959b60 Russell King          2017-07-25  2048  
1054457006d4a1 Russell King (Oracle  2022-02-21  2049) 	/* Validate the supplied configuration */
de5c9bf40c4582 Russell King (Oracle  2023-05-20  2050) 	if (phy_interface_empty(config->supported_interfaces)) {
d1e86325af3771 Russell King (Oracle  2021-12-15  2051) 		dev_err(config->dev,
de5c9bf40c4582 Russell King (Oracle  2023-05-20  2052) 			"phylink: error: empty supported_interfaces\n");
d1e86325af3771 Russell King (Oracle  2021-12-15  2053) 		return ERR_PTR(-EINVAL);
d1e86325af3771 Russell King (Oracle  2021-12-15  2054) 	}
d1e86325af3771 Russell King (Oracle  2021-12-15  2055) 
bf4afc53b77aea Linus Torvalds        2026-02-21  2056  	pl = kzalloc_obj(*pl);
9525ae83959b60 Russell King          2017-07-25  2057  	if (!pl)
9525ae83959b60 Russell King          2017-07-25  2058  		return ERR_PTR(-ENOMEM);
9525ae83959b60 Russell King          2017-07-25  2059  
0ba5b2f2c381db Vladimir Oltean       2025-09-04  2060  	mutex_init(&pl->phydev_mutex);
9525ae83959b60 Russell King          2017-07-25  2061  	mutex_init(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  2062  	INIT_WORK(&pl->resolve, phylink_resolve);
908b918b78d9c0 Christian Marangi     2025-03-31  2063  	INIT_LIST_HEAD(&pl->pcs_list);
908b918b78d9c0 Christian Marangi     2025-03-31  2064  
908b918b78d9c0 Christian Marangi     2025-03-31  2065  	/* Fill the PCS list with available PCS from phylink config */
908b918b78d9c0 Christian Marangi     2025-03-31  2066  	for (i = 0; i < config->num_available_pcs; i++) {
908b918b78d9c0 Christian Marangi     2025-03-31  2067  		pcs = config->available_pcs[i];
908b918b78d9c0 Christian Marangi     2025-03-31  2068  
908b918b78d9c0 Christian Marangi     2025-03-31  2069  		list_add(&pcs->list, &pl->pcs_list);
908b918b78d9c0 Christian Marangi     2025-03-31  2070  	}
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2071  
066bcf0549a85b Christian Marangi     2025-03-31  2072  	phy_interface_copy(pl->supported_interfaces,
066bcf0549a85b Christian Marangi     2025-03-31  2073  			   config->supported_interfaces);
908b918b78d9c0 Christian Marangi     2025-03-31  2074  	list_for_each_entry(pcs, &pl->pcs_list, list)
908b918b78d9c0 Christian Marangi     2025-03-31  2075  		phy_interface_or(pl->supported_interfaces,
908b918b78d9c0 Christian Marangi     2025-03-31  2076  				 pl->supported_interfaces,
908b918b78d9c0 Christian Marangi     2025-03-31  2077  				 pcs->supported_interfaces);
066bcf0549a85b Christian Marangi     2025-03-31  2078  
6fc45db08a29e9 Christian Marangi     2025-04-06  2079  	if (!phy_interface_empty(config->pcs_interfaces)) {
6fc45db08a29e9 Christian Marangi     2025-04-06  2080  		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
6fc45db08a29e9 Christian Marangi     2025-04-06 @2081  		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
6fc45db08a29e9 Christian Marangi     2025-04-06  2082  	}
6fc45db08a29e9 Christian Marangi     2025-04-06  2083  
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2084  	pl->config = config;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2085  	if (config->type == PHYLINK_NETDEV) {
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2086  		pl->netdev = to_net_dev(config->dev);
02d5fdbf4f2b8c Klaus Kudielka        2023-11-07  2087  		netif_carrier_off(pl->netdev);
43de61959b9992 Ioana Ciornei         2019-05-28  2088  	} else if (config->type == PHYLINK_DEV) {
43de61959b9992 Ioana Ciornei         2019-05-28  2089  		pl->dev = config->dev;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2090  	} else {
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2091  		kfree(pl);
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2092  		return ERR_PTR(-EINVAL);
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2093  	}
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2094  
2001d21592e5eb Russell King (Oracle  2025-02-10  2095) 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
03abf2a7c65451 Russell King (Oracle  2025-01-15 @2096) 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  2097) 			       pl->config->lpi_capabilities &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  2098) 			       !phy_interface_empty(pl->config->lpi_interfaces);
03abf2a7c65451 Russell King (Oracle  2025-01-15  2099) 
03abf2a7c65451 Russell King (Oracle  2025-01-15  2100) 	/* Set the default EEE configuration */
03abf2a7c65451 Russell King (Oracle  2025-01-15  2101) 	pl->eee_cfg.eee_enabled = pl->config->eee_enabled_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2102) 	pl->eee_cfg.tx_lpi_enabled = pl->eee_cfg.eee_enabled;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2103) 	pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2104) 
9525ae83959b60 Russell King          2017-07-25  2105  	pl->phy_state.interface = iface;
9525ae83959b60 Russell King          2017-07-25  2106  	pl->link_interface = iface;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2107  	if (iface == PHY_INTERFACE_MODE_MOCA)
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2108  		pl->link_port = PORT_BNC;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2109  	else
9525ae83959b60 Russell King          2017-07-25  2110  		pl->link_port = PORT_MII;
9525ae83959b60 Russell King          2017-07-25  2111  	pl->link_config.interface = iface;
9525ae83959b60 Russell King          2017-07-25  2112  	pl->link_config.pause = MLO_PAUSE_AN;
9525ae83959b60 Russell King          2017-07-25  2113  	pl->link_config.speed = SPEED_UNKNOWN;
9525ae83959b60 Russell King          2017-07-25  2114  	pl->link_config.duplex = DUPLEX_UNKNOWN;
90ef0a7b0622c6 Russell King (Oracle  2023-07-13  2115) 	pl->pcs_state = PCS_STATE_DOWN;
e7765d634aaa9d Russell King          2020-03-30  2116  	pl->mac_ops = mac_ops;
9525ae83959b60 Russell King          2017-07-25  2117  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
9cd00a8aa42e44 Russell King          2018-05-10  2118  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
9525ae83959b60 Russell King          2017-07-25  2119  
ba50a8d4025808 Russell King (Oracle  2023-11-15  2120) 	linkmode_fill(pl->supported);
9525ae83959b60 Russell King          2017-07-25  2121  	linkmode_copy(pl->link_config.advertising, pl->supported);
9525ae83959b60 Russell King          2017-07-25  2122  	phylink_validate(pl, pl->supported, &pl->link_config);
9525ae83959b60 Russell King          2017-07-25  2123  
8fa7b9b6af252c Russell King          2017-12-01  2124  	ret = phylink_parse_mode(pl, fwnode);
9525ae83959b60 Russell King          2017-07-25  2125  	if (ret < 0) {
9525ae83959b60 Russell King          2017-07-25  2126  		kfree(pl);
9525ae83959b60 Russell King          2017-07-25  2127  		return ERR_PTR(ret);
9525ae83959b60 Russell King          2017-07-25  2128  	}
9525ae83959b60 Russell King          2017-07-25  2129  
24cf0e693bb50a Russell King          2019-12-11  2130  	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
8fa7b9b6af252c Russell King          2017-12-01  2131  		ret = phylink_parse_fixedlink(pl, fwnode);
9525ae83959b60 Russell King          2017-07-25  2132  		if (ret < 0) {
9525ae83959b60 Russell King          2017-07-25  2133  			kfree(pl);
9525ae83959b60 Russell King          2017-07-25  2134  			return ERR_PTR(ret);
9525ae83959b60 Russell King          2017-07-25  2135  		}
9525ae83959b60 Russell King          2017-07-25  2136  	}
9525ae83959b60 Russell King          2017-07-25  2137  
1f92ead7e15003 Russell King (Oracle  2024-12-03  2138) 	pl->req_link_an_mode = pl->cfg_link_an_mode;
24cf0e693bb50a Russell King          2019-12-11  2139  
8fa7b9b6af252c Russell King          2017-12-01  2140  	ret = phylink_register_sfp(pl, fwnode);
ce0aa27ff3f68e Russell King          2017-07-25  2141  	if (ret < 0) {
ce0aa27ff3f68e Russell King          2017-07-25  2142  		kfree(pl);
ce0aa27ff3f68e Russell King          2017-07-25  2143  		return ERR_PTR(ret);
ce0aa27ff3f68e Russell King          2017-07-25  2144  	}
ce0aa27ff3f68e Russell King          2017-07-25  2145  
9525ae83959b60 Russell King          2017-07-25  2146  	return pl;
9525ae83959b60 Russell King          2017-07-25  2147  }
9525ae83959b60 Russell King          2017-07-25  2148  EXPORT_SYMBOL_GPL(phylink_create);
9525ae83959b60 Russell King          2017-07-25  2149  

:::::: The code at line 2081 was first introduced by commit
:::::: 6fc45db08a29e995a2ab14f1f1db21fd8d7de565 net: phylink: support late PCS provider attach

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
