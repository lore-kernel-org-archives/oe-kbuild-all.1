Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB823CB566
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625547; cv=none; b=b8paZ7qjvd8pg/p4H8cbamGhh/1Xfz9rWGTpaitNYEiUSQxp94BnuyYCKE0JpbM85e4r3Q6J+3w1cL/vUtjkNwZnvru5M6vACS6FCBM8lqAFpoDTy9AUMNYcEen/f5q0HdQffeO7Ass36q4nk29MEuEa+Dp2FP4QfhWQj0D3pqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625547; c=relaxed/simple;
	bh=nDi9rDHe0QXRskCiZ7uAB9alWHosNZQiGaebKjexSQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FPz4mItUlN0F6JKGcO9uUHCwvs8OI9NLmC7Wz9mPA/VJhHctg0iQjdibpwXoSgonQiC+PpyT0A+1mawCH/DYA+/6K7CetfdPXQhVOqxYpmZZquzt8dAchBu9mNNJELeOPD0Wh5iEQu1UsxuDOQaKj/IzHGyVU4sRCQOOYcMYeRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/58uQjB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/58uQjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784625544; x=1816161544;
  h=date:from:to:cc:subject:message-id;
  bh=nDi9rDHe0QXRskCiZ7uAB9alWHosNZQiGaebKjexSQE=;
  b=l/58uQjBO43MiDYqo7CINfEk0BCGFqfR4nhUTBN4yWt8+Vo3s/W9LSKf
   B0xhVap17T/vW/hY3vLmUkos64K8RTxwkH8+Kc61O88ggCugZ8jiCu7xi
   NgF/dI9MNdt4NPPX8dAdISSZotr4Kcb5WLk3gQbtZRQh3673bezQm1dM0
   JYCEXVqqAWiyBqjBiC6TKqRqfXVGt/xblWf76ixmCM+gV8tJTm5CIYN4c
   QcpV0k6L/6FkAZytIv7O13CjHVKAUtT6uFA3dahgHNXSwbdMRop9Pvm57
   80Yz2PBmAVgb0EnGyz8V1WIHbxenWgvvGzZPpOWQlFWiOvoabz7ivnQDs
   Q==;
X-CSE-ConnectionGUID: nS2BRPTBTKKfX/XMmyfT1g==
X-CSE-MsgGUID: rlvVevfIRl6n3saGBnkZdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="108008597"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="108008597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 02:19:04 -0700
X-CSE-ConnectionGUID: wqB5vUM9SDWD+XAd36lyaw==
X-CSE-MsgGUID: GD6DmmNLTeyAf5xPhsjkEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="261983804"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Jul 2026 02:19:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wm6cs-00000000XSh-0SWc;
	Tue, 21 Jul 2026 09:18:58 +0000
Date: Tue, 21 Jul 2026 17:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 arch/arm64/crypto//ghash-ce-glue.c:511:33: warning: unused variable
 'ghash_cpu_feature'
Message-ID: <202607211745.x0tDi5PV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ard,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   b3c531e1677cf574dd7ffc9bfce3a298c74ef2f8
commit: c6d5a767217ce93403528e99f1a1eb401a26eeb3 [192/192] ANDROID: fips140: add kernel crypto module
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260721/202607211745.x0tDi5PV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607211745.x0tDi5PV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607211745.x0tDi5PV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/arm64/crypto//ghash-ce-glue.c:511:33: warning: unused variable 'ghash_cpu_feature' [-Wunused-const-variable]
     511 | static const struct cpu_feature ghash_cpu_feature[] = {
         |                                 ^~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/ghash_cpu_feature +511 arch/arm64/crypto//ghash-ce-glue.c

fdd2389457b209a Ard Biesheuvel 2014-03-26  510  
03c9a333fef1bb0 Ard Biesheuvel 2017-07-24 @511  static const struct cpu_feature ghash_cpu_feature[] = {
03c9a333fef1bb0 Ard Biesheuvel 2017-07-24  512  	{ cpu_feature(PMULL) }, { }
03c9a333fef1bb0 Ard Biesheuvel 2017-07-24  513  };
03c9a333fef1bb0 Ard Biesheuvel 2017-07-24  514  MODULE_DEVICE_TABLE(cpu, ghash_cpu_feature);
03c9a333fef1bb0 Ard Biesheuvel 2017-07-24  515  

:::::: The code at line 511 was first introduced by commit
:::::: 03c9a333fef1bb0a67615b686a7342d853f1a460 crypto: arm64/ghash - add NEON accelerated fallback for 64-bit PMULL

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
