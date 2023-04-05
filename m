Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE279E2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680730829; x=1712266829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dx2twCRP25nInNvwUWDERGrCyU3Vk80PE+ggtpu5AHU=;
  b=P4SU/BMN7i5fgf7kWOqfHSLIF46r+rI8k5NUc46jBiKufNOIg/beZi3F
   S8kJIKHx5gU0ktZlGyoUxEJupe5NLjAN+qgzBVUo/4+a1N0udpRpMQzx1
   8tLzeZppfhc1pynZI6BQ368+Kifed/stHqsOarcfZTDSOmN0+SnusMt09
   B4zxAZijuCCNDpLqdkJo5XU7HNpEsEtizmsmOW2hvGwmuRG+vGsYaJSfR
   C9KDUwswQMpzbK7uA8jeBXndvF/0zQDAlSIwDGC5bfh1T9HL0cXrio8O0
   kbnzQaDA6Ev0R4oU42jTxW4baiKDxycld4b+3Y4/Wrgk2swosvMPcivF3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322951557"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="322951557"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 14:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680434667"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="680434667"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 14:40:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkAri-000QpC-0l;
	Wed, 05 Apr 2023 21:40:26 +0000
Date: Thu, 6 Apr 2023 05:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc4-net-next-phy-leds 5/16] mdio-aspeed.c:undefined
 reference to `devm_mdiobus_alloc_size'
Message-ID: <202304060539.fH2z7LuF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc4-net-next-phy-leds
head:   e66f649f9df97b1307e234ef1fab1308d7fd3202
commit: 6eeed9d3def0efe303e276dbbcf54794bb4abab5 [5/16] net: phy: Add a binding for PHY LEDs
config: arm-randconfig-c041-20230403 (https://download.01.org/0day-ci/archive/20230406/202304060539.fH2z7LuF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/6eeed9d3def0efe303e276dbbcf54794bb4abab5
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc4-net-next-phy-leds
        git checkout 6eeed9d3def0efe303e276dbbcf54794bb4abab5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060539.fH2z7LuF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
   phy_device.c:(.text+0x202e): undefined reference to `devm_led_classdev_register_ext'
   arm-linux-gnueabi-ld: drivers/net/mdio/mdio-aspeed.o: in function `aspeed_mdio_probe':
>> mdio-aspeed.c:(.text+0x1e8): undefined reference to `devm_mdiobus_alloc_size'
   arm-linux-gnueabi-ld: drivers/net/mdio/mdio-mux-bcm6368.o: in function `bcm6368_mdiomux_probe':
>> mdio-mux-bcm6368.c:(.text+0xd6): undefined reference to `devm_mdiobus_alloc_size'
   arm-linux-gnueabi-ld: drivers/net/mdio/mdio-mux-bcm-iproc.o: in function `mdio_mux_iproc_probe':
>> mdio-mux-bcm-iproc.c:(.text+0x186): undefined reference to `devm_mdiobus_alloc_size'
   arm-linux-gnueabi-ld: drivers/net/ethernet/freescale/xgmac_mdio.o: in function `xgmac_mdio_probe':
   xgmac_mdio.c:(.text+0x20): undefined reference to `devm_mdiobus_alloc_size'
   arm-linux-gnueabi-ld: drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_mdio.o: in function `mlxbf_gige_mdio_probe':
>> mlxbf_gige_mdio.c:(.text+0x304): undefined reference to `devm_mdiobus_alloc_size'
   arm-linux-gnueabi-ld: drivers/net/ethernet/xilinx/ll_temac_mdio.o:ll_temac_mdio.c:(.text+0xee): more undefined references to `devm_mdiobus_alloc_size' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - LPC_ENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && (ARCH_LPC32XX [=n] || COMPILE_TEST [=y])
   - B44 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && SSB_POSSIBLE [=y] && HAS_DMA [=y]
   - BCMGENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (PTP_1588_CLOCK_OPTIONAL [=y] || !ARCH_BCM2835 [=n])
   - BGMAC_PLATFORM [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && (ARCH_BCM_IPROC [=n] || COMPILE_TEST [=y])
   - FSL_PQ_MDIO [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y]
   - FSL_XGMAC_MDIO [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && OF [=y]
   - GIANFAR [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && HAS_DMA [=y]
   - MLXBF_GIGE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MELLANOX [=y] && (ARM64 && ACPI || COMPILE_TEST [=y])
   - KS8851_MLL [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICREL [=y] && HAS_IOMEM [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - XILINX_EMACLITE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   - XILINX_LL_TEMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   Selected by [m]:
   - OWL_EMAC [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_ACTIONS [=y]
   - AMD_XGBE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI || PCI [=n]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]
   - BGMAC_BCMA [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && BCMA [=y] && BCMA_HOST_SOC [=y] && (BCM47XX || ARCH_BCM_5301X [=n] || COMPILE_TEST [=y])
   - SYSTEMPORT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (NET_DSA [=n] || !NET_DSA [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
