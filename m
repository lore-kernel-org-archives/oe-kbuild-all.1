Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3B81841
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 04:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSVzEdB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698812586; x=1730348586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QAfJKWDD8WSGngPyMy7jkbkuF3vJvwupLnmPFqnd6cg=;
  b=kSVzEdB9UJFPOc5C6dZRlAXc6leIANHxEKGMg5CelUHc0inChk+UoUx2
   gpFI9sIaUvqNCLUuqnUerxXXe9g6RnqazL4WDfepqDPtZcenu0oomGTkY
   RQnzPXEvGSBKiueK5P0DtnytfgFbTinnL7X7MNOlisQ4+eYa2qXASPrin
   WSHT48GAKEDt9hkwzu1ZsTuWwVuODB80YFqwDONfK+lCW5pYLFDv1/ypn
   /MemUy/rDXS0T8NDnlLqchVhxc4QLJbU9h9aoM5IbXsGgLkN2K2OafoMy
   2DxBMsqAacvpFpeqoT2jAxlS57GLXi0rBlpaZj5QPotE22N+h8PZp49Gz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="7060511"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="7060511"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 21:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="1978006"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2023 21:23:01 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy2ks-0000bM-1k;
	Wed, 01 Nov 2023 04:22:58 +0000
Date: Wed, 1 Nov 2023 12:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Tina Zhang <tina.zhang@intel.com>
Subject: [tinazhangzw:vt-d-pgtable-20231030 19/28]
 include/linux/compiler_types.h:425:45: error: call to
 '__compiletime_assert_253' declared with attribute error: BUILD_BUG_ON
 failed: VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000
Message-ID: <202311011245.RSAq7wS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git vt-d-pgtable-20231030
head:   d67187b15fc1f529c2ad0e7adcd3ced0c6818ecd
commit: 266feb1f32c3d50bf63deac5eb506c83d3b8e7ee [19/28] iommu: Add virt page table format
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231101/202311011245.RSAq7wS9-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011245.RSAq7wS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011245.RSAq7wS9-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c:336:9: note: in expansion of macro 'BUILD_BUG_ON'
     336 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000);
         |         ^~~~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:336:22: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     336 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c:337:9: note: in expansion of macro 'BUILD_BUG_ON'
     337 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(1) != 0xfffffc0000000);
         |         ^~~~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:337:22: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     337 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(1) != 0xfffffc0000000);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c:338:9: note: in expansion of macro 'BUILD_BUG_ON'
     338 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(2) != 0xfffffffe00000);
         |         ^~~~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:338:22: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     338 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(2) != 0xfffffffe00000);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c:339:9: note: in expansion of macro 'BUILD_BUG_ON'
     339 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(3) != 0xffffffffff000);
         |         ^~~~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iommu/io-pgtable-virt.h:31:41: note: in expansion of macro 'GENMASK'
      31 | #define VIRT_PGTABLE_PTE_PFN_MASK(lvl)  GENMASK(VIRT_PGTABLE_PA_BITS - 1,       \
         |                                         ^~~~~~~
   drivers/iommu/io-pgtable-virt.c:339:22: note: in expansion of macro 'VIRT_PGTABLE_PTE_PFN_MASK'
     339 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(3) != 0xffffffffff000);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_253' declared with attribute error: BUILD_BUG_ON failed: VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-virt.c:336:9: note: in expansion of macro 'BUILD_BUG_ON'
     336 |         BUILD_BUG_ON(VIRT_PGTABLE_PTE_PFN_MASK(0) != 0xfff8000000000);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_253 +425 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  411  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  412  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  413  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  414  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  415  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  416   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  417   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  418   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  419   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  420   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  421   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @425  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426  

:::::: The code at line 425 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
