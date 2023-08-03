Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E10F7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056882; x=1722592882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztfgmN0SNolcR80BKxewCNnKiLPmXXNu/cPNsuOjeHY=;
  b=NKFmXU2cqVvSI6njrvC1BknEHHynDPNS+c7gEqUnxRliUby0e/XIB9BC
   WSX95hPPkvn11F7RL4ai6chSoGgxDzeHbT0FPngwuf+gazvqpStTGRrEB
   UVG7n8IogPjAJhTQNIgc18G7dJ8JZWZ6CBBVmgUOYSGQ/UioELUY3JnJ0
   ob9MknbbYY7fWJfXoOM6jedm7pM8JsimmL9uGyC/TZlgOLpGK6GEEPycs
   lcRQCbtSAy9nRcFyRgjv3tnO1UdCQtt70y27YxDtVU0mEg/ax0YZ2VQBr
   x5roOoo8CyYY2TYQRTaRKAzXit1w+a/zuMFQ0FmHTiJROmmJA2gu5UPA7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368730540"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368730540"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 03:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872873167"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2023 03:01:21 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRV8w-00021p-0L;
	Thu, 03 Aug 2023 10:01:18 +0000
Date: Thu, 3 Aug 2023 18:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [palmer:timex 1/1] include/asm-generic/memory_model.h:18:34: error:
 'mem_map' undeclared; did you mean 'memcmp'?
Message-ID: <202308031741.FqJeIn7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git timex
head:   41c5a952f77e53bf4201296abff0132725aa19e6
commit: 41c5a952f77e53bf4201296abff0132725aa19e6 [1/1] RISC-V: Include io from timex
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230803/202308031741.FqJeIn7e-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031741.FqJeIn7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031741.FqJeIn7e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/page.h:197,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:10:
   arch/riscv/include/asm/pgtable-64.h: In function 'pud_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:226:16: note: in expansion of macro 'pfn_to_page'
     226 |         return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
         |                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:18:34: note: each undeclared identifier is reported only once for each function it appears in
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:226:16: note: in expansion of macro 'pfn_to_page'
     226 |         return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
         |                ^~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h: In function 'p4d_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:333:16: note: in expansion of macro 'pfn_to_page'
     333 |         return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
         |                ^~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h: In function 'pgd_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:396:16: note: in expansion of macro 'pfn_to_page'
     396 |         return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
         |                ^~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h: In function 'pmd_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:252:16: note: in expansion of macro 'pfn_to_page'
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from arch/riscv/include/asm/io.h:15,
                    from arch/riscv/include/asm/timex.h:10,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22:
   arch/riscv/include/asm/pgtable.h: In function 'ptep_set_access_flags':
>> arch/riscv/include/asm/pgtable.h:518:31: error: invalid use of undefined type 'struct vm_area_struct'
     518 |                 set_pte_at(vma->vm_mm, address, ptep, entry);
         |                               ^~
   include/linux/pgtable.h: In function 'pmd_off':
>> include/linux/pgtable.h:141:60: error: invalid use of undefined type 'struct mm_struct'
     141 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                            ^~
   include/linux/pgtable.h:161:49: note: in expansion of macro 'pgd_offset'
     161 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                                 ^~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off_k':
>> include/linux/pgtable.h:149:53: error: 'init_mm' undeclared (first use in this function)
     149 | #define pgd_offset_k(address)           pgd_offset(&init_mm, (address))
         |                                                     ^~~~~~~
   include/linux/pgtable.h:141:57: note: in definition of macro 'pgd_offset'
     141 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                         ^~
   include/linux/pgtable.h:166:49: note: in expansion of macro 'pgd_offset_k'
     166 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                                 ^~~~~~~~~~~~
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:814:38: error: unknown type name 'swp_entry_t'
     814 | static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
         |                                      ^~~~~~~~~~~
   include/linux/pgtable.h: In function '__ptep_modify_prot_start':
