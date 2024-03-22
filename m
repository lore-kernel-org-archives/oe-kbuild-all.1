Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9869D0A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711142020; cv=none; b=VhcDSXrHwqxONrpwR1+9/UNfuT3vQklSvbt5ADEgLBsxop033/dJJaJ2G1NYfimrbdUxcYx95tb1FXJAFwHBZwjsjH0Rhzz2ucccTBe/q7KTDauOeqNSsvpR+xDDHXtqVvPhdQfTyft2Lx77Hgu3Ecz51Vs/yWtGFAEkXz9CI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711142020; c=relaxed/simple;
	bh=UlVS8PqXmqiEteT2PyxqjbwoERRGo5aaUCUFMDmahlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkFkTtqr7UhO6zBnmqMrAEa/RYk03vk2UHn5BsK6Y1D9/aYsvQqMP6Qye+3vvR+vI1j5xoDpgpESYzK3QqrOke/50j4MU+J246opJp0k/0zSSE3xjifSdxjsiaFTxW3WsIeat0K7wmrGlR4RpvQD2h3dhgSpJMf9IKyx3xDfnck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTdX+hDi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTdX+hDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711142019; x=1742678019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UlVS8PqXmqiEteT2PyxqjbwoERRGo5aaUCUFMDmahlE=;
  b=TTdX+hDiBNAqjSUz18XNOrVbc1XZUdinNXMF2w8Bj5eRvREWttFJ4JnW
   wcLI7sHTfAqTlJ4zEvyl1DHZQv1flOd+BvBxN2Y+cxuqyF7NGoc8+zjnE
   yJpkhiC/ES/ElTDPsbv33cjZShUdxfTUtKk+C7/lbGURM432l9oTjMaiZ
   eRHTw6GQ9CZjCLoDQSfabKQuDlHokgerT372ZcUUkrQSHDlR9JiHLj/cL
   gj1lLLRItMlVQtKsLb9rm5qno6MxomFVS95SRuGx4ddnI+8lHpWEP8xdP
   MW8UTYLEfmGHu8hvlnYd+3G8iDaOcYMDqHx2eOgd5RWQfaBhCmLOqzQaB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6039772"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6039772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 14:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="14945506"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2024 14:13:36 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnmCk-000KcV-24;
	Fri, 22 Mar 2024 21:13:34 +0000
Date: Sat, 23 Mar 2024 05:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/kvm_mpam_fix/v3 2/6]
 arch/arm64/kernel/cpufeature.c:205:13: warning: 'cpu_enable_cnp' used but
 never defined
