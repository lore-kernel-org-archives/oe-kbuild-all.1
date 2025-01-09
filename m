Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2F82040BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429058; cv=none; b=UtHThGpgklrxr60tRNDymLAPAMmZZjaJGGfgLdRRPb6g95lsACwTPE7ttYelm5uHxh3eRHOvNHtxaL/Yp63kSmXLGFyzY1hrhygQjb9JkPgxc/9knUGtSQoJPKN3XJPb9MC8Om8mKvzieG0KBXpv3uKs9WkjDlM7Dn+JzZUbr/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429058; c=relaxed/simple;
	bh=NVkrwKZsAcfKDov1ABswec5CjJ4U/3KonBqdprjo2ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mxdryZyFmW1ACkKyuejK0m8ojif2naoSVOYb0BcmCrCKWyAl+fyaMYPBUDdqW3wIj4pXICAsEdlJMKFohvs2/U+vuYNfAIovMIo82QOohD5zmEjf0SQew1glPdySlWkXYEsjq4WeJ68f7P2OsB/6SVHo/PZwCgVzf999xryhKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ii6N/Tq7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ii6N/Tq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736429056; x=1767965056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NVkrwKZsAcfKDov1ABswec5CjJ4U/3KonBqdprjo2ZA=;
  b=Ii6N/Tq7PMVga0K0Ne5qabP/L77rfzah4aWBiirJgkmE1L8zkzGcmosm
   T0s8hY0r45Q+S5FNRwFqE5XgE2Bnf5kUOvPP14IXgOjPNK/r03gXRpqH1
   Xjut20Zp5Yiv8Alr34y4TVZahvebGNOA0ecbVbPAkkH9XfEIaXtA8SS1F
   zRAi+GcD8Urdly/+wIUrbWvAPQhh1/SPrm2ign4B13I0Y35e3Fm1/FytG
   1x4hZUyFY1v7blJBNt15uYXftNJHkmXwYwn5leC+J9xeiyqZ5c/ry5QVB
   +5H9wJgyA052KiEfhKFn/O1DF9Txz20Z6OsOw0qgixECM+VOR7Y14mHTv
   Q==;
X-CSE-ConnectionGUID: Oba66yP3TES8s7PVBqkj4w==
X-CSE-MsgGUID: vQTFzBMDRgWFLxyUjTX4uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36845942"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36845942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 05:24:15 -0800
X-CSE-ConnectionGUID: j3dm6GNyTfurETj8liJxDQ==
X-CSE-MsgGUID: 8KjCCYAPSPCGWEeOfr5vVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107444189"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2025 05:24:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVsWC-000HaJ-1W;
	Thu, 09 Jan 2025 13:24:12 +0000
Date: Thu, 9 Jan 2025 21:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:arm64-2024-dpisa 2/6]
 arch/arm64/kernel/cpufeature.c:3108:9: sparse: sparse: Initializer entry
 defined twice
Message-ID: <202501092107.b39Xqp1m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git arm64-2024-dpisa
head:   5b6a9d9c9576b8b21e34a6e6a9ce5696b139aa6e
commit: 23468d62ea6c4f3e0dbc6ebd1a38c5eb19aead3d [2/6] arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
config: arm64-randconfig-r131-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092107.b39Xqp1m-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250109/202501092107.b39Xqp1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092107.b39Xqp1m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/cpufeature.c:3108:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3108:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3109:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3109:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3110:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3110:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3111:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3111:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3112:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3112:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3113:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3113:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3114:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3114:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3115:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3115:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3116:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3116:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3117:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3117:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3118:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3118:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3119:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3119:9: sparse:   also defined here
   arch/arm64/kernel/cpufeature.c:3120:9: sparse: sparse: Initializer entry defined twice
   arch/arm64/kernel/cpufeature.c:3120:9: sparse:   also defined here

