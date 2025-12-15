Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6BE26B098
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791676; cv=none; b=uDgVkW3GJpM4VjggxXRdm670CRmcbD/w12QhYO5uYzJ5zQQwNTXOj6n/e0Vu8HOvFqza4s5qKxY4q7DFVPfNyB3Y5PHeS/RV2hAkiimEZ7FxSlc80bghGsqDPmZZQAljvBl4/tTGqWFyvqNxTof9G/HwbXhb8erWAuc3yG7INT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791676; c=relaxed/simple;
	bh=1gPEaIJuAWfAA7evKmjyZdBko1jOVy7mteqJ6ECMwas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jj2q4/NTt3tUiQL2klCWlKOz5fHxc0O6h30qlXds4/TLYAElq6eb/saKPvVzGmKF36Ar06ySzG6SHkazsLaazamGO+kvGHPsLdDCQlyTxtezqc2aT6NXmSd7hafJls+7BpEveZd/TiOnv5OcjVOwdoW6rZ1CSKiFqICfVPMOUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dC0D07oO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dC0D07oO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765791675; x=1797327675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gPEaIJuAWfAA7evKmjyZdBko1jOVy7mteqJ6ECMwas=;
  b=dC0D07oOOdco0SP3gDb5Lo2o37R8SBbDeVw9OiOnsRknZBqlrHs3r+nH
   66KaBp1uIBV3OKaEwWgyW7Twzly/zwR6AvVg65SzwigJQILPXN/xSCUE/
   m9caKDEu57qoyYcVa3qLSYzspqEtLO1w3zUKuvWm0QPPGNOgaQkNyTpy7
   OyXjqop3vWVobaqcrlxrcK8hWm0C7vlZmxrfHj1fZcAHmQpys+qPDefB/
   5K1/7njPHPZIF+qvtqWYLocIP2GWqTNgMzOobhAR2Jy4FHwXktiEYnhy3
   WdhvcLurbCi4juBqjljQ9TFLRtBmVkXtRmpZwgNHzYnszKDn72g3AwiTC
   Q==;
X-CSE-ConnectionGUID: 0J4NfhjsRG6yxzhgkMn4CA==
X-CSE-MsgGUID: 8N72Z4oXS3K/DNobJckbLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79144568"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="79144568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:41:14 -0800
X-CSE-ConnectionGUID: V0QJrIwxTC63+Ei4QFCqgA==
X-CSE-MsgGUID: MXT9dijoSRGchC7utjobOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197672115"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2025 01:41:12 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV54o-0000000009p-1S38;
	Mon, 15 Dec 2025 09:41:10 +0000
Date: Mon, 15 Dec 2025 17:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: arch/arm64/kernel/cpufeature.c:3095:9: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202512151716.VtbG1F7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 064737920bdbca86df91b96aed256e88018fef3a arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
date:   11 months ago
config: arm64-randconfig-r112-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151716.VtbG1F7H-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151716.VtbG1F7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151716.VtbG1F7H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/cpufeature.c:3095:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3095:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3096:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3096:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3097:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3097:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3098:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3098:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3099:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3099:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3100:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3100:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3101:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3101:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3102:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3102:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3103:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3103:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3104:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3104:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3105:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3105:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3106:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3106:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3107:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3107:9: sparse:   also defined here

