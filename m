Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16B39099F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615733; cv=none; b=krhBdsUzNs0lVlXov3EpIceC/stiCBZ2IWDWxBSMVqT5mrplYcdu03W73UdYJWJPX8bi+yLZuZMaNSKYw66Hfc35YEqd10RwuIBrQyiJ1MHlRNcGSH8T6nDjpd8EhiMxEJjc5pnHMXvWwTXyZmABRUPW/C/FL+5xL2nAKOTkVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615733; c=relaxed/simple;
	bh=Cy5VesoTROYETV/Nmfq2q0P0EMJjaibQxQV0J/u4ltw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CyZrXGQMalcH0wGGzZYTVuakyDequGPbbppU1pB6kKD4zO/wHtlJvyB/4RnXqKjh7jFJw/cjKXTYjlX7GGVflz6oFHEESc0gTAnaVWQMSapbUP6p7/g6tIt5f3rqHsdET7k3AOiIjtLA3F1RQS9d7GxcQzavOhpO/JZrrxMELWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvNSrRc3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvNSrRc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772615732; x=1804151732;
  h=date:from:to:cc:subject:message-id;
  bh=Cy5VesoTROYETV/Nmfq2q0P0EMJjaibQxQV0J/u4ltw=;
  b=dvNSrRc3KA6HHlrVXu+EmlUJTE+FsCXuJaKFer5xRFNMdkDvDVIXUT9i
   QVAh4YR/seDdFCzKau4Zs6vMcHSoZ08YtdwyQPPdc1D8xoRTvE6Mc3T57
   6YSShjhpYDY4XWOajJMhczQGoogn8ZyCGcfymltLZNIf+Nl0WRcha0Ebf
   OUUqOANE01uNeiHVOW5vljw42Y4QYKmfd2PIb2mzktdBZI5gH0JjKlZvy
   hMiHQCpiUdNJV8pBEGX9pRZZHoFpo6I1XhYfzpVByMhqpzfVFxzvn6jf8
   35IkLTxaNyFQozizb7MW7vz2g3s8xhkAhC7AyTZWg/Tsxe/HRlkq3QgoM
   A==;
X-CSE-ConnectionGUID: rR3RhdYIQ/e8uH85Rg1WCA==
X-CSE-MsgGUID: h10t61IpT16a5gk2DUK4wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="85137538"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="85137538"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 01:15:32 -0800
X-CSE-ConnectionGUID: jsPvIyiNR9+6FdAyV0reKQ==
X-CSE-MsgGUID: mETCgPJ1TJacWyT4OVc2Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="217444628"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2026 01:15:30 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxiKE-000000003XF-3eW9;
	Wed, 04 Mar 2026 09:15:26 +0000
Date: Wed, 04 Mar 2026 17:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miklos Szeredi <mszeredi@redhat.com>,
 Jingbo Xu <jefflexu@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 3223/3431]
 include/linux/compiler_types.h:706:45: error: call to
 '__compiletime_assert_504' declared with attribute error: min(outarg.size,
 ((loff_t)((long long)(~0ULL >> 1))) - pos) signedness error
Message-ID: <202603041735.AhBrAU7b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
commit: db64b9107f146940606d512f1d6214323b905565 [3223/3431] fuse: simplify logic in fuse_notify_store() and fuse_retrieve()
config: powerpc64-randconfig-r051-20260304 (https://download.01.org/0day-ci/archive/20260304/202603041735.AhBrAU7b-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041735.AhBrAU7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041735.AhBrAU7b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/fuse/dev.c: In function 'fuse_notify_store':
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_504' declared with attribute error: min(outarg.size, ((loff_t)((long long)(~0ULL >> 1))) - pos) signedness error
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/fuse/dev.c:1790:15: note: in expansion of macro 'min'
    1790 |         num = min(outarg.size, MAX_LFS_FILESIZE - pos);
         |               ^~~


vim +/__compiletime_assert_504 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
