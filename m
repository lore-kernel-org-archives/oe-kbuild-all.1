Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909CF1FC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690519334; x=1722055334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JcaEuWQXo6NgKD9RELUlbrQ3hy9f2ur294NLfDb+yM=;
  b=gdZXjObtfUtjNh14Cz5WhogWcKs6ivrlSxswEYR2r3bwfo/+qUyoAoE9
   eK//MD6u8nz7GApP0YC+sVXYq39lSxQIdIxOrvD0Qsbz/Y7h26+9JByyJ
   ZbZZsWKSIEBLp8cXpEapWkDJahSUT2ScZP2pBn0/ZLLu7cFT3nienQMFx
   8KHeYeR5o7F78HvL/YW7WjgSNLCoWcMfai5XGNtrcrmwyODXY0WJKUaaj
   8/OD/7ih9XeAlAxaztthfVoaa4SLVDoJJcibz26Bxo/ZywjZe18JR6wYJ
   02RITvjhxwXVxlQNFURDbHohur6Gu9jq/lLbsm/EsZikqOKbNsQXriB2R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454867087"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="454867087"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 21:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="721121129"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="721121129"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 21:42:12 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPFIp-0002st-2k;
	Fri, 28 Jul 2023 04:42:11 +0000
Date: Fri, 28 Jul 2023 12:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:ktext-current 3/19] arch/arm64/include/asm/memory.h:56:6:
 warning: "CONFIG_ARM64_4K_PAGES" is not defined, evaluates to 0
Message-ID: <202307281233.LbGEDS4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm ktext-current
head:   f62358852613b0387dc8941896a2ac63ac520c9b
commit: a976a51f5a679dc2e4ee0239859ed09ea5fdfef7 [3/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r053-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281233.LbGEDS4T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281233.LbGEDS4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281233.LbGEDS4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
>> arch/arm64/include/asm/memory.h:56:6: warning: "CONFIG_ARM64_4K_PAGES" is not defined, evaluates to 0 [-Wundef]
      56 | #if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/smp.h:110,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/platform/goldfish/goldfish_pipe.c:50:
>> arch/arm64/include/asm/memory.h:56:6: warning: "CONFIG_ARM64_4K_PAGES" is not defined, evaluates to 0 [-Wundef]
      56 | #if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/goldfish/goldfish_pipe.c:926:36: warning: 'goldfish_pipe_acpi_match' defined but not used [-Wunused-const-variable=]
     926 | static const struct acpi_device_id goldfish_pipe_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
>> arch/arm64/include/asm/memory.h:56:6: warning: "CONFIG_ARM64_4K_PAGES" is not defined, evaluates to 0 [-Wundef]
      56 | #if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/esr.h:10,
                    from arch/arm64/include/asm/debug-monitors.h:11,
                    from arch/arm64/include/asm/assembler.h:23,
                    from arch/arm64/kernel/vdso/note.S:15:
>> arch/arm64/include/asm/memory.h:56:6: warning: "CONFIG_ARM64_4K_PAGES" is not defined, evaluates to 0 [-Wundef]
      56 | #if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/esr.h:10,
                    from arch/arm64/include/asm/debug-monitors.h:11,
                    from arch/arm64/include/asm/assembler.h:23,
                    from arch/arm64/include/asm/linkage.h:5,
                    from include/linux/linkage.h:8,
                    from arch/arm64/kernel/vdso/sigreturn.S:15:
>> arch/arm64/include/asm/memory.h:56:6: warning: "CONFIG_ARM64_4K_PAGES" is not defined, evaluates to 0 [-Wundef]
      56 | #if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_ARM64_4K_PAGES +56 arch/arm64/include/asm/memory.h

    46	
    47	/*
    48	 * Setting KIMAGE_VADDR has got a lot harder, ideally we'd like to use
    49	 * min(PGDIR_SIZE, MODULES_VSIZE) but this can't work because this is used
    50	 * both in assembly as C, where it causes problems. min_t() solves the
    51	 * C problems but can't be used in assembly.
    52	 * CONFIG_ARM64_4K_PAGES, PGDIR_SIZE is 2M, 1G, 512G
    53	 * CONFIG_ARM64_16K_PAGES, PGDIR_SIZE is 32M, 64G or 128T
    54	 * CONFIG_ARM64_64K_PAGES, PGDIR_SIZE is 512M or 4T
    55	 */
  > 56	#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
  > 57	    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
    58	    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
    59	#define KIMAGE_OFFSET		MODULES_VSIZE
    60	#else
    61	#define KIMAGE_OFFSET		PGDIR_SIZE
    62	#endif
    63	#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + KIMAGE_OFFSET)
    64	#define MODULES_END		(KIMAGE_VADDR)
    65	#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
    66	#define MODULES_VSIZE		(SZ_2G)
    67	#define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
    68	#define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
    69	#define PCI_IO_END		(VMEMMAP_START - SZ_8M)
    70	#define PCI_IO_START		(PCI_IO_END - PCI_IO_SIZE)
    71	#define FIXADDR_TOP		(VMEMMAP_START - SZ_32M)
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
