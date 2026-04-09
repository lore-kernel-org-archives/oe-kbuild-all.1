Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC52D3739
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 04:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775710442; cv=none; b=KV2G/AtQ1PEeL7rt892vBn6v+yOdhbIoPBnnHCRTkjYKB9+p8ylpP0ft15np+QqiAxQrKCgyIyp4b0AqywS+CldEIVMexP7Xo2dGPJCNYJJqocCinBSfks6D2qu21f7gWuk+ERAoUcfpnpBNcezrPSF3RfjMiC86QKgTvtWT5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775710442; c=relaxed/simple;
	bh=PazP3sGc8/A1dQrsqokBHa8MsdkICZ/uULMyjGuBJGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FLJfdA/JaYIqPyffJNulHidken9FNhKlqEafVQWMXLbeNdIwN5ulXG4++JBlwmrP4+1WRtMRpg1xD8dEbVuV3d24O9PR8jkHxZbJoTryY9lkgcUZ5t2UB6fM5hM3dMJzguM82ksJpSA0hmdbMeNmlbeTYRz+wbidLAccWSm+gig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GB36QlaM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GB36QlaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775710437; x=1807246437;
  h=date:from:to:cc:subject:message-id;
  bh=PazP3sGc8/A1dQrsqokBHa8MsdkICZ/uULMyjGuBJGU=;
  b=GB36QlaMHvgu7KTBtPim+k49CE33tSzXk6scu89tWrgpwJY8BHLBLOnA
   Z52Y0CIkk0SreyTJtKgYQ7fo/BgmlNlNrPRKj5Bp5ezvD2WVQFCrUzEnK
   Sr0eQ+y8MaQS94z6Nv2zWa9+8J/A/2/rJaWDIKg2NCWt7Jc4s1HfP8YWI
   LwOfz5mBBUR2uNjsOLnhQQ8GetAA6daIBZzZV+vBI5JlAoO+zaC/UgANz
   1gwac4pO+0FeqBGTswT1oLng4GhKXkJzj9cxdbH7z8OqMh8cd4bcEOhZ6
   4fMFwgZT4s12KaC2gcnunlEr6tFQNh/r2NImxAXrTH3J/CT6LytZExvti
   g==;
X-CSE-ConnectionGUID: YzUA2ABhSoy0PTB8RLr5dg==
X-CSE-MsgGUID: TgLY2Kn5QDKeAcIx+mLXvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76594245"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="76594245"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:53:56 -0700
X-CSE-ConnectionGUID: RfWr0jatQEuTu1leuP41cA==
X-CSE-MsgGUID: 7wpiLzECSiSe4/ChgKXzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="228593633"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Apr 2026 21:53:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAhOp-00000000AbZ-3v3g;
	Thu, 09 Apr 2026 04:53:51 +0000
Date: Thu, 09 Apr 2026 06:53:44 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/sev_es_killed_by_firmware 14/18]
 arch/x86/kvm/svm/sev.c:3264:13: error: invalid storage class for function
 'sev_flush_encrypted_page'
