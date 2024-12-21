Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC481E9B35
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734789583; cv=none; b=ZoLL9FtxI80rbYjc8Fv/3zdkRMt8cKxyv4QUZkl8I1qJ7/g1Ei+2ooQzEiUjQsYhqBm7eTCufrzhsw1ueH3SEsYn2aH58FRd3bpdHtI0TIAnTGd+t9T4XkIxadEjEOzlhcWtYxPHsQmjcLLmZqPGyZMhGd0xPSMp8udk+OFXV60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734789583; c=relaxed/simple;
	bh=Sdo9eKTAMKtd0+xSRNoyAA9ZW1dbX3qzNefRM++B9Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrTY8EDTNi9i/g2V7qZ4TAJ8yeGHPaANMZ6giGh0jBAylyDrmxuq9EqwmobB/iopU85Cr9RhsAHvoB80NDqqK2CjZkVxwmVw2QrK2/zMtfTQSS4xvP1gWOMUqNGmfwFPhsRsPRIMmuzdv0DiBcQ7W2bbvhm6ntld3Vqhic6irHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqfN5wOx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqfN5wOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734789581; x=1766325581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sdo9eKTAMKtd0+xSRNoyAA9ZW1dbX3qzNefRM++B9Vc=;
  b=YqfN5wOxghwi+zhYyV1c9DJZO+1feEVsQtmxOzQPtAJwvsLeqOPkJtOl
   VVDWse8S/R+po0B6sPV41doc4SCCaGqPi4//X8M5V6yufys0WjhdTiGB9
   Ek1FLP2dV+XvfGr6oFMF7TW7kcY1YxKi6Wztj2gvgDky26dwIXx1+suMF
   1y1OfBhf0H4jh8b+Cx3E7aIGwLohesdFRdb53SkVRC1VmaDBj9tCiUQeT
   INHr0+X+MgWaR3zzocAbKfVppiCTyYHSNFf15B51DtvEGPpbuOXXevDcl
   Ya74Nz5ofI5LGOzmv7nhR/64ZMWCJvhbctNnPwUxZdL02XZOpsTS5dMoM
   Q==;
X-CSE-ConnectionGUID: QsQcC9QqQo63SBrcDojHrA==
X-CSE-MsgGUID: m1hlXVf+SNSANMb7A0KLCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="45814285"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="45814285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 05:59:40 -0800
X-CSE-ConnectionGUID: QsrY36FvS8Ov5CXCZ19WZQ==
X-CSE-MsgGUID: xjMUXZyBTFiBBnvwtKqaEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="129592485"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2024 05:59:40 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP013-0002D5-0K;
	Sat, 21 Dec 2024 13:59:37 +0000
Date: Sat, 21 Dec 2024 21:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 4/5] net: phy: Introduce PHY ports
 representation
Message-ID: <202412212106.ip0yAL1T-lkp@intel.com>
References: <20241220201506.2791940-5-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220201506.2791940-5-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-common-Make-BaseT-a-4-lanes-mode/20241221-041758
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241220201506.2791940-5-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next RFC 4/5] net: phy: Introduce PHY ports representation
config: x86_64-buildonly-randconfig-006-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212106.ip0yAL1T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212106.ip0yAL1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212106.ip0yAL1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_port.c:35: warning: Function parameter or struct member 'port' not described in 'phy_port_destroy'
>> drivers/net/phy/phy_port.c:83: warning: Function parameter or struct member 'dn' not described in 'phy_of_parse_port'
>> drivers/net/phy/phy_port.c:133: warning: Function parameter or struct member 'port' not described in 'phy_port_update_supported'
>> drivers/net/phy/phy_port.c:149: warning: Function parameter or struct member 'port' not described in 'phy_port_get_type'


