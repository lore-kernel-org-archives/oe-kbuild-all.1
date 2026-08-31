Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8693FCB33
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170383; cv=none; b=lcg7gKgmyiz81zVXR/wbpMdEKu3GWwSzd06GW8u0vCTNoXVz9u7O0+pvHx72xdlap7w6To4jqb84ZmHmYZIpw/SjTvsWZBqQ5k2rwJA5lhWf8gXeUiMHoOV1fDxND0FEFDcdjPrf+WU4gia/Zxkwsuwj0XxpkOPCJHmxyKS84wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170383; c=relaxed/simple;
	bh=yvYlu3zHtgGmtVXXPzUGsSlYxEB+AY/TAC8Amoxsn5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gvKox+tEZz88O4JHHFPWQnjd4e1xHtVN9TupftMkjHI2Wu1JTC56v3B4tpWMEx/AtusLU1qB8Yhzk/p3gzTqbZSOJOlABwM9hI0KmQH3upi8diJSH81l3CG2h5ypmHBuZ6ItC4ldpnm8y/RbVdmXLPjUyb+lycW00MuEgpeoDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRib9VLo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRib9VLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170381; x=1819706381;
  h=date:from:to:cc:subject:message-id;
  bh=yvYlu3zHtgGmtVXXPzUGsSlYxEB+AY/TAC8Amoxsn5E=;
  b=YRib9VLoYiXXz9BBxsvJllROhov/abA1y2XBsiV/TC19PqG4yKaenZ9D
   MyKA5HotI7EIqGKEueiQJg1V9eakMacgFQQkJiVy49mSzrWUnX71ozlIC
   rmvW9AbABQKmRBMEzPRtzTGt7g0hG9H0draB1mTVCfhbm8/qQVcKLxXmK
   RYXm7eDbMPxk6JlnWD3u9oOs0a5nH2hXL2rzW9qPUCfm2Bc7iUoDssf0a
   Sn/UUEQp5xqxyW8B96HRBQTzS2ohx7E6wuZlH5deimIiXqQry+2vY+sKO
   P+CiNGl5THuirH5eCrPjFP2ZysFr3Lq9PJzZlMUXFR7yScp3cy1dgI0rq
   Q==;
X-CSE-ConnectionGUID: ZJqXDEOhQ9alui8rqp4X5w==
X-CSE-MsgGUID: d4fSKfZCRmaJYzUUapqZLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92384375"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92384375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:59:40 -0700
X-CSE-ConnectionGUID: voAsxWIASPK2wjX0ry3a0Q==
X-CSE-MsgGUID: wlcSreCBT6+RwaYfifoxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265512011"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:59:37 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0ynf-000000000LZ-0t3O;
	Mon, 31 Aug 2026 09:59:35 +0000
Date: Mon, 31 Aug 2026 17:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 209/209]
 drivers/net/phy/phylink.c:2157:1: warning: label 'free_pl' defined but not
 used