vim +3095 arch/arm64/kernel/cpufeature.c

  3052	
  3053	static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
  3054		HWCAP_CAP(ID_AA64ISAR0_EL1, AES, PMULL, CAP_HWCAP, KERNEL_HWCAP_PMULL),
  3055		HWCAP_CAP(ID_AA64ISAR0_EL1, AES, AES, CAP_HWCAP, KERNEL_HWCAP_AES),
  3056		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA1, IMP, CAP_HWCAP, KERNEL_HWCAP_SHA1),
  3057		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA2, SHA256, CAP_HWCAP, KERNEL_HWCAP_SHA2),
  3058		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA2, SHA512, CAP_HWCAP, KERNEL_HWCAP_SHA512),
  3059		HWCAP_CAP(ID_AA64ISAR0_EL1, CRC32, IMP, CAP_HWCAP, KERNEL_HWCAP_CRC32),
  3060		HWCAP_CAP(ID_AA64ISAR0_EL1, ATOMIC, IMP, CAP_HWCAP, KERNEL_HWCAP_ATOMICS),
  3061		HWCAP_CAP(ID_AA64ISAR0_EL1, ATOMIC, FEAT_LSE128, CAP_HWCAP, KERNEL_HWCAP_LSE128),
  3062		HWCAP_CAP(ID_AA64ISAR0_EL1, RDM, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDRDM),
  3063		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SHA3),
  3064		HWCAP_CAP(ID_AA64ISAR0_EL1, SM3, IMP, CAP_HWCAP, KERNEL_HWCAP_SM3),
  3065		HWCAP_CAP(ID_AA64ISAR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SM4),
  3066		HWCAP_CAP(ID_AA64ISAR0_EL1, DP, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDDP),
  3067		HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDFHM),
  3068		HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM, CAP_HWCAP, KERNEL_HWCAP_FLAGM),
  3069		HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM2, CAP_HWCAP, KERNEL_HWCAP_FLAGM2),
  3070		HWCAP_CAP(ID_AA64ISAR0_EL1, RNDR, IMP, CAP_HWCAP, KERNEL_HWCAP_RNG),
  3071		HWCAP_CAP(ID_AA64PFR0_EL1, FP, IMP, CAP_HWCAP, KERNEL_HWCAP_FP),
  3072		HWCAP_CAP(ID_AA64PFR0_EL1, FP, FP16, CAP_HWCAP, KERNEL_HWCAP_FPHP),
  3073		HWCAP_CAP(ID_AA64PFR0_EL1, AdvSIMD, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMD),
  3074		HWCAP_CAP(ID_AA64PFR0_EL1, AdvSIMD, FP16, CAP_HWCAP, KERNEL_HWCAP_ASIMDHP),
  3075		HWCAP_CAP(ID_AA64PFR0_EL1, DIT, IMP, CAP_HWCAP, KERNEL_HWCAP_DIT),
  3076		HWCAP_CAP(ID_AA64PFR2_EL1, FPMR, IMP, CAP_HWCAP, KERNEL_HWCAP_FPMR),
  3077		HWCAP_CAP(ID_AA64ISAR1_EL1, DPB, IMP, CAP_HWCAP, KERNEL_HWCAP_DCPOP),
  3078		HWCAP_CAP(ID_AA64ISAR1_EL1, DPB, DPB2, CAP_HWCAP, KERNEL_HWCAP_DCPODP),
  3079		HWCAP_CAP(ID_AA64ISAR1_EL1, JSCVT, IMP, CAP_HWCAP, KERNEL_HWCAP_JSCVT),
  3080		HWCAP_CAP(ID_AA64ISAR1_EL1, FCMA, IMP, CAP_HWCAP, KERNEL_HWCAP_FCMA),
  3081		HWCAP_CAP(ID_AA64ISAR1_EL1, LRCPC, IMP, CAP_HWCAP, KERNEL_HWCAP_LRCPC),
  3082		HWCAP_CAP(ID_AA64ISAR1_EL1, LRCPC, LRCPC2, CAP_HWCAP, KERNEL_HWCAP_ILRCPC),
  3083		HWCAP_CAP(ID_AA64ISAR1_EL1, LRCPC, LRCPC3, CAP_HWCAP, KERNEL_HWCAP_LRCPC3),
  3084		HWCAP_CAP(ID_AA64ISAR1_EL1, FRINTTS, IMP, CAP_HWCAP, KERNEL_HWCAP_FRINT),
  3085		HWCAP_CAP(ID_AA64ISAR1_EL1, SB, IMP, CAP_HWCAP, KERNEL_HWCAP_SB),
  3086		HWCAP_CAP(ID_AA64ISAR1_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_BF16),
  3087		HWCAP_CAP(ID_AA64ISAR1_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_EBF16),
  3088		HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
  3089		HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
  3090		HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
  3091		HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
  3092		HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
  3093	#ifdef CONFIG_ARM64_SVE
  3094		HWCAP_CAP(ID_AA64PFR0_EL1, SVE, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE),
