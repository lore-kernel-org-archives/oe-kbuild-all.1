Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CED3CAA57
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371546; cv=none; b=Gi8VwybhZGsJKCgvbQfc3O435SwFLcO8+ZHWwjJRyCdKGDQ+YmOc2RqbjEdrJVRL8n8j8s4I6j9eC1ks4Exc0gT4apaw2lrrcZ7CqhU85rwyxF6L1eP1uV/Xj68mJv5mse/CKLaOP6FXJj9vMR6MBovE8Fj0rHEoEpaQWpEHCnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371546; c=relaxed/simple;
	bh=QQSFLLcCke2CfbydEosTY/KYeD9ci03Jc2PxZ8vdjF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hm5x3XbtRKBuiCV74GyTe9rNT8f4C1bzbG2kgDR6LwfXGzjhJktCQuEYjudT5e8Ey5ubWJJHGvgI9D2zA0X3FDHQ64lgrXoQP1cb0giInhEs6UduwMsg4+NmeOAuOS7FSUQJ0RCaQrB5JbsefhQme/rV9VOq5Wi6tkyKC6qoYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIMhcU/Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIMhcU/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790371544; x=1821907544;
  h=date:from:to:cc:subject:message-id;
  bh=QQSFLLcCke2CfbydEosTY/KYeD9ci03Jc2PxZ8vdjF8=;
  b=bIMhcU/Q1RMF7/yNWz6woHiwYBGxIoh3TQErRCH44AIKji3B31aZxBGl
   LOHOSKzKDOmNPT66UXeZfSwxAqtrYVkkVIYU0Ma5WBkhlALLPGh5pJVsM
   98tFKzcsuG3SmkUuoqwwCyn37jewWa2lzPKEEUEntZUXh3D4+FLRs6lwv
   O4ANVYTbEFBqOwzuHkLmmJZD1RhO+vPU9t4uZyaLWaAv8e5Crmku6Rdu3
   mUPZgxz1x4Cf4rvf+IT0xsrfaE5AOugb/g2nhn0JugblsCyFTuvsX1RRq
   5Al6SpTXLRnrXzP1YUi4NfbkinPD+BkUlgzpm5PXHHlgahvRjcNPDyS9k
   w==;
X-CSE-ConnectionGUID: enhOmzYSQM+P09LsWWiZpg==
X-CSE-MsgGUID: LlTTZj0ZQsmznEUflkNpTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90382461"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90382461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:25:36 -0700
X-CSE-ConnectionGUID: 7GUihB86SOO8qLsiGOVXAQ==
X-CSE-MsgGUID: WyvPeXC5Q/GZOId7SGPnjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303945505"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 14:25:35 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADQC-000000000ty-229E;
	Fri, 25 Sep 2026 21:25:32 +0000
Date: Fri, 25 Sep 2026 23:25:20 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 drivers/net/pcs/pcs-mtk-lynxi.c:477:6: warning: variable 'flags' set but not
 used
Message-ID: <202609252238.ooyASJLv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: ae0add9728693a0b083a8dbabbf6362e4282b91f [214/214] net: pcs: mtk-lynxi: add phya tx rx clock path
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260925/202609252238.ooyASJLv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252238.ooyASJLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252238.ooyASJLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-mtk-lynxi.c:477:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
     477 |         u32 flags = 0;
         |             ^
   1 warning generated.
--
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5651:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    5651 |         u32 flags = 0;
         |             ^
   1 warning generated.


vim +/flags +477 drivers/net/pcs/pcs-mtk-lynxi.c

   468	
   469	#ifdef CONFIG_FWNODE_PCS
   470	static int mtk_pcs_lynxi_probe(struct platform_device *pdev)
   471	{
   472		struct device *dev = &pdev->dev;
   473		struct device_node *np = dev->of_node;
   474		struct mtk_pcs_lynxi *mpcs;
   475		struct phylink_pcs *pcs;
   476		struct regmap *regmap;
 > 477		u32 flags = 0;
   478	
   479		mpcs = devm_kzalloc(dev, sizeof(*mpcs), GFP_KERNEL);
   480		if (!mpcs)
   481			return -ENOMEM;
   482	
   483		mpcs->dev = dev;
   484		regmap = syscon_node_to_regmap(np->parent);
   485		if (IS_ERR(regmap))
   486			return PTR_ERR(regmap);
   487	
   488		if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
   489			flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
   490	
   491		if (of_parse_phandle(np->parent, "resets", 0)) {
   492			mpcs->rstc = of_reset_control_get_shared(np->parent, NULL);
   493			if (IS_ERR(mpcs->rstc))
   494				return PTR_ERR(mpcs->rstc);
   495		} else
   496			mpcs->rstc = NULL;
   497	
   498		reset_control_deassert(mpcs->rstc);
   499		mpcs->sgmii_sel = devm_clk_get_enabled(dev, "sgmii_sel");
   500		if (IS_ERR(mpcs->sgmii_sel))
   501			return PTR_ERR(mpcs->sgmii_sel);
   502	
   503		mpcs->sgmii_rx = devm_clk_get(dev, "sgmii_rx");
   504		if (IS_ERR(mpcs->sgmii_rx))
   505			return PTR_ERR(mpcs->sgmii_rx);
   506	
   507		mpcs->sgmii_tx = devm_clk_get(dev, "sgmii_tx");
   508		if (IS_ERR(mpcs->sgmii_tx))
   509			return PTR_ERR(mpcs->sgmii_tx);
   510	
   511		if (of_parse_phandle(dev->of_node, "phys", 0)) {
   512			mpcs->xfi_tphy = devm_of_phy_get(mpcs->dev, dev->of_node, NULL);
   513			if (IS_ERR(mpcs->xfi_tphy))
   514				return PTR_ERR(mpcs->xfi_tphy);
   515		} else
   516			mpcs->xfi_tphy = NULL;
   517	
   518		pcs = mtk_pcs_lynxi_init(dev, of_fwnode_handle(np), regmap,
   519					 (uintptr_t)of_device_get_match_data(dev),
   520					 mpcs);
   521		if (IS_ERR(pcs))
   522			return PTR_ERR(pcs);
   523	
   524		regmap_set_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
   525	
   526		platform_set_drvdata(pdev, mpcs);
   527	
   528		return fwnode_pcs_add_provider(of_fwnode_handle(np), fwnode_pcs_simple_get, &mpcs->pcs);
   529	}
   530	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
