Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA31146D7D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573261; cv=none; b=uAPw7Nmh8sKc7uKEUirCfDqr+8o1urMduQllDjfMpkZk1EQsaDtB46SorZ6Ytmbe1OOvS6xXAh5H1x92yNKvCai+njLwZvMK1oAmIdCzBfkUWnxVbdpBps3zR0+MI6wwQqrZDsN6ydMzos5LWH8E8EY4fefXVBcBhNuO1P87MBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573261; c=relaxed/simple;
	bh=YP84zAoNkiSwF4uFHTCSDdaocmDBVcbCPyMQ5zty1Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMqPd2pE89Hc9l+tULyoOGmns6ysFN1UJ84Qf2yZcPJ1zKzHmL6WgvKtEKCuDbp89L1MNaBduSPveKRgrtI/fCVuVxyE65PmQw43SitKhWmgH9o4B9KdcTe2kV9Fy7Jxcp9YCF+qXb/cHGQ0/QcRHH9unD1kaMYd7DcZxtvF3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIAV0/zC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIAV0/zC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717573259; x=1749109259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YP84zAoNkiSwF4uFHTCSDdaocmDBVcbCPyMQ5zty1Lc=;
  b=UIAV0/zC4cWp1xNVh3hnCcY9lgGa7myyjYzJSrvsqmp/IbT3qHUDZoce
   9XFZBJkJXrCdkqiFvPu5veDM6Cjx+SoU2vAfmzklwFCJFcKf4ZlRaPxTJ
   pLusbtUOM6ULVwMoh1ovNmBXnEs3VTzsvZV59d9tNQGUbgKaKNCRZ6T+6
   Zm4jg+tWBqPXJDqIlDx0huma5VqHqIkZR/kfDSneOe/Rjh6zhzsMih/qC
   YQ604iw6pxYqRTMkhRcGjw8yZSfpZTjdiHC1xmJnYFW99CjnGyIoXYzDK
   IXd3e9dApAs1zEFHtTbIehmitOruWAfCAFfe0f6R2EKMH1zRWnfMTciA+
   w==;
X-CSE-ConnectionGUID: m/5fjaz2QTK+rIZ9++XNAQ==
X-CSE-MsgGUID: 5b3TtYXoTb+9GHPNzsEjNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31654399"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="31654399"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 00:40:58 -0700
X-CSE-ConnectionGUID: /g0B2jTdRBSht3UVZN/35g==
X-CSE-MsgGUID: iUWEH5DITby3zPpa3QrToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="68637765"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2024 00:40:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sElGR-000134-0K;
	Wed, 05 Jun 2024 07:40:55 +0000
Date: Wed, 5 Jun 2024 15:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/pmu_fixed_ctr_ctrl_helper 3/3]
 arch/x86/kvm/vmx/pmu_intel.c:468:13: warning: unused variable 'i'
