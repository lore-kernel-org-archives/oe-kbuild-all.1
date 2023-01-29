Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D22C2FB2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 19:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675020685; x=1706556685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMjB5T8U1+IriusA2m390FDjj3w1DVxklc6MEc4EsCs=;
  b=oC8hx7Z4VPDIuFr+NOi1WogJUweN2AybjU3EFEBsCszIv1gYNwrCCLyP
   B0ICd2uzoMg4hzjKs8hnhk+Sn8cvJHxhgYSmsfyqJveUPkIeRdcb8182P
   KI8CTnsufFOLk62K9MO7G/oRbu7F/v8CZfr3nhhkgycxinbfTF1YTpNvn
   yyyfBdKUbpfJiVLtqQmdxFffoFqrr0fxoR262k0xM90zpRsIm4m/b4Afl
   PaS+cSKv3CBDgDtxP0p5I2RNZEcQSazFUTqHc4Yfoxz0LiI8FHWIMEwo7
   MTGzUi4Upw6texH3oHeL7BT6YUJvXQTZKpP6cfxRftYzL8Z9sgMBL0ro3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="315388137"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="315388137"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 11:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="613800658"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="613800658"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jan 2023 11:31:23 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMDOb-00033K-2C;
	Sun, 29 Jan 2023 19:31:21 +0000
Date: Mon, 30 Jan 2023 03:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-4.14.y 433/4044]
 arch/xtensa/platforms/xtfpga/include/platform/hardware.h:59:26: error:
 initializer element is not constant
Message-ID: <202301300311.oNWl51EJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   3949d16100044eeb6723eca03b1038b469fb9ae8
commit: fe700bd139564d097d1ebed90da637b80bd7f5c1 [433/4044] xtensa: xtfpga: use CONFIG_USE_OF instead of CONFIG_OF
config: xtensa-randconfig-r023-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300311.oNWl51EJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=fe700bd139564d097d1ebed90da637b80bd7f5c1
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-4.14.y
        git checkout fe700bd139564d097d1ebed90da637b80bd7f5c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:10:0,
                    from arch/xtensa/platforms/xtfpga/setup.c:19:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/scatterlist.h:141:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!virt_addr_valid(buf));
     ^~~~~~
   arch/xtensa/include/asm/page.h:193:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
                                   ^~~~~~~~~
   include/linux/scatterlist.h:141:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   In file included from arch/xtensa/include/asm/processor.h:14:0,
                    from arch/xtensa/include/asm/bitops.h:22,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from arch/xtensa/platforms/xtfpga/setup.c:19:
   arch/xtensa/platforms/xtfpga/setup.c: At top level:
>> arch/xtensa/platforms/xtfpga/include/platform/hardware.h:59:26: error: initializer element is not constant
    #define OETH_REGS_PADDR  (XCHAL_KIO_PADDR + 0x0D030000)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:168:12: note: in expansion of macro 'OETH_REGS_PADDR'
      .start = OETH_REGS_PADDR,
               ^~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:59:26: note: (near initialization for 'ethoc_res[0].start')
    #define OETH_REGS_PADDR  (XCHAL_KIO_PADDR + 0x0D030000)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:168:12: note: in expansion of macro 'OETH_REGS_PADDR'
      .start = OETH_REGS_PADDR,
               ^~~~~~~~~~~~~~~
