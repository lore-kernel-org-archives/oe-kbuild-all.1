Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860E23D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBEbe8LM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697181630; x=1728717630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvswNaCY9OlQQ7xrOXKVcM8+qdCmKbWPQbJrVHN3Bto=;
  b=jBEbe8LMa3a349bxIiRdFq0cHUO9pHOzcthWwlkCFqQ646iB1swbBeUK
   BuN8dr7mpKMFbQdMokxnnK+1oAGm/Pr1+Z3bs732eTWDW5BWMsfMfuL+S
   j0kIWMtTrx7fLU1zYAvilMb+/UIf6RfWqJxuzKIWdtxC2z3h+iEvlT2MQ
   E4FYoywmcVmBvne7PLemGA6dpsYhyBp5EIWakOPE+N4zqLFOOaVPIhBed
   YhSY9jvabWqoL5NEefwYg/M5uPDuB511DnGCX+lJYpRAN5aMOzRM8C2XG
   GOk0lPWec4iHh1lFlreIJ8AISlMgqpif6jgFWbYk80jzDm0ZLICWNf2KM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6680199"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="6680199"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 00:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086033119"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086033119"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 00:20:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrCT7-0004SJ-0s;
	Fri, 13 Oct 2023 07:20:21 +0000
Date: Fri, 13 Oct 2023 15:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2486/30000]
 drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of
 function '__ioremap'; did you mean 'do_ioremap'?
Message-ID: <202310131509.ogy12WeS-lkp@intel.com>
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
commit: b91206e1c404212dc3785bafa8f139e263007d01 [2486/30000] soc: fsl: dpio: change CENA regs to be cacheable
config: powerpc64-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131509.ogy12WeS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131509.ogy12WeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131509.ogy12WeS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/dpio-driver.c: In function 'dpaa2_dpio_probe':
>> drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of function '__ioremap'; did you mean 'do_ioremap'? [-Werror=implicit-function-declaration]
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                         ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/page.h:304,
                    from arch/powerpc/include/asm/mmu.h:132,
                    from arch/powerpc/include/asm/lppaca.h:47,
                    from arch/powerpc/include/asm/paca.h:17,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:21,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/soc/fsl/dpio/dpio-driver.c:10:
>> drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared (first use in this function); did you mean 'PAGE_TYPE_BASE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: note: each undeclared identifier is reported only once for each function it appears in
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:50: error: 'PTE_AF' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                  ^~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:59: error: 'PTE_PXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                           ^~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:69: error: 'PTE_UXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                     ^~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:79: error: 'PTE_DIRTY' undeclared (first use in this function); did you mean 'I_DIRTY'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                               ^~~~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:91: error: 'PTE_WRITE' undeclared (first use in this function); did you mean 'MAY_WRITE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                           ^~~~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:103: error: implicit declaration of function 'PTE_ATTRINDX' [-Werror=implicit-function-declaration]
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                       ^~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:116: error: 'MT_NORMAL' undeclared (first use in this function); did you mean 'ZONE_NORMAL'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                                    ^~~~~~~~~
   arch/powerpc/include/asm/pgtable-be-types.h:69:40: note: in definition of macro '__pgprot'
      69 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                        ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:211:34: note: in expansion of macro 'ioremap_cache_ns'
     211 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
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
