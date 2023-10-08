Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559B8487
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1U3nBh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696764539; x=1728300539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=doPS7+LELECbHcFV5RcgJhqc9D8qbzsZC8IiH0nsmz4=;
  b=V1U3nBh36rThwSrPgLQy9blKZ8Oarwg1Tpz8I1DulhPQmRPuj0Sm8r6I
   VvCEWqh914OPTEeOo0WN9x+G2hLMWKiVdNITCw+nn59VfqvA8IjVvulKv
   I/xG/hemT3XgdlKcyBfW14bjr/Itn/LKGe4zGs9nP0DZSTvrS4lWRfQJB
   MN8NxXXPw+PMvWY2Hx3ou7RQo5Z2MGvPOpPsyLwMifnM41dW5WpE7cV+W
   gRVYRC7o1lgk0x7o7bZFjb/BEHddR6Vw3Usd37FuUlsaB2nWMa90FGQIQ
   FjZB6UTi8BJDMYdGZ7ESzTQvIQu9RxYIhdF9tIaThMuQb6rHZbtoeCCBC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="374323239"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="374323239"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 04:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="729367053"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="729367053"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Oct 2023 04:28:57 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpRxu-0005MV-2q;
	Sun, 08 Oct 2023 11:28:54 +0000
Date: Sun, 8 Oct 2023 19:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 14381/29110] htmldocs:
 ./include/kunit/test.h:240: warning: Excess function parameter 'suites'
 description in 'kunit_test_suites'
Message-ID: <202310081939.a7KQfBHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   5f1cbd78af5925311b9d58f8066186a356d9a73c
commit: 7678fa7446929653a803f010955f19dd26d93c80 [14381/29110] UPSTREAM: kunit: allow kunit tests to be loaded as a module
reproduce: (https://download.01.org/0day-ci/archive/20231008/202310081939.a7KQfBHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310081939.a7KQfBHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/kunit/test.h:240: warning: Excess function parameter 'suites' description in 'kunit_test_suites'

vim +240 ./include/kunit/test.h

   199	
   200	/**
   201	 * kunit_test_suites() - used to register one or more &struct kunit_suite
   202	 *			 with KUnit.
   203	 *
   204	 * @suites: a statically allocated list of &struct kunit_suite.
   205	 *
   206	 * Registers @suites with the test framework. See &struct kunit_suite for
   207	 * more information.
   208	 *
   209	 * When builtin,  KUnit tests are all run as late_initcalls; this means
   210	 * that they cannot test anything where tests must run at a different init
   211	 * phase. One significant restriction resulting from this is that KUnit
   212	 * cannot reliably test anything that is initialize in the late_init phase;
   213	 * another is that KUnit is useless to test things that need to be run in
   214	 * an earlier init phase.
   215	 *
   216	 * An alternative is to build the tests as a module.  Because modules
   217	 * do not support multiple late_initcall()s, we need to initialize an
   218	 * array of suites for a module.
   219	 *
   220	 * TODO(brendanhiggins@google.com): Don't run all KUnit tests as
   221	 * late_initcalls.  I have some future work planned to dispatch all KUnit
   222	 * tests from the same place, and at the very least to do so after
   223	 * everything else is definitely initialized.
   224	 */
   225	#define kunit_test_suites(...)						\
   226		static struct kunit_suite *suites[] = { __VA_ARGS__, NULL};	\
   227		static int kunit_test_suites_init(void)				\
   228		{								\
   229			unsigned int i;						\
   230			for (i = 0; suites[i] != NULL; i++)			\
   231				kunit_run_tests(suites[i]);			\
   232			return 0;						\
   233		}								\
   234		late_initcall(kunit_test_suites_init);				\
   235		static void __exit kunit_test_suites_exit(void)			\
   236		{								\
   237			return;							\
   238		}								\
   239		module_exit(kunit_test_suites_exit)
 > 240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
