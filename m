Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23EA179A7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 02:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728095756; cv=none; b=QA6P3Zmb9fWjNVgg+lIB096r6vHgiR1Fe9pynndgnRShyhlrbThTgxOAfXvbWe1Is9zkCIb0inJ/KGYUcYWmfsR3x4qP7GhncxaKk+7/UHSyynu0ntxyz6BszDhT50Ga8mvAnPKONu2PxwCNWeCFX869HecjoJE4RC53/8ndDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728095756; c=relaxed/simple;
	bh=lDJksU+cJSylNW9zFQG38bO5rMGJj9ImtXRS+LzCzK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/P6madBAJ/2yKGRRSCldnoaIgdFWeWJfd8TlSVpnxqP5gxHoSp6NK3TR79aNXE4/9ezjhzCgcwidO9u1uVKfn5fp9M8V+JJspEWUtDxitTOho09EF7UYqG2LhglK+fw+VHCCoR+XDGambZvEfsew4dKC1j76tS4Vj4gxRhFwXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwnTrUaW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwnTrUaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728095754; x=1759631754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDJksU+cJSylNW9zFQG38bO5rMGJj9ImtXRS+LzCzK8=;
  b=bwnTrUaWeN+oP0VrT38f6lWiJyd2Q78NBHh0VEHLjdySqHzJZKAtT/U9
   rAbBLt/6t7xBoJRYWGJ8ZOtxGCjVLwmtnp5fIUSaVtAlqRymtRKyFgD3r
   aWUdXVpgEM/LEWaqL7cbfuvBS7myAMImDL0FDx8X+x5OaCn5bY//UByi0
   HonaGdaO/crm251SuM0K6H01PbTT27eMamLvMZvCCEIi3WFhfMvRLLUMi
   Qz5EpgEs8Q6WVbJKNRU4SCBpl24f5JekIyLYIhF3L9wlGIUvMP0hLWnAj
   4dMusjGN82ERS4IDJ/QmvAUuJd0V0fq8FhxawERKlem+L7NIVBlkG01E4
   g==;
X-CSE-ConnectionGUID: RGqqd6DkQQWrz7t50MRotQ==
X-CSE-MsgGUID: VNp+P7zCREWiksk0dSlL/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="49856021"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="49856021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 19:35:53 -0700
X-CSE-ConnectionGUID: lzeerL8zSP+WB94tNJIJhA==
X-CSE-MsgGUID: 53Ll+NfcSTGO6nRTonfvvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="105733643"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2024 19:35:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swue5-0002TK-1J;
	Sat, 05 Oct 2024 02:35:49 +0000
Date: Sat, 5 Oct 2024 10:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>
Subject: [morimoto:renesas-bsp/v6.1.111-2024-09-24-x5 865/880]
 drivers/net/phy/marvell-88q2xxx.c:36:8: error: use of undeclared identifier
 'MDIO_PCS_1000BT1_CTRL'
Message-ID: <202410051051.BNlX2L7z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.111-2024-09-24-x5
head:   f3462b18b275139c8764a555ae6a4cef34532138
commit: 16a6af0495252539acef07ecc4a9a488738a4b7c [865/880] net: phy: marvell-88q2xxx: add driver for the Marvell 88Q2110 PHY
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241005/202410051051.BNlX2L7z-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051051.BNlX2L7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051051.BNlX2L7z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/marvell-88q2xxx.c:36:8: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL'
      36 |                             MDIO_PCS_1000BT1_CTRL, MDIO_PCS_1000BT1_CTRL_RESET);
         |                             ^
