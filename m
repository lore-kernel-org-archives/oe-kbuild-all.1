Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD2B139F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8GJvwup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703488101; x=1735024101;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zcOqD+OvcXbLD4OqH0SvaiD9aLqmonnsbPasRd/3ODc=;
  b=b8GJvwupWUf2iYDVsr2erd/wcaLtkRrH8dqlKkBtiMNq3UShK4PYQHJp
   Cm4yeUYAsUN7hZwssO2V9zAFMMDAhONRWTNvIBh30ZiseLzncP5tEqdrZ
   aOxJxPNZoL0fPSb+hGty+LWIZB9LzBaPKWxIXBK2uN3oyZqZjE/+TmR3L
   JbE5XQyN0CC+766GIqZG+4nGcCIYnESUjhyPI3lVx4nDaHCXqCmIIfSy5
   pr97w2+Ctzuxw5kydfhv2v0/C8SSEtHWAe2zItpaMyYQqyb8Cqx1VgR2h
   UxCi3BFaTNEt6R8pRZPfwRe8kitNwmGe8/XMUoI52DKTXPxD//ofW3zLA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="482446969"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="482446969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 23:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="811979196"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="811979196"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Dec 2023 23:08:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHf4D-000D4M-2A;
	Mon, 25 Dec 2023 07:08:09 +0000
Date: Mon, 25 Dec 2023 15:06:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 2052/2351] arch/sh/include/asm/hd64461.h:18:33:
 warning: passing argument 1 of 'fb_readw' makes pointer from integer without
 a cast
