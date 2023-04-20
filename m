Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7FB525C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681983964; x=1713519964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMwWMY8GdIyD4pnGCdmGLDf3Ns6Pj79DPgae2/+J6oY=;
  b=hmLNVI4Bph6mo6mWh5hyXzziwoduKGwquOvHiINyDIcd9hNhP9gZXVQx
   1nRkXVq/W/jxQNYLoUy3QLfWuClnqzFZYPTK/b4nU+3KtIMqaWir7LGMx
   iJRWWxSom1lWaO8rnKgBokdRKOr98Q757mI885j+1csJ5aTrSzewwdmkt
   lFvegZDyqj3mLKHJvhGdiwsxSIU8wc8P6Yd0+7jxeXGnLigQqfmeuB7gD
   vC+tFsuGBB1J+3jEyN+eDsK3sB1NYYhLo+EvvNY9Ofcf/8s6YglzDuqC1
   EZO41F3AT4juE2TetlI6JEcsdMp7fL2IG9TpcNFLUTxEq1erD4RHDfMlp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345694543"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="345694543"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 02:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835666055"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="835666055"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2023 02:45:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppQr9-000fhC-05;
	Thu, 20 Apr 2023 09:45:35 +0000
Date: Thu, 20 Apr 2023 17:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [linux-next:master 12854/13075] phy_device.c:undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202304201727.CXk6U0te-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cdbc01c40e34c57697f8934f2727a88551696be
commit: 01e5b728e9e43ae444e0369695a5f72209906464 [12854/13075] net: phy: Add a binding for PHY LEDs
config: csky-randconfig-r001-20230416 (https://download.01.org/0day-ci/archive/20230420/202304201727.CXk6U0te-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=01e5b728e9e43ae444e0369695a5f72209906464
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 01e5b728e9e43ae444e0369695a5f72209906464
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201727.CXk6U0te-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
>> phy_device.c:(.text+0x2520): undefined reference to `devm_led_classdev_register_ext'
   csky-linux-ld: drivers/net/phy/phy_device.o: in function `phy_driver_is_genphy':
   phy_device.c:(.text+0x25b8): undefined reference to `devm_led_classdev_register_ext'
   csky-linux-ld: drivers/net/mdio/mdio-mux-bcm-iproc.o: in function `mdio_mux_iproc_probe':
>> mdio-mux-bcm-iproc.c:(.text+0x9a): undefined reference to `devm_mdiobus_alloc_size'
>> csky-linux-ld: mdio-mux-bcm-iproc.c:(.text+0x1bc): undefined reference to `devm_mdiobus_alloc_size'
   csky-linux-ld: drivers/net/ethernet/microchip/lan743x_main.o: in function `lan743x_pcidev_probe':
>> lan743x_main.c:(.text+0x2ee6): undefined reference to `devm_mdiobus_alloc_size'
>> csky-linux-ld: lan743x_main.c:(.text+0x3014): undefined reference to `devm_mdiobus_alloc_size'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - ALTERA_TSE [=y] && NETDEVICES [=y] && ETHERNET [=y] && HAS_DMA [=y]
   - DNET [=y] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y]
   - LPC_ENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && (ARCH_LPC32XX || COMPILE_TEST [=y])
   - B44 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && SSB_POSSIBLE [=y] && HAS_DMA [=y]
   - BCMGENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (PTP_1588_CLOCK_OPTIONAL [=y] || !ARCH_BCM2835)
   - TIGON3 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - LAN743X [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICROCHIP [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - RAVB [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_RENESAS [=y] && (ARCH_RENESAS || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]
   Selected by [m]:
   - ARC_EMAC_CORE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_ARC [=y] && (ARC || ARCH_ROCKCHIP || COMPILE_TEST [=y])
   - SYSTEMPORT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (NET_DSA [=m] || !NET_DSA [=m])
   - SH_ETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_RENESAS [=y] && (ARCH_RENESAS || SUPERH || COMPILE_TEST [=y])
   - XILINX_EMACLITE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   - USB_LAN78XX [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m]
   - USB_NET_AX88179_178A [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]
   - USB_NET_SMSC95XX [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
