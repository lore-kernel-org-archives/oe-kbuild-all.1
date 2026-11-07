Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794090922;
	b=anQnx1qGJAG19O/lNREwAws0ujqQmjSIPkiGs11hd1bwU86AsWr6XFxOQngW4rbStz03
	 APru1ob0TlBUI9pYYQblVyjRKbsNai3fd+U7TaaIMXF5NsZW/nG1dbsMl7DTv218a2pc6
	 gBi56rMbHfO+ovAA5dBB91og7AhGecRJm0j1N2yblvAB5GoA+vMSaaaFS3efveSy0qlsp
	 96EUG/8j1R3XaYE93v7uJaSnIDSW/WNrcSzaxE9rPQ6ADpA3Tcch2YkJgWsgQ1ZKjK8ua
	 UYomtnTCcL7LwoPaCNMq9jY9RGaXKlvVAjgAXjdHo9ST7pJ8IuUBfvU9ssHNfU2EY1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794090922;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o2rGLLt3CeViUAgN1JgqqDxsam38sOcDS9txTZL0qxc=;
	b=Xb4xy76ZL7udcR249m6B4P/zwo5K5R9yatpNy/0nXfcKpLp0r6lkM0Ad9gF4AFeONJXx
	 v5fWx165zOE8Ohupmebw6U3kX619dSFan6om8m9GruISAkNfZZTyt2q949GtxB8TXU2n/
	 q5w1BSKxmt/9dznuKri3nkUa/tHnDPACOsQAGGIkImJc1LN7JuSzeugNPjKYlSsy8rDjC
	 4YJFgDTpczIFEoGgHbdRxAGrnx/FmmPItuMKrbHa5Y6A6zrN5x6auooSAb0fESjB0wZX7
	 EsGtPDnzc/g9JNVQGDwP/XjZ5YAndMQtsgVKWTIxOKaAyWiVQrrpkdRZ/HJiDtpnceQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="cDHdEd/l";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63D3606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 22:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cDHdEd/l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794090920; x=1825626920;
  h=date:from:to:cc:subject:message-id;
  bh=Jgc4ujNhYu1rkyQ1d35pnQYt6KK+FXd8xdSs1rH7Bhk=;
  b=cDHdEd/lfZR0S/sQgtnd8Ub86wSKT6MELjzcHaS8SE28pjRfrQbWF6xz
   9qj2EdginH4YlN2Z4Iqz+WcfcPsDK68KW7vDhUCncONTeh6U42k0XHilg
   RmDXGg9ENfgPqdkLAEwNecVkZCSbpckbOs5ni9bAh/jRN/hW2CnL2EKir
   //yb92hP+l5KWe9Oa/etDczPVsIvOBg78mkpILskWVy6hZn3hpfZFXEOh
   92II/tU2MB/egz5EGtfpCLizMO6Ouq8IK6pJtW81QI/eOLYOXa4ORgAde
   ELt2thKULB8RB0hnuZTx7C/YzW8bHjN0FFj4eJi2tISt3zjI5qtQNWwcI
   A==;
X-CSE-ConnectionGUID: /p1/i0UoRGq+t2P+m+wFNA==
X-CSE-MsgGUID: gPgNF7etTfGT7x8kmbALOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2883585"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2883585"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 14:35:19 -0800
X-CSE-ConnectionGUID: BYjePlF9T0WBoCt/y7IG8w==
X-CSE-MsgGUID: LXIqob6KQ9Smf/kR/7UEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7606083"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Nov 2026 14:35:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPp0F-00000000rfV-2x1W;
	Sat, 07 Nov 2026 22:35:15 +0000
Date: Sun, 08 Nov 2026 06:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 37/154]
 drivers/net/pcs/pcs-mtk-lynxi.c:548:13: warning: variable 'flags' set but not
 used
Message-ID: <202611080644.BNoAGULv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: 51267acf54375bc00d77b438e7557a1fc0f0017e [37/154] net: pcs: mtk-lynxi: add phya tx rx clock path
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611080644.BNoAGULv-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080644.BNoAGULv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080644.BNoAGULv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/pcs/pcs-mtk-lynxi.c: In function 'mtk_pcs_lynxi_probe':
>> drivers/net/pcs/pcs-mtk-lynxi.c:548:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable=]
     548 |         u32 flags = 0;
         |             ^~~~~
--
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_sgmii_init':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5524:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable=]
    5524 |         u32 flags = 0;
         |             ^~~~~


vim +/flags +548 drivers/net/pcs/pcs-mtk-lynxi.c

   538	
   539	#if IS_ENABLED(CONFIG_FWNODE_PCS)
   540	static int mtk_pcs_lynxi_probe(struct platform_device *pdev)
   541	{
   542		struct device *dev = &pdev->dev;
   543		struct fwnode_pcs_provider *pcs_provider;
   544		struct device_node *np = dev->of_node;
   545		struct mtk_pcs_lynxi *mpcs;
   546		struct phylink_pcs *pcs;
   547		struct regmap *regmap;
 > 548		u32 flags = 0;
   549	
   550		mpcs = devm_kzalloc(dev, sizeof(*mpcs), GFP_KERNEL);
   551		if (!mpcs)
   552			return -ENOMEM;
   553	
   554		mpcs->dev = dev;
   555		regmap = syscon_node_to_regmap(np->parent);
   556		if (IS_ERR(regmap))
   557			return PTR_ERR(regmap);
   558	
   559		if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
   560			flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
   561	
   562		if (of_parse_phandle(np->parent, "resets", 0)) {
   563			mpcs->rstc = of_reset_control_get_shared(np->parent, NULL);
   564			if (IS_ERR(mpcs->rstc))
   565				return PTR_ERR(mpcs->rstc);
   566		} else
   567			mpcs->rstc = NULL;
   568	
   569		reset_control_deassert(mpcs->rstc);
   570		mpcs->sgmii_sel = devm_clk_get_enabled(dev, "sgmii_sel");
   571		if (IS_ERR(mpcs->sgmii_sel))
   572			return PTR_ERR(mpcs->sgmii_sel);
   573	
   574		mpcs->sgmii_rx = devm_clk_get(dev, "sgmii_rx");
   575		if (IS_ERR(mpcs->sgmii_rx))
   576			return PTR_ERR(mpcs->sgmii_rx);
   577	
   578		mpcs->sgmii_tx = devm_clk_get(dev, "sgmii_tx");
   579		if (IS_ERR(mpcs->sgmii_tx))
   580			return PTR_ERR(mpcs->sgmii_tx);
   581	
   582		mpcs->xfi_tphy = devm_of_phy_optional_get(mpcs->dev, np, NULL);
   583		if (IS_ERR(mpcs->xfi_tphy))
   584			return PTR_ERR(mpcs->xfi_tphy);
   585	
   586		pcs = mtk_pcs_lynxi_init(dev, of_fwnode_handle(np), regmap,
   587					 (uintptr_t)of_device_get_match_data(dev),
   588					 mpcs);
   589		if (IS_ERR(pcs))
   590			return PTR_ERR(pcs);
   591	
   592		regmap_set_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
   593	
   594		platform_set_drvdata(pdev, mpcs);
   595	
   596		pcs_provider = devm_fwnode_pcs_add_provider(dev, dev_fwnode(dev),
   597							    fwnode_pcs_simple_xlate, &mpcs->pcs);
   598		if (IS_ERR(pcs_provider))
   599			return PTR_ERR(pcs_provider);
   600	
   601		return 0;
   602	}
   603	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
