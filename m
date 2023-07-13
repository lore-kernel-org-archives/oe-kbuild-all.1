Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC517AB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689258417; x=1720794417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCXl5uB6jsShwux8T6csXoJ1ftfHfs2P5Jd4JztNwiQ=;
  b=cCHcnwzhFuFzv/UMGlsb8xJz9ep5lbrfHGMa/QWJ7KYKg9kF0U17wBQc
   igwzx8eC33j+cS6npmPHsGz9bCBuIta7p3nJP7hmdeJzmIpy0T27uXAu6
   kMkiNxKhrdlr3RsMFX1Tg+NsE12cygYcxxzkoKqFlW8ToLzYOmEHqkMzI
   nHrNLqZIVMoFZ/d3BZx0bQRZZISfpeG41aT0Rf3WnuZwXlTsYtaNo2XLr
   4Xq5D4+j0lbggkaT8/nfkX/PCI0nicPVMYSY50GfzuOpTpbd/lDB4/Eka
   c4dGaUW3FisaG9WioEHb/miY3z7r4Iyzq2BcwLbxJZUurqeCZNGF5AVJC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396005870"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="396005870"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 07:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787472460"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="787472460"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 07:26:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJxHS-0006ft-2Z;
	Thu, 13 Jul 2023 14:26:54 +0000
Date: Thu, 13 Jul 2023 22:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:ktext-current 1/19] arch/arm64/include/asm/memory.h:47:53:
 error: 'PGDIR_SIZE' undeclared
Message-ID: <202307132254.n98wxvQG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm ktext-current
head:   1085162f4939fd1d436ba6ec27b54c707a2a7c47
commit: b392b426ad1dad14b1f13a984fef3f8e082b58e6 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230713/202307132254.n98wxvQG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132254.n98wxvQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132254.n98wxvQG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:27,
                    from arch/arm64/include/asm/cpufeature.h:25,
                    from arch/arm64/kernel/kaslr.c:10:
   arch/arm64/kernel/kaslr.c: In function 'kaslr_init':
>> arch/arm64/include/asm/memory.h:47:53: error: 'PGDIR_SIZE' undeclared (first use in this function)
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                                     ^~~~~~~~~~
   include/linux/minmax.h:20:46: note: in definition of macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                              ^
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:203:57: note: in expansion of macro 'KIMAGE_VADDR'
     203 | #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
         |                                                         ^~~~~~~~~~~~
   arch/arm64/kernel/kaslr.c:31:13: note: in expansion of macro 'kaslr_offset'
      31 |         if (kaslr_offset() < MIN_KIMG_ALIGN) {
         |             ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:53: note: each undeclared identifier is reported only once for each function it appears in
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                                     ^~~~~~~~~~
   include/linux/minmax.h:20:46: note: in definition of macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                              ^
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:203:57: note: in expansion of macro 'KIMAGE_VADDR'
     203 | #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
         |                                                         ^~~~~~~~~~~~
   arch/arm64/kernel/kaslr.c:31:13: note: in expansion of macro 'kaslr_offset'
      31 |         if (kaslr_offset() < MIN_KIMG_ALIGN) {
         |             ^~~~~~~~~~~~
>> include/linux/minmax.h:36:9: error: first argument to '__builtin_choose_expr' not a constant
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:34: note: in expansion of macro 'max'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~
   arch/arm64/include/asm/memory.h:203:57: note: in expansion of macro 'KIMAGE_VADDR'
     203 | #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
         |                                                         ^~~~~~~~~~~~
   arch/arm64/kernel/kaslr.c:31:13: note: in expansion of macro 'kaslr_offset'
      31 |         if (kaslr_offset() < MIN_KIMG_ALIGN) {
         |             ^~~~~~~~~~~~
--
   arch/arm64/kernel/head.S: Assembler messages:
>> arch/arm64/kernel/head.S:425: Error: too many positional arguments
   arch/arm64/kernel/head.S:790: Error: too many positional arguments


vim +/PGDIR_SIZE +47 arch/arm64/include/asm/memory.h

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
    46	#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + \
  > 47					 max(MODULES_VSIZE, PGDIR_SIZE))
    48	#define MODULES_END		(KIMAGE_VADDR)
    49	#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
    50	#define MODULES_VSIZE		(SZ_2G)
    51	#define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
    52	#define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
    53	#define PCI_IO_END		(VMEMMAP_START - SZ_8M)
    54	#define PCI_IO_START		(PCI_IO_END - PCI_IO_SIZE)
    55	#define FIXADDR_TOP		(VMEMMAP_START - SZ_32M)
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
