Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF90EB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 02:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680058114; x=1711594114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjARycvSt8dE9Ra3mjO4BFskaW6a/mD9/pPDIHiPV1Q=;
  b=hKwxUUWnH6CQsIJyUr4fTm6hSww2E7RasUdQGhfipj8XG+u7gbY4dm0l
   JkGaeQcj9weO46etEQcDyU2RZwPOnhapuygX8JKTztLPLfi78urvhgo30
   qIXSv6GjLQzX8KuLTmwFJH8gMntdynnav5nmWjy6hc1TikMZ6Spc/Svve
   gNGVj8td1fsS8bebfReeDh81bBAuc6iePE/6a6NplRznHVt2O5ic52f3Z
   D+fqlt1zjw80rIYOhg4oo4CG7I3+wlj5BUkMpZMOX6eEPrbDdt0zgsKZn
   /PLSZ7lvZxYpoqY0hyhMcfChu8r1FtObmnE61rxKlOFKxuqVptygUZFti
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403376125"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="403376125"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 19:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="753412927"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="753412927"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 19:48:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phLrT-000J7P-2g;
	Wed, 29 Mar 2023 02:48:31 +0000
Date: Wed, 29 Mar 2023 10:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.3-rc3-net-next-ethtool-eee-v5 /24]
 drivers/net/phy/phy-c45.c:1397: warning: expecting prototype for
 phy_eee_clk_stop_enable(). Prototype was for
 genphy_c45_eee_clk_stop_enable() instead
Message-ID: <202303291029.SwY2Fht0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc3-net-next-ethtool-eee-v5
head:   900606855a3fbafc543b01a40e85cc77333e55de
commit: 318d7117017d65c672d9a5ff93473035fa677366 [/24] net: phy: Add helper to set EEE Clock stop enable bit
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230329/202303291029.SwY2Fht0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/318d7117017d65c672d9a5ff93473035fa677366
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc3-net-next-ethtool-eee-v5
        git checkout 318d7117017d65c672d9a5ff93473035fa677366
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291029.SwY2Fht0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy-c45.c:1397: warning: expecting prototype for phy_eee_clk_stop_enable(). Prototype was for genphy_c45_eee_clk_stop_enable() instead


vim +1397 drivers/net/phy/phy-c45.c

  1388	
  1389	/**
  1390	 * phy_eee_clk_stop_enable - Clock should stop during LPI signalling
  1391	 * @phydev: target phy_device struct
  1392	 *
  1393	 * Description: Program the MMD register 3.0 setting the "Clock stop enable"
  1394	 * bit.
  1395	 */
  1396	int genphy_c45_eee_clk_stop_enable(struct phy_device *phydev)
> 1397	{
  1398		int ret;
  1399	
  1400		/* IEEE 802.3:2018 - 45.2.3.2.6 Clock stop capable (3.1.6) */
  1401		ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_STAT1);
  1402		if (ret < 0)
  1403			return ret;
  1404	
  1405		if (ret & MDIO_STAT1_CLKSTOP_CAPABLE)
  1406			/* IEEE 802.3-2018 45.2.3.1.4 Clock stop enable (3.0.10) */
  1407			return phy_set_bits_mmd(phydev, MDIO_MMD_PCS, MDIO_CTRL1,
  1408						MDIO_PCS_CTRL1_CLKSTOP_EN);
  1409		return 0;
  1410	}
  1411	EXPORT_SYMBOL_GPL(genphy_c45_eee_clk_stop_enable);
  1412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
