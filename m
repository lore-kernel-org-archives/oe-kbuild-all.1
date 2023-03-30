Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4484D1380
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 02:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680144206; x=1711680206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fw8jzCaYcuGG7al8OtAQMaCFTk/vy2S+4op+qBt7a7I=;
  b=HedLoMYEwRAQaqDWit25iUmq6MmO0+Z5+6D9ytx3+Yo7e/nxJu4QNseg
   nn7207UzseVvoBwVYOsELBvhIqI4rh70D/pcu5/O+TCuErEtt+4vyxeE6
   +T00Pz3JMZyLBSC5Yd7sHH6h6s2H1pbUvJoF/oY8PJQk+SswQs6JXast5
   mUPchy7L7D8Gt0PNCxskCBZO13lZ/ZENnMCTQDz1eg4x9g2L6HwHloHd0
   uBgbYsV5KNhQlX+9p0KoNXguB+wwnqixTawEvsEeVT4/ij7WSZIADKrP6
   Z92g5E/DBHRG649K8jb6805WqodbUFBDBmqNGK6+PwdxZQSLmHNaBpWMq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="324974015"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="324974015"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 19:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858732875"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="858732875"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 19:43:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phiG3-000KDS-1G;
	Thu, 30 Mar 2023 02:43:23 +0000
Date: Thu, 30 Mar 2023 10:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc2-net-next-phy-leds 5/15] emac-phy.c:undefined
 reference to `devm_mdiobus_alloc_size'
Message-ID: <202303301002.RpAF2MbW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-phy-leds
head:   6429f658c82fbe35826e8e3b8a5eb588093912e6
commit: 34fcf09e6a1b0a524768782858cb70f369359022 [5/15] net: phy: Add a binding for PHY LEDs
config: arm-randconfig-r006-20230326 (https://download.01.org/0day-ci/archive/20230330/202303301002.RpAF2MbW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/34fcf09e6a1b0a524768782858cb70f369359022
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-phy-leds
        git checkout 34fcf09e6a1b0a524768782858cb70f369359022
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301002.RpAF2MbW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
   phy_device.c:(.text+0x3b08): undefined reference to `devm_led_classdev_register_ext'
   arm-linux-gnueabi-ld: drivers/net/ethernet/freescale/xgmac_mdio.o: in function `xgmac_mdio_probe':
   xgmac_mdio.c:(.text+0x784): undefined reference to `devm_mdiobus_alloc_size'
   arm-linux-gnueabi-ld: drivers/net/ethernet/qualcomm/emac/emac-phy.o: in function `emac_phy_config':
>> emac-phy.c:(.text+0x2a0): undefined reference to `devm_mdiobus_alloc_size'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - FSL_XGMAC_MDIO [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && OF [=y]
   - HIX5HD2_GMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_HISILICON [=y]
   - QCOM_EMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_QUALCOMM [=y] && HAS_DMA [=y] && HAS_IOMEM [=y]
   Selected by [m]:
   - ETHOC [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - SPI_AX88796C [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_ASIX [=y] && SPI [=y] && GPIOLIB [=y]
   - SYSTEMPORT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (NET_DSA [=n] || !NET_DSA [=n])
   - DM9051 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_DAVICOM [=y] && SPI [=y]
   - HISI_FEMAC [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_HISILICON [=y] && HAS_IOMEM [=y]
   - HNS_MDIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_HISILICON [=y]
   - HNS_ENET [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_HISILICON [=y]
   - KS8851 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICREL [=y] && SPI [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   - SXGBE_ETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_SAMSUNG [=y] && HAS_IOMEM [=y] && HAS_DMA [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   - TI_DAVINCI_MDIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_TI [=y] && (ARCH_DAVINCI [=n] || ARCH_OMAP2PLUS [=y] || ARCH_KEYSTONE [=n] || ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
