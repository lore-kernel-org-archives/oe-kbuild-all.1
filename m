Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839CC311959
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687748; cv=none; b=JqWE8i/wl+1/3/wigkYCSM6G9fFKbRiO8LiW/4Do3MySU826qAXSg7OHMJ+R2TTy+wyjDF9ZW2QkgsIv5ip/DisvdZHMdwUvj9zIJqEb4Ysb64/XwPyAr0Y/v7qXzXYmQbFyTytr+7L1ObdjcNFa0abfPk6PWUaMPUslGf/UHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687748; c=relaxed/simple;
	bh=S98/wY0qAKnBh/Di4ip6sKuKmexA14ZWypJthXy2zO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eznVeH2p9sFrACzuk5whZs/KxKq44aB3EryAm0pFuVJv5La+Xrz3L7nNOLJvEFx908LE7jlYa1ssPy3ZlUAZcYqV2CKw+4mLTBfPk9CUdDyv1htuUBXT/qw8mUvPrXuZdX8uk/bZLgMkC2By7YNYajvnsrvmWy24J1RSl8xFPcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evV6pK35; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evV6pK35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757687746; x=1789223746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S98/wY0qAKnBh/Di4ip6sKuKmexA14ZWypJthXy2zO8=;
  b=evV6pK35wUeZFp0Qy5TkNP4t//4cZtboWNqOBAVQH+SR6ckOUcN0c+lx
   iY/4aThGoTBu5Pi9x/6bXBCsGmclfiMDvhzxQxdwW8KWT7reR+96p191F
   PeKLwITYc9DWgjOxD/Gwam03Oj1HANoxf2Iv4b7s3gLfsJJbo4M3q8osu
   WVQBKf94BaIHCyuls1HXNsh/e5vF8sbOPmKXltCZhsQwBWEcZhf9HkvTu
   CH7vRo9CRTy+5f8ejqnyIp3YJ3ODC8C03bscahIWQqSZuBl6o67GboEKl
   5CCSCq4loolw8ntTUl4fpHjiirJAdoaNE582+ng96gNJFaPj+vUlGxtnb
   A==;
X-CSE-ConnectionGUID: qXt+AY/cQpqjuR4ZB+qtdg==
X-CSE-MsgGUID: 1TB+jfZYTXmPWZapMFZwoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63856194"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63856194"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 07:35:46 -0700
X-CSE-ConnectionGUID: wus1ohaFQN6BnSvM6SSATg==
X-CSE-MsgGUID: r7YtkK4RSAyLVqqXIy2YNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="197669403"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2025 07:35:45 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux4sI-000132-2V;
	Fri, 12 Sep 2025 14:35:42 +0000
Date: Fri, 12 Sep 2025 22:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6797/8719] include/linux/compiler_types.h:572:45:
 error: call to '__compiletime_assert_246' declared with attribute error:
 BUILD_BUG_ON failed: init___fls < 32
Message-ID: <202509122223.e2rgRgAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: 95719dfa323709c06ec34cc96e73e0788e19934f [6797/8719] KUnit: ffs: Validate all the __attribute_const__ annotations
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250912/202509122223.e2rgRgAI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509122223.e2rgRgAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509122223.e2rgRgAI-lkp@intel.com/

Note: the linux-next/master HEAD 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/tests/ffs_kunit.c: In function 'build_test___fls.isra':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_246' declared with attribute error: BUILD_BUG_ON failed: init___fls < 32
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/tests/ffs_kunit.c:510:9: note: in expansion of macro 'BUILD_BUG_ON'
     510 |         BUILD_BUG_ON(init_##func < 32);                                 \
         |         ^~~~~~~~~~~~
   lib/tests/ffs_kunit.c:521:1: note: in expansion of macro 'CREATE_WRAPPER'
     521 | CREATE_WRAPPER(__fls)
         | ^~~~~~~~~~~~~~


vim +/__compiletime_assert_246 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
