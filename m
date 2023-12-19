Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5C779F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 05:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhX6rWPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702963161; x=1734499161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXRtvAechqqpVgX5gQeFwNmvz8k6jdM9Z2WD+nHEYhE=;
  b=MhX6rWPfUH1kR0WCf8z7/aHYNQ2PlVt47qQMbl9chmWjF+FTZ4KUC4OO
   eNDlGKLqgAYCmd/tUI6HL9GQSc2uoQz9HM/uSX1ynQITjZwZvA+h5l0xr
   Wr3yMVSFxpqIpSZ1iMKXG4xbDfP6drV2cCBTNZLeW5PRro3jGrcsT4Eaj
   GKEBJGj01+fb3q64IXMj68Ab3D506P8dEWaRWgY/uHFDctuoFN9SWBlUo
   gxErADQ4MKfR1j5+sHOPW/vnXQJjAtsUsru03WTJL6mJryTL/kdYWvyLn
   60AxFPwdzJgSbalTybB4WjjPKAVhCDE8SpN10yJvh/a3I/Mn3kmlfQlZj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="375760597"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="375760597"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 21:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866490810"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="866490810"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2023 21:19:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFSVh-0004tN-1G;
	Tue, 19 Dec 2023 05:19:17 +0000
Date: Tue, 19 Dec 2023 13:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 6/9] mm/kfence/kfence_test.c:562:2: error:
 call to undeclared function 'kunit_skip'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202312191333.0z9iYKZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   141cc54207414177407cbc00d651177fc45cef36
commit: 42cf5538c64f10c33580d3cbf521cfc8f31d0616 [6/9] UPSTREAM: kfence: test: use kunit_skip() to skip tests
config: i386-buildonly-randconfig-004-20231219 (https://download.01.org/0day-ci/archive/20231219/202312191333.0z9iYKZV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191333.0z9iYKZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191333.0z9iYKZV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kfence/kfence_test.c:562:2: error: call to undeclared function 'kunit_skip'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           KFENCE_TEST_REQUIRES(test, IS_ENABLED(CONFIG_INIT_ON_FREE_DEFAULT_ON));
           ^
   mm/kfence/kfence_test.c:37:3: note: expanded from macro 'KFENCE_TEST_REQUIRES'
                   kunit_skip((test), "Test requires: " #cond);    \
                   ^
   mm/kfence/kfence_test.c:610:2: error: call to undeclared function 'kunit_skip'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           KFENCE_TEST_REQUIRES(test, CONFIG_KFENCE_SAMPLE_INTERVAL <= 100);
           ^
   mm/kfence/kfence_test.c:37:3: note: expanded from macro 'KFENCE_TEST_REQUIRES'
                   kunit_skip((test), "Test requires: " #cond);    \
                   ^
   2 errors generated.


vim +/kunit_skip +562 mm/kfence/kfence_test.c

   550	
   551	/* Test init-on-free works. */
   552	static void test_init_on_free(struct kunit *test)
   553	{
   554		const size_t size = 32;
   555		struct expect_report expect = {
   556			.type = KFENCE_ERROR_UAF,
   557			.fn = test_init_on_free,
   558			.is_write = false,
   559		};
   560		int i;
   561	
 > 562		KFENCE_TEST_REQUIRES(test, IS_ENABLED(CONFIG_INIT_ON_FREE_DEFAULT_ON));
   563		/* Assume it hasn't been disabled on command line. */
   564	
   565		setup_test_cache(test, size, 0, NULL);
   566		expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
   567		for (i = 0; i < size; i++)
   568			expect.addr[i] = i + 1;
   569		test_free(expect.addr);
   570	
   571		for (i = 0; i < size; i++) {
   572			/*
   573			 * This may fail if the page was recycled by KFENCE and then
   574			 * written to again -- this however, is near impossible with a
   575			 * default config.
   576			 */
   577			KUNIT_EXPECT_EQ(test, expect.addr[i], (char)0);
   578	
   579			if (!i) /* Only check first access to not fail test if page is ever re-protected. */
   580				KUNIT_EXPECT_TRUE(test, report_matches(&expect));
   581		}
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
