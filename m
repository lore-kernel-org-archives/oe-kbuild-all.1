Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C415200A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683914095; x=1715450095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxhH9lrc1dGIEb7zDIfgHQirmOiyWaPXD34bvUCCG0c=;
  b=b+kE7WudjOmt1uP4PvMi0KgxEH1MUZWrqBR4cHkJNe1cohZCBvvCHnKb
   /mZ+LucJ8aHFArvCfb74GsIlTxGd+5wBGaKsN9CnUIlvcOtBk0uyJ2pBe
   C+G55obpvm6S5LZXdRTDLUoVGlqCdIsuUrmp8pzHfXPs75NV/HJReR17c
   GASy5eR7WZ0t9YmgBZsJPjdb118YUCjiHFFKtS9Y8YStEI98AoAz7gYXx
   0Z9C2A/rVxQ+SAQsRoMtyNVoWvphVDsekn0U6FJYneE+iFFq9wiCkmyHp
   JMCRSXpLQjEthAIpyp+BUKn9R6n7/O9vtpysTGslxym7j79zMYreTM4U1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349690573"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="349690573"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 10:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812173297"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="812173297"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 10:54:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxWyi-00050u-0j;
	Fri, 12 May 2023 17:54:52 +0000
Date: Sat, 13 May 2023 01:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 41/41] include/asm-generic/io.h:559:14: error:
 call to '_inw' declared with attribute error: inw() requires
 CONFIG_HAS_IOPORT
