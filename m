Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7696C2C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690528579; x=1722064579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zKKE0ZCg3zOJiDrG/96vqgYroLaWgSJWHNWLUesKRcc=;
  b=awAv7lReUj5dzFf0a4KSstqkBoA39zATRxKCmYl6ooxyHVI8LgW7h1Bm
   U+RsmnbGlo6+X5LwkkJHOFqTzxmjn3kro7+FeB9cW+XQldE01cDG7Pmjf
   XuCp9mvXJ/d7PJvhP3rFHz1PeiOM5OtElkJPJx2sziPyJjUraw+LuwDye
   OqHkZzWCS6A62XTSU90PdnenD3YVb0yNnTAZRfNDNjGtU/GkZd42NyeTo
   ZV79LnyTyuSEcjfqZ9G1alerI75CNc6CAaS3RjDI3Xzy8hqxa0gaxY2pf
   Rpxyo+YdLdWRtZ80jjIJU2tQhgSs6GmmT/KqQJODUg4uw8V8nnWea8PVq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432340436"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="432340436"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 00:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870759215"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2023 00:15:56 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPHha-0002yD-18;
	Fri, 28 Jul 2023 07:15:54 +0000
Date: Fri, 28 Jul 2023 15:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:ktext-current 3/19] arch/arm64/include/asm/memory.h:58:6:
 warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0
Message-ID: <202307281542.xBMg9lMu-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230728/202307281542.xBMg9lMu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281542.xBMg9lMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281542.xBMg9lMu-lkp@intel.com/

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
   arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
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
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from net/ipv4/route.c:63:
   arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/route.c: In function 'ip_rt_send_redirect':
   net/ipv4/route.c:880:13: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
     880 |         int log_martians;
         |             ^~~~~~~~~~~~
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
   arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/esr.h:10,
                    from arch/arm64/include/asm/debug-monitors.h:11,
                    from arch/arm64/include/asm/assembler.h:23,
                    from arch/arm64/kernel/vdso/note.S:15:
   arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/esr.h:10,
                    from arch/arm64/include/asm/debug-monitors.h:11,
                    from arch/arm64/include/asm/assembler.h:23,
                    from arch/arm64/include/asm/linkage.h:5,
                    from include/linux/linkage.h:8,
                    from arch/arm64/kernel/vdso/sigreturn.S:15:
   arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_ARM64_64K_PAGES +58 arch/arm64/include/asm/memory.h

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
    56	#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
  > 57	    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
  > 58	    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
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
