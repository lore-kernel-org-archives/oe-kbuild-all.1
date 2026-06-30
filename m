Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD73A5E78
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808203; cv=none; b=h/sQaBrBFsf+w9n5u7/bclCmGoBEO7oahx4CHpQDGiI+V9+spqK0I5Bk/52atUsxFAVbJIeoPEnvvZkgYgth1LnYi9XoM3BEY+1GqVg6Zr6Is1wYruNMhxe+YrM+yOwevNxQjy9cTt4R2jMPqhZNgFLzfktJ79J+tju/HpZ1Ngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808203; c=relaxed/simple;
	bh=38TE0lwsWePJEXO/uy5CYFbNwN8MFF9iL8fMXOh0Qpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CVgVYvQiLZdIl2F/oD2ezKbuBFL8GZ2wmWqiGdrsR5Wo9f49i6lEeVeetnIiV6IH0INhkEzoYLt9gXQ30HAVhmmj0xZhOVFlpxKI54eOlPgxIZMGFz57uaA55SkRLk6FluNDcZUSyYSIAo6x23w3cDBzNLD3KZfV+mRYJCR+rIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4toIZ0p; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4toIZ0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782808201; x=1814344201;
  h=date:from:to:cc:subject:message-id;
  bh=38TE0lwsWePJEXO/uy5CYFbNwN8MFF9iL8fMXOh0Qpo=;
  b=J4toIZ0p3nzFnc3DQNxFzR7g30QfIpoHLNndPJ8UnDiP7XhyjhlfM1St
   c78LDkFPlNAP8lTK4egIXFGUyJ8kK19HhjM5O2NsxMxe55ADwhOc3VZ+D
   wjFDLHRvWfSmnW6Q68wc1pJUZGXCoBzivE4Es/6omiZC1tbTDWjN8aRCa
   lNdy0daB0Pxo6cc0oG9qf1pQBwZmO3wizhTmnjNiaQTow69M7w2IiyYzp
   KegaV9Uf9J06EUcz31Dll6bJ2DZQal91unN3TDadcLQPhZneus4aLtRgU
   DXnEg481zTfv215O7krbRr7BVRuh96Jd7y3sQjeTgUTNYzT4SMAFWwZHD
   g==;
X-CSE-ConnectionGUID: Q6pLNxUuTDatsi/dvQ3cjw==
X-CSE-MsgGUID: I+o331zLRSOlSxXG6/2xyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106307945"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="106307945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:30:01 -0700
X-CSE-ConnectionGUID: ggPLa+0nREqWkjdBf9vB1w==
X-CSE-MsgGUID: bgeg3NoZRHaF5Z4SadumMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="282263108"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jun 2026 01:30:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weTqN-00000000891-3Ipk;
	Tue, 30 Jun 2026 08:29:27 +0000
Date: Tue, 30 Jun 2026 16:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 106/160]
 drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:77:39: error: no member named
 'port' in 'struct mxl862xx_pcs'
Message-ID: <202606301622.3NTCCddV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: dc9f8ea510e151bc58891737d44ebb81775ec086 [106/160] DO NOT SUBMIT: net: dsa: mxl862xx: legacy SFP API fallback for old firmware
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606301622.3NTCCddV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301622.3NTCCddV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301622.3NTCCddV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:16:
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2409:6: error: redefinition of 'mxl862xx_port_type'
    2409 | enum mxl862xx_port_type {
         |      ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1461:6: note: previous definition is here
    1461 | enum mxl862xx_port_type {
         |      ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2410:2: error: redefinition of enumerator 'MXL862XX_LOGICAL_PORT'
    2410 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1462:2: note: previous definition is here
    1462 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2411:2: error: redefinition of enumerator 'MXL862XX_PHYSICAL_PORT'
    2411 |         MXL862XX_PHYSICAL_PORT,
         |         ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1463:2: note: previous definition is here
    1463 |         MXL862XX_PHYSICAL_PORT,
         |         ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2412:2: error: redefinition of enumerator 'MXL862XX_CTP_PORT'
    2412 |         MXL862XX_CTP_PORT,
         |         ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1464:2: note: previous definition is here
    1464 |         MXL862XX_CTP_PORT,
         |         ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2413:2: error: redefinition of enumerator 'MXL862XX_BRIDGE_PORT'
    2413 |         MXL862XX_BRIDGE_PORT,
         |         ^
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1465:2: note: previous definition is here
    1465 |         MXL862XX_BRIDGE_PORT,
         |         ^
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:77:39: error: no member named 'port' in 'struct mxl862xx_pcs'
      77 |         int port = pcs_to_mxl862xx_pcs(pcs)->port;
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:121:39: error: no member named 'port' in 'struct mxl862xx_pcs'
     121 |         int port = pcs_to_mxl862xx_pcs(pcs)->port;
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~  ^
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:130:32: error: use of undeclared identifier 'MXL862XX_COMMON_PORTLINKCFGGET'
     130 |         ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTLINKCFGGET,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:135:32: error: use of undeclared identifier 'MXL862XX_COMMON_PORTCFGGET'
     135 |         ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTCFGGET, port_cfg);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   9 errors generated.


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
