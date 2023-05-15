Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C1C8E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 May 2023 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684158138; x=1715694138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4iTNRTHhmWlgytCu2nBVK88LXXmkGTmb14kVqQA7Llw=;
  b=nOpOROkRdd04+zu2Y2YPJLx+fShliIDvVsenaHouDQV6VA85R/3ephGG
   oVjn7/cuMQjKE7YcQRbg94OgSVxHXxwoqM4KkniUXt7MGTHMhy0aI4PuW
   TUniGI2xgi5QBt24EfFbyuFTzqP9iPRyQJvY2gSLbcCMgUXIyQyFCmWWw
   e3BlpP8lbNDcLBS4PIUJrvKFYmKkA93f8wu9aoUfdWOErcfPQRH3gcp1E
   KmRzuIyzG49wP/8tXAKzmd1QM5KL6UbOIhyzAwOpTcTq++hQwfI/9/ypO
   JeMKbDH/10t3xmXeN8EELmDOirC68S2p560myJz0j96owXilBQP5vc2V4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340555184"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="340555184"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 06:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="703985208"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="703985208"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 May 2023 06:42:16 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyYSt-0006Ms-2k;
	Mon, 15 May 2023 13:42:15 +0000
Date: Mon, 15 May 2023 21:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:ip_tunnel 8/13] include/linux/compiler_types.h:397:45:
 error: call to '__compiletime_assert_920' declared with attribute error:
 BUILD_BUG_ON failed: !__builtin_constant_p(__res)
Message-ID: <202305152130.7B1qy1WY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux ip_tunnel
head:   6c0810b90f4a15310eef05c546aecf07a0e2c97b
commit: a7abfce2062edd37108c9ffe01768a52a0729096 [8/13] ip_tunnel: convert __be16 tunnel flags to bitmaps
config: s390-randconfig-r044-20230515 (https://download.01.org/0day-ci/archive/20230515/202305152130.7B1qy1WY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/a7abfce2062edd37108c9ffe01768a52a0729096
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin ip_tunnel
        git checkout a7abfce2062edd37108c9ffe01768a52a0729096
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/ethernet/netronome/nfp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305152130.7B1qy1WY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/net/ethernet/netronome/nfp/flower/action.c: In function 'nfp_fl_set_tun.constprop.isra':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_920' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(__res)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/netronome/nfp/flower/action.c:405:9: note: in expansion of macro 'BUILD_BUG_ON'
     405 |         BUILD_BUG_ON(!__builtin_constant_p(__res));     \
         |         ^~~~~~~~~~~~
   drivers/net/ethernet/netronome/nfp/flower/action.c:431:9: note: in expansion of macro 'NFP_FL_CHECK'
     431 |         NFP_FL_CHECK(CSUM);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_920 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

:::::: The code at line 397 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
