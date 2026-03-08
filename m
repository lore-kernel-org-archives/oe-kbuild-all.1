Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC001A9FAA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772967246; cv=none; b=KmydeUbwjIa84b/9nF65l1EhFgqbhNWyn8u3vP/gasmmNVT9IFr9nCDa7OVUry4viAsGtn7i465gq0ciIN5deoOTmCKMHEU5FrZYKBxMzqzMjFb8MWPS98CUuYOuy5Th9nfduhbwZwKuHkgrn8StdAxV1Hvk3gmFvMCMF4GK4gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772967246; c=relaxed/simple;
	bh=sAxElmp6AoPH2LmXuOtUM6EN3WuRDxw/FwxUCV0J9J4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DcOgSp1wxgjE3Un5thqzbHSaZVHK/Mv+A8OrD6mn02oge0Lm55Bt4vnZI9ZLZcZECr/jlMFymzpK8qY9rjJ2KrI7IsM5cNWMUqLYAmp30IUs14PWBDQi3H1ucyKfBbpBhWsaaWyd9JSJG6ckZMr2MZBMBpnNN0pJsbzSzY6R+t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWoJI3Uz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWoJI3Uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772967244; x=1804503244;
  h=date:from:to:cc:subject:message-id;
  bh=sAxElmp6AoPH2LmXuOtUM6EN3WuRDxw/FwxUCV0J9J4=;
  b=kWoJI3Uzp9NKkdXLdHtkASlIqhCwuS5zMpNozhDnpcQvCoPQYYIL/rqE
   uWcHiQB9jNT/b+1+G7HJZgTItHnuzgLk00GZjQUwJ+qzE115mJ8HzOeM1
   UfZ08dwDxi0bsi44hIiVS3S+12FhW9Itrw8nIH0TgMH0++3o9IyhwF7/Q
   FHKqk6XatSWatW+Jf35ZtiZlvprEPBhOSoRLjkW+eMny68vWjaDLxbcEm
   9ekyoU/T5UI4vyj2CtfbckB6eicrcYnwHGca2QfI/ek5ZgIykVq7av8M6
   zIyInX2qY9ZDG9Ccp1gxyaeKZJPn35ZczTe5ko3ZQwC9Exye9s+FpKhb+
   A==;
X-CSE-ConnectionGUID: 3pRKt1oETtK6xTS48eBCxg==
X-CSE-MsgGUID: /Lrz0Tw+TXKtoRjDPCzDpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73928980"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="73928980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 03:54:04 -0700
X-CSE-ConnectionGUID: gpi006yMSweTW3F0WshXew==
X-CSE-MsgGUID: YB8boID1RHikEUYVijTzyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="242488463"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 03:54:02 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzBlo-0000000032r-1D83;
	Sun, 08 Mar 2026 10:54:00 +0000
Date: Sun, 08 Mar 2026 18:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 73/81]
 drivers/net/pcs/pcs-mtk-lynxi.c:474:6: warning: variable 'flags' set but not
 used
Message-ID: <202603081821.DEPgr0yE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   30092cdf41471e9043eb39db2ce267bf712da979
commit: 62b5fb77a2bb10bff6a473e3e4126823dd32f03d [73/81] net: pcs: mtk-lynxi: add phya tx rx clock path
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603081821.DEPgr0yE-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081821.DEPgr0yE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081821.DEPgr0yE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-mtk-lynxi.c:474:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
           u32 flags = 0;
               ^
   1 warning generated.


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
