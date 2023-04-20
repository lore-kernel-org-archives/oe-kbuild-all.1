Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95428C0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682005006; x=1713541006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGR0XH8bG4aXldMFQya0es6SZF9zobxu7py5QoZxLOw=;
  b=HQ7xm0eYEPt0s1ASwZkguBLyyy3QYPqrWEUy1emhajytVTfYk53cEKWp
   2oz8S2j63759ARP7HSgpai1DbNCdaUTusbXZhqOxGehkLqlnt6qDNn/QY
   KrPQVnoqIbONBPcpwNSEy7A/NbqCL+pz5wdRXQpY8KHDH7YbfakRLOWKR
   E1D2xW7RwOxxvslaPdHeWP+4WSD1Fhd2NkAtQcZeSgzmEvWclsjvKuzMV
   U2h3UNznYUodZ+eoh6meb1+RBfqdIMVHVb/s23sUrb/KecTuY3GuajoDz
   tKZuVLPfZz1GdMNM8I4jrzYw8uvLOacSHDayj4ckiB8z6wttOSU9DeF1h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348533238"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="348533238"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 08:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756537427"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="756537427"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2023 08:36:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppWKx-000fuC-2g;
	Thu, 20 Apr 2023 15:36:43 +0000
Date: Thu, 20 Apr 2023 23:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [linux-next:master 12857/13075] csky-linux-ld:
 phy_device.c:undefined reference to `devm_led_classdev_register_ext'
Message-ID: <202304202338.fmXJzPb2-lkp@intel.com>
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
commit: 4e901018432e38eab35d2a352661ce4727795be1 [12857/13075] net: phy: phy_device: Call into the PHY driver to set LED blinking
config: csky-randconfig-r001-20230416 (https://download.01.org/0day-ci/archive/20230420/202304202338.fmXJzPb2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4e901018432e38eab35d2a352661ce4727795be1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4e901018432e38eab35d2a352661ce4727795be1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304202338.fmXJzPb2-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/net/phy/phy_device.o: in function `of_phy_leds.constprop.0':
   phy_device.c:(.text+0x2416): undefined reference to `devm_led_classdev_register_ext'
>> csky-linux-ld: phy_device.c:(.text+0x2494): undefined reference to `devm_led_classdev_register_ext'
   csky-linux-ld: drivers/net/mdio/mdio-mux-bcm-iproc.o: in function `mdio_mux_iproc_probe':
   mdio-mux-bcm-iproc.c:(.text+0x9a): undefined reference to `devm_mdiobus_alloc_size'
   csky-linux-ld: mdio-mux-bcm-iproc.c:(.text+0x1bc): undefined reference to `devm_mdiobus_alloc_size'
   csky-linux-ld: drivers/net/ethernet/microchip/lan743x_main.o: in function `lan743x_pcidev_probe':
   lan743x_main.c:(.text+0x2ee6): undefined reference to `devm_mdiobus_alloc_size'
   csky-linux-ld: lan743x_main.c:(.text+0x3014): undefined reference to `devm_mdiobus_alloc_size'

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