vim +3108 arch/arm64/kernel/cpufeature.c

  3065	
  3066	static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
  3067		HWCAP_CAP(ID_AA64ISAR0_EL1, AES, PMULL, CAP_HWCAP, KERNEL_HWCAP_PMULL),
  3068		HWCAP_CAP(ID_AA64ISAR0_EL1, AES, AES, CAP_HWCAP, KERNEL_HWCAP_AES),
  3069		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA1, IMP, CAP_HWCAP, KERNEL_HWCAP_SHA1),
  3070		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA2, SHA256, CAP_HWCAP, KERNEL_HWCAP_SHA2),
  3071		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA2, SHA512, CAP_HWCAP, KERNEL_HWCAP_SHA512),
  3072		HWCAP_CAP(ID_AA64ISAR0_EL1, CRC32, IMP, CAP_HWCAP, KERNEL_HWCAP_CRC32),
  3073		HWCAP_CAP(ID_AA64ISAR0_EL1, ATOMIC, IMP, CAP_HWCAP, KERNEL_HWCAP_ATOMICS),
  3074		HWCAP_CAP(ID_AA64ISAR0_EL1, ATOMIC, FEAT_LSE128, CAP_HWCAP, KERNEL_HWCAP_LSE128),
  3075		HWCAP_CAP(ID_AA64ISAR0_EL1, RDM, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDRDM),
  3076		HWCAP_CAP(ID_AA64ISAR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SHA3),
  3077		HWCAP_CAP(ID_AA64ISAR0_EL1, SM3, IMP, CAP_HWCAP, KERNEL_HWCAP_SM3),
  3078		HWCAP_CAP(ID_AA64ISAR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SM4),
  3079		HWCAP_CAP(ID_AA64ISAR0_EL1, DP, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDDP),
  3080		HWCAP_CAP(ID_AA64ISAR0_EL1, FHM, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMDFHM),
  3081		HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM, CAP_HWCAP, KERNEL_HWCAP_FLAGM),
  3082		HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM2, CAP_HWCAP, KERNEL_HWCAP_FLAGM2),
  3083		HWCAP_CAP(ID_AA64ISAR0_EL1, RNDR, IMP, CAP_HWCAP, KERNEL_HWCAP_RNG),
  3084		HWCAP_CAP(ID_AA64PFR0_EL1, FP, IMP, CAP_HWCAP, KERNEL_HWCAP_FP),
  3085		HWCAP_CAP(ID_AA64PFR0_EL1, FP, FP16, CAP_HWCAP, KERNEL_HWCAP_FPHP),
  3086		HWCAP_CAP(ID_AA64PFR0_EL1, AdvSIMD, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMD),
  3087		HWCAP_CAP(ID_AA64PFR0_EL1, AdvSIMD, FP16, CAP_HWCAP, KERNEL_HWCAP_ASIMDHP),
  3088		HWCAP_CAP(ID_AA64PFR0_EL1, DIT, IMP, CAP_HWCAP, KERNEL_HWCAP_DIT),
  3089		HWCAP_CAP(ID_AA64PFR2_EL1, FPMR, IMP, CAP_HWCAP, KERNEL_HWCAP_FPMR),
  3090		HWCAP_CAP(ID_AA64ISAR1_EL1, DPB, IMP, CAP_HWCAP, KERNEL_HWCAP_DCPOP),
  3091		HWCAP_CAP(ID_AA64ISAR1_EL1, DPB, DPB2, CAP_HWCAP, KERNEL_HWCAP_DCPODP),
  3092		HWCAP_CAP(ID_AA64ISAR1_EL1, JSCVT, IMP, CAP_HWCAP, KERNEL_HWCAP_JSCVT),
  3093		HWCAP_CAP(ID_AA64ISAR1_EL1, FCMA, IMP, CAP_HWCAP, KERNEL_HWCAP_FCMA),
  3094		HWCAP_CAP(ID_AA64ISAR1_EL1, LRCPC, IMP, CAP_HWCAP, KERNEL_HWCAP_LRCPC),
  3095		HWCAP_CAP(ID_AA64ISAR1_EL1, LRCPC, LRCPC2, CAP_HWCAP, KERNEL_HWCAP_ILRCPC),
  3096		HWCAP_CAP(ID_AA64ISAR1_EL1, LRCPC, LRCPC3, CAP_HWCAP, KERNEL_HWCAP_LRCPC3),
  3097		HWCAP_CAP(ID_AA64ISAR1_EL1, FRINTTS, IMP, CAP_HWCAP, KERNEL_HWCAP_FRINT),
  3098		HWCAP_CAP(ID_AA64ISAR1_EL1, SB, IMP, CAP_HWCAP, KERNEL_HWCAP_SB),
  3099		HWCAP_CAP(ID_AA64ISAR1_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_BF16),
  3100		HWCAP_CAP(ID_AA64ISAR1_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_EBF16),
  3101		HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
  3102		HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
  3103		HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
  3104		HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
  3105		HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
  3106	#ifdef CONFIG_ARM64_SVE
  3107		HWCAP_CAP(ID_AA64PFR0_EL1, SVE, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE),
