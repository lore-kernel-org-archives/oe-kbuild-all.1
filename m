Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314E946E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCLKowHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699082058; x=1730618058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3mS88Zvh2eJ15m63tHs9OAVrRThQ1QRe35br8zG+qRU=;
  b=kCLKowHLz/oYf5X/PuxfUbuSBp5JOT181+5x0RRc9N03Lm1I+eTliLOa
   HSJ41ISXd7I9I7+rU8MAw2YJ3wA3p9VtRFasSkZhgkbhJN59R52rmRtwg
   s+qUkRHMj6Ke+lzUtj/7lSKD6HdVW1Kh16+4s8YYzP9BzfPQ0T5LfHxwo
   dL10WqXcys74OYHz5jCOCaxhfb9WCTE85UUico3+bO3WD0zEs5TLa9DwL
   PcqFdFdFYFviaIuThki2GMMetwnqK60CcgWbPy+Gz3vDFyEvev6zpU005
   5E2T+c2IbxwGE/od/D0QztmbIg4sx/uOSrm3UweaN46oofRAILswEAnnP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="2027629"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="2027629"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885420179"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="885420179"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Nov 2023 00:14:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzArC-0003cF-06;
	Sat, 04 Nov 2023 07:14:10 +0000
Date: Sat, 4 Nov 2023 15:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/call-stuff 2/7] arch/x86/hyperv/ivm.c:329:26:
 error: 'secondary_startup_64_no_verify' undeclared; did you mean
 'secondary_startup_64'?
Message-ID: <202311041539.ELg1d434-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/call-stuff
head:   e3e235c080560e40a0395dc99ad20f4a9d9160d3
commit: 0f361cc0437940aada07e9db117d8cd2c85eb2b4 [2/7] x86/boot: Remove verify_cpu() from secondary_startup_64()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041539.ELg1d434-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041539.ELg1d434-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041539.ELg1d434-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/ivm.c: In function 'hv_snp_boot_ap':
>> arch/x86/hyperv/ivm.c:329:26: error: 'secondary_startup_64_no_verify' undeclared (first use in this function); did you mean 'secondary_startup_64'?
     329 |         vmsa->rip = (u64)secondary_startup_64_no_verify;
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          secondary_startup_64
   arch/x86/hyperv/ivm.c:329:26: note: each undeclared identifier is reported only once for each function it appears in


vim +329 arch/x86/hyperv/ivm.c

