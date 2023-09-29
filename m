Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7116669B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696024263; x=1727560263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vb6cZE7HPlHwpyjvUvNwwI0FUQfi8UQeKYXGAu0n0u4=;
  b=ZEvZRXv/LfaFzKZuVWrOQYYqCXyQGJon65IaBBUqMH6rAT7ix5Vlz52x
   zUAQb0HsU6dOY1SS1PVKekozWMa47sttPc32TVi2A0xpfvmE2TipgyLIf
   KGts3z3S6FkSnLPGcwFn8cxvYpHhkgYuTY22t6pyavMnobExaErb03liJ
   M8R1dhPMZQzjWywI7n6/B7apMasbEKADbHgxnp1J6moljW+3WsxynSlGb
   6wskwi0BxB87ShIzX96TsPyv0oVssFTC0xAbbJs4uswqSLZElKwfCi7p1
   FPF8fAVm7U6KeSCD89LvO15pBuwMYZ+s7lQmPleqcKys1NOiXRsbAgivO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="468667311"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="468667311"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 14:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="997053930"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="997053930"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2023 14:51:01 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmLNy-0003IL-0t;
	Fri, 29 Sep 2023 21:50:58 +0000
Date: Sat, 30 Sep 2023 05:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 14381/28554] htmldocs:
 ./include/kunit/test.h:240: warning: Excess function parameter 'suites'
 description in 'kunit_test_suites'
Message-ID: <202309300511.p74AI5M0-lkp@intel.com>
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
head:   a1b9dbe5628adf6bc61b5bb150dd2fb2b286fda0
commit: 7678fa7446929653a803f010955f19dd26d93c80 [14381/28554] UPSTREAM: kunit: allow kunit tests to be loaded as a module
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309300511.p74AI5M0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300511.p74AI5M0-lkp@intel.com/

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
