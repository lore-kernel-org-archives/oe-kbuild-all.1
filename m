Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7013B7AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716467945; cv=none; b=HmH3YQrSugk5WWldrXhEhZPmh88eOenpYooh0u8FeJ+d+homzWahZVvw/kkxpvAlrrorO2c22tm/7U5JnVP0XfpJDixuX1WJMeAXgDs4gdPcaU48YKfrLl1h40fA8hPDc+Sdqm0V+VWP+phliaimZ77WV0QWyJ6hxoqIzJSHrAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716467945; c=relaxed/simple;
	bh=e6uQgq35Ua9LCa6zr27q9SoepucmquOgODuFixJAMjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDlYsoQGLrVUt2EIeQXUXZ0zbP9v6ig9SQy/807dyTWo7H2ST13L1qiopkyn/FQWiU0FxNjH2tB4LcpmuyNVZewSEmjktUNc/xWIdg24zhY+QFMqDv4bC+Inh5MuKjpVoVVhjfXgWw39v2zvGfD9c6i+BvIhSKveOWcWG35sLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6sSKWOl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6sSKWOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716467943; x=1748003943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6uQgq35Ua9LCa6zr27q9SoepucmquOgODuFixJAMjo=;
  b=m6sSKWOl1TSXXopc7dgEm+ufXjc2RcGu2+OfKRPIhT3EI79yGKWDMBbs
   wuVlos11q04yc4VumvKHCNm+CmoNS+DZclpGqjIaxFCXYPXrnVq3tRlFA
   cFuVVlQBjSzXzDouRXy2xauNjgKuUFSZtdjVq6LlS80xExgbubyLuzR73
   z2lgzMRAO/DiotyLH4tzBZVFmlIHZiB1VXmvR4W64kMhj3stv0zfhwITc
   rdLQtLeaOGA7CwuA7Md5c8bw9Gmc0jG0JfsQ1U79S3GFfuBn4zehXcT9v
   /y5NyB2/G+DQYEY91efP5iNX3QPNhT42WVBGmQ90Hn2uGjNiefq0h4UVl
   A==;
X-CSE-ConnectionGUID: JYAZuIHOSGiWkQB4+CBF4g==
X-CSE-MsgGUID: 09uTc4dATwGUBcFakJXKGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16608175"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="16608175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 05:39:03 -0700
X-CSE-ConnectionGUID: xsdXPQ5ZQB+K1yy09yjong==
X-CSE-MsgGUID: l8xcq6BVQB+qnibTGrcRQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="33666837"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2024 05:39:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA7il-0002q1-1P;
	Thu, 23 May 2024 12:38:59 +0000
Date: Thu, 23 May 2024 20:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_mapcount_reset 3/6]
 include/linux/compiler_types.h:478:45: error: call to
 '__compiletime_assert_549' declared with attribute error: BUILD_BUG_ON
 failed: PAGE_SIZE & ~0xffff
Message-ID: <202405232021.CUydlPJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_mapcount_reset
head:   c5a6ba264f8723b5aeff739139ae17a9d259d73c
commit: 6b6d701fc4ccebcd7bdadc24dfb045e4f7f0940c [3/6] mm/zsmalloc: use a proper page type
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240523/202405232021.CUydlPJZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232021.CUydlPJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405232021.CUydlPJZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'set_first_obj_offset',
       inlined from 'init_zspage' at mm/zsmalloc.c:888:3,
       inlined from 'alloc_zspage' at mm/zsmalloc.c:991:2:
>> include/linux/compiler_types.h:478:45: error: call to '__compiletime_assert_549' declared with attribute error: BUILD_BUG_ON failed: PAGE_SIZE & ~0xffff
     478 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:459:25: note: in definition of macro '__compiletime_assert'
     459 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:478:9: note: in expansion of macro '_compiletime_assert'
     478 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/zsmalloc.c:466:9: note: in expansion of macro 'BUILD_BUG_ON'
     466 |         BUILD_BUG_ON(PAGE_SIZE & ~0xffff);
         |         ^~~~~~~~~~~~
   In function 'set_first_obj_offset',
       inlined from 'replace_sub_page' at mm/zsmalloc.c:1737:2,
       inlined from 'zs_page_migrate' at mm/zsmalloc.c:1817:2:
>> include/linux/compiler_types.h:478:45: error: call to '__compiletime_assert_549' declared with attribute error: BUILD_BUG_ON failed: PAGE_SIZE & ~0xffff
     478 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:459:25: note: in definition of macro '__compiletime_assert'
     459 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:478:9: note: in expansion of macro '_compiletime_assert'
     478 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/zsmalloc.c:466:9: note: in expansion of macro 'BUILD_BUG_ON'
     466 |         BUILD_BUG_ON(PAGE_SIZE & ~0xffff);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_549 +478 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  464  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  465  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  466  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  467  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  468  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  469   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  470   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  471   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  472   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  473   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  474   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  475   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  476   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  477  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @478  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  479  

:::::: The code at line 478 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
