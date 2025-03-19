Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9129199E80
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742420263; cv=none; b=cuntumm5zcG5SAqLW5Hk9zL+GxDEXI1uZr6AEMjuoGNKrdkJbbMhE7jPbtrdZNtJxIsdr+Hqj3GY1iVnhTFoewnAdahMkwcDla7ty8am/o2MhI2poRmbZe+Z+BhQJ+d6HVuVCgual1Ef+C+ds+MJ7B46oSz8vWgBsdRRaGcO/78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742420263; c=relaxed/simple;
	bh=Fv/9H9A5vpLGgIdpow49DU1aLn4HpwE4hnCWQxAbZus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1onC/VhyI3XOVOUAXcA/JrvxkNGMmsDFUerZL0Dekc3yTTgYQCx1NYR9RLRkeAjEHl5yss4Ly69xwshotEE6Mw7ExVMpLSqHj9b1vmhzV89zew1bEgIYpDvOThv5rXVEfTDIb2z3jaWFRnkccbaFCKSa23zGFz+i9R2h4z49aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6Im1IRh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6Im1IRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742420261; x=1773956261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fv/9H9A5vpLGgIdpow49DU1aLn4HpwE4hnCWQxAbZus=;
  b=k6Im1IRhaM5bld0MbX8s8URE2mYQt9y6h9Ftx7Zc+D1FVLpc9OpHwWZm
   M4IIAgFKyWBJTpddi9Xs9vOdBeVHuwP1aVoiUOQUwTj73mJNoNJIaMM6U
   YzGXcOqULWSj2nyu82UWktU1PK+Y0I69DMmw/PFw/xIi/3/LhtjfRaMVA
   nh3jvozNAu2uos8Uitmwpn/HBjmrZqZpigl/TH4ISl3fUsshoY+ioI9B0
   M5cVfk41FKSLjk2hjvwMBmxwgn7tndnRNTmGb7pfZGyA7qfmq0z2hhIXQ
   fFSoJR/aVNlBDETacQJyeCWnGyVekPqrTgcc/9evt3/psAYXJ/64TImAb
   Q==;
X-CSE-ConnectionGUID: +tyXM1XwRTS9tQPUDsIKPw==
X-CSE-MsgGUID: evkfJVstSYCGRWf9elYbJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43816154"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43816154"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 14:37:40 -0700
X-CSE-ConnectionGUID: jmczO8iETw24WxZtsp0pwA==
X-CSE-MsgGUID: YRUQRhj0TTuWLsOCGhLW/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="127008719"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Mar 2025 14:37:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv16S-000FgK-0D;
	Wed, 19 Mar 2025 21:37:34 +0000
Date: Thu, 20 Mar 2025 05:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/plat2faux_dev 4/8]
 arch/arm64/include/asm/archrandom.h:93: undefined reference to
 `smccc_trng_available'
Message-ID: <202503200548.dRZWVF3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/plat2faux_dev
head:   acb88ecc2349693935568a8ae12519ce0aed026f
commit: 920714c9879668d4bde1b514ee937027809b3cbb [4/8] hwrng: arm-smccc-trng - transition to the faux device interface
config: arm64-randconfig-004-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200548.dRZWVF3C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200548.dRZWVF3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200548.dRZWVF3C-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/char/random.o: in function `arch_get_random_seed_longs':
>> arch/arm64/include/asm/archrandom.h:93: undefined reference to `smccc_trng_available'
   aarch64-linux-ld: drivers/char/random.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `smccc_trng_available' which may bind externally can not be used when making a shared object; recompile with -fPIC
   arch/arm64/include/asm/archrandom.h:93:(.text+0xbf0): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: arch/arm64/include/asm/archrandom.h:93: undefined reference to `smccc_trng_available'
>> aarch64-linux-ld: arch/arm64/include/asm/archrandom.h:93: undefined reference to `smccc_trng_available'


vim +93 arch/arm64/include/asm/archrandom.h

1a50ec0b3b2e9a8 Richard Henderson  2020-01-21   81  
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   82  static inline size_t __must_check arch_get_random_seed_longs(unsigned long *v, size_t max_longs)
1a50ec0b3b2e9a8 Richard Henderson  2020-01-21   83  {
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   84  	if (!max_longs)
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   85  		return 0;
38db987316a38a3 Andre Przywara     2021-01-06   86  
38db987316a38a3 Andre Przywara     2021-01-06   87  	/*
38db987316a38a3 Andre Przywara     2021-01-06   88  	 * We prefer the SMCCC call, since its semantics (return actual
38db987316a38a3 Andre Przywara     2021-01-06   89  	 * hardware backed entropy) is closer to the idea behind this
38db987316a38a3 Andre Przywara     2021-01-06   90  	 * function here than what even the RNDRSS register provides
38db987316a38a3 Andre Przywara     2021-01-06   91  	 * (the output of a pseudo RNG freshly seeded by a TRNG).
38db987316a38a3 Andre Przywara     2021-01-06   92  	 */
38db987316a38a3 Andre Przywara     2021-01-06  @93  	if (smccc_trng_available) {
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   94  		struct arm_smccc_res res;
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   95  
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   96  		max_longs = min_t(size_t, 3, max_longs);
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   97  		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, max_longs * 64, &res);
38db987316a38a3 Andre Przywara     2021-01-06   98  		if ((int)res.a0 >= 0) {
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17   99  			switch (max_longs) {
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  100  			case 3:
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  101  				*v++ = res.a1;
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  102  				fallthrough;
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  103  			case 2:
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  104  				*v++ = res.a2;
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  105  				fallthrough;
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  106  			case 1:
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  107  				*v++ = res.a3;
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  108  				break;
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  109  			}
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  110  			return max_longs;
38db987316a38a3 Andre Przywara     2021-01-06  111  		}
38db987316a38a3 Andre Przywara     2021-01-06  112  	}
38db987316a38a3 Andre Przywara     2021-01-06  113  
1a50ec0b3b2e9a8 Richard Henderson  2020-01-21  114  	/*
35bde68bba54135 Ard Biesheuvel     2022-01-13  115  	 * RNDRRS is not backed by an entropy source but by a DRBG that is
35bde68bba54135 Ard Biesheuvel     2022-01-13  116  	 * reseeded after each invocation. This is not a 100% fit but good
35bde68bba54135 Ard Biesheuvel     2022-01-13  117  	 * enough to implement this API if no other entropy source exists.
1a50ec0b3b2e9a8 Richard Henderson  2020-01-21  118  	 */
2c03e16f44993d4 Jason A. Donenfeld 2022-10-29  119  	if (__cpu_has_rng() && __arm64_rndrrs(v))
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  120  		return 1;
1a50ec0b3b2e9a8 Richard Henderson  2020-01-21  121  
d349ab99eec7ab0 Jason A. Donenfeld 2022-07-17  122  	return 0;
1a50ec0b3b2e9a8 Richard Henderson  2020-01-21  123  }
1a50ec0b3b2e9a8 Richard Henderson  2020-01-21  124  

:::::: The code at line 93 was first introduced by commit
:::::: 38db987316a38a3fe55ff7f5f4653fcb520a9d26 arm64: Add support for SMCCC TRNG entropy source

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
