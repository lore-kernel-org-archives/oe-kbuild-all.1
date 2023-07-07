Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C4E2F28
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 23:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688772099; x=1720308099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOhDLXrRhBcX/3y4Y15J1ndiOtuDTsMu8W+Ti08Znu0=;
  b=Oi0VZhAGiyv3CilLOYEoTd2BOeJAAjLkba19miynbRQmoAm80CHvSvLF
   97SCOSx50MlkkcUPP9buB9eiar23516eZRSZT5G4VMVgK8x+odjLz566F
   ECRGlqLsHZejhZfRIuKEe2hra8nQ8QKSBrosgUi5JTjl71YwMv4Ml/1fi
   poaW1HzhKEllmq/Fe4Y10aAJkw/udBOz/CFKVNaMDjGApR6ftGJQd/e6A
   O2Q7C/lCsUOG4QA4TGuwC5ftlDOodhNcoDZvrSul9ran8WDzNf400yIOE
   B+uCsW3/QDXmsDlg+oxSaeHKn39X1jlRexheEkbDyI4z6ldlYW2GZsVs1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="344330145"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="344330145"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 16:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="833569998"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="833569998"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2023 16:21:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHulE-0002NG-1J;
	Fri, 07 Jul 2023 23:21:12 +0000
Date: Sat, 8 Jul 2023 07:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 13243/13370] include/asm-generic/io.h:636:15:
 error: redefinition of 'inb_p'
