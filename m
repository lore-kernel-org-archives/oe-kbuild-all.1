Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AC53783AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187475; cv=none; b=tWaAocWdjjI3I975PekWZADtjTvMSk3Wg5JDCGl3Q2zBLbBstty85RIEEmaB/H7vQ70urOvCE1SLiznqFBYXlsoHP3BxqPIfCNwsTl8Dt4iyvPg1LYz4QdXqFqdHJFfryeJMZSMe2FEQwoaOSSN6rJCGi9LW0lHwuthshJ+15Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187475; c=relaxed/simple;
	bh=SsKBwqxXBpveqi1oFdT/Zl5zDcyeRwJMiLmaWwEp1S4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hN5kWKvIa+WzFkFBZrTw/715eyLpUHQTrd1MD4APDnI3muc09ryqb/tc7HbMqqFD2O5lYoyruY0TM3+K/xg+4ui5MCjLD9O4RYgrwtX0mOwwmoU69//j0irxivOuaiSK16ZUpftx02Eajty/vwAGdUhz0WPvVUzP9roOSG8KDSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b02PuGXw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b02PuGXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785187473; x=1816723473;
  h=date:from:to:cc:subject:message-id;
  bh=SsKBwqxXBpveqi1oFdT/Zl5zDcyeRwJMiLmaWwEp1S4=;
  b=b02PuGXwOt6xXhkH9ef6hjdy269sYiU8vN2MP7kWWha763GEjfKB5jhI
   22NcYRxNUdSmfWvYTnmnvxfFiXmaURog+siulqsMAv4GQI8VmXhlYEn1h
   GLSAQTY/O6VAapU6BvPSSC8bwrdxRyP0bgHNQ/60ZmM/ZWrJfKM45WwNj
   UR3C6ZWrXv8nzOaJ/GWG4rtBQSOANSPu9Hv4AlcC5yBc6PaDD41GnZm61
   AmKif3uoSkET7EsmgDiJB6SWoIMxi1R7Ni4jvLMAzh2EEOrifC8kjeMcA
   iidsIrSczTifP+iwPh4LdkNVuCdEQvin+FQaeHrJt6IE92ffpcqJ81+AF
   Q==;
X-CSE-ConnectionGUID: 9+eYwUSLRPeE/R/m9P8idQ==
X-CSE-MsgGUID: ioc1rVZaQZWwaz+FPavX2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85632307"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85632307"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 14:24:32 -0700
X-CSE-ConnectionGUID: fF7RKytoTnOJ1zsOju/oXw==
X-CSE-MsgGUID: 9xRyQ08sTVqsDt7B+pvt5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="255577858"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2026 14:24:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woSoG-00000000dc5-1lCD;
	Mon, 27 Jul 2026 21:24:28 +0000
Date: Tue, 28 Jul 2026 05:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 164/164]
 drivers/net/pcs/pcs-mtk-lynxi.c:477:13: warning: variable 'flags' set but not
 used
Message-ID: <202607280506.hdhY4uNi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   23918d7eab97daf57988a8a538a870c4e862b525
commit: 9f04fd76bc18f52ae96c6487be54d8c8bedca353 [164/164] net: pcs: mtk-lynxi: add phya tx rx clock path
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260728/202607280506.hdhY4uNi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280506.hdhY4uNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280506.hdhY4uNi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/pcs/pcs-mtk-lynxi.c: In function 'mtk_pcs_lynxi_probe':
>> drivers/net/pcs/pcs-mtk-lynxi.c:477:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable=]
     477 |         u32 flags = 0;
         |             ^~~~~


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