Message-ID: <202305130159.B1iJbF4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   4be9bb8ca052891e7f668d41946b0a481250974a
commit: 4be9bb8ca052891e7f668d41946b0a481250974a [41/41] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
config: m68k-randconfig-r002-20230511 (https://download.01.org/0day-ci/archive/20230513/202305130159.B1iJbF4B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=4be9bb8ca052891e7f668d41946b0a481250974a
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 4be9bb8ca052891e7f668d41946b0a481250974a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130159.B1iJbF4B-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/iomap.c: In function 'ioread8':
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   lib/iomap.c:81:30: note: in expansion of macro 'inb'
      81 |         IO_COND(addr, return inb(port), return readb(addr));
         |                              ^~~
   lib/iomap.c: In function 'ioread16':
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   lib/iomap.c:87:30: note: in expansion of macro 'inw'
      87 |         IO_COND(addr, return inw(port), return readw(addr));
         |                              ^~~
   lib/iomap.c: In function 'ioread32':
>> include/asm-generic/io.h:577:14: error: call to '_inl' declared with attribute error: inl() requires CONFIG_HAS_IOPORT
     577 | #define _inl _inl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:650:13: note: in expansion of macro '_inl'
     650 | #define inl _inl
         |             ^~~~
   lib/iomap.c:99:30: note: in expansion of macro 'inl'
      99 |         IO_COND(addr, return inl(port), return readl(addr));
         |                              ^~~
   lib/iomap.c: In function 'iowrite8':
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   lib/iomap.c:207:23: note: in expansion of macro 'outb'
     207 |         IO_COND(addr, outb(val,port), writeb(val, addr));
         |                       ^~~~
   lib/iomap.c: In function 'iowrite16':
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   lib/iomap.c:213:23: note: in expansion of macro 'outw'
     213 |         IO_COND(addr, outw(val,port), writew(val, addr));
         |                       ^~~~
   lib/iomap.c: In function 'iowrite32':
>> include/asm-generic/io.h:625:15: error: call to '_outl' declared with attribute error: outl() requires CONFIG_HAS_IOPORT
     625 | #define _outl _outl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:662:14: note: in expansion of macro '_outl'
     662 | #define outl _outl
         |              ^~~~~
   lib/iomap.c:225:23: note: in expansion of macro 'outl'
     225 |         IO_COND(addr, outl(val,port), writel(val, addr));
         |                       ^~~~
   lib/iomap.c: In function 'iowrite32be':
>> include/asm-generic/io.h:625:15: error: call to '_outl' declared with attribute error: outl() requires CONFIG_HAS_IOPORT
     625 | #define _outl _outl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:662:14: note: in expansion of macro '_outl'
     662 | #define outl _outl
         |              ^~~~~
   lib/iomap.c:194:33: note: in expansion of macro 'outl'
     194 | #define pio_write32be(val,port) outl(swab32(val),port)
         |                                 ^~~~
   lib/iomap.c:231:23: note: in expansion of macro 'pio_write32be'
     231 |         IO_COND(addr, pio_write32be(val,port), mmio_write32be(val, addr));
         |                       ^~~~~~~~~~~~~
   lib/iomap.c: In function 'ioread8_rep':
>> include/asm-generic/io.h:719:14: error: call to 'insb' declared with attribute error: insb() requires HAS_IOPORT
     719 | #define insb insb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:362:23: note: in expansion of macro 'insb'
     362 |         IO_COND(addr, insb(port,dst,count), mmio_insb(addr, dst, count));
         |                       ^~~~
   lib/iomap.c: In function 'ioread16_rep':
>> include/asm-generic/io.h:732:14: error: call to 'insw' declared with attribute error: insw() requires HAS_IOPORT
     732 | #define insw insw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:368:23: note: in expansion of macro 'insw'
     368 |         IO_COND(addr, insw(port,dst,count), mmio_insw(addr, dst, count));
         |                       ^~~~
   lib/iomap.c: In function 'ioread32_rep':
>> include/asm-generic/io.h:745:14: error: call to 'insl' declared with attribute error: insl() requires HAS_IOPORT
     745 | #define insl insl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:374:23: note: in expansion of macro 'insl'
     374 |         IO_COND(addr, insl(port,dst,count), mmio_insl(addr, dst, count));
         |                       ^~~~
   lib/iomap.c: In function 'iowrite8_rep':
>> include/asm-generic/io.h:758:15: error: call to 'outsb' declared with attribute error: outsb() requires HAS_IOPORT
     758 | #define outsb outsb
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:386:23: note: in expansion of macro 'outsb'
     386 |         IO_COND(addr, outsb(port, src, count), mmio_outsb(addr, src, count));
         |                       ^~~~~
   lib/iomap.c: In function 'iowrite16_rep':
>> include/asm-generic/io.h:772:15: error: call to 'outsw' declared with attribute error: outsw() requires HAS_IOPORT
     772 | #define outsw outsw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:392:23: note: in expansion of macro 'outsw'
     392 |         IO_COND(addr, outsw(port, src, count), mmio_outsw(addr, src, count));
         |                       ^~~~~
   lib/iomap.c: In function 'iowrite32_rep':
>> include/asm-generic/io.h:786:15: error: call to 'outsl' declared with attribute error: outsl() requires HAS_IOPORT
     786 | #define outsl outsl
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   lib/iomap.c:398:23: note: in expansion of macro 'outsl'
     398 |         IO_COND(addr, outsl(port, src,count), mmio_outsl(addr, src, count));
         |                       ^~~~~
   lib/iomap.c: In function 'ioread16be':
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/linux/swab.h:7:17: note: in expansion of macro '__swab16'
       7 | # define swab16 __swab16
         |                 ^~~~~~~~
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   lib/iomap.c:64:35: note: in expansion of macro 'inw'
      64 | #define pio_read16be(port) swab16(inw(port))
         |                                   ^~~
   lib/iomap.c:93:30: note: in expansion of macro 'pio_read16be'
      93 |         IO_COND(addr, return pio_read16be(port), return mmio_read16be(addr));
         |                              ^~~~~~~~~~~~
   lib/iomap.c: In function 'ioread32be':
>> include/uapi/linux/swab.h:120:9: error: call to '_inl' declared with attribute error: inl() requires CONFIG_HAS_IOPORT
     120 |         __fswab32(x))
         |         ^~~~~~~~~~~~
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/linux/swab.h:8:17: note: in expansion of macro '__swab32'
       8 | # define swab32 __swab32
         |                 ^~~~~~~~
   lib/iomap.c:65:28: note: in expansion of macro 'swab32'
      65 | #define pio_read32be(port) swab32(inl(port))
         |                            ^~~~~~
   lib/iomap.c:105:30: note: in expansion of macro 'pio_read32be'
     105 |         IO_COND(addr, return pio_read32be(port), return mmio_read32be(addr));
         |                              ^~~~~~~~~~~~
   lib/iomap.c: In function 'iowrite16be':
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
      58 |                 is_pio;                                         \
         |                 ^~~~~~
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   lib/iomap.c:193:33: note: in expansion of macro 'outw'
     193 | #define pio_write16be(val,port) outw(swab16(val),port)
         |                                 ^~~~
   lib/iomap.c:219:23: note: in expansion of macro 'pio_write16be'
     219 |         IO_COND(addr, pio_write16be(val,port), mmio_write16be(val, addr));
         |                       ^~~~~~~~~~~~~


vim +/_inw +559 include/asm-generic/io.h

