Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8C402422
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513859; cv=none; b=bH7sjSOQiMPc9QSxcKgC+S7xosGPdTBMmLnc5m0huY/X3HNz4jrQ7u0n3VyCGvEMs0T61onFS/52GaTj5/qvfIuEV7Y1V5Y9t7A/GNk2BGkO3wmKnEIcuQuTxbd9TFq46Lw5VaWthoswYJJMClF4pRosLH/i8Kh+/hU9AbbsUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513859; c=relaxed/simple;
	bh=opR0y2p5LkAvjRqZGzmpF6P3cm+YqsJyfG5siZTrO4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=thUTdz1Iy1WQvttctsH7nyQDNwqnR/NanGDhnvu6rLDuEqwIGJaB4y91cJKrFXKZF/AQeuF6Lu1PQCTmgiLDJJiFOJRITE92C9SVgy4YmoawH5FK+bYL4nAxsoCosgldY1B7U9JDYuMTGCCvUaS13nsFdpVo4Sh9c8iqVbmWkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALBFv4v0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALBFv4v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778513859; x=1810049859;
  h=date:from:to:cc:subject:message-id;
  bh=opR0y2p5LkAvjRqZGzmpF6P3cm+YqsJyfG5siZTrO4c=;
  b=ALBFv4v0e2feXo9r8q0/N6SEP6H7uo5Dt92/+UjW3KldyBFzgROTvpmZ
   RjUPqhuPdgKjM6wkDH2hBTuW9poXqmsfNbfA2mjv4FuDmJ992Y4kRSK2L
   ckD2+QfMNQ5aFlaoawUo2OprYp1w89FiSeGix/ULTQTNwGYin+nWElfQX
   UFma7Zqg38UT+B0yZwfi6L192IGHmkw/KlTXROuTkobPLYLIEkPFJauaj
   AhrxGgg4tzS20Wvpn8jY4jRl5HDoyPCr7T/QFb1WYHB87SKlsh1Ajvk2U
   +hq/PGMJw0fA7s3D87h3gbahDAR3KUZIW6BmzhGWQqUaJJmObGoxmYnNM
   g==;
X-CSE-ConnectionGUID: +1v4QPnGTkqqD8I6VVrocw==
X-CSE-MsgGUID: gUah0KtEQ4C/C8hjMviQLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79351093"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79351093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:37:36 -0700
X-CSE-ConnectionGUID: 0o/keya9QF6wFE80lv6HZg==
X-CSE-MsgGUID: XmKfv9CnRc6uYKb8boouGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236632504"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2026 08:37:33 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMShH-000000000lx-0wEB;
	Mon, 11 May 2026 15:37:31 +0000
Date: Mon, 11 May 2026 23:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 4174/4394]
 drivers/gpu/drm/bridge/microchip-lvds.c:153:62: error: passing argument 1 of
 'drm_atomic_get_new_connector_for_encoder' from incompatible pointer type
Message-ID: <202605112318.FhjvYQZH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: f96538285cfdbb3acf5e3356e0bb88c38815790b [4174/4394] Merge tag 'drm-misc-next-2026-05-07' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260511/202605112318.FhjvYQZH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112318.FhjvYQZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112318.FhjvYQZH-lkp@intel.com/

Note: the linux-next/master HEAD e98d21c170b01ddef366f023bbfcf6b31509fa83 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/microchip-lvds.c:132:44: warning: 'struct drm_atomic_state' declared inside parameter list will not be visible outside of this definition or declaration
     132 |                                     struct drm_atomic_state *state)
         |                                            ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/microchip-lvds.c: In function 'mchp_lvds_atomic_enable':
