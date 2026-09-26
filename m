Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19E54705A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381250; cv=none; b=ojCTAZYreFN2Gv5qVJYTp0u5mwdZe/1yUxhIlC6weGRGEtCsknSuCUjPOdOY69zqW/K2/7BEVWfSOqT+ulVmxMkoyapkoBAB87xZey/MoQqdo7r34jmAveiwylWddBuT/R5sVJwF6egBP1Pm8C0oMyEKCoAi50HIBwbZch537FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381250; c=relaxed/simple;
	bh=cTBC8bMtwlXMXWb0w0CtsEHG8536wqWWP431a5G4bJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M7hQ5JjwMwEOq7Gc6iEam9pBzKIQeQLrjb16v5OJKRv2Wch5oJZyFo5oBBFnc0zUTFC1VHL9ZjZ7hsNnUgjRljUa9mVkDnCcPb2PT0OkQ0+LKDqVsAbEfh1msbsbWJcDYhNsZnLwGGRvXNobtLxos64KGXSvube5B3/MmQoJZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gI8dCTPf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gI8dCTPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790381248; x=1821917248;
  h=date:from:to:cc:subject:message-id;
  bh=cTBC8bMtwlXMXWb0w0CtsEHG8536wqWWP431a5G4bJE=;
  b=gI8dCTPfSHvomMYn9Qo2FYYicOaHF32qjcUypa2LgvfBb8NRGJ2AlRnq
   m5OrT+PJGPT0Os6JXZ7/GkMvgNmU1DBAgOSPwgZx4z8wJ91r2xiS+ys3E
   58OJEY6TXzBmkzQAyz+ax38OSGKwPNMdFskVOcIQvZ1SZP0PVbOltJNCQ
   ewuhSmo5MRO5zXV7XWCrJKeL1iNnRl/deJwOCxeg6zxL1DD2u4rS8ri8N
   0Lwh9WuQZwolbjbUDKs3HPBcev7C+/3oLxZ5SzYse2uJ5JczT58i/oaKd
   0mFeUlUKmUdlV1ENq6pqtO/yJbUpjeXJlTEjIKQ1BJZLOBa9jX2tj2PIH
   g==;
X-CSE-ConnectionGUID: 6Sl4ajV6T5eEHzjXxhKAqw==
X-CSE-MsgGUID: qFRB7eL4Tp6VYzgSowMg9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="89938888"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="89938888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 17:07:28 -0700
X-CSE-ConnectionGUID: uwUJ0RJCQcuoj479RQJyOg==
X-CSE-MsgGUID: 3NKOpbL/SMGR7a9AUfa+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274612545"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2026 17:07:26 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAFwl-0000000007J-389A;
	Sat, 26 Sep 2026 00:07:19 +0000
Date: Sat, 26 Sep 2026 02:06:43 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 drivers/net/pcs/pcs-mtk-lynxi.c:454:1-6: WARNING: invalid free of devm_
 allocated data
Message-ID: <202609260119.CE0oMb9X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: 775a0c2a4a90ff1247809111cb88bb66c4ff8856 [214/214] net: pcs: pcs-mtk-lynxi: add platform driver for MT7988
config: sparc64-randconfig-r2104-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260119.CE0oMb9X-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260119.CE0oMb9X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-mtk-lynxi.c:454:1-6: WARNING: invalid free of devm_ allocated data
--
>> drivers/net/pcs/pcs-mtk-lynxi.c:421:2-3: Unneeded semicolon

vim +454 drivers/net/pcs/pcs-mtk-lynxi.c