Message-ID: <202604090652.ToNY2GOk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux svm/sev_es_killed_by_firmware
head:   6b5a842e2d3cb6a1eea0974e9be2e54c579f998e
commit: 3af9ce43cbb61c7ea211ebfe67ebefe40897fbab [14/18] KVM: SEV: Set support SEV+ VM types during sev_hardware_setup()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260409/202604090652.ToNY2GOk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090652.ToNY2GOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090652.ToNY2GOk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/svm/sev.c: In function 'sev_hardware_setup':
>> arch/x86/kvm/svm/sev.c:3264:13: error: invalid storage class for function 'sev_flush_encrypted_page'
    3264 | static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3350:13: error: invalid storage class for function 'dump_ghcb'
    3350 | static void dump_ghcb(struct vcpu_svm *svm)
         |             ^~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3381:13: error: invalid storage class for function 'sev_es_sync_to_ghcb'
    3381 | static void sev_es_sync_to_ghcb(struct vcpu_svm *svm)
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3400:13: error: invalid storage class for function 'sev_es_sync_from_ghcb'
    3400 | static void sev_es_sync_from_ghcb(struct vcpu_svm *svm)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3447:12: error: invalid storage class for function 'sev_es_validate_vmgexit'
    3447 | static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3668:12: error: invalid storage class for function 'setup_vmgexit_scratch'
    3668 | static int setup_vmgexit_scratch(struct vcpu_svm *svm, bool sync, u64 len)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3751:13: error: invalid storage class for function 'set_ghcb_msr_bits'
    3751 | static void set_ghcb_msr_bits(struct vcpu_svm *svm, u64 value, u64 mask,
         |             ^~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3758:12: error: invalid storage class for function 'get_ghcb_msr_bits'
    3758 | static u64 get_ghcb_msr_bits(struct vcpu_svm *svm, u64 mask, unsigned int pos)
         |            ^~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3763:13: error: invalid storage class for function 'set_ghcb_msr'
    3763 | static void set_ghcb_msr(struct vcpu_svm *svm, u64 value)
         |             ^~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3768:12: error: invalid storage class for function 'snp_rmptable_psmash'
    3768 | static int snp_rmptable_psmash(kvm_pfn_t pfn)
         |            ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3785:12: error: invalid storage class for function 'snp_complete_psc_msr'
    3785 | static int snp_complete_psc_msr(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3797:12: error: invalid storage class for function 'snp_begin_psc_msr'
    3797 | static int snp_begin_psc_msr(struct vcpu_svm *svm, u64 ghcb_msr)
         |            ^~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3839:12: error: invalid storage class for function 'snp_begin_psc'
    3839 | static int snp_begin_psc(struct vcpu_svm *svm, struct psc_buffer *psc);
         |            ^~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3841:13: error: invalid storage class for function 'snp_complete_psc'
    3841 | static void snp_complete_psc(struct vcpu_svm *svm, u64 psc_ret)
         |             ^~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3856:13: error: invalid storage class for function '__snp_complete_one_psc'
    3856 | static void __snp_complete_one_psc(struct vcpu_svm *svm)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:3878:12: error: invalid storage class for function 'snp_complete_one_psc'
    3878 | static int snp_complete_one_psc(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c: In function 'snp_complete_one_psc':
>> arch/x86/kvm/svm/sev.c:3891:16: error: implicit declaration of function 'snp_begin_psc'; did you mean 'snp_begin_psc_msr'? [-Wimplicit-function-declaration]
    3891 |         return snp_begin_psc(svm, psc);
         |                ^~~~~~~~~~~~~
         |                snp_begin_psc_msr
   arch/x86/kvm/svm/sev.c: In function 'sev_hardware_setup':
   arch/x86/kvm/svm/sev.c:3894:12: error: invalid storage class for function 'snp_begin_psc'
    3894 | static int snp_begin_psc(struct vcpu_svm *svm, struct psc_buffer *psc)
         |            ^~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:4028:13: error: invalid storage class for function 'sev_snp_init_protected_guest_state'
    4028 | static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:4098:12: error: invalid storage class for function 'sev_snp_ap_creation'
    4098 | static int sev_snp_ap_creation(struct vcpu_svm *svm)
         |            ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/sev.c:4174:12: error: invalid storage class for function 'snp_handle_guest_req'
    4174 | static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_gpa)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4213:12: error: invalid storage class for function 'snp_req_certs_err'
    4213 | static int snp_req_certs_err(struct vcpu_svm *svm, u32 vmm_error)
         |            ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4220:12: error: invalid storage class for function 'snp_complete_req_certs'
    4220 | static int snp_complete_req_certs(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4243:12: error: invalid storage class for function 'snp_handle_ext_guest_req'
    4243 | static int snp_handle_ext_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_gpa)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4305:12: error: invalid storage class for function 'sev_handle_vmgexit_msr_protocol'
    4305 | static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4649:13: error: invalid storage class for function 'sev_es_init_vmcb'
    4649 | static void sev_es_init_vmcb(struct vcpu_svm *svm, bool init_event)
         |             ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4987:13: error: invalid storage class for function 'is_pfn_range_shared'
    4987 | static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:5014:11: error: invalid storage class for function 'max_level_for_order'
    5014 | static u8 max_level_for_order(int order)
         |           ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:5022:13: error: invalid storage class for function 'is_large_rmp_possible'
    5022 | static bool is_large_rmp_possible(struct kvm *kvm, kvm_pfn_t pfn, int order)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:5255:1: error: expected declaration or statement at end of input
    5255 | }
         | ^
   arch/x86/kvm/svm/sev.c:5255:1: error: expected declaration or statement at end of input
   arch/x86/kvm/svm/sev.c: At top level:
   arch/x86/kvm/svm/sev.c:5248:6: warning: 'sev_free_decrypted_vmsa' defined but not used [-Wunused-function]
    5248 | void sev_free_decrypted_vmsa(struct kvm_vcpu *vcpu, struct vmcb_save_area *vmsa)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:5163:24: warning: 'sev_decrypt_vmsa' defined but not used [-Wunused-function]
    5163 | struct vmcb_save_area *sev_decrypt_vmsa(struct kvm_vcpu *vcpu)
         |                        ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:5148:5: warning: 'sev_gmem_max_mapping_level' defined but not used [-Wunused-function]
    5148 | int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:5085:6: warning: 'sev_gmem_invalidate' defined but not used [-Wunused-function]
    5085 | void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:5038:5: warning: 'sev_gmem_prepare' defined but not used [-Wunused-function]
    5038 | int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order)
         |     ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4894:6: warning: 'sev_handle_rmp_fault' defined but not used [-Wunused-function]
    4894 | void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4862:14: warning: 'snp_safe_alloc_page_node' defined but not used [-Wunused-function]
    4862 | struct page *snp_safe_alloc_page_node(int node, gfp_t gfp)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4825:6: warning: 'sev_vcpu_deliver_sipi_vector' defined but not used [-Wunused-function]
    4825 | void sev_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4766:6: warning: 'sev_es_prepare_switch_to_guest' defined but not used [-Wunused-function]
    4766 | void sev_es_prepare_switch_to_guest(struct vcpu_svm *svm, struct sev_es_save_area *hostsa)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4741:5: warning: 'sev_vcpu_create' defined but not used [-Wunused-function]
    4741 | int sev_vcpu_create(struct kvm_vcpu *vcpu)
         |     ^~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4721:6: warning: 'sev_init_vmcb' defined but not used [-Wunused-function]
    4721 | void sev_init_vmcb(struct vcpu_svm *svm, bool init_event)
         |      ^~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4638:6: warning: 'sev_vcpu_after_set_cpuid' defined but not used [-Wunused-function]
    4638 | void sev_vcpu_after_set_cpuid(struct vcpu_svm *svm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4606:6: warning: 'sev_es_recalc_msr_intercepts' defined but not used [-Wunused-function]
    4606 | void sev_es_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4585:5: warning: 'sev_es_string_io' defined but not used [-Wunused-function]
    4585 | int sev_es_string_io(struct vcpu_svm *svm, int size, unsigned int port, int in)
         |     ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4449:5: warning: 'sev_handle_vmgexit' defined but not used [-Wunused-function]
    4449 | int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
         |     ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3624:5: warning: 'pre_sev_run' defined but not used [-Wunused-function]
    3624 | int pre_sev_run(struct vcpu_svm *svm, int cpu)
         |     ^~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3589:6: warning: 'sev_es_unmap_ghcb' defined but not used [-Wunused-function]
    3589 | void sev_es_unmap_ghcb(struct vcpu_svm *svm)
         |      ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3319:6: warning: 'sev_free_vcpu' defined but not used [-Wunused-function]
    3319 | void sev_free_vcpu(struct kvm_vcpu *vcpu)
         |      ^~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3300:6: warning: 'sev_guest_memory_reclaimed' defined but not used [-Wunused-function]
    3300 | void sev_guest_memory_reclaimed(struct kvm *kvm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3248:5: warning: 'sev_cpu_init' defined but not used [-Wunused-function]
    3248 | int sev_cpu_init(struct svm_cpu_data *sd)
         |     ^~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3231:6: warning: 'sev_hardware_unsetup' defined but not used [-Wunused-function]
    3231 | void sev_hardware_unsetup(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/sev_flush_encrypted_page +3264 arch/x86/kvm/svm/sev.c

eaf78265a4ab33 Joerg Roedel        2020-03-24  3230  
23e5092b6e2ad1 Sean Christopherson 2022-01-28 @3231  void sev_hardware_unsetup(void)
eaf78265a4ab33 Joerg Roedel        2020-03-24  3232  {
a5c1c5aad6cff0 Sean Christopherson 2021-04-21  3233  	if (!sev_enabled)
9ef1530c0c1bb1 Paolo Bonzini       2020-04-13  3234  		return;
9ef1530c0c1bb1 Paolo Bonzini       2020-04-13  3235  
469bb32b68d5a4 Sean Christopherson 2021-04-21  3236  	/* No need to take sev_bitmap_lock, all VMs have been destroyed. */
bb2baeb214a71c Mingwei Zhang       2021-08-02  3237  	sev_flush_asids(1, max_sev_asid);
469bb32b68d5a4 Sean Christopherson 2021-04-21  3238  
eaf78265a4ab33 Joerg Roedel        2020-03-24  3239  	bitmap_free(sev_asid_bitmap);
eaf78265a4ab33 Joerg Roedel        2020-03-24  3240  	bitmap_free(sev_reclaim_asid_bitmap);
469bb32b68d5a4 Sean Christopherson 2021-04-21  3241  
7aef27f0b2a8a5 Vipin Sharma        2021-03-29  3242  	misc_cg_set_capacity(MISC_CG_RES_SEV, 0);
7aef27f0b2a8a5 Vipin Sharma        2021-03-29  3243  	misc_cg_set_capacity(MISC_CG_RES_SEV_ES, 0);
6f1d5a3513c237 Ashish Kalra        2025-03-24  3244  
6f1d5a3513c237 Ashish Kalra        2025-03-24  3245  	sev_platform_shutdown();
eaf78265a4ab33 Joerg Roedel        2020-03-24  3246  }
eaf78265a4ab33 Joerg Roedel        2020-03-24  3247  
b95c221cac1675 Sean Christopherson 2021-04-21 @3248  int sev_cpu_init(struct svm_cpu_data *sd)
b95c221cac1675 Sean Christopherson 2021-04-21  3249  {
a5c1c5aad6cff0 Sean Christopherson 2021-04-21  3250  	if (!sev_enabled)
b95c221cac1675 Sean Christopherson 2021-04-21  3251  		return 0;
b95c221cac1675 Sean Christopherson 2021-04-21  3252  
bb2baeb214a71c Mingwei Zhang       2021-08-02  3253  	sd->sev_vmcbs = kcalloc(nr_asids, sizeof(void *), GFP_KERNEL);
b95c221cac1675 Sean Christopherson 2021-04-21  3254  	if (!sd->sev_vmcbs)
b95c221cac1675 Sean Christopherson 2021-04-21  3255  		return -ENOMEM;
b95c221cac1675 Sean Christopherson 2021-04-21  3256  
b95c221cac1675 Sean Christopherson 2021-04-21  3257  	return 0;
eaf78265a4ab33 Joerg Roedel        2020-03-24  3258  }
eaf78265a4ab33 Joerg Roedel        2020-03-24  3259  
add5e2f0454145 Tom Lendacky        2020-12-10  3260  /*
add5e2f0454145 Tom Lendacky        2020-12-10  3261   * Pages used by hardware to hold guest encrypted state must be flushed before
add5e2f0454145 Tom Lendacky        2020-12-10  3262   * returning them to the system.
add5e2f0454145 Tom Lendacky        2020-12-10  3263   */
4bbef7e8eb8c2c Sean Christopherson 2022-04-21 @3264  static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
add5e2f0454145 Tom Lendacky        2020-12-10  3265  {
466eec4a22a76c Sean Christopherson 2024-01-31  3266  	unsigned int asid = sev_get_asid(vcpu->kvm);
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3267  
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3268  	/*
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3269  	 * Note!  The address must be a kernel address, as regular page walk
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3270  	 * checks are performed by VM_PAGE_FLUSH, i.e. operating on a user
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3271  	 * address is non-deterministic and unsafe.  This function deliberately
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3272  	 * takes a pointer to deter passing in a user address.
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3273  	 */
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3274  	unsigned long addr = (unsigned long)va;
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3275  
add5e2f0454145 Tom Lendacky        2020-12-10  3276  	/*
d45829b351ee6e Mingwei Zhang       2022-04-21  3277  	 * If CPU enforced cache coherency for encrypted mappings of the
d45829b351ee6e Mingwei Zhang       2022-04-21  3278  	 * same physical page is supported, use CLFLUSHOPT instead. NOTE: cache
d45829b351ee6e Mingwei Zhang       2022-04-21  3279  	 * flush is still needed in order to work properly with DMA devices.
add5e2f0454145 Tom Lendacky        2020-12-10  3280  	 */
d45829b351ee6e Mingwei Zhang       2022-04-21  3281  	if (boot_cpu_has(X86_FEATURE_SME_COHERENT)) {
d45829b351ee6e Mingwei Zhang       2022-04-21  3282  		clflush_cache_range(va, PAGE_SIZE);
add5e2f0454145 Tom Lendacky        2020-12-10  3283  		return;
d45829b351ee6e Mingwei Zhang       2022-04-21  3284  	}
add5e2f0454145 Tom Lendacky        2020-12-10  3285  
add5e2f0454145 Tom Lendacky        2020-12-10  3286  	/*
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3287  	 * VM Page Flush takes a host virtual address and a guest ASID.  Fall
a77896eea33db6 Kevin Loughlin      2025-05-22  3288  	 * back to full writeback of caches if this faults so as not to make
a77896eea33db6 Kevin Loughlin      2025-05-22  3289  	 * any problems worse by leaving stale encrypted data in the cache.
add5e2f0454145 Tom Lendacky        2020-12-10  3290  	 */
6fa17efe45440f Ingo Molnar         2025-04-09  3291  	if (WARN_ON_ONCE(wrmsrq_safe(MSR_AMD64_VM_PAGE_FLUSH, addr | asid)))
a77896eea33db6 Kevin Loughlin      2025-05-22  3292  		goto do_sev_writeback_caches;
add5e2f0454145 Tom Lendacky        2020-12-10  3293  
add5e2f0454145 Tom Lendacky        2020-12-10  3294  	return;
add5e2f0454145 Tom Lendacky        2020-12-10  3295  
a77896eea33db6 Kevin Loughlin      2025-05-22  3296  do_sev_writeback_caches:
6f38f8c574642a Zheyun Shen         2025-05-22  3297  	sev_writeback_caches(vcpu->kvm);
add5e2f0454145 Tom Lendacky        2020-12-10  3298  }
add5e2f0454145 Tom Lendacky        2020-12-10  3299  
683412ccf61294 Mingwei Zhang       2022-04-21 @3300  void sev_guest_memory_reclaimed(struct kvm *kvm)
683412ccf61294 Mingwei Zhang       2022-04-21  3301  {
ea262f8a7c360e Ashish Kalra        2024-05-01  3302  	/*
ea262f8a7c360e Ashish Kalra        2024-05-01  3303  	 * With SNP+gmem, private/encrypted memory is unreachable via the
a77896eea33db6 Kevin Loughlin      2025-05-22  3304  	 * hva-based mmu notifiers, i.e. these events are explicitly scoped to
a77896eea33db6 Kevin Loughlin      2025-05-22  3305  	 * shared pages, where there's no need to flush caches.
0689ee7ace6b74 Sean Christopherson 2026-03-10  3306  	 *
0689ee7ace6b74 Sean Christopherson 2026-03-10  3307  	 * Checking for SEV+ outside of kvm->lock is safe as __sev_guest_init()
0689ee7ace6b74 Sean Christopherson 2026-03-10  3308  	 * can only be done before vCPUs are created, caches can be incoherent
0689ee7ace6b74 Sean Christopherson 2026-03-10  3309  	 * if and only if a vCPU was run, and either this task will see the VM
0689ee7ace6b74 Sean Christopherson 2026-03-10  3310  	 * as being SEV+ or the vCPU won't be to access the memory (because of
0689ee7ace6b74 Sean Christopherson 2026-03-10  3311  	 * the in-progress invalidation).
ea262f8a7c360e Ashish Kalra        2024-05-01  3312  	 */
0689ee7ace6b74 Sean Christopherson 2026-03-10  3313  	if (!____sev_guest(kvm) || ____sev_snp_guest(kvm))
683412ccf61294 Mingwei Zhang       2022-04-21  3314  		return;
683412ccf61294 Mingwei Zhang       2022-04-21  3315  
6f38f8c574642a Zheyun Shen         2025-05-22  3316  	sev_writeback_caches(kvm);
683412ccf61294 Mingwei Zhang       2022-04-21  3317  }
683412ccf61294 Mingwei Zhang       2022-04-21  3318  
add5e2f0454145 Tom Lendacky        2020-12-10 @3319  void sev_free_vcpu(struct kvm_vcpu *vcpu)
add5e2f0454145 Tom Lendacky        2020-12-10  3320  {
add5e2f0454145 Tom Lendacky        2020-12-10  3321  	struct vcpu_svm *svm;
add5e2f0454145 Tom Lendacky        2020-12-10  3322  
6d0d4cc7befcab Sean Christopherson 2026-03-10  3323  	if (!is_sev_es_guest(vcpu))
add5e2f0454145 Tom Lendacky        2020-12-10  3324  		return;
add5e2f0454145 Tom Lendacky        2020-12-10  3325  
add5e2f0454145 Tom Lendacky        2020-12-10  3326  	svm = to_svm(vcpu);
add5e2f0454145 Tom Lendacky        2020-12-10  3327  
ad27ce155566f2 Brijesh Singh       2024-05-01  3328  	/*
ad27ce155566f2 Brijesh Singh       2024-05-01  3329  	 * If it's an SNP guest, then the VMSA was marked in the RMP table as
ad27ce155566f2 Brijesh Singh       2024-05-01  3330  	 * a guest-owned page. Transition the page to hypervisor state before
ad27ce155566f2 Brijesh Singh       2024-05-01  3331  	 * releasing it back to the system.
ad27ce155566f2 Brijesh Singh       2024-05-01  3332  	 */
6d0d4cc7befcab Sean Christopherson 2026-03-10  3333  	if (is_sev_snp_guest(vcpu)) {
ad27ce155566f2 Brijesh Singh       2024-05-01  3334  		u64 pfn = __pa(svm->sev_es.vmsa) >> PAGE_SHIFT;
ad27ce155566f2 Brijesh Singh       2024-05-01  3335  
febff040b1a678 Michael Roth        2024-05-28  3336  		if (kvm_rmp_make_shared(vcpu->kvm, pfn, PG_LEVEL_4K))
ad27ce155566f2 Brijesh Singh       2024-05-01  3337  			goto skip_vmsa_free;
ad27ce155566f2 Brijesh Singh       2024-05-01  3338  	}
ad27ce155566f2 Brijesh Singh       2024-05-01  3339  
add5e2f0454145 Tom Lendacky        2020-12-10  3340  	if (vcpu->arch.guest_state_protected)
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3341  		sev_flush_encrypted_page(vcpu, svm->sev_es.vmsa);
4bbef7e8eb8c2c Sean Christopherson 2022-04-21  3342  
b67a4cc35c9f72 Peter Gonda         2021-10-21  3343  	__free_page(virt_to_page(svm->sev_es.vmsa));
8f423a80d299a5 Tom Lendacky        2020-12-10  3344  
ad27ce155566f2 Brijesh Singh       2024-05-01  3345  skip_vmsa_free:
b67a4cc35c9f72 Peter Gonda         2021-10-21  3346  	if (svm->sev_es.ghcb_sa_free)
a655276a594978 Sean Christopherson 2021-11-09  3347  		kvfree(svm->sev_es.ghcb_sa);
add5e2f0454145 Tom Lendacky        2020-12-10  3348  }
add5e2f0454145 Tom Lendacky        2020-12-10  3349  
291bd20d5d8881 Tom Lendacky        2020-12-10 @3350  static void dump_ghcb(struct vcpu_svm *svm)
291bd20d5d8881 Tom Lendacky        2020-12-10  3351  {
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3352  	struct vmcb_control_area *control = &svm->vmcb->control;
291bd20d5d8881 Tom Lendacky        2020-12-10  3353  	unsigned int nbits;
291bd20d5d8881 Tom Lendacky        2020-12-10  3354  
291bd20d5d8881 Tom Lendacky        2020-12-10  3355  	/* Re-use the dump_invalid_vmcb module parameter */
291bd20d5d8881 Tom Lendacky        2020-12-10  3356  	if (!dump_invalid_vmcb) {
291bd20d5d8881 Tom Lendacky        2020-12-10  3357  		pr_warn_ratelimited("set kvm_amd.dump_invalid_vmcb=1 to dump internal KVM state.\n");
291bd20d5d8881 Tom Lendacky        2020-12-10  3358  		return;
291bd20d5d8881 Tom Lendacky        2020-12-10  3359  	}
291bd20d5d8881 Tom Lendacky        2020-12-10  3360  
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3361  	nbits = sizeof(svm->sev_es.valid_bitmap) * 8;
291bd20d5d8881 Tom Lendacky        2020-12-10  3362  
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3363  	/*
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3364  	 * Print KVM's snapshot of the GHCB values that were (unsuccessfully)
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3365  	 * used to handle the exit.  If the guest has since modified the GHCB
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3366  	 * itself, dumping the raw GHCB won't help debug why KVM was unable to
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3367  	 * handle the VMGEXIT that KVM observed.
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3368  	 */
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3369  	pr_err("GHCB (GPA=%016llx) snapshot:\n", svm->vmcb->control.ghcb_gpa);
291bd20d5d8881 Tom Lendacky        2020-12-10  3370  	pr_err("%-20s%016llx is_valid: %u\n", "sw_exit_code",
d7507a94a07202 Sean Christopherson 2025-12-30  3371  	       control->exit_code, kvm_ghcb_sw_exit_code_is_valid(svm));
291bd20d5d8881 Tom Lendacky        2020-12-10  3372  	pr_err("%-20s%016llx is_valid: %u\n", "sw_exit_info_1",
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3373  	       control->exit_info_1, kvm_ghcb_sw_exit_info_1_is_valid(svm));
291bd20d5d8881 Tom Lendacky        2020-12-10  3374  	pr_err("%-20s%016llx is_valid: %u\n", "sw_exit_info_2",
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3375  	       control->exit_info_2, kvm_ghcb_sw_exit_info_2_is_valid(svm));
291bd20d5d8881 Tom Lendacky        2020-12-10  3376  	pr_err("%-20s%016llx is_valid: %u\n", "sw_scratch",
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3377  	       svm->sev_es.sw_scratch, kvm_ghcb_sw_scratch_is_valid(svm));
5fea0c6c0ebe0a Tom Lendacky        2025-04-28  3378  	pr_err("%-20s%*pb\n", "valid_bitmap", nbits, svm->sev_es.valid_bitmap);
291bd20d5d8881 Tom Lendacky        2020-12-10  3379  }
291bd20d5d8881 Tom Lendacky        2020-12-10  3380  
291bd20d5d8881 Tom Lendacky        2020-12-10 @3381  static void sev_es_sync_to_ghcb(struct vcpu_svm *svm)
291bd20d5d8881 Tom Lendacky        2020-12-10  3382  {
291bd20d5d8881 Tom Lendacky        2020-12-10  3383  	struct kvm_vcpu *vcpu = &svm->vcpu;
b67a4cc35c9f72 Peter Gonda         2021-10-21  3384  	struct ghcb *ghcb = svm->sev_es.ghcb;
291bd20d5d8881 Tom Lendacky        2020-12-10  3385  
291bd20d5d8881 Tom Lendacky        2020-12-10  3386  	/*
291bd20d5d8881 Tom Lendacky        2020-12-10  3387  	 * The GHCB protocol so far allows for the following data
291bd20d5d8881 Tom Lendacky        2020-12-10  3388  	 * to be returned:
291bd20d5d8881 Tom Lendacky        2020-12-10  3389  	 *   GPRs RAX, RBX, RCX, RDX
291bd20d5d8881 Tom Lendacky        2020-12-10  3390  	 *
250091409a4ac5 Sean Christopherson 2021-01-22  3391  	 * Copy their values, even if they may not have been written during the
250091409a4ac5 Sean Christopherson 2021-01-22  3392  	 * VM-Exit.  It's the guest's responsibility to not consume random data.
291bd20d5d8881 Tom Lendacky        2020-12-10  3393  	 */
291bd20d5d8881 Tom Lendacky        2020-12-10  3394  	ghcb_set_rax(ghcb, vcpu->arch.regs[VCPU_REGS_RAX]);
291bd20d5d8881 Tom Lendacky        2020-12-10  3395  	ghcb_set_rbx(ghcb, vcpu->arch.regs[VCPU_REGS_RBX]);
291bd20d5d8881 Tom Lendacky        2020-12-10  3396  	ghcb_set_rcx(ghcb, vcpu->arch.regs[VCPU_REGS_RCX]);
291bd20d5d8881 Tom Lendacky        2020-12-10  3397  	ghcb_set_rdx(ghcb, vcpu->arch.regs[VCPU_REGS_RDX]);
291bd20d5d8881 Tom Lendacky        2020-12-10  3398  }
291bd20d5d8881 Tom Lendacky        2020-12-10  3399  
291bd20d5d8881 Tom Lendacky        2020-12-10 @3400  static void sev_es_sync_from_ghcb(struct vcpu_svm *svm)
291bd20d5d8881 Tom Lendacky        2020-12-10  3401  {
291bd20d5d8881 Tom Lendacky        2020-12-10  3402  	struct vmcb_control_area *control = &svm->vmcb->control;
291bd20d5d8881 Tom Lendacky        2020-12-10  3403  	struct kvm_vcpu *vcpu = &svm->vcpu;
b67a4cc35c9f72 Peter Gonda         2021-10-21  3404  	struct ghcb *ghcb = svm->sev_es.ghcb;
291bd20d5d8881 Tom Lendacky        2020-12-10  3405  
291bd20d5d8881 Tom Lendacky        2020-12-10  3406  	/*
291bd20d5d8881 Tom Lendacky        2020-12-10  3407  	 * The GHCB protocol so far allows for the following data
291bd20d5d8881 Tom Lendacky        2020-12-10  3408  	 * to be supplied:
291bd20d5d8881 Tom Lendacky        2020-12-10  3409  	 *   GPRs RAX, RBX, RCX, RDX
291bd20d5d8881 Tom Lendacky        2020-12-10  3410  	 *   XCR0
291bd20d5d8881 Tom Lendacky        2020-12-10  3411  	 *   CPL
291bd20d5d8881 Tom Lendacky        2020-12-10  3412  	 *
291bd20d5d8881 Tom Lendacky        2020-12-10  3413  	 * VMMCALL allows the guest to provide extra registers. KVM also
291bd20d5d8881 Tom Lendacky        2020-12-10  3414  	 * expects RSI for hypercalls, so include that, too.
291bd20d5d8881 Tom Lendacky        2020-12-10  3415  	 *
291bd20d5d8881 Tom Lendacky        2020-12-10  3416  	 * Copy their values to the appropriate location if supplied.
291bd20d5d8881 Tom Lendacky        2020-12-10  3417  	 */
291bd20d5d8881 Tom Lendacky        2020-12-10  3418  	memset(vcpu->arch.regs, 0, sizeof(vcpu->arch.regs));
291bd20d5d8881 Tom Lendacky        2020-12-10  3419  
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3420  	BUILD_BUG_ON(sizeof(svm->sev_es.valid_bitmap) != sizeof(ghcb->save.valid_bitmap));
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3421  	memcpy(&svm->sev_es.valid_bitmap, &ghcb->save.valid_bitmap, sizeof(ghcb->save.valid_bitmap));
291bd20d5d8881 Tom Lendacky        2020-12-10  3422  
bd5f500d23170e Sean Christopherson 2025-09-19  3423  	vcpu->arch.regs[VCPU_REGS_RAX] = kvm_ghcb_get_rax_if_valid(svm);
bd5f500d23170e Sean Christopherson 2025-09-19  3424  	vcpu->arch.regs[VCPU_REGS_RBX] = kvm_ghcb_get_rbx_if_valid(svm);
bd5f500d23170e Sean Christopherson 2025-09-19  3425  	vcpu->arch.regs[VCPU_REGS_RCX] = kvm_ghcb_get_rcx_if_valid(svm);
bd5f500d23170e Sean Christopherson 2025-09-19  3426  	vcpu->arch.regs[VCPU_REGS_RDX] = kvm_ghcb_get_rdx_if_valid(svm);
bd5f500d23170e Sean Christopherson 2025-09-19  3427  	vcpu->arch.regs[VCPU_REGS_RSI] = kvm_ghcb_get_rsi_if_valid(svm);
291bd20d5d8881 Tom Lendacky        2020-12-10  3428  
bd5f500d23170e Sean Christopherson 2025-09-19  3429  	svm->vmcb->save.cpl = kvm_ghcb_get_cpl_if_valid(svm);
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3430  
4135a9a8ccba2b Sean Christopherson 2025-09-19  3431  	if (kvm_ghcb_xcr0_is_valid(svm))
4135a9a8ccba2b Sean Christopherson 2025-09-19  3432  		__kvm_set_xcr(vcpu, 0, kvm_ghcb_get_xcr0(svm));
291bd20d5d8881 Tom Lendacky        2020-12-10  3433  
b5fa221f7b08ca Sean Christopherson 2025-09-19  3434  	if (kvm_ghcb_xss_is_valid(svm))
b5fa221f7b08ca Sean Christopherson 2025-09-19  3435  		__kvm_emulate_msr_write(vcpu, MSR_IA32_XSS, kvm_ghcb_get_xss(svm));
b5fa221f7b08ca Sean Christopherson 2025-09-19  3436  
291bd20d5d8881 Tom Lendacky        2020-12-10  3437  	/* Copy the GHCB exit information into the VMCB fields */
d7507a94a07202 Sean Christopherson 2025-12-30  3438  	control->exit_code = kvm_ghcb_get_sw_exit_code(svm);
bd5f500d23170e Sean Christopherson 2025-09-19  3439  	control->exit_info_1 = kvm_ghcb_get_sw_exit_info_1(svm);
bd5f500d23170e Sean Christopherson 2025-09-19  3440  	control->exit_info_2 = kvm_ghcb_get_sw_exit_info_2(svm);
bd5f500d23170e Sean Christopherson 2025-09-19  3441  	svm->sev_es.sw_scratch = kvm_ghcb_get_sw_scratch_if_valid(svm);
291bd20d5d8881 Tom Lendacky        2020-12-10  3442  
291bd20d5d8881 Tom Lendacky        2020-12-10  3443  	/* Clear the valid entries fields */
291bd20d5d8881 Tom Lendacky        2020-12-10  3444  	memset(ghcb->save.valid_bitmap, 0, sizeof(ghcb->save.valid_bitmap));
291bd20d5d8881 Tom Lendacky        2020-12-10  3445  }
291bd20d5d8881 Tom Lendacky        2020-12-10  3446  
aa9f58415a8e45 Sean Christopherson 2022-02-25 @3447  static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
291bd20d5d8881 Tom Lendacky        2020-12-10  3448  {
7588dbcebcbf01 Paolo Bonzini       2023-08-04  3449  	struct vmcb_control_area *control = &svm->vmcb->control;
7588dbcebcbf01 Paolo Bonzini       2023-08-04  3450  	struct kvm_vcpu *vcpu = &svm->vcpu;
ad5b353240c883 Tom Lendacky        2021-12-02  3451  	u64 reason;
291bd20d5d8881 Tom Lendacky        2020-12-10  3452  
ad5b353240c883 Tom Lendacky        2021-12-02  3453  	/* Only GHCB Usage code 0 is supported */
63dbc67cf4ed11 Paolo Bonzini       2023-08-04  3454  	if (svm->sev_es.ghcb->ghcb_usage) {
ad5b353240c883 Tom Lendacky        2021-12-02  3455  		reason = GHCB_ERR_INVALID_USAGE;
ad5b353240c883 Tom Lendacky        2021-12-02  3456  		goto vmgexit_err;
ad5b353240c883 Tom Lendacky        2021-12-02  3457  	}
ad5b353240c883 Tom Lendacky        2021-12-02  3458  
ad5b353240c883 Tom Lendacky        2021-12-02  3459  	reason = GHCB_ERR_MISSING_INPUT;
ad5b353240c883 Tom Lendacky        2021-12-02  3460  
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3461  	if (!kvm_ghcb_sw_exit_code_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3462  	    !kvm_ghcb_sw_exit_info_1_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3463  	    !kvm_ghcb_sw_exit_info_2_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3464  		goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3465  
d7507a94a07202 Sean Christopherson 2025-12-30  3466  	switch (control->exit_code) {
291bd20d5d8881 Tom Lendacky        2020-12-10  3467  	case SVM_EXIT_READ_DR7:
291bd20d5d8881 Tom Lendacky        2020-12-10  3468  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3469  	case SVM_EXIT_WRITE_DR7:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3470  		if (!kvm_ghcb_rax_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3471  			goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3472  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3473  	case SVM_EXIT_RDTSC:
291bd20d5d8881 Tom Lendacky        2020-12-10  3474  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3475  	case SVM_EXIT_RDPMC:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3476  		if (!kvm_ghcb_rcx_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3477  			goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3478  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3479  	case SVM_EXIT_CPUID:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3480  		if (!kvm_ghcb_rax_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3481  		    !kvm_ghcb_rcx_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3482  			goto vmgexit_err;
7588dbcebcbf01 Paolo Bonzini       2023-08-04  3483  		if (vcpu->arch.regs[VCPU_REGS_RAX] == 0xd)
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3484  			if (!kvm_ghcb_xcr0_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3485  				goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3486  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3487  	case SVM_EXIT_INVD:
291bd20d5d8881 Tom Lendacky        2020-12-10  3488  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3489  	case SVM_EXIT_IOIO:
7588dbcebcbf01 Paolo Bonzini       2023-08-04  3490  		if (control->exit_info_1 & SVM_IOIO_STR_MASK) {
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3491  			if (!kvm_ghcb_sw_scratch_is_valid(svm))
7ed9abfe8e9f62 Tom Lendacky        2020-12-10  3492  				goto vmgexit_err;
7ed9abfe8e9f62 Tom Lendacky        2020-12-10  3493  		} else {
7588dbcebcbf01 Paolo Bonzini       2023-08-04  3494  			if (!(control->exit_info_1 & SVM_IOIO_TYPE_MASK))
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3495  				if (!kvm_ghcb_rax_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3496  					goto vmgexit_err;
7ed9abfe8e9f62 Tom Lendacky        2020-12-10  3497  		}
291bd20d5d8881 Tom Lendacky        2020-12-10  3498  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3499  	case SVM_EXIT_MSR:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3500  		if (!kvm_ghcb_rcx_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3501  			goto vmgexit_err;
7588dbcebcbf01 Paolo Bonzini       2023-08-04  3502  		if (control->exit_info_1) {
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3503  			if (!kvm_ghcb_rax_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3504  			    !kvm_ghcb_rdx_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3505  				goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3506  		}
291bd20d5d8881 Tom Lendacky        2020-12-10  3507  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3508  	case SVM_EXIT_VMMCALL:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3509  		if (!kvm_ghcb_rax_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3510  		    !kvm_ghcb_cpl_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3511  			goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3512  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3513  	case SVM_EXIT_RDTSCP:
291bd20d5d8881 Tom Lendacky        2020-12-10  3514  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3515  	case SVM_EXIT_WBINVD:
291bd20d5d8881 Tom Lendacky        2020-12-10  3516  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3517  	case SVM_EXIT_MONITOR:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3518  		if (!kvm_ghcb_rax_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3519  		    !kvm_ghcb_rcx_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3520  		    !kvm_ghcb_rdx_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3521  			goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3522  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3523  	case SVM_EXIT_MWAIT:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3524  		if (!kvm_ghcb_rax_is_valid(svm) ||
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3525  		    !kvm_ghcb_rcx_is_valid(svm))
291bd20d5d8881 Tom Lendacky        2020-12-10  3526  			goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3527  		break;
8f423a80d299a5 Tom Lendacky        2020-12-10  3528  	case SVM_VMGEXIT_MMIO_READ:
8f423a80d299a5 Tom Lendacky        2020-12-10  3529  	case SVM_VMGEXIT_MMIO_WRITE:
4e15a0ddc3ff40 Paolo Bonzini       2023-08-04  3530  		if (!kvm_ghcb_sw_scratch_is_valid(svm))
8f423a80d299a5 Tom Lendacky        2020-12-10  3531  			goto vmgexit_err;
8f423a80d299a5 Tom Lendacky        2020-12-10  3532  		break;
e366f92ea99e19 Tom Lendacky        2024-05-01  3533  	case SVM_VMGEXIT_AP_CREATION:
6d0d4cc7befcab Sean Christopherson 2026-03-10  3534  		if (!is_sev_snp_guest(vcpu))
e366f92ea99e19 Tom Lendacky        2024-05-01  3535  			goto vmgexit_err;
e366f92ea99e19 Tom Lendacky        2024-05-01  3536  		if (lower_32_bits(control->exit_info_1) != SVM_VMGEXIT_AP_DESTROY)
e366f92ea99e19 Tom Lendacky        2024-05-01  3537  			if (!kvm_ghcb_rax_is_valid(svm))
e366f92ea99e19 Tom Lendacky        2024-05-01  3538  				goto vmgexit_err;
e366f92ea99e19 Tom Lendacky        2024-05-01  3539  		break;
4444dfe4050b79 Tom Lendacky        2020-12-14  3540  	case SVM_VMGEXIT_NMI_COMPLETE:
647daca25d24fb Tom Lendacky        2021-01-04  3541  	case SVM_VMGEXIT_AP_HLT_LOOP:
8640ca588b0321 Tom Lendacky        2020-12-15  3542  	case SVM_VMGEXIT_AP_JUMP_TABLE:
291bd20d5d8881 Tom Lendacky        2020-12-10  3543  	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
ae01818398236a Brijesh Singh       2024-05-01  3544  	case SVM_VMGEXIT_HV_FEATURES:
8d1a36e42be6b0 Michael Roth        2024-05-01  3545  	case SVM_VMGEXIT_TERM_REQUEST:
291bd20d5d8881 Tom Lendacky        2020-12-10  3546  		break;
9b54e248d2644b Michael Roth        2024-05-01  3547  	case SVM_VMGEXIT_PSC:
6d0d4cc7befcab Sean Christopherson 2026-03-10  3548  		if (!is_sev_snp_guest(vcpu) || !kvm_ghcb_sw_scratch_is_valid(svm))
9b54e248d2644b Michael Roth        2024-05-01  3549  			goto vmgexit_err;
9b54e248d2644b Michael Roth        2024-05-01  3550  		break;
88caf544c93053 Brijesh Singh       2024-07-01  3551  	case SVM_VMGEXIT_GUEST_REQUEST:
74458e4859d85e Michael Roth        2024-07-01  3552  	case SVM_VMGEXIT_EXT_GUEST_REQUEST:
6d0d4cc7befcab Sean Christopherson 2026-03-10  3553  		if (!is_sev_snp_guest(vcpu) ||
88caf544c93053 Brijesh Singh       2024-07-01  3554  		    !PAGE_ALIGNED(control->exit_info_1) ||
88caf544c93053 Brijesh Singh       2024-07-01  3555  		    !PAGE_ALIGNED(control->exit_info_2) ||
88caf544c93053 Brijesh Singh       2024-07-01  3556  		    control->exit_info_1 == control->exit_info_2)
88caf544c93053 Brijesh Singh       2024-07-01  3557  			goto vmgexit_err;
88caf544c93053 Brijesh Singh       2024-07-01  3558  		break;
291bd20d5d8881 Tom Lendacky        2020-12-10  3559  	default:
ad5b353240c883 Tom Lendacky        2021-12-02  3560  		reason = GHCB_ERR_INVALID_EVENT;
291bd20d5d8881 Tom Lendacky        2020-12-10  3561  		goto vmgexit_err;
291bd20d5d8881 Tom Lendacky        2020-12-10  3562  	}
291bd20d5d8881 Tom Lendacky        2020-12-10  3563  
aa9f58415a8e45 Sean Christopherson 2022-02-25  3564  	return 0;
291bd20d5d8881 Tom Lendacky        2020-12-10  3565  
291bd20d5d8881 Tom Lendacky        2020-12-10  3566  vmgexit_err:
d7507a94a07202 Sean Christopherson 2025-12-30  3567  	/*
d7507a94a07202 Sean Christopherson 2025-12-30  3568  	 * Print the exit code even though it may not be marked valid as it
d7507a94a07202 Sean Christopherson 2025-12-30  3569  	 * could help with debugging.
d7507a94a07202 Sean Christopherson 2025-12-30  3570  	 */
ad5b353240c883 Tom Lendacky        2021-12-02  3571  	if (reason == GHCB_ERR_INVALID_USAGE) {
291bd20d5d8881 Tom Lendacky        2020-12-10  3572  		vcpu_unimpl(vcpu, "vmgexit: ghcb usage %#x is not valid\n",
63dbc67cf4ed11 Paolo Bonzini       2023-08-04  3573  			    svm->sev_es.ghcb->ghcb_usage);
ad5b353240c883 Tom Lendacky        2021-12-02  3574  	} else if (reason == GHCB_ERR_INVALID_EVENT) {
ad5b353240c883 Tom Lendacky        2021-12-02  3575  		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx is not valid\n",
d7507a94a07202 Sean Christopherson 2025-12-30  3576  			    control->exit_code);
291bd20d5d8881 Tom Lendacky        2020-12-10  3577  	} else {
ad5b353240c883 Tom Lendacky        2021-12-02  3578  		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx input is not valid\n",
d7507a94a07202 Sean Christopherson 2025-12-30  3579  			    control->exit_code);
291bd20d5d8881 Tom Lendacky        2020-12-10  3580  		dump_ghcb(svm);
291bd20d5d8881 Tom Lendacky        2020-12-10  3581  	}
291bd20d5d8881 Tom Lendacky        2020-12-10  3582  
c3392d0ab714d8 Melody Wang         2025-02-25  3583  	svm_vmgexit_bad_input(svm, reason);
291bd20d5d8881 Tom Lendacky        2020-12-10  3584  
aa9f58415a8e45 Sean Christopherson 2022-02-25  3585  	/* Resume the guest to "return" the error code. */
aa9f58415a8e45 Sean Christopherson 2022-02-25  3586  	return 1;
291bd20d5d8881 Tom Lendacky        2020-12-10  3587  }
291bd20d5d8881 Tom Lendacky        2020-12-10  3588  

:::::: The code at line 3264 was first introduced by commit
:::::: 4bbef7e8eb8c2c7dabf57d97decfd2b4f48aaf02 KVM: SVM: Simplify and harden helper to flush SEV guest page(s)

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
