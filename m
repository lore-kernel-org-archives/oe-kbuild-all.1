Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199F3CB8F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118940; cv=none; b=TNrJk9TQ2rv4vItsTNfKY4zGFLrh4hMImB3zjAuMEhUz33l8YifbJ8YQOBpSVLDVACfivX+vn9gOmVbZGRw6nunLMSqZgYz2YjimHvcKtnlmTYUHpJlUP7un91JY5u3dQcgmS2xccBqurm5AtpOUlYknrfDkb17iy182EWELWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118940; c=relaxed/simple;
	bh=tXXTBHK+knshOkHL6FG5iOhTNI9yTTxLDKRbdhxYQok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=POZrYslH+o5ejw+UN5XiTddu3vblv9Wp2ncLdfNK4OlTny7FeQu0ppSzDIghLMLeiZPlRy3hiZo/dYiPq8aknSpfu2N1x/zOYQuFIjKInhdwAeX3D2C+TUbuaMLniFOiJ3ph2P5VSn2TpUzW12qptzbqKk+XZouYSuLEVxA6Oto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmYYu0Ml; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmYYu0Ml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787118939; x=1818654939;
  h=date:from:to:cc:subject:message-id;
  bh=tXXTBHK+knshOkHL6FG5iOhTNI9yTTxLDKRbdhxYQok=;
  b=BmYYu0MlgsKNGsd27RnosJGojz3oNEBHr4kmOZSS9diUWY5Pur5kjk5F
   XAq/5+0y3MrvIOSMEtGWm+3th4p3Jx13b2U9oLVPPhA3NDiSF2BAq7gS/
   JxIBxC1AqD5fni0z2o4Q+xE2EPYXsTni2tinKTNYj4q7+e98G3Sqa64rK
   QUaxKiI6Y/ZkEvkzA3ikqiliA7dDNDfn2ywwV88LG3z5lJwPmPwy+AenK
   prRBXCtB9NKa7k6PUaviuqTK8R7UR/rW15anrbcscIH+zqnezt6DlRPOA
   R3frYdbB4tGuZqZQM8gz44zet2dNH/trxI8dvPdHbjZ2OBL+Um9oHd4LB
   A==;
X-CSE-ConnectionGUID: Tr+3zF+KToaXANFtqa22cw==
X-CSE-MsgGUID: 3CnBX27oTFiaNkkJhy6S4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98779659"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98779659"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:55:36 -0700
X-CSE-ConnectionGUID: bi0Q5AtvSiuoQnBFNP1ZkQ==
X-CSE-MsgGUID: YBuNOc7OTC+yRB/8hz0W5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="263708642"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2026 22:55:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZGt-00000000ev8-3TaM;
	Wed, 19 Aug 2026 05:55:31 +0000
Date: Wed, 19 Aug 2026 13:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 161/200]
 drivers/net/dsa/b53/b53_srab.c:619:29: warning: unused variable 'dn'
Message-ID: <202608191337.lWFpSf1X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: 17d6f307eeac32b9e1bae82f8f4388297cc4647f [161/200] net: dsa: remove pdata based probing
config: x86_64-buildonly-randconfig-006-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191337.lWFpSf1X-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191337.lWFpSf1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191337.lWFpSf1X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/b53/b53_srab.c: In function 'b53_srab_probe':
>> drivers/net/dsa/b53/b53_srab.c:619:29: warning: unused variable 'dn' [-Wunused-variable]
     619 |         struct device_node *dn = pdev->dev.of_node;
         |                             ^~


vim +/dn +619 drivers/net/dsa/b53/b53_srab.c

0e01491de64600 Florian Fainelli 2018-09-05  616  
967dd82ffc52e9 Florian Fainelli 2016-06-09  617  static int b53_srab_probe(struct platform_device *pdev)
967dd82ffc52e9 Florian Fainelli 2016-06-09  618  {
fefae6909ead17 Florian Fainelli 2016-07-08 @619  	struct device_node *dn = pdev->dev.of_node;
fefae6909ead17 Florian Fainelli 2016-07-08  620  	const struct of_device_id *of_id = NULL;
967dd82ffc52e9 Florian Fainelli 2016-06-09  621  	struct b53_srab_priv *priv;
967dd82ffc52e9 Florian Fainelli 2016-06-09  622  	struct b53_device *dev;
967dd82ffc52e9 Florian Fainelli 2016-06-09  623  
967dd82ffc52e9 Florian Fainelli 2016-06-09  624  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
967dd82ffc52e9 Florian Fainelli 2016-06-09  625  	if (!priv)
967dd82ffc52e9 Florian Fainelli 2016-06-09  626  		return -ENOMEM;
967dd82ffc52e9 Florian Fainelli 2016-06-09  627  
291f4b6de48aa8 YueHaibing       2019-08-01  628  	priv->regs = devm_platform_ioremap_resource(pdev, 0);
967dd82ffc52e9 Florian Fainelli 2016-06-09  629  	if (IS_ERR(priv->regs))
ef24d6c3d69651 Tiezhu Yang      2020-05-22  630  		return PTR_ERR(priv->regs);
967dd82ffc52e9 Florian Fainelli 2016-06-09  631  
967dd82ffc52e9 Florian Fainelli 2016-06-09  632  	dev = b53_switch_alloc(&pdev->dev, &b53_srab_ops, priv);
967dd82ffc52e9 Florian Fainelli 2016-06-09  633  	if (!dev)
967dd82ffc52e9 Florian Fainelli 2016-06-09  634  		return -ENOMEM;
967dd82ffc52e9 Florian Fainelli 2016-06-09  635  
17d6f307eeac32 Arnd Bergmann    2026-08-07  636  	of_id = of_match_node(b53_srab_of_match, dn);
17d6f307eeac32 Arnd Bergmann    2026-08-07  637  	dev->chip_id = (u32)(unsigned long)of_id->data;
fefae6909ead17 Florian Fainelli 2016-07-08  638  
967dd82ffc52e9 Florian Fainelli 2016-06-09  639  	platform_set_drvdata(pdev, dev);
967dd82ffc52e9 Florian Fainelli 2016-06-09  640  
16994374a6fc6a Florian Fainelli 2018-09-05  641  	b53_srab_prepare_irq(pdev);
0e01491de64600 Florian Fainelli 2018-09-05  642  	b53_srab_mux_init(pdev);
16994374a6fc6a Florian Fainelli 2018-09-05  643  
967dd82ffc52e9 Florian Fainelli 2016-06-09  644  	return b53_switch_register(dev);
967dd82ffc52e9 Florian Fainelli 2016-06-09  645  }
967dd82ffc52e9 Florian Fainelli 2016-06-09  646  

:::::: The code at line 619 was first introduced by commit
:::::: fefae6909ead1798c39bee4d94e7e8f1f2752ef6 net: dsa: b53: Allow SRAB driver to specify platform data

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
