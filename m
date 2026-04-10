Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2B346A10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848869; cv=none; b=FQM5b5uck3jSQhK+h1N40WtDkFIoOa9AxbVVjC9wEQ7s3moO4kUKT3EtrUOx1iFfN+m/uCdKhdMpAaDAMC5+zdY6sRn7r7MtfPzs3kMECN7cQ+WX185GIWRlRYBUdRqNDR6X20C+/S0e2HAF+o5L+Kj7p3VAYh9JE9mCyp6rxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848869; c=relaxed/simple;
	bh=SgwzIfnPymHzLHTgDqpgV3KHhQy8o+KCtTNjtMrY8/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nxtwefjVz/ljwwcfHJFQLLs7GghAo6Ff2fNL4Rn2bRzvC7Hhf4iPoQ16nToihqEKA+64ySWvL/VazfeeQmWtx11f2/y+4Xw7mBOrxcA0BE2lVtnwdZG/ctfEpxfeu9a+vLr7CIAFQnUk+Eoa1Rrk2mY4QRJAoZUgGnC+K5MIzOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g10HE+7m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g10HE+7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775848866; x=1807384866;
  h=date:from:to:cc:subject:message-id;
  bh=SgwzIfnPymHzLHTgDqpgV3KHhQy8o+KCtTNjtMrY8/c=;
  b=g10HE+7mmILpftnISonqWaV1y51ikVywXC8F3IBkWXlMPwlOV5k8pR5j
   XgGcdRy9BwoWju0452r7vnHkboqHkl+I+W0R5f1XLwAgBFLbGCvmrXZWy
   t8QW3li2AH6daIW631IQCMzEQkPiF388MxxHXsHex2Oc64j+CWo9Nsgda
   d3+f+xkb2hLQ0x8jj5CRktj/LMN4Dvbm80Piyuog60+kbbTuLWHIvTyO5
   Ip0wx9EW/PDV70ItkElyDzEOhbQuDv7DlD3joEzg/Lc/Kin9MjM/sHQB5
   NwOdZVa4zoWp2WPeLk9+Ewbb9+1kEwMMYM9gX4xn3XlqonKwDiWHGwse/
   A==;
X-CSE-ConnectionGUID: O/GHMGCNRYCVO9vvOyLC2g==
X-CSE-MsgGUID: LdUA8BKSTMmOrALN9iBF/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88262727"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="88262727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 12:21:06 -0700
X-CSE-ConnectionGUID: cpIjSyROQ/2UEwMfHVtrzQ==
X-CSE-MsgGUID: nX4oQzArSS+39DvxoEpmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="234157893"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2026 12:21:04 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBHPZ-0000000006v-43jK;
	Fri, 10 Apr 2026 19:21:01 +0000
Date: Sat, 11 Apr 2026 03:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 67/104]
 drivers/net/pcs/pcs-mtk-lynxi.c:474:6: warning: variable 'flags' set but not
 used
Message-ID: <202604110347.mJnqRTTT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   26aa722b76b3bc075b01f86981e17206cfbe9af5
commit: 49133defc13fed8e65a6a47cf671dc88407d0ff6 [67/104] net: pcs: mtk-lynxi: add phya tx rx clock path
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604110347.mJnqRTTT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110347.mJnqRTTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110347.mJnqRTTT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-mtk-lynxi.c:474:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
     474 |         u32 flags = 0;
         |             ^
   1 warning generated.
--
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5110:18: warning: unused variable 'mac' [-Wunused-variable]
    5110 |         struct mtk_mac *mac = netdev_priv(dev);
         |                         ^~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5599:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    5599 |         u32 flags = 0;
         |             ^
   2 warnings generated.


vim +/flags +474 drivers/net/pcs/pcs-mtk-lynxi.c

   465	
   466	#ifdef CONFIG_FWNODE_PCS
   467	static int mtk_pcs_lynxi_probe(struct platform_device *pdev)
   468	{
   469		struct device *dev = &pdev->dev;
   470		struct device_node *np = dev->of_node;
   471		struct mtk_pcs_lynxi *mpcs;
   472		struct phylink_pcs *pcs;
   473		struct regmap *regmap;
 > 474		u32 flags = 0;
   475	
   476		mpcs = devm_kzalloc(dev, sizeof(*mpcs), GFP_KERNEL);
   477		if (!mpcs)
   478			return -ENOMEM;
   479	
   480		mpcs->dev = dev;
   481		regmap = syscon_node_to_regmap(np->parent);
   482		if (IS_ERR(regmap))
   483			return PTR_ERR(regmap);
   484	
   485		if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
   486			flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
   487	
   488		if (of_parse_phandle(np->parent, "resets", 0)) {
   489			mpcs->rstc = of_reset_control_get_shared(np->parent, NULL);
   490			if (IS_ERR(mpcs->rstc))
   491				return PTR_ERR(mpcs->rstc);
   492		} else
   493			mpcs->rstc = NULL;
   494	
   495		reset_control_deassert(mpcs->rstc);
   496		mpcs->sgmii_sel = devm_clk_get_enabled(dev, "sgmii_sel");
   497		if (IS_ERR(mpcs->sgmii_sel))
   498			return PTR_ERR(mpcs->sgmii_sel);
   499	
   500		mpcs->sgmii_rx = devm_clk_get(dev, "sgmii_rx");
   501		if (IS_ERR(mpcs->sgmii_rx))
   502			return PTR_ERR(mpcs->sgmii_rx);
   503	
   504		mpcs->sgmii_tx = devm_clk_get(dev, "sgmii_tx");
   505		if (IS_ERR(mpcs->sgmii_tx))
   506			return PTR_ERR(mpcs->sgmii_tx);
   507	
   508		if (of_parse_phandle(dev->of_node, "phys", 0)) {
   509			mpcs->xfi_tphy = devm_of_phy_get(mpcs->dev, dev->of_node, NULL);
   510			if (IS_ERR(mpcs->xfi_tphy))
   511				return PTR_ERR(mpcs->xfi_tphy);
   512		} else
   513			mpcs->xfi_tphy = NULL;
   514	
   515		pcs = mtk_pcs_lynxi_init(dev, of_fwnode_handle(np), regmap,
   516					 (uintptr_t)of_device_get_match_data(dev),
   517					 mpcs);
   518		if (IS_ERR(pcs))
   519			return PTR_ERR(pcs);
   520	
   521		regmap_set_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
   522	
   523		platform_set_drvdata(pdev, mpcs);
   524	
   525		return fwnode_pcs_add_provider(of_fwnode_handle(np), fwnode_pcs_simple_get, &mpcs->pcs);
   526	}
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
