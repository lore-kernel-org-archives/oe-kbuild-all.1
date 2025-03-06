Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1D21480E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283452; cv=none; b=RXpzaYVweHdur+QWNPQEf0meIG8p28YmYTHk8apTmuvtc33fWzC8t8M9jHHk3lYzUcW2SCI0jpkNhUFNxjdAvN067mZeZgBHMmn9CFSLtU98yf1Rpo233ERH0sOltP8HyAs1CXQ90JcfsO4HdxbZaMD0LK/BEiF+BWQWrYQtgWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283452; c=relaxed/simple;
	bh=Av2xdDwTs3eI9K6nDSvU6evy4oN0cv/JS9ZWQayhtrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+4c3xV/UodZoJcB9CKq0T8RbSod8zY8Qb3ca33q8FcJLVRyIYOrXRK/ctrov2EiXfD45KTtY423UxxL3ulBy0UOJn5JWyZ/nXa2CL0YP9IlmoO2EZnqkXeP6ljZfQORufGr1QILcTNfrCsUscb6QtaffKrZVGxSP9bcfR9E8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUl1O9XK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUl1O9XK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741283451; x=1772819451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Av2xdDwTs3eI9K6nDSvU6evy4oN0cv/JS9ZWQayhtrU=;
  b=gUl1O9XKYN21fqmEJgEnA2VsjFI+sv8kYnC+3pS5LlIgmcIro8cWj8w7
   rEudQgTAtJUoWI2TzZbYJE3scDCCL+9O+06rAqFThpQp0r5D3sHo0Bkjb
   XJFzmrCfRohXeeSPXcD1ErUZ2MHIc9aDUCKIjZw/ScFs1XsECDgGZc7sl
   OVd1sv8b1WGlFLMDiulbeLU/FqKZpkgrc5QaMkjBnP99TLq8WhWfPeefs
   2oO+6RwdGFPUDgiCjq+kabRWJzNoffVpqi98oDv2QYnCAxLmkYfKP5R0i
   Zc/XVmfuIg4jZCGY33gnt/mlmIk3LwDuqnKg+cUY0XNjkgttEIwhTE+WG
   g==;
X-CSE-ConnectionGUID: ISo1Ao4FTj+w8mg3EjYj7Q==
X-CSE-MsgGUID: vEczZ7VHR9Szs4C6hQ9xdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42445667"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42445667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 09:50:50 -0800
X-CSE-ConnectionGUID: oU1lqn6TS2G/czK0j1Qalw==
X-CSE-MsgGUID: FPPW5x16SWqbgM08OmNbIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119278136"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 09:50:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqFMs-000NOu-2L;
	Thu, 06 Mar 2025 17:50:46 +0000
Date: Fri, 7 Mar 2025 01:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/io_uring-reg-vec 5/12]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_361' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct bio_vec) > sizeof(struct iovec)
Message-ID: <202503070113.6HxKAS8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring-reg-vec
head:   dbc5b236b665e61bc206055f8a6d45766fbec974
commit: 0b9406095d9d362ec0113e645380ac15302cd43c [5/12] io_uring: add infra for importing vectored reg buffers
config: arm-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070113.6HxKAS8W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070113.6HxKAS8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070113.6HxKAS8W-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/rsrc.c: In function 'io_vec_fill_bvec':
   io_uring/rsrc.c:1305:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1305 |                 u64 buf_addr = (u64)iovec[iov_idx].iov_base;
         |                                ^
   In file included from <command-line>:
   io_uring/rsrc.c: In function 'io_vec_free':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_361' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
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
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/rsrc.c:1266:9: note: in expansion of macro 'BUILD_BUG_ON'
    1266 |         BUILD_BUG_ON(sizeof(struct bio_vec) > sizeof(struct iovec));
         |         ^~~~~~~~~~~~
   In function 'io_vec_free',
       inlined from 'io_vec_realloc' at io_uring/rsrc.c:1284:2:
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_361' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
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
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/rsrc.c:1266:9: note: in expansion of macro 'BUILD_BUG_ON'
    1266 |         BUILD_BUG_ON(sizeof(struct bio_vec) > sizeof(struct iovec));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_361 +542 include/linux/compiler_types.h

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
