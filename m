Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7A32A3D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782796895; cv=none; b=DokzISfugGrTrbOlZByMmF7ufRHDxy+/v87yrBNwMeY4j/WZfcMmXOpgp1fnRlVI+mKGpfm979ifVPOPKzUFBUJJ7ZuwpNmO5DBGIXA2ekLtNpsFGaE8Z/0MPLyhg94NcTJjAvUwZK7nhz/MYqQof/N2N0KExRV0pq7sjSZVt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782796895; c=relaxed/simple;
	bh=miZ3nQRgTiNEXo3JVslrpmaSuMlsNxO5r7RJHYJj3TE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M6djTUbSxoU+3bBqAF0o5PX6HV9koll3UypCMuFJt6gFMQ/WoWVJQDBxcgorAwWcsgjZDJp9j/aDDYn93WQMQYmmsWC6XUbZCuatrNoaMTMCNZpUlBDVq/Pm90CPLqYejU0sR+LpfleFsGOsdbzpYabxB3xMH4w6FQk6lAg9m5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/PseF/J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/PseF/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782796893; x=1814332893;
  h=date:from:to:cc:subject:message-id;
  bh=miZ3nQRgTiNEXo3JVslrpmaSuMlsNxO5r7RJHYJj3TE=;
  b=L/PseF/J1qIZQOEcEoVH7SPl8OdRTddAaH9oXhZCUe73bY+HhHjcxPbx
   Y2+uDV4zzj3Y8Pyr5OQdoDTfKQYGj1vKK1pGEVaqAARrIG2WJze9pWhU8
   JAw4M8wpn4c1MI2GO1EOMxEqU39Mjaw2/wJJkiYxROjt+B87Gb9d3r3Ug
   k4/uw+Kf6rcYtmKa517hG1et5hE4MRwcvCj0VjLFg8mTcXOOBCAu0F7OA
   Y1F5dbE4JyRc4BhukQOcKGRDeCtpDMkK/aESC1KvX11dy1U06VbzknwQu
   6K7BGbzy2fPgco67niD8OmOXYR/dsV40YrTBweML7bWI4ZeUUqyjSSrtC
   w==;
X-CSE-ConnectionGUID: kTAbHM9USOqmWddOsbEtew==
X-CSE-MsgGUID: W412X/05RoWRQZEuBOj2RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83558419"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83558419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 22:21:33 -0700
X-CSE-ConnectionGUID: 5Ykh9MxiS8GKStpX4GSW/Q==
X-CSE-MsgGUID: q2ljxhnCQfyrkmOpCJO7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="276425866"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jun 2026 22:21:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQuW-00000000825-1hHq;
	Tue, 30 Jun 2026 05:21:28 +0000
Date: Tue, 30 Jun 2026 13:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 106/160]
 drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:77:44: error: 'struct
 mxl862xx_pcs' has no member named 'port'
