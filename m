Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3879189BBF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878594; cv=none; b=drzELSWqYSoh67v0lTiztcA/SolzvRg3HcNovpc7zuOhIiVwKUjSYSxI95VBcWSOE7v99R+q2oXeIdee2+MCm1cSU+M/9EoAxQlOdJkQQlotJEtSCsZhPpIYsIX1ef2UL3/SIttQ164EtEtsPWGIXE4LIrDvJSi01BMTDr3VQJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878594; c=relaxed/simple;
	bh=4XRGEqh2MdttIezrOU+m/60VmGPpM+94KC4WTa6S3Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LM4e9Y3yT1i1tUq/+Vvcomt7iE4YTeSLrTWK9zubLO4utx2Ocy80Tgpgl0BSoF3WjsGUUQdVzOjOorepv7Hmurx6JJQ2/ceW68YkXHmFhzV6FyYUeEj0fw+0pgRsigxL0RV60So0bN/NAmjPX0XyDRwvoUDzdmahanajzjYZhF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXbtTW0n; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXbtTW0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732878592; x=1764414592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4XRGEqh2MdttIezrOU+m/60VmGPpM+94KC4WTa6S3Tc=;
  b=MXbtTW0nmUJBAybKhsPJXsh6JklmO+fITw6dKeU/8+q8Cz5lSNJ1KHBk
   jImZnJDHvQClZOd5ENNREU7lyXMzUqEJQyXAoLbSIXTUpZGizZaJxClAh
   L1YI2+O5Ur7slejOmzY2XXRhkfGe0BQgZCTSDvdje7lgh+f/l74TF8HAE
   ClurvM49MIfn6sNVmC+8PEQxnNy3N8zyklEJylsd7ijHnzX9zz5FmuC7X
   +F08RKKmhrxGoP2cgMPMIvAWQBznO5cvzC/KLqMkryf9R8OTu5vduFnvt
   q/ntXI8/ru2ODbXXKNr8sRqWrEE0f9daieFzBnfZ6AshW775PjTelQpWi
   g==;
X-CSE-ConnectionGUID: I3PlImTnRU2zXHQW1KOwOg==
X-CSE-MsgGUID: ZAgmCf8zSFiubHIq9Sb40A==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44168298"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="44168298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 03:09:51 -0800
X-CSE-ConnectionGUID: 4qWzTkYOT2i+yiMBZEl0AQ==
X-CSE-MsgGUID: Puq1m9C0SlmW5VGiRX25LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92936813"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Nov 2024 03:09:50 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGysd-0000G3-2h;
	Fri, 29 Nov 2024 11:09:47 +0000
Date: Fri, 29 Nov 2024 19:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 85/89] include/linux/build_bug.h:78:41: error:
 static assertion failed: "XFS: sizeof(struct xfs_sb) is wrong, expected 304"
Message-ID: <202411291902.chE4DAoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   6c2982ec392045b4d9c02d0298dff5f2e7f35f27
commit: 947f2988e7f7fd913ccda69c678dfbe782bcab6d [85/89] xfs: use fsblock units for sb_rtstart
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411291902.chE4DAoZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291902.chE4DAoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291902.chE4DAoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/semaphore.h:11,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_sb) is wrong, expected 304"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:237:9: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     237 |         XFS_CHECK_STRUCT_SIZE(struct xfs_sb,            304);
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
