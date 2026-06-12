Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E413EDADF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281928; cv=none; b=lp1lUwBHr9BPYzBDPzrHSvR3MDqgmZe+i6M4vNRaTkNhXv7uIuM8kd8hKKRh3a73VuflDQD9WUOzT3zju75zgykqKJKAYiVpBYAHIxwIK2YUaAHGySKhkgKdFSks2P4pijWKF0fDg5RyvKYjrxFoijTHu1bjWImADbe0bkdWK9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281928; c=relaxed/simple;
	bh=ljS5M4yFbZJ18hcsrR9U/zEXE8inNrXxxJ7nQIsV8Yg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RjFiHWk1ePXXvR2vOSXnBzHuJOVK402iW32Vr7EzATowfFNDsYofNT3OvB9ysND2R1potgki7ukidcDmJHT7cqktD1PC6B+fLsvXDaYLGqaUSR/PYha/AHR7vX6WawaWVx4bGFTGaNK025Hvy5lDl7xjzOqobLy+G5juAXtoCKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icIH6Dmh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icIH6Dmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781281925; x=1812817925;
  h=date:from:to:cc:subject:message-id;
  bh=ljS5M4yFbZJ18hcsrR9U/zEXE8inNrXxxJ7nQIsV8Yg=;
  b=icIH6DmhbBOgauAqYcOPwAR3WFKOBXkxJDectx7xMwkVf5EwgRxLt8Ds
   KCRfWMSu+YFME0jbPqfRHIxKpU3tpGA47QVPokv0Zz2qr/D68mtBuQKOp
   UTJGyd4SiBCVL4yHQc88UTmL9LyAtVCbpmKCqCAMG813XVgQFJ3IyYAsj
   oPzwPL0ow+bEyQ2iI0tVJlatau5o3be7vfAStFfJ2XnykqEaySZETDsak
   j4mgA64ZYui0f1DhZ0244SBmNM1F/QsFTEdSZmeopsHhha6I9e+SOmeOe
   zeZ0aLz52oS/Xi7YaR9K0PNzEdCtBud9mX7KPSLgazTgwWYAJA9+QRibe
   g==;
X-CSE-ConnectionGUID: TM+6GsSJShyU5UF1qRhf4w==
X-CSE-MsgGUID: c/Kq86oURVyvZIC275K/8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82022346"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82022346"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:32:04 -0700
X-CSE-ConnectionGUID: VQPfvtKGToa9ydotlrT4Uw==
X-CSE-MsgGUID: xPoia49nSR6OpHyTgFDGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246734941"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jun 2026 09:32:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY4nY-00000000P3Z-29Sw;
	Fri, 12 Jun 2026 16:32:00 +0000
Date: Sat, 13 Jun 2026 00:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:xor-pending 1/1]
 lib/raid/xor/um/../x86/xor_arch.h:16:13: error: implicit declaration of
 function 'cpu_has_xfeatures'; did you mean 'cpu_have_feature'?
Message-ID: <202606130045.HZB9HLnL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git xor-pending
head:   29d2790c2a2ae236ad76443f63a16fc2ebc3c3bf
commit: 29d2790c2a2ae236ad76443f63a16fc2ebc3c3bf [1/1] lib/raid/xor: x86: Add AVX-512 optimized xor_gen()
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260613/202606130045.HZB9HLnL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130045.HZB9HLnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130045.HZB9HLnL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/raid/xor/um/xor_arch.h:2,
                    from lib/raid/xor/xor-core.c:140:
   lib/raid/xor/um/../x86/xor_arch.h: In function 'arch_xor_init':
>> lib/raid/xor/um/../x86/xor_arch.h:16:13: error: implicit declaration of function 'cpu_has_xfeatures'; did you mean 'cpu_have_feature'? [-Wimplicit-function-declaration]
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |             ^~~~~~~~~~~~~~~~~
         |             cpu_have_feature
>> lib/raid/xor/um/../x86/xor_arch.h:16:31: error: 'XFEATURE_MASK_AVX512' undeclared (first use in this function)
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |                               ^~~~~~~~~~~~~~~~~~~~
   lib/raid/xor/um/../x86/xor_arch.h:16:31: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from lib/raid/xor/x86/xor-avx.c:13:
   lib/raid/xor/x86/xor_arch.h: In function 'arch_xor_init':
>> lib/raid/xor/x86/xor_arch.h:16:13: error: implicit declaration of function 'cpu_has_xfeatures'; did you mean 'cpu_have_feature'? [-Wimplicit-function-declaration]
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |             ^~~~~~~~~~~~~~~~~
         |             cpu_have_feature
>> lib/raid/xor/x86/xor_arch.h:16:31: error: 'XFEATURE_MASK_AVX512' undeclared (first use in this function)
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |                               ^~~~~~~~~~~~~~~~~~~~
   lib/raid/xor/x86/xor_arch.h:16:31: note: each undeclared identifier is reported only once for each function it appears in


vim +16 lib/raid/xor/um/../x86/xor_arch.h

    11	
    12	static __always_inline void __init arch_xor_init(void)
    13	{
    14		if (IS_ENABLED(CONFIG_X86_64) && boot_cpu_has(X86_FEATURE_AVX512F) &&
    15		    !boot_cpu_has(X86_FEATURE_PREFER_YMM) &&
  > 16		    cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
