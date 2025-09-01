Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0CF1C8604
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 04:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702260; cv=none; b=L8tRcHOw0SfkPax2L6BgISgulLI8CPZchyzBP1oq2oKzG7vWMsxRfi1t2ld/kfPuQIPb64gn/G37R0n+E8N2j+mpJcXplg+17LJjrfgj/FT16yIjqwzeftFU/FgZ1FVDsQI9VSoCALbGQtEoJ6A/TbV0oVDOj/W8aDVpQ1Zg1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702260; c=relaxed/simple;
	bh=GC8Clw0arb2JL7ICESwElEl+tIzWz1W1EGmbN5wcbQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tsg7keVXgLuttIXLwl/I2Ph38ngOZrXeL7D6Cmvrp8+DxUXfXNxxkjcRN88xFmZH4nUYX3bPGl3bFMKGyx9P/iHt2b7LkIZ8qJ4KwKdwrXHR4ITgDmzNx/rIEJS3E3s5RrRIwM52FX1+nmPae93+zQVrLrIcsdnNqwTvDtUmmZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaNfpOYY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaNfpOYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756702259; x=1788238259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GC8Clw0arb2JL7ICESwElEl+tIzWz1W1EGmbN5wcbQY=;
  b=HaNfpOYYuABI0dtJh0t/LfIQXjtp3vXKKIe7acueb/zlhLJ1fp4F3hi/
   ZgUi4FcBksABy944uhYKbi/edx9fr4LqCGpB04AzIlNYff6W0QyLMukQu
   YPqGwKukjgTDk8cF6QOEBTbQ8X0XtFL6oaO8KjkIcFezc9m6kBJy8+jFy
   KH4hR8H5l671iiIDZfZbqirtDWIJigIUb3Ve9DhVp503whjcrBKLlZ2oj
   KGccWe1Axc8/l+t3h3iAnW6fHupd14lN/6K+F2lOK2qvScOLIhf81C3Qv
   vXZ1O96mkJo1VTCtCHvb9QQv8SE6IHjKtJ6SYwieN7yZSWntrlomCfyaR
   w==;
X-CSE-ConnectionGUID: kRPIxmEcRQ29jRWI3xIM3w==
X-CSE-MsgGUID: X8up+lJFSm6yluqZoz4TzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="62533845"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62533845"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 21:50:58 -0700
X-CSE-ConnectionGUID: wc9UUk+PQUCoJjMwDI+0cw==
X-CSE-MsgGUID: S2+iks+SQ/SfCI3OA7ntBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175217610"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2025 21:50:57 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uswUt-0000EJ-0j;
	Mon, 01 Sep 2025 04:50:41 +0000
Date: Mon, 1 Sep 2025 12:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:for-next/kspp 17/18] include/linux/compiler_types.h:572:45:
 error: call to '__compiletime_assert_246' declared with attribute error:
 BUILD_BUG_ON failed: init___fls < 32
Message-ID: <202509011237.Hf8MjkXU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   6a38fe1a7d9c9eba3330a8ae4ece2fa5d0f628cc
commit: 159746fccb2e000bbac46fe24034d38e7df6c6e2 [17/18] KUnit: ffs: Validate all the __attribute_const__ annotations
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250901/202509011237.Hf8MjkXU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011237.Hf8MjkXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509011237.Hf8MjkXU-lkp@intel.com/

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

eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
