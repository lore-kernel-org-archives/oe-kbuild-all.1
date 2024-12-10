Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90A12E4A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 01:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733792863; cv=none; b=gcfDxr6kb8hu5nLYH3hPzQxPtMI9IApGFpkl7Dd7qGF3G4Y3y7OLeON4HrLsefk4KS47D89spAHRyyxlPDzli1/js0p+iPZN5Lx3cnG/CBWcSsXPo7dlyrk+KAL1tT7ZwZy0csHlwtA9jKGHevNstVLk2NhX46E1mxW++f1E6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733792863; c=relaxed/simple;
	bh=6a0yLxmbvZFKnnfk2jiuvZOLzL8FTj+pZ2VWmozgUt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVqXAIqJHaAqsWl4BVI7Dk/SDE1mqK+0DDUpqgKo1AOT9NDzxp/xubv2EicdziWHakl+uA4hR3T97gMRoYLvOaIg+7VxOyYEFGmUUOqd/J9ZOMWkfmIsTDysvL0wUl8VnZfaPVeWHKScRZm6UgfGD046TMsno4FzFRyGXqEXqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXt6mdSU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXt6mdSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733792862; x=1765328862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6a0yLxmbvZFKnnfk2jiuvZOLzL8FTj+pZ2VWmozgUt0=;
  b=eXt6mdSUZ/oDyFoXmNcHdrlQ10xqTbngs0sKkEp/icCH+wSi5CKqr6tF
   sZ1oTsD5IG7Qu5UYBdZBJCNgONtURSVcmTQDWZxYYl9+su2/XRG8jmzlc
   2yqrR6IN2KacbLDnZWqAYxUVGKiT7MGnwHtVQIrXs8Y2Yrn/1YNLFgOuR
   WgnKkfOnuR9dDogxUX/mrvKGeaRtoLxdvF/XL5+R7zXEiZ1dreWMtshQ0
   ESU+pZZrWoClFwxErnPrcmbuRIhHTgoUUTJBS5ofSWqaroiAZo/sX5bs+
   m/aa9tJ+QMOXndjyirYsyaiLhp6BjLY2ExNqryc7sY7Hrpn96V7zMOFLh
   Q==;
X-CSE-ConnectionGUID: LNA9atelS2yhojkrQ2Anbw==
X-CSE-MsgGUID: bFdwcowwQha5s37ZP0BPWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="59514327"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="59514327"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 17:07:41 -0800
X-CSE-ConnectionGUID: IxjS3nFUT46v11idCxqksg==
X-CSE-MsgGUID: tpv8kBi1TyaPOcDhCC355g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95725807"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2024 17:07:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKoiv-0004zN-26;
	Tue, 10 Dec 2024 01:07:37 +0000
Date: Tue, 10 Dec 2024 09:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2241/2462] include/linux/compiler_types.h:542:45:
 error: call to '__compiletime_assert_413' declared with attribute error:
 clamp() low limit source_min greater than high limit source_max
Message-ID: <202412100848.HfPEKlvV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d1486dca38afd08ca279ae94eb3a397f10737824
commit: 58febb0202b31e9e8d55a603a70f7f131455ef2f [2241/2462] minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412100848.HfPEKlvV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100848.HfPEKlvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100848.HfPEKlvV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_413' declared with attribute error: clamp() low limit source_min greater than high limit source_max
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


vim +/__compiletime_assert_413 +542 include/linux/compiler_types.h

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
