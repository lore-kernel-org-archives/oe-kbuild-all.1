Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF7517999
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 18:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVxLECRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698689062; x=1730225062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lTgWUKrWu6dNa6HDno8T8s2V+nBJhnH0W5WixuVXj4M=;
  b=mVxLECRiqd+QjbXXB/bQJmzxxKej32vuUAIUnNo9AddLHV9C0QmdmBy8
   LSdOT1KRmQkcfrBw3YSRCMEZ/d19+QEMF0DQKNsPR0DdBFCgkR4fMPDYO
   IWQY5CJS9U0OulODjVc8rJfpHo5JdzXzCX3peZwU2UICpkxDJVXk7zwA/
   nZx7VQLPEHXJrOI2DknuUfOln012IYWlAlP66ggs2pc3pIBt4hLervvig
   9xsRj3dz734lf5Gmp8kSeP/+L5xRp7ReWIYpMZ3dioiewaIivCc2W6+Pk
   L1PaTE8Lj0KDF6CqRKNwERYFO3GvZ89fMVQJEfiZiz1m8a6FnmRGcvOVP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="390994558"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="390994558"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 11:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="830756943"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="830756943"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Oct 2023 11:04:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxWcc-000DSz-0p;
	Mon, 30 Oct 2023 18:04:18 +0000
Date: Tue, 31 Oct 2023 02:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Tina Zhang <tina.zhang@intel.com>
Subject: [tinazhangzw:vt-d-pgtable-20231030 19/28]
 drivers/iommu/io-pgtable-virt.c:73:17: error: void value not ignored as it
 ought to be
Message-ID: <202310310158.31bcjo3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git vt-d-pgtable-20231030
head:   d67187b15fc1f529c2ad0e7adcd3ced0c6818ecd
commit: 266feb1f32c3d50bf63deac5eb506c83d3b8e7ee [19/28] iommu: Add virt page table format
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231031/202310310158.31bcjo3v-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310158.31bcjo3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310158.31bcjo3v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:6,
                    from drivers/iommu/io-pgtable-virt.c:13:
   drivers/iommu/io-pgtable-virt.c: In function 'virt_iopt_pte_to_va':
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:40:29: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
      40 |                             VIRT_PGTABLE_PTE_PFN_MASK(VIRT_PGTABLE_LAST_LEVEL));
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from drivers/iommu/io-pgtable-virt.c:15:
   drivers/iommu/io-pgtable-virt.c: In function 'virt_iopt_install_table':
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:61:30: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
      61 |         if (WARN_ON(paddr & ~VIRT_PGTABLE_PTE_PFN_MASK(VIRT_PGTABLE_LAST_LEVEL)))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/io-pgtable-virt.c:73:17: error: void value not ignored as it ought to be
      73 |         old_pte = cmpxchg64_relaxed(ptep, old_pte, pte);
         |                 ^
   drivers/iommu/io-pgtable-virt.c: In function 'virt_iopt_install_pte':
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:125:30: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     125 |         if (WARN_ON(paddr & ~VIRT_PGTABLE_PTE_PFN_MASK(lvl)))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c: In function '__virt_iopt_iova_to_phys':
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:317:23: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     317 |         return (pte & VIRT_PGTABLE_PTE_PFN_MASK(lvl)) | (iova & mask);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   drivers/iommu/io-pgtable-virt.c: In function 'virt_iopt_alloc':
   include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c:336:9: note: in expansion of macro 'BUILD_BUG_ON'
     336 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000);
         |         ^~~~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:336:22: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     336 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c:336:9: note: in expansion of macro 'BUILD_BUG_ON'
     336 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000);
         |         ^~~~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:336:22: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     336 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'


vim +73 drivers/iommu/io-pgtable-virt.c

    42	
    43	/* Allocate a page table and install it at @ptep */
    44	static viopte_t virt_iopt_install_table(struct virt_iopt *viopt, viopte_t *ptep,
    45						viopte_t old_pte, gfp_t gfp)
    46	{
    47		phys_addr_t paddr;
    48		viopte_t *table;
    49		viopte_t pte;
    50	
    51		/*
    52		 * I suppose we could write all DMA addresses in the table, but we do
    53		 * need phys_to_virt() to free the table. We're not going to support
    54		 * non-coherent IOMMUs anyway, and all the other kids do it!
    55		 */
    56		table = (viopte_t *)get_zeroed_page(gfp);
    57		if (!table)
    58			return 0;
    59	
    60		paddr = virt_to_phys(table);
    61		if (WARN_ON(paddr & ~VIRT_PGTABLE_PTE_PFN_MASK(VIRT_PGTABLE_LAST_LEVEL)))
    62			goto err_free_table;
    63	
    64		/*
    65		 * Ensure the table is visible before the pte. Pairs with the address
    66		 * dependency on the page walker side.
    67		 *
    68		 * TODO: dma_wmb() if VIRTIO_F_ORDER_PLATFORM
    69		 */
    70		smp_wmb();
    71	
    72		pte = paddr | VIRT_PGTABLE_PTE_VALID | VIRT_PGTABLE_PTE_TABLE;
  > 73		old_pte = cmpxchg64_relaxed(ptep, old_pte, pte);
    74		if (old_pte) {
    75			/*
    76			 * We may race with another thread to install the table.
    77			 * No problem.
    78			 */
    79			IOPT_DEBUG("race while installing table 0x%llx -> 0x%llx (OK)\n",
    80				   old_pte, pte);
    81			free_page((unsigned long)table);
    82			return old_pte;
    83		}
    84	
    85		return pte;
    86	err_free_table:
    87		free_page((unsigned long)table);
    88		return 0;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
