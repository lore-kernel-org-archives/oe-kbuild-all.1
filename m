Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8691E531
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 23:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737244342; cv=none; b=V7aEywux9ifT9XKXPbTp8KX0CUTLXcTkdH05MxyhS9sIDRZQrVW/NVFNnEf8pN1twJ83+pejzONCSJg9iMhumWB5tkfGWe0R2Bjy6N+hBf13rAztkaACjND6VFi54l58JjBCtd9svTrGU/EJ/xLFs63LyEik60eCKXrEc5LLtZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737244342; c=relaxed/simple;
	bh=UMGX59yHl8LTmx8NtJkt5hUoGjajkCbeNm/aG3E7PII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEwgaooqG+xDVOSFoVLqvyRmH9yFQaiNAsopfnkdh1eiSdrlvlRfGC+m6XoNCKy9iCNOpwUcdGHDN37fUBPDwlEZxjDUTj+dDl/EaVg9TtSaQOKDjxdLPxuAlEz8CqGG017hd1rf6KgHolkScpvvbL+LFkHOT0hiBWObokiQjjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPIq7/lh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPIq7/lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737244341; x=1768780341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMGX59yHl8LTmx8NtJkt5hUoGjajkCbeNm/aG3E7PII=;
  b=NPIq7/lhw26OlNqh2dFyuMFTMh6ppYkSRWoi0AObPSGOtwDwwh6/VGlr
   //tnIhjAk92a/Br0vm4BpKT0Wusj3omjOnDexKI51q2i9Jt2xBBqAMc0w
   dJ1UbiX3Gw8OQmitLe5vDnJ+x12Dt4QUUqyksQ2cCSQ62ByBPEVQ7mMQ7
   pbm3gmk49ATePa4XJPsMXFNf3h1OaBx1Tbr1OBRut3WvMfk8Kp1I4wHtK
   VNpu4UrKa39/R5mZ1Adjw1rmOOdMLQd28zqu/aHsUmEgfcM5V/wTCkXwQ
   0Fp1YJOlDnz5KzXi1z6hLf+ZCskAOhQbNlLZsodfhIiHa7BBDr6mtFXsk
   w==;
X-CSE-ConnectionGUID: 1YVRaHSgQ9uSjCcy2ywBlQ==
X-CSE-MsgGUID: ts8r2wljT7+a4b+fKTTKAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41406310"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="41406310"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 15:52:20 -0800
X-CSE-ConnectionGUID: JcqEUk76QzOBf+lPdUSQjA==
X-CSE-MsgGUID: 6Dz1WbsCQZqGhB5Fz9Ky/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106686909"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jan 2025 15:52:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZIbw-000UwZ-0Y;
	Sat, 18 Jan 2025 23:52:16 +0000
Date: Sun, 19 Jan 2025 07:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 8642/9563]
 drivers/net/phy/realtek/realtek_main.c:442:3-12: opportunity for
 str_enabled_disabled(val_rxdly)
