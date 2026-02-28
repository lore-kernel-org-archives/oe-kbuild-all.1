Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE82C187
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 04:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772253663; cv=none; b=mqZJSk2HtYvhRJF560jlMhPn07Za75ou7gjaGmi5TCI/oXi4hZYQgWktS8A3DagriZGnbCwRp/ocTtBlLSal13Qy709sDiRGdE0U94KGMlUuxsMt4V9Vdv6onYiLxenswCj+8ATts/YhfzFRtqDXZSN7rvHk7z+oS+lRxO7TOe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772253663; c=relaxed/simple;
	bh=wGBnljkzcbYsoGdnfdi/eKRDvsya0a5M6SC2cVLKRYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mzsnppY7ixasuKAQqbcWQAtvN2wiSkrRYxHA2x3Ye6WdqCU5YfyEoXA3q/iJvRiLuCUJnY0QtbHtIez5BiYrOA6iAx1teaSz1DCy1VO5JjzWVKOSo9P+sQt+bUn3QQdhs149WL2CtwaH5HapBWrAc17o6oPOMmCza8dGLCwKqW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzQKRsdE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzQKRsdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772253661; x=1803789661;
  h=date:from:to:cc:subject:message-id;
  bh=wGBnljkzcbYsoGdnfdi/eKRDvsya0a5M6SC2cVLKRYA=;
  b=bzQKRsdEGLR/ACXD5vo1dT8mhOnEjwDl7wXKnd/i6B7imCI6HY1cNJig
   fBVlRPEZC/rZIzJYHjNbGDbronXcbHtfA2HFS+SeNNWhjrpBEUeW+8DDk
   4mPRgzcOoV5kRTFf14wqCzO1fgkGvnma1qCyGtnKQfylwgsnW4eCE3YaF
   KLWxh0b36bO6H5pjFEdB6xjpfHaJJzZZMW2NLnu3S4tv0tRDfKn9Bz+BR
   JePotJKbuMqORS1KSfPtyPYMO/7nrvB37uvhVu363O5l6TLFDEIWOb24F
   huqJtsRF5LvvykZMnV0BoghXxe5oPrUSAgMNA7mOqoBhoUcI/QM4H21tf
   w==;
X-CSE-ConnectionGUID: j4S+rw/DTbGA4GK7Tr4qCQ==
X-CSE-MsgGUID: ghj55932RRq29a+10z/Q7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73042329"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73042329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 20:41:01 -0800
X-CSE-ConnectionGUID: troml2VrSZCk1DHaHmYNvw==
X-CSE-MsgGUID: 9XmGOC8lT7WpO9DwOjK5PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="240096095"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2026 20:40:59 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwC8O-00000000BJH-3Mys;
	Sat, 28 Feb 2026 04:40:56 +0000
Date: Sat, 28 Feb 2026 12:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 13/13]
 drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202602281259.J6BeVetV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   361ba5bee5517bf09bc4ba10b22c3e3006f58876
commit: 361ba5bee5517bf09bc4ba10b22c3e3006f58876 [13/13] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sh-randconfig-r134-20260228 (https://download.01.org/0day-ci/archive/20260228/202602281259.J6BeVetV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602281259.J6BeVetV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281259.J6BeVetV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse:     got void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse:     got void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     expected void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     got void [noderef] __iomem *
--
>> drivers/watchdog/at91rm9200_wdt.c:217:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/watchdog/at91rm9200_wdt.c:217:27: sparse:     expected int ( *write )( ... )
   drivers/watchdog/at91rm9200_wdt.c:217:27: sparse:     got int ( * )( ... )
--
   drivers/video/fbdev/atmel_lcdfb.c:333:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
   drivers/video/fbdev/atmel_lcdfb.c:333:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:333:27: sparse:     got void *
   drivers/video/fbdev/atmel_lcdfb.c:341:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *__s @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:341:20: sparse:     expected void *__s
   drivers/video/fbdev/atmel_lcdfb.c:341:20: sparse:     got char [noderef] __iomem *screen_base
>> drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     expected void *cpu_addr
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     got char [noderef] __iomem *screen_base
>> drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     expected void *cpu_addr
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     got char [noderef] __iomem *screen_base
--
   drivers/net/ethernet/korina.c:408:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct dma_reg *ch @@     got struct dma_reg [noderef] __iomem *tx_dma_regs @@
   drivers/net/ethernet/korina.c:408:33: sparse:     expected struct dma_reg *ch
   drivers/net/ethernet/korina.c:408:33: sparse:     got struct dma_reg [noderef] __iomem *tx_dma_regs
>> drivers/net/ethernet/korina.c:415:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct dma_reg *ch @@     got struct dma_reg [noderef] __iomem *rx_dma_regs @@
   drivers/net/ethernet/korina.c:415:33: sparse:     expected struct dma_reg *ch
   drivers/net/ethernet/korina.c:415:33: sparse:     got struct dma_reg [noderef] __iomem *rx_dma_regs
   drivers/net/ethernet/korina.c:391:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:391:13: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:391:13: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:392:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:392:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:392:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:394:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:394:26: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:394:26: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:397:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:397:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:397:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:400:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:400:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:400:9: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:401:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:401:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:401:9: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:391:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:391:13: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:391:13: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:392:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:392:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:392:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:394:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:394:26: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:394:26: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:397:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:397:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:397:17: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:400:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:400:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:400:9: sparse:     got unsigned int *
   drivers/net/ethernet/korina.c:401:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/net/ethernet/korina.c:401:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/net/ethernet/korina.c:401:9: sparse:     got unsigned int *
--
   drivers/mtd/maps/uclinux.c:58:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/mtd/maps/uclinux.c:58:15: sparse:     expected void *
   drivers/mtd/maps/uclinux.c:58:15: sparse:     got void [noderef] __iomem *
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:92:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void * @@
   drivers/mtd/maps/uclinux.c:92:20: sparse:     expected void [noderef] __iomem *virt
   drivers/mtd/maps/uclinux.c:92:20: sparse:     got void *
   drivers/mtd/maps/uclinux.c:94:27: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/net/ethernet/arc/emac_main.c:258:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/arc/emac_main.c:258:28: sparse:     expected unsigned int [usertype] data
   drivers/net/ethernet/arc/emac_main.c:258:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/arc/emac_main.c:461:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/arc/emac_main.c:461:28: sparse:     expected unsigned int [usertype] data
   drivers/net/ethernet/arc/emac_main.c:461:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/arc/emac_main.c:712:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/arc/emac_main.c:712:37: sparse:     expected unsigned int [usertype] data
   drivers/net/ethernet/arc/emac_main.c:712:37: sparse:     got restricted __le32 [usertype]
--
>> drivers/net/ethernet/qualcomm/qca_7k_common.c:31:18: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/qualcomm/qca_7k_common.c:32:19: sparse: sparse: restricted __le16 degrades to integer

vim +30 drivers/hwspinlock/stm32_hwspinlock.c

f24fcff1d267da0 Benjamin Gaignard 2018-11-14  27  
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  28  static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  29  {
f24fcff1d267da0 Benjamin Gaignard 2018-11-14 @30  	void __iomem *lock_addr = lock->priv;
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  31  	u32 status;
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  32  
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  33  	writel(STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID, lock_addr);
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  34  	status = readl(lock_addr);
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  35  
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  36  	return status == (STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID);
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  37  }
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  38  

:::::: The code at line 30 was first introduced by commit
:::::: f24fcff1d267da08c4bbb3869e7f4b36ce916b76 hwspinlock: add STM32 hwspinlock device

:::::: TO: Benjamin Gaignard <benjamin.gaignard@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
