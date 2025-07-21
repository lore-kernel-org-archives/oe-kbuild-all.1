Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993D26ACC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 01:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753060575; cv=none; b=sd3g0aIF1i1ARxuVYRdFPgtganbjAfYy/0gpfBylSKHcSKXcNsoiZH6XymXSkcyWh5kcmDp50RlKb8hc6fuZGGlFHHuAXfy5P8mIDltlQJiA/vVkFb8H5Mu7BoQd5eNkWk38ODb5wTyRMWAzAYiZeE37D8WgiYLYf7kbf5RpPEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753060575; c=relaxed/simple;
	bh=aLTusBksGmZv4s1uvphppXQmWsukPsLLLgCEtVEQ/8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otIQjnokdu7AhNzrh7ic0HUwOI5TXNInseGPnG5ZJNad20IKc7gsLhkELqG/CZJEyfbhKSt6w2eYeNHzh5wxuyD5mH47clrv2JjkzIyaaYUnAwKaxB4QX3WTmuJbS0guUoftA6GzkMrCzMh3bAjJ6AzfeWoCGGrq+mFMjpiOIms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCUjhxWL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCUjhxWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753060573; x=1784596573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLTusBksGmZv4s1uvphppXQmWsukPsLLLgCEtVEQ/8g=;
  b=nCUjhxWLBn4yEl4P/UVShEf66IPW+wSfAF/PDR1GLh8W6LYJqm4U+9yg
   ehIrfNwFodALF3TiSks7w/PxNE5D74KpmFzkFq/H0r6/UPGcxT9t0rd10
   DHcP0z6HlkM16lntdXwGZUwBBXWpCwKrEv0pb8NmKHIHs0w6d6tk8Sy3a
   F5SbfiiZqvc1qkf4kpBijp5uJvvucCKikXAiKyuS88QhpvVFM8IZrGdTc
   lfEOlgY7CUeCY8U7ZwWbLm5jETqs5KZeW76qr8aXKU22JNchnYADu3xii
   Tr3nck3jruroIk6lusomwjiMmm9aKMQZa/EnR9cx7wtJztfloeQVQegPj
   A==;
X-CSE-ConnectionGUID: kb4uxy2SR9+xNEtKyGfHqQ==
X-CSE-MsgGUID: 1JnM8TSvTmSbACqB4lU0lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="66332394"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="66332394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 18:16:12 -0700
X-CSE-ConnectionGUID: wrzCQx34TBCXvcfoxZeN2A==
X-CSE-MsgGUID: eDjDY4Q1QNKi8E/q24qciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="164352111"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jul 2025 18:16:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udf8S-000GNp-2X;
	Mon, 21 Jul 2025 01:16:08 +0000
Date: Mon, 21 Jul 2025 09:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-dualmmc 63/79]
 drivers/net/phy/phylink.c:1924: undefined reference to
 `fwnode_phylink_pcs_get_from_fwnode'
Message-ID: <202507210925.efhAJpSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-dualmmc
head:   61605f260a207bbe9994a325ea9b2d33e29d62de
commit: d6e1d526e77e020760387a7c7e79fa5b9a9cbeab [63/79] net: pcs: add driver for MediaTek USXGMII PCS
config: i386-randconfig-013-20250721 (https://download.01.org/0day-ci/archive/20250721/202507210925.efhAJpSL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210925.efhAJpSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507210925.efhAJpSL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/phylink.o: in function `pcs_provider_notify':
>> drivers/net/phy/phylink.c:1924: undefined reference to `fwnode_phylink_pcs_get_from_fwnode'
   ld: drivers/net/phy/phylink.o: in function `phylink_create':
