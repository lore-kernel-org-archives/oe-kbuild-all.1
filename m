Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6DC1CAA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rl2XKMPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702061239; x=1733597239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0dpiYkFWNfw+Rx+DXW3uexg8WUwCjLmFFW6EqgD4Yc=;
  b=Rl2XKMPqCuQ42Nc8uLWai9rKd99Qx7mvRh/bv0oS/UYNxajJHdFeS/sx
   NUE1nbV7W40ypcyvtUvyvLlL5eUB9XZwt1oQvJm1rFW83tOE+d0I6mLtV
   eeQkfITCgMCFqT1mkM9b8wAAWSDK65kOfh8rGQX4c0lqa+QL/tDE9qBLT
   sTxXWG21jyqZrLb1nVE0YbMF3j2lfuON1yb5wTg2qpLS4rFwtgH6wf/XM
   lG5KW5IuuOWX+ZG3Y35TzV1fUIVc4ZZlgR7+z358dd/MAEiz5MUQyFeDc
   K4PZp0x558CVrEuYdhCBHYcROvclopL1l84rhciPCKUSLEatLcU5in2zO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1533246"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1533246"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 10:47:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806492487"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="806492487"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 08 Dec 2023 10:47:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBfsY-000ECX-2h;
	Fri, 08 Dec 2023 18:47:14 +0000
Date: Sat, 9 Dec 2023 02:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.con>
Subject: include/linux/compiler_types.h:435:45: error: call to
 '__compiletime_assert_367' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(*vcpup) > SMP_CACHE_BYTES
Message-ID: <202312090256.cFjQffxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4df7c5fde316820286dfa6d203a1005d7fbe007d
commit: db2832309a82b9acc4b8cc33a1831d36507ec13e x86/xen: fix percpu vcpu_info allocation
date:   10 days ago
config: i386-buildonly-randconfig-002-20230825 (https://download.01.org/0day-ci/archive/20231209/202312090256.cFjQffxG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090256.cFjQffxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090256.cFjQffxG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'xen_vcpu_setup',
       inlined from 'xen_vcpu_setup_restore' at arch/x86/xen/enlighten.c:111:3,
       inlined from 'xen_vcpu_restore' at arch/x86/xen/enlighten.c:141:3:
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_367' declared with attribute error: BUILD_BUG_ON failed: sizeof(*vcpup) > SMP_CACHE_BYTES
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
   arch/x86/xen/enlighten.c:166:9: note: in expansion of macro 'BUILD_BUG_ON'
     166 |         BUILD_BUG_ON(sizeof(*vcpup) > SMP_CACHE_BYTES);
         |         ^~~~~~~~~~~~
   arch/x86/xen/enlighten.c: In function 'xen_vcpu_setup':
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_367' declared with attribute error: BUILD_BUG_ON failed: sizeof(*vcpup) > SMP_CACHE_BYTES
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
   arch/x86/xen/enlighten.c:166:9: note: in expansion of macro 'BUILD_BUG_ON'
     166 |         BUILD_BUG_ON(sizeof(*vcpup) > SMP_CACHE_BYTES);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_367 +435 include/linux/compiler_types.h

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
