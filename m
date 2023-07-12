Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8923780E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 03:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689134321; x=1720670321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SG3VQld69JEwdUIVgJRlXkL+DPG/gG/WeM8PwUkFHKc=;
  b=FRIJ/JPBCd8Arwr/a2V1GWh+4csmjy6VMHvr7XQhdIS/nieYTxh3vhzH
   Tt6tAvbNfkRkN+YkEBH8Z5P8CWoslKQ6E/5pNErujA/2VCuPL3fi+7LVH
   nb+3uSwICSgNwr6H+pjpML6U3sOItv0q5XReqJcS/79ef69jLo4UHP0Ck
   sS+TFwZLDZ90PW/jUGBWNtPP9BXjWweAkAPzkhOAjeJ4cebCTbOXO6AU7
   nsy8EO30K4bJx6XuXKzpfILOaun88HDIgTDXRyl1ISXruzRNx8NWywMFU
   /IdcNppCd52GnlHcph5LG/6rQN5+quQsUjHGG6nQE0av9Vbu16PKpOv4I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368328625"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="368328625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 20:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786883999"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="786883999"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jul 2023 20:58:39 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJQzu-0005MF-1a;
	Wed, 12 Jul 2023 03:58:38 +0000
Date: Wed, 12 Jul 2023 11:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 56/74]
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c:2043:15: warning:
 assignment to 'const struct of_device_id *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202307121130.u7DlDvhr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3fabe2c33fe8811c575713da027ca6bea22d7d5b
commit: 95f2e6ade536d7fb3b008732afc065bc27296292 [56/74] net: Explicitly include correct DT includes
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307121130.u7DlDvhr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121130.u7DlDvhr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121130.u7DlDvhr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/apm/xgene/xgene_enet_main.c: In function 'xgene_enet_probe':
   drivers/net/ethernet/apm/xgene/xgene_enet_main.c:2043:17: error: implicit declaration of function 'of_match_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
    2043 |         of_id = of_match_device(xgene_enet_of_match, &pdev->dev);
         |                 ^~~~~~~~~~~~~~~
         |                 acpi_match_device
>> drivers/net/ethernet/apm/xgene/xgene_enet_main.c:2043:15: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2043 |         of_id = of_match_device(xgene_enet_of_match, &pdev->dev);
         |               ^
   cc1: some warnings being treated as errors


vim +2043 drivers/net/ethernet/apm/xgene/xgene_enet_main.c

