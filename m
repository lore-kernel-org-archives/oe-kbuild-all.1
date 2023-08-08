Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D08492
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691488017; x=1723024017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cp0u1jsXaR8OCOJofQU02g5fD8J/IjfcBP79h1b8OTU=;
  b=WPJSOajn+6MiqsGSqyL19guJKImKjTWX+Hre+LMRQsJ8hw8she7b56ui
   AUWIwi9UF9A4xy+IgjWhEMkF93pxQM9J3gef1yj1pEeWQUpRRitYn44GX
   gp6yLrMs00d3QBj9kijWxicFhShDAFPhtWjYo+au2sWKmiWRlQdoTaiDd
   35gjoqsvZDwxMzPIZEb88EPv3XVU9h35Ikz/JskuAqsriNiTaUkK67I6C
   ZGw5lintav5nM6m1v3K+Kq0uSr1+Dsw32EicWBjqyeJmNPe0g8D6qXEu1
   PwK3H7TybFc5Iy5QNZGmEDQf0gR/nsiKSdZLBMX6iEE+2OxwmRKY3T6g3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="355711134"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="355711134"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 02:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977783064"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="977783064"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 02:46:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTJIk-0005Gs-1T;
	Tue, 08 Aug 2023 09:46:54 +0000
Date: Tue, 8 Aug 2023 17:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:osbi-nomap 2/3] arch/riscv/mm/init.c:258:2: error: call to
 undeclared function 'sbi_apply_reserved_mem_erratum'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202308081722.gc1229v5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git osbi-nomap
head:   0b3451385fd3d5430924aa3d08020e748f91a775
commit: af130711e4b8e7562cb6f0d10190d05bb2313be2 [2/3] RISC-V: handle missing "no-map" properties for OpenSBI's PMP protected regions
config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20230808/202308081722.gc1229v5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081722.gc1229v5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081722.gc1229v5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/mm/init.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/mm/init.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/mm/init.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/mm/init.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/mm/init.c:13:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> arch/riscv/mm/init.c:258:2: error: call to undeclared function 'sbi_apply_reserved_mem_erratum'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     258 |         sbi_apply_reserved_mem_erratum(dtb_early_va);
         |         ^
   13 warnings and 1 error generated.


vim +/sbi_apply_reserved_mem_erratum +258 arch/riscv/mm/init.c

   191	
   192	static void __init setup_bootmem(void)
   193	{
   194		phys_addr_t vmlinux_end = __pa_symbol(&_end);
   195		phys_addr_t max_mapped_addr;
   196		phys_addr_t phys_ram_end, vmlinux_start;
   197	
   198		if (IS_ENABLED(CONFIG_XIP_KERNEL))
   199			vmlinux_start = __pa_symbol(&_sdata);
   200		else
   201			vmlinux_start = __pa_symbol(&_start);
   202	
   203		memblock_enforce_memory_limit(memory_limit);
   204	
   205		/*
   206		 * Make sure we align the reservation on PMD_SIZE since we will
   207		 * map the kernel in the linear mapping as read-only: we do not want
   208		 * any allocation to happen between _end and the next pmd aligned page.
   209		 */
   210		if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
   211			vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
   212		/*
   213		 * Reserve from the start of the kernel to the end of the kernel
   214		 */
   215		memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
   216	
   217		phys_ram_end = memblock_end_of_DRAM();
   218		if (!IS_ENABLED(CONFIG_XIP_KERNEL))
   219			phys_ram_base = memblock_start_of_DRAM();
   220	
   221		/*
   222		 * In 64-bit, any use of __va/__pa before this point is wrong as we
   223		 * did not know the start of DRAM before.
   224		 */
   225		if (IS_ENABLED(CONFIG_64BIT))
   226			kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
   227	
   228		/*
   229		 * memblock allocator is not aware of the fact that last 4K bytes of
   230		 * the addressable memory can not be mapped because of IS_ERR_VALUE
   231		 * macro. Make sure that last 4k bytes are not usable by memblock
   232		 * if end of dram is equal to maximum addressable memory.  For 64-bit
   233		 * kernel, this problem can't happen here as the end of the virtual
   234		 * address space is occupied by the kernel mapping then this check must
   235		 * be done as soon as the kernel mapping base address is determined.
   236		 */
   237		if (!IS_ENABLED(CONFIG_64BIT)) {
   238			max_mapped_addr = __pa(~(ulong)0);
   239			if (max_mapped_addr == (phys_ram_end - 1))
   240				memblock_set_current_limit(max_mapped_addr - 4096);
   241		}
   242	
   243		min_low_pfn = PFN_UP(phys_ram_base);
   244		max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
   245		high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
   246	
   247		dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
   248		set_max_mapnr(max_low_pfn - ARCH_PFN_OFFSET);
   249	
   250		reserve_initrd_mem();
   251	
   252		/*
   253		 * No allocation should be done before reserving the memory as defined
   254		 * in the device tree, otherwise the allocation could end up in a
   255		 * reserved region.
   256		 */
   257	
 > 258		sbi_apply_reserved_mem_erratum(dtb_early_va);
   259		early_init_fdt_scan_reserved_mem();
   260	
   261		/*
   262		 * If DTB is built in, no need to reserve its memblock.
   263		 * Otherwise, do reserve it but avoid using
   264		 * early_init_fdt_reserve_self() since __pa() does
   265		 * not work for DTB pointers that are fixmap addresses
   266		 */
   267		if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
   268			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
   269	
   270		dma_contiguous_reserve(dma32_phys_limit);
   271		if (IS_ENABLED(CONFIG_64BIT))
   272			hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
