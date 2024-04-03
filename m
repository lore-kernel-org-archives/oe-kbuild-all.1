Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D017154429
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712165772; cv=none; b=GCFe8L3Qx5cZ5iWB4sfI05AKa8pMkvfSgANThKPes8axZ3hdacwP95b8QwhZrJDoRlX3MRvZq3G4ZIrAjNWZLnCblTr9XNKsLTYMQja/9zbv316a3hrgS1xE3oZWxEP8Y6gXMSGFf9RabZVKyMVylqcZJipj3+h/XLerjK3Qqqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712165772; c=relaxed/simple;
	bh=6PZ4LJw6AXiAT0rhFxGtVc0bcCLapqG9VPK9e2pMEis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GefGfpDg8o4vYqJKbaY1uaTarZDTLfn6BzUM7ueEgSoHOugGtHFLbd4cOdS0puNhVKs3oVeRLaNhmTRvxwgqVCWJdmlajoYR4C4DcMeCtTYRyS2wpE3sIgVznXXhPy6QSrTksZlD3UpANFcC2vtDwPb61sHGOQf6XtXLEsdK2lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNMpjhEJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNMpjhEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712165770; x=1743701770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PZ4LJw6AXiAT0rhFxGtVc0bcCLapqG9VPK9e2pMEis=;
  b=CNMpjhEJ8zSRWIWNZMaUzhZWGPsFgQqJjaC0Nfaym2SbP2mXxq1qg9qt
   /KLS8Kik8UdXwg6pCj9VDcwN3R4sH/DYJarVrASClLP67sfjrxY66azV7
   U4RXvAO40wiPFGdEAmCG9mtl0WrScKr2mtIJyKMUHPiaPLV/Ie+pEmIzD
   IkyHWQPQ5/OHIhLhhzzSZp2QZkUbqtQXZr/yJfqsgN0CXwvmOqMk05XZ8
   TS7RuM4zcki3FEaSCgDo9w6gfkd3xz1l2nmF7YfKx19o7eDTFy0mlDr9H
   NAQ11sZWNaySwrwL0kzDQD7spvjFyTnt8vIGhQ1IZzFk1kFwzZTq7q9CT
   g==;
X-CSE-ConnectionGUID: FbMTeVrFSiWg+XsYUKGeGQ==
X-CSE-MsgGUID: EWFLKlrFShyt5NOI6a4kHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18027062"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18027062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:36:09 -0700
X-CSE-ConnectionGUID: gVD7kHqvSeK9ojaNp0JaSA==
X-CSE-MsgGUID: /jRXLxt6SwiT9c9KpqT0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18487318"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2024 10:36:08 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs4Ws-00007S-19;
	Wed, 03 Apr 2024 17:36:06 +0000
Date: Thu, 4 Apr 2024 01:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-getparents-cleanup 3/3]
 include/linux/build_bug.h:78:41: error: static assertion failed: "XFS:
 sizeof(struct xfs_getparents) is wrong, expected 96"
Message-ID: <202404040134.VGVcRny0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-getparents-cleanup
head:   2e6e60ddb42e900b2030fbcb32e488e780d82ddc
commit: 2e6e60ddb42e900b2030fbcb32e488e780d82ddc [3/3] xfs: simplify the getparents uapi
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240404/202404040134.VGVcRny0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040134.VGVcRny0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040134.VGVcRny0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/semaphore.h:11,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_getparents) is wrong, expected 96"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:161:9: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     161 |         XFS_CHECK_STRUCT_SIZE(struct xfs_getparents,            96);
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
