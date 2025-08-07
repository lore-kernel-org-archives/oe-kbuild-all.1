Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15DE5695
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 20:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754597239; cv=none; b=EFKx2dxrvKAikdhU926XupGqbHtIeR+NZhspTMrWEA62aLiEwU/t9ptOMpIvuO+07C/Gwd0pBR5WZPjJWYLNWvmch08zF/X0Ybi1uV31BpSR6HpNNRoouE7sItT+H3a1RNjZaNNBdgBKGr/mbSt/doUamtL8kJWwhC+oU91UG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754597239; c=relaxed/simple;
	bh=zQStSsYZz2L8txTjzVe4mwfxoObD6ovBYohwfLLhQoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7itMBnp8QYeU4HOpqexaoNetEuUlpSPTHt2QK8HswPaHFm3wdekGEk9VE/kb0j7pwJutkuaIhFm60YTIXWuaAjNHqwF/Eo+vWtlo1aRIrf2AeRU1g/xbSREYspUMMJNw0mQb5H9rhpZZW5eVrxSUxUAjW8QrZ3s8828R3GxH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlRmg/eu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlRmg/eu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754597237; x=1786133237;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zQStSsYZz2L8txTjzVe4mwfxoObD6ovBYohwfLLhQoE=;
  b=RlRmg/euI6+KfaYu1CPtfVWZkDz8wBkcaBMsu4fd1tVGYjT7KClvvozF
   pjorc/DEFi5o65fif604JCECA8UyKQT2v4sjaY8b7j4zble6VzvO09qbO
   DmtpNd5unt4RJmmGirNoKsBjbn7GEmSxn9EcFCasAOiRONLDTwZeSLi/b
   /P0eMyvuqcrA5Os8YDceQjvYqoJeCmWi4hDx2xuBDRf4281t8+za71OpL
   Bakvvp5zjGCTBb2vM97SeqBUQBk5sBAamDDETk1JXy1NBgLf4bs4arVZE
   /phuoJkmX7eJ66hL1iEcWKOz7l3jCFPTcAcf/fVrWdWh5yrVuLbwhENVv
   Q==;
X-CSE-ConnectionGUID: h4CxAy5dTdmrVySxuAM8jA==
X-CSE-MsgGUID: BEkOWgkzTkmcvqVpCj804Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79498899"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="79498899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 13:07:16 -0700
X-CSE-ConnectionGUID: XWn+9zZoSgeNblUmjcXWBA==
X-CSE-MsgGUID: RQZn87EtReKbDje5cShFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165946455"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 13:07:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk6tN-0003B8-0X;
	Thu, 07 Aug 2025 20:07:13 +0000
Date: Fri, 8 Aug 2025 04:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 drivers/net/phy/phylink.c:2097:35: error: passing 'const struct
 fwnode_handle *' to parameter of type 'struct fwnode_handle *' discards
 qualifiers
Message-ID: <202508080438.i3cCsFjO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Alistair,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   209015b548fb36223e01bbeb84c88f375ddd2829
commit: 8b9a794068e9fe10f91796ee053afdbd5c01782c [3/3] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-003-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080438.i3cCsFjO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080438.i3cCsFjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080438.i3cCsFjO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:2097:35: error: passing 'const struct fwnode_handle *' to parameter of type 'struct fwnode_handle *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    2097 |         phy_fwnode = fwnode_get_phy_node(fwnode);
         |                                          ^~~~~~
   include/linux/phy.h:1759:65: note: passing argument to parameter 'fwnode' here
    1759 | struct fwnode_handle *fwnode_get_phy_node(struct fwnode_handle *fwnode)
         |                                                                 ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]


vim +2097 drivers/net/phy/phylink.c

