Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ECE21CC5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742224143; cv=none; b=S0LguJwasd7tQr5tHTxCDI596vYArU4z1dOdreo6ZygyuxEg78GJNQ9nHr2Iow7aE6GJbbXUsM5RphAvwjiYhJwuzrLPI0/oUSqKd/QsrLAPPd2aO4T3TkS3dBMeSODRz/D9zuO+Yo9c1gNMQqZlYeIry5sxUoRYBd7FTxkBSyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742224143; c=relaxed/simple;
	bh=9MMy3NCTu2wkLLyVoOaM+gLPKxaeJ+7HtAFuJw0mp4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXkXecqdlTkN033nPULraZXjJmg7szt/hy9syrUPeW8gCpd7JRNXaq1X5yssOj/VwfrmhBTY55D0NgqIwum6/sIwr3GgwpxZ0VQYQVDRoyYcyCAOwOEZyD9Q8CxEwv0B2gfhoKdQk9nK+hSZ9X03V/AbZMXTuxS+LvqtMIxpMh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXzYm6Uq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXzYm6Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742224141; x=1773760141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9MMy3NCTu2wkLLyVoOaM+gLPKxaeJ+7HtAFuJw0mp4U=;
  b=lXzYm6UqY+u16ZnoHW5InyyWVlDgng+S79ten8pB0uddJ1hr6jgW6IZs
   JCHLxJP8fcVZfXFLWKyJQEo8uyHKxHD4b/eNwlem1E9IcpjtzFXcLDprH
   aHf0TxqE77Mi5eUgUTO1eR6zeVQ8vlLHlOJ6HMbjaLQrW78i2KvnmOs6G
   78mM5lF6ceES5JlJQHaKPDTsWHMFbk0fY7nRh5uuDbNx1sr5m4/rRg99Q
   Cu8y3N4vbC+/WOQtdw1YH+/Fp5X+ylWgL6B/4lFWDGAsL1F2iNOxOPFgf
   e4UDU2/DTtNWyZNc5EBC5hhINtSsvo6iDSuI/aA/zEdcQxQUu6x4I8Yzq
   Q==;
X-CSE-ConnectionGUID: YaoCf6RAQHOGqx/ld6o85A==
X-CSE-MsgGUID: z8CNeVKNRTq41beMEsKAng==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="65787196"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="65787196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 08:09:00 -0700
X-CSE-ConnectionGUID: peiQwaWFSO2XEnVy52z9Ow==
X-CSE-MsgGUID: XssknVuTT3S485/UKcP/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121689698"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2025 08:08:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuC53-000Crq-0B;
	Mon, 17 Mar 2025 15:08:46 +0000
Date: Mon, 17 Mar 2025 23:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, arnd@arndb.de,
	bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com,
	conor+dt@kernel.org, dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next v6 01/11] arm64: kvm, smccc: Introduce and
 use API for detecting hypervisor presence
