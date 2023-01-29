Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3C17C8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 02:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674960008; x=1706496008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMqqzU7mJzFgQiL259aQYAW6ki68btaudtzTT4an0Qk=;
  b=OR6YFa6HaZOwDHTsTSxt0+1hk1zhdcXNLmc2z/pcVsh5d0Vjpb7g4YqY
   6b+QQAVc+2uixdxV+1wKPX4RpCAeVQiQFTDcBFiwipX6c1b8zeyjvr9Bf
   QzB4TlUJsOyo+2E/SJxIdBvq+46dzNjuT2cViqXW0ZKOzoxuiffYgMGbT
   0wuMmBCxYPSgw4j6ITWdfOcAhVc676mRIhSFuo8oMvxNAbEyJkV1T0MiO
   NqtwPy7PnibsYriC7gm3DR3eMZ0zU+BvxOqftWcm651tKl2XP1UC77gLY
   Q4hK+NNx5eo823y96TRT0SdF/buZCvVBM6x1e6elqIG23KH/jXvdfeBj8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413576926"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413576926"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 18:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837586638"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="837586638"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2023 18:40:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLxbv-0001Mx-1C;
	Sun, 29 Jan 2023 02:40:03 +0000
Date: Sun, 29 Jan 2023 10:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 1089/1124]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3396:17: warning: ISO C90
 forbids mixed declarations and code
Message-ID: <202301291049.VhH9OskW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pranavi,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5da20470af455bc588357712b64603b06e4edf42
commit: 8c6910de988070200e93c242ced7187754c4020d [1089/1124] net: xilinx: Move Xilinx TSN to staging
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291049.VhH9OskW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/8c6910de988070200e93c242ced7187754c4020d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 8c6910de988070200e93c242ced7187754c4020d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_probe':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3396:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3396 |                 struct resource txtsres, rxtsres;
         |                 ^~~~~~