>> drivers/net/phy/phylink.c:2015: undefined reference to `register_fwnode_pcs_notifier'


vim +1924 drivers/net/phy/phylink.c

4b3fc475c61fa8 Russell King          2024-09-06  1913  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1914  static int pcs_provider_notify(struct notifier_block *self,
caf3ffea1bfa91 Christian Marangi     2025-04-07  1915  			       unsigned long val, void *data)
caf3ffea1bfa91 Christian Marangi     2025-04-07  1916  {
caf3ffea1bfa91 Christian Marangi     2025-04-07  1917  	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1918  	struct fwnode_handle *pcs_fwnode = data;
caf3ffea1bfa91 Christian Marangi     2025-04-07  1919  	struct phylink_pcs *pcs;
caf3ffea1bfa91 Christian Marangi     2025-04-07  1920  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1921  	/* Check if the just added PCS provider is
caf3ffea1bfa91 Christian Marangi     2025-04-07  1922  	 * in the phylink instance phy-handle property
caf3ffea1bfa91 Christian Marangi     2025-04-07  1923  	 */
caf3ffea1bfa91 Christian Marangi     2025-04-07 @1924  	pcs = fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
caf3ffea1bfa91 Christian Marangi     2025-04-07  1925  						 pcs_fwnode);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1926  	if (IS_ERR(pcs))
caf3ffea1bfa91 Christian Marangi     2025-04-07  1927  		return NOTIFY_DONE;
caf3ffea1bfa91 Christian Marangi     2025-04-07  1928  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1929  	/* Add the PCS */
caf3ffea1bfa91 Christian Marangi     2025-04-07  1930  	rtnl_lock();
caf3ffea1bfa91 Christian Marangi     2025-04-07  1931  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1932  	list_add(&pcs->list, &pl->pcs_list);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1933  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1934  	/* Link phylink if we are started */
caf3ffea1bfa91 Christian Marangi     2025-04-07  1935  	if (!pl->phylink_disable_state)
caf3ffea1bfa91 Christian Marangi     2025-04-07  1936  		pcs->phylink = pl;
caf3ffea1bfa91 Christian Marangi     2025-04-07  1937  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1938  	/* Refresh supported interfaces */
caf3ffea1bfa91 Christian Marangi     2025-04-07  1939  	phy_interface_copy(pl->supported_interfaces,
caf3ffea1bfa91 Christian Marangi     2025-04-07  1940  			   pl->config->supported_interfaces);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1941  	list_for_each_entry(pcs, &pl->pcs_list, list)
caf3ffea1bfa91 Christian Marangi     2025-04-07  1942  		phy_interface_or(pl->supported_interfaces,
caf3ffea1bfa91 Christian Marangi     2025-04-07  1943  				 pl->supported_interfaces,
caf3ffea1bfa91 Christian Marangi     2025-04-07  1944  				 pcs->supported_interfaces);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1945  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1946  	mutex_lock(&pl->state_mutex);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1947  	/* Force an interface reconfig if major config fail */
caf3ffea1bfa91 Christian Marangi     2025-04-07  1948  	if (pl->major_config_failed)
caf3ffea1bfa91 Christian Marangi     2025-04-07  1949  		pl->reconfig_interface = true;
caf3ffea1bfa91 Christian Marangi     2025-04-07  1950  	mutex_unlock(&pl->state_mutex);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1951  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1952  	rtnl_unlock();
caf3ffea1bfa91 Christian Marangi     2025-04-07  1953  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1954  	phylink_run_resolve(pl);
caf3ffea1bfa91 Christian Marangi     2025-04-07  1955  
caf3ffea1bfa91 Christian Marangi     2025-04-07  1956  	return NOTIFY_OK;
caf3ffea1bfa91 Christian Marangi     2025-04-07  1957  }
caf3ffea1bfa91 Christian Marangi     2025-04-07  1958  
8796c8923d9c42 Russell King          2017-12-01  1959  /**
8796c8923d9c42 Russell King          2017-12-01  1960   * phylink_create() - create a phylink instance
9db74e51ec08d7 Randy Dunlap          2019-10-08  1961   * @config: a pointer to the target &struct phylink_config
8fa7b9b6af252c Russell King          2017-12-01  1962   * @fwnode: a pointer to a &struct fwnode_handle describing the network
8fa7b9b6af252c Russell King          2017-12-01  1963   *	interface
8796c8923d9c42 Russell King          2017-12-01  1964   * @iface: the desired link mode defined by &typedef phy_interface_t
e7765d634aaa9d Russell King          2020-03-30  1965   * @mac_ops: a pointer to a &struct phylink_mac_ops for the MAC.
8796c8923d9c42 Russell King          2017-12-01  1966   *
8796c8923d9c42 Russell King          2017-12-01  1967   * Create a new phylink instance, and parse the link parameters found in @np.
8796c8923d9c42 Russell King          2017-12-01  1968   * This will parse in-band modes, fixed-link or SFP configuration.
8796c8923d9c42 Russell King          2017-12-01  1969   *
269a6b5f23a688 Russell King          2019-11-19  1970   * Note: the rtnl lock must not be held when calling this function.
269a6b5f23a688 Russell King          2019-11-19  1971   *
8796c8923d9c42 Russell King          2017-12-01  1972   * Returns a pointer to a &struct phylink, or an error-pointer value. Users
8796c8923d9c42 Russell King          2017-12-01  1973   * must use IS_ERR() to check for errors from this function.
8796c8923d9c42 Russell King          2017-12-01  1974   */
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  1975  struct phylink *phylink_create(struct phylink_config *config,
a0b7955310a445 Russell King (Oracle  2023-05-12  1976) 			       const struct fwnode_handle *fwnode,
516b29edc3b332 Florian Fainelli      2017-10-30  1977  			       phy_interface_t iface,
e7765d634aaa9d Russell King          2020-03-30  1978  			       const struct phylink_mac_ops *mac_ops)
9525ae83959b60 Russell King          2017-07-25  1979  {
e39c3f7ebb0a20 Christian Marangi     2025-04-07  1980  	struct phylink_pcs *pcs;
9525ae83959b60 Russell King          2017-07-25  1981  	struct phylink *pl;
e39c3f7ebb0a20 Christian Marangi     2025-04-07  1982  	int i, ret;
9525ae83959b60 Russell King          2017-07-25  1983  
1054457006d4a1 Russell King (Oracle  2022-02-21  1984) 	/* Validate the supplied configuration */
de5c9bf40c4582 Russell King (Oracle  2023-05-20  1985) 	if (phy_interface_empty(config->supported_interfaces)) {
d1e86325af3771 Russell King (Oracle  2021-12-15  1986) 		dev_err(config->dev,
de5c9bf40c4582 Russell King (Oracle  2023-05-20  1987) 			"phylink: error: empty supported_interfaces\n");
d1e86325af3771 Russell King (Oracle  2021-12-15  1988) 		return ERR_PTR(-EINVAL);
d1e86325af3771 Russell King (Oracle  2021-12-15  1989) 	}
d1e86325af3771 Russell King (Oracle  2021-12-15  1990) 
9525ae83959b60 Russell King          2017-07-25  1991  	pl = kzalloc(sizeof(*pl), GFP_KERNEL);
9525ae83959b60 Russell King          2017-07-25  1992  	if (!pl)
9525ae83959b60 Russell King          2017-07-25  1993  		return ERR_PTR(-ENOMEM);
9525ae83959b60 Russell King          2017-07-25  1994  
9525ae83959b60 Russell King          2017-07-25  1995  	mutex_init(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  1996  	INIT_WORK(&pl->resolve, phylink_resolve);
e39c3f7ebb0a20 Christian Marangi     2025-04-07  1997  	INIT_LIST_HEAD(&pl->pcs_list);
e39c3f7ebb0a20 Christian Marangi     2025-04-07  1998  
e39c3f7ebb0a20 Christian Marangi     2025-04-07  1999  	/* Fill the PCS list with available PCS from phylink config */
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2000  	for (i = 0; i < config->num_available_pcs; i++) {
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2001  		pcs = config->available_pcs[i];
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2002  
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2003  		list_add(&pcs->list, &pl->pcs_list);
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2004  	}
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2005  
f7267952d8d0b9 Christian Marangi     2025-04-07  2006  	phy_interface_copy(pl->supported_interfaces,
f7267952d8d0b9 Christian Marangi     2025-04-07  2007  			   config->supported_interfaces);
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2008  	list_for_each_entry(pcs, &pl->pcs_list, list)
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2009  		phy_interface_or(pl->supported_interfaces,
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2010  				 pl->supported_interfaces,
e39c3f7ebb0a20 Christian Marangi     2025-04-07  2011  				 pcs->supported_interfaces);
f7267952d8d0b9 Christian Marangi     2025-04-07  2012  
caf3ffea1bfa91 Christian Marangi     2025-04-07  2013  	if (!phy_interface_empty(config->pcs_interfaces)) {
caf3ffea1bfa91 Christian Marangi     2025-04-07  2014  		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
caf3ffea1bfa91 Christian Marangi     2025-04-07 @2015  		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
caf3ffea1bfa91 Christian Marangi     2025-04-07  2016  	}
caf3ffea1bfa91 Christian Marangi     2025-04-07  2017  
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2018  	pl->config = config;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2019  	if (config->type == PHYLINK_NETDEV) {
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2020  		pl->netdev = to_net_dev(config->dev);
02d5fdbf4f2b8c Klaus Kudielka        2023-11-07  2021  		netif_carrier_off(pl->netdev);
43de61959b9992 Ioana Ciornei         2019-05-28  2022  	} else if (config->type == PHYLINK_DEV) {
43de61959b9992 Ioana Ciornei         2019-05-28  2023  		pl->dev = config->dev;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2024  	} else {
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2025  		kfree(pl);
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2026  		return ERR_PTR(-EINVAL);
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2027  	}
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2028  
2001d21592e5eb Russell King (Oracle  2025-02-10  2029) 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
03abf2a7c65451 Russell King (Oracle  2025-01-15  2030) 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  2031) 			       pl->config->lpi_capabilities &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  2032) 			       !phy_interface_empty(pl->config->lpi_interfaces);
03abf2a7c65451 Russell King (Oracle  2025-01-15  2033) 
03abf2a7c65451 Russell King (Oracle  2025-01-15  2034) 	/* Set the default EEE configuration */
03abf2a7c65451 Russell King (Oracle  2025-01-15  2035) 	pl->eee_cfg.eee_enabled = pl->config->eee_enabled_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2036) 	pl->eee_cfg.tx_lpi_enabled = pl->eee_cfg.eee_enabled;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2037) 	pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2038) 
9525ae83959b60 Russell King          2017-07-25  2039  	pl->phy_state.interface = iface;
9525ae83959b60 Russell King          2017-07-25  2040  	pl->link_interface = iface;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2041  	if (iface == PHY_INTERFACE_MODE_MOCA)
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2042  		pl->link_port = PORT_BNC;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2043  	else
9525ae83959b60 Russell King          2017-07-25  2044  		pl->link_port = PORT_MII;
9525ae83959b60 Russell King          2017-07-25  2045  	pl->link_config.interface = iface;
9525ae83959b60 Russell King          2017-07-25  2046  	pl->link_config.pause = MLO_PAUSE_AN;
9525ae83959b60 Russell King          2017-07-25  2047  	pl->link_config.speed = SPEED_UNKNOWN;
9525ae83959b60 Russell King          2017-07-25  2048  	pl->link_config.duplex = DUPLEX_UNKNOWN;
90ef0a7b0622c6 Russell King (Oracle  2023-07-13  2049) 	pl->pcs_state = PCS_STATE_DOWN;
e7765d634aaa9d Russell King          2020-03-30  2050  	pl->mac_ops = mac_ops;
9525ae83959b60 Russell King          2017-07-25  2051  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
9cd00a8aa42e44 Russell King          2018-05-10  2052  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
9525ae83959b60 Russell King          2017-07-25  2053  
ba50a8d4025808 Russell King (Oracle  2023-11-15  2054) 	linkmode_fill(pl->supported);
9525ae83959b60 Russell King          2017-07-25  2055  	linkmode_copy(pl->link_config.advertising, pl->supported);
9525ae83959b60 Russell King          2017-07-25  2056  	phylink_validate(pl, pl->supported, &pl->link_config);
9525ae83959b60 Russell King          2017-07-25  2057  
8fa7b9b6af252c Russell King          2017-12-01  2058  	ret = phylink_parse_mode(pl, fwnode);
9525ae83959b60 Russell King          2017-07-25  2059  	if (ret < 0) {
9525ae83959b60 Russell King          2017-07-25  2060  		kfree(pl);
9525ae83959b60 Russell King          2017-07-25  2061  		return ERR_PTR(ret);
9525ae83959b60 Russell King          2017-07-25  2062  	}
9525ae83959b60 Russell King          2017-07-25  2063  
24cf0e693bb50a Russell King          2019-12-11  2064  	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
8fa7b9b6af252c Russell King          2017-12-01  2065  		ret = phylink_parse_fixedlink(pl, fwnode);
9525ae83959b60 Russell King          2017-07-25  2066  		if (ret < 0) {
9525ae83959b60 Russell King          2017-07-25  2067  			kfree(pl);
9525ae83959b60 Russell King          2017-07-25  2068  			return ERR_PTR(ret);
9525ae83959b60 Russell King          2017-07-25  2069  		}
9525ae83959b60 Russell King          2017-07-25  2070  	}
9525ae83959b60 Russell King          2017-07-25  2071  
1f92ead7e15003 Russell King (Oracle  2024-12-03  2072) 	pl->req_link_an_mode = pl->cfg_link_an_mode;
24cf0e693bb50a Russell King          2019-12-11  2073  
8fa7b9b6af252c Russell King          2017-12-01  2074  	ret = phylink_register_sfp(pl, fwnode);
ce0aa27ff3f68e Russell King          2017-07-25  2075  	if (ret < 0) {
ce0aa27ff3f68e Russell King          2017-07-25  2076  		kfree(pl);
ce0aa27ff3f68e Russell King          2017-07-25  2077  		return ERR_PTR(ret);
ce0aa27ff3f68e Russell King          2017-07-25  2078  	}
ce0aa27ff3f68e Russell King          2017-07-25  2079  
9525ae83959b60 Russell King          2017-07-25  2080  	return pl;
9525ae83959b60 Russell King          2017-07-25  2081  }
9525ae83959b60 Russell King          2017-07-25  2082  EXPORT_SYMBOL_GPL(phylink_create);
9525ae83959b60 Russell King          2017-07-25  2083  

:::::: The code at line 1924 was first introduced by commit
:::::: caf3ffea1bfa916e55091e2ea5179913d3b0e2fb net: phylink: support late PCS provider attach

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