Message-ID: <202503172236.TQovQLBw-lkp@intel.com>
References: <20250315001931.631210-2-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-2-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9608f6dc3e3229a40e1db1dab573d6882f38c2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detecting-hypervisor-presence/20250315-082319
base:   d9608f6dc3e3229a40e1db1dab573d6882f38c2a
patch link:    https://lore.kernel.org/r/20250315001931.631210-2-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v6 01/11] arm64: kvm, smccc: Introduce and use API for detecting hypervisor presence
config: arm64-randconfig-r122-20250317 (https://download.01.org/0day-ci/archive/20250317/202503172236.TQovQLBw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250317/202503172236.TQovQLBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503172236.TQovQLBw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hypercalls.c:356:17: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hypercalls.c:356:17: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hypercalls.c:356:17: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/hypercalls.c:356:17: sparse: sparse: cast to restricted __le32

vim +356 arch/arm64/kvm/hypercalls.c

   262	
   263	int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
   264	{
   265		struct kvm_smccc_features *smccc_feat = &vcpu->kvm->arch.smccc_feat;
   266		u32 func_id = smccc_get_function(vcpu);
   267		u64 val[4] = {SMCCC_RET_NOT_SUPPORTED};
   268		u32 feature;
   269		u8 action;
   270		gpa_t gpa;
   271	
   272		action = kvm_smccc_get_action(vcpu, func_id);
   273		switch (action) {
   274		case KVM_SMCCC_FILTER_HANDLE:
   275			break;
   276		case KVM_SMCCC_FILTER_DENY:
   277			goto out;
   278		case KVM_SMCCC_FILTER_FWD_TO_USER:
   279			kvm_prepare_hypercall_exit(vcpu, func_id);
   280			return 0;
   281		default:
   282			WARN_RATELIMIT(1, "Unhandled SMCCC filter action: %d\n", action);
   283			goto out;
   284		}
   285	
   286		switch (func_id) {
   287		case ARM_SMCCC_VERSION_FUNC_ID:
   288			val[0] = ARM_SMCCC_VERSION_1_1;
   289			break;
   290		case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
   291			feature = smccc_get_arg1(vcpu);
   292			switch (feature) {
   293			case ARM_SMCCC_ARCH_WORKAROUND_1:
   294				switch (arm64_get_spectre_v2_state()) {
   295				case SPECTRE_VULNERABLE:
   296					break;
   297				case SPECTRE_MITIGATED:
   298					val[0] = SMCCC_RET_SUCCESS;
   299					break;
   300				case SPECTRE_UNAFFECTED:
   301					val[0] = SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED;
   302					break;
   303				}
   304				break;
   305			case ARM_SMCCC_ARCH_WORKAROUND_2:
   306				switch (arm64_get_spectre_v4_state()) {
   307				case SPECTRE_VULNERABLE:
   308					break;
   309				case SPECTRE_MITIGATED:
   310					/*
   311					 * SSBS everywhere: Indicate no firmware
   312					 * support, as the SSBS support will be
   313					 * indicated to the guest and the default is
   314					 * safe.
   315					 *
   316					 * Otherwise, expose a permanent mitigation
   317					 * to the guest, and hide SSBS so that the
   318					 * guest stays protected.
   319					 */
   320					if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SSBS, IMP))
   321						break;
   322					fallthrough;
   323				case SPECTRE_UNAFFECTED:
   324					val[0] = SMCCC_RET_NOT_REQUIRED;
   325					break;
   326				}
   327				break;
   328			case ARM_SMCCC_ARCH_WORKAROUND_3:
   329				switch (arm64_get_spectre_bhb_state()) {
   330				case SPECTRE_VULNERABLE:
   331					break;
   332				case SPECTRE_MITIGATED:
   333					val[0] = SMCCC_RET_SUCCESS;
   334					break;
   335				case SPECTRE_UNAFFECTED:
   336					val[0] = SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED;
   337					break;
   338				}
   339				break;
   340			case ARM_SMCCC_HV_PV_TIME_FEATURES:
   341				if (test_bit(KVM_REG_ARM_STD_HYP_BIT_PV_TIME,
   342					     &smccc_feat->std_hyp_bmap))
   343					val[0] = SMCCC_RET_SUCCESS;
   344				break;
   345			}
   346			break;
   347		case ARM_SMCCC_HV_PV_TIME_FEATURES:
   348			val[0] = kvm_hypercall_pv_features(vcpu);
   349			break;
   350		case ARM_SMCCC_HV_PV_TIME_ST:
   351			gpa = kvm_init_stolen_time(vcpu);
   352			if (gpa != INVALID_GPA)
   353				val[0] = gpa;
   354			break;
   355		case ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID:
 > 356			UUID_TO_SMCCC_RES(ARM_SMCCC_VENDOR_HYP_UID_KVM, val);
   357			break;
   358		case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
   359			val[0] = smccc_feat->vendor_hyp_bmap;
   360			break;
   361		case ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID:
   362			kvm_ptp_get_time(vcpu, val);
   363			break;
   364		case ARM_SMCCC_TRNG_VERSION:
   365		case ARM_SMCCC_TRNG_FEATURES:
   366		case ARM_SMCCC_TRNG_GET_UUID:
   367		case ARM_SMCCC_TRNG_RND32:
   368		case ARM_SMCCC_TRNG_RND64:
   369			return kvm_trng_call(vcpu);
   370		default:
   371			return kvm_psci_call(vcpu);
   372		}
   373	
   374	out:
   375		smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
   376		return 1;
   377	}
   378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
