Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE423570CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770984392; cv=none; b=mW/E/q4hInJ1V8rVhWllTxPu2aRKCQFQnjjP/8v3xwQL1AhdlYDmsutcY0oAGzvs4sqteETXQPDxzX1hpfJ3EBlL5QXoGJgne/qLj7UcH92JlQRZvF9hdOCgnM+Kh/nZD0t58UfminOxvERGMU4ZVx33OolkzOJZ2kveTNgrJM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770984392; c=relaxed/simple;
	bh=6ZZ0EXz1L3rcGwvYAV0+05yZ2cpU+PLMtsLZ8+r9VNE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWsC2pMstVyoyb39Kj90itMyQ9sbuT7yrnEdotttStCaimiafLvZbObbi7EzF8dN9mem8xcgpToeqcTf6pfITMmMMskYGgtBeGuV8muYAwJv4AMdg8og6HpJ7hu9CHn028pAPlGiWJY96TakQTPvXxwEXqt/acx2dN5qaeJP0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdd+RmDA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdd+RmDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770984390; x=1802520390;
  h=date:from:to:cc:subject:message-id;
  bh=6ZZ0EXz1L3rcGwvYAV0+05yZ2cpU+PLMtsLZ8+r9VNE=;
  b=kdd+RmDABfpWsuFF/dusGILI+IbbRbWn8EyD0yeICScfXr9E38iV+utN
   lBGyqxaRMV55iZN5t34HRsyt7CiiBT6MhC6+FuYcZuY+bhr7wi2q2RtAo
   uCUx2xpmosEYrUwx/Ie5LmYvaCMmGX/jzUAlWi3svGRXUieKjVKrFXtZA
   V4qKdGPtTS3tSX8T1dxeM5lwbxlnzF1yH4GyS+WXT0UjUD2cmtpMnvZ+/
   lK20+0VTIPlt8rnvm16lH4wo32lhLuACwC0S7CxlXMYIZpj3fPnrI6r3w
   JonMHAm1MtbyQ6OKmPo0DVsomr8F5hHaTL+68r79WpkHhng0NzSYg10oi
   w==;
X-CSE-ConnectionGUID: 9sz/FsDNTSKHKul0+Ew9Bw==
X-CSE-MsgGUID: PD8BHe29R1uY0kcrMinnBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71193575"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="71193575"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 04:06:28 -0800
X-CSE-ConnectionGUID: sBgmhz1tScqoItsd+uxklQ==
X-CSE-MsgGUID: wUB3V14oRVaBkTGEpca90w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211614501"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 04:06:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqrwG-00000000vLw-26jp;
	Fri, 13 Feb 2026 12:06:24 +0000
Date: Fri, 13 Feb 2026 20:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 8/16] arch/sparc/kernel/ioport.c:272:16:
 error: implicit declaration of function 'PAGE_ALIGN'; did you mean
 'PTE_ALIGN'?
Message-ID: <202602132040.yYY9osPA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: 0d55ecaa5f1415868ca9b8e976c8802b6f9635ba [8/16] PG_ALIGN
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602132040.yYY9osPA-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132040.yYY9osPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602132040.yYY9osPA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from arch/sparc/include/asm/viking.h:13,
                    from arch/sparc/include/asm/mbus.h:12,
                    from arch/sparc/include/asm/elf_32.h:94,
                    from arch/sparc/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from arch/sparc/kernel/ioport.c:29:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/dma-mapping.h:8,
                    from include/linux/pci.h:2771,
                    from arch/sparc/kernel/ioport.c:37:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/linux/scatterlist.h:211:52: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     211 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
         |                                                    ^~~~~~~~~~~~~~
         |                                                    offset_in_pg
   arch/sparc/kernel/ioport.c: In function 'sparc_dma_free_resource':
>> arch/sparc/kernel/ioport.c:272:16: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTE_ALIGN'? [-Wimplicit-function-declaration]
     272 |         size = PAGE_ALIGN(size);
         |                ^~~~~~~~~~
         |                PTE_ALIGN
--
   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from arch/sparc/include/asm/viking.h:13,
                    from arch/sparc/include/asm/mbus.h:12,
                    from arch/sparc/include/asm/elf_32.h:94,
                    from arch/sparc/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from arch/sparc/mm/init_32.c:11:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from arch/sparc/mm/init_32.c:21:
   include/linux/highmem.h: In function 'memcpy_folio':
   include/linux/highmem.h:413:41: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     413 |                     chunk > PAGE_SIZE - offset_in_page(dst_off))
         |                                         ^~~~~~~~~~~~~~
         |                                         offset_in_pg
   arch/sparc/mm/init_32.c: In function 'bootmem_init':
>> arch/sparc/mm/init_32.c:171:42: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTE_ALIGN'? [-Wimplicit-function-declaration]
     171 |         start_pfn  = (unsigned long)__pa(PAGE_ALIGN((unsigned long) &_end));
         |                                          ^~~~~~~~~~
   arch/sparc/include/asm/page_32.h:122:50: note: in definition of macro '__pa'
     122 | #define __pa(x)                 ((unsigned long)(x) - PAGE_OFFSET + phys_base)
         |                                                  ^
--
   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/sparc/mm/iommu.c:13:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/dma-mapping.h:8,
                    from include/linux/dma-map-ops.h:9,
                    from arch/sparc/mm/iommu.c:15:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/linux/scatterlist.h:211:52: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     211 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
         |                                                    ^~~~~~~~~~~~~~
         |                                                    offset_in_pg
   arch/sparc/mm/iommu.c: In function 'iommu_flush_iotlb':