>> drivers/gpu/drm/bridge/microchip-lvds.c:153:62: error: passing argument 1 of 'drm_atomic_get_new_connector_for_encoder' from incompatible pointer type [-Wincompatible-pointer-types]
     153 |         connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
         |                                                              ^~~~~
         |                                                              |
         |                                                              struct drm_atomic_state *
   In file included from include/drm/drm_bridge.h:31,
                    from drivers/gpu/drm/bridge/microchip-lvds.c:25:
   include/drm/drm_atomic.h:758:74: note: expected 'const struct drm_atomic_commit *' but argument is of type 'struct drm_atomic_state *'
     758 | drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_commit *state,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/gpu/drm/bridge/microchip-lvds.c: At top level:
   drivers/gpu/drm/bridge/microchip-lvds.c:161:45: warning: 'struct drm_atomic_state' declared inside parameter list will not be visible outside of this definition or declaration
     161 |                                      struct drm_atomic_state *state)
         |                                             ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/microchip-lvds.c:171:26: error: initialization of 'void (*)(struct drm_bridge *, struct drm_atomic_commit *)' from incompatible pointer type 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' [-Wincompatible-pointer-types]
     171 |         .atomic_enable = mchp_lvds_atomic_enable,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/microchip-lvds.c:171:26: note: (near initialization for 'mchp_lvds_bridge_funcs.atomic_enable')
   drivers/gpu/drm/bridge/microchip-lvds.c:131:13: note: 'mchp_lvds_atomic_enable' declared here
     131 | static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/microchip-lvds.c:172:27: error: initialization of 'void (*)(struct drm_bridge *, struct drm_atomic_commit *)' from incompatible pointer type 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' [-Wincompatible-pointer-types]
     172 |         .atomic_disable = mchp_lvds_atomic_disable,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/microchip-lvds.c:172:27: note: (near initialization for 'mchp_lvds_bridge_funcs.atomic_disable')
   drivers/gpu/drm/bridge/microchip-lvds.c:160:13: note: 'mchp_lvds_atomic_disable' declared here
     160 | static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_atomic_get_new_connector_for_encoder +153 drivers/gpu/drm/bridge/microchip-lvds.c

179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  130  
c4cbe5d9e87d220 Dharma Balasubiramani 2025-06-25  131  static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
c4cbe5d9e87d220 Dharma Balasubiramani 2025-06-25  132  				    struct drm_atomic_state *state)
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  133  {
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  134  	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  135  	struct drm_connector *connector;
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  136  	int ret;
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  137  
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  138  	ret = clk_prepare_enable(lvds->pclk);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  139  	if (ret < 0) {
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  140  		dev_err(lvds->dev, "failed to enable lvds pclk %d\n", ret);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  141  		return;
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  142  	}
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  143  
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  144  	ret = pm_runtime_get_sync(lvds->dev);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  145  	if (ret < 0) {
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  146  		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  147  		return;
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  148  	}
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  149  
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  150  	/* default to jeida-24 */
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  151  	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  152  
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25 @153  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  154  	if (connector && connector->display_info.num_bus_formats)
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  155  		bus_format = connector->display_info.bus_formats[0];
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  156  
57f68ed1f08cd10 Dharma Balasubiramani 2025-06-25  157  	lvds_serialiser_on(lvds, bus_format);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  158  }
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  159  
c4cbe5d9e87d220 Dharma Balasubiramani 2025-06-25  160  static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
c4cbe5d9e87d220 Dharma Balasubiramani 2025-06-25  161  				     struct drm_atomic_state *state)
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  162  {
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  163  	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  164  
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  165  	pm_runtime_put(lvds->dev);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  166  	clk_disable_unprepare(lvds->pclk);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  167  }
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  168  
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  169  static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  170  	.attach = mchp_lvds_attach,
c4cbe5d9e87d220 Dharma Balasubiramani 2025-06-25 @171  	.atomic_enable = mchp_lvds_atomic_enable,
c4cbe5d9e87d220 Dharma Balasubiramani 2025-06-25  172  	.atomic_disable = mchp_lvds_atomic_disable,
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  173  };
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  174  

:::::: The code at line 153 was first introduced by commit
:::::: 57f68ed1f08cd10f51a9091645fd5dfcc369a885 drm/bridge: microchip-lvds: fix bus format mismatch with VESA displays

:::::: TO: Dharma Balasubiramani <dharma.b@microchip.com>
:::::: CC: Manikandan Muralidharan <manikandan.m@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