vim +3396 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3131  
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3132  /**
2be586205ca2b8 Srikanth Thokala             2015-05-05  3133   * axienet_probe - Axi Ethernet probe function.
95219aa538e11d Srikanth Thokala             2015-05-05  3134   * @pdev:	Pointer to platform device structure.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3135   *
b0d081c524b46c Michal Simek                 2015-05-05  3136   * Return: 0, on success
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3137   *	    Non-zero error value on failure.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3138   *
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3139   * This is the probe routine for Axi Ethernet driver. This is called before
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3140   * any other driver routines are invoked. It allocates and sets up the Ethernet
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3141   * device. Parses through device tree and populates fields of
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3142   * axienet_local. It registers the Ethernet device.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3143   */
2be586205ca2b8 Srikanth Thokala             2015-05-05  3144  static int axienet_probe(struct platform_device *pdev)
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3145  {
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3146  	int (*axienet_clk_init)(struct platform_device *pdev,
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3147  				struct clk **axi_aclk, struct clk **axis_clk,
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3148  				struct clk **ref_clk, struct clk **tmpclk) =
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3149  					axienet_clk_init;
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  3150  	int ret = 0;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3151  	struct device_node *np;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3152  	struct axienet_local *lp;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3153  	struct net_device *ndev;
83216e3988cd19 Michael Walle                2021-04-12  3154  	u8 mac_addr[ETH_ALEN];
ee94241b2118dd Saurabh Sengar               2021-01-22  3155  	struct resource *ethres;
8495659bf93c8e Srikanth Thokala             2015-05-05  3156  	u32 value;
ee94241b2118dd Saurabh Sengar               2021-01-22  3157  	u16 num_queues = XAE_MAX_QUEUES;
ee94241b2118dd Saurabh Sengar               2021-01-22  3158  
ee94241b2118dd Saurabh Sengar               2021-01-22  3159  	ret = of_property_read_u16(pdev->dev.of_node, "xlnx,num-queues",
ee94241b2118dd Saurabh Sengar               2021-01-22  3160  				   &num_queues);
ee94241b2118dd Saurabh Sengar               2021-01-22  3161  	if (ret) {
ee94241b2118dd Saurabh Sengar               2021-01-22  3162  #ifndef CONFIG_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  3163  			num_queues = 1;
ee94241b2118dd Saurabh Sengar               2021-01-22  3164  #endif
ee94241b2118dd Saurabh Sengar               2021-01-22  3165  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3166  
ee94241b2118dd Saurabh Sengar               2021-01-22  3167  	ndev = alloc_etherdev_mq(sizeof(*lp), num_queues);
41de8d4cff21a2 Joe Perches                  2012-01-29  3168  	if (!ndev)
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3169  		return -ENOMEM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3170  
95219aa538e11d Srikanth Thokala             2015-05-05  3171  	platform_set_drvdata(pdev, ndev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3172  
95219aa538e11d Srikanth Thokala             2015-05-05  3173  	SET_NETDEV_DEV(ndev, &pdev->dev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3174  	ndev->flags &= ~IFF_MULTICAST;  /* clear multicast */
28e24c62ab3062 Eric Dumazet                 2013-12-02  3175  	ndev->features = NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3176  	ndev->netdev_ops = &axienet_netdev_ops;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3177  	ndev->ethtool_ops = &axienet_ethtool_ops;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3178  
d894be57ca92c8 Jarod Wilson                 2016-10-20  3179  	/* MTU range: 64 - 9000 */
d894be57ca92c8 Jarod Wilson                 2016-10-20  3180  	ndev->min_mtu = 64;
d894be57ca92c8 Jarod Wilson                 2016-10-20  3181  	ndev->max_mtu = XAE_JUMBO_MTU;
d894be57ca92c8 Jarod Wilson                 2016-10-20  3182  
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3183  	lp = netdev_priv(ndev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3184  	lp->ndev = ndev;
95219aa538e11d Srikanth Thokala             2015-05-05  3185  	lp->dev = &pdev->dev;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3186  	lp->options = XAE_OPTION_DEFAULTS;
ee94241b2118dd Saurabh Sengar               2021-01-22  3187  	lp->num_tx_queues = num_queues;
ee94241b2118dd Saurabh Sengar               2021-01-22  3188  	lp->num_rx_queues = num_queues;
8b09ca823ffb4e Robert Hancock               2019-06-06  3189  	lp->rx_bd_num = RX_BD_NUM_DEFAULT;
8b09ca823ffb4e Robert Hancock               2019-06-06  3190  	lp->tx_bd_num = TX_BD_NUM_DEFAULT;
57baf8cc70ea4c Robert Hancock               2021-02-12  3191  
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3192  	lp->axi_clk = devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3193  	if (!lp->axi_clk) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3194  		/* For backward compatibility, if named AXI clock is not present,
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3195  		 * treat the first clock specified as the AXI clock.
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3196  		 */
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3197  		lp->axi_clk = devm_clk_get_optional(&pdev->dev, NULL);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3198  	}
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3199  	if (IS_ERR(lp->axi_clk)) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3200  		ret = PTR_ERR(lp->axi_clk);
57baf8cc70ea4c Robert Hancock               2021-02-12  3201  		goto free_netdev;
57baf8cc70ea4c Robert Hancock               2021-02-12  3202  	}
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3203  	ret = clk_prepare_enable(lp->axi_clk);
57baf8cc70ea4c Robert Hancock               2021-02-12  3204  	if (ret) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3205  		dev_err(&pdev->dev, "Unable to enable AXI clock: %d\n", ret);
57baf8cc70ea4c Robert Hancock               2021-02-12  3206  		goto free_netdev;
57baf8cc70ea4c Robert Hancock               2021-02-12  3207  	}
57baf8cc70ea4c Robert Hancock               2021-02-12  3208  
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3209  	lp->misc_clks[0].id = "axis_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3210  	lp->misc_clks[1].id = "ref_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3211  	lp->misc_clks[2].id = "mgt_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3212  
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3213  	ret = devm_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3214  	if (ret)
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3215  		goto cleanup_clk;
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3216  
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3217  	ret = clk_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3218  	if (ret)
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3219  		goto cleanup_clk;
b11bfb9a19f9d7 Robert Hancock               2021-03-25  3220  
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3221  	/* Map device registers */
47651c51c02fc4 Yang Yingliang               2021-06-10  3222  	lp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
fcc028c106e575 Krzysztof Kozlowski          2015-07-09  3223  	if (IS_ERR(lp->regs)) {
fcc028c106e575 Krzysztof Kozlowski          2015-07-09  3224  		ret = PTR_ERR(lp->regs);
59cd4f19267a0a Robert Hancock               2021-03-11  3225  		goto cleanup_clk;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3226  	}
7fa0043d5c74c6 Robert Hancock               2019-06-11  3227  	lp->regs_start = ethres->start;
46aa27df885321 Srikanth Thokala             2015-05-05  3228  
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3229  	/* Setup checksum offload, but default to off if not specified */
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3230  	lp->features = 0;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3231  
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3232  	if (pdev->dev.of_node) {
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3233  		const struct of_device_id *match;
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3234  
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3235  		match = of_match_node(axienet_of_match, pdev->dev.of_node);
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3236  		if (match && match->data) {
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3237  			lp->axienet_config = match->data;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3238  			axienet_clk_init = lp->axienet_config->clk_init;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3239  		}
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3240  	}
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  3241  
8495659bf93c8e Srikanth Thokala             2015-05-05  3242  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
8495659bf93c8e Srikanth Thokala             2015-05-05  3243  	if (!ret) {
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  3244  		dev_info(&pdev->dev, "TX_CSUM %d\n", value);
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  3245  
8495659bf93c8e Srikanth Thokala             2015-05-05  3246  		switch (value) {
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3247  		case 1:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3248  			lp->csum_offload_on_tx_path =
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3249  				XAE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3250  			lp->features |= XAE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3251  			/* Can checksum TCP/UDP over IPv4. */
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  3252  			ndev->features |= NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3253  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3254  		case 2:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3255  			lp->csum_offload_on_tx_path =
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3256  				XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3257  			lp->features |= XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3258  			/* Can checksum TCP/UDP over IPv4. */
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  3259  			ndev->features |= NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3260  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3261  		default:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3262  			lp->csum_offload_on_tx_path = XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3263  		}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3264  	}
8495659bf93c8e Srikanth Thokala             2015-05-05  3265  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
8495659bf93c8e Srikanth Thokala             2015-05-05  3266  	if (!ret) {
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  3267  		dev_info(&pdev->dev, "RX_CSUM %d\n", value);
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  3268  
8495659bf93c8e Srikanth Thokala             2015-05-05  3269  		switch (value) {
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3270  		case 1:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3271  			lp->csum_offload_on_rx_path =
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3272  				XAE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3273  			lp->features |= XAE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3274  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3275  		case 2:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3276  			lp->csum_offload_on_rx_path =
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3277  				XAE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3278  			lp->features |= XAE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3279  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3280  		default:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3281  			lp->csum_offload_on_rx_path = XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3282  		}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3283  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3284  	/* For supporting jumbo frames, the Axi Ethernet hardware must have
f080a8c35d8932 Srikanth Thokala             2015-05-05  3285  	 * a larger Rx/Tx Memory. Typically, the size must be large so that
f080a8c35d8932 Srikanth Thokala             2015-05-05  3286  	 * we can enable jumbo option and start supporting jumbo frames.
f080a8c35d8932 Srikanth Thokala             2015-05-05  3287  	 * Here we check for memory allocated for Rx/Tx in the hardware from
f080a8c35d8932 Srikanth Thokala             2015-05-05  3288  	 * the device-tree and accordingly set flags.
f080a8c35d8932 Srikanth Thokala             2015-05-05  3289  	 */
8495659bf93c8e Srikanth Thokala             2015-05-05  3290  	of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
ee06b1728b9564 Alvaro G. M                  2017-07-17  3291  
b49b06d93560ff Radhey Shyam Pandey          2021-01-22  3292  	/* The phy_mode is optional but when it is not specified it should not
b49b06d93560ff Radhey Shyam Pandey          2021-01-22  3293  	 *  be a value that alters the driver behavior so set it to an invalid
b49b06d93560ff Radhey Shyam Pandey          2021-01-22  3294  	 *  value as the default.
b49b06d93560ff Radhey Shyam Pandey          2021-01-22  3295  	 */
4a5d4f9089c438 Shravya Kumbham              2021-01-22  3296  	lp->phy_mode = PHY_INTERFACE_MODE_NA;
a4509c7f4a1a36 Radhey Shyam Pandey          2021-06-11  3297  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", &lp->phy_mode);
a4509c7f4a1a36 Radhey Shyam Pandey          2021-06-11  3298  	if (!ret)
a4509c7f4a1a36 Radhey Shyam Pandey          2021-06-11  3299  		netdev_warn(ndev, "xlnx,phy-type is deprecated, Please upgrade your device tree to use phy-mode");
90c9074a1401aa Michal Simek                 2021-01-22  3300  
234169627e1ae6 Harini Katakam               2021-01-22  3301  	/* Set default USXGMII rate */
234169627e1ae6 Harini Katakam               2021-01-22  3302  	lp->usxgmii_rate = SPEED_1000;
234169627e1ae6 Harini Katakam               2021-01-22  3303  	of_property_read_u32(pdev->dev.of_node, "xlnx,usxgmii-rate",
234169627e1ae6 Harini Katakam               2021-01-22  3304  			     &lp->usxgmii_rate);
234169627e1ae6 Harini Katakam               2021-01-22  3305  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3306  	/* Set default MRMAC rate */
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3307  	lp->mrmac_rate = SPEED_10000;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3308  	of_property_read_u32(pdev->dev.of_node, "xlnx,mrmac-rate",
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3309  			     &lp->mrmac_rate);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3310  
f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  3311  	lp->eth_hasnobuf = of_property_read_bool(pdev->dev.of_node,
f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  3312  						 "xlnx,eth-hasnobuf");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3313  	lp->eth_hasptp = of_property_read_bool(pdev->dev.of_node,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3314  					       "xlnx,eth-hasptp");
f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  3315  
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  3316  	if (lp->axienet_config->mactype == XAXIENET_1G && !lp->eth_hasnobuf)
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  3317  		lp->eth_irq = platform_get_irq(pdev, 0);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3318  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3319  	if (lp->axienet_config->mactype == XAXIENET_MRMAC) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3320  		struct resource gtpll, gtctrl;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3321  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3322  		if (mrmac_pll_reg) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3323  			lp->gt_pll = mrmac_gt_pll;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3324  			lp->gt_ctrl = mrmac_gt_ctrl;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3325  		} else {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3326  			np = of_parse_phandle(pdev->dev.of_node,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3327  					      "xlnx,gtpll", 0);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3328  			if (IS_ERR(np)) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3329  				dev_err(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3330  					"couldn't find GT PLL\n");
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3331  				ret = PTR_ERR(np);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3332  				goto free_netdev;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3333  			}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3334  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3335  			ret = of_address_to_resource(np, 0, &gtpll);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3336  			if (ret) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3337  				dev_err(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3338  					"unable to get GT PLL resource\n");
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3339  				goto free_netdev;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3340  			}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3341  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3342  			lp->gt_pll = devm_ioremap_resource(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3343  							   &gtpll);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3344  			if (IS_ERR(lp->gt_pll)) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3345  				dev_err(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3346  					"couldn't map GT PLL regs\n");
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3347  				ret = PTR_ERR(lp->gt_pll);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3348  				goto free_netdev;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3349  			}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3350  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3351  			np = of_parse_phandle(pdev->dev.of_node,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3352  					      "xlnx,gtctrl", 0);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3353  			if (IS_ERR(np)) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3354  				dev_err(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3355  					"couldn't find GT control\n");
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3356  				ret = PTR_ERR(np);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3357  				goto free_netdev;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3358  			}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3359  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3360  			ret = of_address_to_resource(np, 0, &gtctrl);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3361  			if (ret) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3362  				dev_err(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3363  					"unable to get GT control resource\n");
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3364  				goto free_netdev;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3365  			}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3366  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3367  			lp->gt_ctrl = devm_ioremap_resource(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3368  							    &gtctrl);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3369  			if (IS_ERR(lp->gt_ctrl)) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3370  				dev_err(&pdev->dev,
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3371  					"couldn't map GT control regs\n");
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3372  				ret = PTR_ERR(lp->gt_ctrl);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3373  				goto free_netdev;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3374  			}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3375  
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3376  			mrmac_gt_pll = lp->gt_pll;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3377  			mrmac_gt_ctrl = lp->gt_ctrl;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3378  			mrmac_pll_reg = 1;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3379  		}
e74bff7aa33454 Harini Katakam               2021-01-22  3380  #ifdef CONFIG_XILINX_AXI_EMAC_HWTSTAMP
e74bff7aa33454 Harini Katakam               2021-01-22  3381  		ret = of_property_read_u32(pdev->dev.of_node, "xlnx,phcindex",
e74bff7aa33454 Harini Katakam               2021-01-22  3382  					   &lp->phc_index);
e74bff7aa33454 Harini Katakam               2021-01-22  3383  		if (ret)
e74bff7aa33454 Harini Katakam               2021-01-22  3384  			dev_warn(&pdev->dev, "No phc index defaulting to 0\n");
e74bff7aa33454 Harini Katakam               2021-01-22  3385  #endif
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3386  		ret = of_property_read_u32(pdev->dev.of_node, "xlnx,gtlane",
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3387  					   &lp->gt_lane);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3388  		if (ret) {
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3389  			dev_err(&pdev->dev, "MRMAC GT lane information missing\n");
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3390  			goto free_netdev;
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3391  		}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3392  		dev_info(&pdev->dev, "GT lane: %d\n", lp->gt_lane);
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3393  	}
146b2ba5b5d5e9 Harini Katakam               2021-01-22  3394  
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3395  #ifdef CONFIG_XILINX_AXI_EMAC_HWTSTAMP
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24 @3396  		struct resource txtsres, rxtsres;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3397  
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3398  		/* Find AXI Stream FIFO */
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3399  		np = of_parse_phandle(pdev->dev.of_node, "axififo-connected",
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3400  				      0);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3401  		if (IS_ERR(np)) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3402  			dev_err(&pdev->dev, "could not find TX Timestamp FIFO\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3403  			ret = PTR_ERR(np);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3404  			goto free_netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3405  		}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3406  
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3407  		ret = of_address_to_resource(np, 0, &txtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3408  		if (ret) {
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3409  			dev_err(&pdev->dev,
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3410  				"unable to get Tx Timestamp resource\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3411  			goto free_netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3412  		}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3413  
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3414  		lp->tx_ts_regs = devm_ioremap_resource(&pdev->dev, &txtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3415  		if (IS_ERR(lp->tx_ts_regs)) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3416  			dev_err(&pdev->dev, "could not map Tx Timestamp regs\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3417  			ret = PTR_ERR(lp->tx_ts_regs);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3418  			goto free_netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3419  		}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3420  
e74bff7aa33454 Harini Katakam               2021-01-22  3421  		if (lp->axienet_config->mactype == XAXIENET_10G_25G ||
e74bff7aa33454 Harini Katakam               2021-01-22  3422  		    lp->axienet_config->mactype == XAXIENET_MRMAC) {
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3423  			np = of_parse_phandle(pdev->dev.of_node,
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3424  					      "xlnx,rxtsfifo", 0);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3425  			if (IS_ERR(np)) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3426  				dev_err(&pdev->dev,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3427  					"couldn't find rx-timestamp FIFO\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3428  				ret = PTR_ERR(np);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3429  				goto free_netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3430  			}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3431  
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3432  			ret = of_address_to_resource(np, 0, &rxtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3433  			if (ret) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3434  				dev_err(&pdev->dev,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3435  					"unable to get rx-timestamp resource\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3436  				goto free_netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3437  			}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3438  
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3439  			lp->rx_ts_regs = devm_ioremap_resource(&pdev->dev,
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3440  							       &rxtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3441  			if (IS_ERR(lp->rx_ts_regs)) {
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3442  				dev_err(&pdev->dev,
a7ae7ddafe91c1 Saurabh Sengar               2021-01-22  3443  					"couldn't map rx-timestamp regs\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3444  				ret = PTR_ERR(lp->rx_ts_regs);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3445  				goto free_netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3446  			}
d0718385afe982 Harini Katakam               2021-03-11  3447  
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3448  			lp->tx_ptpheader = devm_kzalloc(&pdev->dev,
d0718385afe982 Harini Katakam               2021-03-11  3449  							lp->axienet_config->ts_header_len,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3450  							GFP_KERNEL);
061186e5c768f3 Radhey Shyam Pandey          2021-01-22  3451  			spin_lock_init(&lp->ptp_tx_lock);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3452  		}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3453  
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3454  		of_node_put(np);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3455  #endif
d711308cc3e90f Harini Katakam               2021-11-23  3456  	if (lp->axienet_config->mactype == XAXIENET_10G_25G)
d711308cc3e90f Harini Katakam               2021-11-23  3457  		lp->xxv_ip_version = axienet_ior(lp, XXV_CONFIG_REVISION);
2e9548e01d957a Pranavi Somisetty            2021-01-22  3458  

:::::: The code at line 3396 was first introduced by commit
:::::: bf05571deda79b6b79d0e5cd93dd813a7696fa79 net: axienet: Add support for 1588

:::::: TO: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
