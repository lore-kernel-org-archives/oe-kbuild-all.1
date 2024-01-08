Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD955792
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPicgPYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704746666; x=1736282666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kP60VPnYFQ21h5nbXdMlGaJtMy4aQ6rIIj4Fl2lc58k=;
  b=HPicgPYjpLfkyNK3IjMndGCCpLG2DTEacIBH2UJ5F9sJj0twildzYB+z
   IlSu2EcK0AcHYyN99HMUCw7rsrFOX98sM+MdBga9Ps1WRdiB3qYYzivGR
   iwjW00H9SaEs7i7OVycawUhtXnRxHKY03pIsKmGWIkMhJu55NMn9dF7Qg
   3bGHPV6SQieHHLPkVtnkRbfg7BeAkrNWgmLCkUkCSCu661nLJxjJUxD9C
   QFx1yLKwzw0Nnvjz299ZAwX1NtoymIU69eEL5SkYO+8sc+cHdb39QXRO6
   IVxtfge0VHY5ShJjkX89XWDGL0kASwbb0awJocBdMXeRbEzfA7JJ331vW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="16594810"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="16594810"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 12:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="924982588"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="924982588"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2024 12:44:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMwTu-00055A-05;
	Mon, 08 Jan 2024 20:44:22 +0000
Date: Tue, 9 Jan 2024 04:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/gemini-dts-fixes 4/4]
 drivers/net/ethernet/cortina/gemini.c:307:21: error: implicit declaration of
 function 'phy_interface_mode_is_gmii'; did you mean
 'phy_interface_mode_is_rgmii'?
Message-ID: <202401090432.M4NHf1QL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/gemini-dts-fixes
head:   9ed4f78490d5bf141db56aa5f30a86e83798a419
commit: 9ed4f78490d5bf141db56aa5f30a86e83798a419 [4/4] net: cortina: Support MII and GMII properly
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240109/202401090432.M4NHf1QL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401090432.M4NHf1QL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090432.M4NHf1QL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/cortina/gemini.c: In function 'gmac_speed_set':
>> drivers/net/ethernet/cortina/gemini.c:307:21: error: implicit declaration of function 'phy_interface_mode_is_gmii'; did you mean 'phy_interface_mode_is_rgmii'? [-Werror=implicit-function-declaration]
     307 |                 if (phy_interface_mode_is_gmii(phydev->interface)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     phy_interface_mode_is_rgmii
>> drivers/net/ethernet/cortina/gemini.c:320:21: error: implicit declaration of function 'phy_interface_mode_is_mii'; did you mean 'phy_interface_mode_is_rgmii'? [-Werror=implicit-function-declaration]
     320 |                 if (phy_interface_mode_is_mii(phydev->interface)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                     phy_interface_mode_is_rgmii
   cc1: some warnings being treated as errors


vim +307 drivers/net/ethernet/cortina/gemini.c

   290	
   291	static void gmac_speed_set(struct net_device *netdev)
   292	{
   293		struct gemini_ethernet_port *port = netdev_priv(netdev);
   294		struct phy_device *phydev = netdev->phydev;
   295		union gmac_status status, old_status;
   296		int pause_tx = 0;
   297		int pause_rx = 0;
   298	
   299		status.bits32 = readl(port->gmac_base + GMAC_STATUS);
   300		old_status.bits32 = status.bits32;
   301		status.bits.link = phydev->link;
   302		status.bits.duplex = phydev->duplex;
   303	
   304		switch (phydev->speed) {
   305		case 1000:
   306			status.bits.speed = GMAC_SPEED_1000;
 > 307			if (phy_interface_mode_is_gmii(phydev->interface)) {
   308				status.bits.mii_rmii = GMAC_PHY_GMII;
   309				netdev_dbg(netdev, "connect %s to GMII @ 1Gbit\n",
   310					   phydev_name(phydev));
   311			}
   312			if (phy_interface_mode_is_rgmii(phydev->interface)) {
   313				status.bits.mii_rmii = GMAC_PHY_RGMII_1000;
   314				netdev_dbg(netdev, "connect %s to RGMII @ 1Gbit\n",
   315					   phydev_name(phydev));
   316			}
   317			break;
   318		case 100:
   319			status.bits.speed = GMAC_SPEED_100;
 > 320			if (phy_interface_mode_is_mii(phydev->interface)) {
   321				status.bits.mii_rmii = GMAC_PHY_MII;
   322				netdev_dbg(netdev, "connect %s to MII @ 100 Mbit\n",
   323					   phydev_name(phydev));
   324			}
   325			if (phy_interface_mode_is_gmii(phydev->interface)) {
   326				status.bits.mii_rmii = GMAC_PHY_GMII;
   327				netdev_dbg(netdev, "connect %s to GMII @ 100 Mbit\n",
   328					   phydev_name(phydev));
   329			}
   330			if (phy_interface_mode_is_rgmii(phydev->interface)) {
   331				status.bits.mii_rmii = GMAC_PHY_RGMII_100_10;
   332				netdev_dbg(netdev, "connect %s to RGMII @ 100 Mbit\n",
   333					   phydev_name(phydev));
   334			}
   335			break;
   336		case 10:
   337			status.bits.speed = GMAC_SPEED_10;
   338			if (phy_interface_mode_is_mii(phydev->interface)) {
   339				status.bits.mii_rmii = GMAC_PHY_MII;
   340				netdev_dbg(netdev, "connect %s to MII @ 10 Mbit\n",
   341					   phydev_name(phydev));
   342			}
   343			if (phy_interface_mode_is_gmii(phydev->interface)) {
   344				status.bits.mii_rmii = GMAC_PHY_GMII;
   345				netdev_dbg(netdev, "connect %s to GMII @ 10 Mbit\n",
   346					   phydev_name(phydev));
   347			}
   348			if (phy_interface_mode_is_rgmii(phydev->interface)) {
   349				status.bits.mii_rmii = GMAC_PHY_RGMII_100_10;
   350				netdev_dbg(netdev, "connect %s to RGMII @ 10 Mbit\n",
   351					   phydev_name(phydev));
   352			}
   353			break;
   354		default:
   355			netdev_warn(netdev, "Unsupported PHY speed (%d) on %s\n",
   356				    phydev->speed, phydev_name(phydev));
   357		}
   358	
   359		if (phydev->duplex == DUPLEX_FULL) {
   360			u16 lcladv = phy_read(phydev, MII_ADVERTISE);
   361			u16 rmtadv = phy_read(phydev, MII_LPA);
   362			u8 cap = mii_resolve_flowctrl_fdx(lcladv, rmtadv);
   363	
   364			if (cap & FLOW_CTRL_RX)
   365				pause_rx = 1;
   366			if (cap & FLOW_CTRL_TX)
   367				pause_tx = 1;
   368		}
   369	
   370		gmac_set_flow_control(netdev, pause_tx, pause_rx);
   371	
   372		if (old_status.bits32 == status.bits32)
   373			return;
   374	
   375		if (netif_msg_link(port)) {
   376			phy_print_status(phydev);
   377			netdev_info(netdev, "link flow control: %s\n",
   378				    phydev->pause
   379				    ? (phydev->asym_pause ? "tx" : "both")
   380				    : (phydev->asym_pause ? "rx" : "none")
   381			);
   382		}
   383	
   384		gmac_disable_tx_rx(netdev);
   385		writel(status.bits32, port->gmac_base + GMAC_STATUS);
   386		gmac_enable_tx_rx(netdev);
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