Message-ID: <202307080722.PsQUe5E5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   123212f53f3e394c1ae69a58c05dfdda56fec8c6
commit: e27fd938d82e67ad6abc49b1ee5420348246528d [13243/13370] sh: add <asm-generic/io.h> including
config: sh-hp6xx_defconfig (https://download.01.org/0day-ci/archive/20230708/202307080722.PsQUe5E5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080722.PsQUe5E5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080722.PsQUe5E5-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   In file included from arch/sh/include/asm/io.h:313,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/sh/kernel/asm-offsets.c:16:
>> include/asm-generic/io.h:636:15: error: redefinition of 'inb_p'
     636 | #define inb_p inb_p
         |               ^~~~~
   include/asm-generic/io.h:637:18: note: in expansion of macro 'inb_p'
     637 | static inline u8 inb_p(unsigned long addr)
         |                  ^~~~~
   arch/sh/include/asm/io.h:185:25: note: previous definition of 'inb_p' with type 'u8(long unsigned int)' {aka 'unsigned char(long unsigned int)'}
     185 | static inline type pfx##in##bwlq##p(unsigned long port)                 \
         |                         ^~
   arch/sh/include/asm/io.h:199:9: note: in expansion of macro '__BUILD_IOPORT_SINGLE'
     199 |         __BUILD_IOPORT_SINGLE(bus, bwlq, type, _p, SLOW_DOWN_IO)
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:202:9: note: in expansion of macro '__BUILD_IOPORT_PFX'
     202 |         __BUILD_IOPORT_PFX(, bwlq, type)
         |         ^~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:204:1: note: in expansion of macro 'BUILDIO_IOPORT'
     204 | BUILDIO_IOPORT(b, u8)
         | ^~~~~~~~~~~~~~
>> include/asm-generic/io.h:644:15: error: redefinition of 'inw_p'
     644 | #define inw_p inw_p
         |               ^~~~~
   include/asm-generic/io.h:645:19: note: in expansion of macro 'inw_p'
     645 | static inline u16 inw_p(unsigned long addr)
         |                   ^~~~~
   arch/sh/include/asm/io.h:185:25: note: previous definition of 'inw_p' with type 'u16(long unsigned int)' {aka 'short unsigned int(long unsigned int)'}
     185 | static inline type pfx##in##bwlq##p(unsigned long port)                 \
         |                         ^~
   arch/sh/include/asm/io.h:199:9: note: in expansion of macro '__BUILD_IOPORT_SINGLE'
     199 |         __BUILD_IOPORT_SINGLE(bus, bwlq, type, _p, SLOW_DOWN_IO)
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:202:9: note: in expansion of macro '__BUILD_IOPORT_PFX'
     202 |         __BUILD_IOPORT_PFX(, bwlq, type)
         |         ^~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:205:1: note: in expansion of macro 'BUILDIO_IOPORT'
     205 | BUILDIO_IOPORT(w, u16)
         | ^~~~~~~~~~~~~~
>> include/asm-generic/io.h:652:15: error: redefinition of 'inl_p'
     652 | #define inl_p inl_p
         |               ^~~~~
   include/asm-generic/io.h:653:19: note: in expansion of macro 'inl_p'
     653 | static inline u32 inl_p(unsigned long addr)
         |                   ^~~~~
   arch/sh/include/asm/io.h:185:25: note: previous definition of 'inl_p' with type 'u32(long unsigned int)' {aka 'unsigned int(long unsigned int)'}
     185 | static inline type pfx##in##bwlq##p(unsigned long port)                 \
         |                         ^~
   arch/sh/include/asm/io.h:199:9: note: in expansion of macro '__BUILD_IOPORT_SINGLE'
     199 |         __BUILD_IOPORT_SINGLE(bus, bwlq, type, _p, SLOW_DOWN_IO)
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:202:9: note: in expansion of macro '__BUILD_IOPORT_PFX'
     202 |         __BUILD_IOPORT_PFX(, bwlq, type)
         |         ^~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:206:1: note: in expansion of macro 'BUILDIO_IOPORT'
     206 | BUILDIO_IOPORT(l, u32)
         | ^~~~~~~~~~~~~~
>> include/asm-generic/io.h:660:16: error: redefinition of 'outb_p'
     660 | #define outb_p outb_p
         |                ^~~~~~
   include/asm-generic/io.h:661:20: note: in expansion of macro 'outb_p'
     661 | static inline void outb_p(u8 value, unsigned long addr)
         |                    ^~~~~~
   arch/sh/include/asm/io.h:176:25: note: previous definition of 'outb_p' with type 'void(u8,  long unsigned int)' {aka 'void(unsigned char,  long unsigned int)'}
     176 | static inline void pfx##out##bwlq##p(type val, unsigned long port)      \
         |                         ^~~
   arch/sh/include/asm/io.h:199:9: note: in expansion of macro '__BUILD_IOPORT_SINGLE'
     199 |         __BUILD_IOPORT_SINGLE(bus, bwlq, type, _p, SLOW_DOWN_IO)
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:202:9: note: in expansion of macro '__BUILD_IOPORT_PFX'
     202 |         __BUILD_IOPORT_PFX(, bwlq, type)
         |         ^~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:204:1: note: in expansion of macro 'BUILDIO_IOPORT'
     204 | BUILDIO_IOPORT(b, u8)
         | ^~~~~~~~~~~~~~
>> include/asm-generic/io.h:668:16: error: redefinition of 'outw_p'
     668 | #define outw_p outw_p
         |                ^~~~~~
   include/asm-generic/io.h:669:20: note: in expansion of macro 'outw_p'
     669 | static inline void outw_p(u16 value, unsigned long addr)
         |                    ^~~~~~
   arch/sh/include/asm/io.h:176:25: note: previous definition of 'outw_p' with type 'void(u16,  long unsigned int)' {aka 'void(short unsigned int,  long unsigned int)'}
     176 | static inline void pfx##out##bwlq##p(type val, unsigned long port)      \
         |                         ^~~
   arch/sh/include/asm/io.h:199:9: note: in expansion of macro '__BUILD_IOPORT_SINGLE'
     199 |         __BUILD_IOPORT_SINGLE(bus, bwlq, type, _p, SLOW_DOWN_IO)
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:202:9: note: in expansion of macro '__BUILD_IOPORT_PFX'
     202 |         __BUILD_IOPORT_PFX(, bwlq, type)
         |         ^~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:205:1: note: in expansion of macro 'BUILDIO_IOPORT'
     205 | BUILDIO_IOPORT(w, u16)
         | ^~~~~~~~~~~~~~
>> include/asm-generic/io.h:676:16: error: redefinition of 'outl_p'
     676 | #define outl_p outl_p
         |                ^~~~~~
   include/asm-generic/io.h:677:20: note: in expansion of macro 'outl_p'
     677 | static inline void outl_p(u32 value, unsigned long addr)
         |                    ^~~~~~
   arch/sh/include/asm/io.h:176:25: note: previous definition of 'outl_p' with type 'void(u32,  long unsigned int)' {aka 'void(unsigned int,  long unsigned int)'}
     176 | static inline void pfx##out##bwlq##p(type val, unsigned long port)      \
         |                         ^~~
   arch/sh/include/asm/io.h:199:9: note: in expansion of macro '__BUILD_IOPORT_SINGLE'
     199 |         __BUILD_IOPORT_SINGLE(bus, bwlq, type, _p, SLOW_DOWN_IO)
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:202:9: note: in expansion of macro '__BUILD_IOPORT_PFX'
     202 |         __BUILD_IOPORT_PFX(, bwlq, type)
         |         ^~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/io.h:206:1: note: in expansion of macro 'BUILDIO_IOPORT'
     206 | BUILDIO_IOPORT(l, u32)
         | ^~~~~~~~~~~~~~
>> include/asm-generic/io.h:689:14: error: redefinition of 'insb'
     689 | #define insb insb
         |              ^~~~
   include/asm-generic/io.h:690:20: note: in expansion of macro 'insb'
     690 | static inline void insb(unsigned long addr, void *buffer, unsigned int count)
         |                    ^~~~
   arch/sh/include/asm/io.h:222:20: note: previous definition of 'insb' with type 'void(long unsigned int,  void *, unsigned int)'
     222 | static inline void ins##bwlq(unsigned long port, void *addr,            \
         |                    ^~~
   arch/sh/include/asm/io.h:233:1: note: in expansion of macro '__BUILD_IOPORT_STRING'
     233 | __BUILD_IOPORT_STRING(b, u8)
         | ^~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/io.h:697:14: error: redefinition of 'insw'
     697 | #define insw insw
         |              ^~~~
   include/asm-generic/io.h:698:20: note: in expansion of macro 'insw'
     698 | static inline void insw(unsigned long addr, void *buffer, unsigned int count)
         |                    ^~~~
   arch/sh/include/asm/io.h:222:20: note: previous definition of 'insw' with type 'void(long unsigned int,  void *, unsigned int)'
     222 | static inline void ins##bwlq(unsigned long port, void *addr,            \
         |                    ^~~
   arch/sh/include/asm/io.h:234:1: note: in expansion of macro '__BUILD_IOPORT_STRING'
     234 | __BUILD_IOPORT_STRING(w, u16)
         | ^~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/io.h:705:14: error: redefinition of 'insl'
     705 | #define insl insl
         |              ^~~~
   include/asm-generic/io.h:706:20: note: in expansion of macro 'insl'
     706 | static inline void insl(unsigned long addr, void *buffer, unsigned int count)
         |                    ^~~~
   arch/sh/include/asm/io.h:222:20: note: previous definition of 'insl' with type 'void(long unsigned int,  void *, unsigned int)'
     222 | static inline void ins##bwlq(unsigned long port, void *addr,            \
         |                    ^~~
   arch/sh/include/asm/io.h:235:1: note: in expansion of macro '__BUILD_IOPORT_STRING'
     235 | __BUILD_IOPORT_STRING(l, u32)
         | ^~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/io.h:713:15: error: redefinition of 'outsb'
     713 | #define outsb outsb
         |               ^~~~~
   include/asm-generic/io.h:714:20: note: in expansion of macro 'outsb'
     714 | static inline void outsb(unsigned long addr, const void *buffer,
         |                    ^~~~~
   arch/sh/include/asm/io.h:211:20: note: previous definition of 'outsb' with type 'void(long unsigned int,  const void *, unsigned int)'
     211 | static inline void outs##bwlq(unsigned long port, const void *addr,     \
         |                    ^~~~
   arch/sh/include/asm/io.h:233:1: note: in expansion of macro '__BUILD_IOPORT_STRING'
     233 | __BUILD_IOPORT_STRING(b, u8)
         | ^~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/io.h:722:15: error: redefinition of 'outsw'
     722 | #define outsw outsw
         |               ^~~~~
   include/asm-generic/io.h:723:20: note: in expansion of macro 'outsw'
     723 | static inline void outsw(unsigned long addr, const void *buffer,
         |                    ^~~~~
   arch/sh/include/asm/io.h:211:20: note: previous definition of 'outsw' with type 'void(long unsigned int,  const void *, unsigned int)'
     211 | static inline void outs##bwlq(unsigned long port, const void *addr,     \
         |                    ^~~~
   arch/sh/include/asm/io.h:234:1: note: in expansion of macro '__BUILD_IOPORT_STRING'
     234 | __BUILD_IOPORT_STRING(w, u16)
         | ^~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/io.h:731:15: error: redefinition of 'outsl'
     731 | #define outsl outsl
         |               ^~~~~
   include/asm-generic/io.h:732:20: note: in expansion of macro 'outsl'
     732 | static inline void outsl(unsigned long addr, const void *buffer,
         |                    ^~~~~
   arch/sh/include/asm/io.h:211:20: note: previous definition of 'outsl' with type 'void(long unsigned int,  const void *, unsigned int)'
     211 | static inline void outs##bwlq(unsigned long port, const void *addr,     \
         |                    ^~~~
   arch/sh/include/asm/io.h:235:1: note: in expansion of macro '__BUILD_IOPORT_STRING'
     235 | __BUILD_IOPORT_STRING(l, u32)
         | ^~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/io.h:1137:20: error: static declaration of 'ioport_map' follows non-static declaration
    1137 | #define ioport_map ioport_map
         |                    ^~~~~~~~~~
   include/asm-generic/io.h:1138:29: note: in expansion of macro 'ioport_map'
    1138 | static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
         |                             ^~~~~~~~~~
   In file included from arch/sh/include/asm/io.h:22:
   include/asm-generic/iomap.h:92:22: note: previous declaration of 'ioport_map' with type 'void *(long unsigned int,  unsigned int)'
      92 | extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
         |                      ^~~~~~~~~~
>> include/asm-generic/io.h:1147:22: error: static declaration of 'ioport_unmap' follows non-static declaration
    1147 | #define ioport_unmap ioport_unmap
         |                      ^~~~~~~~~~~~
   include/asm-generic/io.h:1148:20: note: in expansion of macro 'ioport_unmap'
    1148 | static inline void ioport_unmap(void __iomem *p)
         |                    ^~~~~~~~~~~~
   include/asm-generic/iomap.h:93:13: note: previous declaration of 'ioport_unmap' with type 'void(void *)'
      93 | extern void ioport_unmap(void __iomem *);
         |             ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/inb_p +636 include/asm-generic/io.h

f009c89df79abe John Garry     2020-03-28  634  
9216efafc52ff9 Thierry Reding 2014-10-01  635  #ifndef inb_p
9216efafc52ff9 Thierry Reding 2014-10-01 @636  #define inb_p inb_p
9216efafc52ff9 Thierry Reding 2014-10-01  637  static inline u8 inb_p(unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  638  {
9216efafc52ff9 Thierry Reding 2014-10-01  639  	return inb(addr);
9216efafc52ff9 Thierry Reding 2014-10-01  640  }
9216efafc52ff9 Thierry Reding 2014-10-01  641  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  642  
9216efafc52ff9 Thierry Reding 2014-10-01  643  #ifndef inw_p
9216efafc52ff9 Thierry Reding 2014-10-01 @644  #define inw_p inw_p
9216efafc52ff9 Thierry Reding 2014-10-01  645  static inline u16 inw_p(unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  646  {
9216efafc52ff9 Thierry Reding 2014-10-01  647  	return inw(addr);
9216efafc52ff9 Thierry Reding 2014-10-01  648  }
9216efafc52ff9 Thierry Reding 2014-10-01  649  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  650  
9216efafc52ff9 Thierry Reding 2014-10-01  651  #ifndef inl_p
9216efafc52ff9 Thierry Reding 2014-10-01 @652  #define inl_p inl_p
9216efafc52ff9 Thierry Reding 2014-10-01  653  static inline u32 inl_p(unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  654  {
9216efafc52ff9 Thierry Reding 2014-10-01  655  	return inl(addr);
9216efafc52ff9 Thierry Reding 2014-10-01  656  }
9216efafc52ff9 Thierry Reding 2014-10-01  657  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  658  
9216efafc52ff9 Thierry Reding 2014-10-01  659  #ifndef outb_p
9216efafc52ff9 Thierry Reding 2014-10-01 @660  #define outb_p outb_p
9216efafc52ff9 Thierry Reding 2014-10-01  661  static inline void outb_p(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  662  {
9216efafc52ff9 Thierry Reding 2014-10-01  663  	outb(value, addr);
9216efafc52ff9 Thierry Reding 2014-10-01  664  }
9216efafc52ff9 Thierry Reding 2014-10-01  665  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  666  
9216efafc52ff9 Thierry Reding 2014-10-01  667  #ifndef outw_p
9216efafc52ff9 Thierry Reding 2014-10-01 @668  #define outw_p outw_p
9216efafc52ff9 Thierry Reding 2014-10-01  669  static inline void outw_p(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  670  {
9216efafc52ff9 Thierry Reding 2014-10-01  671  	outw(value, addr);
9216efafc52ff9 Thierry Reding 2014-10-01  672  }
9216efafc52ff9 Thierry Reding 2014-10-01  673  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  674  
9216efafc52ff9 Thierry Reding 2014-10-01  675  #ifndef outl_p
9216efafc52ff9 Thierry Reding 2014-10-01 @676  #define outl_p outl_p
9216efafc52ff9 Thierry Reding 2014-10-01  677  static inline void outl_p(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  678  {
9216efafc52ff9 Thierry Reding 2014-10-01  679  	outl(value, addr);
9216efafc52ff9 Thierry Reding 2014-10-01  680  }
9216efafc52ff9 Thierry Reding 2014-10-01  681  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  682  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  683  /*
9ab3a7a0d2b417 Thierry Reding 2014-07-04  684   * {in,out}s{b,w,l}{,_p}() are variants of the above that repeatedly access a
9ab3a7a0d2b417 Thierry Reding 2014-07-04  685   * single I/O port multiple times.
9ab3a7a0d2b417 Thierry Reding 2014-07-04  686   */
9ab3a7a0d2b417 Thierry Reding 2014-07-04  687  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  688  #ifndef insb
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @689  #define insb insb
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @690  static inline void insb(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  691  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  692  	readsb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  693  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  694  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  695  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  696  #ifndef insw
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @697  #define insw insw
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @698  static inline void insw(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  699  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  700  	readsw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  701  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  702  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  703  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  704  #ifndef insl
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @705  #define insl insl
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @706  static inline void insl(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  707  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  708  	readsl(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  709  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  710  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  711  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  712  #ifndef outsb
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @713  #define outsb outsb
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @714  static inline void outsb(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  715  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  716  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  717  	writesb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  718  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  719  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  720  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  721  #ifndef outsw
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @722  #define outsw outsw
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @723  static inline void outsw(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  724  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  725  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  726  	writesw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  727  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  728  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  729  
9ab3a7a0d2b417 Thierry Reding 2014-07-04  730  #ifndef outsl
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @731  #define outsl outsl
9ab3a7a0d2b417 Thierry Reding 2014-07-04 @732  static inline void outsl(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding 2014-07-04  733  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding 2014-07-04  734  {
9ab3a7a0d2b417 Thierry Reding 2014-07-04  735  	writesl(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding 2014-07-04  736  }
9ab3a7a0d2b417 Thierry Reding 2014-07-04  737  #endif
9ab3a7a0d2b417 Thierry Reding 2014-07-04  738  

:::::: The code at line 636 was first introduced by commit
:::::: 9216efafc52ff99e9351ef60de5fcafc2bc8adb6 asm-generic/io.h: Reconcile I/O accessor overrides

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
