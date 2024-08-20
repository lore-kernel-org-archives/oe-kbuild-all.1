Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F36218E342
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724142868; cv=none; b=fFdslJYBr+TiqJ1YepH6ambjPR6dm4LpIP6VgCoF0FH/b5OgsZ730bhMfhP+/JtRgukldHAra8D7PsrFX60U9hG4LJH6NWPW5eahFrIOFm8y+iUzP9PzQcFdHoBr9D9pW7IeqxedlLHI0gw/6gl8JaNTkQq/gULiR17vx8HtrXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724142868; c=relaxed/simple;
	bh=0e48bKdZ/6PzeJAjV6qNjQ/UnMDx32XhkBIChwyzfqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7StYJPTfAea3GdBtTGYsTO5WYFtNadyTmo8RQmuYjGwzBrrQmlyPfdKa7iUQr1jTONGXg1O/iNlM9TDhTM3wAqiMYuaiZIAb6vpzu0so1uBgf0fjUUFhclYYocMfDmlmZ5meDwsQXyXe2+NIQ4Kz1i6d8ZkYfnS2+TMc61BnJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvyF4e00; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvyF4e00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724142866; x=1755678866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0e48bKdZ/6PzeJAjV6qNjQ/UnMDx32XhkBIChwyzfqc=;
  b=bvyF4e00qclmRf5sG7/8HVY4GmLnSvcd23PVB/3EQQBzYIw/KTEkkbWh
   t6uKVyfKdb2Q72bBZ3VwuKLIYaNBzBqXraRmLj/Blq9QaZ+TmtWakunLu
   zcmfq2cqcHyCAdqhlXPhxCnASgJG7pPviJ9VkA9XfkLwyaG47sVJSERgz
   XD8qdwxpbeNKwfoZGusrURNrxid5PBKKmC0fkC88AQtOC1umd7u9xhKBJ
   TVrq5KF1rcmjDbZr39IPqnOeyIkm/Zt9BJkLOmRRXyCnLIF8JSuq4Pjoy
   wn3ovX9jd9cWEsmGyVJrtb6/xJerJWe++U3EFUpSu2iZBrMQ7p871aLPn
   Q==;
X-CSE-ConnectionGUID: jxKCf1NGSqCgp+D1tGiP5Q==
X-CSE-MsgGUID: MOeNghcVR8Kuf52chjoHCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="13109679"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="13109679"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 01:34:26 -0700
X-CSE-ConnectionGUID: +i4N4tLjQ8Ky/d8Gf99SkA==
X-CSE-MsgGUID: ROpzlp2DTPajbFVdntr50Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="65612825"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Aug 2024 01:34:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgKJq-0009uQ-1B;
	Tue, 20 Aug 2024 08:34:22 +0000
Date: Tue, 20 Aug 2024 16:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 12/253] include/linux/build_bug.h:78:41: error:
 static assertion failed: "XFS: sizeof(struct xfs_dinode) is wrong, expected
 176"
Message-ID: <202408201647.yTK0CfxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   1849d8b8e0c4c5237ca10ab8aaa8c072449e3ce5
commit: fa4c3f149a09fe27d4d2ab55176a2a9e26e46068 [12/253] xfs: define the on-disk format for the metadir feature
config: arm-randconfig-r131-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201647.yTK0CfxB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240820/202408201647.yTK0CfxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201647.yTK0CfxB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/semaphore.h:11,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_dinode) is wrong, expected 176"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:37:9: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
      37 |         XFS_CHECK_STRUCT_SIZE(struct xfs_dinode,                176);
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
