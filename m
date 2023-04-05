Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5B879CC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 21:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680728907; x=1712264907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOsWoP4L1CZpFRDSe0r8HkSQs3Wjq74RuHblVPqDOhM=;
  b=XR92AyeC07h5qZXi6VSZePiY8i1i48lRv9fQH5hg/ZBNRDgMtxnZin2+
   WoSB7/MtrnVwCYnk4v/xOW8tSNH3cFJ9dqBIGWTO+Ya1GR4evjWbmnB01
   YORnvXsG8rQ+aRGGGSltzXj0GI9k4fvmKKemcIoSjNw+74fvcs5dvsJft
   4mbpm+zLD5v9uxxcSDWD9moJ8S81+6zMZjxr+br46UROo3PTLKOpp5oHA
   n4rpPurZcffA7rTe3Z6kpR56lE0CTJAM4stZ8GDPsS5V7ca27ug/iWBWb
   HIn9H342hR9mE+ISRYAfu+UQmRE656PoJmSc+SAy7IruLx6JxAy0H7FuE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322942796"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="322942796"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 14:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751396763"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="751396763"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 14:08:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkAMi-000Qnw-21;
	Wed, 05 Apr 2023 21:08:24 +0000
Date: Thu, 6 Apr 2023 05:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc4-net-next-phy-leds 5/16]
 phy_device.c:(.rodata.cst4+0x240): undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202304060506.WByOWCGE-lkp@intel.com>
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
config: parisc-buildonly-randconfig-r001-20230403 (https://download.01.org/0day-ci/archive/20230406/202304060506.WByOWCGE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/6eeed9d3def0efe303e276dbbcf54794bb4abab5
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc4-net-next-phy-leds
        git checkout 6eeed9d3def0efe303e276dbbcf54794bb4abab5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060506.WByOWCGE-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: hppa-linux-ld: DWARF error: could not find abbrev number 45
   drivers/net/phy/phy_device.o: in function `.LC343':
>> phy_device.c:(.rodata.cst4+0x240): undefined reference to `devm_led_classdev_register_ext'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - ALTERA_TSE [=y] && NETDEVICES [=y] && ETHERNET [=y] && HAS_DMA [=y]
   - LPC_ENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && (ARCH_LPC32XX || COMPILE_TEST [=y])
   - ARC_EMAC_CORE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_ARC [=y] && (ARC || ARCH_ROCKCHIP || COMPILE_TEST [=y])
   - BGMAC_PLATFORM [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && (ARCH_BCM_IPROC || COMPILE_TEST [=y])
   - FEC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && (M523x || M527x || M5272 || M528x || M520x || M532x || ARCH_MXC || ARCH_S32 || SOC_IMX28 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]
   - TI_DAVINCI_MDIO [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_TI [=y] && (ARCH_DAVINCI || ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST [=y])
   - OCTEON_ETHERNET [=y] && STAGING [=y] && (CAVIUM_OCTEON_SOC || COMPILE_TEST [=y]) && NETDEVICES [=y]
   Selected by [m]:
   - NET_XGENE [=m] && NETDEVICES [=y] && ETHERNET [=y] && (ARCH_XGENE || COMPILE_TEST [=y])
   - ETHOC [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - FTGMAC100 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FARADAY [=y] && (ARM || COMPILE_TEST [=y]) && (!64BIT [=n] || BROKEN [=n])
   - FSL_PQ_MDIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y]
   - FSL_XGMAC_MDIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && OF [=y]
   - GIANFAR [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && HAS_DMA [=y]
   - MLXBF_GIGE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MELLANOX [=y] && (ARM64 && ACPI || COMPILE_TEST [=y])
   - QCOM_EMAC [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_QUALCOMM [=y] && HAS_DMA [=y] && HAS_IOMEM [=y]
   - SH_ETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_RENESAS [=y] && (ARCH_RENESAS || SUPERH || COMPILE_TEST [=y])
   - RAVB [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_RENESAS [=y] && (ARCH_RENESAS || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]
   - SMSC911X [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_SMSC [=y] && HAS_IOMEM [=y]
   - SNI_AVE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_SOCIONEXT [=y] && (ARCH_UNIPHIER || COMPILE_TEST [=y]) && OF [=y] && HAS_IOMEM [=y]
   - TI_DAVINCI_EMAC [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_TI [=y] && (ARM && (ARCH_DAVINCI || ARCH_OMAP3) || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
