Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46441A8F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763798807; cv=none; b=jR+cEnjGD7YytWwiBZRhC2BB33xXkc/q+9CocaBfWV3vh2fGQfBGjYDN4H56f83oYfd9/IA1gcxpjZeFY4wNTHq9xsacT7ePkLX8l/oXJt0zeLXgnWIZcysNX/UB8BXj67TGpHR1s1VWN7/1sSSkMe0e82DEkaH0zojAbhJnbr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763798807; c=relaxed/simple;
	bh=IUJsTn5xp356frgqJ4Ua+NCPT+RNRYC7iGNhjv9oRAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bdoQtJ4vX/dtwFYmm6MXBeOJF3uLfeC3FJBGWHOJU1zQPj5yfcczmj2BE0tRFKoVas5TzpXprgBoXhUCJ0m8VdojlPc00/vQS2Wbc6ugg753PJ87H86CcnYm4M7bpJRRmVDoWjJwXsl8mkNL4WpsWWz1d0lgDW8UdE6DFsWU6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZ4KxwRw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZ4KxwRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763798805; x=1795334805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUJsTn5xp356frgqJ4Ua+NCPT+RNRYC7iGNhjv9oRAw=;
  b=HZ4KxwRw0Q7JgQOsFZabESEOM7fveqiuEy5TD9Ki6NXLyic/FI4zyb9H
   hYI8QtEv1M/tF2RDyIm+xULe3vopfHPcn68Mh4E9mJTmxvq3VKrMI8qG8
   xexfU0XUZhGAWqRwJ6/weNs7PJi0uQWdbeEMRm9jbNeSLce4feDfcLvcN
   I10K7KsHO9oRXiz2VYCCMJoH2kgwm8Z8molZrYRvfAVKGYj74gy9vMupc
   csixQKDAPTmPzQjNLIloBJCpcI5ibDcq8dnIFgQ0EMtaA4qxa9xPpHSzk
   4hMT7a2saVzmB6y/sa7hVjf9SXfk2oeCRF0e7/5Z/u4hAUFk60AGDtS1E
   g==;
X-CSE-ConnectionGUID: 58XkjF18QsCvsj29jL4nZg==
X-CSE-MsgGUID: qV6YEkEAS2OkavyU3PHUug==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="66044214"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="66044214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 00:06:45 -0800
X-CSE-ConnectionGUID: HA9VjFr4Tky1B/hyvp9plA==
X-CSE-MsgGUID: AgCWgj+ISF6Q5dxXXj9bXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="192143254"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2025 00:06:43 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMidl-0007HH-1k;
	Sat, 22 Nov 2025 08:06:41 +0000
Date: Sat, 22 Nov 2025 16:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3304/3304] arch/arm64/kvm/hypercalls.c:380:52:
 error: passing argument 1 of 'hisi_ipiv_supported_per_vm' from incompatible
 pointer type
