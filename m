Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5E17E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692944866; x=1724480866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NL4LOBPAGNf0SBup4xQACul9KRP6svJZXDxjCiC2sFM=;
  b=nQOdhcASxaosun8zERKU13eZfhtwbzUjsLpWlmfCv9tXEu1fpA5bXZ5+
   jt3TtyBk8o7D43QXyEYyZx4Hk8AcpU6elf+jbxjehh6mvGslb8OaHYwkr
   xI4ZPzwnMxOfCZy8md5OXzcw06KkTJWYa3f4gyp53eN4IRLfmXaKYPSZZ
   nzn0xVZAkrJ2HRLy2NbaoirxjiU+kEmYLn9cjGhvJpRPCnwPplxO3Ms58
   JKw6X0DuD21yTg1hVi/Nx48TDSlw1Kwcz4D3rfQQ89Q3uWHQz7ZNjXpQt
   F2RLO2gGrW0d65WnljYXTXtyyZ26FP3xsdxcez5EgiPXMdje1VouQ5HGn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="440987331"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="440987331"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 23:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="740495053"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="740495053"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2023 23:27:44 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZQIJ-0003HE-2u;
	Fri, 25 Aug 2023 06:27:43 +0000
Date: Fri, 25 Aug 2023 14:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/mainline/x86/hyperv/tdx-v3-wip 10/11]
 arch/x86/hyperv/ivm.c:408:13: warning: 'hv_is_private_mmio' defined but not
 used
Message-ID: <202308251431.GUUdq9Fl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/mainline/x86/hyperv/tdx-v3-wip
head:   39842ee60a25efe7d0d325de7192a9792db282e8
commit: 17b065e175082497907563297083b13dc86d84a9 [10/11] x86/hyperv: Use TDX GHCI to access some MSRs in a TDX VM with the paravisor
config: x86_64-randconfig-001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251431.GUUdq9Fl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251431.GUUdq9Fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251431.GUUdq9Fl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/hyperv/ivm.c:408:13: warning: 'hv_is_private_mmio' defined but not used [-Wunused-function]
     408 | static bool hv_is_private_mmio(u64 addr)
         |             ^~~~~~~~~~~~~~~~~~
