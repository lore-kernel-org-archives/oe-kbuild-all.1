Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE86479C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 04:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242794; cv=none; b=TcycUxsxWWUaNYuxFntTC3ISN3ewhU+mkTgyplqXyHxsYl/+1Zyh4SFjfHuuVn97rFl68A9gZ0mRmh9Owil4EO5fF+FStmACAkbEwZbcIa+/IAKBJlf3Gp3BvQay+eRu0sDYUVeue2/r7nibX+2kvwA5XsslqAwN0YZ6m19yl1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242794; c=relaxed/simple;
	bh=UIznJNhcbiEHgCMMQwaoqDbNkz62QUKlaVDoeZHckDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLItjHZvPUwYLdL7NcrBHNJ/YN8eUIegcP6L2zWsxfuhWnM5/Lit3hwLucFzfepgtaRgDItiWrA0aZeLszbrK2GabNpsqkT/6XhCoyWpBUw3e2gXd0n4YVp18FPbUpy1/cllsRUkDUond7OkBd+uf//jNLrYYxqaYrgX+SU+9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+S2Mid7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+S2Mid7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713242792; x=1744778792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIznJNhcbiEHgCMMQwaoqDbNkz62QUKlaVDoeZHckDc=;
  b=L+S2Mid7LWds2swjrUuHMEd4HUfjBZ1UVibRpDe2skdN32pwl4CBL8jX
   A+WzbYq5r4wBxBGTedRYoOUswOTEgzHz/Q/8PYk6XCjKVTh+xLaby0eFl
   SeIBYcZ7B0GC28rj48Gf3hj2Njz0zS0TG+b2hu3FmLl3TgfbHL4Wj60vq
   Wh6KbNQ0rh4aIAxCaD++59wd38D5r3ZZf2YVHlE+mm4O/IEpYKR8tzeve
   IF3jUF+V66iPPOMZGCPXvG+H+VeI2Iqsa/eF8JFiXeugpUf1XbPt5fwhF
   0j5JsKlnrxyBLzZFQfU1IlZY0nSQekFya1HbDihwGhCa3aqdMnKKTmYXN
   A==;
X-CSE-ConnectionGUID: insTbrckQB6Vpmv8f1Ixlw==
X-CSE-MsgGUID: 32DaA+4VQqG+SLbXF8SBzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19368751"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="19368751"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 21:46:32 -0700
X-CSE-ConnectionGUID: BKc4K6eGQLu1yMXUWkF4yw==
X-CSE-MsgGUID: lq34yudoQBWXy06npDraRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="53091865"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2024 21:46:31 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwaiB-0004xk-0X;
	Tue, 16 Apr 2024 04:46:27 +0000
Date: Tue, 16 Apr 2024 12:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 129/166]
 include/linux/build_bug.h:78:41: error: static assertion failed: "XFS:
 sizeof(struct xfs_getparents_rec) is wrong, expected 32"
Message-ID: <202404161222.W8Ey0K6r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   a159a21af843928afe8939fac8d4b1b39c7175fe
commit: 089563f47fb3f09f9be77031a856cd502108dca7 [129/166] xfs: add parent pointer ioctls
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240416/202404161222.W8Ey0K6r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161222.W8Ey0K6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161222.W8Ey0K6r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/semaphore.h:11,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_getparents_rec) is wrong, expected 32"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:160:9: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     160 |         XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_rec,        32);
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
