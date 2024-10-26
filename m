Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485DE217F48
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729939382; cv=none; b=c1PomO8ENlWe6eVxX8fLRyd3jd3Fu6Y4h7nWUA48O5mnyvcf47eqoJKDPoXl+uPidAzkx58okxzS9b+pNLnvGxngPKl8AwTcy3CO/GQwdWo4LYhaXe2S+mR4DWlV1ISZMco2wuyyuUu9CAMTcveVu4gNT2SfghYDJRc7WQpMSA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729939382; c=relaxed/simple;
	bh=UZAsPXkh/HVa23+HTRlptTELiDoQeIwL1llkMeLgorE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUNSCZfJvvpkUYZw+sNbnSHbI+aT5qBZViWawR4qYa9bRRlIhiFWAzhx5DOD7d9SjSSVcpOZvqjdRLFpEFvSeNT+WnR4Qe0qo3G/DPd0c9HJUw/FBzC58/mVNhF5hLS0E0YZGQI57/f9If1wYZ4fgxsH9bykesCY4MT3SYX2Jd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btuH9bQK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btuH9bQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729939379; x=1761475379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZAsPXkh/HVa23+HTRlptTELiDoQeIwL1llkMeLgorE=;
  b=btuH9bQKXlRj+nKpD48m3+xdEjvTSXRr63K99YrM1a3B14MH40RxW6k5
   oGnypMgFHpmJCOLnqLhm97zghssybm91SaySEKgT+aTRwwtkDygcfowa/
   YKGcJI73oeLfKRz4st2kxpiEWJsmn+V1FWrYemPeKFAn7iFar8KRHuVg2
   ohNeI+VYHIvHzTe8waijltahTo5aUQn1xSsRJFabjBo207oo6yNv/Y8hb
   b0JMiJJ12aGjWcv+vMmEFeeXpz4idIXeVexzHH3uFMQATtxuRzxC4UOcI
   2cIAZCnr3wzqFlXkeZbXp1ZngpniH9DLoP9VbKDw+w9tepO0DRGA27FLI
   Q==;
X-CSE-ConnectionGUID: bTtfKp/lTJKzxCULl5W5gA==
X-CSE-MsgGUID: dGmVleIgTEmCV7Pq5XfYVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29064883"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="29064883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:42:58 -0700
X-CSE-ConnectionGUID: HppFNPgXRiKAGg0Y5VvU+w==
X-CSE-MsgGUID: MmkwOSiFTzujasgml6aUCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81079533"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2024 03:42:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4eFz-000ZWq-0D;
	Sat, 26 Oct 2024 10:42:55 +0000
Date: Sat, 26 Oct 2024 18:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 30/68]
 drivers/net/phy/phylink.c:1139: warning: Function parameter or struct member
 'pl' not described in 'phylink_pcs_neg_mode'
Message-ID: <202410261807.KYjrQfJy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   e69a16d14d8d4acf315697413ca6d4b72938804a
commit: 94b835dbea00af284bc4e77880675c828f3d7f80 [30/68] net: phylink: add support for disabling in-band-status for base-x
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241026/202410261807.KYjrQfJy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261807.KYjrQfJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261807.KYjrQfJy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:1139: warning: Function parameter or struct member 'pl' not described in 'phylink_pcs_neg_mode'
>> drivers/net/phy/phylink.c:1139: warning: Excess function parameter 'mode' description in 'phylink_pcs_neg_mode'


vim +1139 drivers/net/phy/phylink.c