Message-ID: <202501190707.qQS8PGHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 1416a9b2ba710d31954131c06d46f298e340aa2c [8642/9563] net: phy: move realtek PHY driver to its own subdirectory
config: parisc-randconfig-r054-20250119 (https://download.01.org/0day-ci/archive/20250119/202501190707.qQS8PGHW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190707.qQS8PGHW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/realtek/realtek_main.c:442:3-12: opportunity for str_enabled_disabled(val_rxdly)
>> drivers/net/phy/realtek/realtek_main.c:427:3-12: opportunity for str_enabled_disabled(val_txdly)

vim +442 drivers/net/phy/realtek/realtek_main.c

cf87915cb9f873 drivers/net/phy/realtek.c Heiner Kallweit     2018-07-02  373  
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  374  static int rtl8211f_config_init(struct phy_device *phydev)
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  375  {
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  376  	struct rtl821x_priv *priv = phydev->priv;
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  377  	struct device *dev = &phydev->mdio.dev;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  378  	u16 val_txdly, val_rxdly;
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  379  	int ret;
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  380  
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  381  	ret = phy_modify_paged_changed(phydev, 0xa43, RTL8211F_PHYCR1,
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  382  				       RTL8211F_ALDPS_PLL_OFF | RTL8211F_ALDPS_ENABLE | RTL8211F_ALDPS_XTAL_OFF,
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  383  				       priv->phycr1);
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  384  	if (ret < 0) {
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  385  		dev_err(dev, "aldps mode  configuration failed: %pe\n",
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  386  			ERR_PTR(ret));
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  387  		return ret;
d90db36a9e748c drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  388  	}
66e22932eb795f drivers/net/phy/realtek.c Jisheng Zhang       2020-09-21  389  
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  390  	switch (phydev->interface) {
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  391  	case PHY_INTERFACE_MODE_RGMII:
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  392  		val_txdly = 0;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  393  		val_rxdly = 0;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  394  		break;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  395  
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  396  	case PHY_INTERFACE_MODE_RGMII_RXID:
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  397  		val_txdly = 0;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  398  		val_rxdly = RTL8211F_RX_DELAY;
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  399  		break;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  400  
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  401  	case PHY_INTERFACE_MODE_RGMII_TXID:
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  402  		val_txdly = RTL8211F_TX_DELAY;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  403  		val_rxdly = 0;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  404  		break;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  405  
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  406  	case PHY_INTERFACE_MODE_RGMII_ID:
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  407  		val_txdly = RTL8211F_TX_DELAY;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  408  		val_rxdly = RTL8211F_RX_DELAY;
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  409  		break;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  410  
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  411  	default: /* the rest of the modes imply leaving delay as is. */
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  412  		return 0;
1da7756e6616c7 drivers/net/phy/realtek.c Serge Semin         2019-05-09  413  	}
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  414  
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  415  	ret = phy_modify_paged_changed(phydev, 0xd08, 0x11, RTL8211F_TX_DELAY,
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  416  				       val_txdly);
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  417  	if (ret < 0) {
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  418  		dev_err(dev, "Failed to update the TX delay register\n");
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  419  		return ret;
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  420  	} else if (ret) {
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  421  		dev_dbg(dev,
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  422  			"%s 2ns TX delay (and changing the value from pin-strapping RXD1 or the bootloader)\n",
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  423  			val_txdly ? "Enabling" : "Disabling");
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  424  	} else {
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  425  		dev_dbg(dev,
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  426  			"2ns TX delay was already %s (by pin-strapping RXD1 or bootloader configuration)\n",
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26 @427  			val_txdly ? "enabled" : "disabled");
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  428  	}
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  429  
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  430  	ret = phy_modify_paged_changed(phydev, 0xd08, 0x15, RTL8211F_RX_DELAY,
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  431  				       val_rxdly);
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  432  	if (ret < 0) {
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  433  		dev_err(dev, "Failed to update the RX delay register\n");
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  434  		return ret;
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  435  	} else if (ret) {
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  436  		dev_dbg(dev,
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  437  			"%s 2ns RX delay (and changing the value from pin-strapping RXD0 or the bootloader)\n",
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  438  			val_rxdly ? "Enabling" : "Disabling");
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  439  	} else {
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  440  		dev_dbg(dev,
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  441  			"2ns RX delay was already %s (by pin-strapping RXD0 or bootloader configuration)\n",
1b3047b5208a80 drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26 @442  			val_rxdly ? "enabled" : "disabled");
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  443  	}
3aec743d69822d drivers/net/phy/realtek.c Martin Blumenstingl 2019-12-26  444  
bb726b753f75a4 drivers/net/phy/realtek.c Clark Wang          2022-08-17  445  	if (priv->has_phycr2) {
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  446  		ret = phy_modify_paged(phydev, 0xa43, RTL8211F_PHYCR2,
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  447  				       RTL8211F_CLKOUT_EN, priv->phycr2);
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  448  		if (ret < 0) {
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  449  			dev_err(dev, "clkout configuration failed: %pe\n",
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  450  				ERR_PTR(ret));
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  451  			return ret;
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  452  		}
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  453  
0a4355c2b7f8ec drivers/net/phy/realtek.c Joakim Zhang        2021-06-08  454  		return genphy_soft_reset(phydev);
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  455  	}
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  456  
3489182b11d35f drivers/net/phy/realtek.c Siddharth Vadapalli 2024-02-20  457  	return 0;
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  458  }
3447cf2e9a11fd drivers/net/phy/realtek.c Shengzhou Liu       2015-06-18  459  

:::::: The code at line 442 was first introduced by commit
:::::: 1b3047b5208a80e7213bc4621f6fa4e5feb8dee4 net: phy: realtek: add support for configuring the RX delay on RTL8211F

:::::: TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
