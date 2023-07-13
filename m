Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9FDA5D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 03:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689217714; x=1720753714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjpXY33g3sv/Tecag81VSvRQa/hEbc9+vHD6m0o9NP0=;
  b=iZFqdLHFSXHZTB2d+rqMRmTI5+50ipHD5LSCjAhsVSxZE1iT8qJhfIaB
   ivo/f6VFRH9LDhFjMY18mVa51+IOtCU4Zd0j86zkTQZDvEGct2XVdECko
   XfJRaiOCBxAY9opKxBghcHGqxlSLYsJ4NaVzmrGrvaczLqzuF5bEN6axh
   K6Zi5GeI2Qh+WnNb9dDIEgFxYjU9TsSFnNM0rtZnokuZErHzPNK7oZEVQ
   0kGHeP4bJqvCzVRMasqGRWPcFDO5LcPoO6/sNgzoUGWHICV9gJt00a0HL
   SiEN/8LdQ2fl8bTjhDi3kqfrmYVpjiQAcyYhd/Usr7apd3WJnUNPvtlH+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431219474"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="431219474"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 20:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895829767"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="895829767"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 20:08:32 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJmgx-0006Az-1z;
	Thu, 13 Jul 2023 03:08:31 +0000
Date: Thu, 13 Jul 2023 11:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 101/101]
 drivers/phy/hisilicon/phy-hix5hd2-sata.c:68:23: error: implicit declaration
 of function 'of_property_read_u32_array'
