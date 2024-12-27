Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07177F10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318131; cv=none; b=UxuRs5rR2so/vG4ZikvIWufmghDrC/4C78T8M1cNPQfPwDndqCBzz6ZfR6d05hLjQfbNpr/XmrxrL1gv14LqjNXDPstGRTdJhiDJfPuVwhDcCu834P2JuhqaBmedg2cNLZ9CmTN1R3+k3prs7vZRK18doztXsp0eO6l3da64AJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318131; c=relaxed/simple;
	bh=pB2Bk1NmpLeFw8qb+KUb8C2gWknT4dWVQmmeFRXKvF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Up73994yPzwLyZt2ZJy1Gz585smVWmi8WrldO3C/PyLYspr799+AIL4nBrF8/hFvIWjVstzCaZ0jH6rlMwd741fjo+BgVcOYV7JcWdPLSIJJsOhYYppw/BANJkXdlGZbyOFhnlEw+FSNtKtUhnwNHSaBsaANVGliK/zvQQkQH9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFU1zcES; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFU1zcES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735318128; x=1766854128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pB2Bk1NmpLeFw8qb+KUb8C2gWknT4dWVQmmeFRXKvF8=;
  b=eFU1zcESxFjpOceploUqGpUokpXPZuD5ZIw5VNKva5PhjfhUzJghXdvG
   oRIJLXYpIsaZ9t7L1AvqDJULPMZMJyxEV9GQ2NFFE0B4umw7XmVx4Th7S
   47dLUaI/0kFJFEe4vsdfWNcLXcs9+0QSnmhwKodBj50pjPXuGoo4GRQSC
   3sp0mT6gS+MiowW3zQzEo3PKH9pfF0Exeg9yC+hXEPJhABE0CzYllSMAz
   ZWD6oesMypK77Y6wKgL1Xu3hHOhajbNrdg+HVXMTkMU9fE0mtm7T4d3p0
   Pyj1OqvuB1le5UPpOF3tGTMvpD1w4DmuuVgy7kH2mmvTU4MM8xOnLEawB
   w==;
X-CSE-ConnectionGUID: 0D/saW4DSkSkAKiAFhkJFA==
X-CSE-MsgGUID: TcbUVEd+SCqzmA29tm3yDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46399868"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="46399868"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 08:48:47 -0800
X-CSE-ConnectionGUID: HGy01KT4SfWDLGcUmYLTWA==
X-CSE-MsgGUID: UNRr6U+4TvK4oCJR9qTmcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100315705"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2024 08:48:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRDVz-0003LI-2R;
	Fri, 27 Dec 2024 16:48:43 +0000
Date: Sat, 28 Dec 2024 00:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Julian Chen <julian.chen@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] drivers/media/i2c/d4xx.c:727:18:
 warning: unused variable 'ds5_default_framerate'
Message-ID: <202412280023.sWkkXMs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 115648ff1b1a301ea69324d80b1297d1041fd3b8 [3/3] media: i2c: platform: fix multiple compile errors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412280023.sWkkXMs2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280023.sWkkXMs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280023.sWkkXMs2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2170:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/d4xx.c:26:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/media/i2c/d4xx.c:26:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/media/i2c/d4xx.c:26:
   In file included from include/linux/of_gpio.h:14:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/media/i2c/d4xx.c:3761:57: warning: variable 'vc_id' set but not used [-Wunused-but-set-variable]
    3761 |         u16 config_status_base, stream_status_base, stream_id, vc_id;
         |                                                                ^
   drivers/media/i2c/d4xx.c:5201:18: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    5201 |         int ret, retry, err = 0;
         |                         ^
>> drivers/media/i2c/d4xx.c:727:18: warning: unused variable 'ds5_default_framerate' [-Wunused-const-variable]
     727 | static const u16 ds5_default_framerate = 30;
         |                  ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/d4xx.c:743:18: warning: unused variable 'ds5_framerate_25' [-Wunused-const-variable]
     743 | static const u16 ds5_framerate_25 = 25;
         |                  ^~~~~~~~~~~~~~~~
