Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE42EC0A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765649356; cv=none; b=pG4SLwawBUFIlyxq9WevGkVS2g9LvfSefC+orZJ1E1oM4lUnPIgFh7Mlcb+kJcSpgzFO/fvgCcSCuB2De8msPcEcUgN48NBV/Yonh+uWMQ7npqz4hrIE4cwxVDzoCDw1tjXtfbYhuup55EsUy0X5Zem1+6acdp3BLDeOzq4vTG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765649356; c=relaxed/simple;
	bh=RssGaIAcPOj3JW0zXNkwRJFTQvacJHfxCZoVABZnjos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHnEtfy72u+vxMh1hPaLGacci4DlNXdnhRRcuGocNH3KI04fiDW1tQP1IrMdxV+GpJf2qtL6U0IZzOQmPuw5p9lYmWHxObqrgjtIiIXW0bqh7KgwUpFA2PWSwfpGi0NGKDQ7TAN3OHOqZ9dzhPB4o7X9cKnRK91gXn1GYDSwQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwpl1x9V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwpl1x9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765649354; x=1797185354;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RssGaIAcPOj3JW0zXNkwRJFTQvacJHfxCZoVABZnjos=;
  b=hwpl1x9Vknbyoxig9z4na2GDE9/nt+Y8OXsOFWT+v/0L27wiaYC1fhT0
   9v4+ei18o70E149Ej5ZkTwBFrikZHiKBuuICDn8PwrZHS4mIMvyDfx0Yr
   Ot0VYI2HrL3HHklkQRzQ9DBF1MDO6jV3ig9I4PNRedSOkysmm6qNQUqJB
   41ObGlOXnuJj7/uUIKN55VL3IexVIYVY9J9YQJZXUcKsm88RjM0mWq6Tm
   sGdfnC1Lire1lOx+4afDPCc8oSJZl9JvO0pKA4HKwQjBCoLGSFXmyErwa
   LRTfhbwmriO0bUT0I69rbQoXDwZ5iG/yDxAj4f7nuLcNW6u6+Sa3NARCo
   Q==;
X-CSE-ConnectionGUID: rGtWIXYySIipWqlGj07RCA==
X-CSE-MsgGUID: 2QPPWFj/QrGihdQuU1Gsbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67775003"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67775003"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:09:11 -0800
X-CSE-ConnectionGUID: Bz1rxpzISh6sH61abIDzuw==
X-CSE-MsgGUID: KfqjkLk4SDCeaTQEnZVlFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197344297"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 10:09:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUU3H-00000000823-1oJ1;
	Sat, 13 Dec 2025 18:09:07 +0000
Date: Sun, 14 Dec 2025 02:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-netnext-rss2 37/37]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5292:15: warning: unused
 variable 'sid'
Message-ID: <202512140158.xx9quSS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-netnext-rss2
head:   9f65663bfdad717c57c939e8289964fd6739884b
commit: 9f65663bfdad717c57c939e8289964fd6739884b [37/37] net: mediatek: fix r64 (but maybe break others again)
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140158.xx9quSS9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140158.xx9quSS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140158.xx9quSS9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5292:15: warning: unused variable 'sid' [-Wunused-variable]
    5292 |         unsigned int sid;
         |                      ^~~
   1 warning generated.


