Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44619173
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754188270; cv=none; b=WBtGpt+V3GpCwS9RRdqRn9g6nPtNOsIiZRnvOJaU/beAcVzULqodV9/VFXMOGqOU1I9pG1hcfhfJUTJQK3CCXWr06Oj+m/kRgB59BxMN+2dqQ3Di7i0ya1hihRJldwFWvJ7Fl0FFzltfOJosFwDTQDtZWpy/tPrlHkqrK32EplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754188270; c=relaxed/simple;
	bh=9XFPyumX+u+suVKu/vCkQlUho0r6iR/IUryMuVjN6dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkKKgq5MvkImNK738wBHO9KSsHI8eoA5hxJ1aSiLC7YTOrRNMq/kG1m8LjVDoSCJ5ndG2lYt0KFjDPBSTz8E2nZnWA2ZqSqLSVzAGjCydaHswjy4HG2oz4yn8Gd6aRjR+eWRhnz0r12rRRoLsJZ8K3GnwLSr67z5h+JjpFZcdGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYHi7tPq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYHi7tPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754188269; x=1785724269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9XFPyumX+u+suVKu/vCkQlUho0r6iR/IUryMuVjN6dw=;
  b=hYHi7tPq1dFF3PiNepWLZGy9dphVVqA09qSgvqHLPbhzaLbXZ7j33Xg+
   PGhZRaMCt9I8u6fnSu5/+7BB5MMuY8Mx2jDjeRLEt4yljBSpnMhEjCiNV
   uLbDLVBlDCP8x6T2FktlcOQnbc5tRfDkqMYg19rKxvGi/fgYs4LuI6is6
   4onW28qPxtL2e17kMorP8FqF/MJrgZH2OSahOHdKRQp13oCoCe5NSCTlk
   dNrpmGDuEM/kWHbY6UTnbFc9ukWBk+U/vPKJLayGdJOHG0+l1izrn1iZF
   dghHRUFiTd0NhPZSTD6QGihcv9zNoE1sSogj0hYe8mQbcynH08/T1nNs7
   A==;
X-CSE-ConnectionGUID: FhSurMs3QFSCeC8tPq2dzQ==
X-CSE-MsgGUID: cqchJx8jTmW3KFhCaNYrYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56633319"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56633319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 19:31:08 -0700
X-CSE-ConnectionGUID: jdsmdgJ2T9m0xs2X4srPaw==
X-CSE-MsgGUID: YdHQ4zICTJWDG5bG0iKXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164319910"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Aug 2025 19:31:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiOV7-0005jI-0q;
	Sun, 03 Aug 2025 02:31:05 +0000
Date: Sun, 3 Aug 2025 10:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:ready/next-20250801/ffs-const 17/17]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_242' declared with attribute error: BUILD_BUG_ON
 failed: init___fls < 32
Message-ID: <202508031025.doWxtzzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git ready/next-20250801/ffs-const
head:   d9f035e9f405abb3990b8603f40b4be613c0bb09
commit: d9f035e9f405abb3990b8603f40b4be613c0bb09 [17/17] KUnit: ffs: Validate all the __attribute_const__ annotations
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250803/202508031025.doWxtzzc-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031025.doWxtzzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031025.doWxtzzc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/tests/ffs_kunit.c: In function 'build_test___fls.isra':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_242' declared with attribute error: BUILD_BUG_ON failed: init___fls < 32
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


vim +/__compiletime_assert_242 +572 include/linux/compiler_types.h

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
