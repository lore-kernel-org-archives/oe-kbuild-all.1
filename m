Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF84AD5A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754094099; cv=none; b=qDcHoi73uFk8NvsQtnYwN0sVzN0cFiWCf7erdfOoacof1mCGPhzz19KKtqvL2M6Vut1E+hNxkm15lJNOTcUgbTT9AAyRHqvT6eFXr3dBqHgozGjhcUfAGI6Vpfii8pjpHdu/5pdf+hPbnx5y0P4Ssy/pKKPEyku0KgctYZu+Ocs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754094099; c=relaxed/simple;
	bh=L5P8ubLtAZiGZ0+X+Jg9rPnQ5eZQ0Ngv0hj7RsufwaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtQy4SiXUK+7QZq0nniAlaz/z5Pdmt3F8TD9Cc6NIKx9PiD1eupasjTxuhobuBl2MEMUFbXQzvNLKeuTaOSVrJ4f9LEKmJ6EarEicTYtdxWFKkDTwzx3OGSvni+c/i7r/6uLSL2HXQoQxwX5lRRXwYVggnY/LDuNj80Tj4mM73c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd6wTU6S; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd6wTU6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754094098; x=1785630098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5P8ubLtAZiGZ0+X+Jg9rPnQ5eZQ0Ngv0hj7RsufwaA=;
  b=kd6wTU6SMQLaITg/ktFgSZ7cgeg6tVfDqEmRTSngscSn2XE59/Bhe9vE
   qWQxj75fcyuH5E54cQ22neUMaqQUYjbuU012bqKKv8v2JfgfenX/X2kN0
   PLFabNXMYK9YnNz1nt8FMjXFrw1d2iD2sSWqPVSXubpyM7uzPhteNayN/
   Y3SExcvFXSC9/z/13qmGXHPn0pTZtoeB/AryDz2FQ9pIWrcKsILlaKJ5z
   ClX05t+2sx9e07C6aB2OeMxILiPWNQuLCrBJE5On1y9jgsv8Mj392S3bV
   NlTmz4ZENjqm2xL92KpH91rTb3iPSkDtTnqFC3Ecc+oItJFH2iq3/GRg4
   w==;
X-CSE-ConnectionGUID: Ue+OC2NVRbCdto9BLCWCYA==
X-CSE-MsgGUID: aRt1tjcOQ923ubJA2j8Ewg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60085598"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60085598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 17:21:37 -0700
X-CSE-ConnectionGUID: 67ysIogySE6ggPfWoMVKKg==
X-CSE-MsgGUID: Z7i7rOD8SHiLVCc4B6oC1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168160504"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2025 17:21:35 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui00C-0001KJ-33;
	Sat, 02 Aug 2025 00:21:32 +0000
Date: Sat, 2 Aug 2025 02:20:35 +0200
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 98/98] include/linux/compiler_types.h:568:38: error:
 call to '__compiletime_assert_279' declared with attribute error:
 BUILD_BUG_ON failed: ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE
Message-ID: <202508020214.8pUMOfI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   4e5e9d156393a3e06172b0c5962644c96c6f7f7c
commit: 4e5e9d156393a3e06172b0c5962644c96c6f7f7c [98/98] mm: add zblock allocator
config: sparc64-randconfig-2001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020214.8pUMOfI1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020214.8pUMOfI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020214.8pUMOfI1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/zblock.c:29:
>> mm/zblock.h:21:2: warning: #warning This PAGE_SIZE is not quite supported yet [-Wcpp]
      21 | #warning This PAGE_SIZE is not quite supported yet
         |  ^~~~~~~
   In file included from <command-line>:
   In function 'create_rbtree',
       inlined from 'init_zblock' at mm/zblock.c:450:12:
>> include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_279' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   mm/zblock.c:415:2: note: in expansion of macro 'BUILD_BUG_ON'
     415 |  BUILD_BUG_ON(ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE);
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_279 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569  

:::::: The code at line 568 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