vim +/sid +5292 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin           2016-03-08  5284  
656e705243fd0c John Crispin           2016-03-08  5285  static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
656e705243fd0c John Crispin           2016-03-08  5286  {
656e705243fd0c John Crispin           2016-03-08  5287  	const __be32 *_id = of_get_property(np, "reg", NULL);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5288  	phy_interface_t phy_mode;
b8fc9f30821ec0 René van Dorst         2019-08-25  5289  	struct phylink *phylink;
b8fc9f30821ec0 René van Dorst         2019-08-25  5290  	struct mtk_mac *mac;
dd0341e3107285 Daniel Golle           2023-12-12  5291  	int id, err, count;
dd0341e3107285 Daniel Golle           2023-12-12 @5292  	unsigned int sid;
f63959c7eec315 Felix Fietkau          2022-11-16  5293  	int txqs = 1;
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5294) 	u32 val;
656e705243fd0c John Crispin           2016-03-08  5295  
656e705243fd0c John Crispin           2016-03-08  5296  	if (!_id) {
656e705243fd0c John Crispin           2016-03-08  5297  		dev_err(eth->dev, "missing mac id\n");
656e705243fd0c John Crispin           2016-03-08  5298  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5299  	}
656e705243fd0c John Crispin           2016-03-08  5300  
656e705243fd0c John Crispin           2016-03-08  5301  	id = be32_to_cpup(_id);
e05fd6274ee657 Lorenzo Bianconi       2023-07-25  5302  	if (id >= MTK_MAX_DEVS) {
656e705243fd0c John Crispin           2016-03-08  5303  		dev_err(eth->dev, "%d is not a valid mac id\n", id);
656e705243fd0c John Crispin           2016-03-08  5304  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5305  	}
656e705243fd0c John Crispin           2016-03-08  5306  
656e705243fd0c John Crispin           2016-03-08  5307  	if (eth->netdev[id]) {
656e705243fd0c John Crispin           2016-03-08  5308  		dev_err(eth->dev, "duplicate mac id found: %d\n", id);
656e705243fd0c John Crispin           2016-03-08  5309  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5310  	}
656e705243fd0c John Crispin           2016-03-08  5311  
f63959c7eec315 Felix Fietkau          2022-11-16  5312  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
f63959c7eec315 Felix Fietkau          2022-11-16  5313  		txqs = MTK_QDMA_NUM_QUEUES;
f63959c7eec315 Felix Fietkau          2022-11-16  5314  
f63959c7eec315 Felix Fietkau          2022-11-16  5315  	eth->netdev[id] = alloc_etherdev_mqs(sizeof(*mac), txqs, 1);
656e705243fd0c John Crispin           2016-03-08  5316  	if (!eth->netdev[id]) {
656e705243fd0c John Crispin           2016-03-08  5317  		dev_err(eth->dev, "alloc_etherdev failed\n");
656e705243fd0c John Crispin           2016-03-08  5318  		return -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5319  	}
656e705243fd0c John Crispin           2016-03-08  5320  	mac = netdev_priv(eth->netdev[id]);
656e705243fd0c John Crispin           2016-03-08  5321  	eth->mac[id] = mac;
656e705243fd0c John Crispin           2016-03-08  5322  	mac->id = id;
656e705243fd0c John Crispin           2016-03-08  5323  	mac->hw = eth;
656e705243fd0c John Crispin           2016-03-08  5324  	mac->of_node = np;
656e705243fd0c John Crispin           2016-03-08  5325  
1d6d537dc55d1f Daniel Golle           2023-07-13  5326  	err = of_get_ethdev_address(mac->of_node, eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5327  	if (err == -EPROBE_DEFER)
1d6d537dc55d1f Daniel Golle           2023-07-13  5328  		return err;
1d6d537dc55d1f Daniel Golle           2023-07-13  5329  
1d6d537dc55d1f Daniel Golle           2023-07-13  5330  	if (err) {
1d6d537dc55d1f Daniel Golle           2023-07-13  5331  		/* If the mac address is invalid, use random mac address */
1d6d537dc55d1f Daniel Golle           2023-07-13  5332  		eth_hw_addr_random(eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5333  		dev_err(eth->dev, "generated random MAC address %pM\n",
1d6d537dc55d1f Daniel Golle           2023-07-13  5334  			eth->netdev[id]->dev_addr);
1d6d537dc55d1f Daniel Golle           2023-07-13  5335  	}
1d6d537dc55d1f Daniel Golle           2023-07-13  5336  
ee40681037c0e5 Nelson Chang           2016-09-17  5337  	memset(mac->hwlro_ip, 0, sizeof(mac->hwlro_ip));
ee40681037c0e5 Nelson Chang           2016-09-17  5338  	mac->hwlro_ip_cnt = 0;
ee40681037c0e5 Nelson Chang           2016-09-17  5339  
656e705243fd0c John Crispin           2016-03-08  5340  	mac->hw_stats = devm_kzalloc(eth->dev,
656e705243fd0c John Crispin           2016-03-08  5341  				     sizeof(*mac->hw_stats),
656e705243fd0c John Crispin           2016-03-08  5342  				     GFP_KERNEL);
656e705243fd0c John Crispin           2016-03-08  5343  	if (!mac->hw_stats) {
656e705243fd0c John Crispin           2016-03-08  5344  		dev_err(eth->dev, "failed to allocate counter memory\n");
656e705243fd0c John Crispin           2016-03-08  5345  		err = -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5346  		goto free_netdev;
656e705243fd0c John Crispin           2016-03-08  5347  	}
656e705243fd0c John Crispin           2016-03-08  5348  	spin_lock_init(&mac->hw_stats->stats_lock);
d7005652cd31df sean.wang@mediatek.com 2016-08-13  5349  	u64_stats_init(&mac->hw_stats->syncp);
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5350  
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5351  	if (mtk_is_netsys_v3_or_greater(eth))
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5352  		mac->hw_stats->reg_offset = id * 0x80;
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5353  	else
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5354  		mac->hw_stats->reg_offset = id * 0x40;
656e705243fd0c John Crispin           2016-03-08  5355  
b8fc9f30821ec0 René van Dorst         2019-08-25  5356  	/* phylink create */
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5357  	err = of_get_phy_mode(np, &phy_mode);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5358  	if (err) {
b8fc9f30821ec0 René van Dorst         2019-08-25  5359  		dev_err(eth->dev, "incorrect phy-mode\n");
b8fc9f30821ec0 René van Dorst         2019-08-25  5360  		goto free_netdev;
b8fc9f30821ec0 René van Dorst         2019-08-25  5361  	}
b8fc9f30821ec0 René van Dorst         2019-08-25  5362  
b8fc9f30821ec0 René van Dorst         2019-08-25  5363  	/* mac config is not set */
b8fc9f30821ec0 René van Dorst         2019-08-25  5364  	mac->interface = PHY_INTERFACE_MODE_NA;
b8fc9f30821ec0 René van Dorst         2019-08-25  5365  	mac->speed = SPEED_UNKNOWN;
b8fc9f30821ec0 René van Dorst         2019-08-25  5366  
b8fc9f30821ec0 René van Dorst         2019-08-25  5367  	mac->phylink_config.dev = &eth->netdev[id]->dev;
b8fc9f30821ec0 René van Dorst         2019-08-25  5368  	mac->phylink_config.type = PHYLINK_NETDEV;
a4238f6ce151af Russell King (Oracle   2021-11-16  5369) 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
a4238f6ce151af Russell King (Oracle   2021-11-16  5370) 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
952d7325362ffb Qingfang Deng          2025-02-17  5371  	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
952d7325362ffb Qingfang Deng          2025-02-17  5372  		MAC_2500FD;
952d7325362ffb Qingfang Deng          2025-02-17  5373  	mac->phylink_config.lpi_timer_default = 1000;
dd0341e3107285 Daniel Golle           2023-12-12  5374  	mac->phylink_config.num_available_pcs = 0;
a4238f6ce151af Russell King (Oracle   2021-11-16  5375) 
76a4cb755cf911 Russell King (Oracle   2023-07-22  5376) 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
76a4cb755cf911 Russell King (Oracle   2023-07-22  5377) 	 * in its .mac_config method (since state->speed is not valid there.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5378) 	 * Disable support for MII, GMII and RGMII.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5379) 	 */
76a4cb755cf911 Russell King (Oracle   2023-07-22  5380) 	if (!mac->hw->soc->disable_pll_modes || mac->id != 0) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5381) 		__set_bit(PHY_INTERFACE_MODE_MII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5382) 			  mac->phylink_config.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5383) 		__set_bit(PHY_INTERFACE_MODE_GMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5384) 			  mac->phylink_config.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5385) 
83800d29f0c578 Russell King (Oracle   2021-11-16  5386) 		if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_RGMII))
83800d29f0c578 Russell King (Oracle   2021-11-16  5387) 			phy_interface_set_rgmii(mac->phylink_config.supported_interfaces);
76a4cb755cf911 Russell King (Oracle   2023-07-22  5388) 	}
83800d29f0c578 Russell King (Oracle   2021-11-16  5389) 
83800d29f0c578 Russell King (Oracle   2021-11-16  5390) 	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII) && !mac->id)
83800d29f0c578 Russell King (Oracle   2021-11-16  5391) 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5392) 			  mac->phylink_config.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5393) 
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5394) 	/* TRGMII is not permitted on MT7621 if using DDR2 */
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5395) 	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_GMAC1_TRGMII) &&
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5396) 	    MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII_MT7621_CLK)) {
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5397) 		regmap_read(eth->ethsys, ETHSYS_SYSCFG, &val);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5398) 		if (val & SYSCFG_DRAM_TYPE_DDR2)
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5399) 			__clear_bit(PHY_INTERFACE_MODE_TRGMII,
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5400) 				    mac->phylink_config.supported_interfaces);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5401) 	}
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5402) 
83800d29f0c578 Russell King (Oracle   2021-11-16  5403) 	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_SGMII)) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5404) 		__set_bit(PHY_INTERFACE_MODE_SGMII,
dd0341e3107285 Daniel Golle           2023-12-12  5405  			  mac->phylink_config.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5406) 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
dd0341e3107285 Daniel Golle           2023-12-12  5407  			  mac->phylink_config.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5408) 		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
dd0341e3107285 Daniel Golle           2023-12-12  5409  			  mac->phylink_config.pcs_interfaces);
2aa6ac881ad8b3 Frank Wunderlich       2025-12-10  5410  		dev_err(eth->dev, "DEBUG %s:%d MTK_SGMII\n",__func__,__LINE__);
dd0341e3107285 Daniel Golle           2023-12-12  5411  		if (mtk_is_netsys_v3_or_greater(mac->hw)) {
dd0341e3107285 Daniel Golle           2023-12-12  5412  			__set_bit(PHY_INTERFACE_MODE_5GBASER,
dd0341e3107285 Daniel Golle           2023-12-12  5413  				mac->phylink_config.pcs_interfaces);
dd0341e3107285 Daniel Golle           2023-12-12  5414  			__set_bit(PHY_INTERFACE_MODE_10GBASER,
dd0341e3107285 Daniel Golle           2023-12-12  5415  				mac->phylink_config.pcs_interfaces);
dd0341e3107285 Daniel Golle           2023-12-12  5416  			__set_bit(PHY_INTERFACE_MODE_USXGMII,
dd0341e3107285 Daniel Golle           2023-12-12  5417  				mac->phylink_config.pcs_interfaces);
dd0341e3107285 Daniel Golle           2023-12-12  5418  
dd0341e3107285 Daniel Golle           2023-12-12  5419  			err = fwnode_phylink_pcs_parse(of_fwnode_handle(np), NULL, &count);
dd0341e3107285 Daniel Golle           2023-12-12  5420  			if (err == -ENODEV) {
dd0341e3107285 Daniel Golle           2023-12-12  5421  				err = 0;
dd0341e3107285 Daniel Golle           2023-12-12  5422  				goto no_pcs;
83800d29f0c578 Russell King (Oracle   2021-11-16  5423) 			}
b8fc9f30821ec0 René van Dorst         2019-08-25  5424  
dd0341e3107285 Daniel Golle           2023-12-12  5425  			if (count > 2)
dd0341e3107285 Daniel Golle           2023-12-12  5426  				err = -ENOMEM;
dd0341e3107285 Daniel Golle           2023-12-12  5427  
dd0341e3107285 Daniel Golle           2023-12-12  5428  			if (err)
dd0341e3107285 Daniel Golle           2023-12-12  5429  				goto free_netdev;
dd0341e3107285 Daniel Golle           2023-12-12  5430  
dd0341e3107285 Daniel Golle           2023-12-12  5431  			err = fwnode_phylink_pcs_parse(of_fwnode_handle(np), mac->available_pcs, &count);
dd0341e3107285 Daniel Golle           2023-12-12  5432  			if (err)
dd0341e3107285 Daniel Golle           2023-12-12  5433  				goto free_netdev;
dd0341e3107285 Daniel Golle           2023-12-12  5434  
dd0341e3107285 Daniel Golle           2023-12-12  5435  			mac->phylink_config.available_pcs = mac->available_pcs;
dd0341e3107285 Daniel Golle           2023-12-12  5436  			mac->phylink_config.num_available_pcs = count;
2aa6ac881ad8b3 Frank Wunderlich       2025-12-10  5437  			dev_err(eth->dev, "DEBUG %s:%d available pcs: %d\n",__func__,__LINE__,count);
dd0341e3107285 Daniel Golle           2023-12-12  5438  		} else {
9f65663bfdad71 Frank Wunderlich       2025-12-11  5439  			/*sid = (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII)) ?
dd0341e3107285 Daniel Golle           2023-12-12  5440  			       0 : id;
dd0341e3107285 Daniel Golle           2023-12-12  5441  
dd0341e3107285 Daniel Golle           2023-12-12  5442  			mac->phylink_config.available_pcs = &eth->sgmii_pcs[sid];
9f65663bfdad71 Frank Wunderlich       2025-12-11  5443  			mac->phylink_config.num_available_pcs = 1;*/
9f65663bfdad71 Frank Wunderlich       2025-12-11  5444  			dev_err(eth->dev, "DEBUG %s:%d available pcs: 1 (fixed - dbg only id:%d)\n",__func__,__LINE__,id);
dd0341e3107285 Daniel Golle           2023-12-12  5445  		}
dd0341e3107285 Daniel Golle           2023-12-12  5446  
dd0341e3107285 Daniel Golle           2023-12-12  5447  		phy_interface_or(mac->phylink_config.supported_interfaces,
dd0341e3107285 Daniel Golle           2023-12-12  5448  				 mac->phylink_config.supported_interfaces,
dd0341e3107285 Daniel Golle           2023-12-12  5449  				 mac->phylink_config.pcs_interfaces);
dd0341e3107285 Daniel Golle           2023-12-12  5450  	}
2aa6ac881ad8b3 Frank Wunderlich       2025-12-10  5451  dev_err(eth->dev, "DEBUG %s:%d\n",__func__,__LINE__);
dd0341e3107285 Daniel Golle           2023-12-12  5452  no_pcs:
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5453  	if (mtk_is_netsys_v3_or_greater(mac->hw) &&
1bdea6fad6fb98 Bo-Cun Chen            2025-05-13  5454  	    MTK_HAS_CAPS(mac->hw->soc->caps, MTK_ESW) &&
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5455  	    id == MTK_GMAC1_ID) {
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5456  		mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5457  						       MAC_SYM_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5458  						       MAC_10000FD;
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5459  		phy_interface_zero(mac->phylink_config.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5460  		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5461  			  mac->phylink_config.supported_interfaces);
dd0341e3107285 Daniel Golle           2023-12-12  5462  	} else if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_USXGMII)) {
dd0341e3107285 Daniel Golle           2023-12-12  5463  		mac->phylink_config.mac_capabilities |= MAC_5000FD | MAC_10000FD;
dd0341e3107285 Daniel Golle           2023-12-12  5464  		__set_bit(PHY_INTERFACE_MODE_5GBASER,
dd0341e3107285 Daniel Golle           2023-12-12  5465  			  mac->phylink_config.supported_interfaces);
dd0341e3107285 Daniel Golle           2023-12-12  5466  		__set_bit(PHY_INTERFACE_MODE_10GBASER,
dd0341e3107285 Daniel Golle           2023-12-12  5467  			  mac->phylink_config.supported_interfaces);
dd0341e3107285 Daniel Golle           2023-12-12  5468  		__set_bit(PHY_INTERFACE_MODE_USXGMII,
dd0341e3107285 Daniel Golle           2023-12-12  5469  			  mac->phylink_config.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5470  	}
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5471  
51cf06ddafc91e Daniel Golle           2025-04-27  5472  	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_2P5GPHY) &&
51cf06ddafc91e Daniel Golle           2025-04-27  5473  	    id == MTK_GMAC2_ID)
51cf06ddafc91e Daniel Golle           2025-04-27  5474  		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
51cf06ddafc91e Daniel Golle           2025-04-27  5475  			  mac->phylink_config.supported_interfaces);
51cf06ddafc91e Daniel Golle           2025-04-27  5476  
2aa6ac881ad8b3 Frank Wunderlich       2025-12-10  5477  	dev_err(eth->dev, "DEBUG %s:%d\n",__func__,__LINE__);
656e705243fd0c John Crispin           2016-03-08  5478  	SET_NETDEV_DEV(eth->netdev[id], eth->dev);
eaadf9fd3f6390 John Crispin           2016-06-10  5479  	eth->netdev[id]->watchdog_timeo = 5 * HZ;
656e705243fd0c John Crispin           2016-03-08  5480  	eth->netdev[id]->netdev_ops = &mtk_netdev_ops;
656e705243fd0c John Crispin           2016-03-08  5481  	eth->netdev[id]->base_addr = (unsigned long)eth->base;
ee40681037c0e5 Nelson Chang           2016-09-17  5482  
296c9120752bab Stefan Roese           2019-08-16  5483  	eth->netdev[id]->hw_features = eth->soc->hw_features;
ee40681037c0e5 Nelson Chang           2016-09-17  5484  	if (eth->hwlro)
ee40681037c0e5 Nelson Chang           2016-09-17  5485  		eth->netdev[id]->hw_features |= NETIF_F_LRO;
ee40681037c0e5 Nelson Chang           2016-09-17  5486  
296c9120752bab Stefan Roese           2019-08-16  5487  	eth->netdev[id]->vlan_features = eth->soc->hw_features &
c6d96df9fa2c1d Felix Fietkau          2023-04-26  5488  		~NETIF_F_HW_VLAN_CTAG_TX;
296c9120752bab Stefan Roese           2019-08-16  5489  	eth->netdev[id]->features |= eth->soc->hw_features;
656e705243fd0c John Crispin           2016-03-08  5490  	eth->netdev[id]->ethtool_ops = &mtk_ethtool_ops;
656e705243fd0c John Crispin           2016-03-08  5491  
7a87e8aeafd394 Mason Chang            2025-03-19  5492  	eth->netdev[id]->irq = eth->irq_fe[MTK_FE_IRQ_SHARED];
3174b3b58cba69 Sean Wang              2017-04-07  5493  	eth->netdev[id]->dev.of_node = np;
3174b3b58cba69 Sean Wang              2017-04-07  5494  
dd0341e3107285 Daniel Golle           2023-12-12  5495  	phylink = phylink_create(&mac->phylink_config,
dd0341e3107285 Daniel Golle           2023-12-12  5496  				 of_fwnode_handle(mac->of_node),
dd0341e3107285 Daniel Golle           2023-12-12  5497  				 phy_mode, &mtk_phylink_ops);
dd0341e3107285 Daniel Golle           2023-12-12  5498  	if (IS_ERR(phylink)) {
dd0341e3107285 Daniel Golle           2023-12-12  5499  		err = PTR_ERR(phylink);
dd0341e3107285 Daniel Golle           2023-12-12  5500  		goto free_netdev;
dd0341e3107285 Daniel Golle           2023-12-12  5501  	}
dd0341e3107285 Daniel Golle           2023-12-12  5502  
2aa6ac881ad8b3 Frank Wunderlich       2025-12-10  5503  	dev_err(eth->dev, "DEBUG %s:%d\n",__func__,__LINE__);
dd0341e3107285 Daniel Golle           2023-12-12  5504  	mac->phylink = phylink;
dd0341e3107285 Daniel Golle           2023-12-12  5505  
4fd59792097a6b DENG Qingfang          2021-01-25  5506  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
555a893303872e Landen Chao            2020-07-29  5507  		eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
4fd59792097a6b DENG Qingfang          2021-01-25  5508  	else
4fd59792097a6b DENG Qingfang          2021-01-25  5509  		eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;
555a893303872e Landen Chao            2020-07-29  5510  
f63959c7eec315 Felix Fietkau          2022-11-16  5511  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
f63959c7eec315 Felix Fietkau          2022-11-16  5512  		mac->device_notifier.notifier_call = mtk_device_event;
f63959c7eec315 Felix Fietkau          2022-11-16  5513  		register_netdevice_notifier(&mac->device_notifier);
f63959c7eec315 Felix Fietkau          2022-11-16  5514  	}
f63959c7eec315 Felix Fietkau          2022-11-16  5515  
66c0e13ad236c7 Marek Majtyka          2023-02-01  5516  	if (mtk_page_pool_enabled(eth))
66c0e13ad236c7 Marek Majtyka          2023-02-01  5517  		eth->netdev[id]->xdp_features = NETDEV_XDP_ACT_BASIC |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5518  						NETDEV_XDP_ACT_REDIRECT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5519  						NETDEV_XDP_ACT_NDO_XMIT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5520  						NETDEV_XDP_ACT_NDO_XMIT_SG;
66c0e13ad236c7 Marek Majtyka          2023-02-01  5521  
2aa6ac881ad8b3 Frank Wunderlich       2025-12-10  5522  	dev_err(eth->dev, "DEBUG %s:%d\n",__func__,__LINE__);
656e705243fd0c John Crispin           2016-03-08  5523  	return 0;
656e705243fd0c John Crispin           2016-03-08  5524  
656e705243fd0c John Crispin           2016-03-08  5525  free_netdev:
656e705243fd0c John Crispin           2016-03-08  5526  	free_netdev(eth->netdev[id]);
656e705243fd0c John Crispin           2016-03-08  5527  	return err;
656e705243fd0c John Crispin           2016-03-08  5528  }
656e705243fd0c John Crispin           2016-03-08  5529  

:::::: The code at line 5292 was first introduced by commit
:::::: dd0341e310728560f48652afde5bbf5bde97b7e1 net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