>> drivers/media/i2c/d4xx.c:913:36: warning: unused variable 'ds5_size_w10' [-Wunused-const-variable]
     913 | static const struct ds5_resolution ds5_size_w10 = {
         |                                    ^~~~~~~~~~~~
>> drivers/media/i2c/d4xx.c:929:36: warning: unused variable 'd46x_calibration_sizes' [-Wunused-const-variable]
     929 | static const struct ds5_resolution d46x_calibration_sizes[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   23 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +/ds5_default_framerate +727 drivers/media/i2c/d4xx.c

e986ee1ba98444 zouxiaoh 2024-01-18  726  
e986ee1ba98444 zouxiaoh 2024-01-18 @727  static const u16 ds5_default_framerate = 30;
e986ee1ba98444 zouxiaoh 2024-01-18  728  
e986ee1ba98444 zouxiaoh 2024-01-18  729  // **********************
e986ee1ba98444 zouxiaoh 2024-01-18  730  // FIXME: D16 width must be doubled, because an 8-bit format is used. Check how
e986ee1ba98444 zouxiaoh 2024-01-18  731  // the Tegra driver propagates resolutions and formats.
e986ee1ba98444 zouxiaoh 2024-01-18  732  // **********************
e986ee1ba98444 zouxiaoh 2024-01-18  733  
e986ee1ba98444 zouxiaoh 2024-01-18  734  //TODO: keep 6, till 5 is supported by FW
e986ee1ba98444 zouxiaoh 2024-01-18  735  static const u16 ds5_framerates[] = {5, 30};
e986ee1ba98444 zouxiaoh 2024-01-18  736  
e986ee1ba98444 zouxiaoh 2024-01-18  737  #define DS5_FRAMERATE_DEFAULT_IDX 1
e986ee1ba98444 zouxiaoh 2024-01-18  738  
e986ee1ba98444 zouxiaoh 2024-01-18  739  static const u16 ds5_framerate_30 = 30;
e986ee1ba98444 zouxiaoh 2024-01-18  740  
e986ee1ba98444 zouxiaoh 2024-01-18  741  static const u16 ds5_framerate_15_30[] = {15, 30};
e986ee1ba98444 zouxiaoh 2024-01-18  742  
e986ee1ba98444 zouxiaoh 2024-01-18 @743  static const u16 ds5_framerate_25 = 25;
e986ee1ba98444 zouxiaoh 2024-01-18  744  
e986ee1ba98444 zouxiaoh 2024-01-18  745  static const u16 ds5_depth_framerate_to_30[] = {5, 15, 30};
e986ee1ba98444 zouxiaoh 2024-01-18  746  static const u16 ds5_framerate_to_30[] = {5, 10, 15, 30};
e986ee1ba98444 zouxiaoh 2024-01-18  747  static const u16 ds5_framerate_to_60[] = {5, 15, 30, 60};
e986ee1ba98444 zouxiaoh 2024-01-18  748  static const u16 ds5_framerate_to_90[] = {5, 15, 30, 60, 90};
e986ee1ba98444 zouxiaoh 2024-01-18  749  static const u16 ds5_framerate_100[] = {100};
e986ee1ba98444 zouxiaoh 2024-01-18  750  static const u16 ds5_framerate_90[] = {90};
e986ee1ba98444 zouxiaoh 2024-01-18  751  static const u16 ds5_imu_framerates[] = {50, 100, 200, 400};
e986ee1ba98444 zouxiaoh 2024-01-18  752  
e986ee1ba98444 zouxiaoh 2024-01-18  753  static const struct ds5_resolution d43x_depth_sizes[] = {
e986ee1ba98444 zouxiaoh 2024-01-18  754  	{
e986ee1ba98444 zouxiaoh 2024-01-18  755  		.width = 1280,
e986ee1ba98444 zouxiaoh 2024-01-18  756  		.height = 720,
e986ee1ba98444 zouxiaoh 2024-01-18  757  		.framerates = ds5_depth_framerate_to_30,
e986ee1ba98444 zouxiaoh 2024-01-18  758  		.n_framerates = ARRAY_SIZE(ds5_depth_framerate_to_30),
e986ee1ba98444 zouxiaoh 2024-01-18  759  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  760  		.width =  848,
e986ee1ba98444 zouxiaoh 2024-01-18  761  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  762  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  763  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  764  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  765  		.width =  848,
e986ee1ba98444 zouxiaoh 2024-01-18  766  		.height = 100,
e986ee1ba98444 zouxiaoh 2024-01-18  767  		.framerates = ds5_framerate_100,
e986ee1ba98444 zouxiaoh 2024-01-18  768  		.n_framerates = ARRAY_SIZE(ds5_framerate_100),
e986ee1ba98444 zouxiaoh 2024-01-18  769  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  770  		.width =  640,
e986ee1ba98444 zouxiaoh 2024-01-18  771  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  772  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  773  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  774  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  775  		.width =  640,
e986ee1ba98444 zouxiaoh 2024-01-18  776  		.height = 360,
e986ee1ba98444 zouxiaoh 2024-01-18  777  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  778  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  779  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  780  		.width =  480,
e986ee1ba98444 zouxiaoh 2024-01-18  781  		.height = 270,
e986ee1ba98444 zouxiaoh 2024-01-18  782  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  783  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  784  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  785  		.width =  424,
e986ee1ba98444 zouxiaoh 2024-01-18  786  		.height = 240,
e986ee1ba98444 zouxiaoh 2024-01-18  787  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  788  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  789  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  790  		.width =  256,
e986ee1ba98444 zouxiaoh 2024-01-18  791  		.height = 144,
e986ee1ba98444 zouxiaoh 2024-01-18  792  		.framerates = ds5_framerate_90,
e986ee1ba98444 zouxiaoh 2024-01-18  793  		.n_framerates = ARRAY_SIZE(ds5_framerate_90),
e986ee1ba98444 zouxiaoh 2024-01-18  794  	},
e986ee1ba98444 zouxiaoh 2024-01-18  795  };
e986ee1ba98444 zouxiaoh 2024-01-18  796  
e986ee1ba98444 zouxiaoh 2024-01-18  797  static const struct ds5_resolution d46x_depth_sizes[] = {
e986ee1ba98444 zouxiaoh 2024-01-18  798  	{
e986ee1ba98444 zouxiaoh 2024-01-18  799  		.width = 1280,
e986ee1ba98444 zouxiaoh 2024-01-18  800  		.height = 960,
e986ee1ba98444 zouxiaoh 2024-01-18  801  		.framerates = ds5_framerates,
e986ee1ba98444 zouxiaoh 2024-01-18  802  		.n_framerates = ARRAY_SIZE(ds5_framerates),
e986ee1ba98444 zouxiaoh 2024-01-18  803  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  804  		.width =  640,
e986ee1ba98444 zouxiaoh 2024-01-18  805  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  806  		.framerates = ds5_framerates,
e986ee1ba98444 zouxiaoh 2024-01-18  807  		.n_framerates = ARRAY_SIZE(ds5_framerates),
e986ee1ba98444 zouxiaoh 2024-01-18  808  	},
e986ee1ba98444 zouxiaoh 2024-01-18  809  };
e986ee1ba98444 zouxiaoh 2024-01-18  810  
e986ee1ba98444 zouxiaoh 2024-01-18  811  static const struct ds5_resolution y8_sizes[] = {
e986ee1ba98444 zouxiaoh 2024-01-18  812  	{
e986ee1ba98444 zouxiaoh 2024-01-18  813  		.width = 1280,
e986ee1ba98444 zouxiaoh 2024-01-18  814  		.height = 720,
e986ee1ba98444 zouxiaoh 2024-01-18  815  		.framerates = ds5_depth_framerate_to_30,
e986ee1ba98444 zouxiaoh 2024-01-18  816  		.n_framerates = ARRAY_SIZE(ds5_depth_framerate_to_30),
e986ee1ba98444 zouxiaoh 2024-01-18  817  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  818  		.width =  848,
e986ee1ba98444 zouxiaoh 2024-01-18  819  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  820  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  821  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  822  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  823  		.width =  640,
e986ee1ba98444 zouxiaoh 2024-01-18  824  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  825  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  826  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  827  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  828  		.width =  640,
e986ee1ba98444 zouxiaoh 2024-01-18  829  		.height = 360,
e986ee1ba98444 zouxiaoh 2024-01-18  830  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  831  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  832  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  833  		.width =  480,
e986ee1ba98444 zouxiaoh 2024-01-18  834  		.height = 270,
e986ee1ba98444 zouxiaoh 2024-01-18  835  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  836  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  837  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  838  		.width =  424,
e986ee1ba98444 zouxiaoh 2024-01-18  839  		.height = 240,
e986ee1ba98444 zouxiaoh 2024-01-18  840  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  841  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  842  	}
e986ee1ba98444 zouxiaoh 2024-01-18  843  };
e986ee1ba98444 zouxiaoh 2024-01-18  844  
e986ee1ba98444 zouxiaoh 2024-01-18  845  static const struct ds5_resolution ds5_rlt_rgb_sizes[] = {
e986ee1ba98444 zouxiaoh 2024-01-18  846  	{
e986ee1ba98444 zouxiaoh 2024-01-18  847  		.width = 1280,
e986ee1ba98444 zouxiaoh 2024-01-18  848  		.height = 800,
e986ee1ba98444 zouxiaoh 2024-01-18  849  		.framerates = ds5_framerate_to_30,
e986ee1ba98444 zouxiaoh 2024-01-18  850  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_30),
e986ee1ba98444 zouxiaoh 2024-01-18  851  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  852  		.width = 1280,
e986ee1ba98444 zouxiaoh 2024-01-18  853  		.height = 720,
e986ee1ba98444 zouxiaoh 2024-01-18  854  		.framerates = ds5_framerate_to_30,
e986ee1ba98444 zouxiaoh 2024-01-18  855  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_30),
e986ee1ba98444 zouxiaoh 2024-01-18  856  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  857  		.width = 848,
e986ee1ba98444 zouxiaoh 2024-01-18  858  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  859  		.framerates = ds5_framerate_to_60,
e986ee1ba98444 zouxiaoh 2024-01-18  860  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_60),
e986ee1ba98444 zouxiaoh 2024-01-18  861  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  862  		.width = 640,
e986ee1ba98444 zouxiaoh 2024-01-18  863  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  864  		.framerates = ds5_framerate_to_60,
e986ee1ba98444 zouxiaoh 2024-01-18  865  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_60),
e986ee1ba98444 zouxiaoh 2024-01-18  866  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  867  		.width = 640,
e986ee1ba98444 zouxiaoh 2024-01-18  868  		.height = 360,
e986ee1ba98444 zouxiaoh 2024-01-18  869  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  870  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  871  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  872  		.width = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  873  		.height = 270,
e986ee1ba98444 zouxiaoh 2024-01-18  874  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  875  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  876  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  877  		.width = 424,
e986ee1ba98444 zouxiaoh 2024-01-18  878  		.height = 240,
e986ee1ba98444 zouxiaoh 2024-01-18  879  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  880  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  881  	},
e986ee1ba98444 zouxiaoh 2024-01-18  882  };
e986ee1ba98444 zouxiaoh 2024-01-18  883  
e986ee1ba98444 zouxiaoh 2024-01-18  884  static const struct ds5_resolution ds5_onsemi_rgb_sizes[] = {
e986ee1ba98444 zouxiaoh 2024-01-18  885  	{
e986ee1ba98444 zouxiaoh 2024-01-18  886  		.width = 640,
e986ee1ba98444 zouxiaoh 2024-01-18  887  		.height = 480,
e986ee1ba98444 zouxiaoh 2024-01-18  888  		.framerates = ds5_framerate_to_90,
e986ee1ba98444 zouxiaoh 2024-01-18  889  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_90),
e986ee1ba98444 zouxiaoh 2024-01-18  890  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  891  		.width = 960,
e986ee1ba98444 zouxiaoh 2024-01-18  892  		.height = 720,
e986ee1ba98444 zouxiaoh 2024-01-18  893  		.framerates = ds5_framerate_to_60,
e986ee1ba98444 zouxiaoh 2024-01-18  894  		.n_framerates = ARRAY_SIZE(ds5_framerate_to_60),
e986ee1ba98444 zouxiaoh 2024-01-18  895  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  896  		.width = 1280,
e986ee1ba98444 zouxiaoh 2024-01-18  897  		.height = 720,
e986ee1ba98444 zouxiaoh 2024-01-18  898  		.framerates = ds5_framerates,
e986ee1ba98444 zouxiaoh 2024-01-18  899  		.n_framerates = ARRAY_SIZE(ds5_framerates),
e986ee1ba98444 zouxiaoh 2024-01-18  900  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  901  		.width = 1920,
e986ee1ba98444 zouxiaoh 2024-01-18  902  		.height = 1080,
e986ee1ba98444 zouxiaoh 2024-01-18  903  		.framerates = ds5_framerates,
e986ee1ba98444 zouxiaoh 2024-01-18  904  		.n_framerates = ARRAY_SIZE(ds5_framerates),
e986ee1ba98444 zouxiaoh 2024-01-18  905  	}, {
e986ee1ba98444 zouxiaoh 2024-01-18  906  		.width = 2048,
e986ee1ba98444 zouxiaoh 2024-01-18  907  		.height = 1536,
e986ee1ba98444 zouxiaoh 2024-01-18  908  		.framerates = ds5_framerates,
e986ee1ba98444 zouxiaoh 2024-01-18  909  		.n_framerates = ARRAY_SIZE(ds5_framerates),
e986ee1ba98444 zouxiaoh 2024-01-18  910  	},
e986ee1ba98444 zouxiaoh 2024-01-18  911  };
e986ee1ba98444 zouxiaoh 2024-01-18  912  
e986ee1ba98444 zouxiaoh 2024-01-18 @913  static const struct ds5_resolution ds5_size_w10 = {
e986ee1ba98444 zouxiaoh 2024-01-18  914  	.width =  1920,
e986ee1ba98444 zouxiaoh 2024-01-18  915  	.height = 1080,
e986ee1ba98444 zouxiaoh 2024-01-18  916  	.framerates = &ds5_framerate_30,
e986ee1ba98444 zouxiaoh 2024-01-18  917  	.n_framerates = 1,
e986ee1ba98444 zouxiaoh 2024-01-18  918  };
e986ee1ba98444 zouxiaoh 2024-01-18  919  

:::::: The code at line 727 was first introduced by commit
:::::: e986ee1ba98444c2b97240478a5b1dda508e0b35 add ipu driver for kernel 6.6

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
