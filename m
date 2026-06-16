Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68537DE8D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781579607; cv=none; b=ci223/ZdNrTx5dnLfdkGVJh1ujbGosSUTqozzVBschfZlNqGkM4781tBLAA6Hvrdi8OnJVDaoaSiDY9iZVEJQJ6KQwH+1NBpyWFxAwygU9z6PgF65mRma+B3/uDNNDYste044Poobx5bo94IjiaFm10iowIpOWuUrrb3TJGnr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781579607; c=relaxed/simple;
	bh=DBTKYgxJNkwdACzYvcLtUIN1/R9i/BhTDsNNhPtbRus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ud0qQBuekoxjnjbHkSxSOEY2HFg6H+uKLIsD2y3MLajoGJWlcpNLB+LAUCT1+j72Kp6yytq2PRQGia9dGaYY82AvqlEIitE50OX9Fzc95KCcGajDOPNNkvnisgxNU2RQdhM2lH/c73+I8DB/SR1HxeYpDr62d0ioQqSEoaL53JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9tlQADe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9tlQADe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781579605; x=1813115605;
  h=date:from:to:cc:subject:message-id;
  bh=DBTKYgxJNkwdACzYvcLtUIN1/R9i/BhTDsNNhPtbRus=;
  b=U9tlQADeBXCDXJ9/DZEyPi78+id2S1nwXnAeVNhae5ytXRjaxUpoVFyZ
   8eKpyDLT3LJUsqeuyqiR/Sh/AAtKJ4Hh2bydSFj8Vzz7oo7rgwygYOzn1
   MXTAXHO+TlWUEdS2+WZZ7J/+QpPnJW56cTI1nyyoGJqRqV4zsTwBJ+a22
   klsIY3bp5eiKzsR/v4+ItcCYIs2vIv3bZl2Y5CUS80Bgswh9GotYmS3s6
   pNpasgBHzDsgTQCfPH7w4lNWXd99dX3beD7bFWCY0/3xAISNN0WDoQF6z
   agmaqrbicHULHyL+wq7QL136tGGOpny01ghYEzIJ6RVAvOkbASAqbg5Jf
   Q==;
X-CSE-ConnectionGUID: LJ7pt1DvRGqCgSCeA+gdmQ==
X-CSE-MsgGUID: qnlSNBkSS4CD+JAckgb6jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69879223"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="69879223"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 20:13:22 -0700
X-CSE-ConnectionGUID: sbJ4b/x8TUaHzH/KVTWB/Q==
X-CSE-MsgGUID: beJuCl7NQo62xjcQiwxbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="244752972"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2026 20:13:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZKEo-00000000Sek-3nHi;
	Tue, 16 Jun 2026 03:13:18 +0000
Date: Tue, 16 Jun 2026 11:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 162/162]
 drivers/net/pcs/pcs-mtk-lynxi.c:477:13: warning: variable 'flags' set but not
 used
Message-ID: <202606161138.j8p7LLPJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   5c1d29f589046df832c7a303b9df3afd038366df
commit: 3711abad7e2e72cb061918aad080ab176db1aa8a [162/162] net: pcs: mtk-lynxi: add phya tx rx clock path
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260616/202606161138.j8p7LLPJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161138.j8p7LLPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161138.j8p7LLPJ-lkp@intel.com/

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
