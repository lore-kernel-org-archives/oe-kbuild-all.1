Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BABE110D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 04:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWbaYX4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697172024; x=1728708024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ebyqMbJLs61F9WtolCTW8QKp+RyVTB+Er10yL2dk9CQ=;
  b=iWbaYX4v4MmLae0UZ8g3xk40qTbwmRuOWhprfMmWr+6ZgDm3HxAkT0A1
   aN5vGoEwt8xI6t5Pf4cDdz7B3xeVMy2BYcqjDc519un35jdAImJQqBjP1
   fDixJP+M+Gn5VRtjnU6M9ZqrlpWlwSE2O3mIKCt1yymrkV/3gggzGdj7c
   L9zDTPEL90ceDzbunq9uI0PZpOs6XbexzEKKSxapf7/IKeYjgJJCPRGhX
   ggZprCQICfNlfVnpH9IcXWRibhbQ4WHyik0qoUz+NSnafVlah6GyHxZnj
   8huQf77NJwmcx1SuG4rfsqXdGvHWb5Tv9HgWPsWLdKTkXDwqWzNV7Cr3F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416159025"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="416159025"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 21:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085986133"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1085986133"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 21:39:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr9xm-0004Kr-27;
	Fri, 13 Oct 2023 04:39:50 +0000
Date: Fri, 13 Oct 2023 12:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1618/30000]
 drivers/pci/controller/mobiveil/pcie-mobiveil.c:171:6: warning: no previous
 prototype for '__program_ob_windows'
Message-ID: <202310131217.6rMhXO1c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: e01168ca8b7e3dc3fc92ddf5fc01561c4a4c6255 [1618/30000] PCI: mobiveil: Add the EP driver support
config: riscv-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131217.6rMhXO1c-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131217.6rMhXO1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131217.6rMhXO1c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/mobiveil/pcie-mobiveil.c:18:
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:245:62: error: macro "csr_read" passed 3 arguments, but takes just 1
     245 | u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size);
         |                                                              ^
   In file included from arch/riscv/include/asm/ptrace.h:10,
                    from arch/riscv/include/asm/processor.h:11,
                    from arch/riscv/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:16,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/delay.h:22,
                    from drivers/pci/controller/mobiveil/pcie-mobiveil.c:12:
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:246:73: error: macro "csr_write" passed 4 arguments, but takes just 2
     246 | void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off, size_t size);
         |                                                                         ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_readl':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:250:39: error: macro "csr_read" passed 3 arguments, but takes just 1
     250 |         return csr_read(pcie, off, 0x4);
         |                                       ^
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_readw':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:255:39: error: macro "csr_read" passed 3 arguments, but takes just 1
     255 |         return csr_read(pcie, off, 0x2);
         |                                       ^
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_readb':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:260:39: error: macro "csr_read" passed 3 arguments, but takes just 1
     260 |         return csr_read(pcie, off, 0x1);
         |                                       ^
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_writel':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:265:38: error: macro "csr_write" passed 4 arguments, but takes just 2
     265 |         csr_write(pcie, val, off, 0x4);
         |                                      ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_writew':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:270:38: error: macro "csr_write" passed 4 arguments, but takes just 2
     270 |         csr_write(pcie, val, off, 0x2);
         |                                      ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_writeb':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:275:38: error: macro "csr_write" passed 4 arguments, but takes just 2
     275 |         csr_write(pcie, val, off, 0x1);
         |                                      ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.c: At top level:
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:98:62: error: macro "csr_read" passed 3 arguments, but takes just 1
      98 | u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size)
         |                                                              ^
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:99:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      99 | {
         | ^
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:113:73: error: macro "csr_write" passed 4 arguments, but takes just 2
     113 | void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off, size_t size)
         |                                                                         ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:114:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     114 | {
         | ^
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:171:6: warning: no previous prototype for '__program_ob_windows' [-Wmissing-prototypes]
     171 | void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:76:12: warning: 'mobiveil_pcie_write' defined but not used [-Wunused-function]
      76 | static int mobiveil_pcie_write(void __iomem *addr, int size, u32 val)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:51:12: warning: 'mobiveil_pcie_read' defined but not used [-Wunused-function]
      51 | static int mobiveil_pcie_read(void __iomem *addr, int size, u32 *val)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:39:14: warning: 'mobiveil_pcie_comp_addr' defined but not used [-Wunused-function]
      39 | static void *mobiveil_pcie_comp_addr(struct mobiveil_pcie *pcie, u32 off)
         |              ^~~~~~~~~~~~~~~~~~~~~~~


vim +/__program_ob_windows +171 drivers/pci/controller/mobiveil/pcie-mobiveil.c

   167	
   168	/*
   169	 * routine to program the outbound windows
   170	 */
 > 171	void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_num,
   172				  u64 cpu_addr, u64 pci_addr, u32 type, u64 size)
   173	{
   174		u32 value;
   175		u64 size64 = ~(size - 1);
   176	
   177		/*
   178		 * program Enable Bit to 1, Type Bit to (00) base 2, AXI Window Size Bit
   179		 * to 4 KB in PAB_AXI_AMAP_CTRL register
   180		 */
   181		value = csr_readl(pcie, PAB_AXI_AMAP_CTRL(win_num));
   182		value &= ~(WIN_TYPE_MASK << WIN_TYPE_SHIFT | WIN_SIZE_MASK);
   183		value |= 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT |
   184			 (lower_32_bits(size64) & WIN_SIZE_MASK);
   185		csr_writel(pcie, value, PAB_AXI_AMAP_CTRL(win_num));
   186	
   187		csr_writel(pcie, upper_32_bits(size64), PAB_EXT_AXI_AMAP_SIZE(win_num));
   188	
   189		csr_writel(pcie, func_no, PAB_AXI_AMAP_PCI_HDR_PARAM(win_num));
   190		/*
   191		 * program AXI window base with appropriate value in
   192		 * PAB_AXI_AMAP_AXI_WIN0 register
   193		 */
   194		csr_writel(pcie, lower_32_bits(cpu_addr) & (~AXI_WINDOW_ALIGN_MASK),
   195			   PAB_AXI_AMAP_AXI_WIN(win_num));
   196		csr_writel(pcie, upper_32_bits(cpu_addr),
   197			   PAB_EXT_AXI_AMAP_AXI_WIN(win_num));
   198	
   199		csr_writel(pcie, lower_32_bits(pci_addr),
   200			   PAB_AXI_AMAP_PEX_WIN_L(win_num));
   201		csr_writel(pcie, upper_32_bits(pci_addr),
   202			   PAB_AXI_AMAP_PEX_WIN_H(win_num));
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