Message-ID: <202403230511.lwfbQTel-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/kvm_mpam_fix/v3
head:   efef6777cd47f54b38b9f5c02a0d891eb54ce198
commit: 66e08b376a3230bc60f56dd9b7127a65d70fe32c [2/6] arm64: cpufeature: discover CPU support for MPAM
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240323/202403230511.lwfbQTel-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230511.lwfbQTel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230511.lwfbQTel-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c:177:9: note: in expansion of macro '__ARM64_CPUID_FIELDS'
     177 |         __ARM64_CPUID_FIELDS(reg, field,                                \
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2931:17: note: in expansion of macro 'ARM64_CPUID_FIELDS_NEG'
    2931 |                 ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:33: warning: excess elements in scalar initializer
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   arch/arm64/kernel/cpufeature.c:156:36: note: in definition of macro '__ARM64_CPUID_FIELDS'
     156 |                 .min_field_value = min_value,                           \
         |                                    ^~~~~~~~~
   arch/arm64/kernel/cpufeature.c:149:43: note: in expansion of macro 'BIT'
     149 | #define __ARM64_MIN_NEGATIVE(reg, field)  BIT(reg##_##field##_WIDTH - 1)
         |                                           ^~~
   arch/arm64/kernel/cpufeature.c:178:30: note: in expansion of macro '__ARM64_MIN_NEGATIVE'
     178 |                              __ARM64_MIN_NEGATIVE(reg, field),          \
         |                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2931:17: note: in expansion of macro 'ARM64_CPUID_FIELDS_NEG'
    2931 |                 ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:33: note: (near initialization for 'arm64_features[57].<anonymous>.<anonymous>.hwcap_type')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   arch/arm64/kernel/cpufeature.c:156:36: note: in definition of macro '__ARM64_CPUID_FIELDS'
     156 |                 .min_field_value = min_value,                           \
         |                                    ^~~~~~~~~
   arch/arm64/kernel/cpufeature.c:149:43: note: in expansion of macro 'BIT'
     149 | #define __ARM64_MIN_NEGATIVE(reg, field)  BIT(reg##_##field##_WIDTH - 1)
         |                                           ^~~
   arch/arm64/kernel/cpufeature.c:178:30: note: in expansion of macro '__ARM64_MIN_NEGATIVE'
     178 |                              __ARM64_MIN_NEGATIVE(reg, field),          \
         |                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2931:17: note: in expansion of macro 'ARM64_CPUID_FIELDS_NEG'
    2931 |                 ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:157:17: error: field name not in record or union initializer
     157 |                 .max_field_value = max_value,
         |                 ^
   arch/arm64/kernel/cpufeature.c:177:9: note: in expansion of macro '__ARM64_CPUID_FIELDS'
     177 |         __ARM64_CPUID_FIELDS(reg, field,                                \
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2931:17: note: in expansion of macro 'ARM64_CPUID_FIELDS_NEG'
    2931 |                 ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:157:17: note: (near initialization for 'arm64_features[57].<anonymous>.<anonymous>.hwcap_type')
     157 |                 .max_field_value = max_value,
         |                 ^
   arch/arm64/kernel/cpufeature.c:177:9: note: in expansion of macro '__ARM64_CPUID_FIELDS'
     177 |         __ARM64_CPUID_FIELDS(reg, field,                                \
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2931:17: note: in expansion of macro 'ARM64_CPUID_FIELDS_NEG'
    2931 |                 ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/vdso/const.h:7:25: warning: excess elements in scalar initializer
       7 | #define UL(x)           (_UL(x))
         |                         ^
   arch/arm64/kernel/cpufeature.c:157:36: note: in definition of macro '__ARM64_CPUID_FIELDS'
     157 |                 .max_field_value = max_value,
         |                                    ^~~~~~~~~
   ./arch/arm64/include/generated/asm/sysreg-defs.h:3603:57: note: in expansion of macro 'UL'
    3603 | #define ID_AA64MMFR4_EL1_E2H0_NI_NV1                    UL(0b1110)
         |                                                         ^~
   arch/arm64/include/asm/sysreg.h:1192:49: note: in expansion of macro 'ID_AA64MMFR4_EL1_E2H0_NI_NV1'
    1192 | #define SYS_FIELD_VALUE(reg, field, val)        reg##_##field##_##val
         |                                                 ^~~
   arch/arm64/kernel/cpufeature.c:179:30: note: in expansion of macro 'SYS_FIELD_VALUE'
     179 |                              SYS_FIELD_VALUE(reg, field, max_value))
         |                              ^~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2931:17: note: in expansion of macro 'ARM64_CPUID_FIELDS_NEG'
    2931 |                 ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/vdso/const.h:7:25: note: (near initialization for 'arm64_features[57].<anonymous>.<anonymous>.hwcap_type')
       7 | #define UL(x)           (_UL(x))
         |                         ^
   arch/arm64/kernel/cpufeature.c:157:36: note: in definition of macro '__ARM64_CPUID_FIELDS'
     157 |                 .max_field_value = max_value,
         |                                    ^~~~~~~~~
   ./arch/arm64/include/generated/asm/sysreg-defs.h:3603:57: note: in expansion of macro 'UL'
    3603 | #define ID_AA64MMFR4_EL1_E2H0_NI_NV1                    UL(0b1110)
         |                                                         ^~
   arch/arm64/include/asm/sysreg.h:1192:49: note: in expansion of macro 'ID_AA64MMFR4_EL1_E2H0_NI_NV1'
    1192 | #define SYS_FIELD_VALUE(reg, field, val)        reg##_##field##_##val
         |                                                 ^~~
   arch/arm64/kernel/cpufeature.c:179:30: note: in expansion of macro 'SYS_FIELD_VALUE'
     179 |                              SYS_FIELD_VALUE(reg, field, max_value))
         |                              ^~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2931:17: note: in expansion of macro 'ARM64_CPUID_FIELDS_NEG'
    2931 |                 ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2933:9: warning: braces around scalar initializer
    2933 |         {},
         |         ^
   arch/arm64/kernel/cpufeature.c:2933:9: note: (near initialization for 'arm64_features[57].<anonymous>.<anonymous>.sign')
   arch/arm64/kernel/cpufeature.c:2934:2: error: expected '}' before ';' token
    2934 | };
         |  ^
   arch/arm64/kernel/cpufeature.c:2421:63: note: to match this '{'
    2421 | static const struct arm64_cpu_capabilities arm64_features[] = {
         |                                                               ^
>> arch/arm64/kernel/cpufeature.c:205:13: warning: 'cpu_enable_cnp' used but never defined
     205 | static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
         |             ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:207:13: warning: '__system_matches_cap' used but never defined
     207 | static bool __system_matches_cap(unsigned int n);
         |             ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:1068:20: warning: 'setup_boot_cpu_capabilities' declared 'static' but never defined [-Wunused-function]
    1068 | static void __init setup_boot_cpu_capabilities(void);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2410:13: warning: 'mpam_extra_caps' defined but not used [-Wunused-function]
    2410 | static void mpam_extra_caps(void)
         |             ^~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2380:1: warning: 'cpucap_panic_on_conflict' defined but not used [-Wunused-function]
    2380 | cpucap_panic_on_conflict(const struct arm64_cpu_capabilities *cap)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2374:1: warning: 'cpucap_late_cpu_permitted' defined but not used [-Wunused-function]
    2374 | cpucap_late_cpu_permitted(const struct arm64_cpu_capabilities *cap)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2368:1: warning: 'cpucap_late_cpu_optional' defined but not used [-Wunused-function]
    2368 | cpucap_late_cpu_optional(const struct arm64_cpu_capabilities *cap)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2336:13: warning: 'elf_hwcap_fixup' defined but not used [-Wunused-function]
    2336 | static void elf_hwcap_fixup(void)
         |             ^~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2325:13: warning: 'user_feature_fixup' defined but not used [-Wunused-function]
    2325 | static void user_feature_fixup(void)
         |             ^~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:1964:20: warning: 'kpti_install_ng_mappings' defined but not used [-Wunused-function]
    1964 | static void __init kpti_install_ng_mappings(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:1605:1: warning: 'has_user_cpuid_feature' defined but not used [-Wunused-function]
    1605 | has_user_cpuid_feature(const struct arm64_cpu_capabilities *entry, int scope)
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:1062:20: warning: 'init_cpucap_indirect_list' defined but not used [-Wunused-function]
    1062 | static void __init init_cpucap_indirect_list(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bsearch.h:5,
                    from arch/arm64/kernel/cpufeature.c:65:
   arch/arm64/kernel/cpufeature.c:97:23: warning: 'elf_hwcap' defined but not used [-Wunused-variable]
      97 | static DECLARE_BITMAP(elf_hwcap, MAX_CPU_FEATURES) __read_mostly;
         |                       ^~~~~~~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~


vim +/cpu_enable_cnp +205 arch/arm64/kernel/cpufeature.c

d9a065914dccce Marc Zyngier      2024-01-22  150  
d9a065914dccce Marc Zyngier      2024-01-22  151  #define __ARM64_CPUID_FIELDS(reg, field, min_value, max_value)		\
876e3c8efe79d7 Mark Brown        2023-04-12  152  		.sys_reg = SYS_##reg,					\
876e3c8efe79d7 Mark Brown        2023-04-12  153  		.field_pos = reg##_##field##_SHIFT,			\
876e3c8efe79d7 Mark Brown        2023-04-12  154  		.field_width = reg##_##field##_WIDTH,			\
876e3c8efe79d7 Mark Brown        2023-04-12  155  		.sign = reg##_##field##_SIGNED,				\
d9a065914dccce Marc Zyngier      2024-01-22  156  		.min_field_value = min_value,				\
d9a065914dccce Marc Zyngier      2024-01-22  157  		.max_field_value = max_value,
d9a065914dccce Marc Zyngier      2024-01-22  158  
d9a065914dccce Marc Zyngier      2024-01-22  159  /*
d9a065914dccce Marc Zyngier      2024-01-22  160   * ARM64_CPUID_FIELDS() encodes a field with a range from min_value to
d9a065914dccce Marc Zyngier      2024-01-22  161   * an implicit maximum that depends on the sign-ess of the field.
d9a065914dccce Marc Zyngier      2024-01-22  162   *
d9a065914dccce Marc Zyngier      2024-01-22  163   * An unsigned field will be capped at all ones, while a signed field
d9a065914dccce Marc Zyngier      2024-01-22  164   * will be limited to the positive half only.
d9a065914dccce Marc Zyngier      2024-01-22  165   */
d9a065914dccce Marc Zyngier      2024-01-22  166  #define ARM64_CPUID_FIELDS(reg, field, min_value)			\
d9a065914dccce Marc Zyngier      2024-01-22  167  	__ARM64_CPUID_FIELDS(reg, field,				\
d9a065914dccce Marc Zyngier      2024-01-22  168  			     SYS_FIELD_VALUE(reg, field, min_value),	\
d9a065914dccce Marc Zyngier      2024-01-22  169  			     __ARM64_MAX_POSITIVE(reg, field))
d9a065914dccce Marc Zyngier      2024-01-22  170  
d9a065914dccce Marc Zyngier      2024-01-22  171  /*
d9a065914dccce Marc Zyngier      2024-01-22  172   * ARM64_CPUID_FIELDS_NEG() encodes a field with a range from an
d9a065914dccce Marc Zyngier      2024-01-22  173   * implicit minimal value to max_value. This should be used when
d9a065914dccce Marc Zyngier      2024-01-22  174   * matching a non-implemented property.
d9a065914dccce Marc Zyngier      2024-01-22  175   */
d9a065914dccce Marc Zyngier      2024-01-22  176  #define ARM64_CPUID_FIELDS_NEG(reg, field, max_value)			\
d9a065914dccce Marc Zyngier      2024-01-22  177  	__ARM64_CPUID_FIELDS(reg, field,				\
d9a065914dccce Marc Zyngier      2024-01-22  178  			     __ARM64_MIN_NEGATIVE(reg, field),		\
d9a065914dccce Marc Zyngier      2024-01-22  179  			     SYS_FIELD_VALUE(reg, field, max_value))
876e3c8efe79d7 Mark Brown        2023-04-12  180  
fe4fbdbcddeaab Suzuki K Poulose  2017-01-09  181  #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
3c739b57108436 Suzuki K. Poulose 2015-10-19  182  	{						\
4f0a606bce5ecd Suzuki K. Poulose 2015-11-18  183  		.sign = SIGNED,				\
fe4fbdbcddeaab Suzuki K Poulose  2017-01-09  184  		.visible = VISIBLE,			\
3c739b57108436 Suzuki K. Poulose 2015-10-19  185  		.strict = STRICT,			\
3c739b57108436 Suzuki K. Poulose 2015-10-19  186  		.type = TYPE,				\
3c739b57108436 Suzuki K. Poulose 2015-10-19  187  		.shift = SHIFT,				\
3c739b57108436 Suzuki K. Poulose 2015-10-19  188  		.width = WIDTH,				\
3c739b57108436 Suzuki K. Poulose 2015-10-19  189  		.safe_val = SAFE_VAL,			\
3c739b57108436 Suzuki K. Poulose 2015-10-19  190  	}
3c739b57108436 Suzuki K. Poulose 2015-10-19  191  
0710cfdb8db674 Suzuki K Poulose  2016-01-26  192  /* Define a feature with unsigned values */
fe4fbdbcddeaab Suzuki K Poulose  2017-01-09  193  #define ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
fe4fbdbcddeaab Suzuki K Poulose  2017-01-09  194  	__ARM64_FTR_BITS(FTR_UNSIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
4f0a606bce5ecd Suzuki K. Poulose 2015-11-18  195  
0710cfdb8db674 Suzuki K Poulose  2016-01-26  196  /* Define a feature with a signed value */
fe4fbdbcddeaab Suzuki K Poulose  2017-01-09  197  #define S_ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
fe4fbdbcddeaab Suzuki K Poulose  2017-01-09  198  	__ARM64_FTR_BITS(FTR_SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
0710cfdb8db674 Suzuki K Poulose  2016-01-26  199  
3c739b57108436 Suzuki K. Poulose 2015-10-19  200  #define ARM64_FTR_END					\
3c739b57108436 Suzuki K. Poulose 2015-10-19  201  	{						\
3c739b57108436 Suzuki K. Poulose 2015-10-19  202  		.width = 0,				\
3c739b57108436 Suzuki K. Poulose 2015-10-19  203  	}
3c739b57108436 Suzuki K. Poulose 2015-10-19  204  
5ffdfaedfa0aba Vladimir Murzin   2018-07-31 @205  static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
705441960033e6 James Morse       2016-02-05  206  

:::::: The code at line 205 was first introduced by commit
:::::: 5ffdfaedfa0aba3f5db0fbb8ed4f3192be2b39b8 arm64: mm: Support Common Not Private translations

:::::: TO: Vladimir Murzin <vladimir.murzin@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
