Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80617C143
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683310047; x=1714846047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSw0kBAAZCkfUbraOfUwdZKSn0s/BiESfxst9WJRAdI=;
  b=dCR9vwxCPctTBC4wvN/2o/8PLg463aKOAAX1g/jm41kUjLr0TN+uFpc0
   ZJlpQZC5tw7upTtLLJ2Qm99ygYVNpB0EjzqNtGP9fyZv+UXpeXyx/OZYr
   dz/fQJwttcrSyRc/eoBvDhgdpZD1q7ujjTlCnapz40grwaSv4S7jSq3uj
   Mws0IQhZxKliRcfdKrKZsof4iIDVYsHBPL2NEvOvc6Cpmur0AZ+KfqV4a
   LvU62u99SMa9YZ32rOaU7z1P52qQRn4qrF3AwwrhAd1CGW+H/lvc2Szkl
   lcUnWXQP24hWObvm7rN+P1ASXhWcj2PMUMVjXEQFxeoLv0FY73TDHEPG2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="338467062"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="338467062"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 11:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="762561961"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="762561961"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 May 2023 11:07:25 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puzq0-0000oB-35;
	Fri, 05 May 2023 18:07:24 +0000
Date: Sat, 6 May 2023 02:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 2/20] arch/arm64/include/asm/memory.h:46:59: error:
 'PGDIR_SIZE' undeclared
Message-ID: <202305060113.fsEgFwqb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   d46570e26ed804d5d89e71c20a8c17362984c52e
commit: 9a882e7990de2897f942aff351cae150c77bde60 [2/20] arm64: place kernel in its own L0 page table entry
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230506/202305060113.fsEgFwqb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm ktext
        git checkout 9a882e7990de2897f942aff351cae150c77bde60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060113.fsEgFwqb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/smp.h:110,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   arch/arm64/include/asm/memory.h: In function 'kaslr_enabled':
>> arch/arm64/include/asm/memory.h:46:59: error: 'PGDIR_SIZE' undeclared (first use in this function)
      46 | #define KIMAGE_VADDR            (_PAGE_END(VA_BITS_MIN) + PGDIR_SIZE)
         |                                                           ^~~~~~~~~~
   arch/arm64/include/asm/memory.h:202:57: note: in expansion of macro 'KIMAGE_VADDR'
     202 | #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
         |                                                         ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:211:16: note: in expansion of macro 'kaslr_offset'
     211 |         return kaslr_offset() >= MIN_KIMG_ALIGN;
         |                ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:46:59: note: each undeclared identifier is reported only once for each function it appears in
      46 | #define KIMAGE_VADDR            (_PAGE_END(VA_BITS_MIN) + PGDIR_SIZE)
         |                                                           ^~~~~~~~~~
   arch/arm64/include/asm/memory.h:202:57: note: in expansion of macro 'KIMAGE_VADDR'
     202 | #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
         |                                                         ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:211:16: note: in expansion of macro 'kaslr_offset'
     211 |         return kaslr_offset() >= MIN_KIMG_ALIGN;
         |                ^~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/PGDIR_SIZE +46 arch/arm64/include/asm/memory.h

    35	
    36	/*
    37	 * PAGE_OFFSET - the virtual address of the start of the linear map, at the
    38	 *               start of the TTBR1 address space.
    39	 * PAGE_END - the end of the linear map, where all other kernel mappings begin.
    40	 * KIMAGE_VADDR - the virtual address of the start of the kernel image.
    41	 * VA_BITS - the maximum number of bits for virtual addresses.
    42	 */
    43	#define VA_BITS			(CONFIG_ARM64_VA_BITS)
    44	#define _PAGE_OFFSET(va)	(-(UL(1) << (va)))
    45	#define PAGE_OFFSET		(_PAGE_OFFSET(VA_BITS))
  > 46	#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + PGDIR_SIZE)
    47	#define MODULES_END		(KIMAGE_VADDR)
    48	#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
    49	#define MODULES_VSIZE		(SZ_128M)
    50	#define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
    51	#define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
    52	#define PCI_IO_END		(VMEMMAP_START - SZ_8M)
    53	#define PCI_IO_START		(PCI_IO_END - PCI_IO_SIZE)
    54	#define FIXADDR_TOP		(VMEMMAP_START - SZ_32M)
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
