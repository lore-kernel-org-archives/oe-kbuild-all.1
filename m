Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94E76035
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737438725; cv=none; b=S4ZE75KqTCcGe2qazur9rLLA7MQB1XG4fgMePOlBKvIGo4TSce1cfxQ918cLZdRvNoPwQjWUkLKpSH2FteLTcq+2LV3dFVdWTJE759dogJrmrMnb+9QB7vQ+GfhvMK+etXW0eCA+kQ/A/F5WFnE1/pCkt5iJeMlLTlCYsvlST0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737438725; c=relaxed/simple;
	bh=swY3mTuKBDS2rHA1AN4TyPdQQuLy69+ZvqOd+2vgngI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2BM3mkzhc+Ks2Ms5dkqhumvCiaYv6qf3eaH+8TtdgZeqItRxdW07FlmpW4jOrYtgcBvh43+xmk9g3LBDmI/X/U8Xcqoxr/C87IbqAI2spZgzALCD8zdHj9+RNMc9v+Aha7VW+hV7GPAnnD4n37Oze5FY2GUYEftHm+vHNcp1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m52cDmgq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m52cDmgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737438723; x=1768974723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swY3mTuKBDS2rHA1AN4TyPdQQuLy69+ZvqOd+2vgngI=;
  b=m52cDmgqORVbRY0GSP18Js3kFmww+kVA+bPuTtSj9rdhE5hLQbaw9uQ/
   GG4hXcm7xrMGUWA8o+A1HHcWCUHex+k180xzKYQ3/xBM/zTNBfrsiC+UB
   A4XvN3Dd1ktMu8DIYll6Bn64ui0a21ftjBkb5oR2p1HKdM7BxNwTsCLF+
   nUWqBJZuu7YI5zcBGvhpcX/3JEAchRtdr8mTxVAWVd0IpMdmUTHugykV3
   y/m1LeJz4o7RENO5uNYbDJjfRqfA7D0+QDvIQNUz48tLEFZdePsS3HYru
   I1s2SqCsAfv4QfX3tNS31BCfYXlsAh3kQwdv9tm8vu3RkncFv2CfvCF0m
   g==;
X-CSE-ConnectionGUID: r7a5t4mGSMWUzfy0ooqWjQ==
X-CSE-MsgGUID: feoncadTSAimCssSzrGuKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37711123"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="37711123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 21:52:02 -0800
X-CSE-ConnectionGUID: GJS/m6V7QgyKtGG20zTa4g==
X-CSE-MsgGUID: HRmVXeRFS/O6Hf9MXVzScg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111797354"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2025 21:52:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta7B8-000Xgq-33;
	Tue, 21 Jan 2025 05:51:58 +0000
Date: Tue, 21 Jan 2025 13:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2710/2710] include/linux/minmax.h:20:35:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202501211343.QkEtCRqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2095f425a2f9fc280284b026ca81a957bda446ef
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [2710/2710] mm/damon/core-test: test damon_set_regions
config: arm64-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211343.QkEtCRqf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211343.QkEtCRqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211343.QkEtCRqf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/mutex.h:15,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
   mm/damon/core-test.h: In function 'damon_test_set_regions':
>> include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
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
