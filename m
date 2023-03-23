Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62219C959
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 20:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679602004; x=1711138004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gm7iUSOc5MiuZ0Moa9V18KwgWkgFGWXSkTkcT8ZInr8=;
  b=leL0zdHCQebHZBK2v3d9G07PUSmSAEBnUqrXxGCbeuB9MrPu2uZOA9PU
   tvJkHScJebCDeVTgQ/wuI2ckfiB+z9nQkg9JnsKoAf/nhxTE8oBr7NakG
   h+0bNzfnjIhPfB/A/h5LgguBjjw19tg7XBgfwyza0woqjOLI6ex7e0HU2
   PBYbcxx26LiUqo+u3FIeUqLYEhhD3xuvB5Np8DjfZQhiHXDrlTpdLqmc3
   IaUKBWDxH9Q+yWyWXrQuSkHH5lilH306CPR7O6n1++KRl2kBXsMVCE9pU
   62f9zHvNl+FLnSjKHVtxKiOHmOvqf8zVhcmtoAZg8MF2fRao2pYRqlWmW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323472275"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="323472275"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 13:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684885257"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="684885257"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 13:06:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfRCq-000EfS-2e;
	Thu, 23 Mar 2023 20:06:40 +0000
Date: Fri, 24 Mar 2023 04:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Michael Ellerman <mpe@ellerman.id.au>
Subject: [linuxppc:next-test 24/24]
 arch/powerpc/platforms/embedded6xx/ls_uart.c:128:15: error: implicit
 declaration of function 'of_address_to_resource'
Message-ID: <202303240411.Tq2tZKiG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   c827c932c00ccd231a73da9816a51ce2c2b557d6
commit: c827c932c00ccd231a73da9816a51ce2c2b557d6 [24/24] powerpc: Use of_address_to_resource()
config: powerpc-linkstation_defconfig (https://download.01.org/0day-ci/archive/20230324/202303240411.Tq2tZKiG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/linuxppc/linux/commit/c827c932c00ccd231a73da9816a51ce2c2b557d6
        git remote add linuxppc https://github.com/linuxppc/linux
        git fetch --no-tags linuxppc next-test
        git checkout c827c932c00ccd231a73da9816a51ce2c2b557d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240411.Tq2tZKiG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/embedded6xx/ls_uart.c:58:6: error: no previous prototype for 'avr_uart_configure' [-Werror=missing-prototypes]
      58 | void avr_uart_configure(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/embedded6xx/ls_uart.c:81:6: error: no previous prototype for 'avr_uart_send' [-Werror=missing-prototypes]
      81 | void avr_uart_send(const char c)
         |      ^~~~~~~~~~~~~
   arch/powerpc/platforms/embedded6xx/ls_uart.c: In function 'ls_uarts_init':
>> arch/powerpc/platforms/embedded6xx/ls_uart.c:128:15: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
     128 |         ret = of_address_to_resource(avr, 0, &res);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PPC_INDIRECT_PCI
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - MPC10X_BRIDGE [=y]


vim +/of_address_to_resource +128 arch/powerpc/platforms/embedded6xx/ls_uart.c

   113	
   114	static int __init ls_uarts_init(void)
   115	{
   116		struct device_node *avr;
   117		struct resource res;
   118		int len, ret;
   119	
   120		avr = of_find_node_by_path("/soc10x/serial@80004500");
   121		if (!avr)
   122			return -EINVAL;
   123	
   124		avr_clock = *(u32*)of_get_property(avr, "clock-frequency", &len);
   125		if (!avr_clock)
   126			return -EINVAL;
   127	
 > 128		ret = of_address_to_resource(avr, 0, &res);
   129		if (ret)
   130			return ret;
   131	
   132		of_node_put(avr);
   133	
   134		avr_addr = ioremap(res.start, 32);
   135		if (!avr_addr)
   136			return -EFAULT;
   137	
   138		ls_uart_init();
   139	
   140		INIT_WORK(&wd_work, wd_stop);
   141		schedule_work(&wd_work);
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
