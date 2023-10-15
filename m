Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914F57FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 01:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jx23wYOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697332033; x=1728868033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lolrQN71u2jRSDXmxI9nBoNdBdBBte5cgrZaJtSx8YE=;
  b=jx23wYOYlcBORrXIO+agk6mU1k2QEARXEezl72ckj+LQmHEynTE+XVOg
   5leT2HPn/cWscmcZKkWDl6NTT+PFMFYIuE7MpNsR9rhFZ7GTeDzICTP8S
   Jxb5o34fJ2F2hfYT/12SAAQVLSNBZb08JBqV0jJNDzW4BI2cTKQ+6Yw2s
   1IdLn4wlheKUwst5DPrqG8ss7t/2a8RERc9fe/sihECJT7xO/JLA+aGUX
   QjiVrPNaYuKy3gd0yK7I/RK6EOquVIFpkae9AjQJFvJT6KLlrGexfY35a
   mnptZUL5U73lafrdVhspzv9y1Tgu4Snik9YCQLfGZylqJGtlNFgKwsL3A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382586244"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="382586244"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 18:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="731814835"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="731814835"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 18:07:11 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrpb2-0006tP-2Y;
	Sun, 15 Oct 2023 01:07:08 +0000
Date: Sun, 15 Oct 2023 09:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4832/15767]
 arch/arm/mach-imx/pm-imx7ulp.c:649:13: warning: no previous prototype for
 'imx7ulp_pm_common_init'