1f3d62090d3ba4 Arnd Bergmann       2017-02-01  2015  
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2016  static int xgene_enet_probe(struct platform_device *pdev)
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2017  {
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2018  	struct net_device *ndev;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2019  	struct xgene_enet_pdata *pdata;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2020  	struct device *dev = &pdev->dev;
8089a96f601bdf Iyappan Subramanian 2016-07-25  2021  	void (*link_state)(struct work_struct *);
bc1b7c132a09d8 Iyappan Subramanian 2015-04-28  2022  	const struct of_device_id *of_id;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2023  	int ret;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2024  
107dec2749fed1 Iyappan Subramanian 2016-02-17  2025  	ndev = alloc_etherdev_mqs(sizeof(struct xgene_enet_pdata),
5a44c71ccda60a Christophe JAILLET  2020-01-26  2026  				  XGENE_NUM_TX_RING, XGENE_NUM_RX_RING);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2027  	if (!ndev)
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2028  		return -ENOMEM;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2029  
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2030  	pdata = netdev_priv(ndev);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2031  
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2032  	pdata->pdev = pdev;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2033  	pdata->ndev = ndev;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2034  	SET_NETDEV_DEV(ndev, dev);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2035  	platform_set_drvdata(pdev, pdata);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2036  	ndev->netdev_ops = &xgene_ndev_ops;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2037  	xgene_enet_set_ethtool_ops(ndev);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2038  	ndev->features |= NETIF_F_IP_CSUM |
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2039  			  NETIF_F_GSO |
9b00eb494dc7c1 Iyappan Subramanian 2015-08-26  2040  			  NETIF_F_GRO |
9b00eb494dc7c1 Iyappan Subramanian 2015-08-26  2041  			  NETIF_F_SG;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2042  
bc1b7c132a09d8 Iyappan Subramanian 2015-04-28 @2043  	of_id = of_match_device(xgene_enet_of_match, &pdev->dev);
bc1b7c132a09d8 Iyappan Subramanian 2015-04-28  2044  	if (of_id) {
bc1b7c132a09d8 Iyappan Subramanian 2015-04-28  2045  		pdata->enet_id = (enum xgene_enet_id)of_id->data;
0738c54d63249b Suman Tripathi      2015-06-23  2046  	}
0738c54d63249b Suman Tripathi      2015-06-23  2047  #ifdef CONFIG_ACPI
0738c54d63249b Suman Tripathi      2015-06-23  2048  	else {
0738c54d63249b Suman Tripathi      2015-06-23  2049  		const struct acpi_device_id *acpi_id;
0738c54d63249b Suman Tripathi      2015-06-23  2050  
0738c54d63249b Suman Tripathi      2015-06-23  2051  		acpi_id = acpi_match_device(xgene_enet_acpi_match, &pdev->dev);
0738c54d63249b Suman Tripathi      2015-06-23  2052  		if (acpi_id)
0738c54d63249b Suman Tripathi      2015-06-23  2053  			pdata->enet_id = (enum xgene_enet_id) acpi_id->driver_data;
0738c54d63249b Suman Tripathi      2015-06-23  2054  	}
0738c54d63249b Suman Tripathi      2015-06-23  2055  #endif
bc1b7c132a09d8 Iyappan Subramanian 2015-04-28  2056  	if (!pdata->enet_id) {
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2057  		ret = -ENODEV;
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2058  		goto err;
bc1b7c132a09d8 Iyappan Subramanian 2015-04-28  2059  	}
bc1b7c132a09d8 Iyappan Subramanian 2015-04-28  2060  
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2061  	ret = xgene_enet_get_resources(pdata);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2062  	if (ret)
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2063  		goto err;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2064  
d0eb74582fa7b5 Iyappan Subramanian 2014-10-09  2065  	xgene_enet_setup_ops(pdata);
ae1aed95d0255a Iyappan Subramanian 2017-05-10  2066  	spin_lock_init(&pdata->mac_lock);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2067  
9b00eb494dc7c1 Iyappan Subramanian 2015-08-26  2068  	if (pdata->phy_mode == PHY_INTERFACE_MODE_XGMII) {
0a0400c3094b5d Iyappan Subramanian 2017-03-15  2069  		ndev->features |= NETIF_F_TSO | NETIF_F_RXCSUM;
e3978673f514fa Iyappan Subramanian 2016-09-22  2070  		spin_lock_init(&pdata->mss_lock);
9b00eb494dc7c1 Iyappan Subramanian 2015-08-26  2071  	}
9b00eb494dc7c1 Iyappan Subramanian 2015-08-26  2072  	ndev->hw_features = ndev->features;
9b00eb494dc7c1 Iyappan Subramanian 2015-08-26  2073  
aeb20b6b3f4e1f Iyappan Subramanian 2015-11-23  2074  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2075  	if (ret) {
aeb20b6b3f4e1f Iyappan Subramanian 2015-11-23  2076  		netdev_err(ndev, "No usable DMA configuration\n");
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2077  		goto err;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2078  	}
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2079  
183db481279437 Quan Nguyen         2017-08-29  2080  	xgene_enet_check_phy_handle(pdata);
183db481279437 Quan Nguyen         2017-08-29  2081  
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2082  	ret = xgene_enet_init_hw(pdata);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2083  	if (ret)
183db481279437 Quan Nguyen         2017-08-29  2084  		goto err2;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2085  
8089a96f601bdf Iyappan Subramanian 2016-07-25  2086  	link_state = pdata->mac_ops->link_state;
8089a96f601bdf Iyappan Subramanian 2016-07-25  2087  	if (pdata->phy_mode == PHY_INTERFACE_MODE_XGMII) {
8089a96f601bdf Iyappan Subramanian 2016-07-25  2088  		INIT_DELAYED_WORK(&pdata->link_work, link_state);
8089a96f601bdf Iyappan Subramanian 2016-07-25  2089  	} else if (!pdata->mdio_driver) {
326dde3e3b2ed0 Iyappan Subramanian 2017-05-18  2090  		if (phy_interface_mode_is_rgmii(pdata->phy_mode))
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2091  			ret = xgene_enet_mdio_config(pdata);
8089a96f601bdf Iyappan Subramanian 2016-07-25  2092  		else
8089a96f601bdf Iyappan Subramanian 2016-07-25  2093  			INIT_DELAYED_WORK(&pdata->link_work, link_state);
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2094  
8089a96f601bdf Iyappan Subramanian 2016-07-25  2095  		if (ret)
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2096  			goto err1;
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2097  	}
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2098  
2d07d8e4f0536e Quan Nguyen         2017-05-10  2099  	spin_lock_init(&pdata->stats_lock);
2d07d8e4f0536e Quan Nguyen         2017-05-10  2100  	ret = xgene_extd_stats_init(pdata);
2d07d8e4f0536e Quan Nguyen         2017-05-10  2101  	if (ret)
183db481279437 Quan Nguyen         2017-08-29  2102  		goto err1;
2d07d8e4f0536e Quan Nguyen         2017-05-10  2103  
aeb20b6b3f4e1f Iyappan Subramanian 2015-11-23  2104  	xgene_enet_napi_add(pdata);
cb0366b7c16427 Iyappan Subramanian 2016-07-25  2105  	ret = register_netdev(ndev);
cb0366b7c16427 Iyappan Subramanian 2016-07-25  2106  	if (ret) {
cb0366b7c16427 Iyappan Subramanian 2016-07-25  2107  		netdev_err(ndev, "Failed to register netdev\n");
183db481279437 Quan Nguyen         2017-08-29  2108  		goto err1;
cb0366b7c16427 Iyappan Subramanian 2016-07-25  2109  	}
cb0366b7c16427 Iyappan Subramanian 2016-07-25  2110  
aeb20b6b3f4e1f Iyappan Subramanian 2015-11-23  2111  	return 0;
cb0366b7c16427 Iyappan Subramanian 2016-07-25  2112  
183db481279437 Quan Nguyen         2017-08-29  2113  err1:
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2114  	/*
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2115  	 * If necessary, free_netdev() will call netif_napi_del() and undo
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2116  	 * the effects of xgene_enet_napi_add()'s calls to netif_napi_add().
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2117  	 */
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2118  
183db481279437 Quan Nguyen         2017-08-29  2119  	xgene_enet_delete_desc_rings(pdata);
183db481279437 Quan Nguyen         2017-08-29  2120  
183db481279437 Quan Nguyen         2017-08-29  2121  err2:
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2122  	if (pdata->mdio_driver)
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2123  		xgene_enet_phy_disconnect(pdata);
326dde3e3b2ed0 Iyappan Subramanian 2017-05-18  2124  	else if (phy_interface_mode_is_rgmii(pdata->phy_mode))
cecd6e510c65b2 Iyappan Subramanian 2016-08-12  2125  		xgene_enet_mdio_remove(pdata);
20decb7e486d7e Matthias Brugger    2016-05-03  2126  err:
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2127  	free_netdev(ndev);
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2128  	return ret;
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2129  }
e6ad767305eb6e Iyappan Subramanian 2014-08-07  2130  

:::::: The code at line 2043 was first introduced by commit
:::::: bc1b7c132a09d84a22e1a15a76d2eb6eb916d217 drivers: net: xgene: Add 10GbE support with ring manager v2

:::::: TO: Iyappan Subramanian <isubramanian@apm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
