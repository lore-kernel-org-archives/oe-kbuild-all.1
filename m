Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359F33C1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675618047; x=1707154047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCa+B3J2YFjrjFp9Hy/YdZ45HxtxWOxJTvECPEnMxa8=;
  b=KM7c6ITUU2EP1ekMipEW6lIajGoS8LsA9XrcMxIu7foqu2c7BX9AhKjc
   Q7GeBlrId/377tTxU0eEHkp8+09kB1WarCf68qCSCqrUS1MJac7SxQzST
   YpLKHfsGlyFc96qAJVgpLZ5OWxyK7vfdRITtuPUNbjPP58jjxFZqOOaBI
   McXxHOfg8vh/6Bbr398t/JnsyYRpfUfTru/fQKCPGZ30tC3i4Ww0TnY1S
   QEqAm+y1zzJlfe7/cAHEKMZL4i/ITylB/gfOBxFhZNk8iTN+1xBOvkbkJ
   jgjFCoSX2B9vq57aH+085ERgXi0tYHaUK1lVck25JO3Z2eeyDwPqNgcsr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393666165"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="393666165"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 09:27:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790225908"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="790225908"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Feb 2023 09:27:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOinU-00027o-3D;
	Sun, 05 Feb 2023 17:27:24 +0000
Date: Mon, 6 Feb 2023 01:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 12694/20208] include/linux/phy_fixed.h:38:20:
 warning: no previous prototype for function 'fwnode_fixed_phy_register'
Message-ID: <202302060130.rtwtk2tE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Camelia,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 9afbdf3713a9cdf15eece57bfc97d8beb62af0ae [12694/20208] net: phy: fixed_phy: add fixed PHY ACPI support
config: mips-buildonly-randconfig-r006-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060130.rtwtk2tE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/9afbdf3713a9cdf15eece57bfc97d8beb62af0ae
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 9afbdf3713a9cdf15eece57bfc97d8beb62af0ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/ar7/ drivers/clk/imx/ drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/mips/ar7/platform.c:22:
>> include/linux/phy_fixed.h:38:20: warning: no previous prototype for function 'fwnode_fixed_phy_register' [-Wmissing-prototypes]
   struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
                      ^
   include/linux/phy_fixed.h:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
   ^
   static 
   1 warning generated.


vim +/fwnode_fixed_phy_register +38 include/linux/phy_fixed.h

    15	
    16	#if IS_ENABLED(CONFIG_FIXED_PHY)
    17	extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
    18	extern int fixed_phy_add(unsigned int irq, int phy_id,
    19				 struct fixed_phy_status *status);
    20	extern struct phy_device *fixed_phy_register(unsigned int irq,
    21						     struct fixed_phy_status *status,
    22						     struct device_node *np);
    23	
    24	extern struct phy_device *
    25	fixed_phy_register_with_gpiod(unsigned int irq,
    26				      struct fixed_phy_status *status,
    27				      struct gpio_desc *gpiod);
    28	
    29	extern void fixed_phy_unregister(struct phy_device *phydev);
    30	extern int fixed_phy_set_link_update(struct phy_device *phydev,
    31				int (*link_update)(struct net_device *,
    32						   struct fixed_phy_status *));
    33	
    34	struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
    35						     struct fixed_phy_status *status);
    36	
    37	#else
  > 38	struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
    39						     struct fixed_phy_status *status)
    40	{
    41		return ERR_PTR(-ENODEV);
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