vim +35 drivers/net/phy/phy_port.c

    30	
    31	/**
    32	 * phy_port_destroy: Free a struct phy_port
    33	 */
    34	void phy_port_destroy(struct phy_port *port)
  > 35	{
    36		kfree(port);
    37	}
    38	EXPORT_SYMBOL_GPL(phy_port_destroy);
    39	
    40	static void ethtool_medium_get_supported(unsigned long *supported,
    41						 enum ethtool_link_medium medium,
    42						 int lanes)
    43	{
    44		int i;
    45	
    46		for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
    47			/* Special bits such as Autoneg, Pause, Asym_pause, etc. are
    48			 * set and will be masked away by the port parent.
    49			 */
    50			if (link_mode_params[i].medium == ETHTOOL_LINK_MEDIUM_NONE) {
    51				linkmode_set_bit(i, supported);
    52				continue;
    53			}
    54	
    55			/* For most cases, min_lanes == lanes, except for 10/100BaseT that work
    56			 * on 2 lanes but are compatible with 4 lanes mediums
    57			 */
    58			if (link_mode_params[i].medium == medium &&
    59			    link_mode_params[i].lanes >= lanes &&
    60			    link_mode_params[i].min_lanes <= lanes) {
    61				linkmode_set_bit(i, supported);
    62			}
    63		}
    64	}
    65	
    66	static enum ethtool_link_medium ethtool_str_to_medium(const char *str)
    67	{
    68		int i;
    69	
    70		for (i = 0; i < __ETHTOOL_LINK_MEDIUM_LAST; i++)
    71			if (!strcmp(phy_mediums(i), str))
    72				return i;
    73	
    74		return ETHTOOL_LINK_MEDIUM_NONE;
    75	}
    76	
    77	/**
    78	 * phy_of_parse_port: Create a phy_port from a firmware representation
    79	 *
    80	 * Returns a newly allocated and initialized phy_port pointer, or an ERR_PTR.
    81	 */
    82	struct phy_port *phy_of_parse_port(struct device_node *dn)
  > 83	{
    84		struct fwnode_handle *fwnode = of_fwnode_handle(dn);
    85		enum ethtool_link_medium medium;
    86		struct phy_port *port;
    87		struct property *prop;
    88		const char *med_str;
    89		u32 lanes, mediums = 0;
    90		int ret;
    91	
    92		ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
    93		if (ret)
    94			return ERR_PTR(ret);
    95	
    96		ret = fwnode_property_read_string(fwnode, "media", &med_str);
    97		if (ret)
    98			return ERR_PTR(ret);
    99	
   100		of_property_for_each_string(to_of_node(fwnode), "media", prop, med_str) {
   101			medium = ethtool_str_to_medium(med_str);
   102			if (medium == ETHTOOL_LINK_MEDIUM_NONE)
   103				return ERR_PTR(-EINVAL);
   104	
   105			mediums |= BIT(medium);
   106		}
   107	
   108		if (!mediums)
   109			return ERR_PTR(-EINVAL);
   110	
   111		port = phy_port_alloc();
   112		if (!port)
   113			return ERR_PTR(-ENOMEM);
   114	
   115		port->lanes = lanes;
   116		port->mediums = mediums;
   117	
   118		return port;
   119	}
   120	EXPORT_SYMBOL_GPL(phy_of_parse_port);
   121	
   122	/**
   123	 * phy_port_update_supported: Setup the port->supported field
   124	 * port: the port to update
   125	 *
   126	 * Once the port's medium list and number of lanes has been configured based
   127	 * on firmware, straps and vendor-specific properties, this function may be
   128	 * called to update the port's supported linkmodes list.
   129	 *
   130	 * Any mode that was manually set in the port's supported list remains set.
   131	 */
   132	void phy_port_update_supported(struct phy_port *port)
 > 133	{
   134		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
   135		int i;
   136	
   137		for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST) {
   138			linkmode_zero(supported);
   139			ethtool_medium_get_supported(supported, i, port->lanes);
   140			linkmode_or(port->supported, port->supported, supported);
   141		}
   142	}
   143	EXPORT_SYMBOL_GPL(phy_port_update_supported);
   144	
   145	/**
   146	 * phy_port_get_type: get the PORT_* attribut for that port.
   147	 */
   148	int phy_port_get_type(struct phy_port *port)
 > 149	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
