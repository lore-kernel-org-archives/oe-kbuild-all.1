Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6C142624
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 19:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723492485; cv=none; b=lnJ6PWGgzWOPEdBVewRXJr16l9VEwljsJ/BhNj4gWRcNiOqfF814/saMaZYkAJdwvl/BDUCeGiX+1mBQFaonxqIwKRNIdHRiZ4+yKH8b1Jcx3x9d4iSk1qwH493MEOjWhW/+fUrWFW+/4LSYIal8/ARExtK5/qwIQRnHlObmERc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723492485; c=relaxed/simple;
	bh=SWrmZmThIFiIBw62TF1R7Z3rPtOzervNKgtKEUTP2nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PxMPQR9jIJMY5tKgo4fkKM1YkeLU2oBzUIohypyAusxOahbqHjrq2+fKgRbrsUiI2wuzUaMxgw8MxLI2LkcF5Rh8kIDhd+WJSah7l+Lv2aMg5IfC9fC32nzaKc6UlrPJCGljLAIHLkb9z6wWOdOi+tIgenjP4TiT81e69KuzQyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHanzokY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHanzokY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723492483; x=1755028483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWrmZmThIFiIBw62TF1R7Z3rPtOzervNKgtKEUTP2nc=;
  b=aHanzokYQrjepwWtjul82CL5ZE/oIZvIywBuKxF+vaqx/09PZAT/hhPQ
   fp+EMbRWapCwQF1AatPB3q2C3+uDwsqs+5UDITvQGOpioG8ehghjSH0De
   UgMUThpSpzuLtzSlSWYtL/91zzOXfk0utzH94jGkCXs+izQ2kJlMF1WY7
   2E4PjjBUFmN5qTC268goLpdyLzWpongMSQb7+zpQ5lLm/tZ0Do48F5qIR
   zS55f5ofBX3ypGvc2DCK/K8DAPzJF2AWCsZwe0yJEkvmxwITb3uDCZihq
   cc6x+kA5XLab70u20O/cz2EEkh3eVM4K9CMyLljDyDPKvUZGqmX0CePHX
   w==;
X-CSE-ConnectionGUID: yYuCaghjSYCNYosG/gjweg==
X-CSE-MsgGUID: BVAuRSrzQMOi3nNwpOyMMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25387147"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="25387147"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 12:54:07 -0700
X-CSE-ConnectionGUID: 3j7A1fDESc2sgIBoxqcMaQ==
X-CSE-MsgGUID: 9OKjhYAVRF+ZrYKEIQubjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="58934370"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2024 12:54:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdb7D-000C7v-0z;
	Mon, 12 Aug 2024 19:54:03 +0000
Date: Tue, 13 Aug 2024 03:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 94/191] include/linux/build_bug.h:78:41: error:
 static assertion failed: "XFS: sizeof(struct xfs_dinode) is wrong, expected
 176"
Message-ID: <202408130354.Z4ViYffm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   1d05d87f424eb025d1a131f1142d7b6e389a5d5c
commit: 7f64209399e484e8abb5f639684753e22e0af08d [94/191] xfs: define the on-disk format for the metadir feature
config: arm-randconfig-002-20240813 (https://download.01.org/0day-ci/archive/20240813/202408130354.Z4ViYffm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130354.Z4ViYffm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130354.Z4ViYffm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitfield.h:10,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:374,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
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
