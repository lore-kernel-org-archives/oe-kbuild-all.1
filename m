Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF538635D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742161041; cv=none; b=WfiPRnfmQATBEufn2lkVqLwk9/1yHkwZyZm7AyPCSUNDWA1tEr3nCxprI0/eo45ipO90FQJR7qfjw/lB/5OSa9/AmKIDnnZHtcPwH2pmV53Ls8U3VPn4XN8uP4zPFgcc+sCfMbj8M9YbxtNz3KVQ61ye++HKAroCZ0GcIwmRvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742161041; c=relaxed/simple;
	bh=ykybBdEN652jSaZ3bBGwG2CO7tBPBbMAUyguvhK7J78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r4TsxpKBXnq7GFiSyZQ127J6AM/bBWGCsG3FYki7RidgIHk7wIh/EahJDnavMeW2eN6vd/TaZo6M5LsNCfiIBQzXnwWiNZxutol/NNVTU08CTvaqYMPaUPQecn87q388z98eCOd5fn2NZX8NpKTqLj4oqiFSh3G7FIDgXohQ964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxtdbpZq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxtdbpZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742161039; x=1773697039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykybBdEN652jSaZ3bBGwG2CO7tBPBbMAUyguvhK7J78=;
  b=FxtdbpZqgucr1VulFyg2ebAJ8T9uBGupHwD1zg6PACCoz2BjNM/7rIoH
   NFvq9smcHMPtoAaoSuz6NKrSWQIxLikuiReCqI3Qm7GfMtkMwSQtbDovT
   DY7ekoaUf/FNznCCV9AwEc6s7bnU72Vpa3YmOA6z5qdxF0tPwzvMBLNuu
   kny7Oi2lpowLy/FWrm2PoncRDIBbpPqz+XEIrV7omZKl+Hb2NSYzoOqdv
   3mv+3vlTDYz3tEopIzB4/b/jxekRwDzZWNwCo13fkIIC+qveQnE54yCMt
   4IFibsCInTtm2UeC4nzWCQc58+oUnJHRkImTfQm8PXRC6sEuOfIlnJSB2
   A==;
X-CSE-ConnectionGUID: kMfNJsGHTxKT6yLVbBZ27w==
X-CSE-MsgGUID: anlzlGUiR8+CqgQjCeQBeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="60642195"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="60642195"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 14:37:19 -0700
X-CSE-ConnectionGUID: amFJY+r4QTqszUMeD8Qjiw==
X-CSE-MsgGUID: 9hBugcl9TSit3CCgounvdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="121482616"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2025 14:37:17 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttvfX-000CGN-07;
	Sun, 16 Mar 2025 21:37:15 +0000
Date: Mon, 17 Mar 2025 05:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs-6.15.pidfs 3/3]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_354' declared with attribute error: BUILD_BUG_ON
 failed: O_DSYNC != CLONE_PIDFD
Message-ID: <202503170513.2n3chJJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.15.pidfs
head:   b0f4119d8b2a680c8cd019f41c64e8b5444c6b83
commit: b0f4119d8b2a680c8cd019f41c64e8b5444c6b83 [3/3] pidfs: ensure that PIDFS_INFO_EXIT is available
config: parisc-randconfig-001-20250317 (https://download.01.org/0day-ci/archive/20250317/202503170513.2n3chJJ2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503170513.2n3chJJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503170513.2n3chJJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/pidfs.c: In function 'pidfs_alloc_file':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_354' declared with attribute error: BUILD_BUG_ON failed: O_DSYNC != CLONE_PIDFD
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/pidfs.c:868:9: note: in expansion of macro 'BUILD_BUG_ON'
     868 |         BUILD_BUG_ON(O_DSYNC != CLONE_PIDFD);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_354 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
