Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA410E5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338812; cv=none; b=OgOP37mJj/SAhD89P5q6136yfO7SVV08W5/t9OctijWVKLf9RRD+uvNtzy+MNpdfHJ05KgHEHeUe/bOPZlrONy66ijsLLaelCTUeM7fBxpJrKsb7zd3JC26/EMnI7RpxuSgIO20QdwfNq2EZZWd8054N4a+Z1ieuzFpYrbqmerA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338812; c=relaxed/simple;
	bh=g3f0gqfTF5F0UFTN8/Hfz0Ma6OgaNfORtz998lrgYMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUvjKBNEubxLTp51KTj9TObc56u7lsQGx7F8cZsUQNyYoLWXIhl8fEhGcaXTnFzH63ZHS30Ygw26W+TVDVJ5ONDzbr3XATI6bMW0XgVJ36T2pdYEygXBq2YGH1XLB5VkaQSZPQj1KPsSrLJ4sCs1RgYQIDXwXlvZlJzrmS66UGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcSJ/BcR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcSJ/BcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709338810; x=1740874810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g3f0gqfTF5F0UFTN8/Hfz0Ma6OgaNfORtz998lrgYMs=;
  b=UcSJ/BcR+Jym3SCVV6cH/j5Gzk7TJ++4XocqqG6UgrCjELGYv+Yx2rAo
   jU2dYtbvoOokSD9RYZgj9OtQhyR8ryn84Z+EgRgOHIplBXcqbrqT3HeSC
   1vx8sExQpJmkgDAX+cDJOaOSlTf+1ZV5FXxoLl9EIt0ItmKm1Zm7TdAIz
   uhn+cqVYrZF5oPQX8csr750MA4bspLrN3+xfeVLTucT12CD+xnxns03E8
   oEv8QAX77cdFyzpFn73GQJl2J/V9ykNDiCUGteNwVhyZNCuq+05uwRyNI
   /4oBwc0JHlWCzFg0QttJ6Gr0WvHvver9RkRwogAikJAF/dhBSwFQ6dl6K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7669438"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="7669438"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8587420"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2024 16:20:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgD6k-000EBw-1s;
	Sat, 02 Mar 2024 00:20:06 +0000
Date: Sat, 2 Mar 2024 08:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:net-queue 70/72] drivers/net/phy/phylink.c:1190:63: error:
 'state' undeclared; did you mean 'statx'?
