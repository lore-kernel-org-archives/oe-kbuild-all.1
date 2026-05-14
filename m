Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A245314D0D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774164; cv=none; b=qVLLzagTUFYexa1qs33TvLEhp0W7HqTNAhCM87u9wVognO5tfwapM+fWv24xhZji3ps/WB2aAFTZ3vzd2+jGL4vLyWVRg+IUmoIrfIedvhmwh3EQY1yDFV9Glttumc9Wo7sMEjI4LUP8QdFUl+ktBfBZGHd++LK6oaeBRYsSqzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774164; c=relaxed/simple;
	bh=i74T/2SmS3fFTYFg5UhBmqS2AzHCc5vWiNmX51fMe2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MLuQIS7IhYNTg9hDEJA3XebZ5S3GNquTeFiCdGdFG8SE1c9LQZHvN7M6+1eBy6k8b0dysGY214ikvUce2Un2C/0aqTCmIIaQLBifJ9tJC9EmKiQtIjagTrrlASceXlMoHCwTIkSCk6TxwahLK/pBN2ynkWE+5VrMtk5HFc+2pU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFtS9CwO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFtS9CwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778774162; x=1810310162;
  h=date:from:to:cc:subject:message-id;
  bh=i74T/2SmS3fFTYFg5UhBmqS2AzHCc5vWiNmX51fMe2M=;
  b=aFtS9CwOCd9SFEY04xuLuPERjj+2HW6w68+Nr+RX48q2hQZLTrbYFBef
   4pZyrqejcparRR8qQdORkoqPxJahIGlPbfRtDkMwKRww+SOP8VVDqWP5m
   eDl9+rZ5uYx9nheAtjIP3sYLYYfKG0qAAeCCAEpt/jXY3JOMuPs/4fqrV
   uSLIOJOxKmq99b9w+4EYf52LvefDRxkgBH3lvCekjBCGQcL7lXXOSlizz
   dhOFQwXxq+T9MdRx+TPro9cNE1fS3agAUSJ7uyv81h7clOOneJvG/XTHk
   Xr8NnoNIB85sTUw+Ka+r6/wRuDdbalR22GWiO+YKKhIHkodJxJD7B1mFt
   A==;
X-CSE-ConnectionGUID: zN0EwbZTS3mSyuaxIdXotw==
X-CSE-MsgGUID: unIgGfLvSNSqdh0hCKi98g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83587608"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="83587608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 08:56:02 -0700
X-CSE-ConnectionGUID: sPhMRSnGSAOkS9fzYooJFQ==
X-CSE-MsgGUID: S6CCuwCMT0KG9x2B+OqWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238302903"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 08:56:01 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNYPl-000000006iV-01Xi;
	Thu, 14 May 2026 15:55:57 +0000
Date: Thu, 14 May 2026 23:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 78/154]
 drivers/net/pcs/pcs-mtk-lynxi.c:477:6: warning: variable 'flags' set but not
 used
Message-ID: <202605142339.fveWv56k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   767536110bfe28c94ae2e150c083d29f827655cf
commit: 188fbd9a282fbed6a7a43430ab5d611dacfee1c5 [78/154] net: pcs: mtk-lynxi: add phya tx rx clock path
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260514/202605142339.fveWv56k-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142339.fveWv56k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142339.fveWv56k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-mtk-lynxi.c:477:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
           u32 flags = 0;
               ^
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