Message-ID: <202312251531.zGzhVlrc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   382d87438facc70156ccd2e5952f2111d7e588b3
commit: 3d6a395227634bd61ebaf1f3d2a2cba8864cf106 [2052/2351] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
config: sh-hp6xx_defconfig (https://download.01.org/0day-ci/archive/20231225/202312251531.zGzhVlrc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312251531.zGzhVlrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312251531.zGzhVlrc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/video/fbdev/hitfb.c:27:
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_wait':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 1 of 'fb_readw' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:93:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)       /* Accelerator Configuration Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:47:25: note: in expansion of macro 'HD64461_GRCFGR'
      47 |         while (fb_readw(HD64461_GRCFGR) & HD64461_GRCFGR_ACCSTATUS) ;
         |                         ^~~~~~~~~~~~~~
   In file included from arch/sh/include/asm/fb.h:5,
                    from include/linux/fb.h:19,
                    from drivers/video/fbdev/hitfb.c:22:
   include/asm-generic/fb.h:52:57: note: expected 'const volatile void *' but argument is of type 'unsigned int'
      52 | static inline u16 fb_readw(const volatile void __iomem *addr)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_start':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:93:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)       /* Accelerator Configuration Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:53:30: note: in expansion of macro 'HD64461_GRCFGR'
      53 |                 fb_writew(6, HD64461_GRCFGR);
         |                              ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:93:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)       /* Accelerator Configuration Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:55:30: note: in expansion of macro 'HD64461_GRCFGR'
      55 |                 fb_writew(7, HD64461_GRCFGR);
         |                              ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_set_dest':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:116:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     116 | #define HD64461_BBTDWR          HD64461_IO_OFFSET(0x105c)       /* Destination Block Width Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:66:28: note: in expansion of macro 'HD64461_BBTDWR'
      66 |         fb_writew(width-1, HD64461_BBTDWR);
         |                            ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:117:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     117 | #define HD64461_BBTDHR          HD64461_IO_OFFSET(0x105e)       /* Destination Block Height Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:67:29: note: in expansion of macro 'HD64461_BBTDHR'
      67 |         fb_writew(height-1, HD64461_BBTDHR);
         |                             ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:115:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     115 | #define HD64461_BBTDSARL        HD64461_IO_OFFSET(0x105a)       /* Destination Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:69:35: note: in expansion of macro 'HD64461_BBTDSARL'
      69 |         fb_writew(saddr & 0xffff, HD64461_BBTDSARL);
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:114:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     114 | #define HD64461_BBTDSARH        HD64461_IO_OFFSET(0x1058)       /* Destination Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:70:32: note: in expansion of macro 'HD64461_BBTDSARH'
      70 |         fb_writew(saddr >> 16, HD64461_BBTDSARH);
         |                                ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_bitblt':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:122:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     122 | #define HD64461_BBTROPR         HD64461_IO_OFFSET(0x1068)       /* ROP Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:83:24: note: in expansion of macro 'HD64461_BBTROPR'
      83 |         fb_writew(rop, HD64461_BBTROPR);
         |                        ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:94:49: note: in expansion of macro 'HD64461_BBTMDR'
      94 |                         fb_writew((1 << 5) | 1, HD64461_BBTMDR);
         |                                                 ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:96:38: note: in expansion of macro 'HD64461_BBTMDR'
      96 |                         fb_writew(1, HD64461_BBTMDR);
         |                                      ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:101:45: note: in expansion of macro 'HD64461_BBTMDR'
     101 |                         fb_writew((1 << 5), HD64461_BBTMDR);
         |                                             ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:103:38: note: in expansion of macro 'HD64461_BBTMDR'
     103 |                         fb_writew(0, HD64461_BBTMDR);
         |                                      ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:116:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     116 | #define HD64461_BBTDWR          HD64461_IO_OFFSET(0x105c)       /* Destination Block Width Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:110:26: note: in expansion of macro 'HD64461_BBTDWR'
     110 |         fb_writew(width, HD64461_BBTDWR);
         |                          ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:117:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     117 | #define HD64461_BBTDHR          HD64461_IO_OFFSET(0x105e)       /* Destination Block Height Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:111:27: note: in expansion of macro 'HD64461_BBTDHR'
     111 |         fb_writew(height, HD64461_BBTDHR);
         |                           ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:113:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     113 | #define HD64461_BBTSSARL        HD64461_IO_OFFSET(0x1056)       /* Source Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:112:35: note: in expansion of macro 'HD64461_BBTSSARL'
     112 |         fb_writew(saddr & 0xffff, HD64461_BBTSSARL);
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:112:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     112 | #define HD64461_BBTSSARH        HD64461_IO_OFFSET(0x1054)       /* Source Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:113:32: note: in expansion of macro 'HD64461_BBTSSARH'
     113 |         fb_writew(saddr >> 16, HD64461_BBTSSARH);
         |                                ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:115:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     115 | #define HD64461_BBTDSARL        HD64461_IO_OFFSET(0x105a)       /* Destination Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:114:35: note: in expansion of macro 'HD64461_BBTDSARL'
     114 |         fb_writew(daddr & 0xffff, HD64461_BBTDSARL);
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:114:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     114 | #define HD64461_BBTDSARH        HD64461_IO_OFFSET(0x1058)       /* Destination Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:115:32: note: in expansion of macro 'HD64461_BBTDSARH'
     115 |         fb_writew(daddr >> 16, HD64461_BBTDSARH);
         |                                ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:121:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     121 | #define HD64461_BBTMARL         HD64461_IO_OFFSET(0x1066)       /* Mask Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:118:43: note: in expansion of macro 'HD64461_BBTMARL'
     118 |                 fb_writew(maddr & 0xffff, HD64461_BBTMARL);
         |                                           ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:120:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     120 | #define HD64461_BBTMARH         HD64461_IO_OFFSET(0x1064)       /* Mask Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:119:40: note: in expansion of macro 'HD64461_BBTMARH'
     119 |                 fb_writew(maddr >> 16, HD64461_BBTMARH);
         |                                        ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_fillrect':
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:122:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     122 | #define HD64461_BBTROPR         HD64461_IO_OFFSET(0x1068)       /* ROP Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:130:35: note: in expansion of macro 'HD64461_BBTROPR'
     130 |                 fb_writew(0x00f0, HD64461_BBTROPR);
         |                                   ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:131:31: note: in expansion of macro 'HD64461_BBTMDR'
     131 |                 fb_writew(16, HD64461_BBTMDR);
         |                               ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:92:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      92 | #define HD64461_GRSCR           HD64461_IO_OFFSET(0x1042)       /* Solid Color Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:135:35: note: in expansion of macro 'HD64461_GRSCR'
     135 |                                   HD64461_GRSCR);
         |                                   ^~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:92:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      92 | #define HD64461_GRSCR           HD64461_IO_OFFSET(0x1042)       /* Solid Color Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:140:48: note: in expansion of macro 'HD64461_GRSCR'
     140 |                         fb_writew(rect->color, HD64461_GRSCR);
         |                                                ^~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_pan_display':
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:53:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      53 | #define HD64461_LCDCBAR         HD64461_IO_OFFSET(0x1000)
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:165:56: note: in expansion of macro 'HD64461_LCDCBAR'
     165 |         fb_writew((yoffset*info->fix.line_length)>>10, HD64461_LCDCBAR);
         |                                                        ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: At top level:
   drivers/video/fbdev/hitfb.c:170:5: warning: no previous prototype for 'hitfb_blank' [-Wmissing-prototypes]
     170 | int hitfb_blank(int blank_mode, struct fb_info *info)
         |     ^~~~~~~~~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_blank':
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 1 of 'fb_readw' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:70:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      70 | #define HD64461_LDR1            HD64461_IO_OFFSET(0x1010)
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:175:30: note: in expansion of macro 'HD64461_LDR1'
     175 |                 v = fb_readw(HD64461_LDR1);


vim +/fb_readw +18 arch/sh/include/asm/hd64461.h

^1da177e4c3f41 include/asm-sh/hd64461/hd64461.h Linus Torvalds     2005-04-16  15  
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  16  /* Area 6 - Slot 0 - memory and/or IO card */
bec36eca6f5d1d arch/sh/include/asm/hd64461.h    Paul Mundt         2009-05-15  17  #define HD64461_IOBASE		0xb0000000
bec36eca6f5d1d arch/sh/include/asm/hd64461.h    Paul Mundt         2009-05-15 @18  #define HD64461_IO_OFFSET(x)	(HD64461_IOBASE + (x))
bec36eca6f5d1d arch/sh/include/asm/hd64461.h    Paul Mundt         2009-05-15  19  #define	HD64461_PCC0_BASE	HD64461_IO_OFFSET(0x8000000)
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  20  #define	HD64461_PCC0_ATTR	(HD64461_PCC0_BASE)				/* 0xb80000000 */
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  21  #define	HD64461_PCC0_COMM	(HD64461_PCC0_BASE+HD64461_PCC_WINDOW)		/* 0xb90000000 */
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  22  #define	HD64461_PCC0_IO		(HD64461_PCC0_BASE+2*HD64461_PCC_WINDOW)	/* 0xba0000000 */
^1da177e4c3f41 include/asm-sh/hd64461/hd64461.h Linus Torvalds     2005-04-16  23  

:::::: The code at line 18 was first introduced by commit
:::::: bec36eca6f5d1d83a9c3733fc40ba173ad849df2 sh: hd64461: Fix up I/O base register offsets.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
