Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82542B544
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692726949; x=1724262949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ayCLgyW/WnpesOu4RZSL34j/+SZJmrg4HNdUUy12DI=;
  b=OhUi5UG3DHNwkejXx5UnOGAyN3YPF4054gILc6jy+DqLw4HvDi9fKDXj
   /3KIYsIO8/w1vf3p8fylr/3iBUFkbBOCtGlLyqzHg3I3uw8bwPkIYOyr+
   zY6OEqS9ivehrID+/9Z33pL8pHSpdqbHpdkNtAe4ERl420BfXZYr6G1fT
   QNsptj9JzkoC3MXT+Aagtwt28thMFdie1/8glG1dO7hKOKYPuIQMJ7A9t
   RhryQ+/4xQ1dPy5NGApQAWedcmrFQKQd0z0cj4yWcOYqqzaY6pxQUbOtg
   Y3JaDKAzXPD2NVq75chZLRFlRJoZJfD1cMIP3CNY483fWHgEWs/JqnXAK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354289363"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="354289363"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 10:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880042105"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 10:55:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYVbW-0000OW-1s;
	Tue, 22 Aug 2023 17:55:46 +0000
Date: Wed, 23 Aug 2023 01:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 14381/28543] htmldocs:
 ./include/kunit/test.h:240: warning: Excess function parameter 'suites'
 description in 'kunit_test_suites'
Message-ID: <202308230142.SWlgfBQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   a14f43f0b97d279d50029fba7442bb4cd393089d
commit: 7678fa7446929653a803f010955f19dd26d93c80 [14381/28543] UPSTREAM: kunit: allow kunit tests to be loaded as a module
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230142.SWlgfBQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230142.SWlgfBQm-lkp@intel.com/

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
