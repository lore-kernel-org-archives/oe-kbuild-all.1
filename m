Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024762CA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681497766; x=1713033766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDxUjc5d8Fb39dR24aqH2sRSZs8iV9zQhNNdYpHWE64=;
  b=HSwSSr+Op4+6W57bI8cZXydSVW2NVPcOw+AkOpcYI/09Z/+pryPA6DoV
   kJ89Ein8yygcaAZAuUTFncwRJkCTgBr0SQtGPub7zJ61NKBhXokr96j8Z
   BI6Rldo6s57vWErMmQQkX8NKVTE7H8gLs4FOLzi6KyeVP1iG/7uYTYuzT
   CioVzXwhv0ubwfAiJVhyPC1tED89Q2oiJtuAVtIRRTSv0ETXd2BaTUysC
   BxLLon5Xuore6OLlsuGTjoBqFJOSpnDb0Fj269J20ZnG9+orjOJEEIhqs
   3l3hUALrB5nIP2bLtb0ZT66cQLhPq5Ma9d1Df4q0qiySKxRGGQIqvRY9H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344542222"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="344542222"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 11:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="813998749"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="813998749"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Apr 2023 11:42:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnONe-000ZoJ-2N;
	Fri, 14 Apr 2023 18:42:42 +0000
Date: Sat, 15 Apr 2023 02:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc2-net-next-phy-leds 5/16] arceb-elf-ld:
 drivers/net/phy/phy_device.c:3026: undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202304150220.D121ZtCP-lkp@intel.com>
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
config: arc-randconfig-r014-20230409 (https://download.01.org/0day-ci/archive/20230415/202304150220.D121ZtCP-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/4569c1dde9a66ee4688e546e2b03f693e2e99fb2
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-phy-leds
        git checkout 4569c1dde9a66ee4688e546e2b03f693e2e99fb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150220.D121ZtCP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/net/phy/phy_device.o: in function `of_phy_led':
   drivers/net/phy/phy_device.c:3026: undefined reference to `devm_led_classdev_register_ext'
>> arceb-elf-ld: drivers/net/phy/phy_device.c:3026: undefined reference to `devm_led_classdev_register_ext'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - ARC_EMAC_CORE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_ARC [=y] && (ARC [=y] || ARCH_ROCKCHIP || COMPILE_TEST [=y])
   - BCMGENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && HAS_IOMEM [=y] && (PTP_1588_CLOCK_OPTIONAL [=m] || !ARCH_BCM2835)
   - USB_LAN78XX [=y] && NETDEVICES [=y] && USB_NET_DRIVERS [=y]
   Selected by [m]:
   - PHYLINK [=m] && NETDEVICES [=y]
   - DNET [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y]
   - ETHOC [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - B44 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && SSB_POSSIBLE [=y] && HAS_DMA [=y]
   - SXGBE_ETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_SAMSUNG [=y] && HAS_IOMEM [=y] && HAS_DMA [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   - XILINX_LL_TEMAC [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
