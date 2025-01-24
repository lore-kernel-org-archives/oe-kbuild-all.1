Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3B1D935A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 04:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737693828; cv=none; b=RxiIft6SFCgj09oNB0yfq6vJKtrxhtvcRygBLc6u2pdvWViGIsYsDLTnCX62cABTpiNgZK/ZGh5sdDqYH0RoT2LMZHp5Bu2eqg5LZd7cf6LVfm6Go7GR08DQuluOeorRTvHqqsb3eem+ZArInrUOqBFcliANyui/HUqC12adIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737693828; c=relaxed/simple;
	bh=9On3gjIA4HdE0rbrfd0ID6ZJI8FUv3UylDY3EDGKUcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DvAkwJSo4b8EOhxEwVCs9eGZ8isvR3Ouh9f6SSh1i/phpaLQwqVLtDCv6gzsDRF7Vhd85bQ9xrZRtAQd8kczmdc0KfsYYZgSTnXxNEAkJmQmDjpi8DxlGAfOjvwoO+0Km1zWMawGRmOP9BlrKOMJu3da9JAsn1Oa8dpO4Ho4zw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVzlN72h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVzlN72h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737693827; x=1769229827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9On3gjIA4HdE0rbrfd0ID6ZJI8FUv3UylDY3EDGKUcU=;
  b=jVzlN72h/26Lk11NQ0f7S6SkGA7W67qvNRhhkKC7D6z5zTx5MXPfkxWA
   vAF9yTRYLhDwmefN3T/jNAhHQotHxxb4GQA21x/kymFH/p1twleXZGnk/
   1n2NDU909fxktY0ke9W3qx1LbJWg/iB0FLBvTKg3UxEghNnw5Ou6Y2oDs
   VjR7LM31QVSaonZHRTkmaV+GPvNv8wmVTk/TsVJCJH86WT152GB38yXGQ
   lbx9lqkQx5SjKd0HazHt5l/0u5TZKNvtpkwW+zld3KBfKhUyacxMhy+MA
   2ltzdtSSIG09A27F2avL4s+vN4281KsTRnMpuu4q8svVOiC4ARjIuFAIo
   Q==;
X-CSE-ConnectionGUID: STnhKBCQTPeSq8QuPQcFhQ==
X-CSE-MsgGUID: F8bkrGaPQhyJ1xFCkZNM7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="42149126"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="42149126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 20:43:46 -0800
X-CSE-ConnectionGUID: 75XaK9maRi62Eg6GYiWxig==
X-CSE-MsgGUID: 3VmCCH6ASvKxpIIg63FSrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107590763"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jan 2025 20:43:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbBXi-000cAN-2o;
	Fri, 24 Jan 2025 04:43:42 +0000
Date: Fri, 24 Jan 2025 12:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8893/10150]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_375' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Message-ID: <202501241212.P5WoAaw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   853d1f41ba73e78d22e7075d9a95670aab187eba
commit: 37f375aab0c585388b90d1af6968454fc2769cb9 [8893/10150] minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
config: parisc-randconfig-r131-20250123 (https://download.01.org/0day-ci/archive/20250124/202501241212.P5WoAaw5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241212.P5WoAaw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241212.P5WoAaw5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_375' declared with attribute error: clamp() low limit source_min greater than high limit source_max
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


vim +/__compiletime_assert_375 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
