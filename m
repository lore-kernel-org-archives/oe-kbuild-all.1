Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823CB390985
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703340; cv=none; b=qjvuz2SoqdIJXJ76QErj8a1wPdVi3fQnyd7bytPeCIOurwsR5tZSYZBOi5xsPmuSSeHox7mTiuml+zxmL9I/9DXm5BJty1Vtwt6sMNyGmI7ONX+0HW7jDiKHQMbBu8bjDDGywMR8ytQT/k5Yoa9hrAmZxg8MjEv728UvElwsbPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703340; c=relaxed/simple;
	bh=rsc2PDOAD6BMu3fUQNRcgF0uDgetE3tqwIOyGyKHdxI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LREev7rPIMNUhwyD+q4HK7tsQnU+4OjbmV5qHjcz1Dn76I/3cIyrfYXWrJFpCjZA8acEbS196iPodXMttp4O+RYseXUrCNW7X+xTH8WpZsvSXCT4Rt5IesKo45rsPG1JS/g23P4o8CHKPFt2ZpHx8ka2j49STo9LDRSnsFDCR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPbYh++E; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPbYh++E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790703339; x=1822239339;
  h=date:from:to:cc:subject:message-id;
  bh=rsc2PDOAD6BMu3fUQNRcgF0uDgetE3tqwIOyGyKHdxI=;
  b=cPbYh++EwC9htrcADFChfDDuI+NPmFli654jdW1Pf+AYeTnisYCVGHOZ
   eCLrRnGbQaIZvEOFyxiJGDx01/SPqIOD0lcCUARAQhzl7AeDsWzuvZlua
   tpFsXHgxCKKuyN5M0t9fnZtWO4iW6/TpvyN6dYePUbjD1Iyfik0VNPEEL
   Y626J0FyKMsFLe9BrE1ZS/z/6XFtRzvK/BsAPW2s57cFNvfPHNZI44S/f
   Y62G/dq9DAtgvNGW0pUr3mz7oidlXgvSjdrirIWZGC82i8ZmFCvwbToP3
   7VN1RplaUejaWuvLFJktU0n1kHelzqPoFP2J2DZpDhE6/5fFuBHlcr8Tm
   A==;
X-CSE-ConnectionGUID: ifaL1A45ShmBM+8RMGUGuQ==
X-CSE-MsgGUID: WG1DlSNZRXWHGgIEddUamg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="116959693"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="116959693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:35:38 -0700
X-CSE-ConnectionGUID: aAFzMH1kRzmkPJJ8tvynXA==
X-CSE-MsgGUID: UcsVdwgpQOuABOW7U+mLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278782601"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 29 Sep 2026 10:35:36 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBbjq-000000001Uj-03vn;
	Tue, 29 Sep 2026 17:35:34 +0000
