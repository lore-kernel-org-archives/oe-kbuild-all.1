Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2905691
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 07:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689231944; x=1720767944;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wENiLVmyCH8SqgfT2Hsmwgqk8oeoingkvzuswXbDhYE=;
  b=COKHwD5fxX/wx9R3VZBV2s1mWWyWfdyy8ERgKDmcwoKyZXycDMbtrw7z
   PtTa6NhnQe/e46GJ4ZcIfKZNNuzDxhyU4ugvu4i3seBn5M6iox12V6roy
   YoEVbYSlOzSyuJtsOGuEh2bzPdw6Th00Rxy7r4bvXcQi3KB1+8oYJI+Lv
   V7c+TZMgRfB7HveOxuKFmniEvP3u1HMWkYPDE1/Ap33XBGxcxCOTd1pXC
   FxWN0XRyALZBM7bAi2UKbJQcAfIDH/7N1aempa1HXGSh4SuOaQlJfWu8O
   gl0o6m5yKvVnA9huU9g3CrudhwZT/RCaFoo+lcujXIEXx4DBejXOfJtCm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="355024233"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="355024233"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 00:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="751497742"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="751497742"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Jul 2023 00:05:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJqOR-0006Ll-2N;
	Thu, 13 Jul 2023 07:05:39 +0000
Date: Thu, 13 Jul 2023 15:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 99/101]
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:921:15: warning:
 assignment to 'const struct of_device_id *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202307131412.s25SHbps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: 8798796dea5e6f9d0c39223bd08906732f6e2b70 [99/101] of: header cleanups
