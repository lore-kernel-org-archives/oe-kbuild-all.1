Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52CC22EEC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 21:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6Bz4lZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699046446; x=1730582446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dunE/b12hH0LaKDT2PTmKwQoyHK2gQElWmhYwzc3ds=;
  b=T6Bz4lZV6eVZzam7bEmPVEE5D8OTdmd4L3zRF/iO26lbBJtOOqLxa8as
   BiNcEXM1RbUm02UTPVBxkTwrQZc9mxqs1+m9k7tH3MN26FcPBv5XDrYM6
   4bvNCxjIjPehDfghVFdO2W+zZgtxtHWoKu39KFXp8wx8XXyB4+UFbFc5p
   15KWS8+jf2zlC12pfiStnygnqW+5H8TJQtp8HikEnzF+sDy6gk95Z+LJm
   m4iJHYg3ILXgpVwy2mptzHmnqWZ6VIdR+Fzw85r8P/RW7fVXj1A+u9xMc
   Hnq5HOTaZVMnGhha8lvvHcDTL9fxo4B59azpxRrMh+UEcI6QqmL7fNoZ+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1977958"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1977958"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 14:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="755280590"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="755280590"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2023 14:20:44 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz1ar-0002xA-3B;
	Fri, 03 Nov 2023 21:20:41 +0000
Date: Sat, 4 Nov 2023 05:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(priv_tbl->probs) % 16
Message-ID: <202311040529.YYvYEwle-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrzej,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 00c47aa85bb26450edc6059c3d245de062e60b5d media: rkvdec: Add required padding
date:   12 months ago
config: arm-randconfig-003-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040529.YYvYEwle-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040529.YYvYEwle-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040529.YYvYEwle-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/staging/media/rkvdec/rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:338:25: note: in definition of macro '__compiletime_assert'
     338 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-vp9.c:1011:9: note: in expansion of macro 'BUILD_BUG_ON'
    1011 |         BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_304 +357 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  343  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  344  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  352   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  354   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  355   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  356  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @357  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  358  

:::::: The code at line 357 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
