Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F182F90EA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 22:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713278; cv=none; b=BO4K71Kh67HDozqRKMnsubUQi/hESnVJAjwXHh6CLM9FRBibGKeW2gxbPMhNAflPquSjrTgjjxkRPgBY8GvC0o+jorLxouyA9+4/ULE8EWSaCUbhLu5fHLBtJ8RVVMoHRJQ5dxI6hPR/TLzrWQeUoz8RGUjZiN7M5H+TgY/J77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713278; c=relaxed/simple;
	bh=6IOAgvWXMwXXlUWCXkpCKubGwQlez3k+0Gp2xOW/K7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UNuo9DlQVOrDEoD19QHPMYymNEPqLlTqIcWjQGqodepqsSeIKHiMzhfaTxjlpRrH2H399d+Fld9tz4rPDusVzelWT+/yL7FlpIpBPFDDafeORmV8UJ9zGU1qoWu1k0X5YT+oSPMl4iii7tCsVsIe/tV7LOzjr6Qmb3OcCGUTJsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDMDkXvK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDMDkXvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764713276; x=1796249276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6IOAgvWXMwXXlUWCXkpCKubGwQlez3k+0Gp2xOW/K7E=;
  b=UDMDkXvKUDv8IS9cpMQJf18NR6RMNTHc3WWkUHB3ryCngrcewo02fLdw
   2EUsjm5kSeuyE5tCMZh8oVWw0XVcs2ijG1J6lgzcOKoPr71IO8qMEJpbs
   4rs/OU40EvNYqwtLw5FgPfeoKib4idLH59QIVB2pItndy21Yvu2RLp592
   TIkQ606l2mPICCg0FdvITBvByEBJ93fUKc8ce2UYOQhaOgsFHFDOe0cGC
   2YsRviLeGR1T0c5rDLd00isRxk1/PxS9ocY3qKJJxlZ9WNW8YS5AVlIh6
   qEt7xn6FXEDa1fz4wAxuGod4TB6iwJ2jJOk5Fux7BuiAdCpcTl2h97tGe
   Q==;
X-CSE-ConnectionGUID: 4YraR1AXTrG4TEEe4bhW0A==
X-CSE-MsgGUID: Ce7SbIr7Twu80HNxgSB+aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84095833"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="84095833"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:07:54 -0800
X-CSE-ConnectionGUID: etMDNPjRTWGgYyy5CNVOWw==
X-CSE-MsgGUID: ZD/Ql1+iSBKVT2pHTA8eUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198676625"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 14:07:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQYXG-00000000AEx-3Da6;
	Tue, 02 Dec 2025 22:07:50 +0000
Date: Wed, 3 Dec 2025 06:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3358/3358] include/linux/minmax.h:20:35:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202512030654.YOYxPYw8-lkp@intel.com>
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
head:   03e082d09650967490d956864473e92a29ee350f
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [3358/3358] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-001-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030654.YOYxPYw8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030654.YOYxPYw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030654.YOYxPYw8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:14,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/mutex.h:14,
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
