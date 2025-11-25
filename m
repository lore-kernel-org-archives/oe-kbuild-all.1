Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6027B34F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 22:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108802; cv=none; b=GYYMzU1LsVwoyKXePNnb9OjnOxU5wjv50jvNnhyEddCZptbvi9IMj1/LeIfdH8bDUffcsw2QTtIH5vX8t1RX505juQV51Eozyxa5o+XDwNyh8D3IzLFQxqbdQD63b3E7pL0Z3djcdjp3keRxE7JyJUggKLXgmo4kRWem8Z/mulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108802; c=relaxed/simple;
	bh=o7lmEc/4jUcAeBvbJO0WlkOJKci8haL71Rt2PHUUsFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsuumWxzCkqHA89O6rCH3gqO3jo+QYqBR1fWplyhsKrIMwwUjZ4HpESYnRGXbjvNZcLD7pTaKa4JEi4KG3UfaxRQlzHyQk0jP1HtVwH7ISuGq47goGe/XOOvEjX8VGBv0XG4QVMbtlUwyrC5YbG+cTOYGpqSpodRYsaCAKKsLrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIIZo3hB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIIZo3hB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764108800; x=1795644800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o7lmEc/4jUcAeBvbJO0WlkOJKci8haL71Rt2PHUUsFE=;
  b=AIIZo3hBAknnBXX1MkNhu0uBKttBIKqtvChYkRUJTXcI/b8hXPqAnKyA
   0fo1uApDu1FFiEjFrv8tmbCV4RiakIcQ+WjhW6mt1lrYD06TqGEs1EMbJ
   qU9QWDoHv+w1uA4ivuS1BrP6W/yR0I81MorkXQeL8sHxIG+MBoybjMFbu
   uLEjHApIV+wOKlzkwYt5ESluSap12A2gFuHSlzn60wMJPa6iwcfqCSyf8
   VF7LPaajV5Y/mlmd5kZh8wZXEVHfBApXjDmHxlu5L10Dd7HjWJNmpFHqx
   sVMQlyQtIU4rXsjRzkwHOpM6vY8vKG9l5iYqsGBC1Ty4uEcRQ6iClyW11
   A==;
X-CSE-ConnectionGUID: 36T9kHoXQCiIIIIv/t0Itg==
X-CSE-MsgGUID: q/byB/QtRdm8lHvZCtf9VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65846703"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65846703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 14:13:19 -0800
X-CSE-ConnectionGUID: uvxPIyRPSFGKdG2jirETvQ==
X-CSE-MsgGUID: II87BWhkR7ChsvsPWbdsAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192773020"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2025 14:13:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO1Hg-000000002JR-0UvU;
	Tue, 25 Nov 2025 22:13:16 +0000
Date: Wed, 26 Nov 2025 06:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 189/189]
 include/linux/compiler_types.h:309:45: error: call to
 '__compiletime_assert_494' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Message-ID: <202511260638.SstSYd3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   6dfc5d5f147fda6ad0ca4cb880fc8bcb466d1775
commit: 530278140b21c18bf53392ce59ee2f46b094286b [189/189] minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
config: x86_64-buildonly-randconfig-006-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260638.SstSYd3z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260638.SstSYd3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260638.SstSYd3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_panel.c: In function 'scale':
>> include/linux/compiler_types.h:309:45: error: call to '__compiletime_assert_494' declared with attribute error: clamp() low limit source_min greater than high limit source_max
     309 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:290:25: note: in definition of macro '__compiletime_assert'
     290 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:309:9: note: in expansion of macro '_compiletime_assert'
     309 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drivers/gpu/drm/i915/display/intel_panel.c:479:22: note: in expansion of macro 'clamp'
     479 |         source_val = clamp(source_val, source_min, source_max);
         |                      ^~~~~


vim +/__compiletime_assert_494 +309 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  295  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  296  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  297  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  298  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  299  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  300   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  301   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  302   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  303   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  304   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  305   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  306   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  307   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  308  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @309  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  310  

:::::: The code at line 309 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
