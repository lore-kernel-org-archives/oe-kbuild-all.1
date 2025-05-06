Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B925B69F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546332; cv=none; b=iZhUp7tmEkIg0zrg2wUS6vduek64b/UblUNGnLfPif+KydNkvNOUDHPtfLFLAicndW3M7fJB6Ep9vXNGD+plZCVA7VD2tXtIvFFNeVv9eI3ybiQvrSS+HdlKzPDK45PFEAg9vL+wYTAfoLMTl7CwCXF9LQmTdG47+Z8IW2d556E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546332; c=relaxed/simple;
	bh=D+TGnK3CcQfv1Urw5McTlaTBfXXitkm2VxE1Xtayn+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTRlMa+Ein2+2HGGX1UcOy8c//OXkGBwX29uSgWT55NWwtMOX93MNv0BhHHvnWy0UsrazLwNn4cQAfk2NNmPluN84uxm5BSypwxN4+rtJRwExhgX6GROzLIemgfy6ajKBH+CcOY5BLXcihBKXpgmR/J0QNlTVPPUIqB7pwhwXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+Sg/4KU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+Sg/4KU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746546330; x=1778082330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+TGnK3CcQfv1Urw5McTlaTBfXXitkm2VxE1Xtayn+o=;
  b=Z+Sg/4KUYT0SnrOW1NjlDMzZB+ByyV6uRTReugVy411HEQLgAkI+4v24
   vhCc880zgBJHNbgaK2FI9UTdpTDi6/bQvAVIf59XHOu03Hhk/Ks8qdqD3
   LhgoAgmzkm+nk7Al+FFTBPVSrGB0VRoxMTfSzt1PBsUK9K+IqBTz/JofK
   +FH4WNlW7Dt/1PGophTTEB5fFsuR+NgbjsQxAEL3LXNTc7Wo3+9uUUMAv
   IRVVM9li8JoJgDd+uvl/aKxCARrOixtDGQD/gxslw1CGpISf615Xif9m6
   VnKRU+tvzw08kg5u9ULJx9npechBLMsOr2nNU0VVmPHoGogbI2He4uDs+
   w==;
X-CSE-ConnectionGUID: 6CroKZUPTSKraQydiBrihQ==
X-CSE-MsgGUID: lCjAGy6mQ92hAuP/JJ+UWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58887042"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="58887042"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 08:45:29 -0700
X-CSE-ConnectionGUID: gjEM08RGQ5KnfWpQ7GiX8g==
X-CSE-MsgGUID: FpbbvoqFRcuuY+w7PRd9bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136659759"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 May 2025 08:45:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCKU2-0006f9-1B;
	Tue, 06 May 2025 15:45:26 +0000
Date: Tue, 6 May 2025 23:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2888/2888] include/linux/minmax.h:20:35:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202505062356.u2rMcCQF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SeongJae,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f5912cbd669a2722f81f0f054fb8aec1525da8ee
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [2888/2888] mm/damon/core-test: test damon_set_regions
config: x86_64-buildonly-randconfig-006-20250506 (https://download.01.org/0day-ci/archive/20250506/202505062356.u2rMcCQF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505062356.u2rMcCQF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505062356.u2rMcCQF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:14,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/mutex.h:14,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
   mm/damon/core-test.h: In function 'damon_test_set_regions':
>> include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/kunit/test.h:748:16: note: in expansion of macro '__typecheck'
     748 |         ((void)__typecheck(__left, __right));                                  \
         |                ^~~~~~~~~~~
   include/kunit/test.h:772:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     772 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:861:9: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
     861 |         KUNIT_BASE_EQ_MSG_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:871:9: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
     871 |         KUNIT_BINARY_EQ_MSG_ASSERTION(test,                                    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1234:9: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
    1234 |         KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core-test.h:284:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     284 |         KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 3);
         |         ^~~~~~~~~~~~~~~


vim +20 include/linux/minmax.h

cffb222bc2e032 Rikard Falkeborn 2021-06-07   6  
b296a6d53339a7 Andy Shevchenko  2020-10-15   7  /*
b296a6d53339a7 Andy Shevchenko  2020-10-15   8   * min()/max()/clamp() macros must accomplish three things:
b296a6d53339a7 Andy Shevchenko  2020-10-15   9   *
b296a6d53339a7 Andy Shevchenko  2020-10-15  10   * - avoid multiple evaluations of the arguments (so side-effects like
b296a6d53339a7 Andy Shevchenko  2020-10-15  11   *   "x++" happen only once) when non-constant.
b296a6d53339a7 Andy Shevchenko  2020-10-15  12   * - perform strict type-checking (to generate warnings instead of
b296a6d53339a7 Andy Shevchenko  2020-10-15  13   *   nasty runtime surprises). See the "unnecessary" pointer comparison
b296a6d53339a7 Andy Shevchenko  2020-10-15  14   *   in __typecheck().
b296a6d53339a7 Andy Shevchenko  2020-10-15  15   * - retain result as a constant expressions when called with only
b296a6d53339a7 Andy Shevchenko  2020-10-15  16   *   constant expressions (to avoid tripping VLA warnings in stack
b296a6d53339a7 Andy Shevchenko  2020-10-15  17   *   allocation usage).
b296a6d53339a7 Andy Shevchenko  2020-10-15  18   */
b296a6d53339a7 Andy Shevchenko  2020-10-15  19  #define __typecheck(x, y) \
b296a6d53339a7 Andy Shevchenko  2020-10-15 @20  	(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
b296a6d53339a7 Andy Shevchenko  2020-10-15  21  

:::::: The code at line 20 was first introduced by commit
:::::: b296a6d53339a79082c1d2c1761e948e8b3def69 kernel.h: split out min()/max() et al. helpers

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
