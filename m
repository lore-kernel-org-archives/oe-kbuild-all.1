Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837815EA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695639891; x=1727175891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVmRNaoQebJ1+Ek+wKu+QxIxsjofL7XzrKVkfbu1Q0o=;
  b=R9oz4dFWP4tkIPPH/VBX3oqV8AtQRrL5UkqyU0RI2RaAKxaDFQXlq8Uc
   3p2vK3MY4aNGUHqgTDLvl/ezFP0yY2vmoadIpKNKO8ReaTrwESqjcKdfq
   TAhrkZEp6U9/LcmWbrJLl+tQFU00D7msnjJebDfdjgY9ZC5ZbCxJaGAT7
   cldoOckBvJEgk2JpygiR0X2AeL5i+SiEskw3+QjT5yfQ7wPajP8dyRI0E
   IfP9AxCjlTN9GzqzwHmBjTq7/i8MqPmsp5eLzEAqlvngjnvo/e9yUBV+q
   z7pewf3xj1yUDwW+rVxKO4wlFHQW01aapvIbvZVwfFuhrS2kCHcjGw+FS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412153587"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="412153587"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697935105"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="697935105"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Sep 2023 04:04:49 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkjOP-0001RV-0j;
	Mon, 25 Sep 2023 11:04:45 +0000
Date: Mon, 25 Sep 2023 19:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v6 17/36] arch/m68k/include/asm/io_mm.h:375:44:
 warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from
 pointer target type
