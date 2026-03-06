Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C92D7DE1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 02:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772765927; cv=none; b=lNFZqbsXsjRAfuc+L9euv/bF59fkORKe24xOK2cqbqj00ndm+DR42JEpwI7UEKz7zkF3Gi/p9Puzpn5XKjzGLW1Wfsnyp795SnOdrHg8aMTKTt0D/NgeXSe+DyCdVswoEaPQTXjbpsYwIOtPeJ4+RP42QY8rOuw5xNne8f2H10Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772765927; c=relaxed/simple;
	bh=qOV23i/0LQ0tympjEWUqEv94ncke83Jft8A2aeaQIak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qWmYlgXeLYh0PCjOIFzDgIqwOSNnMwmoPpOSM52VlMQuiXexzKB2Nmei0kJ9LlM7T6BZeDu/JCZ4XXPI79hKVWtTGxx/3Aje531msUcynXv0+iGh96VYcmtJ9WJWPt9K8far59V0IuX081HY6/vb56LkofAFexzZfCcvS4JgimE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNQzik3k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNQzik3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772765926; x=1804301926;
  h=date:from:to:cc:subject:message-id;
  bh=qOV23i/0LQ0tympjEWUqEv94ncke83Jft8A2aeaQIak=;
  b=CNQzik3kodvh9Hmh44r5e90WelXTtPJNMtvf3F22YuGISMK/2LAKdQtX
   OyvwTs16fVBSiy7sP/zHKxOp+XfGcoZLOw9lXoxjkfq9AxrdhUryf+mBs
   ltR6b9gKrMiTb2Dg80QvSpEg9v9Oka8OACGpv00mCS7GrzmsiZw3YEQks
   Xq9uEfZwM+8AfSpOc58hRWZySitFyRKSwrx0Hd5pfWtuz9N86ghUKiXNc
   8Jv96sUF+w9irv1XlKOl4szL2y6PEiv4RUSboqeOMPXFY529hc3qBL7LG
   4RXXq+q5Wu738sRoVs+x/plt9nO7UQZPsiVN1QAwIoWNVxQpP9YQbXFAF
   A==;
X-CSE-ConnectionGUID: XE9x8qoAT5ejWK3bMQEelg==
X-CSE-MsgGUID: mW+aF/zASRuh5FK0iPwXSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73745355"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73745355"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:58:46 -0800
X-CSE-ConnectionGUID: BtdGvDe5SK6VR28HDXOVYw==
X-CSE-MsgGUID: pvLXhEP6Rs288PxT3nn9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="216668735"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 18:58:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyLOj-000000000El-3Iez;
	Fri, 06 Mar 2026 02:58:41 +0000
Date: Fri, 06 Mar 2026 10:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-laj 1/1]
 crypto/fips140-module.c:47:24: sparse: sparse: symbol
 '__fips140_initcalls_start' was not declared. Should it be static?
Message-ID: <202603061015.6s5mlnCd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-laj
head:   93730e472d2b8958b634e40387e6de659bfbf270
commit: cdcc719dd7983592485297264f994b6581a45b17 [1/1] ANDROID: fips140: override library functions
config: arm64-randconfig-r121-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061015.6s5mlnCd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061015.6s5mlnCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061015.6s5mlnCd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/fips140-module.c:47:24: sparse: sparse: symbol '__fips140_initcalls_start' was not declared. Should it be static?
>> crypto/fips140-module.c:48:24: sparse: sparse: symbol '__fips140_initcalls_end' was not declared. Should it be static?
>> crypto/fips140-module.c:61:24: sparse: sparse: symbol 'fips140_initcalls_start' was not declared. Should it be static?
>> crypto/fips140-module.c:62:10: sparse: sparse: symbol 'fips140_text_start' was not declared. Should it be static?
>> crypto/fips140-module.c:63:10: sparse: sparse: symbol 'fips140_rodata_start' was not declared. Should it be static?

vim +/__fips140_initcalls_start +47 crypto/fips140-module.c

80a81484766c535 Ard Biesheuvel 2021-03-23  46  
80a81484766c535 Ard Biesheuvel 2021-03-23 @47  const initcall_entry_t __fips140_initcalls_start __section(".initcalls._start");
80a81484766c535 Ard Biesheuvel 2021-03-23 @48  const initcall_entry_t __fips140_initcalls_end __section(".initcalls._end");
80a81484766c535 Ard Biesheuvel 2021-03-23  49  
80a81484766c535 Ard Biesheuvel 2021-03-23  50  const u8 __fips140_text_start __section(".text.._start");
80a81484766c535 Ard Biesheuvel 2021-03-23  51  const u8 __fips140_text_end __section(".text.._end");
80a81484766c535 Ard Biesheuvel 2021-03-23  52  
80a81484766c535 Ard Biesheuvel 2021-03-23  53  const u8 __fips140_rodata_start __section(".rodata.._start");
80a81484766c535 Ard Biesheuvel 2021-03-23  54  const u8 __fips140_rodata_end __section(".rodata.._end");
80a81484766c535 Ard Biesheuvel 2021-03-23  55  
80a81484766c535 Ard Biesheuvel 2021-03-23  56  /*
80a81484766c535 Ard Biesheuvel 2021-03-23  57   * We need this little detour to prevent Clang from detecting out of bounds
80a81484766c535 Ard Biesheuvel 2021-03-23  58   * accesses to the above *_start symbols, which exist only to delineate the
80a81484766c535 Ard Biesheuvel 2021-03-23  59   * corresponding sections, and so their sizes are not relevant to us.
80a81484766c535 Ard Biesheuvel 2021-03-23  60   */
80a81484766c535 Ard Biesheuvel 2021-03-23 @61  const initcall_entry_t *fips140_initcalls_start = &__fips140_initcalls_start;
80a81484766c535 Ard Biesheuvel 2021-03-23 @62  const u8 *fips140_text_start = &__fips140_text_start;
80a81484766c535 Ard Biesheuvel 2021-03-23 @63  const u8 *fips140_rodata_start = &__fips140_rodata_start;
80a81484766c535 Ard Biesheuvel 2021-03-23  64  

:::::: The code at line 47 was first introduced by commit
:::::: 80a81484766c53515b732aa703b34a5b3dc2bf8c ANDROID: fips140: add kernel crypto module

:::::: TO: Ard Biesheuvel <ardb@google.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
