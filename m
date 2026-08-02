Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC882FFF8D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703220; cv=none; b=Mq91r5/W94YjBA+kLdEWuKPIrQr4PgVDZ6xUukvoE/0gt5/rtHDif4CvIYzSO3gMsSR0WVK7ZhLIh1HBtUGgs6EB9LTO6eOO+C+eIN/m/uVSuMqStth+tLPoK5gVIkj/7KmzPoPPRGW/PSpra4OWhe9fdLL8WwaKAlqjRzRypt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703220; c=relaxed/simple;
	bh=WV9gQlRbI+d8uCT/xbj/HcL0BPZuWbdgK22G5H1oroM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dzy1c86+Uw9xK0Hhh1XCIhMjNfyX3FU/ZAtwqrCZIzNlQukczm9BsQEBgQt7Ig7YTQptKOCDaTGYHuHBHEgEnR7FSj/xW+Di5cjFOF65nLwTM8pgcUVH0CTR3r3mSSXj1Ioh47eHaU7Ic2KKyeovway6hr9B9Mi9f8RZVufpTfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSVCTL99; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSVCTL99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785703217; x=1817239217;
  h=date:from:to:cc:subject:message-id;
  bh=WV9gQlRbI+d8uCT/xbj/HcL0BPZuWbdgK22G5H1oroM=;
  b=XSVCTL99InLz1k7/3Y3p/1i+GfQ2V7L30TrmDxFx2L2S7RDfZCjUWK2g
   jDTE5qrC1iEmdrIKE17btkBq+w0AGuziC+pFAScXDh3lwzHhc+0x7uXsS
   6TXBQrWExIw5jLQaitKJpzDctFAtDzqDsk3q+ZNukoxg0CQVITXVg1+Lm
   TpJNXAWrhsUzVAMnMBXHij568Pao6VMxCbeQHMVlRcd6tD1SY/x5bj6V8
   MJNABal3vwC/lgJIUujWcJPJxSfG8fR8YCwpDXE2UMD09CxhvfecBgYg5
   wSZXJnko1/vHCFeMMo6z7YJh1yTv0416TZog5FEjBrsj0a/wrae1t/ys0
   w==;
X-CSE-ConnectionGUID: AmeSozSqQfqwlQQbKOjOlA==
X-CSE-MsgGUID: Di8rmm53Qiep9W6o+6Of+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85375154"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="85375154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 13:40:17 -0700
X-CSE-ConnectionGUID: kBiG9nGCT92D0GuqwxNhDw==
X-CSE-MsgGUID: VbrJBqNGTR22QIg+UB9Mqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="265331373"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2026 13:40:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqcyj-000000005W5-0UbF;
	Sun, 02 Aug 2026 20:40:13 +0000
Date: Mon, 03 Aug 2026 04:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 385/700]
 drivers/phy/mstar/phy-msc313-usb.c:200:9: warning: ignoring return value of
 'regulator_enable' declared with attribute 'warn_unused_result'
Message-ID: <202608030456.VNY66Cjk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: fc183ea8feb9dae42fc1d3174dea8c4fbccb256b [385/700] phy: mstar: mipi dphy
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260803/202608030456.VNY66Cjk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608030456.VNY66Cjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608030456.VNY66Cjk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/mstar/phy-msc313-usb.c: In function 'msc313_usb_phy_probe':
   drivers/phy/mstar/phy-msc313-usb.c:160:17: warning: ignoring return value of 'devm_request_irq' declared with attribute 'warn_unused_result' [-Wunused-result]
     160 |                 devm_request_irq(&pdev->dev, irq, msc313_usb_phy_irq, IRQF_SHARED,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     161 |                                 dev_name(&pdev->dev), msc313_usb_phy);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/mstar/phy-msc313-usb.c:200:9: warning: ignoring return value of 'regulator_enable' declared with attribute 'warn_unused_result' [-Wunused-result]
     200 |         regulator_enable(msc313_usb_phy->vbus);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/phy/mstar/phy-msc313-usb.c:15:
   At top level:
>> include/linux/usb/mstar_utmi.h:80:25: warning: 'mstar_utmi_pwrctrl_pwrdwn_field' defined but not used [-Wunused-variable]
      80 | static struct reg_field mstar_utmi_pwrctrl_pwrdwn_field = REG_FIELD(REG_PWRCTRL, PWRCTRL_REG_PDN, PWRCTRL_REG_PDN);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +200 drivers/phy/mstar/phy-msc313-usb.c

