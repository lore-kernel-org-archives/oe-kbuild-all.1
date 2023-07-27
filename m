Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56D442E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 22:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690498713; x=1722034713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUIWUWFfeRfD0uK/lxOG/wzFxx/8YlGQLdqlwtYtreY=;
  b=k+EC+Z1jKxEduxmVzK6VWBr/NhM9z6x7pHdjCmiQK0bFqCNbSIonTd11
   +OuIdjbwWiOK8qBqR7LnP2J9lTFeYFZGUDs2f2PqPGNhHqGA6vaoQ2I/E
   i5LGW4k/xkk1kWjVYykhesA2ykT+MBtdzG0ELsB3YkjfqGdxkLrwbr6dx
   Pwx7aiduK8zHo1QHLml5vLc8n4C9/5qQOg79wZ4X1+KrB29WbpboK89Px
   zU+GgfOMZ2amQ+e51d7AyweW6YP/t2gpFInHbMax6f4YdEIt3hOtqHbFp
   huy9mXiRFg2PaSAqcYglwifV3g5DBh8PpXATzCWlEWfTWbzjpRRhJB9DZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372076286"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="372076286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 15:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="677302643"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="677302643"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2023 15:58:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP9wD-0002gJ-10;
	Thu, 27 Jul 2023 22:58:29 +0000
Date: Fri, 28 Jul 2023 06:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Golle <daniel@makrotopia.org>
Subject: [rmk-arm:zii 96/143] drivers/net/dsa/microchip/ksz_common.c:1590:15:
 error: 'struct phylink_config' has no member named 'legacy_pre_march2020'
Message-ID: <202307280610.fMR2owb3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   5a3f364f3cc554cb9bec559ecc2c32f67a4b3ef0
commit: 6534babc36313dcb0ee4e9da0d32bb1a2a27da8a [96/143] net: phylink: strip out pre-March 2020 legacy code
config: m68k-randconfig-r024-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280610.fMR2owb3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280610.fMR2owb3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280610.fMR2owb3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/microchip/ksz_common.c: In function 'ksz_phylink_get_caps':
>> drivers/net/dsa/microchip/ksz_common.c:1590:15: error: 'struct phylink_config' has no member named 'legacy_pre_march2020'
    1590 |         config->legacy_pre_march2020 = false;
         |               ^~


vim +1590 drivers/net/dsa/microchip/ksz_common.c

eee16b147121ce Arun Ramadoss   2022-05-17  1584  
1958eee85f6724 Arun Ramadoss   2022-06-22  1585  static void ksz_phylink_get_caps(struct dsa_switch *ds, int port,
65ac79e1812016 Arun Ramadoss   2022-05-17  1586  				 struct phylink_config *config)
65ac79e1812016 Arun Ramadoss   2022-05-17  1587  {
65ac79e1812016 Arun Ramadoss   2022-05-17  1588  	struct ksz_device *dev = ds->priv;
65ac79e1812016 Arun Ramadoss   2022-05-17  1589  
65ac79e1812016 Arun Ramadoss   2022-05-17 @1590  	config->legacy_pre_march2020 = false;
65ac79e1812016 Arun Ramadoss   2022-05-17  1591  
65ac79e1812016 Arun Ramadoss   2022-05-17  1592  	if (dev->info->supports_mii[port])
65ac79e1812016 Arun Ramadoss   2022-05-17  1593  		__set_bit(PHY_INTERFACE_MODE_MII, config->supported_interfaces);
65ac79e1812016 Arun Ramadoss   2022-05-17  1594  
65ac79e1812016 Arun Ramadoss   2022-05-17  1595  	if (dev->info->supports_rmii[port])
65ac79e1812016 Arun Ramadoss   2022-05-17  1596  		__set_bit(PHY_INTERFACE_MODE_RMII,
65ac79e1812016 Arun Ramadoss   2022-05-17  1597  			  config->supported_interfaces);
65ac79e1812016 Arun Ramadoss   2022-05-17  1598  
65ac79e1812016 Arun Ramadoss   2022-05-17  1599  	if (dev->info->supports_rgmii[port])
65ac79e1812016 Arun Ramadoss   2022-05-17  1600  		phy_interface_set_rgmii(config->supported_interfaces);
65ac79e1812016 Arun Ramadoss   2022-05-17  1601  
5fbb08eb7f945c Vladimir Oltean 2022-08-18  1602  	if (dev->info->internal_phy[port]) {
65ac79e1812016 Arun Ramadoss   2022-05-17  1603  		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
65ac79e1812016 Arun Ramadoss   2022-05-17  1604  			  config->supported_interfaces);
5fbb08eb7f945c Vladimir Oltean 2022-08-18  1605  		/* Compatibility for phylib's default interface type when the
5fbb08eb7f945c Vladimir Oltean 2022-08-18  1606  		 * phy-mode property is absent
5fbb08eb7f945c Vladimir Oltean 2022-08-18  1607  		 */
5fbb08eb7f945c Vladimir Oltean 2022-08-18  1608  		__set_bit(PHY_INTERFACE_MODE_GMII,
5fbb08eb7f945c Vladimir Oltean 2022-08-18  1609  			  config->supported_interfaces);
5fbb08eb7f945c Vladimir Oltean 2022-08-18  1610  	}
7012033ce10e09 Arun Ramadoss   2022-06-17  1611  
7012033ce10e09 Arun Ramadoss   2022-06-17  1612  	if (dev->dev_ops->get_caps)
7012033ce10e09 Arun Ramadoss   2022-06-17  1613  		dev->dev_ops->get_caps(dev, port, config);
65ac79e1812016 Arun Ramadoss   2022-05-17  1614  }
65ac79e1812016 Arun Ramadoss   2022-05-17  1615  

:::::: The code at line 1590 was first introduced by commit
:::::: 65ac79e1812016d7c5760872736802f985ec7455 net: dsa: microchip: add the phylink get_caps

:::::: TO: Arun Ramadoss <arun.ramadoss@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
