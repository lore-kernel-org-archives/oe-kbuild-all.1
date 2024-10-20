Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D843EBE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729456489; cv=none; b=pSbkPhmKNuym7zIygEhTEm4e0VS1V4ZNcdx7ONe0gH8xY5HEEVqe3eWZQZ7RE6ZsDmDqHoAJNGGslHJhIccIhxqQLmkV4d5Uu7ax28iih+H7ITpB4Po2fYXEd+CX3LWQXcMROPXgg4S4z1BijEQZrRXru79/Kw1pZA7fJ+9Nm90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729456489; c=relaxed/simple;
	bh=fNwK4/NEdpCF+gDybW7vQHMASsyrLpJ6pdhledeOKWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uljcUBrDZ553bmEXReuncE8eW3TfMbeJp8vFg9Nf+TMzZVwhWDDilA+aBWB0T902qYFaTbztIA/UyXEszpB1njnVZR3QGVsjdE22FAEcSJALVTzsCwXdKdv/ouJQsO/E8LgN5nQy+g3sshGJah6SMs9N7NUavV7f89Ns6lw7ZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJqTtliP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJqTtliP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729456486; x=1760992486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNwK4/NEdpCF+gDybW7vQHMASsyrLpJ6pdhledeOKWY=;
  b=MJqTtliPSl6kBFRGwzSi5O/O2r+WBcaTpBMj4BOCImig37SphhLHJ5Hi
   TcqWzudc7kiPNdL/4omKAjnHj2Xp/noBcbDOQv+MChpMUz/dfOw1YS1MT
   DYEgK58Tu+tBdeDXhRU3/1aL3FdS8kKC9mojs/OpZnWgib5d8g+AE5w7w
   kDtjIb9zUVC3ru3QDPtEgLmbFF0mA0wn8+sPhKWDf9jkqZgHtrclUYk3L
   mnCbkgTITc+t6KvN6PVp47IKL7RqZ5iRowbvsrLv7E6Pb3Ft3IAUDT1+8
   jxVyUP5ouALAGwxzkEx3caEkzvo6ePpJZ0JkzmdUyae/afn/NkkkP0siA
   A==;
X-CSE-ConnectionGUID: 1vF+cKGmSruYgQR554RrOA==
X-CSE-MsgGUID: OHYJ53ycQcesj33eRVuHIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28810744"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="28810744"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 13:34:46 -0700
X-CSE-ConnectionGUID: 8oRWJQWkTHyIXWnr3Aw9QA==
X-CSE-MsgGUID: GFA5hcmNQFmQXDCXpUvdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="84396401"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2024 13:34:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2cdO-000Qmy-2U;
	Sun, 20 Oct 2024 20:34:42 +0000
Date: Mon, 21 Oct 2024 04:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-sendzc-provided 8/9]
 include/linux/compiler_types.h:517:45: error: call to
 '__compiletime_assert_316' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct iovec) != sizeof(struct bio_vec)
Message-ID: <202410210428.57kPbiDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-sendzc-provided
head:   5867ef85190744b26e0a5f7b1ee19c4744a92f29
commit: f5b285713cba03be9c941661157659aa29facca9 [8/9] io_uring/kbuf: add support for mapping type KBUF_MODE_BVEC
config: arm-netwinder_defconfig (https://download.01.org/0day-ci/archive/20241021/202410210428.57kPbiDC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210428.57kPbiDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210428.57kPbiDC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'io_ring_buffers_peek',
       inlined from 'io_buffers_select' at io_uring/kbuf.c:424:9:
>> include/linux/compiler_types.h:517:45: error: call to '__compiletime_assert_316' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct iovec) != sizeof(struct bio_vec)
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:498:25: note: in definition of macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/kbuf.c:312:9: note: in expansion of macro 'BUILD_BUG_ON'
     312 |         BUILD_BUG_ON(sizeof(struct iovec) != sizeof(struct bio_vec));
         |         ^~~~~~~~~~~~
   In function 'io_ring_buffers_peek',
       inlined from 'io_buffers_peek' at io_uring/kbuf.c:459:9:
>> include/linux/compiler_types.h:517:45: error: call to '__compiletime_assert_316' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct iovec) != sizeof(struct bio_vec)
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:498:25: note: in definition of macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/kbuf.c:312:9: note: in expansion of macro 'BUILD_BUG_ON'
     312 |         BUILD_BUG_ON(sizeof(struct iovec) != sizeof(struct bio_vec));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_316 +517 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  503  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  510   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  512   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  513   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  514   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  515   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  516  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @517  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  518  

:::::: The code at line 517 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
