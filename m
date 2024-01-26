Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B124320321
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706295077; cv=none; b=jPDQrGNFzgaKO1gSJsP1BUbceCTYwbyOHA31Z69mphA1A+IH5UZk0RyFPu+9peKdpaKV3gK3lmYBZbD3+04TkKdJj56rxeAOmpDjgqZgSnn79bb4ccrPuOaXCuUxCbuGzNBoxmZUtSG/PVcjxKddPuawuR8zCFrMy/a7QGHkYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706295077; c=relaxed/simple;
	bh=sqeiRmsrbRz91nKO1WL1iuNMfJY4Fsjraw03xPDQlyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LrkARkfKEUo3zK1xTzIwsMgs3Flc64dEyRGNEoybXfNy5XDIikg4zF6g3O/iVQwJ0bO2psGOf2UPukaHKjRoGO0/jj5qMGb+m9kaQcEPHNWMLseldpgXMaGhmVk4PjzAJCirlkRc9kwDblXUjSYd6+CM+vJ5sTNjLwjnUqps1FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtQHeRle; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtQHeRle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706295075; x=1737831075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqeiRmsrbRz91nKO1WL1iuNMfJY4Fsjraw03xPDQlyE=;
  b=QtQHeRlepXizc0hKA4hiz7yPVcl2YNO6jZa98VMfeVR8/TPDhCh2KDcQ
   druxAt6bFc9NnCbUs01OxgMU0WjAIvq5GZHszUJ96JgVg+YLoxDhoszQp
   +rwCWhyh5s+hsSM9o8gdjv/iUm2eu+KE+htqXjBYeQ56xLYSh62q7DiAH
   RKKVAWTgbwag2c9giVd6MxrHo3C1AB2qbK33lxlRL/UJ+T///dx1dWgY0
   Y5vhqmqvN1EiKjzCp4er/Y9yMR08dJHNun7Uf3SenLosLYW8X/92bP5yV
   e4cwY0hj6gAy5XdPdV+uv/mF/Z/xztDEbR1Xp5vDUZltmduWEiNccAVIq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="399703665"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="399703665"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 10:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910411045"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="910411045"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2024 10:51:13 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTRIE-0001HE-1y;
	Fri, 26 Jan 2024 18:51:10 +0000
Date: Sat, 27 Jan 2024 02:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:master 1/1] include/linux/compiler_types.h:435:45: error:
 call to '__compiletime_assert_297' declared with attribute error:
 BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
Message-ID: <202401270214.aOHwZfe0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git master
head:   80997c8b66fd8d73a96cd681a473bacaf75b7d98
commit: 80997c8b66fd8d73a96cd681a473bacaf75b7d98 [1/1] x86/ptrace: move down unused registers
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240127/202401270214.aOHwZfe0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270214.aOHwZfe0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270214.aOHwZfe0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'pt_regs_access',
       inlined from 'putreg' at arch/x86/kernel/ptrace.c:403:3:
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_297' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:416:25: note: in definition of macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kernel/ptrace.c:245:9: note: in expansion of macro 'BUILD_BUG_ON'
     245 |         BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
         |         ^~~~~~~~~~~~
   In function 'pt_regs_access',
       inlined from 'get_segment_reg' at arch/x86/kernel/ptrace.c:287:10,
       inlined from 'getreg' at arch/x86/kernel/ptrace.c:416:10:
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_297' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:416:25: note: in definition of macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kernel/ptrace.c:245:9: note: in expansion of macro 'BUILD_BUG_ON'
     245 |         BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_297 +435 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  421  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  425  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  427   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  428   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  429   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  430   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  431   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  432   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  433   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  434  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @435  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  436  

:::::: The code at line 435 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
