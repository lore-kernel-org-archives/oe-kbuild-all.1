Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4610365
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 02:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fylEHVUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697165636; x=1728701636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8x7nbgktt531NtcqfZ3wCKG/bNz9CWxu0iLBgKRS43c=;
  b=fylEHVUKXBwkiX+c13ME8DmuejxAl64RqPRy6RoywzyGetFptOOY9FFj
   u6Fc9Z71yeFdAEAvidIloJIXgIf+1t8W/AKwq3MGETxuypGbNtkk5Phtl
   dQfWfM54TW/1PEEvzpMtlVtEr9DQziX4QoswLp+BlRmWy+4uX5n8o7YMU
   Iqcj+evT6wENsIDKsPqwcsMKOnISWdGKCWC2t/EB9ixyc/5rCeTVIPnqU
   q0Mq4zvAhp8AsNgLZSHfmf/OeJV0rtBPQUds1Gd72t2eSxzDp4l2eh86V
   v8cwagYtCqSl5hYvyc+kB4dy7QMRtTa62jN5CfLvczI1qINHkZScUSjMc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3681513"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="3681513"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824865065"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="824865065"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 19:53:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr8J7-0004Fr-3C;
	Fri, 13 Oct 2023 02:53:45 +0000
Date: Fri, 13 Oct 2023 10:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1610/30000]
 drivers/pci/controller/mobiveil/pcie-mobiveil.h:176:62: error: macro
 "csr_read" passed 3 arguments, but takes just 1
Message-ID: <202310131059.HViM6yPh-lkp@intel.com>
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
commit: f619c5421080a51c730f04eddbe22aef2a1d0cba [1610/30000] PCI: mobiveil: Refactor Mobiveil PCIe Host Bridge IP driver
config: riscv-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131059.HViM6yPh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131059.HViM6yPh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131059.HViM6yPh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:28:
>> drivers/pci/controller/mobiveil/pcie-mobiveil.h:176:62: error: macro "csr_read" passed 3 arguments, but takes just 1
     176 | u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size);
         |                                                              ^
   In file included from arch/riscv/include/asm/ptrace.h:10,
                    from arch/riscv/include/asm/processor.h:11,
                    from arch/riscv/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:16,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/interrupt.h:6,
                    from drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:13:
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
>> drivers/pci/controller/mobiveil/pcie-mobiveil.h:177:73: error: macro "csr_write" passed 4 arguments, but takes just 2
     177 | void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off, size_t size);
         |                                                                         ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_readl':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:181:39: error: macro "csr_read" passed 3 arguments, but takes just 1
     181 |         return csr_read(pcie, off, 0x4);
         |                                       ^
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_writel':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:186:38: error: macro "csr_write" passed 4 arguments, but takes just 2
     186 |         csr_write(pcie, val, off, 0x4);
         |                                      ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
--
   In file included from drivers/pci/controller/mobiveil/pcie-mobiveil.c:18:
>> drivers/pci/controller/mobiveil/pcie-mobiveil.h:176:62: error: macro "csr_read" passed 3 arguments, but takes just 1
     176 | u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size);
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
>> drivers/pci/controller/mobiveil/pcie-mobiveil.h:177:73: error: macro "csr_write" passed 4 arguments, but takes just 2
     177 | void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off, size_t size);
         |                                                                         ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_readl':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:181:39: error: macro "csr_read" passed 3 arguments, but takes just 1
     181 |         return csr_read(pcie, off, 0x4);
         |                                       ^
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.h: In function 'csr_writel':
   drivers/pci/controller/mobiveil/pcie-mobiveil.h:186:38: error: macro "csr_write" passed 4 arguments, but takes just 2
     186 |         csr_write(pcie, val, off, 0x4);
         |                                      ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.c: At top level:
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:98:62: error: macro "csr_read" passed 3 arguments, but takes just 1
      98 | u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size)
         |                                                              ^
   arch/riscv/include/asm/csr.h:103: note: macro "csr_read" defined here
     103 | #define csr_read(csr)                                           \
         | 
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:99:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      99 | {
         | ^
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:113:73: error: macro "csr_write" passed 4 arguments, but takes just 2
     113 | void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off, size_t size)
         |                                                                         ^
   arch/riscv/include/asm/csr.h:112: note: macro "csr_write" defined here
     112 | #define csr_write(csr, val)                                     \
         | 
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:114:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     114 | {
         | ^
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:76:12: warning: 'mobiveil_pcie_write' defined but not used [-Wunused-function]
      76 | static int mobiveil_pcie_write(void __iomem *addr, int size, u32 val)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:51:12: warning: 'mobiveil_pcie_read' defined but not used [-Wunused-function]
      51 | static int mobiveil_pcie_read(void __iomem *addr, int size, u32 *val)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:39:14: warning: 'mobiveil_pcie_comp_addr' defined but not used [-Wunused-function]
      39 | static void *mobiveil_pcie_comp_addr(struct mobiveil_pcie *pcie, u32 off)
         |              ^~~~~~~~~~~~~~~~~~~~~~~


vim +/csr_read +176 drivers/pci/controller/mobiveil/pcie-mobiveil.h

   168	
   169	int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie);
   170	bool mobiveil_pcie_link_up(struct mobiveil_pcie *pcie);
   171	int mobiveil_bringup_link(struct mobiveil_pcie *pcie);
   172	void program_ob_windows(struct mobiveil_pcie *pcie, int win_num, u64 cpu_addr,
   173				u64 pci_addr, u32 type, u64 size);
   174	void program_ib_windows(struct mobiveil_pcie *pcie, int win_num, u64 cpu_addr,
   175				u64 pci_addr, u32 type, u64 size);
 > 176	u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size);
 > 177	void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off, size_t size);
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