config: powerpc-mgcoge_defconfig (https://download.01.org/0day-ci/archive/20230713/202307131412.s25SHbps-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131412.s25SHbps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131412.s25SHbps-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c: In function 'fs_enet_interrupt':
   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:321:40: warning: variable 'fpi' set but not used [-Wunused-but-set-variable]
     321 |         const struct fs_platform_info *fpi;
         |                                        ^~~
   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c: In function 'fs_enet_probe':
>> drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:921:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
     921 |         match = of_match_device(fs_enet_match, &ofdev->dev);
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
>> drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:921:15: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     921 |         match = of_match_device(fs_enet_match, &ofdev->dev);
         |               ^
   cc1: some warnings being treated as errors


vim +921 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c

8c02acd79867077 drivers/net/fs_enet/fs_enet-main.c                    Alexander Beregalov 2009-04-09   907  
94e5a2a88affa2f drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Fabian Frederick    2015-03-17   908  static const struct of_device_id fs_enet_match[];
4f2c53ea27a8d12 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Bill Pemberton      2012-12-03   909  static int fs_enet_probe(struct platform_device *ofdev)
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   910  {
b1608d69cb804e4 drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-05-18   911  	const struct of_device_id *match;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   912  	struct net_device *ndev;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   913  	struct fs_enet_private *fep;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   914  	struct fs_platform_info *fpi;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   915  	const u32 *data;
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   916  	struct clk *clk;
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   917  	int err;
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   918  	const char *phy_connection_type;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   919  	int privsize, len, ret = -ENODEV;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   920  
b1608d69cb804e4 drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-05-18  @921  	match = of_match_device(fs_enet_match, &ofdev->dev);
b1608d69cb804e4 drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-05-18   922  	if (!match)
74888760d40b3ac drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-02-22   923  		return -EINVAL;
74888760d40b3ac drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-02-22   924  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   925  	fpi = kzalloc(sizeof(*fpi), GFP_KERNEL);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   926  	if (!fpi)
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   927  		return -ENOMEM;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   928  
b1608d69cb804e4 drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-05-18   929  	if (!IS_FEC(match)) {
61c7a080a5a061c drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2010-04-13   930  		data = of_get_property(ofdev->dev.of_node, "fsl,cpm-command", &len);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   931  		if (!data || len != 4)
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   932  			goto out_free_fpi;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   933  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   934  		fpi->cp_command = *data;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   935  	}
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   936  
8572763af487285 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Leroy    2016-09-09   937  	fpi->rx_ring = RX_RING_SIZE;
8572763af487285 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Leroy    2016-09-09   938  	fpi->tx_ring = TX_RING_SIZE;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   939  	fpi->rx_copybreak = 240;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   940  	fpi->napi_weight = 17;
61c7a080a5a061c drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2010-04-13   941  	fpi->phy_node = of_parse_phandle(ofdev->dev.of_node, "phy-handle", 0);
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   942  	if (!fpi->phy_node && of_phy_is_fixed_link(ofdev->dev.of_node)) {
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   943  		err = of_phy_register_fixed_link(ofdev->dev.of_node);
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   944  		if (err)
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   945  			goto out_free_fpi;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   946  
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   947  		/* In the case of a fixed PHY, the DT node associated
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   948  		 * to the PHY is the Ethernet MAC DT node.
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   949  		 */
129cc83a0b7ed94 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Uwe Kleine-König    2014-08-07   950  		fpi->phy_node = of_node_get(ofdev->dev.of_node);
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   951  	}
bb74d9a4a87b071 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   952  
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   953  	if (of_device_is_compatible(ofdev->dev.of_node, "fsl,mpc5125-fec")) {
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   954  		phy_connection_type = of_get_property(ofdev->dev.of_node,
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   955  						"phy-connection-type", NULL);
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   956  		if (phy_connection_type && !strcmp("rmii", phy_connection_type))
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   957  			fpi->use_rmii = 1;
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   958  	}
ba568335b089e0a drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   959  
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   960  	/* make clock lookup non-fatal (the driver is shared among platforms),
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   961  	 * but require enable to succeed when a clock was specified/found,
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   962  	 * keep a reference to the clock upon successful acquisition
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   963  	 */
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   964  	clk = devm_clk_get(&ofdev->dev, "per");
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   965  	if (!IS_ERR(clk)) {
e9ea828f62891ca drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10   966  		ret = clk_prepare_enable(clk);
e9ea828f62891ca drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10   967  		if (ret)
b9755f03728b21c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28   968  			goto out_deregister_fixed_link;
e9ea828f62891ca drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10   969  
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   970  		fpi->clk_per = clk;
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   971  	}
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   972  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   973  	privsize = sizeof(*fep) +
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   974  	           sizeof(struct sk_buff **) *
4fc9b87bae25e84 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02   975  		     (fpi->rx_ring + fpi->tx_ring) +
4fc9b87bae25e84 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02   976  		   sizeof(char) * fpi->tx_ring;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   977  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   978  	ndev = alloc_etherdev(privsize);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   979  	if (!ndev) {
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   980  		ret = -ENOMEM;
e8f7f43a4ad451e drivers/net/fs_enet/fs_enet-main.c                    Julia Lawall        2010-09-04   981  		goto out_put;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   982  	}
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   983  
eedbc705f9a0945 drivers/net/fs_enet/fs_enet-main.c                    Anton Vorontsov     2009-07-16   984  	SET_NETDEV_DEV(ndev, &ofdev->dev);
8513fbd880093f0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jingoo Han          2013-05-23   985  	platform_set_drvdata(ofdev, ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   986  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   987  	fep = netdev_priv(ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   988  	fep->dev = &ofdev->dev;
f860f49ee2e59d1 drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-17   989  	fep->ndev = ndev;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   990  	fep->fpi = fpi;
b1608d69cb804e4 drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-05-18   991  	fep->ops = match->data;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   992  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   993  	ret = fep->ops->setup_data(ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   994  	if (ret)
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   995  		goto out_free_dev;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   996  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   997  	fep->rx_skbuff = (struct sk_buff **)&fep[1];
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   998  	fep->tx_skbuff = fep->rx_skbuff + fpi->rx_ring;
4fc9b87bae25e84 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02   999  	fep->mapped_as_page = (char *)(fep->rx_skbuff + fpi->rx_ring +
4fc9b87bae25e84 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02  1000  				       fpi->tx_ring);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1001  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1002  	spin_lock_init(&fep->lock);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1003  	spin_lock_init(&fep->tx_lock);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1004  
9ca01b25dffffec drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jakub Kicinski      2021-10-06  1005  	of_get_ethdev_address(ofdev->dev.of_node, ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1006  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1007  	ret = fep->ops->allocate_bd(ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1008  	if (ret)
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1009  		goto out_cleanup_data;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1010  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1011  	fep->rx_bd_base = fep->ring_base;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1012  	fep->tx_bd_base = fep->rx_bd_base + fpi->rx_ring;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1013  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1014  	fep->tx_ring = fpi->tx_ring;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1015  	fep->rx_ring = fpi->rx_ring;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1016  
8c02acd79867077 drivers/net/fs_enet/fs_enet-main.c                    Alexander Beregalov 2009-04-09  1017  	ndev->netdev_ops = &fs_enet_netdev_ops;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1018  	ndev->watchdog_timeo = 2 * HZ;
f8b39039cbf2a15 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Leroy    2018-01-16  1019  	INIT_WORK(&fep->timeout_work, fs_timeout_work);
b707b89f7be3614 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jakub Kicinski      2022-05-06  1020  	netif_napi_add_weight(ndev, &fep->napi, fs_enet_napi,
b707b89f7be3614 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jakub Kicinski      2022-05-06  1021  			      fpi->napi_weight);
f860f49ee2e59d1 drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-17  1022  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1023  	ndev->ethtool_ops = &fs_ethtool_ops;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1024  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1025  	netif_carrier_off(ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1026  
4fc9b87bae25e84 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02  1027  	ndev->features |= NETIF_F_SG;
4fc9b87bae25e84 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02  1028  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1029  	ret = register_netdev(ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1030  	if (ret)
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1031  		goto out_free_bd;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1032  
fcb6a1c83e48c30 drivers/net/fs_enet/fs_enet-main.c                    Anatolij Gustschin  2010-02-26  1033  	pr_info("%s: fs_enet: %pM\n", ndev->name, ndev->dev_addr);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1034  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1035  	return 0;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1036  
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1037  out_free_bd:
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1038  	fep->ops->free_bd(ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1039  out_cleanup_data:
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1040  	fep->ops->cleanup_data(ndev);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1041  out_free_dev:
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1042  	free_netdev(ndev);
e8f7f43a4ad451e drivers/net/fs_enet/fs_enet-main.c                    Julia Lawall        2010-09-04  1043  out_put:
2771399ac9986c7 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22  1044  	clk_disable_unprepare(fpi->clk_per);
b9755f03728b21c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28  1045  out_deregister_fixed_link:
1f8f1e89e0183e9 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10  1046  	of_node_put(fpi->phy_node);
b9755f03728b21c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28  1047  	if (of_phy_is_fixed_link(ofdev->dev.of_node))
b9755f03728b21c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28  1048  		of_phy_deregister_fixed_link(ofdev->dev.of_node);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1049  out_free_fpi:
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1050  	kfree(fpi);
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1051  	return ret;
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1052  }
976de6a8c304dcc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1053  

:::::: The code at line 921 was first introduced by commit
:::::: b1608d69cb804e414d0887140ba08a9398e4e638 drivercore: revert addition of of_match to struct device

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
