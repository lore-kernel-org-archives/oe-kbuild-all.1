Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01946127
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LejAQgYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700385331; x=1731921331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R1n+z2WCisa4pJPn3x+tu8Myi5D6LXBbdFBD2hqxLiA=;
  b=LejAQgYGdb4d4km+anOUEfqZqVMN7jm4L4CR6jCsk3cPU9s8N5SP6Vy+
   DFA38PkXagqBsmFqM5Zc9nP4BGxh1GVGYVmmjTz36HlvIG5SSOG+690NZ
   6NiqKjB8Rhe0c46bShAm+JT6ZcKLGX3tdPV/TRw0DIIKdgHc9Ngr/uQx2
   7C77PR2aDAB0b9b0xZD8c9Zf2JQtBzGOPU8wJosyxGJ8vCszm8shbckqO
   mGlyQpLxIDjPyH50FEStkmstjOMvKjbWkglNDmMjL1bEtTNlngqg4yXsc
   q+Gyor8m56b/aHw/lQ4UqAmRSHM0fRMGJFz9utMkCCmCrD+oKz6JORp7+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="376519698"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="376519698"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 01:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="1013324272"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="1013324272"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2023 01:15:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4dtl-0004th-23;
	Sun, 19 Nov 2023 09:15:25 +0000
Date: Sun, 19 Nov 2023 17:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7008/7095]
 drivers/net/phy/air_en8811h.c:681:12: warning: no previous prototype for
 function 'en8811h_phy_driver_register'
Message-ID: <202311191730.2D4tSFTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   c3f5b3f22933d3fdfdaced4da77348154240d88b
commit: 5ed7548c54a90dd1087ec651f5a589ba1382d456 [7008/7095] net: phy: add driver for Airoha EN8811 2.5G PHY
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231119/202311191730.2D4tSFTM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191730.2D4tSFTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191730.2D4tSFTM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/phy/air_en8811h.c:16:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
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
   In file included from drivers/net/phy/air_en8811h.c:16:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
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
   In file included from drivers/net/phy/air_en8811h.c:16:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
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
>> drivers/net/phy/air_en8811h.c:681:12: warning: no previous prototype for function 'en8811h_phy_driver_register' [-Wmissing-prototypes]
     681 | int __init en8811h_phy_driver_register(void)
         |            ^
   drivers/net/phy/air_en8811h.c:681:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     681 | int __init en8811h_phy_driver_register(void)
         | ^
         | static 
>> drivers/net/phy/air_en8811h.c:696:13: warning: no previous prototype for function 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
     696 | void __exit en8811h_phy_driver_unregister(void)
         |             ^
   drivers/net/phy/air_en8811h.c:696:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     696 | void __exit en8811h_phy_driver_unregister(void)
         | ^
         | static 
   8 warnings generated.


vim +/en8811h_phy_driver_register +681 drivers/net/phy/air_en8811h.c

   680	
 > 681	int __init en8811h_phy_driver_register(void)
   682	{
   683	    int ret;
   684	#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))
   685	    ret = phy_driver_register(en8811h_driver);
   686	#else
   687	    ret = phy_driver_register(en8811h_driver, THIS_MODULE);
   688	#endif
   689	    if (!ret)
   690	        return 0;
   691	
   692	    phy_driver_unregister(en8811h_driver);
   693	    return ret;
   694	}
   695	
 > 696	void __exit en8811h_phy_driver_unregister(void)
   697	{
   698	    phy_driver_unregister(en8811h_driver);
   699	}
   700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
