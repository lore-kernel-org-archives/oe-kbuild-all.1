Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B359E3AD533
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307323; cv=none; b=YcRbFG49JFMhFzlMEcW5v7U+eQy1qroWtlMfTraILWGXSf1D4FmwbQb/90FfslZ3KMkCMSo12dsv9z1ge+yn7hqrEaI8A7I3ZSFJn14/7t2yTxEe3VSGHa/wJSKUhp2WhaIkcla+ZEQTRRVoE1J9Lia5W2vvFwBZtf6H0s4DjIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307323; c=relaxed/simple;
	bh=Zm8rLie7wvpHUoXKXQra5GF4aRkelE9NUpM8xh3V4W0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IEC66QgGeAz/XDTCfPq1i+jId49J/wMZaICpt5WU4sildBdH8PuiUe6YBY+E3yC0AmvKSSz49TY45gQffXDBuQuYcL639QmFLfe1P8UW1XR+C1u0wNeudv333Brh4ZO8YWouqJJ6GnEUGLZPjHX5H05TV+74ob26Qfye3SKzgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWzOoquE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWzOoquE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773307322; x=1804843322;
  h=date:from:to:cc:subject:message-id;
  bh=Zm8rLie7wvpHUoXKXQra5GF4aRkelE9NUpM8xh3V4W0=;
  b=OWzOoquEfZwXFrVu/ybIJ7/mPK06q3lOyFXDYOqlwIgl0N2sopmZQLmv
   rwtFg9FbZ10XtmWzfXUu9EiL3tVBqlM1A7h257utuMZMnyXrG2ew1SBNn
   DCLu7OXsubHaSgI3K7x/4Q5ASLh/wmcdkDpg6tbwL2Sh+5OCyQ8Qq9XiK
   KD7HFZWaCOiSM4HzcvPdDtjwQEy8ort6NHdAuzhz7RGb1zghU1B3NAuvx
   9WPnk99XXvg4kZ878l5yK0gvfZNUEeCNVeuQxA2s3IWnduEWt8Do3Hu1H
   vb7f8MgOxrqnPCcAD+5GtHOUFmsj/4+ama/SZeIchB5WGNApPXSbM1KTh
   g==;
X-CSE-ConnectionGUID: e/uz+fX6RXulaAsrowDyLg==
X-CSE-MsgGUID: OZjsiYm0QECyaf8h5ggK9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77003620"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="77003620"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:22:01 -0700
X-CSE-ConnectionGUID: KUI/6V6oQYGiYWhWtFHymw==
X-CSE-MsgGUID: LShlFdvPT1aVKtph0+wqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="246174041"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Mar 2026 02:21:59 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0cEu-000000002Il-3VU1;
	Thu, 12 Mar 2026 09:21:56 +0000
Date: Thu, 12 Mar 2026 17:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miklos Szeredi <mszeredi@redhat.com>,
 Jingbo Xu <jefflexu@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 2597/5731]
 include/linux/compiler_types.h:706:38: error: call to
 '__compiletime_assert_408' declared with attribute error: min(outarg.size,
 ((loff_t)(~0UL) << 13) - pos) signedness error
Message-ID: <202603121900.yniMMFyg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
commit: 25307ca50b815c14a21f82fc5b10e8a621af32ad [2597/5731] fuse: simplify logic in fuse_notify_store() and fuse_retrieve()
config: sh-randconfig-r073-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121900.yniMMFyg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121900.yniMMFyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121900.yniMMFyg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/fuse/dev.c: In function 'fuse_notify_store':
>> include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_408' declared with attribute error: min(outarg.size, ((loff_t)(~0UL) << 13) - pos) signedness error
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
     687 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |  BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
         |  ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
      98 |  __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y) __careful_cmp(min, x, y)
         |                   ^~~~~~~~~~~~~
   fs/fuse/dev.c:1790:8: note: in expansion of macro 'min'
    1790 |  num = min(outarg.size, MAX_LFS_FILESIZE - pos);
         |        ^~~
--
   In file included from <command-line>:
   dev.c: In function 'fuse_notify_store':
>> include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_408' declared with attribute error: min(outarg.size, ((loff_t)(~0UL) << 13) - pos) signedness error
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
     687 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |  BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
         |  ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
      98 |  __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y) __careful_cmp(min, x, y)
         |                   ^~~~~~~~~~~~~
   dev.c:1790:8: note: in expansion of macro 'min'
    1790 |  num = min(outarg.size, MAX_LFS_FILESIZE - pos);
         |        ^~~


vim +/__compiletime_assert_408 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