Message-ID: <202310150905.C1cUcIIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: fc7ba8739b847b6e0c7985170fc0483b168dcf71 [4832/15767] Merge branch 'clock/next' into next
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150905.C1cUcIIS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150905.C1cUcIIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150905.C1cUcIIS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/pm-imx7ulp.c:649:13: warning: no previous prototype for 'imx7ulp_pm_common_init' [-Wmissing-prototypes]
     649 | void __init imx7ulp_pm_common_init(const struct imx7ulp_pm_socdata
         |             ^~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/mach-imx7ulp.c:22:24: warning: 'mx7ulp_io_desc' defined but not used [-Wunused-variable]
      22 | static struct map_desc mx7ulp_io_desc[] __initdata = {
         |                        ^~~~~~~~~~~~~~


vim +/imx7ulp_pm_common_init +649 arch/arm/mach-imx/pm-imx7ulp.c

38ffbbaeede0b0 Anson Huang 2019-08-07  648  
38ffbbaeede0b0 Anson Huang 2019-08-07 @649  void __init imx7ulp_pm_common_init(const struct imx7ulp_pm_socdata
38ffbbaeede0b0 Anson Huang 2019-08-07  650  				*socdata)
de70d0e9d43dd5 A.s. Dong   2018-11-10  651  {
de70d0e9d43dd5 A.s. Dong   2018-11-10  652  	struct device_node *np;
38ffbbaeede0b0 Anson Huang 2019-08-07  653  	unsigned long sram_paddr = 0;
38ffbbaeede0b0 Anson Huang 2019-08-07  654  	const u32 *mmdc_offset_array;
38ffbbaeede0b0 Anson Huang 2019-08-07  655  	const u32 *mmdc_io_offset_array;
38ffbbaeede0b0 Anson Huang 2019-08-07  656  	unsigned long i, j;
38ffbbaeede0b0 Anson Huang 2019-08-07  657  	int ret;
38ffbbaeede0b0 Anson Huang 2019-08-07  658  
38ffbbaeede0b0 Anson Huang 2019-08-07  659  	if (psci_ops.cpu_suspend) {
38ffbbaeede0b0 Anson Huang 2019-08-07  660  		aips1_base = ioremap(MX7ULP_AIPS1_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  661  		aips2_base = ioremap(MX7ULP_AIPS2_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  662  		aips3_base = ioremap(MX7ULP_AIPS3_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  663  		aips4_base = ioremap(MX7ULP_AIPS4_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  664  		aips5_base = ioremap(MX7ULP_AIPS5_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  665  	} else {
38ffbbaeede0b0 Anson Huang 2019-08-07  666  		/* Set all entries to 0 except first 3 words reserved for M4. */
38ffbbaeede0b0 Anson Huang 2019-08-07  667  		memset((void *)iram_tlb_base_addr, 0, MX7ULP_IRAM_TLB_SIZE);
38ffbbaeede0b0 Anson Huang 2019-08-07  668  
38ffbbaeede0b0 Anson Huang 2019-08-07  669  		/*
38ffbbaeede0b0 Anson Huang 2019-08-07  670  		 * Make sure the IRAM virtual address has a mapping in the IRAM
38ffbbaeede0b0 Anson Huang 2019-08-07  671  		 * page table.
38ffbbaeede0b0 Anson Huang 2019-08-07  672  		 *
38ffbbaeede0b0 Anson Huang 2019-08-07  673  		 * Only use the top 12 bits [31-20] when storing the physical
38ffbbaeede0b0 Anson Huang 2019-08-07  674  		 * address in the page table as only these bits are required
38ffbbaeede0b0 Anson Huang 2019-08-07  675  		 * for 1M mapping.
38ffbbaeede0b0 Anson Huang 2019-08-07  676  		 */
38ffbbaeede0b0 Anson Huang 2019-08-07  677  		j = ((iram_tlb_base_addr >> 20) << 2) / 4;
38ffbbaeede0b0 Anson Huang 2019-08-07  678  		*((unsigned long *)iram_tlb_base_addr + j) =
38ffbbaeede0b0 Anson Huang 2019-08-07  679  			(iram_tlb_phys_addr & ADDR_1M_MASK) |
38ffbbaeede0b0 Anson Huang 2019-08-07  680  			TT_ATTRIB_NON_CACHEABLE_1M;
38ffbbaeede0b0 Anson Huang 2019-08-07  681  		/*
38ffbbaeede0b0 Anson Huang 2019-08-07  682  		 * Make sure the AIPS1 virtual address has a mapping in the
38ffbbaeede0b0 Anson Huang 2019-08-07  683  		 * IRAM page table.
38ffbbaeede0b0 Anson Huang 2019-08-07  684  		 */
38ffbbaeede0b0 Anson Huang 2019-08-07  685  		aips1_base = ioremap(MX7ULP_AIPS1_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  686  		j = (((u32)aips1_base >> 20) << 2) / 4;
38ffbbaeede0b0 Anson Huang 2019-08-07  687  		*((unsigned long *)iram_tlb_base_addr + j) =
38ffbbaeede0b0 Anson Huang 2019-08-07  688  			((MX7ULP_AIPS1_BASE_ADDR) & ADDR_1M_MASK) |
38ffbbaeede0b0 Anson Huang 2019-08-07  689  			TT_ATTRIB_NON_CACHEABLE_1M;
38ffbbaeede0b0 Anson Huang 2019-08-07  690  		/*
38ffbbaeede0b0 Anson Huang 2019-08-07  691  		 * Make sure the AIPS2 virtual address has a mapping in the
38ffbbaeede0b0 Anson Huang 2019-08-07  692  		 * IRAM page table.
38ffbbaeede0b0 Anson Huang 2019-08-07  693  		 */
38ffbbaeede0b0 Anson Huang 2019-08-07  694  		aips2_base = ioremap(MX7ULP_AIPS2_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  695  		j = (((u32)aips2_base >> 20) << 2) / 4;
38ffbbaeede0b0 Anson Huang 2019-08-07  696  		*((unsigned long *)iram_tlb_base_addr + j) =
38ffbbaeede0b0 Anson Huang 2019-08-07  697  			((MX7ULP_AIPS2_BASE_ADDR) & ADDR_1M_MASK) |
38ffbbaeede0b0 Anson Huang 2019-08-07  698  			TT_ATTRIB_NON_CACHEABLE_1M;
38ffbbaeede0b0 Anson Huang 2019-08-07  699  		/*
38ffbbaeede0b0 Anson Huang 2019-08-07  700  		 * Make sure the AIPS3 virtual address has a mapping in the
38ffbbaeede0b0 Anson Huang 2019-08-07  701  		 * IRAM page table.
38ffbbaeede0b0 Anson Huang 2019-08-07  702  		 */
38ffbbaeede0b0 Anson Huang 2019-08-07  703  		aips3_base = ioremap(MX7ULP_AIPS3_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  704  		j = (((u32)aips3_base >> 20) << 2) / 4;
38ffbbaeede0b0 Anson Huang 2019-08-07  705  		*((unsigned long *)iram_tlb_base_addr + j) =
38ffbbaeede0b0 Anson Huang 2019-08-07  706  			((MX7ULP_AIPS3_BASE_ADDR) & ADDR_1M_MASK) |
38ffbbaeede0b0 Anson Huang 2019-08-07  707  			TT_ATTRIB_NON_CACHEABLE_1M;
38ffbbaeede0b0 Anson Huang 2019-08-07  708  		/*
38ffbbaeede0b0 Anson Huang 2019-08-07  709  		 * Make sure the AIPS4 virtual address has a mapping in the
38ffbbaeede0b0 Anson Huang 2019-08-07  710  		 * IRAM page table.
38ffbbaeede0b0 Anson Huang 2019-08-07  711  		 */
38ffbbaeede0b0 Anson Huang 2019-08-07  712  		aips4_base = ioremap(MX7ULP_AIPS4_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  713  		j = (((u32)aips4_base >> 20) << 2) / 4;
38ffbbaeede0b0 Anson Huang 2019-08-07  714  		*((unsigned long *)iram_tlb_base_addr + j) =
38ffbbaeede0b0 Anson Huang 2019-08-07  715  			((MX7ULP_AIPS4_BASE_ADDR) & ADDR_1M_MASK) |
38ffbbaeede0b0 Anson Huang 2019-08-07  716  			TT_ATTRIB_NON_CACHEABLE_1M;
38ffbbaeede0b0 Anson Huang 2019-08-07  717  		/*
38ffbbaeede0b0 Anson Huang 2019-08-07  718  		 * Make sure the AIPS5 virtual address has a mapping in the
38ffbbaeede0b0 Anson Huang 2019-08-07  719  		 * IRAM page table.
38ffbbaeede0b0 Anson Huang 2019-08-07  720  		 */
38ffbbaeede0b0 Anson Huang 2019-08-07  721  		aips5_base = ioremap(MX7ULP_AIPS5_BASE_ADDR, SZ_1M);
38ffbbaeede0b0 Anson Huang 2019-08-07  722  		j = (((u32)aips5_base >> 20) << 2) / 4;
38ffbbaeede0b0 Anson Huang 2019-08-07  723  		*((unsigned long *)iram_tlb_base_addr + j) =
38ffbbaeede0b0 Anson Huang 2019-08-07  724  			((MX7ULP_AIPS5_BASE_ADDR) & ADDR_1M_MASK) |
38ffbbaeede0b0 Anson Huang 2019-08-07  725  			TT_ATTRIB_NON_CACHEABLE_1M;
38ffbbaeede0b0 Anson Huang 2019-08-07  726  	}
de70d0e9d43dd5 A.s. Dong   2018-11-10  727  
de70d0e9d43dd5 A.s. Dong   2018-11-10  728  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-smc1");
de70d0e9d43dd5 A.s. Dong   2018-11-10  729  	smc1_base = of_iomap(np, 0);
4a4fb66119eb71 Anson Huang 2020-02-13  730  	of_node_put(np);
de70d0e9d43dd5 A.s. Dong   2018-11-10  731  	WARN_ON(!smc1_base);
de70d0e9d43dd5 A.s. Dong   2018-11-10  732  
38ffbbaeede0b0 Anson Huang 2019-08-07  733  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-pmc0");
38ffbbaeede0b0 Anson Huang 2019-08-07  734  	pmc0_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  735  	WARN_ON(!pmc0_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  736  
38ffbbaeede0b0 Anson Huang 2019-08-07  737  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-pmc1");
38ffbbaeede0b0 Anson Huang 2019-08-07  738  	pmc1_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  739  	WARN_ON(!pmc1_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  740  
38ffbbaeede0b0 Anson Huang 2019-08-07  741  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-tpm");
38ffbbaeede0b0 Anson Huang 2019-08-07  742  	tpm5_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  743  	WARN_ON(!tpm5_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  744  
38ffbbaeede0b0 Anson Huang 2019-08-07  745  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-lpuart");
38ffbbaeede0b0 Anson Huang 2019-08-07  746  	lpuart4_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  747  	WARN_ON(!lpuart4_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  748  
38ffbbaeede0b0 Anson Huang 2019-08-07  749  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-pcc2");
38ffbbaeede0b0 Anson Huang 2019-08-07  750  	pcc2_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  751  	WARN_ON(!pcc2_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  752  
38ffbbaeede0b0 Anson Huang 2019-08-07  753  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-pcc3");
38ffbbaeede0b0 Anson Huang 2019-08-07  754  	pcc3_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  755  	WARN_ON(!pcc3_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  756  
38ffbbaeede0b0 Anson Huang 2019-08-07  757  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-iomuxc1");
38ffbbaeede0b0 Anson Huang 2019-08-07  758  	iomuxc1_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  759  	WARN_ON(!iomuxc1_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  760  
38ffbbaeede0b0 Anson Huang 2019-08-07  761  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-scg1");
38ffbbaeede0b0 Anson Huang 2019-08-07  762  	scg1_base = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  763  	WARN_ON(!scg1_base);
38ffbbaeede0b0 Anson Huang 2019-08-07  764  
b12eb9624fe6f8 Anson Huang 2020-09-22  765  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7ulp-wdt");
b12eb9624fe6f8 Anson Huang 2020-09-22  766  	wdog1_base = of_iomap(np, 0);
b12eb9624fe6f8 Anson Huang 2020-09-22  767  	WARN_ON(!wdog1_base);
b12eb9624fe6f8 Anson Huang 2020-09-22  768  
38ffbbaeede0b0 Anson Huang 2019-08-07  769  	np = NULL;
38ffbbaeede0b0 Anson Huang 2019-08-07  770  	for (i = 0; i < 4; i++) {
38ffbbaeede0b0 Anson Huang 2019-08-07  771  		np = of_find_compatible_node(np, NULL, "fsl,vf610-gpio");
016d9cfd553bb9 Haibo Chen  2021-01-12  772  		port_pcr_base[i] = of_iomap(np, 0);
38ffbbaeede0b0 Anson Huang 2019-08-07  773  		gpio_base[i] = of_iomap(np, 1);
016d9cfd553bb9 Haibo Chen  2021-01-12  774  		WARN_ON(!port_pcr_base[i]);
38ffbbaeede0b0 Anson Huang 2019-08-07  775  		WARN_ON(!gpio_base[i]);
38ffbbaeede0b0 Anson Huang 2019-08-07  776  	}
38ffbbaeede0b0 Anson Huang 2019-08-07  777  
38ffbbaeede0b0 Anson Huang 2019-08-07  778  	if (psci_ops.cpu_suspend) {
38ffbbaeede0b0 Anson Huang 2019-08-07  779  		pm_info = kzalloc(SZ_16K, GFP_KERNEL);
38ffbbaeede0b0 Anson Huang 2019-08-07  780  		if (!pm_info)
38ffbbaeede0b0 Anson Huang 2019-08-07  781  			panic("pm info allocation failed\n");
38ffbbaeede0b0 Anson Huang 2019-08-07  782  	} else {
38ffbbaeede0b0 Anson Huang 2019-08-07  783  		/*
38ffbbaeede0b0 Anson Huang 2019-08-07  784  		 * 16KB is allocated for IRAM TLB, but only up 8k is for kernel TLB,
38ffbbaeede0b0 Anson Huang 2019-08-07  785  		 * The lower 8K is not used, so use the lower 8K for IRAM code and
38ffbbaeede0b0 Anson Huang 2019-08-07  786  		 * pm_info.
38ffbbaeede0b0 Anson Huang 2019-08-07  787  		 *
38ffbbaeede0b0 Anson Huang 2019-08-07  788  		 */
38ffbbaeede0b0 Anson Huang 2019-08-07  789  		sram_paddr = iram_tlb_phys_addr;
38ffbbaeede0b0 Anson Huang 2019-08-07  790  
38ffbbaeede0b0 Anson Huang 2019-08-07  791  		/* Make sure sram_paddr is 8 byte aligned. */
38ffbbaeede0b0 Anson Huang 2019-08-07  792  		if ((uintptr_t)(sram_paddr) & (FNCPY_ALIGN - 1))
38ffbbaeede0b0 Anson Huang 2019-08-07  793  			sram_paddr += FNCPY_ALIGN - sram_paddr % (FNCPY_ALIGN);
38ffbbaeede0b0 Anson Huang 2019-08-07  794  
38ffbbaeede0b0 Anson Huang 2019-08-07  795  		/* Get the virtual address of the suspend code. */
38ffbbaeede0b0 Anson Huang 2019-08-07  796  		suspend_ocram_base = (void *)IMX_IO_P2V(sram_paddr);
38ffbbaeede0b0 Anson Huang 2019-08-07  797  
38ffbbaeede0b0 Anson Huang 2019-08-07  798  		pm_info = suspend_ocram_base;
38ffbbaeede0b0 Anson Huang 2019-08-07  799  	}
38ffbbaeede0b0 Anson Huang 2019-08-07  800  	pm_info->pbase = sram_paddr;
38ffbbaeede0b0 Anson Huang 2019-08-07  801  	pm_info->resume_addr = virt_to_phys(imx7ulp_cpu_resume);
38ffbbaeede0b0 Anson Huang 2019-08-07  802  	pm_info->pm_info_size = sizeof(*pm_info);
38ffbbaeede0b0 Anson Huang 2019-08-07  803  
38ffbbaeede0b0 Anson Huang 2019-08-07  804  	pm_info->scg1_base = aips2_base +
38ffbbaeede0b0 Anson Huang 2019-08-07  805  		(MX7ULP_SCG1_BASE_ADDR & ~ADDR_1M_MASK);
38ffbbaeede0b0 Anson Huang 2019-08-07  806  	pm_info->smc1_base = aips3_base +
38ffbbaeede0b0 Anson Huang 2019-08-07  807  		(MX7ULP_SMC1_BASE_ADDR & ~ADDR_1M_MASK);
38ffbbaeede0b0 Anson Huang 2019-08-07  808  	pm_info->mmdc_base = aips4_base +
38ffbbaeede0b0 Anson Huang 2019-08-07  809  		(MX7ULP_MMDC_BASE_ADDR & ~ADDR_1M_MASK);
38ffbbaeede0b0 Anson Huang 2019-08-07  810  	pm_info->mmdc_io_base = aips4_base +
38ffbbaeede0b0 Anson Huang 2019-08-07  811  		(MX7ULP_MMDC_IO_BASE_ADDR & ~ADDR_1M_MASK);
38ffbbaeede0b0 Anson Huang 2019-08-07  812  	pm_info->sim_base = aips5_base +
38ffbbaeede0b0 Anson Huang 2019-08-07  813  		(MX7ULP_SIM_BASE_ADDR & ~ADDR_1M_MASK);
38ffbbaeede0b0 Anson Huang 2019-08-07  814  
38ffbbaeede0b0 Anson Huang 2019-08-07  815  	pm_info->mmdc_io_num = socdata->mmdc_io_num;
38ffbbaeede0b0 Anson Huang 2019-08-07  816  	mmdc_io_offset_array = socdata->mmdc_io_offset;
38ffbbaeede0b0 Anson Huang 2019-08-07  817  	pm_info->mmdc_num = socdata->mmdc_num;
38ffbbaeede0b0 Anson Huang 2019-08-07  818  	mmdc_offset_array = socdata->mmdc_offset;
38ffbbaeede0b0 Anson Huang 2019-08-07  819  
38ffbbaeede0b0 Anson Huang 2019-08-07  820  	for (i = 0; i < pm_info->mmdc_io_num; i++) {
38ffbbaeede0b0 Anson Huang 2019-08-07  821  		pm_info->mmdc_io_val[i][0] =
38ffbbaeede0b0 Anson Huang 2019-08-07  822  			mmdc_io_offset_array[i];
38ffbbaeede0b0 Anson Huang 2019-08-07  823  		pm_info->mmdc_io_val[i][1] =
38ffbbaeede0b0 Anson Huang 2019-08-07  824  			readl_relaxed(pm_info->mmdc_io_base +
38ffbbaeede0b0 Anson Huang 2019-08-07  825  			mmdc_io_offset_array[i]);
38ffbbaeede0b0 Anson Huang 2019-08-07  826  	}
38ffbbaeede0b0 Anson Huang 2019-08-07  827  
38ffbbaeede0b0 Anson Huang 2019-08-07  828  	/* initialize MMDC settings */
38ffbbaeede0b0 Anson Huang 2019-08-07  829  	for (i = 0; i < pm_info->mmdc_num; i++)
38ffbbaeede0b0 Anson Huang 2019-08-07  830  		pm_info->mmdc_val[i][0] =
38ffbbaeede0b0 Anson Huang 2019-08-07  831  			mmdc_offset_array[i];
38ffbbaeede0b0 Anson Huang 2019-08-07  832  
38ffbbaeede0b0 Anson Huang 2019-08-07  833  	for (i = 0; i < pm_info->mmdc_num; i++)
38ffbbaeede0b0 Anson Huang 2019-08-07  834  		pm_info->mmdc_val[i][1] = imx7ulp_lpddr3_script[i];
38ffbbaeede0b0 Anson Huang 2019-08-07  835  
38ffbbaeede0b0 Anson Huang 2019-08-07  836  	if (!psci_ops.cpu_suspend) {
38ffbbaeede0b0 Anson Huang 2019-08-07  837  		imx7ulp_suspend_in_ocram_fn = fncpy(
38ffbbaeede0b0 Anson Huang 2019-08-07  838  			suspend_ocram_base + sizeof(*pm_info),
38ffbbaeede0b0 Anson Huang 2019-08-07  839  			&imx7ulp_suspend,
38ffbbaeede0b0 Anson Huang 2019-08-07  840  			MX7ULP_SUSPEND_OCRAM_SIZE - sizeof(*pm_info));
38ffbbaeede0b0 Anson Huang 2019-08-07  841  	}
38ffbbaeede0b0 Anson Huang 2019-08-07  842  
38ffbbaeede0b0 Anson Huang 2019-08-07  843  	if (IS_ENABLED(CONFIG_SUSPEND)) {
38ffbbaeede0b0 Anson Huang 2019-08-07  844  		ret = imx7ulp_suspend_init();
38ffbbaeede0b0 Anson Huang 2019-08-07  845  		if (ret)
38ffbbaeede0b0 Anson Huang 2019-08-07  846  			pr_warn("%s: No DDR LPM support with suspend %d!\n",
38ffbbaeede0b0 Anson Huang 2019-08-07  847  				__func__, ret);
38ffbbaeede0b0 Anson Huang 2019-08-07  848  	}
38ffbbaeede0b0 Anson Huang 2019-08-07  849  }
38ffbbaeede0b0 Anson Huang 2019-08-07  850  

:::::: The code at line 649 was first introduced by commit
:::::: 38ffbbaeede0b06462bc8bc8fe6f7b991ebab1dd ARM: imx: Add i.MX7ULP suspend/resume support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
