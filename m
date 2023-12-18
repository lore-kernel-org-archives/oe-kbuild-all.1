Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685A6AA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 06:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceEvQpBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702879457; x=1734415457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rSPyipEe2UisgBdfRlhyHk50N+sKnlnozvHHtTTVIE0=;
  b=ceEvQpBrt3ZvnmVAgWgHWQtFi3QiG0B1gLbvEv6z5Zvv1bSrx7ubhEEc
   LletboNll3NfQZxIJNoPcOjSzdGCNlON6A75+bgnTspWA8FUhSV8AjMrw
   O9NMSXYjfjDlH/GpNdjjUdsnN1vLw89LTiFmLhU9pk02A7aQth3uCcysb
   Mpbq23x18TLbWbFn2+9tkwH9fFtPKGmtWpgX29xXgSVL0udY2rtHAWh7s
   BoXy8jG/iQ/U/MTdB1gt0+v963y4j9y+iCK/Uzxoe78eCrLrK+UCSGtWp
   vNobBfd07Q+nLvn89+1MUB7UmhmF+Wd7w00atKj7T5TjlhOZ6zKugbJsb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="392629725"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="392629725"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 22:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898845816"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="898845816"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2023 22:04:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF6jd-0003pD-0v;
	Mon, 18 Dec 2023 06:04:13 +0000
Date: Mon, 18 Dec 2023 14:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-dango 3829/3915]
 include/linux/pcs/pcs-mtk-usxgmii.h:22:1: error: expected ';' before '}'
 token
Message-ID: <202312181321.k3KltIbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-dango
head:   e9bee8e4c4eb3b6bb73cdd005da7b10907351bed
commit: 9fa7b4eb8b6031ed79464a5720241cf948f48756 [3829/3915] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: i386-buildonly-randconfig-005-20231218 (https://download.01.org/0day-ci/archive/20231218/202312181321.k3KltIbX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181321.k3KltIbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181321.k3KltIbX-lkp@intel.com/

Note: the frank-w-bpi-r2-4.14/6.7-dango HEAD e9bee8e4c4eb3b6bb73cdd005da7b10907351bed builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:0:
   include/linux/pcs/pcs-mtk-usxgmii.h: In function 'mtk_usxgmii_select_pcs':
>> include/linux/pcs/pcs-mtk-usxgmii.h:22:1: error: expected ';' before '}' token
    };
    ^


vim +22 include/linux/pcs/pcs-mtk-usxgmii.h

f070a64b374587 Daniel Golle 2023-09-22   6  
f070a64b374587 Daniel Golle 2023-09-22   7  /**
f070a64b374587 Daniel Golle 2023-09-22   8   * mtk_usxgmii_select_pcs() - Get MediaTek PCS instance
f070a64b374587 Daniel Golle 2023-09-22   9   * @np:		Pointer to device node indentifying a MediaTek USXGMII PCS
f070a64b374587 Daniel Golle 2023-09-22  10   * @mode:	Ethernet PHY interface mode
f070a64b374587 Daniel Golle 2023-09-22  11   *
f070a64b374587 Daniel Golle 2023-09-22  12   * Return PCS identified by a device node and the PHY interface mode in use
f070a64b374587 Daniel Golle 2023-09-22  13   *
f070a64b374587 Daniel Golle 2023-09-22  14   * Return:	Pointer to phylink PCS instance of NULL
f070a64b374587 Daniel Golle 2023-09-22  15   */
f070a64b374587 Daniel Golle 2023-09-22  16  #if IS_ENABLED(CONFIG_PCS_MTK_USXGMII)
f070a64b374587 Daniel Golle 2023-09-22  17  struct phylink_pcs *mtk_usxgmii_select_pcs(struct device_node *np, phy_interface_t mode);
f070a64b374587 Daniel Golle 2023-09-22  18  #else
f070a64b374587 Daniel Golle 2023-09-22  19  static inline struct phylink_pcs *mtk_usxgmii_select_pcs(struct device_node *np, phy_interface_t mode)
f070a64b374587 Daniel Golle 2023-09-22  20  {
f070a64b374587 Daniel Golle 2023-09-22  21  	return NULL
f070a64b374587 Daniel Golle 2023-09-22 @22  };
f070a64b374587 Daniel Golle 2023-09-22  23  #endif /* IS_ENABLED(CONFIG_PCS_MTK_USXGMII) */
f070a64b374587 Daniel Golle 2023-09-22  24  

:::::: The code at line 22 was first introduced by commit
:::::: f070a64b3745870bd9fcec7eb0170f51f5598992 net: pcs: add driver for MediaTek USXGMII PCS

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Daniel Golle <daniel@makrotopia.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