> 3095		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p1, CAP_HWCAP, KERNEL_HWCAP_SVE2P1),
  3096		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2, CAP_HWCAP, KERNEL_HWCAP_SVE2),
  3097		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, AES, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEAES),
  3098		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, AES, PMULL128, CAP_HWCAP, KERNEL_HWCAP_SVEPMULL),
  3099		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBITPERM),
  3100		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE_B16B16),
  3101		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBF16),
  3102		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_SVE_EBF16),
  3103		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESHA3),
  3104		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESM4),
  3105		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEI8MM),
  3106		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, F32MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF32MM),
  3107		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, F64MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF64MM),
  3108	#endif
  3109	#ifdef CONFIG_ARM64_GCS
  3110		HWCAP_CAP(ID_AA64PFR1_EL1, GCS, IMP, CAP_HWCAP, KERNEL_HWCAP_GCS),
  3111	#endif
  3112		HWCAP_CAP(ID_AA64PFR1_EL1, SSBS, SSBS2, CAP_HWCAP, KERNEL_HWCAP_SSBS),
  3113	#ifdef CONFIG_ARM64_BTI
  3114		HWCAP_CAP(ID_AA64PFR1_EL1, BT, IMP, CAP_HWCAP, KERNEL_HWCAP_BTI),
  3115	#endif
  3116	#ifdef CONFIG_ARM64_PTR_AUTH
  3117		HWCAP_MULTI_CAP(ptr_auth_hwcap_addr_matches, CAP_HWCAP, KERNEL_HWCAP_PACA),
  3118		HWCAP_MULTI_CAP(ptr_auth_hwcap_gen_matches, CAP_HWCAP, KERNEL_HWCAP_PACG),
  3119	#endif
  3120	#ifdef CONFIG_ARM64_MTE
  3121		HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
  3122		HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
  3123	#endif /* CONFIG_ARM64_MTE */
  3124		HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
  3125		HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
  3126		HWCAP_CAP(ID_AA64ISAR2_EL1, CSSC, IMP, CAP_HWCAP, KERNEL_HWCAP_CSSC),
  3127		HWCAP_CAP(ID_AA64ISAR2_EL1, RPRFM, IMP, CAP_HWCAP, KERNEL_HWCAP_RPRFM),
  3128		HWCAP_CAP(ID_AA64ISAR2_EL1, RPRES, IMP, CAP_HWCAP, KERNEL_HWCAP_RPRES),
  3129		HWCAP_CAP(ID_AA64ISAR2_EL1, WFxT, IMP, CAP_HWCAP, KERNEL_HWCAP_WFXT),
  3130		HWCAP_CAP(ID_AA64ISAR2_EL1, MOPS, IMP, CAP_HWCAP, KERNEL_HWCAP_MOPS),
  3131		HWCAP_CAP(ID_AA64ISAR2_EL1, BC, IMP, CAP_HWCAP, KERNEL_HWCAP_HBC),
  3132	#ifdef CONFIG_ARM64_SME
  3133		HWCAP_CAP(ID_AA64PFR1_EL1, SME, IMP, CAP_HWCAP, KERNEL_HWCAP_SME),
  3134		HWCAP_CAP(ID_AA64SMFR0_EL1, FA64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_FA64),
  3135		HWCAP_CAP(ID_AA64SMFR0_EL1, LUTv2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_LUTV2),
  3136		HWCAP_CAP(ID_AA64SMFR0_EL1, SMEver, SME2p1, CAP_HWCAP, KERNEL_HWCAP_SME2P1),
  3137		HWCAP_CAP(ID_AA64SMFR0_EL1, SMEver, SME2, CAP_HWCAP, KERNEL_HWCAP_SME2),
  3138		HWCAP_CAP(ID_AA64SMFR0_EL1, I16I64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_I16I64),
  3139		HWCAP_CAP(ID_AA64SMFR0_EL1, F64F64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F64F64),
  3140		HWCAP_CAP(ID_AA64SMFR0_EL1, I16I32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_I16I32),
  3141		HWCAP_CAP(ID_AA64SMFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_B16B16),
  3142		HWCAP_CAP(ID_AA64SMFR0_EL1, F16F16, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F16F16),
  3143		HWCAP_CAP(ID_AA64SMFR0_EL1, F8F16, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F8F16),
  3144		HWCAP_CAP(ID_AA64SMFR0_EL1, F8F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F8F32),
  3145		HWCAP_CAP(ID_AA64SMFR0_EL1, I8I32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_I8I32),
  3146		HWCAP_CAP(ID_AA64SMFR0_EL1, F16F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F16F32),
  3147		HWCAP_CAP(ID_AA64SMFR0_EL1, B16F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_B16F32),
  3148		HWCAP_CAP(ID_AA64SMFR0_EL1, BI32I32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_BI32I32),
  3149		HWCAP_CAP(ID_AA64SMFR0_EL1, F32F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F32F32),
  3150		HWCAP_CAP(ID_AA64SMFR0_EL1, SF8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8FMA),
  3151		HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP4),
  3152		HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP2),
  3153	#endif /* CONFIG_ARM64_SME */
  3154		HWCAP_CAP(ID_AA64FPFR0_EL1, F8CVT, IMP, CAP_HWCAP, KERNEL_HWCAP_F8CVT),
  3155		HWCAP_CAP(ID_AA64FPFR0_EL1, F8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_F8FMA),
  3156		HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP4),
  3157		HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
  3158		HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
  3159		HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
  3160	#ifdef CONFIG_ARM64_POE
  3161		HWCAP_CAP(ID_AA64MMFR3_EL1, S1POE, IMP, CAP_HWCAP, KERNEL_HWCAP_POE),
  3162	#endif
  3163		{},
  3164	};
  3165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