Date: Tue, 29 Sep 2026 19:34:56 +0200
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/Kconfig:2368: syntax error
Message-ID: <202609291906.GAlpG7h2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes-ARM/kbuild-do-not-allocate-modinfo-in-vmlinux/20260923-181750
head:   7037b569f2880edc0732da253bce262da253ac12
commit: 7a5e3a047b46532027b586ea704af1fc8677ef19 kbuild: avoid re-running compiler and linker probes
date:   6 days ago
config: x86_64-rhel-9.4-ltp (attached as .config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291906.GAlpG7h2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609291906.GAlpG7h2-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/Kconfig.toolchain:148: syntax error
   scripts/Kconfig.toolchain:148: unknown statement "def_string"
   scripts/Kconfig.toolchain:151: syntax error
   scripts/Kconfig.toolchain:151: unknown statement "def_string"
   scripts/Kconfig.toolchain:154: syntax error
   scripts/Kconfig.toolchain:154: unknown statement "def_string"
   scripts/Kconfig.toolchain:157: syntax error
   scripts/Kconfig.toolchain:157: unknown statement "def_string"
   scripts/Kconfig.toolchain:160: syntax error
   scripts/Kconfig.toolchain:160: unknown statement "def_string"
   scripts/Kconfig.toolchain:164: syntax error
   scripts/Kconfig.toolchain:164: unknown statement "def_string"
   scripts/Kconfig.toolchain:167: syntax error
   scripts/Kconfig.toolchain:167: unknown statement "def_string"
   scripts/Kconfig.toolchain:177: syntax error
   scripts/Kconfig.toolchain:177: unknown statement "def_string"
   scripts/Kconfig.toolchain:180: syntax error
   scripts/Kconfig.toolchain:180: unknown statement "def_string"
   scripts/Kconfig.toolchain:183: syntax error
   scripts/Kconfig.toolchain:183: unknown statement "def_string"
   scripts/Kconfig.toolchain:186: syntax error
   scripts/Kconfig.toolchain:186: unknown statement "def_string"
   scripts/Kconfig.toolchain:189: syntax error
   scripts/Kconfig.toolchain:189: unknown statement "def_string"
   scripts/Kconfig.toolchain:192: syntax error
   scripts/Kconfig.toolchain:192: unknown statement "def_string"
   scripts/Kconfig.toolchain:195: syntax error
   scripts/Kconfig.toolchain:195: unknown statement "def_string"
   scripts/Kconfig.toolchain:198: syntax error
   scripts/Kconfig.toolchain:198: unknown statement "def_string"
   scripts/Kconfig.toolchain:204: syntax error
   scripts/Kconfig.toolchain:204: unknown statement "def_string"
   scripts/Kconfig.toolchain:207: syntax error
   scripts/Kconfig.toolchain:207: unknown statement "def_string"
   scripts/Kconfig.toolchain:210: syntax error
   scripts/Kconfig.toolchain:210: unknown statement "def_string"
   scripts/Kconfig.toolchain:213: syntax error
   scripts/Kconfig.toolchain:213: unknown statement "def_string"
   scripts/Kconfig.toolchain:216: syntax error
   scripts/Kconfig.toolchain:216: unknown statement "def_string"
   scripts/Kconfig.toolchain:219: syntax error
   scripts/Kconfig.toolchain:219: unknown statement "def_string"
>> arch/x86/Kconfig:2368: syntax error
   arch/x86/Kconfig:2368: unknown statement "def_string"
   arch/x86/Kconfig:2371: syntax error
   arch/x86/Kconfig:2371: unknown statement "def_string"
   arch/x86/Kconfig:2376: syntax error
   arch/x86/Kconfig:2376: unknown statement "def_string"
   arch/x86/Kconfig:2379: syntax error
   arch/x86/Kconfig:2379: unknown statement "def_string"
   arch/x86/Kconfig:2382: syntax error
   arch/x86/Kconfig:2382: unknown statement "def_string"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:766: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   scripts/Kconfig.toolchain:148: syntax error
   scripts/Kconfig.toolchain:148: unknown statement "def_string"
   scripts/Kconfig.toolchain:151: syntax error
   scripts/Kconfig.toolchain:151: unknown statement "def_string"
   scripts/Kconfig.toolchain:154: syntax error
   scripts/Kconfig.toolchain:154: unknown statement "def_string"
   scripts/Kconfig.toolchain:157: syntax error
   scripts/Kconfig.toolchain:157: unknown statement "def_string"
   scripts/Kconfig.toolchain:160: syntax error
   scripts/Kconfig.toolchain:160: unknown statement "def_string"
   scripts/Kconfig.toolchain:164: syntax error
   scripts/Kconfig.toolchain:164: unknown statement "def_string"
   scripts/Kconfig.toolchain:167: syntax error
   scripts/Kconfig.toolchain:167: unknown statement "def_string"
   scripts/Kconfig.toolchain:177: syntax error
   scripts/Kconfig.toolchain:177: unknown statement "def_string"
   scripts/Kconfig.toolchain:180: syntax error
   scripts/Kconfig.toolchain:180: unknown statement "def_string"
   scripts/Kconfig.toolchain:183: syntax error
   scripts/Kconfig.toolchain:183: unknown statement "def_string"
   scripts/Kconfig.toolchain:186: syntax error
   scripts/Kconfig.toolchain:186: unknown statement "def_string"
   scripts/Kconfig.toolchain:189: syntax error
   scripts/Kconfig.toolchain:189: unknown statement "def_string"
   scripts/Kconfig.toolchain:192: syntax error
   scripts/Kconfig.toolchain:192: unknown statement "def_string"
   scripts/Kconfig.toolchain:195: syntax error
   scripts/Kconfig.toolchain:195: unknown statement "def_string"
   scripts/Kconfig.toolchain:198: syntax error
   scripts/Kconfig.toolchain:198: unknown statement "def_string"
   scripts/Kconfig.toolchain:204: syntax error
   scripts/Kconfig.toolchain:204: unknown statement "def_string"
   scripts/Kconfig.toolchain:207: syntax error
   scripts/Kconfig.toolchain:207: unknown statement "def_string"
   scripts/Kconfig.toolchain:210: syntax error
   scripts/Kconfig.toolchain:210: unknown statement "def_string"
   scripts/Kconfig.toolchain:213: syntax error
   scripts/Kconfig.toolchain:213: unknown statement "def_string"
   scripts/Kconfig.toolchain:216: syntax error
   scripts/Kconfig.toolchain:216: unknown statement "def_string"
   scripts/Kconfig.toolchain:219: syntax error
   scripts/Kconfig.toolchain:219: unknown statement "def_string"
>> arch/x86/Kconfig:2368: syntax error
   arch/x86/Kconfig:2368: unknown statement "def_string"
   arch/x86/Kconfig:2371: syntax error
   arch/x86/Kconfig:2371: unknown statement "def_string"
   arch/x86/Kconfig:2376: syntax error
   arch/x86/Kconfig:2376: unknown statement "def_string"
   arch/x86/Kconfig:2379: syntax error
   arch/x86/Kconfig:2379: unknown statement "def_string"
   arch/x86/Kconfig:2382: syntax error
   arch/x86/Kconfig:2382: unknown statement "def_string"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:766: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +2368 arch/x86/Kconfig

  2344	
  2345	config CC_HAS_NAMED_AS_FIXED_SANITIZERS
  2346		def_bool y
  2347		depends on !(KASAN || KCSAN) || GCC_VERSION >= 130300
  2348		depends on !(UBSAN_BOOL && KASAN) || GCC_VERSION >= 140200
  2349	
  2350	config USE_X86_SEG_SUPPORT
  2351		def_bool CC_HAS_NAMED_AS
  2352		depends on CC_HAS_NAMED_AS_FIXED_SANITIZERS
  2353	
  2354	config CC_HAS_SLS
  2355		def_bool $(cc-option,-mharden-sls=all)
  2356	
  2357	config CC_HAS_RETURN_THUNK
  2358		def_bool $(cc-option,-mfunction-return=thunk-extern)
  2359	
  2360	config CC_HAS_ENTRY_PADDING
  2361		def_bool $(cc-option,-fpatchable-function-entry=16,16)
  2362	
  2363	config CC_HAS_KCFI_ARITY
  2364		def_bool $(cc-option,-fsanitize=kcfi -fsanitize-kcfi-arity)
  2365		depends on CC_IS_CLANG && !RUST
  2366	
  2367	config CC_OPT_INDIRECT_BRANCH_CS_PREFIX
> 2368		def_string "$(cc-option-str,-mindirect-branch-cs-prefix)"
  2369	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
