Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFCA19CC3D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465985; cv=none; b=cH52T/ugw6s3wUrP8X3pN2wakKJlC3HohNDF+Po/8om8F287J+YXzWjaQDtrPvdrCF4uCO8RtR+b72IzTWlfMOGACViTcyMRQjh4aJ/KIiuVxVs3hthHUY3kTrPPKYRgU5jthjjed+plBhXPc2SOrDe+AynTgT1Q/OkKopEJi+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465985; c=relaxed/simple;
	bh=QHtjc+AA41BS7BsLkDlb++3TL4Gvkg1YKqyLysJNf/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBD1R5dHbmkogK8GUMkNyFRyVP3Pu5ZlKlYJOsqfXw8WbbfPNWsQ+EKWZ+tujIdkVW56sqK6rFpyOwbr618lMzVPL5hoRD0dNZdbsuQhF7kb/fBTW505Du76wQ6+p7bevyg8dVkB0OhBHMSQ8xaavDOMo0L9JCiejCRimaLxg84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnPbIsyj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnPbIsyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730465983; x=1762001983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHtjc+AA41BS7BsLkDlb++3TL4Gvkg1YKqyLysJNf/k=;
  b=dnPbIsyjYCPEs6uVkFAoV3wv2tJGmM1/lWOz/j5cT2cQQqE/IxBadqW/
   wSABSViCfZmmCBMj91/cwnSRffLp7xgbeHEhBXB0nm8R3J8ioiJ2w2J+v
   1RZsEUuhkzwLqYVh4faSf8GHVgoO3PjA8jPnAORsAEq+7jisbPdTPn58B
   xNQrmXHbg76oo8P+rNlB9azls5R2UN9vXwr3xHXtSbja58TpBnYAtFcuX
   BPjU/XtEm2BVtfvrxNEDmO8KlwreI1Rf1/5/RSIVE2v2lGvP5GPijD/MB
   Nj57lP5yTHHKmy8M2encOdhvOnifLg+0/7t8sBQxffhrwPyYRcqfoAEXo
   g==;
X-CSE-ConnectionGUID: +vMZoFAPQaal0WFZXvBTMg==
X-CSE-MsgGUID: y84YApuPTiaHc0k+L54W+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52797083"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52797083"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:59:39 -0700
X-CSE-ConnectionGUID: EbT8UmnaSWatDK/UUUX/nw==
X-CSE-MsgGUID: pKhmSgDHRg2f/HX6xrW0Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83097116"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2024 05:59:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6rFY-000hYp-0F;
	Fri, 01 Nov 2024 12:59:36 +0000
Date: Fri, 1 Nov 2024 20:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-group 59/60]
 include/linux/compiler_types.h:517:45: error: call to
 '__compiletime_assert_987' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct io_uring_sqe) != 64
Message-ID: <202411012038.q5qsEIFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-group
head:   208960febed8e8a2deaadfc0135e934373b16532
commit: 3f048388f63bf3e751c0eca2a55db050c558da61 [59/60] io_uring: extend io_uring_sqe flags bits
config: arm-randconfig-001-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012038.q5qsEIFm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012038.q5qsEIFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012038.q5qsEIFm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:13,
                    from io_uring/io_uring.c:83:
   io_uring/filetable.h: In function 'io_slot_flags':
   io_uring/filetable.h:44:45: warning: left shift count >= width of type [-Wshift-count-overflow]
      44 |         return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
         |                                             ^~
   In file included from <command-line>:
   io_uring/io_uring.c: In function 'io_uring_init':
>> include/linux/compiler_types.h:517:45: error: call to '__compiletime_assert_987' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct io_uring_sqe) != 64
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
   io_uring/io_uring.c:3875:9: note: in expansion of macro 'BUILD_BUG_ON'
    3875 |         BUILD_BUG_ON(sizeof(struct io_uring_sqe) != 64);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_987 +517 include/linux/compiler_types.h

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