9525ae83959b60 Russell King          2017-07-25  2071  
25396f680dd625 Calvin Johnson        2021-06-11  2072  /**
25396f680dd625 Calvin Johnson        2021-06-11  2073   * phylink_fwnode_phy_connect() - connect the PHY specified in the fwnode.
25396f680dd625 Calvin Johnson        2021-06-11  2074   * @pl: a pointer to a &struct phylink returned from phylink_create()
25396f680dd625 Calvin Johnson        2021-06-11  2075   * @fwnode: a pointer to a &struct fwnode_handle.
25396f680dd625 Calvin Johnson        2021-06-11  2076   * @flags: PHY-specific flags to communicate to the PHY device driver
25396f680dd625 Calvin Johnson        2021-06-11  2077   *
25396f680dd625 Calvin Johnson        2021-06-11  2078   * Connect the phy specified @fwnode to the phylink instance specified
25396f680dd625 Calvin Johnson        2021-06-11  2079   * by @pl.
25396f680dd625 Calvin Johnson        2021-06-11  2080   *
25396f680dd625 Calvin Johnson        2021-06-11  2081   * Returns 0 on success or a negative errno.
25396f680dd625 Calvin Johnson        2021-06-11  2082   */
25396f680dd625 Calvin Johnson        2021-06-11  2083  int phylink_fwnode_phy_connect(struct phylink *pl,
a0b7955310a445 Russell King (Oracle  2023-05-12  2084) 			       const struct fwnode_handle *fwnode,
25396f680dd625 Calvin Johnson        2021-06-11  2085  			       u32 flags)
25396f680dd625 Calvin Johnson        2021-06-11  2086  {
25396f680dd625 Calvin Johnson        2021-06-11  2087  	struct fwnode_handle *phy_fwnode;
25396f680dd625 Calvin Johnson        2021-06-11  2088  	struct phy_device *phy_dev;
25396f680dd625 Calvin Johnson        2021-06-11  2089  	int ret;
25396f680dd625 Calvin Johnson        2021-06-11  2090  
25396f680dd625 Calvin Johnson        2021-06-11  2091  	/* Fixed links and 802.3z are handled without needing a PHY */
25396f680dd625 Calvin Johnson        2021-06-11  2092  	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
25396f680dd625 Calvin Johnson        2021-06-11  2093  	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
25396f680dd625 Calvin Johnson        2021-06-11  2094  	     phy_interface_mode_is_8023z(pl->link_interface)))
25396f680dd625 Calvin Johnson        2021-06-11  2095  		return 0;
25396f680dd625 Calvin Johnson        2021-06-11  2096  
25396f680dd625 Calvin Johnson        2021-06-11 @2097  	phy_fwnode = fwnode_get_phy_node(fwnode);
25396f680dd625 Calvin Johnson        2021-06-11  2098  	if (IS_ERR(phy_fwnode)) {
25396f680dd625 Calvin Johnson        2021-06-11  2099  		if (pl->cfg_link_an_mode == MLO_AN_PHY)
25396f680dd625 Calvin Johnson        2021-06-11  2100  			return -ENODEV;
25396f680dd625 Calvin Johnson        2021-06-11  2101  		return 0;
25396f680dd625 Calvin Johnson        2021-06-11  2102  	}
25396f680dd625 Calvin Johnson        2021-06-11  2103  
25396f680dd625 Calvin Johnson        2021-06-11  2104  	phy_dev = fwnode_phy_find_device(phy_fwnode);
25396f680dd625 Calvin Johnson        2021-06-11  2105  	/* We're done with the phy_node handle */
25396f680dd625 Calvin Johnson        2021-06-11  2106  	fwnode_handle_put(phy_fwnode);
25396f680dd625 Calvin Johnson        2021-06-11  2107  	if (!phy_dev)
25396f680dd625 Calvin Johnson        2021-06-11  2108  		return -ENODEV;
25396f680dd625 Calvin Johnson        2021-06-11  2109  
a18e6521a7d95d Russell King (Oracle  2021-11-19  2110) 	/* Use PHY device/driver interface */
a18e6521a7d95d Russell King (Oracle  2021-11-19  2111) 	if (pl->link_interface == PHY_INTERFACE_MODE_NA) {
a18e6521a7d95d Russell King (Oracle  2021-11-19  2112) 		pl->link_interface = phy_dev->interface;
a18e6521a7d95d Russell King (Oracle  2021-11-19  2113) 		pl->link_config.interface = pl->link_interface;
a18e6521a7d95d Russell King (Oracle  2021-11-19  2114) 	}
a18e6521a7d95d Russell King (Oracle  2021-11-19  2115) 
21d9ba5bc5516e Russell King (Oracle  2024-03-26  2116) 	if (pl->config->mac_requires_rxc)
21d9ba5bc5516e Russell King (Oracle  2024-03-26  2117) 		flags |= PHY_F_RXC_ALWAYS_ON;
21d9ba5bc5516e Russell King (Oracle  2024-03-26  2118) 
25396f680dd625 Calvin Johnson        2021-06-11  2119  	ret = phy_attach_direct(pl->netdev, phy_dev, flags,
25396f680dd625 Calvin Johnson        2021-06-11  2120  				pl->link_interface);
25396f680dd625 Calvin Johnson        2021-06-11  2121  	phy_device_free(phy_dev);
ce93fdb5f2ca5c Clément Léger         2023-01-31  2122  	if (ret)
25396f680dd625 Calvin Johnson        2021-06-11  2123  		return ret;
25396f680dd625 Calvin Johnson        2021-06-11  2124  
25396f680dd625 Calvin Johnson        2021-06-11  2125  	ret = phylink_bringup_phy(pl, phy_dev, pl->link_config.interface);
25396f680dd625 Calvin Johnson        2021-06-11  2126  	if (ret)
25396f680dd625 Calvin Johnson        2021-06-11  2127  		phy_detach(phy_dev);
25396f680dd625 Calvin Johnson        2021-06-11  2128  
25396f680dd625 Calvin Johnson        2021-06-11  2129  	return ret;
25396f680dd625 Calvin Johnson        2021-06-11  2130  }
25396f680dd625 Calvin Johnson        2021-06-11  2131  EXPORT_SYMBOL_GPL(phylink_fwnode_phy_connect);
25396f680dd625 Calvin Johnson        2021-06-11  2132  

:::::: The code at line 2097 was first introduced by commit
:::::: 25396f680dd6257096c5dc6ceb90ce57caba8de1 net: phylink: introduce phylink_fwnode_phy_connect()

:::::: TO: Calvin Johnson <calvin.johnson@oss.nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
