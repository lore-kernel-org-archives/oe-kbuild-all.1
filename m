Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD0B8F7C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691058847; x=1722594847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zfu9LTB1Kl1SQV7UDnzYJvBnHiCN+3rYG4q+3Bx+58U=;
  b=V9qvciZ1n3YKLiiY14M+SipCfCPgiuOQCGam49HXWUvRz2OyM7myq9Ei
   xgVgmBtx220/epE624ODUnHvQ+GYO8AISugO3FBr//5Wi5Q+hwokYl8i9
   eSsLSQvkCuH7pERfVBZrfe9lyg9dKEMa9yisOI4g65RxRuofIuLWntk91
   fYUcvhCD7umlm0H7geFf1M+GZfEeFjzVnKdH8Etv91ihGlbwMnGusUzKA
   n2D+Ru4cin1V8YyAhmikYxSL9Yce/rPof4Ho9VD1Zxu6e6nL/I+2xqiH4
   aX2HtdciUT0yr9rs+TVGJAxRAHHp9v9VWaarcyHjWMyQyvM9zY/rBRLm0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="456214043"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="456214043"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 03:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872882924"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2023 03:33:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRVdy-000239-1G;
	Thu, 03 Aug 2023 10:33:22 +0000
Date: Thu, 3 Aug 2023 18:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [palmer:timex 1/1] include/asm-generic/memory_model.h:53:37: error:
 implicit declaration of function '__pfn_to_section'
Message-ID: <202308031819.yvwsA5GQ-lkp@intel.com>
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
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230803/202308031819.yvwsA5GQ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031819.yvwsA5GQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031819.yvwsA5GQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   arch/riscv/include/asm/pgtable.h: In function 'pmd_page':
>> include/asm-generic/memory_model.h:53:37: error: implicit declaration of function '__pfn_to_section' [-Werror=implicit-function-declaration]
      53 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:252:16: note: in expansion of macro 'pfn_to_page'
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:53:37: warning: initialization of 'struct mem_section *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      53 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:252:16: note: in expansion of macro 'pfn_to_page'
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:54:9: error: implicit declaration of function '__section_mem_map_addr' [-Werror=implicit-function-declaration]
      54 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:252:16: note: in expansion of macro 'pfn_to_page'
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:52:2: warning: returning 'long unsigned int' from a function with return type 'struct page *' makes pointer from integer without a cast [-Wint-conversion]
      52 | ({      unsigned long __pfn = (pfn);                    \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      53 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      55 | })
         | ~~
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
   arch/riscv/include/asm/pgtable.h:518:31: error: invalid use of undefined type 'struct vm_area_struct'
     518 |                 set_pte_at(vma->vm_mm, address, ptep, entry);
         |                               ^~
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:141:60: error: invalid use of undefined type 'struct mm_struct'
     141 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                            ^~
   include/linux/pgtable.h:161:49: note: in expansion of macro 'pgd_offset'
     161 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                                 ^~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:149:53: error: 'init_mm' undeclared (first use in this function)
     149 | #define pgd_offset_k(address)           pgd_offset(&init_mm, (address))
         |                                                     ^~~~~~~
   include/linux/pgtable.h:141:57: note: in definition of macro 'pgd_offset'
     141 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                         ^~
   include/linux/pgtable.h:166:49: note: in expansion of macro 'pgd_offset_k'
     166 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                                 ^~~~~~~~~~~~
   include/linux/pgtable.h:149:53: note: each undeclared identifier is reported only once for each function it appears in
     149 | #define pgd_offset_k(address)           pgd_offset(&init_mm, (address))
         |                                                     ^~~~~~~
   include/linux/pgtable.h:141:57: note: in definition of macro 'pgd_offset'
     141 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                         ^~
   include/linux/pgtable.h:166:49: note: in expansion of macro 'pgd_offset_k'
     166 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                                 ^~~~~~~~~~~~
   include/linux/pgtable.h: At top level:
   include/linux/pgtable.h:814:38: error: unknown type name 'swp_entry_t'
     814 | static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
         |                                      ^~~~~~~~~~~
   include/linux/pgtable.h: In function '__ptep_modify_prot_start':
   include/linux/pgtable.h:941:38: error: invalid use of undefined type 'struct vm_area_struct'
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
   include/asm-generic/io.h:547:27: note: in expansion of macro 'PCI_IOBASE'
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ^~~~~~~~~~
--
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
   include/linux/mmzone.h: At top level:
>> include/linux/mmzone.h:1889:28: error: conflicting types for '__section_mem_map_addr'; have 'struct page *(struct mem_section *)'
    1889 | static inline struct page *__section_mem_map_addr(struct mem_section *section)
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:54:9: note: previous implicit declaration of '__section_mem_map_addr' with type 'int()'
      54 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:252:16: note: in expansion of macro 'pfn_to_page'
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~
>> include/linux/mmzone.h:1950:35: error: conflicting types for '__pfn_to_section'; have 'struct mem_section *(long unsigned int)'
    1950 | static inline struct mem_section *__pfn_to_section(unsigned long pfn)
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:37: note: previous implicit declaration of '__pfn_to_section' with type 'int()'
      53 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:252:16: note: in expansion of macro 'pfn_to_page'
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__pfn_to_section +53 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  50  
67de648211fa04 Andy Whitcroft    2006-06-23  51  #define __pfn_to_page(pfn)				\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27 @52  ({	unsigned long __pfn = (pfn);			\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27 @53  	struct mem_section *__sec = __pfn_to_section(__pfn);	\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27 @54  	__section_mem_map_addr(__sec) + __pfn;		\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  55  })
bb1c50d3967f69 Mike Rapoport     2021-06-28  56  #endif /* CONFIG_FLATMEM/SPARSEMEM */
67de648211fa04 Andy Whitcroft    2006-06-23  57  

:::::: The code at line 53 was first introduced by commit
:::::: a117e66ed45ac0569c039ea60bd7a9a61e031858 [PATCH] unify pfn_to_page: generic functions

:::::: TO: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
