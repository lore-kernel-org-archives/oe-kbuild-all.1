Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A510A48
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 01:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754097192; cv=none; b=aNAur+JaDVz0yUbp42NFxWjwJGxV7mZwHoMvfeDJ/lHXYyzQsLzib68W7tNaLH55OZ8hRUz0RBxm1NntfgyfhqwQgftuhikKaVLlfOQXXJNjfLKLfqGB6ID8i/Wxtx8qWCJ/u4o8ZZyHDNePh5k3PkMTsh/SD5gZvwyxFWjUzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754097192; c=relaxed/simple;
	bh=KIvSmDWhjgSj+vllGg/ZutMv1ENKudGwXdScBNVpEBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ETwjsVQKIZV+4Y/4dpBmgx6pPVSTQPKk5+aVxbZ/3PiwpWy+wfCEtar0RPDwppLL3Pk8bJ6EoD3/stAYLrIFJ4YiqCFz2MlvsgDqTnR71aq0yvvhwY0XuP96nf3GFsnA9qWMdX9X6KnMPl+HlPszpbmFpqGZSBea9HZMoBIgTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqYYIac2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqYYIac2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754097190; x=1785633190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIvSmDWhjgSj+vllGg/ZutMv1ENKudGwXdScBNVpEBA=;
  b=lqYYIac2joLDMCMWLpp4RkZLdjMy3ge+Ek2ADlj5lQ2AQv3g0Up+Pw1/
   40kVVYfhhtg47z7ckPOUHmrbM7OChDHg2IfaMv79SsIht5MAOVIORWiH1
   r1nhs5UARS9GiIX27nT+gE7YzKl4y+jhJT1hNd2oFt9VnD4bdThhBNL4/
   qT+8PWQswUrBya+Krki6lEGsDKru88dUz5ZNqb/oNKdGucdv+osaLifU6
   Gu+f+9OdyUw37JLT7hskFHHpWKiulTRqdJV0D1UaZxYoeqSULQLTMH0IN
   LMhLh9Vf/D3rktHNprOO2dLgjMYoPQNfiyOyXT9y4LSWthopg7S1SEmyo
   Q==;
X-CSE-ConnectionGUID: Bke+wVweRqWQglbD5ZIidA==
X-CSE-MsgGUID: 8hrMaNwfRf6ZmF4eylENfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56593828"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56593828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 18:13:10 -0700
X-CSE-ConnectionGUID: f0nT5ZxRSdy0Ltw+pBHhZA==
X-CSE-MsgGUID: 0LOff1MgS1W/PhCa4ThkZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163714059"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2025 18:13:09 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui0o6-00053s-2I;
	Sat, 02 Aug 2025 01:13:06 +0000
Date: Sat, 2 Aug 2025 09:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/tidss/field-api 4/15]
 include/linux/compiler_types.h:568:38: error: call to
 '__compiletime_assert_438' declared with attribute error: FIELD_PREP: mask
 is not constant
Message-ID: <202508020917.zNoaOugQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 73915f6d396b27101175651c8980a4269e98502f [4/15] drm/tidss: dispc: Switch to FIELD_PREP for FLD_VAL
config: arm-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020917.zNoaOugQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020917.zNoaOugQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020917.zNoaOugQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'FLD_VAL':
>> include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_438' declared with attribute error: FIELD_PREP: mask is not constant
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
         |   ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
         |   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c:614:9: note: in expansion of macro 'FIELD_PREP'
     614 |  return FIELD_PREP(GENMASK(start, end), val);
         |         ^~~~~~~~~~
--
   In file included from <command-line>:
   tidss_dispc.c: In function 'FLD_VAL':
>> include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_438' declared with attribute error: FIELD_PREP: mask is not constant
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
         |   ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
         |   ^~~~~~~~~~~~~~~~
   tidss_dispc.c:614:9: note: in expansion of macro 'FIELD_PREP'
     614 |  return FIELD_PREP(GENMASK(start, end), val);
         |         ^~~~~~~~~~


vim +/__compiletime_assert_438 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569  

:::::: The code at line 568 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