>> arch/xtensa/platforms/xtfpga/include/platform/hardware.h:59:26: error: initializer element is not constant
    #define OETH_REGS_PADDR  (XCHAL_KIO_PADDR + 0x0D030000)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:169:12: note: in expansion of macro 'OETH_REGS_PADDR'
      .end   = OETH_REGS_PADDR + OETH_REGS_SIZE - 1,
               ^~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:59:26: note: (near initialization for 'ethoc_res[0].end')
    #define OETH_REGS_PADDR  (XCHAL_KIO_PADDR + 0x0D030000)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:169:12: note: in expansion of macro 'OETH_REGS_PADDR'
      .end   = OETH_REGS_PADDR + OETH_REGS_SIZE - 1,
               ^~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:61:29: error: initializer element is not constant
    #define OETH_SRAMBUFF_PADDR (XCHAL_KIO_PADDR + 0x0D800000)
                                ^
   arch/xtensa/platforms/xtfpga/setup.c:173:12: note: in expansion of macro 'OETH_SRAMBUFF_PADDR'
      .start = OETH_SRAMBUFF_PADDR,
               ^~~~~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:61:29: note: (near initialization for 'ethoc_res[1].start')
    #define OETH_SRAMBUFF_PADDR (XCHAL_KIO_PADDR + 0x0D800000)
                                ^
   arch/xtensa/platforms/xtfpga/setup.c:173:12: note: in expansion of macro 'OETH_SRAMBUFF_PADDR'
      .start = OETH_SRAMBUFF_PADDR,
               ^~~~~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:61:29: error: initializer element is not constant
    #define OETH_SRAMBUFF_PADDR (XCHAL_KIO_PADDR + 0x0D800000)
                                ^
   arch/xtensa/platforms/xtfpga/setup.c:174:12: note: in expansion of macro 'OETH_SRAMBUFF_PADDR'
      .end   = OETH_SRAMBUFF_PADDR + OETH_SRAMBUFF_SIZE - 1,
               ^~~~~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:61:29: note: (near initialization for 'ethoc_res[1].end')
    #define OETH_SRAMBUFF_PADDR (XCHAL_KIO_PADDR + 0x0D800000)
                                ^
   arch/xtensa/platforms/xtfpga/setup.c:174:12: note: in expansion of macro 'OETH_SRAMBUFF_PADDR'
      .end   = OETH_SRAMBUFF_PADDR + OETH_SRAMBUFF_SIZE - 1,
               ^~~~~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:66:23: error: initializer element is not constant
    #define C67X00_PADDR  (XCHAL_KIO_PADDR + 0x0D0D0000)
                          ^
   arch/xtensa/platforms/xtfpga/setup.c:211:12: note: in expansion of macro 'C67X00_PADDR'
      .start = C67X00_PADDR,
               ^~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:66:23: note: (near initialization for 'c67x00_res[0].start')
    #define C67X00_PADDR  (XCHAL_KIO_PADDR + 0x0D0D0000)
                          ^
   arch/xtensa/platforms/xtfpga/setup.c:211:12: note: in expansion of macro 'C67X00_PADDR'
      .start = C67X00_PADDR,
               ^~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:66:23: error: initializer element is not constant
    #define C67X00_PADDR  (XCHAL_KIO_PADDR + 0x0D0D0000)
                          ^
   arch/xtensa/platforms/xtfpga/setup.c:212:12: note: in expansion of macro 'C67X00_PADDR'
      .end   = C67X00_PADDR + C67X00_SIZE - 1,
               ^~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:66:23: note: (near initialization for 'c67x00_res[0].end')
    #define C67X00_PADDR  (XCHAL_KIO_PADDR + 0x0D0D0000)
                          ^
   arch/xtensa/platforms/xtfpga/setup.c:212:12: note: in expansion of macro 'C67X00_PADDR'
      .end   = C67X00_PADDR + C67X00_SIZE - 1,
               ^~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:46:26: error: initializer element is not constant
    #define DUART16552_PADDR (XCHAL_KIO_PADDR + 0x0D050020)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:242:11: note: in expansion of macro 'DUART16552_PADDR'
     .start = DUART16552_PADDR,
              ^~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:46:26: note: (near initialization for 'serial_resource.start')
    #define DUART16552_PADDR (XCHAL_KIO_PADDR + 0x0D050020)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:242:11: note: in expansion of macro 'DUART16552_PADDR'
     .start = DUART16552_PADDR,
              ^~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:46:26: error: initializer element is not constant
    #define DUART16552_PADDR (XCHAL_KIO_PADDR + 0x0D050020)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:243:9: note: in expansion of macro 'DUART16552_PADDR'
     .end = DUART16552_PADDR + 0x1f,
            ^~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:46:26: note: (near initialization for 'serial_resource.end')
    #define DUART16552_PADDR (XCHAL_KIO_PADDR + 0x0D050020)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:243:9: note: in expansion of macro 'DUART16552_PADDR'
     .end = DUART16552_PADDR + 0x1f,
            ^~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:46:26: error: initializer element is not constant
    #define DUART16552_PADDR (XCHAL_KIO_PADDR + 0x0D050020)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:249:14: note: in expansion of macro 'DUART16552_PADDR'
      .mapbase = DUART16552_PADDR,
                 ^~~~~~~~~~~~~~~~
   arch/xtensa/platforms/xtfpga/include/platform/hardware.h:46:26: note: (near initialization for 'serial_platform_data[0].mapbase')
    #define DUART16552_PADDR (XCHAL_KIO_PADDR + 0x0D050020)
                             ^
   arch/xtensa/platforms/xtfpga/setup.c:249:14: note: in expansion of macro 'DUART16552_PADDR'
      .mapbase = DUART16552_PADDR,
                 ^~~~~~~~~~~~~~~~
   In file included from include/linux/serial_8250.h:14:0,
                    from arch/xtensa/platforms/xtfpga/setup.c:157:
   include/linux/serial_core.h:391:19: warning: 'earlycon_init_is_deferred' defined but not used [-Wunused-const-variable=]
    static const bool earlycon_init_is_deferred;
                      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +59 arch/xtensa/platforms/xtfpga/include/platform/hardware.h

0d456bad36d42d Max Filippov 2012-11-05  56  
0d456bad36d42d Max Filippov 2012-11-05  57  /*  OpenCores Ethernet controller:  */
0d456bad36d42d Max Filippov 2012-11-05  58  				/* regs + RX/TX descriptors */
0d456bad36d42d Max Filippov 2012-11-05 @59  #define OETH_REGS_PADDR		(XCHAL_KIO_PADDR + 0x0D030000)
0d456bad36d42d Max Filippov 2012-11-05  60  #define OETH_REGS_SIZE		0x1000
0d456bad36d42d Max Filippov 2012-11-05  61  #define OETH_SRAMBUFF_PADDR	(XCHAL_KIO_PADDR + 0x0D800000)
0d456bad36d42d Max Filippov 2012-11-05  62  
0d456bad36d42d Max Filippov 2012-11-05  63  				/* 5*rx buffs + 5*tx buffs */
0d456bad36d42d Max Filippov 2012-11-05  64  #define OETH_SRAMBUFF_SIZE	(5 * 0x600 + 5 * 0x600)
0d456bad36d42d Max Filippov 2012-11-05  65  

:::::: The code at line 59 was first introduced by commit
:::::: 0d456bad36d42d16022be045c8a53ddbb59ee478 xtensa: add support for the XTFPGA boards

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Chris Zankel <chris@zankel.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
