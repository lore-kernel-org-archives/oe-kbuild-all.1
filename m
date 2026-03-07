Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F552335546
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772878390; cv=none; b=ktw3mXB4RK4cgUl6bkoWiP7xQAes45yrfsdIuaCnGDpbxOhBDuZdvnT4zrUyu2BjpP7io6JKlazh4MzVCG12VaN6JGZJYBjfdcFdAJQS80rWq7LanNJUvirM2Ai4C+1LNS9yLiIPdKbKWPNSEZbWBWNR/2C+uUzII1qz0Bo22Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772878390; c=relaxed/simple;
	bh=h8gJ72ndyQOaD+jOazR5o2bN/o5Ia7obFdL/EZKMG9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fDJq8kKnDnhqq57EKifjyZ7WUqejXx7OgaoIKi5suIIfaLdQfpO7iBnb48zfc8skLjKuTtbjgFC2fO9GmLHEJVwzaUMajhSWUQ1h7ziATCxPPgA23Bo24Tc1bp7NoCNK7VWQVZ7ZrichSEESNA82c+U1w2CZFLuWdeUH55yYvuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDPy7DzU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDPy7DzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772878386; x=1804414386;
  h=date:from:to:cc:subject:message-id;
  bh=h8gJ72ndyQOaD+jOazR5o2bN/o5Ia7obFdL/EZKMG9o=;
  b=iDPy7DzUpFWkSNlewgcD5bLDQwNB6kV6fbtBjQ1+hce7xtu4x4s23JZc
   L6v3Lly+6DAOC9+uszMuiktbdkHu87YVW2UCvk52AX/WXKWde/vfKFYrn
   hx0ujx2pLRl3WGpvIj/garZJDxh1SKuKEqsqlTNLJYdob7TrkMSCepbLq
   SLmtONEST2kg33FP/6eAqLmQyFAYxIIHwzcti3drhH0LBU0w7Jc5LE6oo
   EYWpVV83U3OTWkrijSvt9yVt/ZFOqvBuUFA+00Z1wY545sr19BnSUM8eq
   X7bFJb3dMA1ke+jjtLzbMPwYLEm/8FuwSOldyMbJWszOKdap8BUJ6xk6T
   w==;
X-CSE-ConnectionGUID: 1JLrkTBOToSHVALazBhVoA==
X-CSE-MsgGUID: 59hwoTQxRdeSprAViuTdZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73878742"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73878742"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 02:13:06 -0800
X-CSE-ConnectionGUID: pfRVBCYqSE2bVNbxWXuRog==
X-CSE-MsgGUID: vtqoYMz6TReZHJcrD66bMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="222023782"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Mar 2026 02:13:03 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyoea-000000001sH-3wvM;
	Sat, 07 Mar 2026 10:13:00 +0000
Date: Sat, 07 Mar 2026 18:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Yang <mmyangfl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_385' declared with attribute error: BUILD_BUG_ON
 failed: len % sizeof(u64_stats_t)
Message-ID: <202603071807.gNUnifF7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4ae12d8bd9a830799db335ee661d6cbc6597f838
commit: 35710f0db8011e7ebbfb5b929a0575c3a09b761d macsec: fix memcpy with u64_stats
date:   6 weeks ago
config: powerpc-randconfig-001-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071807.gNUnifF7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071807.gNUnifF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071807.gNUnifF7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/linux/u64_stats_sync.h: In function 'u64_stats_copy.part.47':
>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_385' declared with attribute error: BUILD_BUG_ON failed: len % sizeof(u64_stats_t)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:612:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/u64_stats_sync.h:134:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(len % sizeof(u64_stats_t));
     ^~~~~~~~~~~~


vim +/__compiletime_assert_385 +631 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  617  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  618  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  619  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  620  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  621  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  622   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  623   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  624   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  625   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  626   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  627   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  628   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  629   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  630  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @631  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  632  

:::::: The code at line 631 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
