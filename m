Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2E2D239A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515953; cv=none; b=IBbAQ01FsQQIaTAJlob27V6nleYMygHyvz5S4ExiWWWhkMDnv6geM0K4FzhZfbDrRxO7W9HpDcwKTF4fVDbTKC45c4rNOaB981p1/OWzkPIeTGnlW9VI+53nXdiO6SSpnH7STFiuwcMgM7CnVX35g54VTkdTyL1LnOE85Ri8lzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515953; c=relaxed/simple;
	bh=+1JTD7yooYVr1lcUyGFwa44Rq3vU/pCEkSRyasm6Guo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dDq/ETK3Nw4z1NvuiOfyfB6b6yIyqo2mkSHv0Pq2clejGlSXOmKuPAFO3bQmAiMiKKI6MSz6+PaE+HG+T0DEXwDVHIP1hE4QtUWIDlECXJ3aLZnMLPMRutbG5jyOCMOn9r79CgtnPlp2JgAbWDRTyueyg8prFMU8vyNvxdoYYfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgrFbHrd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgrFbHrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760515952; x=1792051952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+1JTD7yooYVr1lcUyGFwa44Rq3vU/pCEkSRyasm6Guo=;
  b=YgrFbHrdQPx+RtBKl1D6yrXQd8UEfluIl1L7bAWFOBpVDLtOQxe5wwV3
   Vky7FoAG/m9owQO252bOIjRyRAt+wFNShiE0BlFJzzpU8Jdva6KbAXw1K
   yj3RJVrP9EmI0LRPT5e0rTOWeuCxzohwkOjtSXKx44jmXj4EEfG3FPolp
   P568sivZOXs6u+OnZ8sJVEQRDQ9WEuAZKWoDcWDl/lS1i0jrvkBxSFgcZ
   NkYy797t0qJprON5ZC+WjsSV1KrVRO2rJGw3m+EvPE/hUnGPGZX3Tf/lU
   1SmAJ2ivUk+gFY3k7jIdGnLemVRPHUID0GSh7MiUBijhsDFE8VWkngj5h
   g==;
X-CSE-ConnectionGUID: S5QFFXilSeGtRJ2iEyFCxw==
X-CSE-MsgGUID: 3jqumjVKSGOguEswWd7Jzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73787166"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="73787166"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 01:12:31 -0700
X-CSE-ConnectionGUID: ND6YN/vIRT6OWHOpmz0PUg==
X-CSE-MsgGUID: aYxSzH+DRv+ewvwsS+aejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="182051976"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2025 01:12:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8wcV-0003cm-2Q;
	Wed, 15 Oct 2025 08:12:27 +0000
Date: Wed, 15 Oct 2025 16:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fred-kvm-v8-on-next 19/22]
 arch/x86/kvm/vmx/nested.c:2710:24: error: use of undeclared identifier
 'vcpu'