> 3108		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2p1, CAP_HWCAP, KERNEL_HWCAP_SVE2P1),
  3109		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SVEver, SVE2, CAP_HWCAP, KERNEL_HWCAP_SVE2),
  3110		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, AES, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEAES),
  3111		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, AES, PMULL128, CAP_HWCAP, KERNEL_HWCAP_SVEPMULL),
  3112		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBITPERM),
  3113		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE_B16B16),
  3114		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEBF16),
  3115		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, BF16, EBF16, CAP_HWCAP, KERNEL_HWCAP_SVE_EBF16),
  3116		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SHA3, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESHA3),
  3117		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, SM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SVESM4),
  3118		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEI8MM),
  3119		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, F32MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF32MM),
  3120		HWCAP_CAP_MATCH_ID(has_sve_feature, ID_AA64ZFR0_EL1, F64MM, IMP, CAP_HWCAP, KERNEL_HWCAP_SVEF64MM),
  3121	#endif
  3122	#ifdef CONFIG_ARM64_GCS
  3123		HWCAP_CAP(ID_AA64PFR1_EL1, GCS, IMP, CAP_HWCAP, KERNEL_HWCAP_GCS),
  3124	#endif
  3125		HWCAP_CAP(ID_AA64PFR1_EL1, SSBS, SSBS2, CAP_HWCAP, KERNEL_HWCAP_SSBS),
  3126	#ifdef CONFIG_ARM64_BTI
  3127		HWCAP_CAP(ID_AA64PFR1_EL1, BT, IMP, CAP_HWCAP, KERNEL_HWCAP_BTI),
  3128	#endif
  3129	#ifdef CONFIG_ARM64_PTR_AUTH
  3130		HWCAP_MULTI_CAP(ptr_auth_hwcap_addr_matches, CAP_HWCAP, KERNEL_HWCAP_PACA),
  3131		HWCAP_MULTI_CAP(ptr_auth_hwcap_gen_matches, CAP_HWCAP, KERNEL_HWCAP_PACG),
  3132	#endif
  3133	#ifdef CONFIG_ARM64_MTE
  3134		HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
  3135		HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
  3136	#endif /* CONFIG_ARM64_MTE */
  3137		HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
  3138		HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
  3139		HWCAP_CAP(ID_AA64ISAR2_EL1, CSSC, IMP, CAP_HWCAP, KERNEL_HWCAP_CSSC),
  3140		HWCAP_CAP(ID_AA64ISAR2_EL1, RPRFM, IMP, CAP_HWCAP, KERNEL_HWCAP_RPRFM),
  3141		HWCAP_CAP(ID_AA64ISAR2_EL1, RPRES, IMP, CAP_HWCAP, KERNEL_HWCAP_RPRES),
  3142		HWCAP_CAP(ID_AA64ISAR2_EL1, WFxT, IMP, CAP_HWCAP, KERNEL_HWCAP_WFXT),
  3143		HWCAP_CAP(ID_AA64ISAR2_EL1, MOPS, IMP, CAP_HWCAP, KERNEL_HWCAP_MOPS),
  3144		HWCAP_CAP(ID_AA64ISAR2_EL1, BC, IMP, CAP_HWCAP, KERNEL_HWCAP_HBC),
  3145	#ifdef CONFIG_ARM64_SME
  3146		HWCAP_CAP(ID_AA64PFR1_EL1, SME, IMP, CAP_HWCAP, KERNEL_HWCAP_SME),
  3147		HWCAP_CAP(ID_AA64SMFR0_EL1, FA64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_FA64),
  3148		HWCAP_CAP(ID_AA64SMFR0_EL1, LUTv2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_LUTV2),
  3149		HWCAP_CAP(ID_AA64SMFR0_EL1, SMEver, SME2p1, CAP_HWCAP, KERNEL_HWCAP_SME2P1),
  3150		HWCAP_CAP(ID_AA64SMFR0_EL1, SMEver, SME2, CAP_HWCAP, KERNEL_HWCAP_SME2),
  3151		HWCAP_CAP(ID_AA64SMFR0_EL1, I16I64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_I16I64),
  3152		HWCAP_CAP(ID_AA64SMFR0_EL1, F64F64, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F64F64),
  3153		HWCAP_CAP(ID_AA64SMFR0_EL1, I16I32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_I16I32),
  3154		HWCAP_CAP(ID_AA64SMFR0_EL1, B16B16, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_B16B16),
  3155		HWCAP_CAP(ID_AA64SMFR0_EL1, F16F16, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F16F16),
  3156		HWCAP_CAP(ID_AA64SMFR0_EL1, F8F16, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F8F16),
  3157		HWCAP_CAP(ID_AA64SMFR0_EL1, F8F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F8F32),
  3158		HWCAP_CAP(ID_AA64SMFR0_EL1, I8I32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_I8I32),
  3159		HWCAP_CAP(ID_AA64SMFR0_EL1, F16F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F16F32),
  3160		HWCAP_CAP(ID_AA64SMFR0_EL1, B16F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_B16F32),
  3161		HWCAP_CAP(ID_AA64SMFR0_EL1, BI32I32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_BI32I32),
  3162		HWCAP_CAP(ID_AA64SMFR0_EL1, F32F32, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_F32F32),
  3163		HWCAP_CAP(ID_AA64SMFR0_EL1, SF8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8FMA),
  3164		HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP4),
  3165		HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP2),
  3166	#endif /* CONFIG_ARM64_SME */
  3167		HWCAP_CAP(ID_AA64FPFR0_EL1, F8CVT, IMP, CAP_HWCAP, KERNEL_HWCAP_F8CVT),
  3168		HWCAP_CAP(ID_AA64FPFR0_EL1, F8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_F8FMA),
  3169		HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP4),
  3170		HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
  3171		HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
  3172		HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
  3173	#ifdef CONFIG_ARM64_POE
  3174		HWCAP_CAP(ID_AA64MMFR3_EL1, S1POE, IMP, CAP_HWCAP, KERNEL_HWCAP_POE),
  3175	#endif
  3176		{},
  3177	};
  3178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
