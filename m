Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1D8492
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681996972; x=1713532972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6CpjEuLWoS5j7Cw5T1rxpmouzQ3tfjLlnMCdcSDHBvs=;
  b=fDMG7+MNbbC/VFyMJXBnMHlU4D6tRb1K8Ls2//cGlA7C9wbO4PQesypp
   /zDhVTZcUs2mk0ZgJu8EkRarSxNiopssQJyLlVPnx1L41c/NftSdAV0Mj
   iQz1fiXtIK2trdcmg6yH1mwrS5rvYkusoOTgBjpUUkiL5sXNONl7OuCVJ
   Lx+BDXQnJDIe4ztGz/Kp3vNlyteaIVpslBjPWLLBOAu4KQ/hRsurENwey
   RYcqV7WEEN9JpSR7F805LG7lXJQb0buR0Nmgehf8HkM+kns5quxSQitOK
   n99osE4r2TbTts/l9mEzn1MTF8hE9u4eN7OPYol3yB+8uL5lmfr2WBPV2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325337582"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="325337582"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 06:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021578462"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="1021578462"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 06:22:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppUFF-000frC-22;
	Thu, 20 Apr 2023 13:22:41 +0000
Date: Thu, 20 Apr 2023 21:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [linux-next:master 12854/13075] arc-elf-ld: phy_device.c:undefined
 reference to `devm_led_classdev_register_ext'
Message-ID: <202304202144.jTxuteix-lkp@intel.com>
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
config: arc-randconfig-r025-20230420 (https://download.01.org/0day-ci/archive/20230420/202304202144.jTxuteix-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=01e5b728e9e43ae444e0369695a5f72209906464
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 01e5b728e9e43ae444e0369695a5f72209906464
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304202144.jTxuteix-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 14425
   drivers/net/phy/phy_device.o: in function `phy_probe':
   phy_device.c:(.text+0x3b96): undefined reference to `devm_led_classdev_register_ext'
>> arc-elf-ld: phy_device.c:(.text+0x3b96): undefined reference to `devm_led_classdev_register_ext'
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 75
   drivers/net/phy/xilinx_gmii2rgmii.o: in function `xgmiitorgmii_probe':
>> xilinx_gmii2rgmii.c:(.text+0x54): undefined reference to `of_phy_find_device'
>> arc-elf-ld: xilinx_gmii2rgmii.c:(.text+0x54): undefined reference to `of_phy_find_device'
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 8
   drivers/net/ethernet/asix/ax88796c_main.o: in function `ax88796c_probe':
>> ax88796c_main.c:(.text+0xb56): undefined reference to `devm_mdiobus_alloc_size'
>> arc-elf-ld: ax88796c_main.c:(.text+0xb56): undefined reference to `devm_mdiobus_alloc_size'
>> arc-elf-ld: ax88796c_main.c:(.text+0xbec): undefined reference to `__devm_mdiobus_register'
>> arc-elf-ld: ax88796c_main.c:(.text+0xbec): undefined reference to `__devm_mdiobus_register'
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 210923
   drivers/net/ethernet/broadcom/bcmsysport.o: in function `bcm_sysport_remove':
>> bcmsysport.c:(.text+0x428): undefined reference to `of_phy_is_fixed_link'
>> arc-elf-ld: bcmsysport.c:(.text+0x428): undefined reference to `of_phy_is_fixed_link'
>> arc-elf-ld: bcmsysport.c:(.text+0x436): undefined reference to `of_phy_deregister_fixed_link'
>> arc-elf-ld: bcmsysport.c:(.text+0x436): undefined reference to `of_phy_deregister_fixed_link'
   arc-elf-ld: drivers/net/ethernet/broadcom/bcmsysport.o: in function `bcm_sysport_probe':
   bcmsysport.c:(.text+0x1900): undefined reference to `of_phy_is_fixed_link'
   arc-elf-ld: bcmsysport.c:(.text+0x1900): undefined reference to `of_phy_is_fixed_link'
