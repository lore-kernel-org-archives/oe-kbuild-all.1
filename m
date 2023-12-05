Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70559E4F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTyC6Xu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701777519; x=1733313519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIE6wV9DrUt2ZhmCtURgIKkHv0DdjIspLmVKJfdEs8g=;
  b=JTyC6Xu5FbZEAuFkvuPgaBCuu8gQoICD70yJw7lLxmFqqMoym+YKKGUr
   OTWXLxPNJQvRZta+iYtaFjpatcyfEyH1sBEKlZisigyY1oDlf9Bu8CBTo
   qYWYOhAC+ulXPQrBeECF/4js+Hx5Lskisjh6Fg6H1Q6n1fLfI7ZDys+0q
   jWtBDrUR904LfVGz7Y5JHSvHxDcxi48wfiH22zae8NsdDn98J4sz/H3Aw
   Kuso6IysLa1CA47calWc0j9/6jRipPSkXRAqWdc29RgO6EbEdufYSBTHa
   U7JTKjktsuaJjSBGiEM4832EnSLvksUgKInyLtOFwaUY7MFVvT8oBjobo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384281009"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="384281009"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018200377"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018200377"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:58:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAU4P-0008vg-33;
	Tue, 05 Dec 2023 11:58:33 +0000
Date: Tue, 5 Dec 2023 19:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r3mini 26/34]
 drivers/net/phy/air_en8811h.c:916:9: warning: variable 'err' is
 uninitialized when used here