Message-ID: <202606301358.wz9Sb4I8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: dc9f8ea510e151bc58891737d44ebb81775ec086 [106/160] DO NOT SUBMIT: net: dsa: mxl862xx: legacy SFP API fallback for old firmware
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606301358.wz9Sb4I8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301358.wz9Sb4I8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301358.wz9Sb4I8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:16:
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2409:6: error: redeclaration of 'enum mxl862xx_port_type'
    2409 | enum mxl862xx_port_type {
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1461:6: note: originally defined here
    1461 | enum mxl862xx_port_type {
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2410:9: error: redeclaration of enumerator 'MXL862XX_LOGICAL_PORT'
    2410 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1462:9: note: previous definition of 'MXL862XX_LOGICAL_PORT' with type 'enum mxl862xx_port_type'
    1462 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2411:9: error: redeclaration of enumerator 'MXL862XX_PHYSICAL_PORT'
    2411 |         MXL862XX_PHYSICAL_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1463:9: note: previous definition of 'MXL862XX_PHYSICAL_PORT' with type 'enum mxl862xx_port_type'
    1463 |         MXL862XX_PHYSICAL_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2412:9: error: redeclaration of enumerator 'MXL862XX_CTP_PORT'
    2412 |         MXL862XX_CTP_PORT,
         |         ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1464:9: note: previous definition of 'MXL862XX_CTP_PORT' with type 'enum mxl862xx_port_type'
    1464 |         MXL862XX_CTP_PORT,
         |         ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2413:9: error: redeclaration of enumerator 'MXL862XX_BRIDGE_PORT'
    2413 |         MXL862XX_BRIDGE_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1465:9: note: previous definition of 'MXL862XX_BRIDGE_PORT' with type 'enum mxl862xx_port_type'
    1465 |         MXL862XX_BRIDGE_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c: In function 'mxl862xx_legacy_pcs_config':
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:77:44: error: 'struct mxl862xx_pcs' has no member named 'port'
      77 |         int port = pcs_to_mxl862xx_pcs(pcs)->port;
         |                                            ^~
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c: In function 'mxl862xx_legacy_pcs_get_state':
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:121:44: error: 'struct mxl862xx_pcs' has no member named 'port'
     121 |         int port = pcs_to_mxl862xx_pcs(pcs)->port;
         |                                            ^~
   In file included from drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:18:
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:130:39: error: 'MXL862XX_COMMON_PORTLINKCFGGET' undeclared (first use in this function); did you mean 'MXL862XX_COMMON_CFGGET'?
     130 |         ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTLINKCFGGET,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-host.h:16:32: note: in definition of macro 'MXL862XX_API_READ'
      16 |         mxl862xx_api_wrap(dev, cmd, &(data), sizeof((data)), true, false)
         |                                ^~~
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:130:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/dsa/mxl862xx/mxl862xx-host.h:16:32: note: in definition of macro 'MXL862XX_API_READ'
      16 |         mxl862xx_api_wrap(dev, cmd, &(data), sizeof((data)), true, false)
         |                                ^~~
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:135:39: error: 'MXL862XX_COMMON_PORTCFGGET' undeclared (first use in this function); did you mean 'MXL862XX_COMMON_CFGGET'?
     135 |         ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTCFGGET, port_cfg);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-host.h:16:32: note: in definition of macro 'MXL862XX_API_READ'
      16 |         mxl862xx_api_wrap(dev, cmd, &(data), sizeof((data)), true, false)
         |                                ^~~


vim +77 drivers/net/dsa/mxl862xx/mxl862xx-phylink.c

    68	
    69	/* Legacy SFP-based PCS implementation for firmware < 1.0.80 */
    70	static int mxl862xx_legacy_pcs_config(struct phylink_pcs *pcs,
    71					      unsigned int neg_mode,
    72					      phy_interface_t interface,
    73					      const unsigned long *advertising,
    74					      bool permit_pause_to_mac)
    75	{
    76		struct mxl862xx_priv *priv = pcs_to_mxl862xx_pcs(pcs)->priv;
  > 77		int port = pcs_to_mxl862xx_pcs(pcs)->port;
    78		struct mxl862xx_sys_sfp_cfg ser_intf = {
    79			.option = 0,
    80			.mode = 1,
    81		};
    82	
    83		if (port != 9 && port != 13)
    84			return 0;
    85	
    86		if (port == 9)
    87			ser_intf.port_id = 0;
    88		else
    89			ser_intf.port_id = 1;
    90	
    91		switch (interface) {
    92		case PHY_INTERFACE_MODE_SGMII:
    93			ser_intf.speed = 8;
    94			break;
    95		case PHY_INTERFACE_MODE_1000BASEX:
    96			ser_intf.speed = (neg_mode & PHYLINK_PCS_NEG_INBAND) ? 1 : 7;
    97			break;
    98		case PHY_INTERFACE_MODE_2500BASEX:
    99			ser_intf.speed = 4;
   100			break;
   101		case PHY_INTERFACE_MODE_10GBASER:
   102			ser_intf.speed = 2;
   103			break;
   104		case PHY_INTERFACE_MODE_USXGMII:
   105			ser_intf.speed = 3;
   106			break;
   107		default:
   108			dev_err(priv->ds->dev, "unsupported interface: %s\n",
   109				phy_modes(interface));
   110			return -EINVAL;
   111		}
   112	
   113		return MXL862XX_API_WRITE(priv, SYS_MISC_SFP_SET, ser_intf);
   114	}
   115	
   116	static void mxl862xx_legacy_pcs_get_state(struct phylink_pcs *pcs,
   117						  unsigned int neg_mode,
   118						  struct phylink_link_state *state)
   119	{
   120		struct mxl862xx_priv *priv = pcs_to_mxl862xx_pcs(pcs)->priv;
   121		int port = pcs_to_mxl862xx_pcs(pcs)->port;
   122		struct mxl862xx_port_link_cfg port_link_cfg = {
   123			.port_id = port,
   124		};
   125		struct mxl862xx_port_cfg port_cfg = {
   126			.port_id = port,
   127		};
   128		int ret;
   129	
 > 130		ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTLINKCFGGET,
   131					port_link_cfg);
   132		if (ret)
   133			return;
   134	
 > 135		ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTCFGGET, port_cfg);
   136		if (ret)
   137			return;
   138	
   139		state->link = (port_link_cfg.link == MXL862XX_PORT_LINK_UP);
   140		state->an_complete = state->link;
   141	
   142		switch (port_link_cfg.speed) {
   143		case MXL862XX_PORT_SPEED_10:
   144			state->speed = SPEED_10;
   145			break;
   146		case MXL862XX_PORT_SPEED_100:
   147			state->speed = SPEED_100;
   148			break;
   149		case MXL862XX_PORT_SPEED_1000:
   150			state->speed = SPEED_1000;
   151			break;
   152		case MXL862XX_PORT_SPEED_2500:
   153			state->speed = SPEED_2500;
   154			break;
   155		case MXL862XX_PORT_SPEED_5000:
   156			state->speed = SPEED_5000;
   157			break;
   158		case MXL862XX_PORT_SPEED_10000:
   159			state->speed = SPEED_10000;
   160			break;
   161		default:
   162			state->speed = SPEED_UNKNOWN;
   163			break;
   164		}
   165	
   166		switch (port_link_cfg.duplex) {
   167		case MXL862XX_DUPLEX_HALF:
   168			state->duplex = DUPLEX_HALF;
   169			break;
   170		case MXL862XX_DUPLEX_FULL:
   171			state->duplex = DUPLEX_FULL;
   172			break;
   173		default:
   174			state->duplex = DUPLEX_UNKNOWN;
   175			break;
   176		}
   177	
   178		state->pause &= ~(MLO_PAUSE_RX | MLO_PAUSE_TX);
   179		switch (port_cfg.flow_ctrl) {
   180		case MXL862XX_FLOW_RXTX:
   181			state->pause |= MLO_PAUSE_TXRX_MASK;
   182			break;
   183		case MXL862XX_FLOW_TX:
   184			state->pause |= MLO_PAUSE_TX;
   185			break;
   186		case MXL862XX_FLOW_RX:
   187			state->pause |= MLO_PAUSE_RX;
   188			break;
   189		case MXL862XX_FLOW_OFF:
   190		default:
   191			break;
   192		}
   193	}
   194	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
