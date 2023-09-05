Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4760ADDA8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693937448; x=1725473448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQOMcceVCSntODqGMfMOGqjX6w8FIToRiGAzYEf++TI=;
  b=Be6fe89q3M6bljPxa7zMP3l06xduTJTIRc+gOljDEs6MGW8KvJl5ZeNe
   W5/FT9pq2PuqQnTBnwHOG7hmDmTHhM/rQK7Jw595Bm0R6raSuAApwSx7Z
   cH71F16DL4Vd6Rq4KpCKO4LMmgdahgtj2vjwY2gvqIfULtu5O1S2P3I0N
   rC151t7owCpy040zz7qXrOe9VadhYggpYJ/Oc5tKTV5WcuyKXPt71i81q
   N//ZccgAEWKMb8VFHXui860PaJ8rAcS9Va0ffxxMeHAXwVN0hECD7563p
   vcCWKQ7OrJVqeqgH2+dmNMLMPq489OxVV/KBuRjNZ9XwU1E37yAbXjqGq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367090745"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="367090745"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 11:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="691011337"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="691011337"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 11:10:43 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdaVP-0001wf-2F;
	Tue, 05 Sep 2023 18:10:38 +0000
Date: Wed, 6 Sep 2023 02:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v6_usb 1/22] lib/iomap.c:268:13: warning:
 'pio_write64be_hi_lo' defined but not used
Message-ID: <202309060114.OTE239NB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v6_usb
head:   b6611ce518273ce615faa222f751df8b42a0f508
commit: 26b198fc45da73b07c7d30d0fc3c36ad23602913 [1/22] iomap: handle HAS_IOPORT dependencies
config: um-randconfig-r035-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060114.OTE239NB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060114.OTE239NB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060114.OTE239NB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/iomap.c:166:5: warning: no previous declaration for 'ioread64_lo_hi' [-Wmissing-declarations]
    u64 ioread64_lo_hi(const void __iomem *addr)
        ^~~~~~~~~~~~~~
   lib/iomap.c:173:5: warning: no previous declaration for 'ioread64_hi_lo' [-Wmissing-declarations]
    u64 ioread64_hi_lo(const void __iomem *addr)
        ^~~~~~~~~~~~~~
   lib/iomap.c:180:5: warning: no previous declaration for 'ioread64be_lo_hi' [-Wmissing-declarations]
    u64 ioread64be_lo_hi(const void __iomem *addr)
        ^~~~~~~~~~~~~~~~
   lib/iomap.c:188:5: warning: no previous declaration for 'ioread64be_hi_lo' [-Wmissing-declarations]
    u64 ioread64be_hi_lo(const void __iomem *addr)
        ^~~~~~~~~~~~~~~~
   lib/iomap.c:274:6: warning: no previous declaration for 'iowrite64_lo_hi' [-Wmissing-declarations]
    void iowrite64_lo_hi(u64 val, void __iomem *addr)
         ^~~~~~~~~~~~~~~
   lib/iomap.c:282:6: warning: no previous declaration for 'iowrite64_hi_lo' [-Wmissing-declarations]
    void iowrite64_hi_lo(u64 val, void __iomem *addr)
         ^~~~~~~~~~~~~~~
   lib/iomap.c:290:6: warning: no previous declaration for 'iowrite64be_lo_hi' [-Wmissing-declarations]
    void iowrite64be_lo_hi(u64 val, void __iomem *addr)
         ^~~~~~~~~~~~~~~~~
   lib/iomap.c:298:6: warning: no previous declaration for 'iowrite64be_hi_lo' [-Wmissing-declarations]
    void iowrite64be_hi_lo(u64 val, void __iomem *addr)
         ^~~~~~~~~~~~~~~~~
>> lib/iomap.c:268:13: warning: 'pio_write64be_hi_lo' defined but not used [-Wunused-function]
    static void pio_write64be_hi_lo(u64 val, unsigned long port)
                ^~~~~~~~~~~~~~~~~~~
>> lib/iomap.c:262:13: warning: 'pio_write64be_lo_hi' defined but not used [-Wunused-function]
    static void pio_write64be_lo_hi(u64 val, unsigned long port)
                ^~~~~~~~~~~~~~~~~~~
>> lib/iomap.c:256:13: warning: 'pio_write64_hi_lo' defined but not used [-Wunused-function]
    static void pio_write64_hi_lo(u64 val, unsigned long port)
                ^~~~~~~~~~~~~~~~~
>> lib/iomap.c:250:13: warning: 'pio_write64_lo_hi' defined but not used [-Wunused-function]
    static void pio_write64_lo_hi(u64 val, unsigned long port)
                ^~~~~~~~~~~~~~~~~
>> lib/iomap.c:155:12: warning: 'pio_read64be_hi_lo' defined but not used [-Wunused-function]
    static u64 pio_read64be_hi_lo(unsigned long port)
               ^~~~~~~~~~~~~~~~~~
>> lib/iomap.c:145:12: warning: 'pio_read64be_lo_hi' defined but not used [-Wunused-function]
    static u64 pio_read64be_lo_hi(unsigned long port)
               ^~~~~~~~~~~~~~~~~~
>> lib/iomap.c:135:12: warning: 'pio_read64_hi_lo' defined but not used [-Wunused-function]
    static u64 pio_read64_hi_lo(unsigned long port)
               ^~~~~~~~~~~~~~~~