>> drivers/net/phy/marvell-88q2xxx.c:36:31: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL_RESET'
      36 |                             MDIO_PCS_1000BT1_CTRL, MDIO_PCS_1000BT1_CTRL_RESET);
         |                                                    ^
   drivers/net/phy/marvell-88q2xxx.c:41:7: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL'
      41 |                                          MDIO_PCS_1000BT1_CTRL, val,
         |                                          ^
   drivers/net/phy/marvell-88q2xxx.c:42:15: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL_RESET'
      42 |                                          !(val & MDIO_PCS_1000BT1_CTRL_RESET),
         |                                                  ^
   drivers/net/phy/marvell-88q2xxx.c:41:7: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL'
      41 |                                          MDIO_PCS_1000BT1_CTRL, val,
         |                                          ^
   drivers/net/phy/marvell-88q2xxx.c:42:15: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL_RESET'
      42 |                                          !(val & MDIO_PCS_1000BT1_CTRL_RESET),
         |                                                  ^
>> drivers/net/phy/marvell-88q2xxx.c:40:9: error: initializing 'int' with an expression of incompatible type 'void'
      40 |         return phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PCS,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                                          MDIO_PCS_1000BT1_CTRL, val,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                                          !(val & MDIO_PCS_1000BT1_CTRL_RESET),
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                                          50000, 600000, true);
         |                                          ~~~~~~~~~~~~~~~~~~~~
   include/linux/phy.h:1146:6: note: expanded from macro 'phy_read_mmd_poll_timeout'
    1146 |         int __ret = read_poll_timeout(phy_read_mmd, val, (cond) || val < 0, \
         |             ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1147 |                                   sleep_us, timeout_us, sleep_before_read, \
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1148 |                                   phydev, devaddr, regnum); \
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/marvell-88q2xxx.c:66:45: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT'
      66 |                         ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_STAT);
         |                                                                  ^
>> drivers/net/phy/marvell-88q2xxx.c:69:19: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT_LINK'
      69 |                         else if (ret & MDIO_PCS_1000BT1_STAT_LINK)
         |                                        ^
   drivers/net/phy/marvell-88q2xxx.c:74:45: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT'
      74 |                         ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_STAT);
         |                                                                  ^
   drivers/net/phy/marvell-88q2xxx.c:77:19: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT_LINK'
      77 |                         else if (ret & MDIO_PCS_1000BT1_STAT_LINK)
         |                                        ^
>> drivers/net/phy/marvell-88q2xxx.c:160:8: error: call to undeclared function 'genphy_c45_pma_baset1_read_abilities'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     160 |         ret = genphy_c45_pma_baset1_read_abilities(phydev);
         |               ^
   drivers/net/phy/marvell-88q2xxx.c:160:8: note: did you mean 'genphy_c45_pma_read_abilities'?
   include/linux/phy.h:1664:5: note: 'genphy_c45_pma_read_abilities' declared here
    1664 | int genphy_c45_pma_read_abilities(struct phy_device *phydev);
         |     ^
   12 errors generated.