94b835dbea00af Eric Woudstra         2024-01-08  1116  
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1117) /**
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1118)  * phylink_pcs_neg_mode() - helper to determine PCS inband mode
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1119)  * @mode: one of %MLO_AN_FIXED, %MLO_AN_PHY, %MLO_AN_INBAND.
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1120)  * @interface: interface mode to be used
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1121)  * @advertising: adertisement ethtool link mode mask
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1122)  *
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1123)  * Determines the negotiation mode to be used by the PCS, and returns
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1124)  * one of:
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1125)  *
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1126)  * - %PHYLINK_PCS_NEG_NONE: interface mode does not support inband
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1127)  * - %PHYLINK_PCS_NEG_OUTBAND: an out of band mode (e.g. reading the PHY)
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1128)  *   will be used.
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1129)  * - %PHYLINK_PCS_NEG_INBAND_DISABLED: inband mode selected but autoneg
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1130)  *   disabled
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1131)  * - %PHYLINK_PCS_NEG_INBAND_ENABLED: inband mode selected and autoneg enabled
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1132)  *
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1133)  * Note: this is for cases where the PCS itself is involved in negotiation
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1134)  * (e.g. Clause 37, SGMII and similar) not Clause 73.
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1135)  */
94b835dbea00af Eric Woudstra         2024-01-08  1136  static void phylink_pcs_neg_mode(struct phylink *pl,
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1137) 				 phy_interface_t interface,
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1138) 				 const unsigned long *advertising)
5e5401d6612ef5 Russell King (Oracle  2024-01-04 @1139) {
94b835dbea00af Eric Woudstra         2024-01-08  1140  	if ((!!pl->phydev) && phylink_basex_no_inband(pl)) {
94b835dbea00af Eric Woudstra         2024-01-08  1141  		switch (interface) {
94b835dbea00af Eric Woudstra         2024-01-08  1142  		case PHY_INTERFACE_MODE_1000BASEX:
94b835dbea00af Eric Woudstra         2024-01-08  1143  		case PHY_INTERFACE_MODE_2500BASEX:
94b835dbea00af Eric Woudstra         2024-01-08  1144  			if (pl->cur_link_an_mode == MLO_AN_INBAND)
94b835dbea00af Eric Woudstra         2024-01-08  1145  				pl->cur_link_an_mode = MLO_AN_PHY;
94b835dbea00af Eric Woudstra         2024-01-08  1146  			break;
94b835dbea00af Eric Woudstra         2024-01-08  1147  		default:
94b835dbea00af Eric Woudstra         2024-01-08  1148  			/* restore mode if it was changed before */
94b835dbea00af Eric Woudstra         2024-01-08  1149  			if (pl->cur_link_an_mode == MLO_AN_PHY &&
94b835dbea00af Eric Woudstra         2024-01-08  1150  			    pl->cfg_link_an_mode == MLO_AN_INBAND)
94b835dbea00af Eric Woudstra         2024-01-08  1151  				pl->cur_link_an_mode = pl->cfg_link_an_mode;
94b835dbea00af Eric Woudstra         2024-01-08  1152  		}
94b835dbea00af Eric Woudstra         2024-01-08  1153  	}
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1154) 
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1155) 	switch (interface) {
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1156) 	case PHY_INTERFACE_MODE_SGMII:
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1157) 	case PHY_INTERFACE_MODE_QSGMII:
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1158) 	case PHY_INTERFACE_MODE_QUSGMII:
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1159) 	case PHY_INTERFACE_MODE_USXGMII:
777b8afb817915 Vladimir Oltean       2024-06-15  1160  	case PHY_INTERFACE_MODE_10G_QXGMII:
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1161) 		/* These protocols are designed for use with a PHY which
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1162) 		 * communicates its negotiation result back to the MAC via
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1163) 		 * inband communication. Note: there exist PHYs that run
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1164) 		 * with SGMII but do not send the inband data.
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1165) 		 */
94b835dbea00af Eric Woudstra         2024-01-08  1166  		if (!phylink_autoneg_inband(pl->cur_link_an_mode))
94b835dbea00af Eric Woudstra         2024-01-08  1167  			pl->pcs_neg_mode = PHYLINK_PCS_NEG_OUTBAND;
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1168) 		else
94b835dbea00af Eric Woudstra         2024-01-08  1169  			pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1170) 		break;
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1171) 
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1172) 	case PHY_INTERFACE_MODE_1000BASEX:
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1173) 	case PHY_INTERFACE_MODE_2500BASEX:
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1174) 		/* 1000base-X is designed for use media-side for Fibre
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1175) 		 * connections, and thus the Autoneg bit needs to be
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1176) 		 * taken into account. We also do this for 2500base-X
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1177) 		 * as well, but drivers may not support this, so may
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1178) 		 * need to override this.
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1179) 		 */
94b835dbea00af Eric Woudstra         2024-01-08  1180  		if (!phylink_autoneg_inband(pl->cur_link_an_mode)) {
94b835dbea00af Eric Woudstra         2024-01-08  1181  			pl->pcs_neg_mode = PHYLINK_PCS_NEG_OUTBAND;
94b835dbea00af Eric Woudstra         2024-01-08  1182  		} else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
94b835dbea00af Eric Woudstra         2024-01-08  1183  					   advertising) &&
94b835dbea00af Eric Woudstra         2024-01-08  1184  				!phylink_basex_no_inband(pl)) {
94b835dbea00af Eric Woudstra         2024-01-08  1185  			pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
94b835dbea00af Eric Woudstra         2024-01-08  1186  		} else {
94b835dbea00af Eric Woudstra         2024-01-08  1187  			pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
94b835dbea00af Eric Woudstra         2024-01-08  1188  			linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
94b835dbea00af Eric Woudstra         2024-01-08  1189  					   pl->link_config.advertising);
94b835dbea00af Eric Woudstra         2024-01-08  1190  			pl->link_config.speed = (interface ==
94b835dbea00af Eric Woudstra         2024-01-08  1191  						 PHY_INTERFACE_MODE_1000BASEX) ?
94b835dbea00af Eric Woudstra         2024-01-08  1192  						 SPEED_1000 : SPEED_2500;
94b835dbea00af Eric Woudstra         2024-01-08  1193  			pl->link_config.duplex = DUPLEX_FULL;
94b835dbea00af Eric Woudstra         2024-01-08  1194  			pl->link_config.pause = MLO_PAUSE_NONE; /* ????? */
94b835dbea00af Eric Woudstra         2024-01-08  1195  		}
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1196) 		break;
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1197) 
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1198) 	default:
94b835dbea00af Eric Woudstra         2024-01-08  1199  		pl->pcs_neg_mode = PHYLINK_PCS_NEG_NONE;
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1200) 		break;
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1201) 	}
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1202) 
94b835dbea00af Eric Woudstra         2024-01-08  1203  	return;
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1204) }
5e5401d6612ef5 Russell King (Oracle  2024-01-04  1205) 

:::::: The code at line 1139 was first introduced by commit
:::::: 5e5401d6612ef599ad45785b941eebda7effc90f net: phylink: move phylink_pcs_neg_mode() into phylink.c

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
