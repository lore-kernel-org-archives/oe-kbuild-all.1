Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345E1D435F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 01:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761184325; cv=none; b=DEyWrnNq6g+Cd4nWYupaa8UDLh144X4OQgLlkeZ2mZsWIc7oKGnYnD9R9PWY3dQBev4XEvXSTPazxkN/dIoN4gR9FhYfiDrWGEVOLIa/PvwqQNUUzKvcIQPK2R4V6i8OuQmiqrtsBVNrthjcZwam4pCfEGUN31SGjvFvcPkmmpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761184325; c=relaxed/simple;
	bh=4njMwdzTkvdbhUJLwwFwLq6fjC7rbLkG1HPGx1CUYjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRlL17NzVbCmU0qiufiYI4op2P8SB8GmEOIBJjuwuIjjEOQfQ8YWmyyXuNstIoB9jDz6xKs/z10PkKi6VA1EQWhYPZRa2A2l7uEXJAi0ZbspSAvgJeiEYFP/spG94YZY8bMJJtlkRGVnBFWvhhOd9YX1K4uf8VKutv+inxeYnGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZaIKg/v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZaIKg/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761184325; x=1792720325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4njMwdzTkvdbhUJLwwFwLq6fjC7rbLkG1HPGx1CUYjE=;
  b=CZaIKg/vi+X1i17MvzYLzuc9zmT2reiiBuSAUoTV/FUKI+/nFooAWfXa
   ScG6HdgUkqMlyBTWsZI3hTnJhoWqar+N1jq0DJLqVzodv8e29VjP3q2a8
   0S3swAnI1g/VqxjQIBgk6e0yjqaQLSxNx8aa4vPoHV7zUJ0bzYhLAv3f6
   AmV/cPxM8NGSu43F7A3uy5j6VLunEmqOvBDhTHDIrmYKk4uWAqNq8F5jp
   VtCpMKckW/iFdC3GNEq3hFF9TDVo9m1etURz9Wyb4qPFnREvJHBsqIv/K
   64daVy/s/UOiuTpRqX2udlMvsRUIStAFI4ZaWq8eQA1Mz07eURxUTbf5f
   Q==;
X-CSE-ConnectionGUID: LpgtZWfgTkeH5X+jLjrQww==
X-CSE-MsgGUID: 5SSLTALwQgu/bipOLMrGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63238325"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63238325"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 18:52:04 -0700
X-CSE-ConnectionGUID: SpZbgr7gS3WA+JPfqKSCyQ==
X-CSE-MsgGUID: HapnDRkpSaCFQvg1UIao5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184508165"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 18:51:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkUe-000CuJ-1D;
	Thu, 23 Oct 2025 01:51:56 +0000
Date: Thu, 23 Oct 2025 09:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: include/linux/build_bug.h:78:41: error: static assertion failed:
 "XFS: sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
Message-ID: <202510230913.RgbAGc3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd72c8fcf6d35de5d6d976f20dc1ae84ce7af08b
commit: 13877bc79d81354c53e91f3c86ac0f7bafe3ba7b xfs: port ondisk structure checks from xfs/122 to the kernel
date:   12 months ago
config: arm-randconfig-004-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230913.RgbAGc3c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230913.RgbAGc3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230913.RgbAGc3c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/semaphore.h:11,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:2: note: in expansion of macro 'static_assert'
     static_assert(sizeof(structname) == (size), \
     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:133:2: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_entry,  3);
     ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_dir2_data_unused) is wrong, expected 6"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:2: note: in expansion of macro 'static_assert'
     static_assert(sizeof(structname) == (size), \
     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:136:2: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_unused, 6);
     ^~~~~~~~~~~~~~~~~~~~~


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
