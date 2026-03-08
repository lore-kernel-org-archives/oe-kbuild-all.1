Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5901369996
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772967848; cv=none; b=jkp5I+6unhvZSeYAKyu5UvvoKAmJlRNxH2Skq+1uuFsTK/1kzvtknUe5S0oD8b2a9/bHmPSBERpmlWwSCH4cupUcE7a5h9MSpsupV/q8qFrRw11+sSiZZbY5LGv1IjNFnUe8wG15UyILoVz/0cAkHHrf/S/l03G270OIShA/7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772967848; c=relaxed/simple;
	bh=afCazJMa6BSdEDEMuhLOPtQ0kv0f5s4h3ERP9xAzd3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZLHIU+2cZ6BiCDl1A8g5P2BAIrnOdp/S5nyxEdfH/gzDHb+nwSfHpAQjak6Jfp3AmAltWRzZ8eVUI9127AoxBvP65WrqEIq412WPrhU8SGHuZa1kRFPBmFihBAKirEe0MDXXMLveXygfORzzS/XuQYY08LCwWWVEvR8IYrVCX1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOP2u55a; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOP2u55a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772967846; x=1804503846;
  h=date:from:to:cc:subject:message-id;
  bh=afCazJMa6BSdEDEMuhLOPtQ0kv0f5s4h3ERP9xAzd3w=;
  b=JOP2u55aaoj+cfsEUHA6U3xQhg7SonHjR/0PMo0zTaXgYXgTBZVpeBgc
   PF7Bhg931F050p1LvMsklE4keU/qPwNA+5xKWHWdIeyFsVZNtiFXXRlZj
   CYH2suYEcYRSQQD+xafIXqb01jxUD8ouMWIPTkKBWTRqS4NTFtU52n158
   lYTGHJ4EbJmzCBUh0k4LFsPdXNsVS5h9SuRhW1Q6zWMDoyM6VIsCzonlz
   M0RQOR2Ql5CKC055M+OV6SsLOzR62ECi+wuiRmGlCh6qX7YsKODto6O9F
   1WurKvA8qyVZGUTOdfNliNCRYnigd7Sm0BeEs0hy/cukgcdb9k6akLwDE
   g==;
X-CSE-ConnectionGUID: fhIGVIdNTpG+iTGm6iloBQ==
X-CSE-MsgGUID: Q2HHPLUKT+KyrJmFQBvvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="85102925"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="85102925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 04:04:05 -0700
X-CSE-ConnectionGUID: rbBJ3hi4TA6YiCGUDvtzWw==
X-CSE-MsgGUID: ZUzIi/E9T+SO7kxiH6X87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223938898"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Mar 2026 04:04:04 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzBvU-00000000335-3d8Q;
	Sun, 08 Mar 2026 11:04:00 +0000
Date: Sun, 08 Mar 2026 19:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 36/81]
 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:191:71: error:
 'DSA_TAG_PROTO_MXL862_8021Q' undeclared; did you mean
 'DSA_TAG_PROTO_MXL862_VALUE'?