vim +/MDIO_PCS_1000BT1_CTRL +36 drivers/net/phy/marvell-88q2xxx.c

    29	
    30	static int mv88q2xxx_soft_reset(struct phy_device *phydev)
    31	{
    32		int ret;
    33		int val;
    34	
    35		ret = phy_write_mmd(phydev, MDIO_MMD_PCS,
  > 36				    MDIO_PCS_1000BT1_CTRL, MDIO_PCS_1000BT1_CTRL_RESET);
    37		if (ret < 0)
    38			return ret;
    39	
  > 40		return phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PCS,
    41						 MDIO_PCS_1000BT1_CTRL, val,
    42						 !(val & MDIO_PCS_1000BT1_CTRL_RESET),
    43						 50000, 600000, true);
    44	}
    45	
    46	static int mv88q2xxx_read_link_gbit(struct phy_device *phydev)
    47	{
    48		int ret;
    49		bool link = false;
    50	
    51		/* Read vendor specific Auto-Negotiation status register to get local
    52		 * and remote receiver status according to software initialization
    53		 * guide.
    54		 */
    55		ret = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_MMD_AN_MV_STAT);
    56		if (ret < 0) {
    57			return ret;
    58		} else if ((ret & MDIO_MMD_AN_MV_STAT_LOCAL_RX) &&
    59			   (ret & MDIO_MMD_AN_MV_STAT_REMOTE_RX)) {
    60			/* The link state is latched low so that momentary link
    61			 * drops can be detected. Do not double-read the status
    62			 * in polling mode to detect such short link drops except
    63			 * the link was already down.
    64			 */
    65			if (!phy_polling_mode(phydev) || !phydev->link) {
  > 66				ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_STAT);
    67				if (ret < 0)
    68					return ret;
  > 69				else if (ret & MDIO_PCS_1000BT1_STAT_LINK)
    70					link = true;
    71			}
    72	
    73			if (!link) {
    74				ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_STAT);
    75				if (ret < 0)
    76					return ret;
    77				else if (ret & MDIO_PCS_1000BT1_STAT_LINK)
    78					link = true;
    79			}
    80		}
    81	
    82		phydev->link = link;
    83	
    84		return 0;
    85	}
    86	
    87	static int mv88q2xxx_read_link_100m(struct phy_device *phydev)
    88	{
    89		int ret;
    90	
    91		/* The link state is latched low so that momentary link
    92		 * drops can be detected. Do not double-read the status
    93		 * in polling mode to detect such short link drops except
    94		 * the link was already down. In case we are not polling,
    95		 * we always read the realtime status.
    96		 */
    97		if (!phy_polling_mode(phydev) || !phydev->link) {
    98			ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_MMD_PCS_MV_100BT1_STAT1);
    99			if (ret < 0)
   100				return ret;
   101			else if (ret & MDIO_MMD_PCS_MV_100BT1_STAT1_LINK)
   102				goto out;
   103		}
   104	
   105		ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_MMD_PCS_MV_100BT1_STAT1);
   106		if (ret < 0)
   107			return ret;
   108	
   109	out:
   110		/* Check if we have link and if the remote and local receiver are ok */
   111		if ((ret & MDIO_MMD_PCS_MV_100BT1_STAT1_LINK) &&
   112		    (ret & MDIO_MMD_PCS_MV_100BT1_STAT1_LOCAL_RX) &&
   113		    (ret & MDIO_MMD_PCS_MV_100BT1_STAT1_REMOTE_RX))
   114			phydev->link = true;
   115		else
   116			phydev->link = false;
   117	
   118		return 0;
   119	}
   120	
   121	static int mv88q2xxx_read_link(struct phy_device *phydev)
   122	{
   123		int ret;
   124	
   125		/* The 88Q2XXX PHYs do not have the PMA/PMD status register available,
   126		 * therefore we need to read the link status from the vendor specific
   127		 * registers depending on the speed.
   128		 */
   129		if (phydev->speed == SPEED_1000)
   130			ret = mv88q2xxx_read_link_gbit(phydev);
   131		else
   132			ret = mv88q2xxx_read_link_100m(phydev);
   133	
   134		return ret;
   135	}
   136	
   137	static int mv88q2xxx_read_status(struct phy_device *phydev)
   138	{
   139		int ret;
   140	
   141		ret = mv88q2xxx_read_link(phydev);
   142		if (ret < 0)
   143			return ret;
   144	
   145		return genphy_c45_read_pma(phydev);
   146	}
   147	
   148	static int mv88q2xxx_get_features(struct phy_device *phydev)
   149	{
   150		int ret;
   151	
   152		ret = genphy_c45_pma_read_abilities(phydev);
   153		if (ret)
   154			return ret;
   155	
   156		/* We need to read the baset1 extended abilities manually because the
   157		 * PHY does not signalize it has the extended abilities register
   158		 * available.
   159		 */
 > 160		ret = genphy_c45_pma_baset1_read_abilities(phydev);
   161		if (ret)
   162			return ret;
   163	
   164		/* The PHY signalizes it supports autonegotiation. Unfortunately, so
   165		 * far it was not possible to get a link even when following the init
   166		 * sequence provided by Marvell. Disable it for now until a proper
   167		 * workaround is found or a new PHY revision is released.
   168		 */
   169		linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, phydev->supported);
   170	
   171		return 0;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
