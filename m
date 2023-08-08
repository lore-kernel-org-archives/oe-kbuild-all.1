Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6406815495
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691528326; x=1723064326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BriDhMrbnScpkePfA/i9VHSv4FRevRFWjbCWMyonK1Y=;
  b=T/fCM603VV5onSaqkSNI1dwgIRnfHtUxbubnoUY6wn4Bm424unuwaBGB
   owI7+N958pAse1RFb8yzfQV9tRbWnzpU+YOQfz4zs8Bkl9diOxxfitRxp
   H3hz67QitPo7R/rXn9VtVunlEtcFRi/67FrwdGgnZOEHXlPoAMmNGx8SG
   krI5rZfqWIJUwTny55/do7ZaOTVJJHn4y3WKqT0qqAj90HcFRVpb1cHSM
   9RNN/NeEw2XSvRd+6UG08wF+ZFikvV0BMVh8rXo1cCH+lxdvcekXg0LSf
   HOg5fNAbHj3SAtJSgO0cHOIdAkX0xJeMIryvkv6Sy/5kmrw8nYllIAXvF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351261508"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="351261508"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 13:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801473201"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="801473201"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 13:58:30 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTTmQ-0005c4-12;
	Tue, 08 Aug 2023 20:58:14 +0000
Date: Wed, 9 Aug 2023 04:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:osbi-nomap 2/3] arch/riscv/mm/init.c:258:9: error: implicit
 declaration of function 'sbi_apply_reserved_mem_erratum'
Message-ID: <202308090431.RoDgjtPv-lkp@intel.com>
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
config: riscv-randconfig-r053-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090431.RoDgjtPv-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090431.RoDgjtPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090431.RoDgjtPv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/init.c: In function 'setup_bootmem':
>> arch/riscv/mm/init.c:258:9: error: implicit declaration of function 'sbi_apply_reserved_mem_erratum' [-Werror=implicit-function-declaration]
     258 |         sbi_apply_reserved_mem_erratum(dtb_early_va);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
