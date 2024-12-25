Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA813208
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 18:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735150670; cv=none; b=My6afjAnQY7yqqinTBNP0MASv65Y7DmB2Fq/tUAiwQn+G1sV9fCrlcK1xXcxoxByG0msb1T8mxVKEpSV0dGSQeNe43IoWuS4E0dcIAEJucrsu/E00cCYPZIyhKQl95gPWgovikwwk+11l4Q9DN431OLQO93fxArBT2iUSC696PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735150670; c=relaxed/simple;
	bh=iQQLeURJ5EDkBkDvDv3reGXrxGNZoSd0DoOrHwd3EFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z9j8LcBTuXLXzkUaSPVWauJIrVhDFRGqzfUR25JkJJnIj3vJN7EqtXkDB46kX6mDMS626x0TIu011wxRU0TuEZErzT8lrBmJH9VLeJnEUZ6c0JNQ7U1OLk4OAN47dyZwpqogd4YJhsnK+3ETn2U4zrCqFVO7Eju5Q4RHdWFZjFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2bDIRBc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2bDIRBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735150669; x=1766686669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQQLeURJ5EDkBkDvDv3reGXrxGNZoSd0DoOrHwd3EFM=;
  b=E2bDIRBc+X7Pi8BrHxL6AivVtJ7Z1pFI1ol/4e4b2IeZuyH0L3InzGa+
   wQOtxFKKfAPhhzxuOPx5czgFn1+ZS61sWetci97X6sHIEkbpMHfA1spzB
   fXwMPjUsmoBmODpgX8K0mARA1NVvYwRZaIkrs+ZhUM49oq3G20zaN15Rm
   sSr1js2TkXMKsaSlU3rW97o2xNF7vTMWGdVISSO3xuJxMhDysvph9Tgac
   BgAkWMK5MuD6fSw26g1TRQX2VM/ODeG9kYxBC91pUW1zAr7WLKYFcN2UG
   9A8XlccFWrHkwCZguNsl8MBP0VtrHslr4HU2/UflrWiF4lb6O5eJmr4Ru
   A==;
X-CSE-ConnectionGUID: GKrrPSeNSfGKMxqy70gPcw==
X-CSE-MsgGUID: aVf+T3IFSx2euE+MkjietQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46963643"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="46963643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 10:17:48 -0800
X-CSE-ConnectionGUID: vmJf2wLaQKeimUN+RLVW+g==
X-CSE-MsgGUID: oNJ2PRcvSk6EpKKZcb/56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104834463"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Dec 2024 10:17:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQVx3-00024E-0R;
	Wed, 25 Dec 2024 18:17:45 +0000
Date: Thu, 26 Dec 2024 02:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 243/244]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_834' declared with attribute error: BUILD_BUG failed
Message-ID: <202412260241.TQI0qNxl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ee700aec23eddf1b8416272cead7550a8b6398a8
commit: a31d023910a734e2aeabbee70c13858632ed16ff [243/244] trace_sched_wakeup_backtrace
config: arc-randconfig-002-20241226 (https://download.01.org/0day-ci/archive/20241226/202412260241.TQI0qNxl-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260241.TQI0qNxl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260241.TQI0qNxl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/sched/core.c: In function 'try_to_wake_up':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_834' declared with attribute error: BUILD_BUG failed
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
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:110:17: note: in expansion of macro 'BUILD_BUG'
     110 |                 BUILD_BUG();                                            \
         |                 ^~~~~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_xchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/core.c:4223:28: note: in expansion of macro 'xchg'
    4223 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
         |                            ^~~~


vim +/__compiletime_assert_834 +542 include/linux/compiler_types.h

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
