Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C184685
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 02:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751164306; cv=none; b=QFRW1CgqweQEseW5oFh8d3i+psEplxEDcwPinKd5imoeVjLt07vs8cIDUvComtIqocPaMvLVsQiiGt1lkt/bDVxWv0DPWeSiWxm8tcDwJfm3m8tkQHtasozzlQb0MBOzlW55IjUCzZPYxFV336zh1nPact433VZhqerluhL74RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751164306; c=relaxed/simple;
	bh=6/Y+GqCAwZF6fwFgHKhL6XJ0h+mbj3ZmphwsyyzRo0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jLcowtK0xrtCj8zh6SIYT0dmq4kfXo6ocO5m+WetbJU1z/u+MRwsOhKGff4YeUywnl2zH9nb3+GQDtOMkOuxm94G1Grzcr7M6OJkPNbLJSs/sh6fvDIDdKRz9U7Mcr6hALFYhZXEp1mTqluh5En9E6FMMEYyzHajy2GV9ucVh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7nDrKO3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7nDrKO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751164304; x=1782700304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/Y+GqCAwZF6fwFgHKhL6XJ0h+mbj3ZmphwsyyzRo0o=;
  b=S7nDrKO3otqiA82hM2ba9o+vGuV8KvIt8KZ4x9jBnBPm77o16/42ZkL2
   W3p18G78HHKssjzOQO2981KtespUi9c0S2Bekqcg52SBJsJngccNXEZ2C
   qitRBsmfWo1KZG8NqnGeJWXTnMPFEShhg8Tg/HuEnZ/U/YSuobv/JBGR1
   xVEaWoItodBfJIa+V/1FAtv/GXQnhOtrjmCklvoUCVej0gkxNAiHnUhA+
   vS67wwgTtoCuwBwrA58P2w9Rr+XbiAOgkD1UXsD5GsjpgFg/E8LHnCrUO
   oRU54NXHCOL+NjjkMEXVJHhG/AvaXi808PPNPtrJEnJ9JEYCbM6F/VDin
   Q==;
X-CSE-ConnectionGUID: +MdZjhsyRiu7JpddBB4uCQ==
X-CSE-MsgGUID: Q+nU9fCJTHWDSvdb2R0D/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="56050252"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="56050252"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 19:31:43 -0700
X-CSE-ConnectionGUID: u0XnPtJpSxWlo9PtssClpg==
X-CSE-MsgGUID: FeVU9gwwRKmVG9p19fVeqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="157407310"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2025 19:31:42 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVhpU-0000qZ-0x;
	Sun, 29 Jun 2025 02:31:40 +0000
Date: Sun, 29 Jun 2025 04:31:12 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2985/2985] mm/damon/core-test.h:284:2: warning:
 comparison of distinct pointer types ('typeof (__left) *' (aka 'unsigned int
 *') and 'typeof (__right) *' (aka 'int *'))
Message-ID: <202506290458.MrAi1kVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c245365237da527fb423d85e7ec54648113f843d
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [2985/2985] mm/damon/core-test: test damon_set_regions
config: x86_64-buildonly-randconfig-2004-20250626 (https://download.01.org/0day-ci/archive/20250629/202506290458.MrAi1kVI-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290458.MrAi1kVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290458.MrAi1kVI-lkp@intel.com/

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