>> arch/x86/hyperv/ivm.c:403:13: warning: 'hv_vtom_cache_flush_required' defined but not used [-Wunused-function]
     403 | static bool hv_vtom_cache_flush_required(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/hyperv/ivm.c:398:13: warning: 'hv_vtom_tlb_flush_required' defined but not used [-Wunused-function]
     398 | static bool hv_vtom_tlb_flush_required(bool private)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/hyperv/ivm.c:365:13: warning: 'hv_vtom_set_host_visibility' defined but not used [-Wunused-function]
     365 | static bool hv_vtom_set_host_visibility(unsigned long kbuffer, int pagecount, bool enc)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hv_is_private_mmio +408 arch/x86/hyperv/ivm.c

810a521265023a Tianyu Lan     2021-10-25  356  
810a521265023a Tianyu Lan     2021-10-25  357  /*
812b0597fb4043 Michael Kelley 2023-03-26  358   * hv_vtom_set_host_visibility - Set specified memory visible to host.
810a521265023a Tianyu Lan     2021-10-25  359   *
810a521265023a Tianyu Lan     2021-10-25  360   * In Isolation VM, all guest memory is encrypted from host and guest
810a521265023a Tianyu Lan     2021-10-25  361   * needs to set memory visible to host via hvcall before sharing memory
810a521265023a Tianyu Lan     2021-10-25  362   * with host. This function works as wrap of hv_mark_gpa_visibility()
810a521265023a Tianyu Lan     2021-10-25  363   * with memory base and size.
810a521265023a Tianyu Lan     2021-10-25  364   */
812b0597fb4043 Michael Kelley 2023-03-26 @365  static bool hv_vtom_set_host_visibility(unsigned long kbuffer, int pagecount, bool enc)
810a521265023a Tianyu Lan     2021-10-25  366  {
812b0597fb4043 Michael Kelley 2023-03-26  367  	enum hv_mem_host_visibility visibility = enc ?
812b0597fb4043 Michael Kelley 2023-03-26  368  			VMBUS_PAGE_NOT_VISIBLE : VMBUS_PAGE_VISIBLE_READ_WRITE;
810a521265023a Tianyu Lan     2021-10-25  369  	u64 *pfn_array;
810a521265023a Tianyu Lan     2021-10-25  370  	int ret = 0;
812b0597fb4043 Michael Kelley 2023-03-26  371  	bool result = true;
810a521265023a Tianyu Lan     2021-10-25  372  	int i, pfn;
810a521265023a Tianyu Lan     2021-10-25  373  
810a521265023a Tianyu Lan     2021-10-25  374  	pfn_array = kmalloc(HV_HYP_PAGE_SIZE, GFP_KERNEL);
810a521265023a Tianyu Lan     2021-10-25  375  	if (!pfn_array)
812b0597fb4043 Michael Kelley 2023-03-26  376  		return false;
810a521265023a Tianyu Lan     2021-10-25  377  
810a521265023a Tianyu Lan     2021-10-25  378  	for (i = 0, pfn = 0; i < pagecount; i++) {
810a521265023a Tianyu Lan     2021-10-25  379  		pfn_array[pfn] = virt_to_hvpfn((void *)kbuffer + i * HV_HYP_PAGE_SIZE);
810a521265023a Tianyu Lan     2021-10-25  380  		pfn++;
810a521265023a Tianyu Lan     2021-10-25  381  
810a521265023a Tianyu Lan     2021-10-25  382  		if (pfn == HV_MAX_MODIFY_GPA_REP_COUNT || i == pagecount - 1) {
810a521265023a Tianyu Lan     2021-10-25  383  			ret = hv_mark_gpa_visibility(pfn, pfn_array,
810a521265023a Tianyu Lan     2021-10-25  384  						     visibility);
812b0597fb4043 Michael Kelley 2023-03-26  385  			if (ret) {
812b0597fb4043 Michael Kelley 2023-03-26  386  				result = false;
810a521265023a Tianyu Lan     2021-10-25  387  				goto err_free_pfn_array;
812b0597fb4043 Michael Kelley 2023-03-26  388  			}
810a521265023a Tianyu Lan     2021-10-25  389  			pfn = 0;
810a521265023a Tianyu Lan     2021-10-25  390  		}
810a521265023a Tianyu Lan     2021-10-25  391  	}
810a521265023a Tianyu Lan     2021-10-25  392  
810a521265023a Tianyu Lan     2021-10-25  393   err_free_pfn_array:
810a521265023a Tianyu Lan     2021-10-25  394  	kfree(pfn_array);
812b0597fb4043 Michael Kelley 2023-03-26  395  	return result;
812b0597fb4043 Michael Kelley 2023-03-26  396  }
812b0597fb4043 Michael Kelley 2023-03-26  397  
812b0597fb4043 Michael Kelley 2023-03-26 @398  static bool hv_vtom_tlb_flush_required(bool private)
812b0597fb4043 Michael Kelley 2023-03-26  399  {
812b0597fb4043 Michael Kelley 2023-03-26  400  	return true;
812b0597fb4043 Michael Kelley 2023-03-26  401  }
812b0597fb4043 Michael Kelley 2023-03-26  402  
812b0597fb4043 Michael Kelley 2023-03-26 @403  static bool hv_vtom_cache_flush_required(void)
812b0597fb4043 Michael Kelley 2023-03-26  404  {
812b0597fb4043 Michael Kelley 2023-03-26  405  	return false;
812b0597fb4043 Michael Kelley 2023-03-26  406  }
812b0597fb4043 Michael Kelley 2023-03-26  407  
812b0597fb4043 Michael Kelley 2023-03-26 @408  static bool hv_is_private_mmio(u64 addr)
812b0597fb4043 Michael Kelley 2023-03-26  409  {
812b0597fb4043 Michael Kelley 2023-03-26  410  	/*
812b0597fb4043 Michael Kelley 2023-03-26  411  	 * Hyper-V always provides a single IO-APIC in a guest VM.
812b0597fb4043 Michael Kelley 2023-03-26  412  	 * When a paravisor is used, it is emulated by the paravisor
812b0597fb4043 Michael Kelley 2023-03-26  413  	 * in the guest context and must be mapped private.
812b0597fb4043 Michael Kelley 2023-03-26  414  	 */
812b0597fb4043 Michael Kelley 2023-03-26  415  	if (addr >= HV_IOAPIC_BASE_ADDRESS &&
812b0597fb4043 Michael Kelley 2023-03-26  416  	    addr < (HV_IOAPIC_BASE_ADDRESS + PAGE_SIZE))
812b0597fb4043 Michael Kelley 2023-03-26  417  		return true;
812b0597fb4043 Michael Kelley 2023-03-26  418  
812b0597fb4043 Michael Kelley 2023-03-26  419  	/* Same with a vTPM */
812b0597fb4043 Michael Kelley 2023-03-26  420  	if (addr >= VTPM_BASE_ADDRESS &&
812b0597fb4043 Michael Kelley 2023-03-26  421  	    addr < (VTPM_BASE_ADDRESS + PAGE_SIZE))
812b0597fb4043 Michael Kelley 2023-03-26  422  		return true;
812b0597fb4043 Michael Kelley 2023-03-26  423  
812b0597fb4043 Michael Kelley 2023-03-26  424  	return false;
810a521265023a Tianyu Lan     2021-10-25  425  }
846da38de0e822 Tianyu Lan     2021-12-13  426  

:::::: The code at line 408 was first introduced by commit
:::::: 812b0597fb4043240724e4c7bed7ba1fe15c0e3f x86/hyperv: Change vTOM handling to use standard coco mechanisms

:::::: TO: Michael Kelley <mikelley@microsoft.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