Message-ID: <202608311739.1WrpUIUh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   63470c81335ce1106f6cebbf141b92a958a01e8a
commit: 72a3fd1408afa370643bca631b35d3bf25d30531 [209/209] net: ethernet: mediatek: mtkmux: harden mux/phylink lifecycle
config: arm64-randconfig-003-20260831 (https://download.01.org/0day-ci/archive/20260831/202608311739.1WrpUIUh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311739.1WrpUIUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608311739.1WrpUIUh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/phylink.c: In function 'phylink_create':
>> drivers/net/phy/phylink.c:2157:1: warning: label 'free_pl' defined but not used [-Wunused-label]
    2157 | free_pl:
         | ^~~~~~~


vim +/free_pl +2157 drivers/net/phy/phylink.c

dc0306cecdd5530 Christian Marangi     2025-04-06  2025  
8796c8923d9c429 Russell King          2017-12-01  2026  /**
8796c8923d9c429 Russell King          2017-12-01  2027   * phylink_create() - create a phylink instance
9db74e51ec08d75 Randy Dunlap          2019-10-08  2028   * @config: a pointer to the target &struct phylink_config
8fa7b9b6af252ca Russell King          2017-12-01  2029   * @fwnode: a pointer to a &struct fwnode_handle describing the network
8fa7b9b6af252ca Russell King          2017-12-01  2030   *	interface
8796c8923d9c429 Russell King          2017-12-01  2031   * @iface: the desired link mode defined by &typedef phy_interface_t
e7765d634aaa9dd Russell King          2020-03-30  2032   * @mac_ops: a pointer to a &struct phylink_mac_ops for the MAC.
8796c8923d9c429 Russell King          2017-12-01  2033   *
8796c8923d9c429 Russell King          2017-12-01  2034   * Create a new phylink instance, and parse the link parameters found in @np.
8796c8923d9c429 Russell King          2017-12-01  2035   * This will parse in-band modes, fixed-link or SFP configuration.
8796c8923d9c429 Russell King          2017-12-01  2036   *
269a6b5f23a6880 Russell King          2019-11-19  2037   * Note: the rtnl lock must not be held when calling this function.
269a6b5f23a6880 Russell King          2019-11-19  2038   *
8796c8923d9c429 Russell King          2017-12-01  2039   * Returns a pointer to a &struct phylink, or an error-pointer value. Users
8796c8923d9c429 Russell King          2017-12-01  2040   * must use IS_ERR() to check for errors from this function.
8796c8923d9c429 Russell King          2017-12-01  2041   */
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2042  struct phylink *phylink_create(struct phylink_config *config,
a0b7955310a445f Russell King (Oracle  2023-05-12  2043) 			       const struct fwnode_handle *fwnode,
516b29edc3b3324 Florian Fainelli      2017-10-30  2044  			       phy_interface_t iface,
e7765d634aaa9dd Russell King          2020-03-30  2045  			       const struct phylink_mac_ops *mac_ops)
9525ae83959b60c Russell King          2017-07-25  2046  {
03111cb5f23ecc8 Christian Marangi     2025-03-31  2047  	struct phylink_pcs *pcs;
9525ae83959b60c Russell King          2017-07-25  2048  	struct phylink *pl;
03111cb5f23ecc8 Christian Marangi     2025-03-31  2049  	int i, ret;
9525ae83959b60c Russell King          2017-07-25  2050  
1054457006d4a14 Russell King (Oracle  2022-02-21  2051) 	/* Validate the supplied configuration */
de5c9bf40c45827 Russell King (Oracle  2023-05-20  2052) 	if (phy_interface_empty(config->supported_interfaces)) {
d1e86325af37712 Russell King (Oracle  2021-12-15  2053) 		dev_err(config->dev,
de5c9bf40c45827 Russell King (Oracle  2023-05-20  2054) 			"phylink: error: empty supported_interfaces\n");
d1e86325af37712 Russell King (Oracle  2021-12-15  2055) 		return ERR_PTR(-EINVAL);
d1e86325af37712 Russell King (Oracle  2021-12-15  2056) 	}
d1e86325af37712 Russell King (Oracle  2021-12-15  2057) 
bf4afc53b77aeaa Linus Torvalds        2026-02-21  2058  	pl = kzalloc_obj(*pl);
9525ae83959b60c Russell King          2017-07-25  2059  	if (!pl)
9525ae83959b60c Russell King          2017-07-25  2060  		return ERR_PTR(-ENOMEM);
9525ae83959b60c Russell King          2017-07-25  2061  
0ba5b2f2c381dbe Vladimir Oltean       2025-09-04  2062  	mutex_init(&pl->phydev_mutex);
9525ae83959b60c Russell King          2017-07-25  2063  	mutex_init(&pl->state_mutex);
9525ae83959b60c Russell King          2017-07-25  2064  	INIT_WORK(&pl->resolve, phylink_resolve);
03111cb5f23ecc8 Christian Marangi     2025-03-31  2065  	INIT_LIST_HEAD(&pl->pcs_list);
03111cb5f23ecc8 Christian Marangi     2025-03-31  2066  
03111cb5f23ecc8 Christian Marangi     2025-03-31  2067  	/* Fill the PCS list with available PCS from phylink config */
03111cb5f23ecc8 Christian Marangi     2025-03-31  2068  	for (i = 0; i < config->num_available_pcs; i++) {
03111cb5f23ecc8 Christian Marangi     2025-03-31  2069  		pcs = config->available_pcs[i];
03111cb5f23ecc8 Christian Marangi     2025-03-31  2070  
03111cb5f23ecc8 Christian Marangi     2025-03-31  2071  		list_add(&pcs->list, &pl->pcs_list);
03111cb5f23ecc8 Christian Marangi     2025-03-31  2072  	}
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2073  
6c553f29f13dd6e Christian Marangi     2025-03-31  2074  	phy_interface_copy(pl->supported_interfaces,
6c553f29f13dd6e Christian Marangi     2025-03-31  2075  			   config->supported_interfaces);
03111cb5f23ecc8 Christian Marangi     2025-03-31  2076  	list_for_each_entry(pcs, &pl->pcs_list, list)
03111cb5f23ecc8 Christian Marangi     2025-03-31  2077  		phy_interface_or(pl->supported_interfaces,
03111cb5f23ecc8 Christian Marangi     2025-03-31  2078  				 pl->supported_interfaces,
03111cb5f23ecc8 Christian Marangi     2025-03-31  2079  				 pcs->supported_interfaces);
6c553f29f13dd6e Christian Marangi     2025-03-31  2080  
dc0306cecdd5530 Christian Marangi     2025-04-06  2081  	if (!phy_interface_empty(config->pcs_interfaces)) {
dc0306cecdd5530 Christian Marangi     2025-04-06  2082  		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
72a3fd1408afa37 Rudy Andram           2026-02-07  2083  		ret = register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
72a3fd1408afa37 Rudy Andram           2026-02-07  2084  		if (ret && ret != -EOPNOTSUPP) {
72a3fd1408afa37 Rudy Andram           2026-02-07  2085  			kfree(pl);
72a3fd1408afa37 Rudy Andram           2026-02-07  2086  			return ERR_PTR(ret);
72a3fd1408afa37 Rudy Andram           2026-02-07  2087  		}
72a3fd1408afa37 Rudy Andram           2026-02-07  2088  		pl->fwnode_pcs_nb_registered = !ret;
dc0306cecdd5530 Christian Marangi     2025-04-06  2089  	}
dc0306cecdd5530 Christian Marangi     2025-04-06  2090  
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2091  	pl->config = config;
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2092  	if (config->type == PHYLINK_NETDEV) {
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2093  		pl->netdev = to_net_dev(config->dev);
02d5fdbf4f2b8c4 Klaus Kudielka        2023-11-07  2094  		netif_carrier_off(pl->netdev);
43de61959b99927 Ioana Ciornei         2019-05-28  2095  	} else if (config->type == PHYLINK_DEV) {
43de61959b99927 Ioana Ciornei         2019-05-28  2096  		pl->dev = config->dev;
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2097  	} else {
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2098  		ret = -EINVAL;
72a3fd1408afa37 Rudy Andram           2026-02-07  2099  		goto err_unregister_fwnode_pcs_notifier;
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2100  	}
44cc27e43fa3b89 Ioana Ciornei         2019-05-28  2101  
2001d21592e5eb5 Russell King (Oracle  2025-02-10  2102) 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
03abf2a7c65451e Russell King (Oracle  2025-01-15  2103) 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
03abf2a7c65451e Russell King (Oracle  2025-01-15  2104) 			       pl->config->lpi_capabilities &&
03abf2a7c65451e Russell King (Oracle  2025-01-15  2105) 			       !phy_interface_empty(pl->config->lpi_interfaces);
03abf2a7c65451e Russell King (Oracle  2025-01-15  2106) 
03abf2a7c65451e Russell King (Oracle  2025-01-15  2107) 	/* Set the default EEE configuration */
03abf2a7c65451e Russell King (Oracle  2025-01-15  2108) 	pl->eee_cfg.eee_enabled = pl->config->eee_enabled_default;
03abf2a7c65451e Russell King (Oracle  2025-01-15  2109) 	pl->eee_cfg.tx_lpi_enabled = pl->eee_cfg.eee_enabled;
03abf2a7c65451e Russell King (Oracle  2025-01-15  2110) 	pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;
03abf2a7c65451e Russell King (Oracle  2025-01-15  2111) 
9525ae83959b60c Russell King          2017-07-25  2112  	pl->phy_state.interface = iface;
9525ae83959b60c Russell King          2017-07-25  2113  	pl->link_interface = iface;
4be11ef0bdf5b3a Florian Fainelli      2017-12-12  2114  	if (iface == PHY_INTERFACE_MODE_MOCA)
4be11ef0bdf5b3a Florian Fainelli      2017-12-12  2115  		pl->link_port = PORT_BNC;
4be11ef0bdf5b3a Florian Fainelli      2017-12-12  2116  	else
9525ae83959b60c Russell King          2017-07-25  2117  		pl->link_port = PORT_MII;
9525ae83959b60c Russell King          2017-07-25  2118  	pl->link_config.interface = iface;
9525ae83959b60c Russell King          2017-07-25  2119  	pl->link_config.pause = MLO_PAUSE_AN;
9525ae83959b60c Russell King          2017-07-25  2120  	pl->link_config.speed = SPEED_UNKNOWN;
9525ae83959b60c Russell King          2017-07-25  2121  	pl->link_config.duplex = DUPLEX_UNKNOWN;
90ef0a7b0622c62 Russell King (Oracle  2023-07-13  2122) 	pl->pcs_state = PCS_STATE_DOWN;
e7765d634aaa9dd Russell King          2020-03-30  2123  	pl->mac_ops = mac_ops;
9525ae83959b60c Russell King          2017-07-25  2124  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
9cd00a8aa42e44a Russell King          2018-05-10  2125  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
9525ae83959b60c Russell King          2017-07-25  2126  
ba50a8d40258081 Russell King (Oracle  2023-11-15  2127) 	linkmode_fill(pl->supported);
9525ae83959b60c Russell King          2017-07-25  2128  	linkmode_copy(pl->link_config.advertising, pl->supported);
9525ae83959b60c Russell King          2017-07-25  2129  	phylink_validate(pl, pl->supported, &pl->link_config);
9525ae83959b60c Russell King          2017-07-25  2130  
8fa7b9b6af252ca Russell King          2017-12-01  2131  	ret = phylink_parse_mode(pl, fwnode);
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2132  	if (ret < 0)
72a3fd1408afa37 Rudy Andram           2026-02-07  2133  		goto err_unregister_fwnode_pcs_notifier;
9525ae83959b60c Russell King          2017-07-25  2134  
24cf0e693bb50a6 Russell King          2019-12-11  2135  	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
8fa7b9b6af252ca Russell King          2017-12-01  2136  		ret = phylink_parse_fixedlink(pl, fwnode);
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2137  		if (ret < 0)
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2138  			goto release_link_gpio;
9525ae83959b60c Russell King          2017-07-25  2139  	}
9525ae83959b60c Russell King          2017-07-25  2140  
1f92ead7e15003f Russell King (Oracle  2024-12-03  2141) 	pl->req_link_an_mode = pl->cfg_link_an_mode;
24cf0e693bb50a6 Russell King          2019-12-11  2142  
8fa7b9b6af252ca Russell King          2017-12-01  2143  	ret = phylink_register_sfp(pl, fwnode);
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2144  	if (ret < 0)
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2145  		goto release_link_gpio;
ce0aa27ff3f68ed Russell King          2017-07-25  2146  
9525ae83959b60c Russell King          2017-07-25  2147  	return pl;
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2148  
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2149  release_link_gpio:
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2150  	if (pl->link_gpio)
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2151  		gpiod_put(pl->link_gpio);
72a3fd1408afa37 Rudy Andram           2026-02-07  2152  
72a3fd1408afa37 Rudy Andram           2026-02-07  2153  err_unregister_fwnode_pcs_notifier:
72a3fd1408afa37 Rudy Andram           2026-02-07  2154  	if (pl->fwnode_pcs_nb_registered)
72a3fd1408afa37 Rudy Andram           2026-02-07  2155  		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
72a3fd1408afa37 Rudy Andram           2026-02-07  2156  
0fe1e3e8f3380d7 Christian Marangi     2026-07-26 @2157  free_pl:
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2158  	kfree(pl);
0fe1e3e8f3380d7 Christian Marangi     2026-07-26  2159  	return ERR_PTR(ret);
9525ae83959b60c Russell King          2017-07-25  2160  }
9525ae83959b60c Russell King          2017-07-25  2161  EXPORT_SYMBOL_GPL(phylink_create);
9525ae83959b60c Russell King          2017-07-25  2162  

:::::: The code at line 2157 was first introduced by commit
:::::: 0fe1e3e8f3380d7862296a73b528d164e96c76b8 net: phylink: put link_gpio if phylink_create fails

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