4765a9722e0976 Daniel Golle          2023-03-19  383  
775a0c2a4a90ff Daniel Golle          2023-12-12  384  static struct phylink_pcs *mtk_pcs_lynxi_init(struct device *dev,
bde1ae2d52ab35 Vladimir Oltean       2026-01-19  385  					      struct fwnode_handle *fwnode,
775a0c2a4a90ff Daniel Golle          2023-12-12  386  					      struct regmap *regmap, u32 ana_rgc3,
775a0c2a4a90ff Daniel Golle          2023-12-12  387  					      struct mtk_pcs_lynxi *prealloc)
4765a9722e0976 Daniel Golle          2023-03-19  388  {
4765a9722e0976 Daniel Golle          2023-03-19  389  	struct mtk_pcs_lynxi *mpcs;
4765a9722e0976 Daniel Golle          2023-03-19  390  	u32 id, ver;
4765a9722e0976 Daniel Golle          2023-03-19  391  	int ret;
4765a9722e0976 Daniel Golle          2023-03-19  392  
4765a9722e0976 Daniel Golle          2023-03-19  393  	ret = regmap_read(regmap, SGMSYS_PCS_DEVICE_ID, &id);
4765a9722e0976 Daniel Golle          2023-03-19  394  	if (ret < 0)
775a0c2a4a90ff Daniel Golle          2023-12-12  395  		return ERR_PTR(ret);
4765a9722e0976 Daniel Golle          2023-03-19  396  
4765a9722e0976 Daniel Golle          2023-03-19  397  	if (id != SGMII_LYNXI_DEV_ID) {
4765a9722e0976 Daniel Golle          2023-03-19  398  		dev_err(dev, "unknown PCS device id %08x\n", id);
775a0c2a4a90ff Daniel Golle          2023-12-12  399  		return ERR_PTR(-ENODEV);
4765a9722e0976 Daniel Golle          2023-03-19  400  	}
4765a9722e0976 Daniel Golle          2023-03-19  401  
4765a9722e0976 Daniel Golle          2023-03-19  402  	ret = regmap_read(regmap, SGMSYS_PCS_SCRATCH, &ver);
4765a9722e0976 Daniel Golle          2023-03-19  403  	if (ret < 0)
775a0c2a4a90ff Daniel Golle          2023-12-12  404  		return ERR_PTR(ret);
4765a9722e0976 Daniel Golle          2023-03-19  405  
4765a9722e0976 Daniel Golle          2023-03-19  406  	ver = FIELD_GET(SGMII_DEV_VERSION, ver);
4765a9722e0976 Daniel Golle          2023-03-19  407  	if (ver != 0x1) {
4765a9722e0976 Daniel Golle          2023-03-19  408  		dev_err(dev, "unknown PCS device version %04x\n", ver);
775a0c2a4a90ff Daniel Golle          2023-12-12  409  		return ERR_PTR(-ENODEV);
4765a9722e0976 Daniel Golle          2023-03-19  410  	}
4765a9722e0976 Daniel Golle          2023-03-19  411  
4765a9722e0976 Daniel Golle          2023-03-19  412  	dev_dbg(dev, "MediaTek LynxI SGMII PCS (id 0x%08x, ver 0x%04x)\n", id,
4765a9722e0976 Daniel Golle          2023-03-19  413  		ver);
4765a9722e0976 Daniel Golle          2023-03-19  414  
775a0c2a4a90ff Daniel Golle          2023-12-12  415  	if (prealloc) {
775a0c2a4a90ff Daniel Golle          2023-12-12  416  		mpcs = prealloc;
775a0c2a4a90ff Daniel Golle          2023-12-12  417  	} else {
775a0c2a4a90ff Daniel Golle          2023-12-12  418  		mpcs = kzalloc(sizeof(*mpcs), GFP_KERNEL);
4765a9722e0976 Daniel Golle          2023-03-19  419  		if (!mpcs)
775a0c2a4a90ff Daniel Golle          2023-12-12  420  			return ERR_PTR(-ENOMEM);
775a0c2a4a90ff Daniel Golle          2023-12-12 @421  	};
4765a9722e0976 Daniel Golle          2023-03-19  422  
4765a9722e0976 Daniel Golle          2023-03-19  423  	mpcs->ana_rgc3 = ana_rgc3;
4765a9722e0976 Daniel Golle          2023-03-19  424  	mpcs->regmap = regmap;
4765a9722e0976 Daniel Golle          2023-03-19  425  	mpcs->pcs.ops = &mtk_pcs_lynxi_ops;
4765a9722e0976 Daniel Golle          2023-03-19  426  	mpcs->pcs.poll = true;
4765a9722e0976 Daniel Golle          2023-03-19  427  	mpcs->interface = PHY_INTERFACE_MODE_NA;
bde1ae2d52ab35 Vladimir Oltean       2026-01-19  428  	mpcs->fwnode = fwnode_handle_get(fwnode);
4765a9722e0976 Daniel Golle          2023-03-19  429  
b87d4ee16bb4f6 Russell King (Oracle  2025-01-03  430) 	__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs.supported_interfaces);
b87d4ee16bb4f6 Russell King (Oracle  2025-01-03  431) 	__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs.supported_interfaces);
b87d4ee16bb4f6 Russell King (Oracle  2025-01-03  432) 	__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs.supported_interfaces);
b87d4ee16bb4f6 Russell King (Oracle  2025-01-03  433) 
4765a9722e0976 Daniel Golle          2023-03-19  434  	return &mpcs->pcs;
775a0c2a4a90ff Daniel Golle          2023-12-12  435  };
775a0c2a4a90ff Daniel Golle          2023-12-12  436  
775a0c2a4a90ff Daniel Golle          2023-12-12  437  struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
775a0c2a4a90ff Daniel Golle          2023-12-12  438  					 struct fwnode_handle *fwnode,
775a0c2a4a90ff Daniel Golle          2023-12-12  439  					 struct regmap *regmap, u32 ana_rgc3)
775a0c2a4a90ff Daniel Golle          2023-12-12  440  {
775a0c2a4a90ff Daniel Golle          2023-12-12  441  	return mtk_pcs_lynxi_init(dev, fwnode, regmap, ana_rgc3, NULL);
4765a9722e0976 Daniel Golle          2023-03-19  442  }
4765a9722e0976 Daniel Golle          2023-03-19  443  EXPORT_SYMBOL(mtk_pcs_lynxi_create);
4765a9722e0976 Daniel Golle          2023-03-19  444  
4765a9722e0976 Daniel Golle          2023-03-19  445  void mtk_pcs_lynxi_destroy(struct phylink_pcs *pcs)
4765a9722e0976 Daniel Golle          2023-03-19  446  {
bde1ae2d52ab35 Vladimir Oltean       2026-01-19  447  	struct mtk_pcs_lynxi *mpcs;
bde1ae2d52ab35 Vladimir Oltean       2026-01-19  448  
4765a9722e0976 Daniel Golle          2023-03-19  449  	if (!pcs)
4765a9722e0976 Daniel Golle          2023-03-19  450  		return;
4765a9722e0976 Daniel Golle          2023-03-19  451  
bde1ae2d52ab35 Vladimir Oltean       2026-01-19  452  	mpcs = pcs_to_mtk_pcs_lynxi(pcs);
bde1ae2d52ab35 Vladimir Oltean       2026-01-19  453  	fwnode_handle_put(mpcs->fwnode);
bde1ae2d52ab35 Vladimir Oltean       2026-01-19 @454  	kfree(mpcs);
4765a9722e0976 Daniel Golle          2023-03-19  455  }
4765a9722e0976 Daniel Golle          2023-03-19  456  EXPORT_SYMBOL(mtk_pcs_lynxi_destroy);
4765a9722e0976 Daniel Golle          2023-03-19  457  

:::::: The code at line 454 was first introduced by commit
:::::: bde1ae2d52ab3599e1c7ca68a90af8407d20f91d net: pcs: pcs-mtk-lynxi: pass SGMIISYS OF node to PCS

:::::: TO: Vladimir Oltean <vladimir.oltean@nxp.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
