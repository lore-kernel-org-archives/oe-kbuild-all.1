Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9A8835
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680191851; x=1711727851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YFWHElrgrHRErzvgxdzX66WqO0HSnwiYda5w9Wd6llc=;
  b=AWVZs6nbMvVWYCoRb6IVNuvwLaTgOzhixjjm22EzspMyfbOAFEJfCkZx
   FY+KC7V+hOq/6z/pQKjHGpdOs+LobYuwVBMTDZRvzoiifAlTOCNVDOPRd
   5MX0Z9eaVQ4qKUIyBovQg+sV5njALaXxm9jWOioS4/+BNpAC80omo9nGl
   j7RlXOPr8cMeotthWspm28Y8mmy0tbYHok6s+kuPHo96hloRah0a/5ajm
   bSKWlw3rKNDy6elIs58RM8PBRDYdhmqvWaVbZxbXA9cI8sMdFVjEy5Gs0
   9uMgli6jxH1QgpjlZPEvwX3I/fJ1ipShnt4O3Sl7OA/MP50MtRTEZl3Rh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="320861250"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="320861250"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 08:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="930775186"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="930775186"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2023 08:57:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phue3-000KyA-14;
	Thu, 30 Mar 2023 15:56:59 +0000
Date: Thu, 30 Mar 2023 23:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v6 05/16] net: phy: Add a binding for PHY LEDs
Message-ID: <202303302338.ouKqYFtt-lkp@intel.com>
References: <20230327141031.11904-6-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327141031.11904-6-ansuelsmth@gmail.com>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230327-221554
patch link:    https://lore.kernel.org/r/20230327141031.11904-6-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v6 05/16] net: phy: Add a binding for PHY LEDs
config: mips-loongson3_defconfig (https://download.01.org/0day-ci/archive/20230330/202303302338.ouKqYFtt-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c92f680d5120a9a315ef75d26c0233aa11091a20
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230327-221554
        git checkout c92f680d5120a9a315ef75d26c0233aa11091a20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302338.ouKqYFtt-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
   phy_device.c:(.text+0x43d0): undefined reference to `devm_led_classdev_register_ext'
   mips64el-linux-ld: drivers/net/ethernet/intel/ixgbe/ixgbe_phy.o: in function `ixgbe_mii_bus_init':
>> ixgbe_phy.c:(.text+0x2948): undefined reference to `devm_mdiobus_alloc_size'
   mips64el-linux-ld: drivers/net/ethernet/realtek/r8169_main.o: in function `rtl_init_one':
>> r8169_main.c:(.text+0x987c): undefined reference to `devm_mdiobus_alloc_size'
>> mips64el-linux-ld: r8169_main.c:(.text+0x98f8): undefined reference to `__devm_mdiobus_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - IXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_INTEL [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - R8169 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_REALTEK [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
