Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8B22578A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162596; cv=none; b=CFC3ZzxT2E+PPsmLIRi19BI2ULha49WuIuBiZALNPGoZLaPDychiH5NLhSbNZmYlMiNjX9PIZhn0jsbnjWZEZCWkyk2ZPHxASCOWldSrfXKcCuW1n1rHyJGPwC3wdgnV7zRud9Eki+/iABf5DgrgjsWX7iVnUvjdXAg9hAFjaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162596; c=relaxed/simple;
	bh=4+1FQIICLnqymKHqL40HjzrFMHnZVku+ZZujtP52Khs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmBedG2keROB4WOfuNcCen9SoaMjASMANzKKvM4Ey4JvFY+UWsk7CGrIkH2EXQgaf8HUNR75hKhJnaY68obFs4Ri9C5gC7X0YvCUDfJ5ePWhHwAWhaiC/Fduy4QyU9iX5yes8bOVtkbGpituf/f6aZ/rjB89GAWY3pLadlj2Yac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3QCL3A9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3QCL3A9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162595; x=1795698595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+1FQIICLnqymKHqL40HjzrFMHnZVku+ZZujtP52Khs=;
  b=P3QCL3A9/+kSyyoqULx8+fBBATAc9vArhW7Lv0RgQt1Q0rEyuJKSAQWp
   Ql9BLxys4Tuu/3otdzio0pd96Hy9tUH/MB7QauKUK8unvNDG/rhsd1A2r
   YmNygagQ8JzbwPOHAXRgN0/UpEee9Noe/+95BIbHe11xDFXFHpa6fvY+H
   +3oLKlgHWv2lkAROs9The6wj2qa6W7z6Zz4TlDCGgYhASB6h5Q+Qv7GuJ
   tHeuNEZcYgfBsvUCUahbGDJcz5SMKvO8aYRA1iZjvUL7cyBrwLAHY9Dzg
   33sofjJ3BSIQB4C0zi5bDpzCvHm/AVkRWM5eeqsYyBwFZQx2SOKjFwCCp
   A==;
X-CSE-ConnectionGUID: XOtFm1kQT3m/9E3eLFmYAA==
X-CSE-MsgGUID: RPlBTmE0TYuaSqgZNn4Uog==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76883864"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76883864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:09:54 -0800
X-CSE-ConnectionGUID: t9n+ZLx5Tziv9PRDnGH2Ww==
X-CSE-MsgGUID: F0vS0PGgTbKy3ABF1Rstpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193171797"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 05:09:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFHL-000000002sx-2I9b;
	Wed, 26 Nov 2025 13:09:51 +0000
Date: Wed, 26 Nov 2025 21:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/34]
 include/linux/compiler_types.h:375:45: error: call to
 '__compiletime_assert_248' declared with attribute error: BUILD_BUG_ON
 failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
Message-ID: <202511262119.tDfPRQQp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vaibhav,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   b7295d083bb42b5cfeb6dbcb6593702887539baf
commit: 345e3e5b6400f9ee03b8fad705e399b05d46ef1a [0/34] ANDROID: mm: Fix gfp bit position of __GFP_NO_INIT_ON_ALLOC
config: i386-randconfig-014-20251126 (https://download.01.org/0day-ci/archive/20251126/202511262119.tDfPRQQp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262119.tDfPRQQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262119.tDfPRQQp-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/radix-tree.c:288:6: warning: no previous prototype for 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   lib/radix-tree.c: In function 'radix_tree_init':
>> include/linux/compiler_types.h:375:45: error: call to '__compiletime_assert_248' declared with attribute error: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:356:25: note: in definition of macro '__compiletime_assert'
     356 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:375:9: note: in expansion of macro '_compiletime_assert'
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/radix-tree.c:1596:9: note: in expansion of macro 'BUILD_BUG_ON'
    1596 |         BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_248 +375 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  361  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  362  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  363  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  364  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  365  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  366   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  367   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  368   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  369   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  370   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  371   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  372   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  373   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  374  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @375  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  376  

:::::: The code at line 375 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
