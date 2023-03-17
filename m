Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2233E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679055021; x=1710591021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HMHLnY8JGCWk7cMImrvuWCj6ZAsnIpclFX8qo4tXUxk=;
  b=AvVIsMMpPKdjjlAHic/Y/hC/wnkzTiKDVKwsK3xrWqDUPIR+d7GGQajA
   FP9KHig4AT4l4F1LO1HtoFwPOsFLWr05FRvC4UXFbttOtGMxLXcnjSlPs
   hI0fgYpQd3jLvJnh/hN4OGYoWKIAd33XTgD5c9XyJtJCaAVaahdJ70s76
   opHZaAjnQuNXrT5mDCfgMdJhLmQZVS5jnyd0OKWFGiIGgX+/hgRb8eJP1
   pNfvIh8Pd3DatWucD6U0Hlfw9XsxWvK6/7itCO5DIza5RkyfGzX0VY8ej
   YMmEl7OpYdQBeSHWr1zzQpTYJVMQ/QdANQyjiewzA84XAaMLJItqaTism
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="322094104"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="322094104"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 05:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854425786"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="854425786"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 05:10:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd8uM-0009Ku-1C;
	Fri, 17 Mar 2023 12:10:06 +0000
Date: Fri, 17 Mar 2023 20:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v4 04/14] net: phy: Add a binding for PHY LEDs
Message-ID: <202303172025.V2ENgi2n-lkp@intel.com>
References: <20230317023125.486-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317023125.486-5-ansuelsmth@gmail.com>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3-rc2 next-20230317]
[cannot apply to net-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230317-103653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230317023125.486-5-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v4 04/14] net: phy: Add a binding for PHY LEDs
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230317/202303172025.V2ENgi2n-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/762837764b4e6fc001509c79a6548943996c6577
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230317-103653
        git checkout 762837764b4e6fc001509c79a6548943996c6577
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303172025.V2ENgi2n-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/net/phy/mdio_bus.o: in function `.L167':
   mdio_bus.c:(.text+0x7ac): undefined reference to `mdiobus_setup_mdiodev_from_board_info'
   riscv64-linux-ld: drivers/net/ethernet/realtek/r8169_main.o: in function `.L0 ':
   r8169_main.c:(.text+0x8836): undefined reference to `devm_mdiobus_alloc_size'
   riscv64-linux-ld: drivers/net/ethernet/realtek/r8169_main.o: in function `.L2087':
>> r8169_main.c:(.text+0x88ae): undefined reference to `__devm_mdiobus_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [n]: NETDEVICES [=y] && LEDS_CLASS [=n]
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - R8169 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_REALTEK [=y] && PCI [=y]
   WARNING: unmet direct dependencies detected for MDIO_BUS_MUX
   Depends on [n]: NETDEVICES [=y] && MDIO_DEVICE [=n] && MDIO_BUS [=n] && OF_MDIO [=n]
   Selected by [m]:
   - DWMAC_SUN8I [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_SUNXI [=y] || COMPILE_TEST [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
