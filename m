Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785811A23B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231739; cv=none; b=NzX6azRq8qvtf7TfHB/mkGlLBvYg8uBEc5ILyylaDdFkro6ivM12PPEyT17D1Izg07XNEkQ/st9+heoo/9f2ZK+rEetHn3Ns+actYLtms2dUPFT0zFz/6Zcjb1bgZLpdeIJb5R5Nz7yIrGIR80h1eQwnRa6CPA1v8JRJEWon9xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231739; c=relaxed/simple;
	bh=4r+YZjdljRDKGqoL4MRRCuUwHED8b1EMKjvC3dSE1cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vxae9lReinpE4wUc9x2j1qdJxhNVoXK/ThjvG4Lmxe8e7k3WQGLmkmerza0Na7LR4uxdZCztEO0Jww+5w8SZcQyGL4hJ3qfVbZRh9s/PGhN8zMfFsqTCWnzHDuFRhXvTR/BOyV4g251xgXvwmwiRlmS6M7Qel5yp12AmVKHQ8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLbZaLiM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLbZaLiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742231737; x=1773767737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4r+YZjdljRDKGqoL4MRRCuUwHED8b1EMKjvC3dSE1cs=;
  b=ZLbZaLiMTuRKa1ogU04wY6eR5ie/mbb+amhJvOEs4xcPwCZI8VzM9mYo
   uqToDnKsi1bE0Cg15YwzUn2uhgb0/opfGAEX3lrf5DSDpdhDPmki4DtWE
   fUkhsJtP9uLskegmeF4It8iUXDRabvGUGbYhYdkS41kGxAaKTiYX7f/jf
   6HxPqqAEhSz2VFMfduROoxBWcSaN6MDqs84GWJtGQxwZoW8dTujCH/m8S
   oP8RMfziQEYJ2qVNMCFnOD+qA4nG1QKQNEVAr+Fe3ukT4gbID6rhpFiki
   0iZ+8jlbZZaJ99TuUik3KUpZ1oLMSQrCypeCYjb/gwWRIFM+lCh0DfGiG
   A==;
X-CSE-ConnectionGUID: oAzku3HSQt+nk9qjdDm0Sw==
X-CSE-MsgGUID: pika8sAOSRCJY17143a8xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54335103"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="54335103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:15:35 -0700
X-CSE-ConnectionGUID: WtdMIRHvTX+u8ogeJYt0pg==
X-CSE-MsgGUID: 8Ntaia7fRQibuxkz+Z5iiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121955451"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2025 10:15:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuE3o-000Cyb-0Z;
	Mon, 17 Mar 2025 17:15:32 +0000
Date: Tue, 18 Mar 2025 01:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/plat2faux_dev 3/10]
 arch/arm64/include/asm/archrandom.h:93:undefined reference to
 `smccc_trng_available'
Message-ID: <202503180130.eZCLxXqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/plat2faux_dev
head:   311808e89f691de1648385823ca10d4bcdd72ea0
commit: 956d963234312b4891386248ca1feef218a9fb3b [3/10] hwrng: arm-smccc-trng - transition to the faux device interface
config: arm64-randconfig-001-20250317 (https://download.01.org/0day-ci/archive/20250318/202503180130.eZCLxXqV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180130.eZCLxXqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180130.eZCLxXqV-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/char/random.o: in function `arch_get_random_seed_longs':
>> arch/arm64/include/asm/archrandom.h:93:(.text+0x714): undefined reference to `smccc_trng_available'
   aarch64-linux-ld: drivers/char/random.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `smccc_trng_available' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> arch/arm64/include/asm/archrandom.h:93:(.text+0x714): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: arch/arm64/include/asm/archrandom.h:93:(.text+0x71c): undefined reference to `smccc_trng_available'


vim +93 arch/arm64/include/asm/archrandom.h

1a50ec0b3b2e9a Richard Henderson  2020-01-21   81  
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   82  static inline size_t __must_check arch_get_random_seed_longs(unsigned long *v, size_t max_longs)
1a50ec0b3b2e9a Richard Henderson  2020-01-21   83  {
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   84  	if (!max_longs)
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   85  		return 0;
38db987316a38a Andre Przywara     2021-01-06   86  
38db987316a38a Andre Przywara     2021-01-06   87  	/*
38db987316a38a Andre Przywara     2021-01-06   88  	 * We prefer the SMCCC call, since its semantics (return actual
38db987316a38a Andre Przywara     2021-01-06   89  	 * hardware backed entropy) is closer to the idea behind this
38db987316a38a Andre Przywara     2021-01-06   90  	 * function here than what even the RNDRSS register provides
38db987316a38a Andre Przywara     2021-01-06   91  	 * (the output of a pseudo RNG freshly seeded by a TRNG).
38db987316a38a Andre Przywara     2021-01-06   92  	 */
38db987316a38a Andre Przywara     2021-01-06  @93  	if (smccc_trng_available) {
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   94  		struct arm_smccc_res res;
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   95  
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   96  		max_longs = min_t(size_t, 3, max_longs);
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   97  		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, max_longs * 64, &res);
38db987316a38a Andre Przywara     2021-01-06   98  		if ((int)res.a0 >= 0) {
d349ab99eec7ab Jason A. Donenfeld 2022-07-17   99  			switch (max_longs) {
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  100  			case 3:
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  101  				*v++ = res.a1;
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  102  				fallthrough;
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  103  			case 2:
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  104  				*v++ = res.a2;
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  105  				fallthrough;
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  106  			case 1:
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  107  				*v++ = res.a3;
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  108  				break;
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  109  			}
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  110  			return max_longs;
38db987316a38a Andre Przywara     2021-01-06  111  		}
38db987316a38a Andre Przywara     2021-01-06  112  	}
38db987316a38a Andre Przywara     2021-01-06  113  
1a50ec0b3b2e9a Richard Henderson  2020-01-21  114  	/*
35bde68bba5413 Ard Biesheuvel     2022-01-13  115  	 * RNDRRS is not backed by an entropy source but by a DRBG that is
35bde68bba5413 Ard Biesheuvel     2022-01-13  116  	 * reseeded after each invocation. This is not a 100% fit but good
35bde68bba5413 Ard Biesheuvel     2022-01-13  117  	 * enough to implement this API if no other entropy source exists.
1a50ec0b3b2e9a Richard Henderson  2020-01-21  118  	 */
2c03e16f44993d Jason A. Donenfeld 2022-10-29  119  	if (__cpu_has_rng() && __arm64_rndrrs(v))
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  120  		return 1;
1a50ec0b3b2e9a Richard Henderson  2020-01-21  121  
d349ab99eec7ab Jason A. Donenfeld 2022-07-17  122  	return 0;
1a50ec0b3b2e9a Richard Henderson  2020-01-21  123  }
1a50ec0b3b2e9a Richard Henderson  2020-01-21  124  

:::::: The code at line 93 was first introduced by commit
:::::: 38db987316a38a3fe55ff7f5f4653fcb520a9d26 arm64: Add support for SMCCC TRNG entropy source

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
