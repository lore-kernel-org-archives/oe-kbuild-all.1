Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57521105
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714545197; cv=none; b=N3Ia5IfLI5tRZHJnbq1HxxwIOu7j1hhh3W03w5zRLhz56kfbVcf7OhCrdcTy2fbzdIFJFLYlrB0xzo/HmlI+CRcix0Ys4ExqPxOpdRefWj8aGgkq/qIhq/fVh3gc/T/9CRDEWLeJWte0EBzFGTu5iMysSKrXF8LpigF3t9lc83g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714545197; c=relaxed/simple;
	bh=6X5qcgsHpqVQvC4cNn1GOviSLwIEVVTJLk+m0pA9H58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mMg+pY00RP5CXjGwks8doyh64kKgGLb4vLE7NmzOknhlQ97Kpzq2ICkJqXQfi4puYrjdWhAcTi+1eQModRE/5czPkIcetAZWB28Tqo+hKQdqW11Tu2ABhJe7oiMx/lYB6afCvbBU6WEuNLlZoZo4wsfEn89IL0SR3wbqrDhc/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGFUUNFP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGFUUNFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714545195; x=1746081195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6X5qcgsHpqVQvC4cNn1GOviSLwIEVVTJLk+m0pA9H58=;
  b=GGFUUNFPfOnJU45L9foIhkeTPY+lQxZZ0572WAgrS0+72kwe8dlWf+RB
   S0YJ4h00U8nnWa1r3pqyigNO1Y/qaoZgEWnAMOS6FC9hh9oWdXWQ95dGZ
   cE9S8RgQTiL7++9JrxGjdN4NKN2BRsj5i6EpSgUlTOUzye+JGXpj++Wpv
   tNIhRteUnpDfQRVFX82wxhDicdVEfZDI9+ZMSXMODUsFMZ/GlBlcXetAZ
   uFwmB5UiaV4Zicyu0Xh0pn2PRZP3/feNbbO57F9IV57h/2pV7KE+puzIg
   0wYDxXvPPe1blIxwWHH7c+4yjwt6Bqe8t3pWVMhN3nMHGLUMhqDnR7D0c
   A==;
X-CSE-ConnectionGUID: CBimA6JPSvGjwt8UXmCL4w==
X-CSE-MsgGUID: 7Yh7FB8MSSKae3n6V9457A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10119869"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="10119869"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 23:33:14 -0700
X-CSE-ConnectionGUID: J4r/LXQTRDqHwgzfSasauw==
X-CSE-MsgGUID: 8raONE26QyOon0CICbzhkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="31311970"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2024 23:33:13 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s23Wh-0008zj-16;
	Wed, 01 May 2024 06:33:11 +0000
Date: Wed, 1 May 2024 14:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 7401/11730]
 drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10:
 fatal error: 'linux/mali_kbase_debug_coresight_csf.h' file not found
Message-ID: <202405011449.WzSpaJlB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   776652a165f5bbf30c68a5f6213d75b02e8df11c
commit: c72487fafcbdaddc79c61ac5a119c5d89af807c9 [7401/11730] MGS-7531-2 [#nxp] update the include path
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405011449.WzSpaJlB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011449.WzSpaJlB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011449.WzSpaJlB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.c:26:
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.h:29:
   In file included from drivers/gpu/arm/midgard/mali_kbase.h:30:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.c:26:
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.h:29:
   In file included from drivers/gpu/arm/midgard/mali_kbase.h:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.c:26:
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.h:29:
   In file included from drivers/gpu/arm/midgard/mali_kbase.h:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.c:26:
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.h:29:
   In file included from drivers/gpu/arm/midgard/mali_kbase.h:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.c:26:
   In file included from drivers/gpu/arm/midgard/mali_kbase_cache_policy.h:29:
   In file included from drivers/gpu/arm/midgard/mali_kbase.h:56:
   In file included from drivers/gpu/arm/midgard/mali_kbase_defs.h:353:
   In file included from drivers/gpu/arm/midgard/csf/mali_kbase_csf_defs.h:39:
>> drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10: fatal error: 'linux/mali_kbase_debug_coresight_csf.h' file not found
      26 | #include <linux/mali_kbase_debug_coresight_csf.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.
--
   In file included from drivers/gpu/arm/midgard/mali_kbase_mem.c:25:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_mem.c:25:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_mem.c:25:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_mem.c:25:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/arm/midgard/mali_kbase_mem.c:36:
   In file included from drivers/gpu/arm/midgard/mali_kbase.h:56:
   In file included from drivers/gpu/arm/midgard/mali_kbase_defs.h:353:
   In file included from drivers/gpu/arm/midgard/csf/mali_kbase_csf_defs.h:39:
>> drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10: fatal error: 'linux/mali_kbase_debug_coresight_csf.h' file not found
      26 | #include <linux/mali_kbase_debug_coresight_csf.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +26 drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h

d5c5f8c95d8fe5 Shuming Fan 2023-08-07  24  
d5c5f8c95d8fe5 Shuming Fan 2023-08-07  25  #include <mali_kbase.h>
d5c5f8c95d8fe5 Shuming Fan 2023-08-07 @26  #include <linux/mali_kbase_debug_coresight_csf.h>
d5c5f8c95d8fe5 Shuming Fan 2023-08-07  27  

:::::: The code at line 26 was first introduced by commit
:::::: d5c5f8c95d8fe590d3ca321d3d5a04c32f50f11d MGS-7263 VX504X08X-SW-99002-r42p0-01eac0

:::::: TO: Shuming Fan <shuming.fan@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