Message-ID: <202511221643.H3LgffBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2e375b157ddf25336989b074c1f2a88a80ab72f5
commit: cbd165f529bd32b586342c0a2d11c3ca50b9fdd3 [3304/3304] KVM: arm64: ipiv: Change parameter from vcpu to kvm
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251122/202511221643.H3LgffBo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221643.H3LgffBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221643.H3LgffBo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hypercalls.c: In function 'kvm_smccc_call_handler':
>> arch/arm64/kvm/hypercalls.c:380:52: error: passing argument 1 of 'hisi_ipiv_supported_per_vm' from incompatible pointer type [-Wincompatible-pointer-types]
     380 |                 if (hisi_ipiv_supported_per_vm(vcpu->kvm))
         |                                                ~~~~^~~~~
         |                                                    |
         |                                                    struct kvm *
   In file included from arch/arm64/kvm/hypercalls.c:13:
   arch/arm64/kvm/hisilicon/hisi_virt.h:127:64: note: expected 'struct kvm_vcpu *' but argument is of type 'struct kvm *'
     127 | static inline bool hisi_ipiv_supported_per_vm(struct kvm_vcpu *vcpu)
         |                                               ~~~~~~~~~~~~~~~~~^~~~
   arch/arm64/kvm/hypercalls.c:386:52: error: passing argument 1 of 'hisi_ipiv_supported_per_vm' from incompatible pointer type [-Wincompatible-pointer-types]
     386 |                 if (hisi_ipiv_supported_per_vm(vcpu->kvm)) {
         |                                                ~~~~^~~~~
         |                                                    |
         |                                                    struct kvm *
   arch/arm64/kvm/hisilicon/hisi_virt.h:127:64: note: expected 'struct kvm_vcpu *' but argument is of type 'struct kvm *'
     127 | static inline bool hisi_ipiv_supported_per_vm(struct kvm_vcpu *vcpu)
         |                                               ~~~~~~~~~~~~~~~~~^~~~
>> arch/arm64/kvm/hypercalls.c:387:53: error: passing argument 1 of 'hisi_ipiv_enable_per_vm' from incompatible pointer type [-Wincompatible-pointer-types]
     387 |                         hisi_ipiv_enable_per_vm(vcpu->kvm);
         |                                                 ~~~~^~~~~
         |                                                     |
         |                                                     struct kvm *
   arch/arm64/kvm/hisilicon/hisi_virt.h:131:61: note: expected 'struct kvm_vcpu *' but argument is of type 'struct kvm *'
     131 | static inline void hisi_ipiv_enable_per_vm(struct kvm_vcpu *vcpu) {}
         |                                            ~~~~~~~~~~~~~~~~~^~~~


vim +/hisi_ipiv_supported_per_vm +380 arch/arm64/kvm/hypercalls.c

   264	
   265	int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
   266	{
   267		struct kvm_smccc_features *smccc_feat = &vcpu->kvm->arch.smccc_feat;
   268		u32 func_id = smccc_get_function(vcpu);
   269		u64 val[4] = {SMCCC_RET_NOT_SUPPORTED};
   270		u32 feature;
   271		u8 action;
   272		gpa_t gpa;
   273	
   274		action = kvm_smccc_get_action(vcpu, func_id);
   275		switch (action) {
   276		case KVM_SMCCC_FILTER_HANDLE:
   277			break;
   278		case KVM_SMCCC_FILTER_DENY:
   279			goto out;
   280		case KVM_SMCCC_FILTER_FWD_TO_USER:
   281			kvm_prepare_hypercall_exit(vcpu, func_id);
   282			return 0;
   283		default:
   284			WARN_RATELIMIT(1, "Unhandled SMCCC filter action: %d\n", action);
   285			goto out;
   286		}
   287	
   288		switch (func_id) {
   289		case ARM_SMCCC_VERSION_FUNC_ID:
   290			val[0] = ARM_SMCCC_VERSION_1_1;
   291			break;
   292		case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
   293			feature = smccc_get_arg1(vcpu);
   294			switch (feature) {
   295			case ARM_SMCCC_ARCH_WORKAROUND_1:
   296				switch (arm64_get_spectre_v2_state()) {
   297				case SPECTRE_VULNERABLE:
   298					break;
   299				case SPECTRE_MITIGATED:
   300					val[0] = SMCCC_RET_SUCCESS;
   301					break;
   302				case SPECTRE_UNAFFECTED:
   303					val[0] = SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED;
   304					break;
   305				}
   306				break;
   307			case ARM_SMCCC_ARCH_WORKAROUND_2:
   308				switch (arm64_get_spectre_v4_state()) {
   309				case SPECTRE_VULNERABLE:
   310					break;
   311				case SPECTRE_MITIGATED:
   312					/*
   313					 * SSBS everywhere: Indicate no firmware
   314					 * support, as the SSBS support will be
   315					 * indicated to the guest and the default is
   316					 * safe.
   317					 *
   318					 * Otherwise, expose a permanent mitigation
   319					 * to the guest, and hide SSBS so that the
   320					 * guest stays protected.
   321					 */
   322					if (cpus_have_final_cap(ARM64_SSBS))
   323						break;
   324					fallthrough;
   325				case SPECTRE_UNAFFECTED:
   326					val[0] = SMCCC_RET_NOT_REQUIRED;
   327					break;
   328				}
   329				break;
   330			case ARM_SMCCC_ARCH_WORKAROUND_3:
   331				switch (arm64_get_spectre_bhb_state()) {
   332				case SPECTRE_VULNERABLE:
   333					break;
   334				case SPECTRE_MITIGATED:
   335					val[0] = SMCCC_RET_SUCCESS;
   336					break;
   337				case SPECTRE_UNAFFECTED:
   338					val[0] = SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED;
   339					break;
   340				}
   341				break;
   342			case ARM_SMCCC_HV_PV_TIME_FEATURES:
   343				if (test_bit(KVM_REG_ARM_STD_HYP_BIT_PV_TIME,
   344					     &smccc_feat->std_hyp_bmap))
   345					val[0] = SMCCC_RET_SUCCESS;
   346				break;
   347	#ifdef CONFIG_PARAVIRT_SCHED
   348			case ARM_SMCCC_HV_PV_SCHED_FEATURES:
   349				val[0] = SMCCC_RET_SUCCESS;
   350				break;
   351	#endif /* CONFIG_PARAVIRT_SCHED */
   352			}
   353			break;
   354		case ARM_SMCCC_HV_PV_TIME_FEATURES:
   355			val[0] = kvm_hypercall_pv_features(vcpu);
   356			break;
   357		case ARM_SMCCC_HV_PV_TIME_ST:
   358			gpa = kvm_init_stolen_time(vcpu);
   359			if (gpa != INVALID_GPA)
   360				val[0] = gpa;
   361			break;
   362	#ifdef CONFIG_PARAVIRT_SCHED
   363		case ARM_SMCCC_HV_PV_SCHED_FEATURES:
   364			val[0] = kvm_hypercall_pvsched_features(vcpu);
   365			break;
   366		case ARM_SMCCC_HV_PV_SCHED_IPA_INIT:
   367			gpa = smccc_get_arg1(vcpu);
   368			if (gpa != INVALID_GPA) {
   369				vcpu->arch.pvsched.base = gpa;
   370				val[0] = SMCCC_RET_SUCCESS;
   371			}
   372			break;
   373		case ARM_SMCCC_HV_PV_SCHED_IPA_RELEASE:
   374			vcpu->arch.pvsched.base = INVALID_GPA;
   375			val[0] = SMCCC_RET_SUCCESS;
   376			break;
   377	#endif /* CONFIG_PARAVIRT_SCHED */
   378	#ifdef CONFIG_ARM64_HISI_IPIV
   379		case ARM_SMCCC_VENDOR_PV_SGI_FEATURES:
 > 380			if (hisi_ipiv_supported_per_vm(vcpu->kvm))
   381				val[0] = SMCCC_RET_SUCCESS;
   382			else
   383				val[0] = SMCCC_RET_NOT_SUPPORTED;
   384			break;
   385		case ARM_SMCCC_VENDOR_PV_SGI_ENABLE:
 > 386			if (hisi_ipiv_supported_per_vm(vcpu->kvm)) {
 > 387				hisi_ipiv_enable_per_vm(vcpu->kvm);
   388				val[0] = SMCCC_RET_SUCCESS;
   389			} else {
   390				val[0] = SMCCC_RET_NOT_SUPPORTED;
   391			}
   392			break;
   393	#endif
   394		case ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID:
   395			val[0] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0;
   396			val[1] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1;
   397			val[2] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2;
   398			val[3] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
   399			break;
   400		case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
   401			val[0] = smccc_feat->vendor_hyp_bmap;
   402			/* Function numbers 2-63 are reserved for pKVM for now */
   403			val[2] = smccc_feat->vendor_hyp_bmap_2;
   404			break;
   405		case ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID:
   406			kvm_ptp_get_time(vcpu, val);
   407			break;
   408		case ARM_SMCCC_TRNG_VERSION:
   409		case ARM_SMCCC_TRNG_FEATURES:
   410		case ARM_SMCCC_TRNG_GET_UUID:
   411		case ARM_SMCCC_TRNG_RND32:
   412		case ARM_SMCCC_TRNG_RND64:
   413			return kvm_trng_call(vcpu);
   414		default:
   415			return kvm_psci_call(vcpu);
   416		}
   417	
   418	out:
   419		smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
   420		return 1;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
