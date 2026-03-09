Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61329CE1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 00:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773014654; cv=none; b=odUMNi8SHLvIYCy0AOzN1y/dw5iGnx+tCeFtMyKfUgHoqtIT32JHbdanIL554PIXCbob2OVf0u7xf0kx9ig8TLHqvzRPMt7FxbsBmAgnuPaK3Gp/zLWOS8xzsXSZg0RRDwF1PdGlOIWfBJI6HThOTRNP0vvuKLOFCUziFa1p/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773014654; c=relaxed/simple;
	bh=voyUlfBV4OqT3ojtvCGstSIdRGyf6nf4JhUzNp9zbg8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PQ0a29GzpIaaDUgv+JJSi8kETtd5Gm9r6R5yvaO/0oWgYzWwLQ0KGqeDCsGU/dJ80ok3HNbnts2pRVpGcXQFKjJk2S9HjfaF1JMh6DimH5Ptba9SVoSlELF12kjP7RLH+1A2EuqW2vw8IsR2351YITkL9BWu12MtWyFmemIdVL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpvI7fql; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpvI7fql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773014651; x=1804550651;
  h=date:from:to:cc:subject:message-id;
  bh=voyUlfBV4OqT3ojtvCGstSIdRGyf6nf4JhUzNp9zbg8=;
  b=JpvI7fqlLN+d7VP6CF6A6q679QqI8+GqbdGsbNXyYgNyOA6ffn7U41V5
   HiK0b8LPJkZ8BJ17FQ8YYq37eo8ElY2adWzmJMcvKBWcCkJK/aX7hMx4Q
   cOj51B7DRHKINaqCY9JhluuYaIcPNArTMh6HAHnGAJ3tmzxjRvlYkufde
   sMxfJnhsqO7c4F/qOlCLVk6lhrITGIbuZLRPxk9ex00LCBRJzFd9q5zw4
   1OCKQDnq8a2+pBFOnNi411xwnkQI3zGxvwAK5zoDrKRoNd4ln6WphsgiP
   yu+BpbZ3D2UchlHQv4Q996nN7xsSxBj7jfDkNCfneHN38VlpXRGEJ3Yjt
   A==;
X-CSE-ConnectionGUID: pyyk75iIQl2qVz2GMfcO0Q==
X-CSE-MsgGUID: ImKvAOykQX2Y7gENpvEdFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77889191"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77889191"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:04:11 -0700
X-CSE-ConnectionGUID: A03ZzCM7Sym2HUSxsj/eDg==
X-CSE-MsgGUID: 39tSLrXmSIilubqOzRvVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245633469"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2026 17:04:08 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzO6Q-000000003Uq-0TPH;
	Mon, 09 Mar 2026 00:04:06 +0000
Date: Mon, 09 Mar 2026 08:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 36/87]
 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:191:64: error: use of
 undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
Message-ID: <202603090738.Yei3KNHj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 346a9caf3a3531e2084c3ba5346c85d56787f909 [36/87] net: dsa: add mxl downstream driver from 6.19-main
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260309/202603090738.Yei3KNHj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090738.Yei3KNHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090738.Yei3KNHj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:191:64: error: use of undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
     191 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:371:15: error: use of undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
     371 |                 tag_proto = DSA_TAG_PROTO_MXL862_8021Q;
         |                             ^
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2175:64: error: use of undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
    2175 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2543:64: error: use of undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
    2543 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2593:64: error: use of undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
    2593 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2708:48: error: use of undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
    2708 |         if (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q) {
         |                                                       ^
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2798:64: error: use of undeclared identifier 'DSA_TAG_PROTO_MXL862_8021Q'
    2798 |         bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
         |                                                                       ^
   7 errors generated.


vim +/DSA_TAG_PROTO_MXL862_8021Q +191 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c

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
