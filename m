Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651463DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681502689; x=1713038689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r55N4da7jP3EK8v9Fzf/0DvHGCRnjniMaj5HX0V3M3Q=;
  b=dk2WjsfrBcgDGDG5g8BdVjKvATUfKKDWKjujfl8MFBeWIjCt64fAenQk
   I1E2Fl42JGsH5En1hj35YLJw1LzaJXNckzksSAIbuWdEr+x3tNsZLIhuO
   E2Y190dmBIlw3ZYFiCpITBf/BH9JPECuqwK7WEe+wSqetqd58XQW6i421
   GoUL7UDCx9NVDplyGvmVcNbqY4XUhLSVN9+mdUds4KGCSKaAozkQInJ6B
   ZpsJOiW4aGCpuY0OvgoCU4ekLVIQnAmg+eFHpHe71hpYS5ct0Q8qkrCiY
   nYRWQy6OtMxHnPvl00UVBxrUPvly0veA4lKqERVwpjh87gsdkNAfMn6uE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328714850"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="328714850"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 13:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="640216288"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="640216288"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2023 13:04:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnPf4-000ZtP-0U;
	Fri, 14 Apr 2023 20:04:46 +0000
Date: Sat, 15 Apr 2023 04:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc2-net-next-phy-leds 5/16] include/linux/phy.h:458:
 undefined reference to `devm_mdiobus_alloc_size'
Message-ID: <202304150308.FSWiFBMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-phy-leds
head:   885b4a813cb9f8cdfbdc3f86cc46babcf13dc3d9
commit: 4569c1dde9a66ee4688e546e2b03f693e2e99fb2 [5/16] net: phy: Add a binding for PHY LEDs
config: nios2-buildonly-randconfig-r002-20230410 (https://download.01.org/0day-ci/archive/20230415/202304150308.FSWiFBMl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/4569c1dde9a66ee4688e546e2b03f693e2e99fb2
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-phy-leds
        git checkout 4569c1dde9a66ee4688e546e2b03f693e2e99fb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150308.FSWiFBMl-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/net/phy/phy_device.o: in function `of_phy_led':
   drivers/net/phy/phy_device.c:3026: undefined reference to `devm_led_classdev_register_ext'
   drivers/net/phy/phy_device.c:3026:(.text+0x3534): relocation truncated to fit: R_NIOS2_CALL26 against `devm_led_classdev_register_ext'
   nios2-linux-ld: drivers/net/ethernet/xilinx/ll_temac_mdio.o: in function `devm_mdiobus_alloc':
>> include/linux/phy.h:458: undefined reference to `devm_mdiobus_alloc_size'
   include/linux/phy.h:458:(.text+0x218): relocation truncated to fit: R_NIOS2_CALL26 against `devm_mdiobus_alloc_size'
>> nios2-linux-ld: include/linux/phy.h:458: undefined reference to `devm_mdiobus_alloc_size'
   include/linux/phy.h:458:(.text+0x34c): relocation truncated to fit: R_NIOS2_CALL26 against `devm_mdiobus_alloc_size'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - ETHOC [=y] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - XILINX_LL_TEMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   - USB_LAN78XX [=y] && NETDEVICES [=y] && USB_NET_DRIVERS [=y]
   - USB_NET_SMSC95XX [=y] && NETDEVICES [=y] && USB_NET_DRIVERS [=y] && USB_USBNET [=y]
   Selected by [m]:
   - ALTERA_TSE [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_DMA [=y]
   - SYSTEMPORT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (NET_DSA [=m] || !NET_DSA [=m])
   - KS8851_MLL [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICREL [=y] && HAS_IOMEM [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - XILINX_EMACLITE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   - USB_NET_AX88179_178A [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=y] && USB_USBNET [=y]


vim +458 include/linux/phy.h

eb8a54a78e974e Timur Tabi          2012-01-12  445  
3e3aaf64941698 Russell King        2015-09-24  446  int __mdiobus_register(struct mii_bus *bus, struct module *owner);
ac3a68d56651c3 Bartosz Golaszewski 2020-06-29  447  int __devm_mdiobus_register(struct device *dev, struct mii_bus *bus,
ac3a68d56651c3 Bartosz Golaszewski 2020-06-29  448  			    struct module *owner);
3e3aaf64941698 Russell King        2015-09-24  449  #define mdiobus_register(bus) __mdiobus_register(bus, THIS_MODULE)
ac3a68d56651c3 Bartosz Golaszewski 2020-06-29  450  #define devm_mdiobus_register(dev, bus) \
ac3a68d56651c3 Bartosz Golaszewski 2020-06-29  451  		__devm_mdiobus_register(dev, bus, THIS_MODULE)
38f961e744840d Heiner Kallweit     2020-04-20  452  
2e888103295f47 Lennert Buytenhek   2008-09-29  453  void mdiobus_unregister(struct mii_bus *bus);
2e888103295f47 Lennert Buytenhek   2008-09-29  454  void mdiobus_free(struct mii_bus *bus);
6d48f44b7b2af6 Grygorii Strashko   2014-04-30  455  struct mii_bus *devm_mdiobus_alloc_size(struct device *dev, int sizeof_priv);
6d48f44b7b2af6 Grygorii Strashko   2014-04-30  456  static inline struct mii_bus *devm_mdiobus_alloc(struct device *dev)
6d48f44b7b2af6 Grygorii Strashko   2014-04-30  457  {
6d48f44b7b2af6 Grygorii Strashko   2014-04-30 @458  	return devm_mdiobus_alloc_size(dev, 0);
6d48f44b7b2af6 Grygorii Strashko   2014-04-30  459  }
6d48f44b7b2af6 Grygorii Strashko   2014-04-30  460  

:::::: The code at line 458 was first introduced by commit
:::::: 6d48f44b7b2af67b33c1ae5994b8f642685c8bc8 mdio_bus: implement devm_mdiobus_alloc/devm_mdiobus_free

:::::: TO: Grygorii Strashko <grygorii.strashko@ti.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
