Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD135653
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683821613; x=1715357613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OTW3U7hWP/pnenQHAXg587szd9tmcKcEkFIByNMvBc0=;
  b=eyJh6xMyT6FkapJ/tI+c2P0AAjmj3lZlBd6en7+fP+2pJNvQQM8ddbe4
   +KLkLGnDO8tLjJDIvHYxb/jZKUTI0wZl9RTekWTneiA2dHnCaBupoQcx/
   IuH6Lo/Pywc62AnGaXWSJ2OS1ML+u7O0+2ooUeP329hHA/NxCNtaT7qMK
   YA+JXyrWvRPM/7D6eOtuQkJvEMattOvy41fXZvR9Ll45RrE4jrQ7NTGbE
   detQ6/9WSfbyC8JXpxMxCS1AG+AmSaNiHYPsaGNyeIMBCRdNlen/ETakj
   9M0+DF3hJIoKVqegjjyiBJUxSHRV7437+wc8+IHWpOc3Z+94EUz5gWhoN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330905445"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="330905445"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 09:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874036719"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="874036719"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2023 09:13:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px8v4-00046O-2o;
	Thu, 11 May 2023 16:13:30 +0000
Date: Fri, 12 May 2023 00:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler_types.h:338:45: error: call to
 '__compiletime_assert_285' declared with attribute error: BUILD_BUG_ON
 failed: (24-12) >= 12
Message-ID: <202305120022.64DSCOy5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80e62bc8487b049696e67ad133c503bf7f6806f7
commit: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h
date:   2 years, 10 months ago
config: arc-randconfig-r043-20230509 (https://download.01.org/0day-ci/archive/20230512/202305120022.64DSCOy5-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120022.64DSCOy5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/huge_memory.c: In function 'hugepage_init':
>> include/linux/compiler_types.h:338:45: error: call to '__compiletime_assert_285' declared with attribute error: BUILD_BUG_ON failed: (24-12) >= 12
     338 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:319:25: note: in definition of macro '__compiletime_assert'
     319 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:338:9: note: in expansion of macro '_compiletime_assert'
     338 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/bug.h:24:25: note: in expansion of macro 'BUILD_BUG_ON'
      24 |                         BUILD_BUG_ON(cond);             \
         |                         ^~~~~~~~~~~~
   mm/huge_memory.c:403:9: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
     403 |         MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER >= MAX_ORDER);
         |         ^~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_285 +338 include/linux/compiler_types.h

   324	
   325	#define _compiletime_assert(condition, msg, prefix, suffix) \
   326		__compiletime_assert(condition, msg, prefix, suffix)
   327	
   328	/**
   329	 * compiletime_assert - break build and emit msg if condition is false
   330	 * @condition: a compile-time constant condition to check
   331	 * @msg:       a message to emit if condition is false
   332	 *
   333	 * In tradition of POSIX assert, this macro will break the build if the
   334	 * supplied condition is *false*, emitting the supplied error message if the
   335	 * compiler has support to do so.
   336	 */
   337	#define compiletime_assert(condition, msg) \
 > 338		_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