Message-ID: <202403020856.iDm7F2Vf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git net-queue
head:   ccd059cded5d2b8ed8f784a837b02a578fa927ff
commit: c62df466ec00e3b18bc49d91acd19b8ceb3abb63 [70/72] net: phylink: add pcs_query_inband()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240302/202403020856.iDm7F2Vf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020856.iDm7F2Vf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020856.iDm7F2Vf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/phy/phylink.c: In function 'phylink_pcs_neg_mode':
>> drivers/net/phy/phylink.c:1190:63: error: 'state' undeclared (first use in this function); did you mean 'statx'?
    1190 |                 pcs_link_mode = phylink_pcs_query_inband(pcs, state->interface);
         |                                                               ^~~~~
         |                                                               statx
   drivers/net/phy/phylink.c:1190:63: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/phy/phylink.c:1192:41: error: too few arguments to function 'phy_query_inband'
    1192 |                         phy_link_mode = phy_query_inband(pl->phydev);
         |                                         ^~~~~~~~~~~~~~~~
   In file included from include/linux/of_mdio.h:12,
                    from drivers/net/phy/phylink.c:14:
   include/linux/phy.h:1785:14: note: declared here
    1785 | unsigned int phy_query_inband(struct phy_device *phydev,
         |              ^~~~~~~~~~~~~~~~
>> drivers/net/phy/phylink.c:1186:22: warning: variable 'phy_link_mode' set but not used [-Wunused-but-set-variable]
    1186 |         unsigned int phy_link_mode = 0;
         |                      ^~~~~~~~~~~~~
>> drivers/net/phy/phylink.c:1185:22: warning: variable 'pcs_link_mode' set but not used [-Wunused-but-set-variable]
    1185 |         unsigned int pcs_link_mode = 0;
         |                      ^~~~~~~~~~~~~


vim +1190 drivers/net/phy/phylink.c

  1157	
  1158	/**
  1159	 * phylink_pcs_neg_mode() - helper to determine PCS inband mode
  1160	 * @pl:
  1161	 * @pcs:
  1162	 * @mode: one of %MLO_AN_FIXED, %MLO_AN_PHY, %MLO_AN_INBAND.
  1163	 * @interface: interface mode to be used
  1164	 * @advertising: adertisement ethtool link mode mask
  1165	 *
  1166	 * Determines the negotiation mode to be used by the PCS, and returns
  1167	 * one of:
  1168	 *
  1169	 * - %PHYLINK_PCS_NEG_NONE: interface mode does not support inband
  1170	 * - %PHYLINK_PCS_NEG_OUTBAND: an out of band mode (e.g. reading the PHY)
  1171	 *   will be used.
  1172	 * - %PHYLINK_PCS_NEG_INBAND_DISABLED: inband mode selected but autoneg
  1173	 *   disabled
  1174	 * - %PHYLINK_PCS_NEG_INBAND_ENABLED: inband mode selected and autoneg enabled
  1175	 *
  1176	 * Note: this is for cases where the PCS itself is involved in negotiation
  1177	 * (e.g. Clause 37, SGMII and similar) not Clause 73.
  1178	 */
  1179	static unsigned int phylink_pcs_neg_mode(struct phylink *pl,
  1180						 struct phylink_pcs *pcs,
  1181						 unsigned int mode,
  1182						 phy_interface_t interface,
  1183						 const unsigned long *advertising)
  1184	{
> 1185		unsigned int pcs_link_mode = 0;
> 1186		unsigned int phy_link_mode = 0;
  1187		unsigned int neg_mode;
  1188	
  1189		if (phylink_autoneg_inband(mode)) {
> 1190			pcs_link_mode = phylink_pcs_query_inband(pcs, state->interface);
  1191			if (pl->phydev)
> 1192				phy_link_mode = phy_query_inband(pl->phydev);
  1193		}
  1194	
  1195		switch (interface) {
  1196		case PHY_INTERFACE_MODE_SGMII:
  1197		case PHY_INTERFACE_MODE_QSGMII:
  1198		case PHY_INTERFACE_MODE_QUSGMII:
  1199		case PHY_INTERFACE_MODE_USXGMII:
  1200			/* These protocols are designed for use with a PHY which
  1201			 * communicates its negotiation result back to the MAC via
  1202			 * inband communication. Note: there exist PHYs that run
  1203			 * with SGMII but do not send the inband data.
  1204			 */
  1205			if (!phylink_autoneg_inband(mode))
  1206				neg_mode = PHYLINK_PCS_NEG_OUTBAND;
  1207			else
  1208				neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
  1209			break;
  1210	
  1211		case PHY_INTERFACE_MODE_1000BASEX:
  1212		case PHY_INTERFACE_MODE_2500BASEX:
  1213			/* 1000base-X is designed for use media-side for Fibre
  1214			 * connections, and thus the Autoneg bit needs to be
  1215			 * taken into account. We also do this for 2500base-X
  1216			 * as well, but drivers may not support this, so may
  1217			 * need to override this.
  1218			 */
  1219			if (!phylink_autoneg_inband(mode))
  1220				neg_mode = PHYLINK_PCS_NEG_OUTBAND;
  1221			else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
  1222						   advertising))
  1223				neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
  1224			else
  1225				neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
  1226			break;
  1227	
  1228		default:
  1229			neg_mode = PHYLINK_PCS_NEG_NONE;
  1230			break;
  1231		}
  1232	
  1233		return neg_mode;
  1234	}
  1235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