Message-ID: <202406051526.1mqb7Vqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/pmu_fixed_ctr_ctrl_helper
head:   c64fb3423cc30049e385769287c3d3d5475a4ac6
commit: c64fb3423cc30049e385769287c3d3d5475a4ac6 [3/3] KVM: x86/pmu: Add a helper to enable bits in FIXED_CTR_CTRL
config: i386-buildonly-randconfig-002-20240605 (https://download.01.org/0day-ci/archive/20240605/202406051526.1mqb7Vqy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051526.1mqb7Vqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051526.1mqb7Vqy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/vmx/pmu_intel.c: In function 'intel_pmu_refresh':
>> arch/x86/kvm/vmx/pmu_intel.c:468:13: warning: unused variable 'i' [-Wunused-variable]
     468 |         int i;
         |             ^


vim +/i +468 arch/x86/kvm/vmx/pmu_intel.c

c64fb3423cc300 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2024-06-04  458  
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  459  static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  460  {
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  461  	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
9c9520ce883386 arch/x86/kvm/vmx/pmu_intel.c Paolo Bonzini       2021-02-02  462  	struct lbr_desc *lbr_desc = vcpu_to_lbr_desc(vcpu);
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  463  	struct kvm_cpuid_entry2 *entry;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  464  	union cpuid10_eax eax;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  465  	union cpuid10_edx edx;
3f7999b988bde6 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-06-11  466  	u64 perf_capabilities;
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  467  	u64 counter_rsvd;
2c985527dd8d28 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11 @468  	int i;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  469  
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  470  	memset(&lbr_desc->records, 0, sizeof(lbr_desc->records));
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  471  
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  472  	/*
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  473  	 * Setting passthrough of LBR MSRs is done only in the VM-Entry loop,
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  474  	 * and PMU refresh is disallowed after the vCPU has run, i.e. this code
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  475  	 * should never be reached while KVM is passing through MSRs.
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  476  	 */
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  477  	if (KVM_BUG_ON(lbr_desc->msr_passthrough, vcpu->kvm))
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  478  		return;
957d0f70e97bb2 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-03-10  479  
277ad7d58611b4 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-07-12  480  	entry = kvm_find_cpuid_entry(vcpu, 0xa);
f933b88e20150f arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-11-09  481  	if (!entry)
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  482  		return;
f933b88e20150f arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-11-09  483  
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  484  	eax.full = entry->eax;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  485  	edx.full = entry->edx;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  486  
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  487  	pmu->version = eax.split.version_id;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  488  	if (!pmu->version)
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  489  		return;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  490  
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  491  	pmu->nr_arch_gp_counters = min_t(int, eax.split.num_counters,
968635abd5f598 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  492  					 kvm_pmu_cap.num_counters_gp);
968635abd5f598 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  493  	eax.split.bit_width = min_t(int, eax.split.bit_width,
968635abd5f598 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  494  				    kvm_pmu_cap.bit_width_gp);
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  495  	pmu->counter_bitmask[KVM_PMC_GP] = ((u64)1 << eax.split.bit_width) - 1;
968635abd5f598 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  496  	eax.split.mask_length = min_t(int, eax.split.mask_length,
968635abd5f598 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  497  				      kvm_pmu_cap.events_mask_len);
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  498  	pmu->available_event_types = ~entry->ebx &
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  499  					((1ull << eax.split.mask_length) - 1);
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  500  
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  501  	if (pmu->version == 1) {
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  502  		pmu->nr_arch_fixed_counters = 0;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  503  	} else {
6d88d0ee5de142 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-06  504  		pmu->nr_arch_fixed_counters = min_t(int, edx.split.num_counters_fixed,
6d88d0ee5de142 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-06  505  						    kvm_pmu_cap.num_counters_fixed);
968635abd5f598 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  506  		edx.split.bit_width_fixed = min_t(int, edx.split.bit_width_fixed,
968635abd5f598 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  507  						  kvm_pmu_cap.bit_width_fixed);
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  508  		pmu->counter_bitmask[KVM_PMC_FIXED] =
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  509  			((u64)1 << edx.split.bit_width_fixed) - 1;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  510  	}
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  511  
c64fb3423cc300 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2024-06-04  512  	intel_pmu_enable_fixed_counter_bits(pmu, INTEL_FIXED_0_KERNEL |
75430c412a3139 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  513  						 INTEL_FIXED_0_USER |
75430c412a3139 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  514  						 INTEL_FIXED_0_ENABLE_PMI);
75430c412a3139 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  515  
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  516  	counter_rsvd = ~(((1ull << pmu->nr_arch_gp_counters) - 1) |
be6b067dae1573 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-11-09  517  		(((1ull << pmu->nr_arch_fixed_counters) - 1) << KVM_FIXED_PMC_BASE_IDX));
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  518  	pmu->global_ctrl_rsvd = counter_rsvd;
53550b89220bed arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-02  519  
53550b89220bed arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-02  520  	/*
53550b89220bed arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-02  521  	 * GLOBAL_STATUS and GLOBAL_OVF_CONTROL (a.k.a. GLOBAL_STATUS_RESET)
53550b89220bed arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-02  522  	 * share reserved bit definitions.  The kernel just happens to use
53550b89220bed arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-02  523  	 * OVF_CTRL for the names.
53550b89220bed arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2023-06-02  524  	 */
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  525  	pmu->global_status_rsvd = pmu->global_ctrl_rsvd
c715eb9fe9027e arch/x86/kvm/vmx/pmu_intel.c Luwei Kang          2019-02-18  526  			& ~(MSR_CORE_PERF_GLOBAL_OVF_CTRL_OVF_BUF |
c715eb9fe9027e arch/x86/kvm/vmx/pmu_intel.c Luwei Kang          2019-02-18  527  			    MSR_CORE_PERF_GLOBAL_OVF_CTRL_COND_CHGD);
a1bead2abaa162 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2020-03-02  528  	if (vmx_pt_mode_is_host_guest())
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  529  		pmu->global_status_rsvd &=
c715eb9fe9027e arch/x86/kvm/vmx/pmu_intel.c Luwei Kang          2019-02-18  530  				~MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI;
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  531  
277ad7d58611b4 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-07-12  532  	entry = kvm_find_cpuid_entry_index(vcpu, 7, 0);
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  533  	if (entry &&
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  534  	    (boot_cpu_has(X86_FEATURE_HLE) || boot_cpu_has(X86_FEATURE_RTM)) &&
e644896f5106aa arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-03-09  535  	    (entry->ebx & (X86_FEATURE_HLE|X86_FEATURE_RTM))) {
e644896f5106aa arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-03-09  536  		pmu->reserved_bits ^= HSW_IN_TX;
e644896f5106aa arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-03-09  537  		pmu->raw_event_mask |= (HSW_IN_TX|HSW_IN_TX_CHECKPOINTED);
e644896f5106aa arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-03-09  538  	}
b35e5548b41131 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2019-10-27  539  
b35e5548b41131 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2019-10-27  540  	bitmap_set(pmu->all_valid_pmc_idx,
b35e5548b41131 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2019-10-27  541  		0, pmu->nr_arch_gp_counters);
b35e5548b41131 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2019-10-27  542  	bitmap_set(pmu->all_valid_pmc_idx,
b35e5548b41131 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2019-10-27  543  		INTEL_PMC_MAX_GENERIC, pmu->nr_arch_fixed_counters);
03a8871add9521 arch/x86/kvm/vmx/pmu_intel.c Oliver Upton        2019-11-13  544  
6348aafa8d24c1 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-07-27  545  	perf_capabilities = vcpu_get_perf_capabilities(vcpu);
6348aafa8d24c1 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-07-27  546  	if (cpuid_model_is_consistent(vcpu) &&
6348aafa8d24c1 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-07-27  547  	    (perf_capabilities & PMU_CAP_LBR_FMT))
447112d7edd77f arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2024-03-06  548  		memcpy(&lbr_desc->records, &vmx_lbr_caps, sizeof(vmx_lbr_caps));
9c9520ce883386 arch/x86/kvm/vmx/pmu_intel.c Paolo Bonzini       2021-02-02  549  	else
9c9520ce883386 arch/x86/kvm/vmx/pmu_intel.c Paolo Bonzini       2021-02-02  550  		lbr_desc->records.nr = 0;
9aa4f622460f92 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2021-02-01  551  
9aa4f622460f92 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2021-02-01  552  	if (lbr_desc->records.nr)
9aa4f622460f92 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2021-02-01  553  		bitmap_set(pmu->all_valid_pmc_idx, INTEL_PMC_IDX_FIXED_VLBR, 1);
c59a1f106f5cd4 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  554  
3f7999b988bde6 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-06-11  555  	if (perf_capabilities & PERF_CAP_PEBS_FORMAT) {
3f7999b988bde6 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2022-06-11  556  		if (perf_capabilities & PERF_CAP_PEBS_BASELINE) {
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  557  			pmu->pebs_enable_rsvd = counter_rsvd;
c59a1f106f5cd4 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  558  			pmu->reserved_bits &= ~ICL_EVENTSEL_ADAPTIVE;
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  559  			pmu->pebs_data_cfg_rsvd = ~0xff00000full;
c64fb3423cc300 arch/x86/kvm/vmx/pmu_intel.c Sean Christopherson 2024-06-04  560  			intel_pmu_enable_fixed_counter_bits(pmu, ICL_FIXED_0_ADAPTIVE);
c59a1f106f5cd4 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  561  		} else {
0e102ce3d41331 arch/x86/kvm/vmx/pmu_intel.c Dapeng Mi           2024-04-30  562  			pmu->pebs_enable_rsvd =
c59a1f106f5cd4 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  563  				~((1ull << pmu->nr_arch_gp_counters) - 1);
c59a1f106f5cd4 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  564  		}
c59a1f106f5cd4 arch/x86/kvm/vmx/pmu_intel.c Like Xu             2022-04-11  565  	}
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  566  }
25462f7f5295e2 arch/x86/kvm/pmu_intel.c     Wei Huang           2015-06-19  567  

:::::: The code at line 468 was first introduced by commit
:::::: 2c985527dd8d283e786ad7a67e532ef7f6f00fac KVM: x86/pmu: Introduce the ctrl_mask value for fixed counter

:::::: TO: Like Xu <like.xu@linux.intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
