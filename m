Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAEE3DEAD6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175375; cv=none; b=rl8k+IPxL+ZshcGz3eyvTFP5IYZamvJcipDS/tPyYl5kVba5n6tiA5jujL+CFtXdJuIfVfb2461zdYA2N7hHhXruEkYiLWxOsOWk3pp2l0UHbKpWJvw7TMyUUYVh6MQ5Ci23/PuxXBzDqiE6QxrXzkAkjkr71ej4LmNm023QUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175375; c=relaxed/simple;
	bh=wF6of/ubpp43cJkKTRlqRJfSV9x1cQfgxkYJ+C3NANI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JfdvWKM4dfR+cB2hikiXuPOnTPKfh0IkSZFZdz10FkjD2vFzfpB08nI7gBTXcvrJB+0C713DOBlUgUQltMzCZjheDWgaqfCEc+c/bx8DPmWdiu+BvZlO+fqfSRDNr0vfJwhxeiQ2GJGMpLTwANnqZv9t/Vnpudq4dRVyOc8R2F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJnkbT48; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJnkbT48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788175372; x=1819711372;
  h=date:from:to:cc:subject:message-id;
  bh=wF6of/ubpp43cJkKTRlqRJfSV9x1cQfgxkYJ+C3NANI=;
  b=NJnkbT48UYXOIfKBz9bosc0ZlF0RLkNt2LZ/RciX7HJIc2atJtqjlfud
   asJwEhDd3iDi2XdDCsKBlKgJ8xHMJYL45Jv4doBBQQ2jryp8838tUURa5
   Nr66PZ3pFVTgWnOeTCvKY6zueaOKCfXlYU072z+ebo8ww2uTOhF5z9FWK
   mhZr97gYkDYOOl1x62odlX/sJhjtk3Plptcxq8P1TPkm/W0+yMcWnN085
   juJcRZX/OXF1bhFsJhF2KWW1BapxNw1ZhGuo98n+i5vM2dn+oFDFwl8rf
   vge6qNzAE1ZvSe5pFM+MB2WWTMh2r2rFYnrK0jGBkvY5awm4WxknvsS6+
   A==;
X-CSE-ConnectionGUID: VFnaDzNpQ5aFQRtO9ANxqw==
X-CSE-MsgGUID: DXJrdgUtTjydcbCzFBuGXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="91091794"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="91091794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:22:51 -0700
X-CSE-ConnectionGUID: LYG5b7YiR8Gq3JYsQO95MA==
X-CSE-MsgGUID: 8gdPdSghSu6gnFc9VhXk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="267436350"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 04:22:50 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x106B-000000000UJ-1P7y;
	Mon, 31 Aug 2026 11:22:47 +0000
Date: Mon, 31 Aug 2026 19:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 209/209]
 drivers/net/phy/phylink.c:2157:1: warning: unused label 'free_pl'