>> arc-elf-ld: bcmsysport.c:(.text+0x1908): undefined reference to `of_phy_register_fixed_link'
>> arc-elf-ld: bcmsysport.c:(.text+0x1908): undefined reference to `of_phy_register_fixed_link'
   arc-elf-ld: bcmsysport.c:(.text+0x1afc): undefined reference to `of_phy_is_fixed_link'
   arc-elf-ld: bcmsysport.c:(.text+0x1afc): undefined reference to `of_phy_is_fixed_link'
   arc-elf-ld: bcmsysport.c:(.text+0x1b04): undefined reference to `of_phy_deregister_fixed_link'
   arc-elf-ld: bcmsysport.c:(.text+0x1b04): undefined reference to `of_phy_deregister_fixed_link'
   arc-elf-ld: drivers/net/ethernet/broadcom/bcmsysport.o: in function `bcm_sysport_open':
>> bcmsysport.c:(.text+0x3518): undefined reference to `of_phy_connect'
>> arc-elf-ld: bcmsysport.c:(.text+0x3518): undefined reference to `of_phy_connect'
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 112
   drivers/net/ethernet/xilinx/ll_temac_main.o: in function `temac_open':
>> ll_temac_main.c:(.text+0x2874): undefined reference to `of_phy_connect'
>> arc-elf-ld: ll_temac_main.c:(.text+0x2874): undefined reference to `of_phy_connect'
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 8460
   drivers/net/ethernet/xilinx/xilinx_axienet_main.o: in function `axienet_probe':
>> xilinx_axienet_main.c:(.text+0x1de2): undefined reference to `of_mdio_find_device'
>> arc-elf-ld: xilinx_axienet_main.c:(.text+0x1de2): undefined reference to `of_mdio_find_device'
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 14
   drivers/net/ethernet/xilinx/ll_temac_mdio.o: in function `temac_mdio_setup':
>> ll_temac_mdio.c:(.text+0x198): undefined reference to `devm_mdiobus_alloc_size'
   arc-elf-ld: ll_temac_mdio.c:(.text+0x198): undefined reference to `devm_mdiobus_alloc_size'
   arc-elf-ld: ll_temac_mdio.c:(.text+0x1f8): undefined reference to `__of_mdiobus_register'
   arc-elf-ld: ll_temac_mdio.c:(.text+0x1f8): undefined reference to `__of_mdiobus_register'
   arc-elf-ld: ll_temac_mdio.c:(.text+0x26c): undefined reference to `devm_mdiobus_alloc_size'
   arc-elf-ld: ll_temac_mdio.c:(.text+0x26c): undefined reference to `devm_mdiobus_alloc_size'
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 8560
   drivers/net/ethernet/xilinx/xilinx_axienet_mdio.o: in function `axienet_mdio_setup':
   xilinx_axienet_mdio.c:(.text+0x4c8): undefined reference to `__of_mdiobus_register'
   arc-elf-ld: xilinx_axienet_mdio.c:(.text+0x4c8): undefined reference to `__of_mdiobus_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - ETHOC [=y] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - SPI_AX88796C [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_ASIX [=y] && SPI [=y] && GPIOLIB [=y]
   - SYSTEMPORT [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (NET_DSA [=n] || !NET_DSA [=n])
   - XILINX_LL_TEMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   Selected by [m]:
   - ALTERA_TSE [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_DMA [=y]
   - DNET [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y]
   - B44 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && SSB_POSSIBLE [=y] && HAS_DMA [=y]
   - BCMGENET [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (PTP_1588_CLOCK_OPTIONAL [=y] || !ARCH_BCM2835)
   - XILINX_EMACLITE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   - USB_LAN78XX [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m]
   - USB_NET_AX88179_178A [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]
   - USB_NET_SMSC95XX [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
