Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EC423A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 04:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaLofEMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705294200; x=1736830200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OEGbicIpDq9iM8ksMxAI7JtZ+GasjT5dHDdatyjVKpY=;
  b=TaLofEMVkgoRjka2CDy6r3z/0L1HUk2sCwE75fxYHtE9OLtzkzU0r0Dq
   ANcFJlA8d7UckWBD3QAQRl0pVcc4hMdzN77fo8+TcL2DZNcL8nz3K4v7j
   t5f4F+7gy4kxkv/cYHvSGrqvaWP+gKhmkouHDiY563ovqgnJmiaiROsPp
   4Ney5aLx/U9M0PN9lUOmI9kqdWnJKgg9mQ1b6JS8xPaD3SY9Zq/1Dfg/z
   ucLhGhp9LW0kWGrHLbDUzvlAGsXkzxKenBY4jgZ8A1SsQmLhONTCjnCQe
   f/v2UVsAT9FATvNARpWL3GhIbiAyf/84P3nvsFwH+z50gMaosxhdyl2pc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="13013289"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="13013289"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 20:49:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="783693001"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="783693001"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Jan 2024 20:49:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPEv5-000CAk-1S;
	Mon, 15 Jan 2024 04:49:55 +0000
Date: Mon, 15 Jan 2024 12:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21773/30000] mm/damon/core-test.h:284:2:
 warning: comparison of distinct pointer types ('typeof (__left) *' (aka
 'unsigned int *') and 'typeof (__right) *' (aka 'int *'))
Message-ID: <202401151209.IS2BWGPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d9d4951bf741189c66627715d5ae8a8cf1df85f
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [21773/30000] mm/damon/core-test: test damon_set_regions
config: x86_64-buildonly-randconfig-001-20240114 (https://download.01.org/0day-ci/archive/20240115/202401151209.IS2BWGPX-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151209.IS2BWGPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151209.IS2BWGPX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/core.c:1248:
>> mm/damon/core-test.h:284:2: warning: comparison of distinct pointer types ('typeof (__left) *' (aka 'unsigned int *') and 'typeof (__right) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     284 |         KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 3);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1234:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1234 |         KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:871:2: note: expanded from macro 'KUNIT_BINARY_EQ_ASSERTION'
     871 |         KUNIT_BINARY_EQ_MSG_ASSERTION(test,                                    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     872 |                                       assert_type,                             \
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     873 |                                       left,                                    \
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     874 |                                       right,                                   \
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     875 |                                       NULL)
         |                                       ~~~~~
   include/kunit/test.h:861:2: note: expanded from macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
     861 |         KUNIT_BASE_EQ_MSG_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     862 |                                     kunit_binary_assert,                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     863 |                                     KUNIT_INIT_BINARY_ASSERT_STRUCT,           \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     864 |                                     assert_type,                               \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     865 |                                     left,                                      \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     866 |                                     right,                                     \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     867 |                                     fmt,                                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     868 |                                     ##__VA_ARGS__)
         |                                     ~~~~~~~~~~~~~~
   include/kunit/test.h:772:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
     772 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     773 |                                     assert_class,                              \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     774 |                                     ASSERT_CLASS_INIT,                         \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     775 |                                     assert_type,                               \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     776 |                                     left, ==, right,                           \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     777 |                                     fmt,                                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     778 |                                     ##__VA_ARGS__)
         |                                     ~~~~~~~~~~~~~~
   include/kunit/test.h:748:9: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     748 |         ((void)__typecheck(__left, __right));                                  \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +284 mm/damon/core-test.h

   269	
   270	static void damon_test_set_regions(struct kunit *test)
   271	{
   272		struct damon_target *t = damon_new_target();
   273		struct damon_region *r1 = damon_new_region(4, 16);
   274		struct damon_region *r2 = damon_new_region(24, 32);
   275		struct damon_addr_range range = {.start = 8, .end = 28};
   276		unsigned long expects[] = {8, 16, 16, 24, 24, 28};
   277		int expect_idx = 0;
   278		struct damon_region *r;
   279	
   280		damon_add_region(r1, t);
   281		damon_add_region(r2, t);
   282		damon_set_regions(t, &range, 1);
   283	
 > 284		KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 3);
   285		damon_for_each_region(r, t) {
   286			KUNIT_EXPECT_EQ(test, r->ar.start, expects[expect_idx++]);
   287			KUNIT_EXPECT_EQ(test, r->ar.end, expects[expect_idx++]);
   288		}
   289		damon_destroy_target(t);
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
