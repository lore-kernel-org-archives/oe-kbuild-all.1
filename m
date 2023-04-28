Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E1C2DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 03:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682652679; x=1714188679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6TL2+WJPgROFx+j0oJGfCI8U71IwXo25YdIx0Bp+rk=;
  b=YMliPlN+TtTE5ZDuUeyn7jF1JpDGtzj299zIKr0cZhEbFvX/skeRr3bB
   Ipw8te2fsibhIFePsW2jAjXflwGtgNGK+D+XmBWpzqxHD82+i8I5D3jk2
   tgItmi0FkngJEUtJzLIqZY3nAMXVVMzOdH/i4eKV6Ng3d2lxdmHa9VFUq
   HW7mt2Fa4Q+hxZfJPgSL/WR2HIVx4NOfOtIZ11IxxfNaN+hY9edIJn/vE
   lnsMThz23XcV5Kprkbt5OZAtwBdOr0cJ2W3BqAZ+Q3rIpqA9yiLKj3PXB
   fhZwDC8FAIATeIzNQpm3BgnV57y33iT5GN6HnNbHjOHrJSUZXpO52dUtX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346396045"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="346396045"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 20:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727383923"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="727383923"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 20:31:17 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEpI-00004b-1G;
	Fri, 28 Apr 2023 03:31:16 +0000
Date: Fri, 28 Apr 2023 11:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 53/57] drivers/rtc/rtc-isl12022.c:104:10: error:
 initializing 'const struct hwmon_channel_info **' with an expression of type
 'const struct hwmon_channel_info *const[2]' discards qualifiers
Message-ID: <202304281158.eGVSqzMM-lkp@intel.com>
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
commit: a176de9fffcb97ee885b2ade3dbb23dc9be33b29 [53/57] rtc: isl12022: constify pointers to hwmon_channel_info
config: hexagon-randconfig-r036-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281158.eGVSqzMM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=a176de9fffcb97ee885b2ade3dbb23dc9be33b29
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch --no-tags abelloni rtc-next
        git checkout a176de9fffcb97ee885b2ade3dbb23dc9be33b29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281158.eGVSqzMM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-isl12022.c:14:
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
   In file included from drivers/rtc/rtc-isl12022.c:14:
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
   In file included from drivers/rtc/rtc-isl12022.c:14:
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
>> drivers/rtc/rtc-isl12022.c:104:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[2]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = isl12022_hwmon_info,
                   ^~~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +104 drivers/rtc/rtc-isl12022.c

8d816c1eaa7525 Rasmus Villemoes 2022-11-04  101  
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  102  static const struct hwmon_chip_info isl12022_hwmon_chip_info = {
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  103  	.ops = &isl12022_hwmon_ops,
8d816c1eaa7525 Rasmus Villemoes 2022-11-04 @104  	.info = isl12022_hwmon_info,
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  105  };
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  106  

:::::: The code at line 104 was first introduced by commit
:::::: 8d816c1eaa752546fa3221f5027af0a667ff0c8f rtc: isl12022: add support for temperature sensor

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
