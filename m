Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E873454B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJJOO2hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701942383; x=1733478383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZD/3CwOHh/7eVZIQpbI1Pk52btA1FN2Akse0dmo2cs0=;
  b=cJJOO2hcrnH0x97FKYQVsBxlA62ml4by9PfQGt8q1PP85abQ2u5hOBa3
   pHI6BooGpWPGkhEiW+gjWOmNwvz7kiQcQsNReOS7LxF9I+ZBl/msTMcBb
   4sVB1Jl3MwQlvs+BU9+RAgEfDTwdFpAM95J9QlUXM3EATEA+PdkFc919o
   LWjbJN9YrlWrC2gyTmL5WXBl2eKqSbU9fffVlAp/dolcM6HMvsKcT4Kaq
   HpEFA23+/tSMCX6cW3JjNRV3gnaRanbf6I9PWdKPMPZWWKiruTTlZv1cd
   S6xlEAVzpv1sLzazJ8N+q5usn6OL9jKKsBnaeSl9pAyGQisOgKFmTSQor
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="384610559"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="384610559"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 01:46:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842150903"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="842150903"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2023 01:46:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBAxX-000C2Q-0V;
	Thu, 07 Dec 2023 09:46:19 +0000
Date: Thu, 7 Dec 2023 17:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-lpa2-v6-combined 26/64]
 arch/arm64/kernel/pi/patch-scs.c:64:29: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202312071741.WrjNuCZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v6-combined
head:   17a8520829338e0852f61bf8201cd70cb24df936
commit: 045b6611e4b2f81e8b7726beff96537f70770a09 [26/64] arm64: head: move dynamic shadow call stack patching into early C runtime
config: arm64-randconfig-r131-20231130 (https://download.01.org/0day-ci/archive/20231207/202312071741.WrjNuCZg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071741.WrjNuCZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312071741.WrjNuCZg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/pi/patch-scs.c:208:5: sparse: sparse: symbol 'scs_patch' was not declared. Should it be static?
   arch/arm64/kernel/pi/patch-scs.c:254:24: sparse: sparse: symbol 'scs_patch_vmlinux' was not declared. Should it be static?
>> arch/arm64/kernel/pi/patch-scs.c:64:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kernel/pi/patch-scs.c:64:29: sparse:     expected unsigned int [usertype]
   arch/arm64/kernel/pi/patch-scs.c:64:29: sparse:     got restricted __le32 [usertype]
   arch/arm64/kernel/pi/patch-scs.c:67:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kernel/pi/patch-scs.c:67:29: sparse:     expected unsigned int [usertype]
   arch/arm64/kernel/pi/patch-scs.c:67:29: sparse:     got restricted __le32 [usertype]

vim +64 arch/arm64/kernel/pi/patch-scs.c

3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  57  
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  58  static void __always_inline scs_patch_loc(u64 loc)
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  59  {
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  60  	u32 insn = le32_to_cpup((void *)loc);
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  61  
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  62  	switch (insn) {
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  63  	case PACIASP:
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27 @64  		*(u32 *)loc = cpu_to_le32(SCS_PUSH);
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  65  		break;
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  66  	case AUTIASP:
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  67  		*(u32 *)loc = cpu_to_le32(SCS_POP);
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  68  		break;
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  69  	default:
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  70  		/*
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  71  		 * While the DW_CFA_negate_ra_state directive is guaranteed to
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  72  		 * appear right after a PACIASP/AUTIASP instruction, it may
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  73  		 * also appear after a DW_CFA_restore_state directive that
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  74  		 * restores a state that is only partially accurate, and is
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  75  		 * followed by DW_CFA_negate_ra_state directive to toggle the
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  76  		 * PAC bit again. So we permit other instructions here, and ignore
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  77  		 * them.
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  78  		 */
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  79  		return;
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  80  	}
045b6611e4b2f8 arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2022-11-10  81  	if (IS_ENABLED(CONFIG_ARM64_WORKAROUND_CLEAN_CACHE))
045b6611e4b2f8 arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2022-11-10  82  		asm("dc civac, %0" :: "r"(loc));
045b6611e4b2f8 arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2022-11-10  83  	else
045b6611e4b2f8 arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2022-11-10  84  		asm(ALTERNATIVE("dc cvau, %0", "nop", ARM64_HAS_CACHE_IDC)
045b6611e4b2f8 arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2022-11-10  85  		    :: "r"(loc));
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  86  }
3b619e22c4601b arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  87  

:::::: The code at line 64 was first introduced by commit
:::::: 3b619e22c4601b444ed2d6a5458271f72625ac89 arm64: implement dynamic shadow call stack for Clang

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
