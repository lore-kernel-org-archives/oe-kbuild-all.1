Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFE18EB0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 06:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743833032; cv=none; b=tbgWE5C3SewVoVdDz0MqJRhTnvJX7XS6tILr1J7BYasShzoUsoXiXTXT6wyEKKJjM2uPagfOlhYs0icy15D+VXb30fZOxl9qyJUcPljcCkCvO0ojUNq3rmPYiLJ/GG1zKkZUnb/s/M+tHTP1wQ018XcdHqSO7P6dJ8ZuNt8wVbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743833032; c=relaxed/simple;
	bh=lDr0GInNCsO7qkiH5Bwm4YjNjOaIYnHd5MK/RbEerm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h31SPyWjddxMowmKaNlkwO+aic7tpAaopqsMy+lUxCiZ5fnr+juaVRqJ2lllWJmbqAAK6OwLizIX2pf5Kvjrs0YHzBoh0znOmXUcL5BFjPABsh/pUEO5EbhrqRXWxTZ7HXCYq2etzBE79PgabdIoy9/pw6zBnsNmCFqDdJXUj7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WY770xnd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WY770xnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743833030; x=1775369030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDr0GInNCsO7qkiH5Bwm4YjNjOaIYnHd5MK/RbEerm8=;
  b=WY770xndmPY4ey2VQDkcUEd0qWbG7CNZZkypsiIgGDe5Fjh2FXclNav5
   noQA6TVpNEznRWNbIXNO5+TD9EYxcieXbBiNSGVGZTx/pKrWMJMOjQP9k
   4deMbd5ORcJ8KPKX/xBnRJjqPZADYdyMXPf+z17U1ggfSFmCaa4GxDEuZ
   zvNsKQ7kBqu0OqdrLwy7gapbHnnLpGufUIf0So91sj9+vn9N7nHFWsZ6p
   MmsRYlmKygR/naH1DlHhgBTYOB7jO+DMKxhqdSkUfjD3ractuvsFzo22R
   shUj0ZDMnhH4LajPXBGBCwSEPZyHlaC4vwmRHAgJ9Lvq2T5zoiVDh7+7E
   Q==;
X-CSE-ConnectionGUID: 3LJ1GF8xQDSgCiIwq0ZMbA==
X-CSE-MsgGUID: wlxaZOwfSFmQEjD/RB9mSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44525636"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="44525636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 23:03:49 -0700
X-CSE-ConnectionGUID: ux92WAHtR3CD5EGuSpB9+w==
X-CSE-MsgGUID: /T5ADHwTSLqPFHCLmkUctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="127799616"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Apr 2025 23:03:49 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0wd8-0001r2-1f;
	Sat, 05 Apr 2025 06:03:46 +0000
Date: Sat, 5 Apr 2025 14:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 6/6]
 include/linux/compiler_types.h:517:38: error: call to
 '__compiletime_assert_288' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202504051349.qRb3X07o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   aeb2c9cc1c66ef1baed03766392396ef8e5c9d3d
commit: 47e1bb6b4ba0987139ab790efa03c542ebc1b10d [6/6] phy: stm32: Add support for STM32MP25 COMBOPHY.
config: arm-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051349.qRb3X07o-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051349.qRb3X07o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051349.qRb3X07o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'stm32_impedance_tune',
       inlined from 'stm32_combophy_pll_init' at drivers/phy/st/phy-stm32-combophy.c:247:9,
       inlined from 'stm32_combophy_init' at drivers/phy/st/phy-stm32-combophy.c:459:8:
>> include/linux/compiler_types.h:517:38: error: call to '__compiletime_assert_288' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:498:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:517:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/phy/st/phy-stm32-combophy.c:162:8: note: in expansion of macro 'FIELD_PREP'
           FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
           ^~~~~~~~~~
   include/linux/compiler_types.h:517:38: error: call to '__compiletime_assert_278' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:498:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:517:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/phy/st/phy-stm32-combophy.c:141:8: note: in expansion of macro 'FIELD_PREP'
           FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
           ^~~~~~~~~~


vim +/__compiletime_assert_288 +517 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  503  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  504  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  505  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  506  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  507  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  508   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  509   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  510   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  511   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  512   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  513   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  514   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  515   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  516  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @517  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  518  

:::::: The code at line 517 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
