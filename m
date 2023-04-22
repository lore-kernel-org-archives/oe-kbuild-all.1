Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64DE8C15
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 19:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682193353; x=1713729353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgaWl2nOkLRmJK/tO3Xi9cC/w7gi7ihoTePLG75RLKE=;
  b=PqWJ8VmWVu15gGYHHEP1zidJU2go3CJiEN3bYIDzldjC3yUVaoaFswts
   QmdFkpqIRi73ISkXwWSjvlgeOGXBN6RrKcW5/kYCVDW/ON4uUpgMvZoek
   0ZnRcmCRNUi/+Vi3n4vqrwK6wzITZzgTXPwNks1p/cf0AOCtUCtRSCjDw
   rl7AZ1n6o2y2u1HvWYf4vXPcf0FZ/Lh824VaAzr3UDd5Yo8LF6eS+fcvo
   38BTd9W5De2Eq9rNavajD2dlVQxSI34GZTBtBw7SJ34YxGC4uSTuytjj4
   0HHqovOfdln9u7b0gEULqf5l4u5j/namTzSJvw8ShegruYe88kNOBRqF1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325793949"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="325793949"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 12:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="1022232109"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="1022232109"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2023 12:55:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqJKp-000hTB-1j;
	Sat, 22 Apr 2023 19:55:51 +0000
Date: Sun, 23 Apr 2023 03:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler_types.h:319:45: error: call to
 '__compiletime_assert_231' declared with attribute error: BUILD_BUG_ON
 failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
Message-ID: <202304230356.PiQfhkvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2caeeb9d4a1bccd923b7918427f9e9ef7151ddd8
commit: 39cac191ff37939544af80d5d2af6b870fd94c9b arc/mm/highmem: Use generic kmap atomic implementation
date:   2 years, 5 months ago
config: arc-buildonly-randconfig-r004-20230421 (https://download.01.org/0day-ci/archive/20230423/202304230356.PiQfhkvF-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=39cac191ff37939544af80d5d2af6b870fd94c9b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 39cac191ff37939544af80d5d2af6b870fd94c9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230356.PiQfhkvF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/arc/mm/highmem.c: In function 'kmap_init':
>> include/linux/compiler_types.h:319:45: error: call to '__compiletime_assert_231' declared with attribute error: BUILD_BUG_ON failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
     319 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:300:25: note: in definition of macro '__compiletime_assert'
     300 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:319:9: note: in expansion of macro '_compiletime_assert'
     319 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/arc/mm/highmem.c:69:9: note: in expansion of macro 'BUILD_BUG_ON'
      69 |         BUILD_BUG_ON(FIX_KMAP_SLOTS > PTRS_PER_PTE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_231 +319 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  305  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  306  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  307  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  308  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  309  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  310   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  311   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  312   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  313   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  314   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  315   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  316   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  317   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  318  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @319  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  320  

:::::: The code at line 319 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