a67f6b60d6ed95 Dexuan Cui  2023-08-24  290  
92fe9bb77b0c9f Ingo Molnar 2023-10-13  291  int hv_snp_boot_ap(u32 cpu, unsigned long start_ip)
a67f6b60d6ed95 Dexuan Cui  2023-08-24  292  {
a67f6b60d6ed95 Dexuan Cui  2023-08-24  293  	struct sev_es_save_area *vmsa = (struct sev_es_save_area *)
a67f6b60d6ed95 Dexuan Cui  2023-08-24  294  		__get_free_page(GFP_KERNEL | __GFP_ZERO);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  295  	struct sev_es_save_area *cur_vmsa;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  296  	struct desc_ptr gdtr;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  297  	u64 ret, retry = 5;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  298  	struct hv_enable_vp_vtl *start_vp_input;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  299  	unsigned long flags;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  300  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  301  	if (!vmsa)
a67f6b60d6ed95 Dexuan Cui  2023-08-24  302  		return -ENOMEM;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  303  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  304  	native_store_gdt(&gdtr);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  305  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  306  	vmsa->gdtr.base = gdtr.address;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  307  	vmsa->gdtr.limit = gdtr.size;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  308  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  309  	asm volatile("movl %%es, %%eax;" : "=a" (vmsa->es.selector));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  310  	hv_populate_vmcb_seg(vmsa->es, vmsa->gdtr.base);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  311  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  312  	asm volatile("movl %%cs, %%eax;" : "=a" (vmsa->cs.selector));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  313  	hv_populate_vmcb_seg(vmsa->cs, vmsa->gdtr.base);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  314  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  315  	asm volatile("movl %%ss, %%eax;" : "=a" (vmsa->ss.selector));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  316  	hv_populate_vmcb_seg(vmsa->ss, vmsa->gdtr.base);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  317  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  318  	asm volatile("movl %%ds, %%eax;" : "=a" (vmsa->ds.selector));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  319  	hv_populate_vmcb_seg(vmsa->ds, vmsa->gdtr.base);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  320  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  321  	vmsa->efer = native_read_msr(MSR_EFER);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  322  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  323  	asm volatile("movq %%cr4, %%rax;" : "=a" (vmsa->cr4));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  324  	asm volatile("movq %%cr3, %%rax;" : "=a" (vmsa->cr3));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  325  	asm volatile("movq %%cr0, %%rax;" : "=a" (vmsa->cr0));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  326  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  327  	vmsa->xcr0 = 1;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  328  	vmsa->g_pat = HV_AP_INIT_GPAT_DEFAULT;
a67f6b60d6ed95 Dexuan Cui  2023-08-24 @329  	vmsa->rip = (u64)secondary_startup_64_no_verify;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  330  	vmsa->rsp = (u64)&ap_start_stack[PAGE_SIZE];
a67f6b60d6ed95 Dexuan Cui  2023-08-24  331  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  332  	/*
a67f6b60d6ed95 Dexuan Cui  2023-08-24  333  	 * Set the SNP-specific fields for this VMSA:
a67f6b60d6ed95 Dexuan Cui  2023-08-24  334  	 *   VMPL level
a67f6b60d6ed95 Dexuan Cui  2023-08-24  335  	 *   SEV_FEATURES (matches the SEV STATUS MSR right shifted 2 bits)
a67f6b60d6ed95 Dexuan Cui  2023-08-24  336  	 */
a67f6b60d6ed95 Dexuan Cui  2023-08-24  337  	vmsa->vmpl = 0;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  338  	vmsa->sev_features = sev_status >> 2;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  339  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  340  	ret = snp_set_vmsa(vmsa, true);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  341  	if (!ret) {
a67f6b60d6ed95 Dexuan Cui  2023-08-24  342  		pr_err("RMPADJUST(%llx) failed: %llx\n", (u64)vmsa, ret);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  343  		free_page((u64)vmsa);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  344  		return ret;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  345  	}
a67f6b60d6ed95 Dexuan Cui  2023-08-24  346  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  347  	local_irq_save(flags);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  348  	start_vp_input = (struct hv_enable_vp_vtl *)ap_start_input_arg;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  349  	memset(start_vp_input, 0, sizeof(*start_vp_input));
a67f6b60d6ed95 Dexuan Cui  2023-08-24  350  	start_vp_input->partition_id = -1;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  351  	start_vp_input->vp_index = cpu;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  352  	start_vp_input->target_vtl.target_vtl = ms_hyperv.vtl;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  353  	*(u64 *)&start_vp_input->vp_context = __pa(vmsa) | 1;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  354  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  355  	do {
a67f6b60d6ed95 Dexuan Cui  2023-08-24  356  		ret = hv_do_hypercall(HVCALL_START_VP,
a67f6b60d6ed95 Dexuan Cui  2023-08-24  357  				      start_vp_input, NULL);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  358  	} while (hv_result(ret) == HV_STATUS_TIME_OUT && retry--);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  359  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  360  	local_irq_restore(flags);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  361  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  362  	if (!hv_result_success(ret)) {
a67f6b60d6ed95 Dexuan Cui  2023-08-24  363  		pr_err("HvCallStartVirtualProcessor failed: %llx\n", ret);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  364  		snp_cleanup_vmsa(vmsa);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  365  		vmsa = NULL;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  366  	}
a67f6b60d6ed95 Dexuan Cui  2023-08-24  367  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  368  	cur_vmsa = per_cpu(hv_sev_vmsa, cpu);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  369  	/* Free up any previous VMSA page */
a67f6b60d6ed95 Dexuan Cui  2023-08-24  370  	if (cur_vmsa)
a67f6b60d6ed95 Dexuan Cui  2023-08-24  371  		snp_cleanup_vmsa(cur_vmsa);
a67f6b60d6ed95 Dexuan Cui  2023-08-24  372  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  373  	/* Record the current VMSA page */
a67f6b60d6ed95 Dexuan Cui  2023-08-24  374  	per_cpu(hv_sev_vmsa, cpu) = vmsa;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  375  
a67f6b60d6ed95 Dexuan Cui  2023-08-24  376  	return ret;
a67f6b60d6ed95 Dexuan Cui  2023-08-24  377  }
a67f6b60d6ed95 Dexuan Cui  2023-08-24  378  

:::::: The code at line 329 was first introduced by commit
:::::: a67f6b60d6ed953d5b23a22f26fc916aab630aaa x86/hyperv: Move the code in ivm.c around to avoid unnecessary ifdef's

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
