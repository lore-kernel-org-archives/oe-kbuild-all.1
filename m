Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE5E57A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 23:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690499913; x=1722035913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEgvEAYkNZNESlfYrLtZBwdRTN36TOX+z4lo/DUj3PY=;
  b=N/K1R5LCPiiiytwnGYMFFMCQnHt0FgqGSe9j1muARuT9GYsmZCYFabxv
   793ChiuOJfDi18uElMuhn5W7R9TB2hcLBsag0QhFGS6cBBOKzFRsty6Tl
   9XyS/ByxvyVBjHKAPvhfS99PpO7PKOhtV8Ftf8wjBFJbQ2u1yJ9NRX+A1
   hQbiCou4vSFm2sxwtFd87AF0iVHCIJKoWePzTbkoUg+leAYkhVVcTAEvR
   Goyod+N5YiiEcIhr2w6Qu7pentrTc3LIFJu/MME+U2L046mSmF0T9MJSV
   UbxUvIP79SttGVjf9f0nYnDE1nTu5QgAw7dW5PWYUk5dhSNGI5r65/T16
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365912985"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="365912985"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 16:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762373138"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="762373138"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 16:18:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPAFZ-0002hb-2n;
	Thu, 27 Jul 2023 23:18:29 +0000
Date: Fri, 28 Jul 2023 07:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Golle <daniel@makrotopia.org>
Subject: [rmk-arm:zii 96/143] drivers/net/dsa/lan9303-core.c:1298:15: error:
 'struct phylink_config' has no member named 'legacy_pre_march2020'
Message-ID: <202307280731.Rpjaku6t-lkp@intel.com>
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
config: alpha-randconfig-r024-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280731.Rpjaku6t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280731.Rpjaku6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280731.Rpjaku6t-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/lan9303-core.c: In function 'lan9303_phylink_get_caps':
>> drivers/net/dsa/lan9303-core.c:1298:15: error: 'struct phylink_config' has no member named 'legacy_pre_march2020'
    1298 |         config->legacy_pre_march2020 = false;
         |               ^~
--
   drivers/net/dsa/microchip/ksz_common.c: In function 'ksz_phylink_get_caps':
>> drivers/net/dsa/microchip/ksz_common.c:1590:15: error: 'struct phylink_config' has no member named 'legacy_pre_march2020'
    1590 |         config->legacy_pre_march2020 = false;
         |               ^~


vim +1298 drivers/net/dsa/lan9303-core.c

0620427ea0d649 Egil Hjelmeland 2017-10-20  1268  
332bc552a402c9 Jerry Ray       2023-01-17  1269  static void lan9303_phylink_get_caps(struct dsa_switch *ds, int port,
332bc552a402c9 Jerry Ray       2023-01-17  1270  				     struct phylink_config *config)
332bc552a402c9 Jerry Ray       2023-01-17  1271  {
332bc552a402c9 Jerry Ray       2023-01-17  1272  	struct lan9303 *chip = ds->priv;
332bc552a402c9 Jerry Ray       2023-01-17  1273  
332bc552a402c9 Jerry Ray       2023-01-17  1274  	dev_dbg(chip->dev, "%s(%d) entered.", __func__, port);
332bc552a402c9 Jerry Ray       2023-01-17  1275  
332bc552a402c9 Jerry Ray       2023-01-17  1276  	config->mac_capabilities = MAC_10 | MAC_100 | MAC_ASYM_PAUSE |
332bc552a402c9 Jerry Ray       2023-01-17  1277  				   MAC_SYM_PAUSE;
332bc552a402c9 Jerry Ray       2023-01-17  1278  
332bc552a402c9 Jerry Ray       2023-01-17  1279  	if (port == 0) {
332bc552a402c9 Jerry Ray       2023-01-17  1280  		__set_bit(PHY_INTERFACE_MODE_RMII,
332bc552a402c9 Jerry Ray       2023-01-17  1281  			  config->supported_interfaces);
332bc552a402c9 Jerry Ray       2023-01-17  1282  		__set_bit(PHY_INTERFACE_MODE_MII,
332bc552a402c9 Jerry Ray       2023-01-17  1283  			  config->supported_interfaces);
332bc552a402c9 Jerry Ray       2023-01-17  1284  	} else {
332bc552a402c9 Jerry Ray       2023-01-17  1285  		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
332bc552a402c9 Jerry Ray       2023-01-17  1286  			  config->supported_interfaces);
332bc552a402c9 Jerry Ray       2023-01-17  1287  		/* Compatibility for phylib's default interface type when the
332bc552a402c9 Jerry Ray       2023-01-17  1288  		 * phy-mode property is absent
332bc552a402c9 Jerry Ray       2023-01-17  1289  		 */
332bc552a402c9 Jerry Ray       2023-01-17  1290  		__set_bit(PHY_INTERFACE_MODE_GMII,
332bc552a402c9 Jerry Ray       2023-01-17  1291  			  config->supported_interfaces);
332bc552a402c9 Jerry Ray       2023-01-17  1292  	}
332bc552a402c9 Jerry Ray       2023-01-17  1293  
332bc552a402c9 Jerry Ray       2023-01-17  1294  	/* This driver does not make use of the speed, duplex, pause or the
332bc552a402c9 Jerry Ray       2023-01-17  1295  	 * advertisement in its mac_config, so it is safe to mark this driver
332bc552a402c9 Jerry Ray       2023-01-17  1296  	 * as non-legacy.
332bc552a402c9 Jerry Ray       2023-01-17  1297  	 */
332bc552a402c9 Jerry Ray       2023-01-17 @1298  	config->legacy_pre_march2020 = false;
332bc552a402c9 Jerry Ray       2023-01-17  1299  }
332bc552a402c9 Jerry Ray       2023-01-17  1300  

:::::: The code at line 1298 was first introduced by commit
:::::: 332bc552a402c9a319a87f0ee114db4a03a3c887 dsa: lan9303: Migrate to PHYLINK

:::::: TO: Jerry Ray <jerry.ray@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