Message-ID: <202312051909.bz5T62N9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r3mini
head:   7a4da3bc9c1a2302ba8c22503865d1bbc0cdce1d
commit: 09cfc52b11f252cf232d8d5f8e27cd022745d3b3 [26/34] prepare interrupt for 2g5 phy
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051909.bz5T62N9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051909.bz5T62N9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051909.bz5T62N9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/air_en8811h.c:792:5: warning: no previous prototype for function 'en8811h_phy_modify_mmd_changed' [-Wmissing-prototypes]
   int en8811h_phy_modify_mmd_changed(struct phy_device *phydev, int devad, u32 regnum,
       ^
   drivers/net/phy/air_en8811h.c:792:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int en8811h_phy_modify_mmd_changed(struct phy_device *phydev, int devad, u32 regnum,
   ^
   static 
   drivers/net/phy/air_en8811h.c:898:6: warning: unused variable 'mask' [-Wunused-variable]
           u16 mask = 0;
               ^
>> drivers/net/phy/air_en8811h.c:916:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
           return err;
                  ^~~
   drivers/net/phy/air_en8811h.c:899:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   drivers/net/phy/air_en8811h.c:952:12: warning: no previous prototype for function 'en8811h_phy_driver_register' [-Wmissing-prototypes]
   int __init en8811h_phy_driver_register(void)
              ^
   drivers/net/phy/air_en8811h.c:952:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init en8811h_phy_driver_register(void)
   ^
   static 
   drivers/net/phy/air_en8811h.c:963:13: warning: no previous prototype for function 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
   void __exit en8811h_phy_driver_unregister(void)
               ^
   drivers/net/phy/air_en8811h.c:963:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit en8811h_phy_driver_unregister(void)
   ^
   static 
   5 warnings generated.


vim +/err +916 drivers/net/phy/air_en8811h.c

   791	
 > 792	int en8811h_phy_modify_mmd_changed(struct phy_device *phydev, int devad, u32 regnum,
   793				     u16 mask, u16 set)
   794	{
   795		int new, ret;
   796	
   797		ret = air_mii_cl45_read(phydev, devad, regnum);
   798		if (ret < 0)
   799			return ret;
   800	
   801		new = (ret & ~mask) | set;
   802		if (new == ret)
   803			return 0;
   804	
   805		ret = air_mii_cl45_write(phydev, devad, regnum, new);
   806	
   807		return ret < 0 ? ret : 1;
   808	}
   809	
   810	static int en8811h_config_aneg(struct phy_device *phydev)
   811	{
   812		int err, val;
   813		bool changed = false;
   814	
   815		val = 0;
   816	
   817		if (linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
   818				phydev->advertising))
   819			val |= MDIO_AN_10GBT_CTRL_ADV2_5G;
   820		err =  en8811h_phy_modify_mmd_changed(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL,
   821				       MDIO_AN_10GBT_CTRL_ADV2_5G, val);
   822		if (err < 0)
   823			return err;
   824		if (err > 0)
   825			changed = true;
   826	
   827		return __genphy_config_aneg(phydev, changed);
   828	}
   829	
   830	static int en8811h_read_status(struct phy_device *phydev)
   831	{
   832		int ret = 0;
   833		int val;
   834		u32 pbus_value = 0;
   835		struct device *dev = &phydev->mdio.dev;
   836	
   837		dev_dbg(dev, "EEEEE: read status !\n");
   838	
   839		ret = genphy_read_status(phydev);
   840		if (ret) {
   841			dev_err(dev, "ret %d!\n", ret);
   842			return ret;
   843		}
   844	
   845		if (!phydev->link) return 0;
   846	
   847		val = air_mii_cl45_read(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL);
   848		if (val < 0)
   849			return val;
   850		dev_dbg(dev, "EEEEE: MDIO_AN_10GBT_CTRL = %04x\n", val);
   851	
   852		val = air_mii_cl45_read(phydev, MDIO_MMD_AN, MDIO_AN_LPA);
   853		if (val < 0)
   854			return val;
   855		dev_dbg(dev, "EEEEE: MDIO_AN_LPA = %04x\n", val);
   856	
   857		val = air_mii_cl45_read(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT);
   858		if (val < 0)
   859			return val;
   860		dev_dbg(dev, "EEEEE: MDIO_AN_10GBT_STAT = %04x\n", val);
   861		/* BUG in PHY: MDIO_AN_10GBT_STAT_LP2_5G does not get set */
   862		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
   863				 phydev->lp_advertising,
   864				 val & MDIO_AN_10GBT_STAT_LP2_5G);
   865	
   866		pbus_value = air_buckpbus_reg_read(phydev, RG_SPEED_EEEEE);
   867		switch (pbus_value & RG_SPEED_EEEEE_SPEED_MASK) {
   868		case RG_SPEED_EEEEE_SPEED_2500:
   869			phydev->speed = SPEED_2500;
   870			phydev->duplex = DUPLEX_FULL;
   871			/* Assume lp advertised it, dirty patch for bug */
   872			linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
   873					phydev->lp_advertising);
   874			break;
   875		case RG_SPEED_EEEEE_SPEED_1000:
   876			phydev->speed = SPEED_1000;
   877			phydev->duplex = DUPLEX_FULL;
   878			break;
   879		case RG_SPEED_EEEEE_SPEED_100:
   880			phydev->speed = SPEED_100;
   881			phydev->duplex = DUPLEX_FULL;
   882			break;
   883		}
   884	
   885		return 0;
   886	}
   887	
   888	/*static int airoha_ack_interrupt(struct phy_device *phydev)
   889	{
   890		int reg;
   891	
   892		reg = phy_read(phydev, XWAY_MDIO_ISTAT);
   893		return (reg < 0) ? reg : 0;
   894	}*/
   895	
   896	static int airoha_config_intr(struct phy_device *phydev)
   897	{
   898		u16 mask = 0;
   899		int err;
   900	
   901		if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
   902			/*err = airoha_ack_interrupt(phydev);
   903			if (err)
   904				return err;
   905	
   906			mask = XWAY_MDIO_INIT_MASK;
   907			err = phy_write(phydev, XWAY_MDIO_IMASK, mask);*/
   908		} else {
   909			/*err = phy_write(phydev, XWAY_MDIO_IMASK, mask);
   910			if (err)
   911				return err;
   912	
   913			err = airoha_ack_interrupt(phydev);*/
   914		}
   915	
 > 916		return err;
   917	}
   918	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
