Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A973BE4A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebGm+tgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699205299; x=1730741299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDCwqlVch+ojaiAx1S4djZX43XFw12GnoquKjf81qbY=;
  b=ebGm+tgr+lreLe2ne6fQ4zKMXtxelPnVhT9k/s5xm2OOYmfnDhRnj8wJ
   QhmMkZoPxOCU5IssEEGYJvh1FMDCWGyYZ+0KcOh8wfUpqyTz0XbOKfRVr
   cL/tv33KwD42LFFCoyrPmcKsCT2C6PKoDHz2kVSXZHpLEEbTAhpU2nJKh
   i0xleGvt9plj8dn/hFejeszmTxeYklhD7QtU7VYYGCGdlw6x07xC55t2X
   U1sqml66TE0OcUPv86bevhYvuw0M+MiZgDfo6sPupmjf5l9n9IaRqgEbC
   lcNR/nhp/JzWiKVt/xkRmsSsTT5AAHtm6bvlYBZBrdxl9tiXHr2FmMrrN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392029085"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392029085"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 09:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738591940"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="738591940"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2023 09:28:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzgv0-0005fA-0q;
	Sun, 05 Nov 2023 17:28:14 +0000
Date: Mon, 6 Nov 2023 01:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: include/linux/compiler_types.h:354:38: error: call to
 '__compiletime_assert_282' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202311060135.Q9eMnpCL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amelie,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 1c32d6c37cc2a037e447e73f919d57e89ef4b571 dmaengine: stm32-dma: use bitfield helpers
date:   1 year, 2 months ago
config: i386-buildonly-randconfig-004-20231010 (https://download.01.org/0day-ci/archive/20231106/202311060135.Q9eMnpCL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060135.Q9eMnpCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060135.Q9eMnpCL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   drivers/dma/stm32-dma.c: In function 'stm32_dma_prep_dma_memcpy':
>> include/linux/compiler_types.h:354:38: error: call to '__compiletime_assert_282' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:335:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:354:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1237:4: note: in expansion of macro 'FIELD_PREP'
       FIELD_PREP(STM32_DMA_SCR_PBURST_MASK, dma_burst) |
       ^~~~~~~~~~


vim +/__compiletime_assert_282 +354 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  340  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  341  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  342  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  343  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  344  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  352   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @354  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  355  

:::::: The code at line 354 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
