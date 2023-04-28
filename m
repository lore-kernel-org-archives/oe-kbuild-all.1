Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A617D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 04:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682657016; x=1714193016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osmo6xYyodsnf6hzGd5QGTIcVWOo+sdxHenXm8rlt2Q=;
  b=i9KTU/BDzIofbklKTDNr58H+csxrbacmb/0D07h9TbMxVJvveOww1WSO
   yVnXVBO78VfxXCUT80OlT82wv9t/FMGnoUcBvCsgkxjS+sMeDrelyIOd5
   djkBajr7WT0nrgeQG8ihNk9jPpZIAR41nvwFE58x3qrrHGze+stoP4sYc
   lc4M59wofYDzV4DZdr5PVKBRLQ8MuRVfOZFK2PiJZayabGLxZmkMvJb8C
   ye+oA6PRbcykQy7cxeW1gmgO4MkcMCaLswPti0hjNSUMbnHy8rXNu8GjX
   LhKQIQLq1LYb+RDlm9Zm+6iqF8OP/oFFZvBYWaygnxDidaExhURUE/mzO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="375640736"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="375640736"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 21:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727395541"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="727395541"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 21:43:18 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psFwz-00007J-35;
	Fri, 28 Apr 2023 04:43:17 +0000
Date: Fri, 28 Apr 2023 12:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 54/57] drivers/rtc/rtc-rv3032.c:858:10: error:
 initializing 'const struct hwmon_channel_info **' with an expression of type
 'const struct hwmon_channel_info *const[3]' discards qualifiers
Message-ID: <202304281211.Y9IgScdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   2c1afd03f007ce89de38d7ca355f05330c6038f0
commit: eaa9cec95de9405ee7400e8888e6d3d42173df28 [54/57] rtc: rv3032: constify pointers to hwmon_channel_info
config: hexagon-randconfig-r036-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281211.Y9IgScdC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=eaa9cec95de9405ee7400e8888e6d3d42173df28
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch --no-tags abelloni rtc-next
        git checkout eaa9cec95de9405ee7400e8888e6d3d42173df28
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281211.Y9IgScdC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-rv3032.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/rtc/rtc-rv3032.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/rtc/rtc-rv3032.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/rtc/rtc-rv3032.c:858:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[3]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = rv3032_hwmon_info,
                   ^~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +858 drivers/rtc/rtc-rv3032.c

2eeaa532accab8 Alexandre Belloni 2020-10-13  855  
2eeaa532accab8 Alexandre Belloni 2020-10-13  856  static const struct hwmon_chip_info rv3032_hwmon_chip_info = {
2eeaa532accab8 Alexandre Belloni 2020-10-13  857  	.ops = &rv3032_hwmon_hwmon_ops,
2eeaa532accab8 Alexandre Belloni 2020-10-13 @858  	.info = rv3032_hwmon_info,
2eeaa532accab8 Alexandre Belloni 2020-10-13  859  };
2eeaa532accab8 Alexandre Belloni 2020-10-13  860  

:::::: The code at line 858 was first introduced by commit
:::::: 2eeaa532accab8810ca9fe21f52d149713561235 rtc: rv3032: Add a driver for Microcrystal RV-3032

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