Message-ID: <202608311956.PajXYCVw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   63470c81335ce1106f6cebbf141b92a958a01e8a
commit: 72a3fd1408afa370643bca631b35d3bf25d30531 [209/209] net: ethernet: mediatek: mtkmux: harden mux/phylink lifecycle
config: x86_64-randconfig-161-20260831 (https://download.01.org/0day-ci/archive/20260831/202608311956.PajXYCVw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311956.PajXYCVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608311956.PajXYCVw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:2157:1: warning: unused label 'free_pl' [-Wunused-label]
    2157 | free_pl:
         | ^~~~~~~~
   1 warning generated.


vim +/free_pl +2157 drivers/net/phy/phylink.c

dc0306cecdd553 Christian Marangi     2025-04-06  2025  
8796c8923d9c42 Russell King          2017-12-01  2026  /**
8796c8923d9c42 Russell King          2017-12-01  2027   * phylink_create() - create a phylink instance
9db74e51ec08d7 Randy Dunlap          2019-10-08  2028   * @config: a pointer to the target &struct phylink_config
8fa7b9b6af252c Russell King          2017-12-01  2029   * @fwnode: a pointer to a &struct fwnode_handle describing the network
8fa7b9b6af252c Russell King          2017-12-01  2030   *	interface
8796c8923d9c42 Russell King          2017-12-01  2031   * @iface: the desired link mode defined by &typedef phy_interface_t
e7765d634aaa9d Russell King          2020-03-30  2032   * @mac_ops: a pointer to a &struct phylink_mac_ops for the MAC.
8796c8923d9c42 Russell King          2017-12-01  2033   *
8796c8923d9c42 Russell King          2017-12-01  2034   * Create a new phylink instance, and parse the link parameters found in @np.
8796c8923d9c42 Russell King          2017-12-01  2035   * This will parse in-band modes, fixed-link or SFP configuration.
8796c8923d9c42 Russell King          2017-12-01  2036   *
269a6b5f23a688 Russell King          2019-11-19  2037   * Note: the rtnl lock must not be held when calling this function.
269a6b5f23a688 Russell King          2019-11-19  2038   *
8796c8923d9c42 Russell King          2017-12-01  2039   * Returns a pointer to a &struct phylink, or an error-pointer value. Users
8796c8923d9c42 Russell King          2017-12-01  2040   * must use IS_ERR() to check for errors from this function.
8796c8923d9c42 Russell King          2017-12-01  2041   */
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2042  struct phylink *phylink_create(struct phylink_config *config,
a0b7955310a445 Russell King (Oracle  2023-05-12  2043) 			       const struct fwnode_handle *fwnode,
516b29edc3b332 Florian Fainelli      2017-10-30  2044  			       phy_interface_t iface,
e7765d634aaa9d Russell King          2020-03-30  2045  			       const struct phylink_mac_ops *mac_ops)
9525ae83959b60 Russell King          2017-07-25  2046  {
03111cb5f23ecc Christian Marangi     2025-03-31  2047  	struct phylink_pcs *pcs;
9525ae83959b60 Russell King          2017-07-25  2048  	struct phylink *pl;
03111cb5f23ecc Christian Marangi     2025-03-31  2049  	int i, ret;
9525ae83959b60 Russell King          2017-07-25  2050  
1054457006d4a1 Russell King (Oracle  2022-02-21  2051) 	/* Validate the supplied configuration */
de5c9bf40c4582 Russell King (Oracle  2023-05-20  2052) 	if (phy_interface_empty(config->supported_interfaces)) {
d1e86325af3771 Russell King (Oracle  2021-12-15  2053) 		dev_err(config->dev,
de5c9bf40c4582 Russell King (Oracle  2023-05-20  2054) 			"phylink: error: empty supported_interfaces\n");
d1e86325af3771 Russell King (Oracle  2021-12-15  2055) 		return ERR_PTR(-EINVAL);
d1e86325af3771 Russell King (Oracle  2021-12-15  2056) 	}
d1e86325af3771 Russell King (Oracle  2021-12-15  2057) 
bf4afc53b77aea Linus Torvalds        2026-02-21  2058  	pl = kzalloc_obj(*pl);
9525ae83959b60 Russell King          2017-07-25  2059  	if (!pl)
9525ae83959b60 Russell King          2017-07-25  2060  		return ERR_PTR(-ENOMEM);
9525ae83959b60 Russell King          2017-07-25  2061  
0ba5b2f2c381db Vladimir Oltean       2025-09-04  2062  	mutex_init(&pl->phydev_mutex);
9525ae83959b60 Russell King          2017-07-25  2063  	mutex_init(&pl->state_mutex);
9525ae83959b60 Russell King          2017-07-25  2064  	INIT_WORK(&pl->resolve, phylink_resolve);
03111cb5f23ecc Christian Marangi     2025-03-31  2065  	INIT_LIST_HEAD(&pl->pcs_list);
03111cb5f23ecc Christian Marangi     2025-03-31  2066  
03111cb5f23ecc Christian Marangi     2025-03-31  2067  	/* Fill the PCS list with available PCS from phylink config */
03111cb5f23ecc Christian Marangi     2025-03-31  2068  	for (i = 0; i < config->num_available_pcs; i++) {
03111cb5f23ecc Christian Marangi     2025-03-31  2069  		pcs = config->available_pcs[i];
03111cb5f23ecc Christian Marangi     2025-03-31  2070  
03111cb5f23ecc Christian Marangi     2025-03-31  2071  		list_add(&pcs->list, &pl->pcs_list);
03111cb5f23ecc Christian Marangi     2025-03-31  2072  	}
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2073  
6c553f29f13dd6 Christian Marangi     2025-03-31  2074  	phy_interface_copy(pl->supported_interfaces,
6c553f29f13dd6 Christian Marangi     2025-03-31  2075  			   config->supported_interfaces);
03111cb5f23ecc Christian Marangi     2025-03-31  2076  	list_for_each_entry(pcs, &pl->pcs_list, list)
03111cb5f23ecc Christian Marangi     2025-03-31  2077  		phy_interface_or(pl->supported_interfaces,
03111cb5f23ecc Christian Marangi     2025-03-31  2078  				 pl->supported_interfaces,
03111cb5f23ecc Christian Marangi     2025-03-31  2079  				 pcs->supported_interfaces);
6c553f29f13dd6 Christian Marangi     2025-03-31  2080  
dc0306cecdd553 Christian Marangi     2025-04-06  2081  	if (!phy_interface_empty(config->pcs_interfaces)) {
dc0306cecdd553 Christian Marangi     2025-04-06  2082  		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
72a3fd1408afa3 Rudy Andram           2026-02-07  2083  		ret = register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
72a3fd1408afa3 Rudy Andram           2026-02-07  2084  		if (ret && ret != -EOPNOTSUPP) {
72a3fd1408afa3 Rudy Andram           2026-02-07  2085  			kfree(pl);
72a3fd1408afa3 Rudy Andram           2026-02-07  2086  			return ERR_PTR(ret);
72a3fd1408afa3 Rudy Andram           2026-02-07  2087  		}
72a3fd1408afa3 Rudy Andram           2026-02-07  2088  		pl->fwnode_pcs_nb_registered = !ret;
dc0306cecdd553 Christian Marangi     2025-04-06  2089  	}
dc0306cecdd553 Christian Marangi     2025-04-06  2090  
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2091  	pl->config = config;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2092  	if (config->type == PHYLINK_NETDEV) {
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2093  		pl->netdev = to_net_dev(config->dev);
02d5fdbf4f2b8c Klaus Kudielka        2023-11-07  2094  		netif_carrier_off(pl->netdev);
43de61959b9992 Ioana Ciornei         2019-05-28  2095  	} else if (config->type == PHYLINK_DEV) {
43de61959b9992 Ioana Ciornei         2019-05-28  2096  		pl->dev = config->dev;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2097  	} else {
0fe1e3e8f3380d Christian Marangi     2026-07-26  2098  		ret = -EINVAL;
72a3fd1408afa3 Rudy Andram           2026-02-07  2099  		goto err_unregister_fwnode_pcs_notifier;
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2100  	}
44cc27e43fa3b8 Ioana Ciornei         2019-05-28  2101  
2001d21592e5eb Russell King (Oracle  2025-02-10  2102) 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
03abf2a7c65451 Russell King (Oracle  2025-01-15  2103) 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  2104) 			       pl->config->lpi_capabilities &&
03abf2a7c65451 Russell King (Oracle  2025-01-15  2105) 			       !phy_interface_empty(pl->config->lpi_interfaces);
03abf2a7c65451 Russell King (Oracle  2025-01-15  2106) 
03abf2a7c65451 Russell King (Oracle  2025-01-15  2107) 	/* Set the default EEE configuration */
03abf2a7c65451 Russell King (Oracle  2025-01-15  2108) 	pl->eee_cfg.eee_enabled = pl->config->eee_enabled_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2109) 	pl->eee_cfg.tx_lpi_enabled = pl->eee_cfg.eee_enabled;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2110) 	pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;
03abf2a7c65451 Russell King (Oracle  2025-01-15  2111) 
9525ae83959b60 Russell King          2017-07-25  2112  	pl->phy_state.interface = iface;
9525ae83959b60 Russell King          2017-07-25  2113  	pl->link_interface = iface;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2114  	if (iface == PHY_INTERFACE_MODE_MOCA)
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2115  		pl->link_port = PORT_BNC;
4be11ef0bdf5b3 Florian Fainelli      2017-12-12  2116  	else
9525ae83959b60 Russell King          2017-07-25  2117  		pl->link_port = PORT_MII;
9525ae83959b60 Russell King          2017-07-25  2118  	pl->link_config.interface = iface;
9525ae83959b60 Russell King          2017-07-25  2119  	pl->link_config.pause = MLO_PAUSE_AN;
9525ae83959b60 Russell King          2017-07-25  2120  	pl->link_config.speed = SPEED_UNKNOWN;
9525ae83959b60 Russell King          2017-07-25  2121  	pl->link_config.duplex = DUPLEX_UNKNOWN;
90ef0a7b0622c6 Russell King (Oracle  2023-07-13  2122) 	pl->pcs_state = PCS_STATE_DOWN;
e7765d634aaa9d Russell King          2020-03-30  2123  	pl->mac_ops = mac_ops;
9525ae83959b60 Russell King          2017-07-25  2124  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
9cd00a8aa42e44 Russell King          2018-05-10  2125  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
9525ae83959b60 Russell King          2017-07-25  2126  
ba50a8d4025808 Russell King (Oracle  2023-11-15  2127) 	linkmode_fill(pl->supported);
9525ae83959b60 Russell King          2017-07-25  2128  	linkmode_copy(pl->link_config.advertising, pl->supported);
9525ae83959b60 Russell King          2017-07-25  2129  	phylink_validate(pl, pl->supported, &pl->link_config);
9525ae83959b60 Russell King          2017-07-25  2130  
8fa7b9b6af252c Russell King          2017-12-01  2131  	ret = phylink_parse_mode(pl, fwnode);
0fe1e3e8f3380d Christian Marangi     2026-07-26  2132  	if (ret < 0)
72a3fd1408afa3 Rudy Andram           2026-02-07  2133  		goto err_unregister_fwnode_pcs_notifier;
9525ae83959b60 Russell King          2017-07-25  2134  
24cf0e693bb50a Russell King          2019-12-11  2135  	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
8fa7b9b6af252c Russell King          2017-12-01  2136  		ret = phylink_parse_fixedlink(pl, fwnode);
0fe1e3e8f3380d Christian Marangi     2026-07-26  2137  		if (ret < 0)
0fe1e3e8f3380d Christian Marangi     2026-07-26  2138  			goto release_link_gpio;
9525ae83959b60 Russell King          2017-07-25  2139  	}
9525ae83959b60 Russell King          2017-07-25  2140  
1f92ead7e15003 Russell King (Oracle  2024-12-03  2141) 	pl->req_link_an_mode = pl->cfg_link_an_mode;
24cf0e693bb50a Russell King          2019-12-11  2142  
8fa7b9b6af252c Russell King          2017-12-01  2143  	ret = phylink_register_sfp(pl, fwnode);
0fe1e3e8f3380d Christian Marangi     2026-07-26  2144  	if (ret < 0)
0fe1e3e8f3380d Christian Marangi     2026-07-26  2145  		goto release_link_gpio;
ce0aa27ff3f68e Russell King          2017-07-25  2146  
9525ae83959b60 Russell King          2017-07-25  2147  	return pl;
0fe1e3e8f3380d Christian Marangi     2026-07-26  2148  
0fe1e3e8f3380d Christian Marangi     2026-07-26  2149  release_link_gpio:
0fe1e3e8f3380d Christian Marangi     2026-07-26  2150  	if (pl->link_gpio)
0fe1e3e8f3380d Christian Marangi     2026-07-26  2151  		gpiod_put(pl->link_gpio);
72a3fd1408afa3 Rudy Andram           2026-02-07  2152  
72a3fd1408afa3 Rudy Andram           2026-02-07  2153  err_unregister_fwnode_pcs_notifier:
72a3fd1408afa3 Rudy Andram           2026-02-07  2154  	if (pl->fwnode_pcs_nb_registered)
72a3fd1408afa3 Rudy Andram           2026-02-07  2155  		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
72a3fd1408afa3 Rudy Andram           2026-02-07  2156  
0fe1e3e8f3380d Christian Marangi     2026-07-26 @2157  free_pl:
0fe1e3e8f3380d Christian Marangi     2026-07-26  2158  	kfree(pl);
0fe1e3e8f3380d Christian Marangi     2026-07-26  2159  	return ERR_PTR(ret);
9525ae83959b60 Russell King          2017-07-25  2160  }
9525ae83959b60 Russell King          2017-07-25  2161  EXPORT_SYMBOL_GPL(phylink_create);
9525ae83959b60 Russell King          2017-07-25  2162  

:::::: The code at line 2157 was first introduced by commit
:::::: 0fe1e3e8f3380d7862296a73b528d164e96c76b8 net: phylink: put link_gpio if phylink_create fails

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
