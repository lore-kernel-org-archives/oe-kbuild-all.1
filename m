Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F1D1078A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685199606; x=1716735606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IqCWaKPKTGGGtaOKH7p7CNNImP67xF5c12bN+RJjMU0=;
  b=j+9Y+UavAFMv5lsnHxIyAk1zh3IULcgY0hYO/DP4K2z7fZQuFaSMx6gN
   t9+S8sFsGEOamWBASnBxALHgdTa5UXZ8jbARTgnEdJi3fnBv7S+piFvzY
   76M5FM194dxdKSPHaeIZ5YW0hlnYWDiYc/EFWgHp3SgmIbKx7rI5ajqV9
   hJw8LqZRG6z3YudUKkd0QArS1rDDSMfgHujwgv7BAQ1K9zN4pIgrcZzrA
   Ap8WuanLf9/8JacKjNeok9TaupAn+uQh3lHurMmML4PV0dCiCw9wvy4hr
   KNoCCj8B38QmxS9PS6U25HK9n6vAPCSUnysoNR8zc87AT9umihmWqIxyE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="417889914"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="417889914"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 08:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="1035668717"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="1035668717"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 May 2023 08:00:05 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2vOm-000K14-1F;
	Sat, 27 May 2023 15:00:04 +0000
Date: Sat, 27 May 2023 22:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 14/48]
 sound/soc/soc-utils.c:250:34: warning: unused variable 'soc_dummy_ids'
Message-ID: <202305272237.8rXAlXzK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   f5c320386f9fa464312107b87c50c3c96e253459
commit: 8d36c4b6664d1b8db35e0e4f53c648c7ba464298 [14/48] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: s390-buildonly-randconfig-r002-20230526 (https://download.01.org/0day-ci/archive/20230527/202305272237.8rXAlXzK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/omap-audio/linux-audio/commit/8d36c4b6664d1b8db35e0e4f53c648c7ba464298
        git remote add omap-audio https://github.com/omap-audio/linux-audio
        git fetch --no-tags omap-audio peter/linux-next-wip
        git checkout 8d36c4b6664d1b8db35e0e4f53c648c7ba464298
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305272237.8rXAlXzK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/soc-utils.c:16:
   In file included from include/sound/soc.h:20:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from sound/soc/soc-utils.c:16:
   In file included from include/sound/soc.h:20:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from sound/soc/soc-utils.c:16:
   In file included from include/sound/soc.h:20:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> sound/soc/soc-utils.c:250:34: warning: unused variable 'soc_dummy_ids' [-Wunused-const-variable]
   static const struct of_device_id soc_dummy_ids[] = {
                                    ^
   13 warnings generated.


vim +/soc_dummy_ids +250 sound/soc/soc-utils.c

   249	
 > 250	static const struct of_device_id soc_dummy_ids[] = {
   251		{ .compatible = "linux,snd-soc-dummy", },
   252		{ }
   253	};
   254	MODULE_DEVICE_TABLE(of, soc_dummy_ids);
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