>> include/linux/pgtable.h:941:38: error: invalid use of undefined type 'struct vm_area_struct'
     941 |         return ptep_get_and_clear(vma->vm_mm, addr, ptep);
         |                                      ^~
   include/linux/pgtable.h: In function '__ptep_modify_prot_commit':
   include/linux/pgtable.h:952:23: error: invalid use of undefined type 'struct vm_area_struct'
     952 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |                       ^~
   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
   include/asm-generic/io.h: In function '_inb':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   include/asm-generic/io.h:547:27: note: in expansion of macro 'PCI_IOBASE'
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ^~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/riscv/include/asm/bitops.h:201,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27:
   include/asm-generic/io.h: In function '_inw':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:51: note: in definition of macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   arch/riscv/include/asm/pgtable.h:74:25: note: in expansion of macro 'BIT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                         ^~~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   include/asm-generic/io.h:560:57: note: in expansion of macro 'PCI_IOBASE'
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ^~~~~~~~~~
   include/asm-generic/io.h: In function '_inl':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   arch/riscv/include/asm/pgtable.h:74:25: note: in expansion of macro 'BIT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                         ^~~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   include/asm-generic/io.h:573:57: note: in expansion of macro 'PCI_IOBASE'
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ^~~~~~~~~~
   include/asm-generic/io.h: In function '_outb':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   include/asm-generic/io.h:584:29: note: in expansion of macro 'PCI_IOBASE'
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ^~~~~~~~~~
   include/asm-generic/io.h: In function '_outw':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   include/asm-generic/io.h:594:55: note: in expansion of macro 'PCI_IOBASE'
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ^~~~~~~~~~
   include/asm-generic/io.h: In function '_outl':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   include/asm-generic/io.h:604:55: note: in expansion of macro 'PCI_IOBASE'
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ^~~~~~~~~~
   include/asm-generic/io.h: In function 'insb_p':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:42: note: in expansion of macro 'PCI_IOBASE'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ^~~~~~~~~~
   include/asm-generic/io.h:743:9: note: in expansion of macro 'insb'
     743 |         insb(addr, buffer, count);
         |         ^~~~
   include/asm-generic/io.h: In function 'insw_p':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:42: note: in expansion of macro 'PCI_IOBASE'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ^~~~~~~~~~
   include/asm-generic/io.h:751:9: note: in expansion of macro 'insw'
     751 |         insw(addr, buffer, count);
         |         ^~~~
   include/asm-generic/io.h: In function 'insl_p':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:42: note: in expansion of macro 'PCI_IOBASE'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ^~~~~~~~~~
   include/asm-generic/io.h:759:9: note: in expansion of macro 'insl'
     759 |         insl(addr, buffer, count);
         |         ^~~~
   include/asm-generic/io.h: In function 'outsb_p':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:44: note: in expansion of macro 'PCI_IOBASE'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ^~~~~~~~~~
   include/asm-generic/io.h:768:9: note: in expansion of macro 'outsb'
     768 |         outsb(addr, buffer, count);
         |         ^~~~~
   include/asm-generic/io.h: In function 'outsw_p':
>> arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:44: note: in expansion of macro 'PCI_IOBASE'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ^~~~~~~~~~
   include/asm-generic/io.h:777:9: note: in expansion of macro 'outsw'
     777 |         outsw(addr, buffer, count);
         |         ^~~~~
   include/asm-generic/io.h: In function 'outsl_p':
   arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:44: note: in expansion of macro 'PCI_IOBASE'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ^~~~~~~~~~
   include/asm-generic/io.h:786:9: note: in expansion of macro 'outsl'
     786 |         outsl(addr, buffer, count);
         |         ^~~~~
   include/asm-generic/io.h: In function 'ioport_map':
   arch/riscv/include/asm/pgtable.h:73:37: error: 'STRUCT_PAGE_MAX_SHIFT' undeclared (first use in this function)
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   arch/riscv/include/asm/pgtable.h:74:29: note: in expansion of macro 'VMEMMAP_SHIFT'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:76:42: note: in expansion of macro 'VMEMMAP_SIZE'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:85:26: note: in expansion of macro 'VMEMMAP_START'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:86:27: note: in expansion of macro 'PCI_IO_END'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^~~~~~~~~~
   arch/riscv/include/asm/io.h:30:50: note: in expansion of macro 'PCI_IO_START'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^~~~~~~~~~~~
   include/asm-generic/io.h:1134:51: note: in expansion of macro 'PCI_IOBASE'
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ^~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +18 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  17  
67de648211fa04 Andy Whitcroft    2006-06-23 @18  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
67de648211fa04 Andy Whitcroft    2006-06-23  19  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  20  				 ARCH_PFN_OFFSET)
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  21  

:::::: The code at line 18 was first introduced by commit
:::::: 67de648211fa041fe08a0c25241a4980bbb90698 [PATCH] squash duplicate page_to_pfn and pfn_to_page

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