Message-ID: <202603081843.uvG7klWg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   30092cdf41471e9043eb39db2ce267bf712da979
commit: 346a9caf3a3531e2084c3ba5346c85d56787f909 [36/81] net: dsa: add mxl downstream driver from 6.19-main
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603081843.uvG7klWg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081843.uvG7klWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081843.uvG7klWg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: In function 'mxl862xx_update_bridge_conf_port':
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:191:71: error: 'DSA_TAG_PROTO_MXL862_8021Q' undeclared (first use in this function); did you mean 'DSA_TAG_PROTO_MXL862_VALUE'?
     191 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                       DSA_TAG_PROTO_MXL862_VALUE
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:191:71: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: In function 'mxl862_parse_tag_proto':
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:371:29: error: 'DSA_TAG_PROTO_MXL862_8021Q' undeclared (first use in this function); did you mean 'DSA_TAG_PROTO_MXL862_VALUE'?
     371 |                 tag_proto = DSA_TAG_PROTO_MXL862_8021Q;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             DSA_TAG_PROTO_MXL862_VALUE
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: In function 'mxl862xx_port_vlan_add':
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2175:71: error: 'DSA_TAG_PROTO_MXL862_8021Q' undeclared (first use in this function); did you mean 'DSA_TAG_PROTO_MXL862_VALUE'?
    2175 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                       DSA_TAG_PROTO_MXL862_VALUE
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: In function 'mxl862xx_isolate_port':
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2543:71: error: 'DSA_TAG_PROTO_MXL862_8021Q' undeclared (first use in this function); did you mean 'DSA_TAG_PROTO_MXL862_VALUE'?
    2543 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                       DSA_TAG_PROTO_MXL862_VALUE
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: In function 'mxl862xx_deisolate_port':
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2593:71: error: 'DSA_TAG_PROTO_MXL862_8021Q' undeclared (first use in this function); did you mean 'DSA_TAG_PROTO_MXL862_VALUE'?
    2593 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                       DSA_TAG_PROTO_MXL862_VALUE
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: In function 'mxl862xx_set_vlan_filter_limits':
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2708:55: error: 'DSA_TAG_PROTO_MXL862_8021Q' undeclared (first use in this function); did you mean 'DSA_TAG_PROTO_MXL862_VALUE'?
    2708 |         if (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q) {
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                       DSA_TAG_PROTO_MXL862_VALUE
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: In function 'mxl862xx_port_bridge_join':
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2798:71: error: 'DSA_TAG_PROTO_MXL862_8021Q' undeclared (first use in this function); did you mean 'DSA_TAG_PROTO_MXL862_VALUE'?
    2798 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                       DSA_TAG_PROTO_MXL862_VALUE


vim +191 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c

   183	
   184	static int mxl862xx_update_bridge_conf_port(struct dsa_switch *ds, u8 port,
   185						    struct net_device *bridge, int action)
   186	{
   187		struct mxl862xx_priv *priv = ds->priv;
   188		u8 max_ports = priv->hw_info->max_ports;
   189		u8 cpu_port = priv->cpu_port;
   190		u8 i;
 > 191		bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
   192	
   193		/*struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
   194		 * struct mxl862xx_port_info *other_p;
   195		 *int other_port;
   196		 */
   197		int ret;
   198	
   199		/* Update local bridge port map */
   200		for (i = 0; i < max_ports; i++) {
   201			int bridge_id = priv->port_info[i].bridge_id;
   202	
   203			if (dsa_is_unused_port(ds, i))
   204				continue;
   205	
   206			/* CPU port is assigned to all bridges and cannot be modified  */
   207			if ((dsa_is_cpu_port(ds, i)))
   208				continue;
   209	
   210			/* Skip if bridge does not match, except the self port assignment  */
   211			if ((dsa_port_bridge_dev_get(dsa_to_port(ds, i)) != bridge) && (i != port))
   212				continue;
   213	
   214			/* Case for standalone bridges assigned only to single user and CPU ports.
   215			 * Used only for initial ports isolation */
   216			if ((bridge == NULL) && (i != port))
   217				continue;
   218	
   219			if (action)
   220				priv->bridge_portmap[bridge_id] |= BIT(DSA_MXL_PORT(port));
   221			else
   222				priv->bridge_portmap[bridge_id] &= ~BIT(DSA_MXL_PORT(port));
   223		}
   224	
   225		/* Update switch according to local bridge port map */
   226		/* Add this port to the port maps of other ports skiping it's own map */
   227		for (i = 0; i < max_ports; i++) {
   228			struct mxl862xx_bridge_port_config br_port_cfg = { };
   229			int bridge_id = priv->port_info[i].bridge_id;
   230	
   231			if (!(dsa_is_user_port(ds, i)))
   232				continue;
   233	
   234			/* Case for standalone bridges assigned only to single user and CPU ports.
   235			 * Used only for initial ports isolation
   236			 */
   237			if (!bridge && i != port)
   238				continue;
   239	
   240			/* Do not reconfigure any standalone bridge if this is bridge join scenario */
   241			if (bridge && !priv->port_info[i].bridge)
   242				continue;
   243	
   244			br_port_cfg.bridge_port_id = DSA_MXL_PORT(i);
   245			br_port_cfg.mask |=
   246				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
   247				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID;
   248	
   249			ret = MXL862XX_API_READ(priv, MXL862XX_BRIDGEPORT_CONFIGGET, br_port_cfg);
   250			if (ret) {
   251				dev_err(ds->dev, "failed to set bridge port configuration on port %d\n",
   252					port);
   253				return ret;
   254			}
   255	
   256			/* Skip port map update if for the existing bridge the port
   257			 * is not assigned there.
   258			 */
   259			if (i != port && (br_port_cfg.bridge_id != bridge_id ||
   260					  br_port_cfg.bridge_id == 0))
   261				continue;
   262	
   263			br_port_cfg.mask |=
   264				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
   265				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID |
   266				MXL862XX_BRIDGE_PORT_CONFIG_MASK_MC_SRC_MAC_LEARNING;
   267	
   268			/* Skip the port itself in it's own portmap */
   269			br_port_cfg.bridge_port_map[0] =
   270				priv->bridge_portmap[bridge_id] & ~(BIT(DSA_MXL_PORT(i)));
   271	
   272			if (action) {
   273				br_port_cfg.src_mac_learning_disable = !bridge;
   274				br_port_cfg.bridge_id = bridge_id;
   275			} else {
   276				/* When port is removed from the bridge, assign it back to the default
   277				 * bridge 0
   278				 */
   279				br_port_cfg.src_mac_learning_disable = true;
   280				/* Cleanup the port own map leaving only the CPU port mapping. */
   281				if (i == port) {
   282					br_port_cfg.bridge_port_map[0] = BIT(DSA_MXL_PORT(cpu_port));
   283					br_port_cfg.bridge_id = 0;
   284				}
   285			}
   286	
   287			ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_CONFIGSET, br_port_cfg);
   288			if (ret) {
   289				dev_err(ds->dev, "failed to set bridge port configuration on port %d\n", port);
   290				return ret;
   291			}
   292		}
   293	
   294		/* Configure additional bridge port for VLAN based tagging */
   295		if (vlan_sp_tag) {
   296			int bridge_id = priv->port_info[port].bridge_id;
   297			uint16_t bridge_port_cpu = DSA_MXL_PORT(port) + 16;
   298			struct mxl862xx_bridge_port_alloc bpa_param = { };
   299			struct mxl862xx_bridge_port_config br_port_cfg = { };
   300	
   301			bpa_param.bridge_port_id = bridge_port_cpu;
   302	
   303			if (action) {
   304				/* add */
   305				ret = MXL862XX_API_READ(priv, MXL862XX_BRIDGEPORT_ALLOC, bpa_param);
   306				if (ret) {
   307					dev_err(ds->dev,
   308						"%s: Port:%d failed to prepare associated bridge port\n",
   309						__func__, port);
   310					return ret;
   311				}
   312	
   313				br_port_cfg.mask |=
   314					MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
   315					MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID |
   316					MXL862XX_BRIDGE_PORT_CONFIG_MASK_EGRESS_CTP_MAPPING |
   317					MXL862XX_BRIDGE_PORT_CONFIG_MASK_MC_SRC_MAC_LEARNING;
   318				br_port_cfg.bridge_id = bridge_id;
   319				br_port_cfg.bridge_port_id = bridge_port_cpu;
   320				br_port_cfg.bridge_port_map[0] = BIT(DSA_MXL_PORT(port));
   321				br_port_cfg.dest_logical_port_id = DSA_MXL_PORT(cpu_port);
   322				br_port_cfg.src_mac_learning_disable = true;
   323	
   324				ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_CONFIGSET, br_port_cfg);
   325				if (ret) {
   326					dev_err(ds->dev,
   327					"%s: Configuration of cpu bridge port:%d  for port:%d on bridge:%d failed with ret=%d\n",
   328					__func__, bridge_port_cpu, port, bridge_id, ret);
   329					return ret;
   330				}
   331	
   332				/* Add bridge cpu port to portmap */
   333				priv->bridge_portmap[bridge_id] |= BIT(bridge_port_cpu);
   334				priv->port_info[port].bridge_port_cpu = bridge_port_cpu;
   335			} else {
   336				/* remove */
   337				ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_FREE, bpa_param);
   338				if (ret) {
   339					dev_err(ds->dev,
   340						"%s: Port:%d failed to free associated bridge port\n",
   341						__func__, port);
   342					return ret;
   343				}
   344				/* Remove bridge cpu port from portmap */
   345				priv->bridge_portmap[bridge_id] &= ~BIT(bridge_port_cpu);
   346				priv->port_info[port].bridge_port_cpu = 0;
   347			}
   348		}
   349	
   350		return 0;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