Message-ID: <202309251926.bPl23AhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v6
head:   bdf22cc780c157a1e80f45396484884452b45b52
commit: 531b0d341d30c864fc2586d7a46d245a28b9ca02 [17/36] m68k: Let GENERIC_IOMAP depend on HAS_IOPORT
config: m68k-hp300_defconfig (https://download.01.org/0day-ci/archive/20230925/202309251926.bPl23AhG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251926.bPl23AhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251926.bPl23AhG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/inet.h:42,
                    from fs/smb/client/trace.h:15,
                    from fs/smb/client/trace.c:8:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
     916 |         readsb(addr, buffer, count);
         |         ^~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25:
   arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 *' {aka 'volatile unsigned char *'} but argument is of type 'const volatile void *'
     101 | static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
         |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:925:9: note: in expansion of macro 'readsw'
     925 |         readsw(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:149:51: note: expected 'volatile u16 *' {aka 'volatile short unsigned int *'} but argument is of type 'const volatile void *'
     149 | static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> arch/m68k/include/asm/io_mm.h:377:44: warning: passing argument 1 of 'raw_insl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     377 | #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:934:9: note: in expansion of macro 'readsl'
     934 |         readsl(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:228:51: note: expected 'volatile u32 *' {aka 'volatile unsigned int *'} but argument is of type 'const volatile void *'
     228 | static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
--
   In file included from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/backing-dev.h:16,
                    from fs/orangefs/orangefs-kernel.h:25,
                    from fs/orangefs/acl.c:9:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
     916 |         readsb(addr, buffer, count);
         |         ^~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25:
   arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 *' {aka 'volatile unsigned char *'} but argument is of type 'const volatile void *'
     101 | static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
         |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:925:9: note: in expansion of macro 'readsw'
     925 |         readsw(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:149:51: note: expected 'volatile u16 *' {aka 'volatile short unsigned int *'} but argument is of type 'const volatile void *'
     149 | static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> arch/m68k/include/asm/io_mm.h:377:44: warning: passing argument 1 of 'raw_insl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     377 | #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:934:9: note: in expansion of macro 'readsl'
     934 |         readsl(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:228:51: note: expected 'volatile u32 *' {aka 'volatile unsigned int *'} but argument is of type 'const volatile void *'
     228 | static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/acl.c:8:
   fs/orangefs/orangefs-debug.h: At top level:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/xfs/xfs_linux.h:31,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/libxfs/xfs_bmap.c:6:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
     916 |         readsb(addr, buffer, count);
         |         ^~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25:
   arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 *' {aka 'volatile unsigned char *'} but argument is of type 'const volatile void *'
     101 | static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
         |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:925:9: note: in expansion of macro 'readsw'
     925 |         readsw(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:149:51: note: expected 'volatile u16 *' {aka 'volatile short unsigned int *'} but argument is of type 'const volatile void *'
     149 | static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> arch/m68k/include/asm/io_mm.h:377:44: warning: passing argument 1 of 'raw_insl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     377 | #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:934:9: note: in expansion of macro 'readsl'
     934 |         readsl(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:228:51: note: expected 'volatile u32 *' {aka 'volatile unsigned int *'} but argument is of type 'const volatile void *'
     228 | static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_del_extent_real':
   fs/xfs/libxfs/xfs_bmap.c:5068:41: warning: variable 'bno' set but not used [-Wunused-but-set-variable]
    5068 |                         xfs_fsblock_t   bno;
         |                                         ^~~
--
   In file included from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/xfs/xfs_linux.h:31,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_iwalk.c:6:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
     916 |         readsb(addr, buffer, count);
         |         ^~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25:
   arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 *' {aka 'volatile unsigned char *'} but argument is of type 'const volatile void *'
     101 | static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
         |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:925:9: note: in expansion of macro 'readsw'
     925 |         readsw(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:149:51: note: expected 'volatile u16 *' {aka 'volatile short unsigned int *'} but argument is of type 'const volatile void *'
     149 | static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> arch/m68k/include/asm/io_mm.h:377:44: warning: passing argument 1 of 'raw_insl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     377 | #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:934:9: note: in expansion of macro 'readsl'
     934 |         readsl(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:228:51: note: expected 'volatile u32 *' {aka 'volatile unsigned int *'} but argument is of type 'const volatile void *'
     228 | static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   fs/xfs/xfs_iwalk.c: In function 'xfs_iwalk_run_callbacks':
   fs/xfs/xfs_iwalk.c:358:42: warning: variable 'irec' set but not used [-Wunused-but-set-variable]
     358 |         struct xfs_inobt_rec_incore     *irec;
         |                                          ^~~~
--
   In file included from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/xfs/xfs_linux.h:31,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_trans.c:7:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
     916 |         readsb(addr, buffer, count);
         |         ^~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25:
   arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 *' {aka 'volatile unsigned char *'} but argument is of type 'const volatile void *'
     101 | static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
         |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:925:9: note: in expansion of macro 'readsw'
     925 |         readsw(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:149:51: note: expected 'volatile u16 *' {aka 'volatile short unsigned int *'} but argument is of type 'const volatile void *'
     149 | static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> arch/m68k/include/asm/io_mm.h:377:44: warning: passing argument 1 of 'raw_insl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     377 | #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:934:9: note: in expansion of macro 'readsl'
     934 |         readsl(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:228:51: note: expected 'volatile u32 *' {aka 'volatile unsigned int *'} but argument is of type 'const volatile void *'
     228 | static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   fs/xfs/xfs_trans.c: In function 'xfs_trans_unreserve_and_mod_sb':
   fs/xfs/xfs_trans.c:600:33: warning: variable 'error' set but not used [-Wunused-but-set-variable]
     600 |         int                     error;
         |                                 ^~~~~
--
   In file included from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from kernel/panic.c:14:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
     916 |         readsb(addr, buffer, count);
         |         ^~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25:
   arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 *' {aka 'volatile unsigned char *'} but argument is of type 'const volatile void *'
     101 | static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
         |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:925:9: note: in expansion of macro 'readsw'
     925 |         readsw(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:149:51: note: expected 'volatile u16 *' {aka 'volatile short unsigned int *'} but argument is of type 'const volatile void *'
     149 | static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> arch/m68k/include/asm/io_mm.h:377:44: warning: passing argument 1 of 'raw_insl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     377 | #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:934:9: note: in expansion of macro 'readsl'
     934 |         readsl(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:228:51: note: expected 'volatile u32 *' {aka 'volatile unsigned int *'} but argument is of type 'const volatile void *'
     228 | static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/panic.c: In function '__warn':
   kernel/panic.c:670:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     670 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
--
   In file included from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from kernel/irq_work.c:14:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
     916 |         readsb(addr, buffer, count);
         |         ^~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25:
   arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 *' {aka 'volatile unsigned char *'} but argument is of type 'const volatile void *'
     101 | static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
         |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:925:9: note: in expansion of macro 'readsw'
     925 |         readsw(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:149:51: note: expected 'volatile u16 *' {aka 'volatile short unsigned int *'} but argument is of type 'const volatile void *'
     149 | static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> arch/m68k/include/asm/io_mm.h:377:44: warning: passing argument 1 of 'raw_insl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     377 | #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
         |                                            ^~~~~~
   include/asm-generic/io.h:934:9: note: in expansion of macro 'readsl'
     934 |         readsl(addr, buffer, count);
         |         ^~~~~~
   arch/m68k/include/asm/raw_io.h:228:51: note: expected 'volatile u32 *' {aka 'volatile unsigned int *'} but argument is of type 'const volatile void *'
     228 | static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
         |                             ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/irq_work.c: At top level:
   kernel/irq_work.c:72:13: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
      72 | void __weak arch_irq_work_raise(void)
         |             ^~~~~~~~~~~~~~~~~~~
..


vim +375 arch/m68k/include/asm/io_mm.h

^1da177e4c3f41 include/asm-m68k/io.h         Linus Torvalds     2005-04-16  374  
f5db9c6a3dd940 arch/m68k/include/asm/io_mm.h Geert Uytterhoeven 2012-04-15 @375  #define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
f5db9c6a3dd940 arch/m68k/include/asm/io_mm.h Geert Uytterhoeven 2012-04-15 @376  #define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
f5db9c6a3dd940 arch/m68k/include/asm/io_mm.h Geert Uytterhoeven 2012-04-15 @377  #define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
f5db9c6a3dd940 arch/m68k/include/asm/io_mm.h Geert Uytterhoeven 2012-04-15  378  #define writesb(port, buf, nr)    raw_outsb((port), (u8 *)(buf), (nr))
f5db9c6a3dd940 arch/m68k/include/asm/io_mm.h Geert Uytterhoeven 2012-04-15  379  #define writesw(port, buf, nr)    raw_outsw((port), (u16 *)(buf), (nr))
f5db9c6a3dd940 arch/m68k/include/asm/io_mm.h Geert Uytterhoeven 2012-04-15  380  #define writesl(port, buf, nr)    raw_outsl((port), (u32 *)(buf), (nr))
f5db9c6a3dd940 arch/m68k/include/asm/io_mm.h Geert Uytterhoeven 2012-04-15  381  

:::::: The code at line 375 was first introduced by commit
:::::: f5db9c6a3dd94033a113a6bd9ccce9f8c28c70b1 m68k: Make sure {read,write}s[bwl]() are always defined

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