>> lib/iomap.c:125:12: warning: 'pio_read64_lo_hi' defined but not used [-Wunused-function]
    static u64 pio_read64_lo_hi(unsigned long port)
               ^~~~~~~~~~~~~~~~


vim +/pio_write64be_hi_lo +268 lib/iomap.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  123  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  124  #ifdef readq
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @125  static u64 pio_read64_lo_hi(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  126  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  127  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  128  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  129  	lo = inl(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  130  	hi = inl(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  131  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  132  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  133  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  134  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @135  static u64 pio_read64_hi_lo(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  136  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  137  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  138  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  139  	hi = inl(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  140  	lo = inl(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  141  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  142  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  143  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  144  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @145  static u64 pio_read64be_lo_hi(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  146  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  147  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  148  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  149  	lo = pio_read32be(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  150  	hi = pio_read32be(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  151  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  152  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  153  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  154  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @155  static u64 pio_read64be_hi_lo(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  156  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  157  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  158  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  159  	hi = pio_read32be(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  160  	lo = pio_read32be(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  161  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  162  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  163  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  164  
a28a4d4723c11f Alexander Potapenko 2022-09-15  165  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  166  u64 ioread64_lo_hi(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  167  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  168  	IO_COND(addr, return pio_read64_lo_hi(port), return readq(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  169  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  170  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  171  
a28a4d4723c11f Alexander Potapenko 2022-09-15  172  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  173  u64 ioread64_hi_lo(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  174  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  175  	IO_COND(addr, return pio_read64_hi_lo(port), return readq(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  176  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  177  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  178  
a28a4d4723c11f Alexander Potapenko 2022-09-15  179  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  180  u64 ioread64be_lo_hi(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  181  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  182  	IO_COND(addr, return pio_read64be_lo_hi(port),
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  183  		return mmio_read64be(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  184  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  185  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  186  
a28a4d4723c11f Alexander Potapenko 2022-09-15  187  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  188  u64 ioread64be_hi_lo(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  189  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  190  	IO_COND(addr, return pio_read64be_hi_lo(port),
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  191  		return mmio_read64be(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  192  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  193  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  194  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  195  EXPORT_SYMBOL(ioread64_lo_hi);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  196  EXPORT_SYMBOL(ioread64_hi_lo);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  197  EXPORT_SYMBOL(ioread64be_lo_hi);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  198  EXPORT_SYMBOL(ioread64be_hi_lo);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  199  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  200  #endif /* readq */
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  201  
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  202  #ifndef pio_write16be
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  203  #define pio_write16be(val,port) outw(swab16(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  204  #define pio_write32be(val,port) outl(swab32(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  205  #endif
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  206  
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  207  #ifndef mmio_write16be
aecc787c06f430 Logan Gunthorpe     2019-01-16  208  #define mmio_write16be(val,port) writew(swab16(val),port)
aecc787c06f430 Logan Gunthorpe     2019-01-16  209  #define mmio_write32be(val,port) writel(swab32(val),port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  210  #define mmio_write64be(val,port) writeq(swab64(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  211  #endif
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  212  
9f741cb8fecef9 Harvey Harrison     2008-02-08  213  void iowrite8(u8 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  214  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  215  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  216  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16  217  	IO_COND(addr, outb(val,port), writeb(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  218  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  219  void iowrite16(u16 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  220  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  221  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  222  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16  223  	IO_COND(addr, outw(val,port), writew(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  224  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  225  void iowrite16be(u16 val, void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  226  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  227  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  228  	kmsan_check_memory(&val, sizeof(val));
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  229  	IO_COND(addr, pio_write16be(val,port), mmio_write16be(val, addr));
dae409a2778877 James Bottomley     2005-04-16  230  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  231  void iowrite32(u32 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  232  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  233  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  234  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16  235  	IO_COND(addr, outl(val,port), writel(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  236  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  237  void iowrite32be(u32 val, void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  238  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  239  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  240  	kmsan_check_memory(&val, sizeof(val));
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  241  	IO_COND(addr, pio_write32be(val,port), mmio_write32be(val, addr));
dae409a2778877 James Bottomley     2005-04-16  242  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  243  EXPORT_SYMBOL(iowrite8);
^1da177e4c3f41 Linus Torvalds      2005-04-16  244  EXPORT_SYMBOL(iowrite16);
dae409a2778877 James Bottomley     2005-04-16  245  EXPORT_SYMBOL(iowrite16be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  246  EXPORT_SYMBOL(iowrite32);
dae409a2778877 James Bottomley     2005-04-16  247  EXPORT_SYMBOL(iowrite32be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  248  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  249  #ifdef writeq
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @250  static void pio_write64_lo_hi(u64 val, unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  251  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  252  	outl(val, port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  253  	outl(val >> 32, port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  254  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  255  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @256  static void pio_write64_hi_lo(u64 val, unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  257  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  258  	outl(val >> 32, port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  259  	outl(val, port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  260  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  261  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @262  static void pio_write64be_lo_hi(u64 val, unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  263  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  264  	pio_write32be(val, port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  265  	pio_write32be(val >> 32, port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  266  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  267  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16 @268  static void pio_write64be_hi_lo(u64 val, unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  269  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  270  	pio_write32be(val >> 32, port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  271  	pio_write32be(val, port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  272  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  273  

:::::: The code at line 268 was first introduced by commit
:::::: 79bf0cbd86ac4887a7ac897fec8f011a763e23ba iomap: introduce io{read|write}64_{lo_hi|hi_lo}

:::::: TO: Logan Gunthorpe <logang@deltatee.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
