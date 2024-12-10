Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8423EC19
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871137; cv=none; b=u7Yyzcmi9i5ln3MEaZO6LR/HlTQGroKHdSTKuCY2UuSzhEWKye0yX8kSe33aUy8E9Wy21XwJfwneTlpDRZg/wQk6qOblBpZMeVbiFh+P6mLcrrm0kmojpWNzscOGLS2eGuNC0pCFm+uiOikyjEmI7PuwicENFmbVV6C8B+V/6dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871137; c=relaxed/simple;
	bh=vCBzxj8pQXuRAMluwNfZj7cDtcnjyJDi7qvWvwvYK2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ACL5A3EmJPXN8DrTH8v8/7fCcZw2+UZkiO/2WK5GToM1xnxZVceatvoxOE2aNbRRuh4qpiMnC9U1UeSKJCrcxZcQSUQBekFTLYKINbFwVrbV9JiP8OO+36m2CLUuj+TWeHdSjT0WUSKCNOq0XEeecF5VQnaGjxWPlB3LXaU6kH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAKP98lW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAKP98lW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733871134; x=1765407134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCBzxj8pQXuRAMluwNfZj7cDtcnjyJDi7qvWvwvYK2Y=;
  b=EAKP98lWh7afIQMC4XfMdQxZiwL88BwYrm/GIaiN13NMk3erTWTZ81zm
   peG79oS7h1+F/hIpBsy3HxybexpId1VdwogU4gL9A8nx8b4ezs/M7Fk1f
   gOoPexwkf0dV80Fr3umxsTbdS5BcVvDepW34fXWD9RO+6kXCM7cc0OIzF
   XK50v4mjNwYeI/FXPJk5f0ePBK2mVsPrIRIxuCkh/N+NpPkXy4yV7SpiZ
   BF2snqjLS8OWfznEhaLug0shD53tbRNzXppr8LDRm9huN9rIS+FL4q8+Z
   VvP11FIZDMKRDXHucu6dMe62z7M9o5l/kJ+SQXurZm/FIINqhNMjpZr8w
   Q==;
X-CSE-ConnectionGUID: Vs2fBjxZQeOrv+g1jVyF2g==
X-CSE-MsgGUID: k0bgOIYjSh2Uzt7TD6F/nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33572144"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="33572144"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 14:52:13 -0800
X-CSE-ConnectionGUID: hhVaaJyiThuLgGI31SoHzw==
X-CSE-MsgGUID: BXN+GClRSWqwP9Bu3iISwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100610725"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Dec 2024 14:52:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL95L-00061p-23;
	Tue, 10 Dec 2024 22:52:07 +0000
Date: Wed, 11 Dec 2024 06:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: arch/arm64/kernel/pi/patch-scs.c:64:29: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202412110652.76eW7ZLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: 8a6e40e1f68e9fc44497db88e0c0f21bb513c551 arm64: head: move dynamic shadow call stack patching into early C runtime
date:   10 months ago
config: arm64-randconfig-r121-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110652.76eW7ZLA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241211/202412110652.76eW7ZLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110652.76eW7ZLA-lkp@intel.com/

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

3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  57  
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  58  static void __always_inline scs_patch_loc(u64 loc)
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  59  {
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  60  	u32 insn = le32_to_cpup((void *)loc);
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  61  
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  62  	switch (insn) {
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  63  	case PACIASP:
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27 @64  		*(u32 *)loc = cpu_to_le32(SCS_PUSH);
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  65  		break;
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  66  	case AUTIASP:
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  67  		*(u32 *)loc = cpu_to_le32(SCS_POP);
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  68  		break;
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  69  	default:
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  70  		/*
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  71  		 * While the DW_CFA_negate_ra_state directive is guaranteed to
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  72  		 * appear right after a PACIASP/AUTIASP instruction, it may
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  73  		 * also appear after a DW_CFA_restore_state directive that
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  74  		 * restores a state that is only partially accurate, and is
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  75  		 * followed by DW_CFA_negate_ra_state directive to toggle the
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  76  		 * PAC bit again. So we permit other instructions here, and ignore
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  77  		 * them.
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  78  		 */
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  79  		return;
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  80  	}
8a6e40e1f68e9fc arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2024-02-14  81  	if (IS_ENABLED(CONFIG_ARM64_WORKAROUND_CLEAN_CACHE))
8a6e40e1f68e9fc arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2024-02-14  82  		asm("dc civac, %0" :: "r"(loc));
8a6e40e1f68e9fc arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2024-02-14  83  	else
8a6e40e1f68e9fc arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2024-02-14  84  		asm(ALTERNATIVE("dc cvau, %0", "nop", ARM64_HAS_CACHE_IDC)
8a6e40e1f68e9fc arch/arm64/kernel/pi/patch-scs.c Ard Biesheuvel 2024-02-14  85  		    :: "r"(loc));
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  86  }
3b619e22c4601b4 arch/arm64/kernel/patch-scs.c    Ard Biesheuvel 2022-10-27  87  

:::::: The code at line 64 was first introduced by commit
:::::: 3b619e22c4601b444ed2d6a5458271f72625ac89 arm64: implement dynamic shadow call stack for Clang

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