Message-ID: <202510151603.ZO5vzRb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fred-kvm-v8-on-next
head:   02465812a461d4b7c0db97bd8bc571f300ab3d98
commit: a64df5a193f2b439463e3467c40030f923e27724 [19/22] KVM: nVMX: Add FRED VMCS fields to nested VMX context handling
config: x86_64-buildonly-randconfig-004-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151603.ZO5vzRb2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151603.ZO5vzRb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151603.ZO5vzRb2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/nested.c:2710:24: error: use of undeclared identifier 'vcpu'
    2710 |         if (guest_cpu_cap_has(vcpu, X86_FEATURE_FRED) &&
         |                               ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/vcpu +2710 arch/x86/kvm/vmx/nested.c

  2587	
  2588	static void prepare_vmcs02_rare(struct vcpu_vmx *vmx, struct vmcs12 *vmcs12)
  2589	{
  2590		struct hv_enlightened_vmcs *hv_evmcs = nested_vmx_evmcs(vmx);
  2591	
  2592		if (!hv_evmcs || !(hv_evmcs->hv_clean_fields &
  2593				   HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2)) {
  2594	
  2595			vmcs_write16(GUEST_ES_SELECTOR, vmcs12->guest_es_selector);
  2596			vmcs_write16(GUEST_CS_SELECTOR, vmcs12->guest_cs_selector);
  2597			vmcs_write16(GUEST_SS_SELECTOR, vmcs12->guest_ss_selector);
  2598			vmcs_write16(GUEST_DS_SELECTOR, vmcs12->guest_ds_selector);
  2599			vmcs_write16(GUEST_FS_SELECTOR, vmcs12->guest_fs_selector);
  2600			vmcs_write16(GUEST_GS_SELECTOR, vmcs12->guest_gs_selector);
  2601			vmcs_write16(GUEST_LDTR_SELECTOR, vmcs12->guest_ldtr_selector);
  2602			vmcs_write16(GUEST_TR_SELECTOR, vmcs12->guest_tr_selector);
  2603			vmcs_write32(GUEST_ES_LIMIT, vmcs12->guest_es_limit);
  2604			vmcs_write32(GUEST_CS_LIMIT, vmcs12->guest_cs_limit);
  2605			vmcs_write32(GUEST_SS_LIMIT, vmcs12->guest_ss_limit);
  2606			vmcs_write32(GUEST_DS_LIMIT, vmcs12->guest_ds_limit);
  2607			vmcs_write32(GUEST_FS_LIMIT, vmcs12->guest_fs_limit);
  2608			vmcs_write32(GUEST_GS_LIMIT, vmcs12->guest_gs_limit);
  2609			vmcs_write32(GUEST_LDTR_LIMIT, vmcs12->guest_ldtr_limit);
  2610			vmcs_write32(GUEST_TR_LIMIT, vmcs12->guest_tr_limit);
  2611			vmcs_write32(GUEST_GDTR_LIMIT, vmcs12->guest_gdtr_limit);
  2612			vmcs_write32(GUEST_IDTR_LIMIT, vmcs12->guest_idtr_limit);
  2613			vmcs_write32(GUEST_CS_AR_BYTES, vmcs12->guest_cs_ar_bytes);
  2614			vmcs_write32(GUEST_SS_AR_BYTES, vmcs12->guest_ss_ar_bytes);
  2615			vmcs_write32(GUEST_ES_AR_BYTES, vmcs12->guest_es_ar_bytes);
  2616			vmcs_write32(GUEST_DS_AR_BYTES, vmcs12->guest_ds_ar_bytes);
  2617			vmcs_write32(GUEST_FS_AR_BYTES, vmcs12->guest_fs_ar_bytes);
  2618			vmcs_write32(GUEST_GS_AR_BYTES, vmcs12->guest_gs_ar_bytes);
  2619			vmcs_write32(GUEST_LDTR_AR_BYTES, vmcs12->guest_ldtr_ar_bytes);
  2620			vmcs_write32(GUEST_TR_AR_BYTES, vmcs12->guest_tr_ar_bytes);
  2621			vmcs_writel(GUEST_ES_BASE, vmcs12->guest_es_base);
  2622			vmcs_writel(GUEST_CS_BASE, vmcs12->guest_cs_base);
  2623			vmcs_writel(GUEST_SS_BASE, vmcs12->guest_ss_base);
  2624			vmcs_writel(GUEST_DS_BASE, vmcs12->guest_ds_base);
  2625			vmcs_writel(GUEST_FS_BASE, vmcs12->guest_fs_base);
  2626			vmcs_writel(GUEST_GS_BASE, vmcs12->guest_gs_base);
  2627			vmcs_writel(GUEST_LDTR_BASE, vmcs12->guest_ldtr_base);
  2628			vmcs_writel(GUEST_TR_BASE, vmcs12->guest_tr_base);
  2629			vmcs_writel(GUEST_GDTR_BASE, vmcs12->guest_gdtr_base);
  2630			vmcs_writel(GUEST_IDTR_BASE, vmcs12->guest_idtr_base);
  2631	
  2632			vmx_segment_cache_clear(vmx);
  2633		}
  2634	
  2635		if (!hv_evmcs || !(hv_evmcs->hv_clean_fields &
  2636				   HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1)) {
  2637			vmcs_write32(GUEST_SYSENTER_CS, vmcs12->guest_sysenter_cs);
  2638			vmcs_writel(GUEST_PENDING_DBG_EXCEPTIONS,
  2639				    vmcs12->guest_pending_dbg_exceptions);
  2640			vmcs_writel(GUEST_SYSENTER_ESP, vmcs12->guest_sysenter_esp);
  2641			vmcs_writel(GUEST_SYSENTER_EIP, vmcs12->guest_sysenter_eip);
  2642	
  2643			/*
  2644			 * L1 may access the L2's PDPTR, so save them to construct
  2645			 * vmcs12
  2646			 */
  2647			if (enable_ept) {
  2648				vmcs_write64(GUEST_PDPTR0, vmcs12->guest_pdptr0);
  2649				vmcs_write64(GUEST_PDPTR1, vmcs12->guest_pdptr1);
  2650				vmcs_write64(GUEST_PDPTR2, vmcs12->guest_pdptr2);
  2651				vmcs_write64(GUEST_PDPTR3, vmcs12->guest_pdptr3);
  2652			}
  2653	
  2654			if (kvm_mpx_supported() && vmx->nested.nested_run_pending &&
  2655			    (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_BNDCFGS))
  2656				vmcs_write64(GUEST_BNDCFGS, vmcs12->guest_bndcfgs);
  2657		}
  2658	
  2659		if (nested_cpu_has_xsaves(vmcs12))
  2660			vmcs_write64(XSS_EXIT_BITMAP, vmcs12->xss_exit_bitmap);
  2661	
  2662		/*
  2663		 * Whether page-faults are trapped is determined by a combination of
  2664		 * 3 settings: PFEC_MASK, PFEC_MATCH and EXCEPTION_BITMAP.PF.  If L0
  2665		 * doesn't care about page faults then we should set all of these to
  2666		 * L1's desires. However, if L0 does care about (some) page faults, it
  2667		 * is not easy (if at all possible?) to merge L0 and L1's desires, we
  2668		 * simply ask to exit on each and every L2 page fault. This is done by
  2669		 * setting MASK=MATCH=0 and (see below) EB.PF=1.
  2670		 * Note that below we don't need special code to set EB.PF beyond the
  2671		 * "or"ing of the EB of vmcs01 and vmcs12, because when enable_ept,
  2672		 * vmcs01's EB.PF is 0 so the "or" will take vmcs12's value, and when
  2673		 * !enable_ept, EB.PF is 1, so the "or" will always be 1.
  2674		 */
  2675		if (vmx_need_pf_intercept(&vmx->vcpu)) {
  2676			/*
  2677			 * TODO: if both L0 and L1 need the same MASK and MATCH,
  2678			 * go ahead and use it?
  2679			 */
  2680			vmcs_write32(PAGE_FAULT_ERROR_CODE_MASK, 0);
  2681			vmcs_write32(PAGE_FAULT_ERROR_CODE_MATCH, 0);
  2682		} else {
  2683			vmcs_write32(PAGE_FAULT_ERROR_CODE_MASK, vmcs12->page_fault_error_code_mask);
  2684			vmcs_write32(PAGE_FAULT_ERROR_CODE_MATCH, vmcs12->page_fault_error_code_match);
  2685		}
  2686	
  2687		if (cpu_has_vmx_apicv()) {
  2688			vmcs_write64(EOI_EXIT_BITMAP0, vmcs12->eoi_exit_bitmap0);
  2689			vmcs_write64(EOI_EXIT_BITMAP1, vmcs12->eoi_exit_bitmap1);
  2690			vmcs_write64(EOI_EXIT_BITMAP2, vmcs12->eoi_exit_bitmap2);
  2691			vmcs_write64(EOI_EXIT_BITMAP3, vmcs12->eoi_exit_bitmap3);
  2692		}
  2693	
  2694		/*
  2695		 * Make sure the msr_autostore list is up to date before we set the
  2696		 * count in the vmcs02.
  2697		 */
  2698		prepare_vmx_msr_autostore_list(&vmx->vcpu, MSR_IA32_TSC);
  2699	
  2700		vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.guest.nr);
  2701		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
  2702		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
  2703	
  2704		if (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_CET_STATE)
  2705			vmcs_write_cet_state(&vmx->vcpu, vmcs12->guest_s_cet,
  2706					     vmcs12->guest_ssp, vmcs12->guest_ssp_tbl);
  2707	
  2708		set_cr4_guest_host_mask(vmx);
  2709	
> 2710		if (guest_cpu_cap_has(vcpu, X86_FEATURE_FRED) &&
  2711		    nested_cpu_load_guest_fred_state(vmcs12)) {
  2712			vmcs_write64(GUEST_IA32_FRED_CONFIG, vmcs12->guest_ia32_fred_config);
  2713			vmcs_write64(GUEST_IA32_FRED_RSP1, vmcs12->guest_ia32_fred_rsp1);
  2714			vmcs_write64(GUEST_IA32_FRED_RSP2, vmcs12->guest_ia32_fred_rsp2);
  2715			vmcs_write64(GUEST_IA32_FRED_RSP3, vmcs12->guest_ia32_fred_rsp3);
  2716			vmcs_write64(GUEST_IA32_FRED_STKLVLS, vmcs12->guest_ia32_fred_stklvls);
  2717			vmcs_write64(GUEST_IA32_FRED_SSP1, vmcs12->guest_ia32_fred_ssp1);
  2718			vmcs_write64(GUEST_IA32_FRED_SSP2, vmcs12->guest_ia32_fred_ssp2);
  2719			vmcs_write64(GUEST_IA32_FRED_SSP3, vmcs12->guest_ia32_fred_ssp3);
  2720		}
  2721	}
  2722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