9216efafc52ff9 Thierry Reding  2014-10-01  557  
f009c89df79abe John Garry      2020-03-28  558  #if !defined(inw) && !defined(_inw)
f009c89df79abe John Garry      2020-03-28 @559  #define _inw _inw
4be9bb8ca05289 Niklas Schnelle 2021-12-20  560  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  561  static inline u16 _inw(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  562  {
87fe2d543f8173 Sinan Kaya      2018-04-05  563  	u16 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  564  
87fe2d543f8173 Sinan Kaya      2018-04-05  565  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  566  	val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  567  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  568  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  569  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  570  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  571  u16 _inw(unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  572  	__compiletime_error("inw() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  573  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  574  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  575  
f009c89df79abe John Garry      2020-03-28  576  #if !defined(inl) && !defined(_inl)
f009c89df79abe John Garry      2020-03-28 @577  #define _inl _inl
4be9bb8ca05289 Niklas Schnelle 2021-12-20  578  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  579  static inline u32 _inl(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  580  {
87fe2d543f8173 Sinan Kaya      2018-04-05  581  	u32 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  582  
87fe2d543f8173 Sinan Kaya      2018-04-05  583  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  584  	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  585  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  586  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  587  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  588  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  589  u32 _inl(unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  590  	__compiletime_error("inl() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  591  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  592  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  593  
f009c89df79abe John Garry      2020-03-28  594  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28  595  #define _outb _outb
4be9bb8ca05289 Niklas Schnelle 2021-12-20  596  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  597  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  598  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  599  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  602  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  603  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  604  void _outb(u8 value, unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  605  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  606  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  
f009c89df79abe John Garry      2020-03-28  609  #if !defined(outw) && !defined(_outw)
f009c89df79abe John Garry      2020-03-28 @610  #define _outw _outw
4be9bb8ca05289 Niklas Schnelle 2021-12-20  611  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  612  static inline void _outw(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  613  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  614  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  615  	__raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  616  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  617  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  618  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  619  void _outw(u16 value, unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  620  	__compiletime_error("outw() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  621  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  622  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  623  
f009c89df79abe John Garry      2020-03-28  624  #if !defined(outl) && !defined(_outl)
f009c89df79abe John Garry      2020-03-28 @625  #define _outl _outl
4be9bb8ca05289 Niklas Schnelle 2021-12-20  626  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  627  static inline void _outl(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  628  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  629  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  630  	__raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  631  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  632  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  633  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  634  void _outl(u32 value, unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  635  	__compiletime_error("outl() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  636  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  637  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  638  
f009c89df79abe John Garry      2020-03-28  639  #include <linux/logic_pio.h>
f009c89df79abe John Garry      2020-03-28  640  
f009c89df79abe John Garry      2020-03-28  641  #ifndef inb
f009c89df79abe John Garry      2020-03-28  642  #define inb _inb
f009c89df79abe John Garry      2020-03-28  643  #endif
f009c89df79abe John Garry      2020-03-28  644  
f009c89df79abe John Garry      2020-03-28  645  #ifndef inw
f009c89df79abe John Garry      2020-03-28  646  #define inw _inw
f009c89df79abe John Garry      2020-03-28  647  #endif
f009c89df79abe John Garry      2020-03-28  648  
f009c89df79abe John Garry      2020-03-28  649  #ifndef inl
f009c89df79abe John Garry      2020-03-28  650  #define inl _inl
f009c89df79abe John Garry      2020-03-28  651  #endif
f009c89df79abe John Garry      2020-03-28  652  
f009c89df79abe John Garry      2020-03-28  653  #ifndef outb
f009c89df79abe John Garry      2020-03-28  654  #define outb _outb
f009c89df79abe John Garry      2020-03-28  655  #endif
f009c89df79abe John Garry      2020-03-28  656  
f009c89df79abe John Garry      2020-03-28  657  #ifndef outw
f009c89df79abe John Garry      2020-03-28  658  #define outw _outw
f009c89df79abe John Garry      2020-03-28  659  #endif
f009c89df79abe John Garry      2020-03-28  660  
f009c89df79abe John Garry      2020-03-28  661  #ifndef outl
f009c89df79abe John Garry      2020-03-28  662  #define outl _outl
f009c89df79abe John Garry      2020-03-28  663  #endif
f009c89df79abe John Garry      2020-03-28  664  
9216efafc52ff9 Thierry Reding  2014-10-01  665  #ifndef inb_p
9216efafc52ff9 Thierry Reding  2014-10-01  666  #define inb_p inb_p
9216efafc52ff9 Thierry Reding  2014-10-01  667  static inline u8 inb_p(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  668  {
9216efafc52ff9 Thierry Reding  2014-10-01  669  	return inb(addr);
9216efafc52ff9 Thierry Reding  2014-10-01  670  }
9216efafc52ff9 Thierry Reding  2014-10-01  671  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  672  
9216efafc52ff9 Thierry Reding  2014-10-01  673  #ifndef inw_p
9216efafc52ff9 Thierry Reding  2014-10-01  674  #define inw_p inw_p
9216efafc52ff9 Thierry Reding  2014-10-01  675  static inline u16 inw_p(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  676  {
9216efafc52ff9 Thierry Reding  2014-10-01  677  	return inw(addr);
9216efafc52ff9 Thierry Reding  2014-10-01  678  }
9216efafc52ff9 Thierry Reding  2014-10-01  679  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  680  
9216efafc52ff9 Thierry Reding  2014-10-01  681  #ifndef inl_p
9216efafc52ff9 Thierry Reding  2014-10-01  682  #define inl_p inl_p
9216efafc52ff9 Thierry Reding  2014-10-01  683  static inline u32 inl_p(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  684  {
9216efafc52ff9 Thierry Reding  2014-10-01  685  	return inl(addr);
9216efafc52ff9 Thierry Reding  2014-10-01  686  }
9216efafc52ff9 Thierry Reding  2014-10-01  687  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  688  
9216efafc52ff9 Thierry Reding  2014-10-01  689  #ifndef outb_p
9216efafc52ff9 Thierry Reding  2014-10-01  690  #define outb_p outb_p
9216efafc52ff9 Thierry Reding  2014-10-01  691  static inline void outb_p(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  692  {
9216efafc52ff9 Thierry Reding  2014-10-01  693  	outb(value, addr);
9216efafc52ff9 Thierry Reding  2014-10-01  694  }
9216efafc52ff9 Thierry Reding  2014-10-01  695  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  696  
9216efafc52ff9 Thierry Reding  2014-10-01  697  #ifndef outw_p
9216efafc52ff9 Thierry Reding  2014-10-01  698  #define outw_p outw_p
9216efafc52ff9 Thierry Reding  2014-10-01  699  static inline void outw_p(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  700  {
9216efafc52ff9 Thierry Reding  2014-10-01  701  	outw(value, addr);
9216efafc52ff9 Thierry Reding  2014-10-01  702  }
9216efafc52ff9 Thierry Reding  2014-10-01  703  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  704  
9216efafc52ff9 Thierry Reding  2014-10-01  705  #ifndef outl_p
9216efafc52ff9 Thierry Reding  2014-10-01  706  #define outl_p outl_p
9216efafc52ff9 Thierry Reding  2014-10-01  707  static inline void outl_p(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  708  {
9216efafc52ff9 Thierry Reding  2014-10-01  709  	outl(value, addr);
9216efafc52ff9 Thierry Reding  2014-10-01  710  }
9216efafc52ff9 Thierry Reding  2014-10-01  711  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  712  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  713  /*
9ab3a7a0d2b417 Thierry Reding  2014-07-04  714   * {in,out}s{b,w,l}{,_p}() are variants of the above that repeatedly access a
9ab3a7a0d2b417 Thierry Reding  2014-07-04  715   * single I/O port multiple times.
9ab3a7a0d2b417 Thierry Reding  2014-07-04  716   */
9ab3a7a0d2b417 Thierry Reding  2014-07-04  717  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  718  #ifndef insb
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @719  #define insb insb
4be9bb8ca05289 Niklas Schnelle 2021-12-20  720  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  721  static inline void insb(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  722  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  723  	readsb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  724  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  725  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  726  void insb(unsigned long addr, void *buffer, unsigned int count)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  727  	__compiletime_error("insb() requires HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  728  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  729  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  730  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  731  #ifndef insw
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @732  #define insw insw
4be9bb8ca05289 Niklas Schnelle 2021-12-20  733  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  734  static inline void insw(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  735  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  736  	readsw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  737  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  738  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  739  void insw(unsigned long addr, void *buffer, unsigned int count)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  740  	__compiletime_error("insw() requires HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  741  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  742  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  743  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  744  #ifndef insl
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @745  #define insl insl
4be9bb8ca05289 Niklas Schnelle 2021-12-20  746  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  747  static inline void insl(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  748  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  749  	readsl(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  750  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  751  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  752  void insl(unsigned long addr, void *buffer, unsigned int count)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  753  	__compiletime_error("insl() requires HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  754  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  755  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  756  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  757  #ifndef outsb
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @758  #define outsb outsb
4be9bb8ca05289 Niklas Schnelle 2021-12-20  759  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  760  static inline void outsb(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding  2014-07-04  761  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  762  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  763  	writesb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  764  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  765  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  766  void outsb(unsigned long addr, const void *buffer, unsigned int count)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  767  	__compiletime_error("outsb() requires HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  768  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  769  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  770  

:::::: The code at line 559 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