>> arch/sparc/mm/iommu.c:164:15: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTE_ALIGN'? [-Wimplicit-function-declaration]
     164 |         end = PAGE_ALIGN(start + niopte*sizeof(iopte_t));
         |               ^~~~~~~~~~
         |               PTE_ALIGN
--
   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/sparc/mm/io-unit.c:12:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from arch/sparc/mm/io-unit.c:10:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/dma-mapping.h:8,
                    from include/linux/dma-map-ops.h:9,
                    from arch/sparc/mm/io-unit.c:14:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/linux/scatterlist.h:211:52: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     211 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
         |                                                    ^~~~~~~~~~~~~~
         |                                                    offset_in_pg
   arch/sparc/mm/io-unit.c: In function 'iounit_alloc':
>> arch/sparc/mm/io-unit.c:228:15: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTE_ALIGN'? [-Wimplicit-function-declaration]
     228 |         len = PAGE_ALIGN(len);
         |               ^~~~~~~~~~
         |               PTE_ALIGN
--
   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from arch/sparc/include/asm/viking.h:13,
                    from arch/sparc/include/asm/mbus.h:12,
                    from arch/sparc/include/asm/elf_32.h:94,
                    from arch/sparc/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-map-ops.h:9,
                    from kernel/dma/ops_helpers.c:6:
   arch/sparc/include/asm/pgtable_32.h:51:9: warning: 'PTE_SIZE' redefined
      51 | #define PTE_SIZE                (PTRS_PER_PTE*4)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/page_32.h:14,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15:
   include/vdso/page.h:15:9: note: this is the location of the previous definition
      15 | #define PTE_SIZE        (_AC(1,UL) << CONFIG_PTE_SHIFT)
         |         ^~~~~~~~
   In file included from include/linux/dma-mapping.h:8:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/linux/scatterlist.h:211:52: error: implicit declaration of function 'offset_in_page'; did you mean 'offset_in_pg'? [-Wimplicit-function-declaration]
     211 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
         |                                                    ^~~~~~~~~~~~~~
         |                                                    offset_in_pg
   kernel/dma/ops_helpers.c: In function 'dma_common_get_sgtable':
>> kernel/dma/ops_helpers.c:28:45: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTE_ALIGN'? [-Wimplicit-function-declaration]
      28 |                 sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
         |                                             ^~~~~~~~~~
         |                                             PTE_ALIGN


vim +272 arch/sparc/kernel/ioport.c

53b7670e5735ba Christoph Hellwig 2018-12-03  255  
ce65d36f3ea793 Christoph Hellwig 2018-12-03  256  bool sparc_dma_free_resource(void *cpu_addr, size_t size)
53b7670e5735ba Christoph Hellwig 2018-12-03  257  {
53b7670e5735ba Christoph Hellwig 2018-12-03  258  	unsigned long addr = (unsigned long)cpu_addr;
53b7670e5735ba Christoph Hellwig 2018-12-03  259  	struct resource *res;
53b7670e5735ba Christoph Hellwig 2018-12-03  260  
53b7670e5735ba Christoph Hellwig 2018-12-03  261  	res = lookup_resource(&_sparc_dvma, addr);
53b7670e5735ba Christoph Hellwig 2018-12-03  262  	if (!res) {
53b7670e5735ba Christoph Hellwig 2018-12-03  263  		printk("%s: cannot free %p\n", __func__, cpu_addr);
53b7670e5735ba Christoph Hellwig 2018-12-03  264  		return false;
53b7670e5735ba Christoph Hellwig 2018-12-03  265  	}
53b7670e5735ba Christoph Hellwig 2018-12-03  266  
53b7670e5735ba Christoph Hellwig 2018-12-03  267  	if ((addr & (PAGE_SIZE - 1)) != 0) {
53b7670e5735ba Christoph Hellwig 2018-12-03  268  		printk("%s: unaligned va %p\n", __func__, cpu_addr);
53b7670e5735ba Christoph Hellwig 2018-12-03  269  		return false;
53b7670e5735ba Christoph Hellwig 2018-12-03  270  	}
53b7670e5735ba Christoph Hellwig 2018-12-03  271  
53b7670e5735ba Christoph Hellwig 2018-12-03 @272  	size = PAGE_ALIGN(size);
53b7670e5735ba Christoph Hellwig 2018-12-03  273  	if (resource_size(res) != size) {
53b7670e5735ba Christoph Hellwig 2018-12-03  274  		printk("%s: region 0x%lx asked 0x%zx\n",
53b7670e5735ba Christoph Hellwig 2018-12-03  275  			__func__, (long)resource_size(res), size);
53b7670e5735ba Christoph Hellwig 2018-12-03  276  		return false;
53b7670e5735ba Christoph Hellwig 2018-12-03  277  	}
53b7670e5735ba Christoph Hellwig 2018-12-03  278  
53b7670e5735ba Christoph Hellwig 2018-12-03  279  	release_resource(res);
53b7670e5735ba Christoph Hellwig 2018-12-03  280  	kfree(res);
53b7670e5735ba Christoph Hellwig 2018-12-03  281  	return true;
53b7670e5735ba Christoph Hellwig 2018-12-03  282  }
53b7670e5735ba Christoph Hellwig 2018-12-03  283  

:::::: The code at line 272 was first introduced by commit
:::::: 53b7670e5735ba1c662230377d764799aaf57300 sparc: factor the dma coherent mapping into helper

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
