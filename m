Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298E19E7D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132312; cv=none; b=kkBmS04ldDuo552gRPNycAsmAmXroEapdApxJDe1oKXvKhr5c7p5Wi6uR8vvbQzcPZMU14PoWavnpXq+gmsBG0nLN2Go2XNEViPszN0PgwvZVHah+ghur539eyQ4iQShcFKwoNWXEsSoUa14UVaFkELEDJLJo8gQkTlQmn3uYW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132312; c=relaxed/simple;
	bh=su7JWwf00qelITxMnm9O1N2PrDW+4Exyfdu9OPQscp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENGJkHkDW3+IdGauECGqh4xKcLlQik99AK5WgsSHsKA0fyAHGHZ3+rSquR1HurG9RDfsE0tJOhpK1HXq6MxaR2OjIWkcAMc4mxcFfzb7c6FBonpWrvJfmKZ1+ZaTOVj5znh4sTGdt1/D7j7osCd6xb5OFa9OWcv2pLvoaeSVo4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dj6yK1EZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj6yK1EZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737132310; x=1768668310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=su7JWwf00qelITxMnm9O1N2PrDW+4Exyfdu9OPQscp0=;
  b=Dj6yK1EZUnnuAM5O7qTPBMVWr8E5BgnbJx+UwEkRQ939MJAcORfpBY2m
   crIaTBO4BeDR1wuDj+y42RSdhlGRF7tZh3M4R0stwH3m7b7tApzkC2bXN
   TdDMKdYdV5DX4u1vqyhbyqXd4p4fdJzhW/1Ux+9dMf0Z86gzOifhQJggk
   edz8rnQMN2VjbxfKVcEG5tVABRruf5OMd0DeKM7q+G2ADN6Heen9/Ql9N
   D9IwpZVeWqt2OyzjZE2LB+cnVxcM83iCa5VmfZfuULIDriNx1K65sy+hC
   CM8cGThQUqtcTBP/T4lo0BdKf9jHxEuf0Cneaat2uIHwaOjAX1KXEn+2d
   g==;
X-CSE-ConnectionGUID: 3zHG6soXQcK/s1adHMsF/Q==
X-CSE-MsgGUID: Wc9/vLVMQSeHLf1eeAYIeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36777111"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="36777111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:45:09 -0800
X-CSE-ConnectionGUID: IEnp6/jARe+obg8D7pcSXg==
X-CSE-MsgGUID: tB8+owHRRMmH79SDqMN/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106307577"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 08:45:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYpT0-000TTr-05;
	Fri, 17 Jan 2025 16:45:06 +0000
Date: Sat, 18 Jan 2025 00:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5931/6768] include/linux/compiler_types.h:542:45:
 error: call to '__compiletime_assert_584' declared with attribute error:
 clamp() low limit source_min greater than high limit source_max
Message-ID: <202501180047.G9mux9bG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 17d67d1853e5c9a5fdfd30dc04e67e7be6069693 [5931/6768] minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
config: powerpc-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180047.G9mux9bG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180047.G9mux9bG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180047.G9mux9bG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_584' declared with attribute error: clamp() low limit source_min greater than high limit source_max
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:109:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     109 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:116:9: note: in expansion of macro '__clamp_once'
     116 |         __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^~~~~~~~~~~~
   include/linux/minmax.h:192:28: note: in expansion of macro '__careful_clamp'
     192 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_backlight.c:47:22: note: in expansion of macro 'clamp'
      47 |         source_val = clamp(source_val, source_min, source_max);
         |                      ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]


vim +/__compiletime_assert_584 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
