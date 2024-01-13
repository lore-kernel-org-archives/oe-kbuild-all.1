Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF41095B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mav72BG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705140401; x=1736676401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbkvXrRNXXzx85yj8bfN09v+EP9izalZ1aJf5cXIHAI=;
  b=mav72BG9BHnIE5Gai45NOKfcaX7AQ3RDMYTJVKfsx5Jpi+1KbAoJ6I1f
   SCL3xrV1QA6pzGBLtTyCDNopmAF3dbvixy0l1mPG1hBz9iLIVtgaTWL9M
   tTw7k8FGzEwU9+JtViREfI+MlKsDuT5qN1G0I7tI2ts1/nssp2iwu/MNo
   HowzHqSN7jz20RHoU7U30ey1Yt7bz+hUeVgaWVSk2SjlM1DYzj3qFminq
   VmIX8LuToTTmpYwZ1G4HyUanNYPaStfvlT93sKjxPn1UcV5vn04z3yRib
   F8Org7vHngv7emzddoj3kpfCYCP97ymuRYrGLIOwwilJHTHp+01Y7by9X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="403132790"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="403132790"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 02:06:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="24978779"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2024 02:06:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOauT-000AL6-2n;
	Sat, 13 Jan 2024 10:06:37 +0000
Date: Sat, 13 Jan 2024 18:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4303/17888]
 include/linux/phy_fixed.h:41:20: warning: no previous prototype for function
 'fwnode_fixed_phy_register'
Message-ID: <202401131839.AGq71rem-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 4e304ae887f2d46b897cbf0214c90c561a4394b8 [4303/17888] net: phy: fixed_phy: add fixed PHY ACPI support
config: s390-randconfig-001-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131839.AGq71rem-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131839.AGq71rem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131839.AGq71rem-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/phy/swphy.c:13:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
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
   In file included from drivers/net/phy/swphy.c:13:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/phy/swphy.c:13:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
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
   In file included from drivers/net/phy/swphy.c:15:
>> include/linux/phy_fixed.h:41:20: warning: no previous prototype for function 'fwnode_fixed_phy_register' [-Wmissing-prototypes]
      41 | struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
         |                    ^
   include/linux/phy_fixed.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
         | ^
         | static 
   13 warnings generated.


vim +/fwnode_fixed_phy_register +41 include/linux/phy_fixed.h

    18	
    19	#if IS_ENABLED(CONFIG_FIXED_PHY)
    20	extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
    21	extern int fixed_phy_add(unsigned int irq, int phy_id,
    22				 struct fixed_phy_status *status);
    23	extern struct phy_device *fixed_phy_register(unsigned int irq,
    24						     struct fixed_phy_status *status,
    25						     struct device_node *np);
    26	
    27	extern struct phy_device *
    28	fixed_phy_register_with_gpiod(unsigned int irq,
    29				      struct fixed_phy_status *status,
    30				      struct gpio_desc *gpiod);
    31	
    32	extern void fixed_phy_unregister(struct phy_device *phydev);
    33	extern int fixed_phy_set_link_update(struct phy_device *phydev,
    34				int (*link_update)(struct net_device *,
    35						   struct fixed_phy_status *));
    36	
    37	struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
    38						     struct fixed_phy_status *status);
    39	
    40	#else
  > 41	struct phy_device *fwnode_fixed_phy_register(struct fwnode_handle *fwnode_np,
    42						     struct fixed_phy_status *status)
    43	{
    44		return ERR_PTR(-ENODEV);
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