707b79e71be8aa Daniel Palmer 2019-06-25  105  
707b79e71be8aa Daniel Palmer 2019-06-25  106  static int msc313_usb_phy_probe(struct platform_device *pdev)
707b79e71be8aa Daniel Palmer 2019-06-25  107  {
707b79e71be8aa Daniel Palmer 2019-06-25  108  	struct device *dev = &pdev->dev;
707b79e71be8aa Daniel Palmer 2019-06-25  109  	struct phy_provider *phy_provider;
707b79e71be8aa Daniel Palmer 2019-06-25  110  	struct msc313_usb_phy *msc313_usb_phy;
707b79e71be8aa Daniel Palmer 2019-06-25  111  	int i, irq;
707b79e71be8aa Daniel Palmer 2019-06-25  112  	bool swap;
707b79e71be8aa Daniel Palmer 2019-06-25  113  
707b79e71be8aa Daniel Palmer 2019-06-25  114  	msc313_usb_phy = devm_kzalloc(dev, sizeof(*msc313_usb_phy), GFP_KERNEL);
707b79e71be8aa Daniel Palmer 2019-06-25  115  	if (!msc313_usb_phy)
707b79e71be8aa Daniel Palmer 2019-06-25  116  		return  -ENOMEM;
707b79e71be8aa Daniel Palmer 2019-06-25  117  
707b79e71be8aa Daniel Palmer 2019-06-25  118  	msc313_usb_phy->dev = dev;
707b79e71be8aa Daniel Palmer 2019-06-25  119  
707b79e71be8aa Daniel Palmer 2019-06-25  120  	msc313_usb_phy->utmi = syscon_regmap_lookup_by_phandle(dev->of_node, "mstar,utmi");
707b79e71be8aa Daniel Palmer 2019-06-25  121  	if(IS_ERR(msc313_usb_phy->utmi)){
707b79e71be8aa Daniel Palmer 2019-06-25  122  		return PTR_ERR(msc313_usb_phy->utmi);
707b79e71be8aa Daniel Palmer 2019-06-25  123  	}
707b79e71be8aa Daniel Palmer 2019-06-25  124  
707b79e71be8aa Daniel Palmer 2019-06-25  125  	msc313_usb_phy->usbc = syscon_regmap_lookup_by_phandle(dev->of_node, "mstar,usbc");
707b79e71be8aa Daniel Palmer 2019-06-25  126  	if (IS_ERR(msc313_usb_phy->usbc))
707b79e71be8aa Daniel Palmer 2019-06-25  127  		return PTR_ERR(msc313_usb_phy->usbc);
707b79e71be8aa Daniel Palmer 2019-06-25  128  
707b79e71be8aa Daniel Palmer 2019-06-25  129  	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
707b79e71be8aa Daniel Palmer 2019-06-25  130  	if (!irq){
707b79e71be8aa Daniel Palmer 2019-06-25  131  		dev_warn(&pdev->dev, "no interrupt provided");
707b79e71be8aa Daniel Palmer 2019-06-25  132  	}
707b79e71be8aa Daniel Palmer 2019-06-25  133  
707b79e71be8aa Daniel Palmer 2019-06-25  134  	// hack for m5, these seem to be the reset values for i3
707b79e71be8aa Daniel Palmer 2019-06-25  135  	regmap_write(msc313_usb_phy->usbc, MSTAR_USBC_REG_RSTCTRL,
707b79e71be8aa Daniel Palmer 2019-06-25  136  			0x228);
707b79e71be8aa Daniel Palmer 2019-06-25  137  	regmap_write(msc313_usb_phy->utmi, MSTAR_UTMI_REG_PLL_TEST1,
707b79e71be8aa Daniel Palmer 2019-06-25  138  				0x2088);
707b79e71be8aa Daniel Palmer 2019-06-25  139  	regmap_write(msc313_usb_phy->utmi, MSTAR_UTMI_REG_PLL_TEST0,
707b79e71be8aa Daniel Palmer 2019-06-25  140  				0x8051);
707b79e71be8aa Daniel Palmer 2019-06-25  141  	regmap_write(msc313_usb_phy->utmi, MSTAR_UTMI_REG_CONFIG,
707b79e71be8aa Daniel Palmer 2019-06-25  142  			0x2084);
707b79e71be8aa Daniel Palmer 2019-06-25  143  
707b79e71be8aa Daniel Palmer 2019-06-25  144  	//FIXME for some reason this doesn't update the registers.
707b79e71be8aa Daniel Palmer 2019-06-25  145  	// some voodoo that is enabled for the msc313 in the vendor sdk
707b79e71be8aa Daniel Palmer 2019-06-25  146  	regmap_write(msc313_usb_phy->usbc, MSTAR_USBC_REG_MIUCFG0,
707b79e71be8aa Daniel Palmer 2019-06-25  147  					0x0);
707b79e71be8aa Daniel Palmer 2019-06-25  148  	regmap_write(msc313_usb_phy->usbc, MSTAR_USBC_REG_MIUCFG1,
707b79e71be8aa Daniel Palmer 2019-06-25  149  					0xffff);
707b79e71be8aa Daniel Palmer 2019-06-25  150  	regmap_write(msc313_usb_phy->usbc, MSTAR_USBC_REG_MIUCFG2,
707b79e71be8aa Daniel Palmer 2019-06-25  151  					BIT(8) | 0xff);
707b79e71be8aa Daniel Palmer 2019-06-25  152  
707b79e71be8aa Daniel Palmer 2019-06-25  153  	// clear any existing interrupts and then enable
707b79e71be8aa Daniel Palmer 2019-06-25  154  	// the interrupt
707b79e71be8aa Daniel Palmer 2019-06-25  155  	regmap_write(msc313_usb_phy->usbc, MSTAR_USBC_REG_INTEN,
707b79e71be8aa Daniel Palmer 2019-06-25  156  			MSTAR_USBC_INT_MASK);
707b79e71be8aa Daniel Palmer 2019-06-25  157  	regmap_write(msc313_usb_phy->usbc, MSTAR_USBC_REG_INTSTS,
707b79e71be8aa Daniel Palmer 2019-06-25  158                          MSTAR_USBC_INT_MASK);
707b79e71be8aa Daniel Palmer 2019-06-25  159  	if(irq){
707b79e71be8aa Daniel Palmer 2019-06-25  160  		devm_request_irq(&pdev->dev, irq, msc313_usb_phy_irq, IRQF_SHARED,
707b79e71be8aa Daniel Palmer 2019-06-25  161  				dev_name(&pdev->dev), msc313_usb_phy);
707b79e71be8aa Daniel Palmer 2019-06-25  162  	}
707b79e71be8aa Daniel Palmer 2019-06-25  163  
707b79e71be8aa Daniel Palmer 2019-06-25  164  	// power up hacks
707b79e71be8aa Daniel Palmer 2019-06-25  165  	regmap_write(msc313_usb_phy->utmi, REG_CLKCTRL, 0x0c2f);
707b79e71be8aa Daniel Palmer 2019-06-25  166  	regmap_write(msc313_usb_phy->utmi, REG_CLKCTRL, 0x040f);
707b79e71be8aa Daniel Palmer 2019-06-25  167  	regmap_write(msc313_usb_phy->utmi, REG_PWRCTRL, 0x7f05);
707b79e71be8aa Daniel Palmer 2019-06-25  168  
707b79e71be8aa Daniel Palmer 2019-06-25  169  	msc313_usb_phy_switch_port(msc313_usb_phy);
707b79e71be8aa Daniel Palmer 2019-06-25  170  
707b79e71be8aa Daniel Palmer 2019-06-25  171  	regmap_write(msc313_usb_phy->utmi, REG_CLKCTRL, 0x0426);
707b79e71be8aa Daniel Palmer 2019-06-25  172  	regmap_write(msc313_usb_phy->utmi, REG_PWRCTRL, 0x6bc3);
707b79e71be8aa Daniel Palmer 2019-06-25  173  	regmap_write(msc313_usb_phy->utmi, REG_PWRCTRL, 0x69c3);
707b79e71be8aa Daniel Palmer 2019-06-25  174  	regmap_write(msc313_usb_phy->utmi, REG_PWRCTRL, 0x0001);
707b79e71be8aa Daniel Palmer 2019-06-25  175  
707b79e71be8aa Daniel Palmer 2019-06-25  176  	regmap_write(msc313_usb_phy->utmi, REG_EYESETTING1, 0x0210);
707b79e71be8aa Daniel Palmer 2019-06-25  177  	regmap_write(msc313_usb_phy->utmi, REG_EYESETTING2, 0x8100);
707b79e71be8aa Daniel Palmer 2019-06-25  178  
707b79e71be8aa Daniel Palmer 2019-06-25  179  
707b79e71be8aa Daniel Palmer 2019-06-25  180  	msc313_usb_phy_do_calibration(msc313_usb_phy);
707b79e71be8aa Daniel Palmer 2019-06-25  181  
707b79e71be8aa Daniel Palmer 2019-06-25  182  	swap = of_property_read_bool(dev->of_node, "mstar,utmi-dxswap");
707b79e71be8aa Daniel Palmer 2019-06-25  183  
707b79e71be8aa Daniel Palmer 2019-06-25  184  	if(swap)
707b79e71be8aa Daniel Palmer 2019-06-25  185  		dev_info(dev, "enabling data line swap");
707b79e71be8aa Daniel Palmer 2019-06-25  186  	regmap_update_bits(msc313_usb_phy->utmi, MSTAR_UTMI_REG_CLKINV,
707b79e71be8aa Daniel Palmer 2019-06-25  187  			MSTAR_UTMI_REG_CLKINV_DPDNSWP, swap ? MSTAR_UTMI_REG_CLKINV_DPDNSWP : 0);
707b79e71be8aa Daniel Palmer 2019-06-25  188  
707b79e71be8aa Daniel Palmer 2019-06-25  189  	//regmap_update_bits(msc313_usb_phy->regmap, REG_PWRCTRL, PWRCTRL_UPLL_PDN, 0);
707b79e71be8aa Daniel Palmer 2019-06-25  190  
707b79e71be8aa Daniel Palmer 2019-06-25  191  	for(i = 0; i < NUM_PORTS; i++){
707b79e71be8aa Daniel Palmer 2019-06-25  192  		msc313_usb_phy->ports[i] = devm_phy_create(dev, NULL, &msc313_usb_phy_ops);
707b79e71be8aa Daniel Palmer 2019-06-25  193  		if (IS_ERR(msc313_usb_phy->ports[i])) {
707b79e71be8aa Daniel Palmer 2019-06-25  194  			return PTR_ERR(msc313_usb_phy->ports[i]);
707b79e71be8aa Daniel Palmer 2019-06-25  195  		}
707b79e71be8aa Daniel Palmer 2019-06-25  196  		phy_set_drvdata(msc313_usb_phy->ports[i], msc313_usb_phy);
707b79e71be8aa Daniel Palmer 2019-06-25  197  	}
707b79e71be8aa Daniel Palmer 2019-06-25  198  
707b79e71be8aa Daniel Palmer 2019-06-25  199  	msc313_usb_phy->vbus = devm_regulator_get(dev, "vbus");
707b79e71be8aa Daniel Palmer 2019-06-25 @200  	regulator_enable(msc313_usb_phy->vbus);
707b79e71be8aa Daniel Palmer 2019-06-25  201  
707b79e71be8aa Daniel Palmer 2019-06-25  202  	dev_set_drvdata(dev, msc313_usb_phy);
707b79e71be8aa Daniel Palmer 2019-06-25  203  
707b79e71be8aa Daniel Palmer 2019-06-25  204  	phy_provider = devm_of_phy_provider_register(&pdev->dev,
707b79e71be8aa Daniel Palmer 2019-06-25  205  						     msc313_usb_phy_xlate);
707b79e71be8aa Daniel Palmer 2019-06-25  206  	return PTR_ERR_OR_ZERO(phy_provider);
707b79e71be8aa Daniel Palmer 2019-06-25  207  }
707b79e71be8aa Daniel Palmer 2019-06-25  208  

:::::: The code at line 200 was first introduced by commit
:::::: 707b79e71be8aa1925909c907ed8c3d6302cb669 phy: msc313 usb phy

:::::: TO: Daniel Palmer <daniel@0x0f.com>
:::::: CC: Daniel Palmer <daniel@0x0f.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