Message-ID: <202307131034.rN1cHnYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: ac7a2a5947cf0a60d9614031b509c5b65e99f87a [101/101] WIP: Remove of.h include from headers
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230713/202307131034.rN1cHnYK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131034.rN1cHnYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131034.rN1cHnYK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/phy/hisilicon/phy-hix5hd2-sata.c: In function 'hix5hd2_sata_phy_init':
>> drivers/phy/hisilicon/phy-hix5hd2-sata.c:68:23: error: implicit declaration of function 'of_property_read_u32_array' [-Werror=implicit-function-declaration]
      68 |                 ret = of_property_read_u32_array(phy->dev.of_node,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/hisilicon/phy-hix5hd2-sata.c: At top level:
>> drivers/phy/hisilicon/phy-hix5hd2-sata.c:169:34: error: array type has incomplete element type 'struct of_device_id'
     169 | static const struct of_device_id hix5hd2_sata_phy_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/phy/marvell/phy-mvebu-sata.c:115:34: error: array type has incomplete element type 'struct of_device_id'
     115 | static const struct of_device_id phy_mvebu_sata_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/marvell/phy-mvebu-sata.c:115:34: warning: 'phy_mvebu_sata_of_match' defined but not used [-Wunused-variable]
--
   drivers/phy/ti/phy-twl4030-usb.c: In function 'twl4030_usb_probe':
>> drivers/phy/ti/phy-twl4030-usb.c:697:17: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
     697 |                 of_property_read_u32(np, "usb_mode",
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/phy/ti/phy-twl4030-usb.c: At top level:
>> drivers/phy/ti/phy-twl4030-usb.c:840:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     840 |                 .of_match_table = of_match_ptr(twl4030_usb_id_table),
         |                                   ^~~~~~~~~~~~
>> drivers/phy/ti/phy-twl4030-usb.c:840:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/phy/ti/phy-twl4030-usb.c:840:35: note: (near initialization for 'twl4030_usb_driver.driver.of_match_table')
>> drivers/phy/ti/phy-twl4030-usb.c:840:35: error: initializer element is not constant
   drivers/phy/ti/phy-twl4030-usb.c:840:35: note: (near initialization for 'twl4030_usb_driver.driver.of_match_table')
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SM_GCC_8350
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_VIDEOCC_8350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8450
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8550
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]


vim +/of_property_read_u32_array +68 drivers/phy/hisilicon/phy-hix5hd2-sata.c

e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   60  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   61  static int hix5hd2_sata_phy_init(struct phy *phy)
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   62  {
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   63  	struct hix5hd2_priv *priv = phy_get_drvdata(phy);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   64  	u32 val, data[2];
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   65  	int ret;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   66  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   67  	if (priv->peri_ctrl) {
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  @68  		ret = of_property_read_u32_array(phy->dev.of_node,
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   69  						 "hisilicon,power-reg",
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   70  						 &data[0], 2);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   71  		if (ret) {
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   72  			dev_err(&phy->dev, "Fail read hisilicon,power-reg\n");
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   73  			return ret;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   74  		}
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   75  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   76  		regmap_update_bits(priv->peri_ctrl, data[0],
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   77  				   BIT(data[1]), BIT(data[1]));
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   78  	}
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   79  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   80  	/* reset phy */
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   81  	val = readl_relaxed(priv->base + SATA_PHY0_CTLL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   82  	val &= ~(MPLL_MULTIPLIER_MASK | REF_USE_PAD);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   83  	val |= MPLL_MULTIPLIER_50M << MPLL_MULTIPLIER_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   84  	       REF_SSP_EN | PHY_RESET;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   85  	writel_relaxed(val, priv->base + SATA_PHY0_CTLL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   86  	msleep(20);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   87  	val &= ~PHY_RESET;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   88  	writel_relaxed(val, priv->base + SATA_PHY0_CTLL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   89  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   90  	val = readl_relaxed(priv->base + SATA_PORT_PHYCTL1);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   91  	val &= ~AMPLITUDE_MASK;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   92  	val |= AMPLITUDE_GEN3 << AMPLITUDE_GEN3_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   93  	       AMPLITUDE_GEN2 << AMPLITUDE_GEN2_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   94  	       AMPLITUDE_GEN1 << AMPLITUDE_GEN1_SHIFT;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   95  	writel_relaxed(val, priv->base + SATA_PORT_PHYCTL1);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   96  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   97  	val = readl_relaxed(priv->base + SATA_PORT_PHYCTL2);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   98  	val &= ~PREEMPH_MASK;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03   99  	val |= PREEMPH_GEN3 << PREEMPH_GEN3_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  100  	       PREEMPH_GEN2 << PREEMPH_GEN2_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  101  	       PREEMPH_GEN1 << PREEMPH_GEN1_SHIFT;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  102  	writel_relaxed(val, priv->base + SATA_PORT_PHYCTL2);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  103  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  104  	/* ensure PHYCTRL setting takes effect */
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  105  	val = readl_relaxed(priv->base + SATA_PORT_PHYCTL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  106  	val &= ~SPEED_MODE_MASK;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  107  	val |= SPEED_MODE_GEN1 << HALF_RATE_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  108  	       SPEED_MODE_GEN1 << PHY_CONFIG_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  109  	       SPEED_MODE_GEN1 << GEN2_EN_SHIFT | SPEED_CTRL;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  110  	writel_relaxed(val, priv->base + SATA_PORT_PHYCTL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  111  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  112  	msleep(20);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  113  	val &= ~SPEED_MODE_MASK;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  114  	val |= SPEED_MODE_GEN3 << HALF_RATE_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  115  	       SPEED_MODE_GEN3 << PHY_CONFIG_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  116  	       SPEED_MODE_GEN3 << GEN2_EN_SHIFT | SPEED_CTRL;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  117  	writel_relaxed(val, priv->base + SATA_PORT_PHYCTL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  118  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  119  	val &= ~(SPEED_MODE_MASK | SPEED_CTRL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  120  	val |= SPEED_MODE_GEN2 << HALF_RATE_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  121  	       SPEED_MODE_GEN2 << PHY_CONFIG_SHIFT |
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  122  	       SPEED_MODE_GEN2 << GEN2_EN_SHIFT;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  123  	writel_relaxed(val, priv->base + SATA_PORT_PHYCTL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  124  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  125  	return 0;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  126  }
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  127  
4a9e5ca1a54a3cb drivers/phy/phy-hix5hd2-sata.c Axel Lin        2015-07-15  128  static const struct phy_ops hix5hd2_sata_phy_ops = {
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  129  	.init		= hix5hd2_sata_phy_init,
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  130  	.owner		= THIS_MODULE,
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  131  };
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  132  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  133  static int hix5hd2_sata_phy_probe(struct platform_device *pdev)
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  134  {
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  135  	struct phy_provider *phy_provider;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  136  	struct device *dev = &pdev->dev;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  137  	struct resource *res;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  138  	struct phy *phy;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  139  	struct hix5hd2_priv *priv;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  140  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  141  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  142  	if (!priv)
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  143  		return -ENOMEM;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  144  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  145  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
1cbdfc48c3d4064 drivers/phy/phy-hix5hd2-sata.c Axel Lin        2015-03-02  146  	if (!res)
1cbdfc48c3d4064 drivers/phy/phy-hix5hd2-sata.c Axel Lin        2015-03-02  147  		return -EINVAL;
1cbdfc48c3d4064 drivers/phy/phy-hix5hd2-sata.c Axel Lin        2015-03-02  148  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  149  	priv->base = devm_ioremap(dev, res->start, resource_size(res));
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  150  	if (!priv->base)
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  151  		return -ENOMEM;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  152  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  153  	priv->peri_ctrl = syscon_regmap_lookup_by_phandle(dev->of_node,
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  154  					"hisilicon,peripheral-syscon");
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  155  	if (IS_ERR(priv->peri_ctrl))
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  156  		priv->peri_ctrl = NULL;
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  157  
dbc98635e0d42f0 drivers/phy/phy-hix5hd2-sata.c Heikki Krogerus 2014-11-19  158  	phy = devm_phy_create(dev, NULL, &hix5hd2_sata_phy_ops);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  159  	if (IS_ERR(phy)) {
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  160  		dev_err(dev, "failed to create PHY\n");
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  161  		return PTR_ERR(phy);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  162  	}
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  163  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  164  	phy_set_drvdata(phy, priv);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  165  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
c1fc00501021504 drivers/phy/phy-hix5hd2-sata.c Gregory CLEMENT 2014-11-13  166  	return PTR_ERR_OR_ZERO(phy_provider);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  167  }
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  168  
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03 @169  static const struct of_device_id hix5hd2_sata_phy_of_match[] = {
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  170  	{.compatible = "hisilicon,hix5hd2-sata-phy",},
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  171  	{ },
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  172  };
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  173  MODULE_DEVICE_TABLE(of, hix5hd2_sata_phy_of_match);
e379413a346ce59 drivers/phy/phy-hix5hd2-sata.c Jiancheng Xue   2014-07-03  174  

:::::: The code at line 68 was first introduced by commit
:::::: e379413a346ce5943ab895aa5a702ec752577f13 phy: add hix5hd2-sata-phy driver

:::::: TO: Jiancheng Xue <xuejiancheng@huawei.com>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
