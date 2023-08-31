Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE97233D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693469980; x=1725005980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbpbOM+csvRFwpPn5d7ZsjcFM/hYP3XUPTmtESuK72A=;
  b=UB1INz3vVV7beI3FUT3km4DlwTBJGIOrYmFZs7ZUnDrIgX9+g1nYTHLC
   1aATHOqZoDcV96AHkJgZUj2o+ZzxENm01wR+1hC2eL4zr3uPBK2sOv8D2
   Xkjo4tFe201f1hevp9aHqmSzJkJhR2ug63herj/E6hRdlgft4TBQD5krC
   jUh4ScJ6o0mj4FPwXFdiJGFf9lllLUGrvk6d2XDPmdoeuP2kEYqb2sHqy
   Zpfk6kUf7EDprERzYXIXIfYLs8XGa2RPeN5svCUlInXez03FkBNQEvW0d
   WqXjVA1fbaMILjKuMtASr2fFZJlSzUH7c0WSxzAi3+lRvhusOafS/QAf5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360848687"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="360848687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 01:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="829566998"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="829566998"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2023 01:19:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbcth-000B6t-0R;
	Thu, 31 Aug 2023 08:19:25 +0000
Date: Thu, 31 Aug 2023 16:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3829/24604]
 drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of
 function '__ioremap'; did you mean 'do_ioremap'?
Message-ID: <202308311616.3jUwaOct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haiying,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: e621849d1464f98a17ed9a39307cc14fc210e8d3 [3829/24604] soc: fsl: dpio: change CENA regs to be cacheable
config: powerpc-randconfig-r006-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311616.3jUwaOct-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311616.3jUwaOct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311616.3jUwaOct-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/dpio-driver.c: In function 'dpaa2_dpio_probe':
>> drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of function '__ioremap'; did you mean 'do_ioremap'? [-Werror=implicit-function-declaration]
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                         ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/page.h:301,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from arch/powerpc/include/asm/ptrace.h:323,
                    from arch/powerpc/include/asm/hw_irq.h:12,
                    from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:526,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/soc/fsl/dpio/dpio-driver.c:10:
>> drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared (first use in this function); did you mean 'PAGE_TYPE_BASE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: note: each undeclared identifier is reported only once for each function it appears in
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:50: error: 'PTE_AF' undeclared (first use in this function); did you mean 'PTR_IF'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                  ^~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:59: error: 'PTE_PXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                           ^~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:69: error: 'PTE_UXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                     ^~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:79: error: 'PTE_DIRTY' undeclared (first use in this function); did you mean 'I_DIRTY'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                               ^~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:91: error: 'PTE_WRITE' undeclared (first use in this function); did you mean 'MAY_WRITE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                           ^~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:103: error: implicit declaration of function 'PTE_ATTRINDX' [-Werror=implicit-function-declaration]
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                       ^~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:116: error: 'MT_NORMAL' undeclared (first use in this function); did you mean 'ZONE_NORMAL'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                                    ^~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:46:40: note: in definition of macro '__pgprot'
      46 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +32 drivers/soc/fsl/dpio/dpio-driver.c

    29	
  > 30	#define PROT_NORMAL_NS		(PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
    31	
  > 32	#define ioremap_cache_ns(addr, size)	__ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
    33	
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
