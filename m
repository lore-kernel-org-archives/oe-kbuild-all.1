Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9BB2D59E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 04:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321787; cv=none; b=KRcBI2D47EoUmf3rZ6YQShDvL+xsUitK9/hy3zwPQ6otknobtzx0iw7kHw9P8cjKS5ZFuNZ87BDbP99Gy+tLKcFHyNuyZ7jFDdZbMA0+6GGjQ7l8gGS6U1Ssx1CT/+9Ez+jAzhCAnBWNqHzK8TI4un4gFILsbnzgQLVqZuaFs6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321787; c=relaxed/simple;
	bh=60SFwzqdMf6wp8xD6mow3OO/FPQrGKoOZSLGlUuGpX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jdh7qJ3L9JVRUhcLKJ02zqICS2Kf77PdUTOflzM+omA8ODqvD8NCWElpJ3k/ahRbGSbR3UbBUIcRMGjPQqBb1HLyNfVsLI9asNemwi22fIba0pT6rX44kTojMQIliaSgoNxsErc5OT4pd/7BxzueskobKLhmiwXtEmhMNGaonxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+HBGaf2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+HBGaf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788321785; x=1819857785;
  h=date:from:to:cc:subject:message-id;
  bh=60SFwzqdMf6wp8xD6mow3OO/FPQrGKoOZSLGlUuGpX8=;
  b=D+HBGaf2I33PYQ3Lndj566zAc0jn2nChokfI4v5SjXwyg9Gi7uAUeFk2
   L06aI15MiQy0hbhl/yxsGbQKXKlA2mjvMnDhf3/TIBmnvvf9t2Rz+XeYc
   oFuvpaqpRmAjNqchkDL11y0EbdFNTtSNseKAfvMvcj42eJOwt+uUJEgox
   H4Wk1fnDIvwDAB0Inl2LZB2Y61rmGhTWVFxRNfICRR8vloZh+CTJg/v6A
   Ma0vvHYYZI2bE5/+Xv41a24P6AhcyvcfdHQ9b66a4yPFdLdLZnu9JnES7
   BED/UYGLTDBuqBTrXbdV76wml0id7+WIKICPuOSALMePApJMRlAKZEunI
   A==;
X-CSE-ConnectionGUID: lFtwJfkdSLunFzPi256C8Q==
X-CSE-MsgGUID: Jzm9t29xRkKN3IJVBp4rJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88646772"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88646772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 21:03:03 -0700
X-CSE-ConnectionGUID: q1t0CJjrT8+1YjiD0/7wtw==
X-CSE-MsgGUID: Z8zxu7zOR7embn+m+Oyqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="273477783"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Sep 2026 21:03:03 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1cBf-000000001v7-3AYS;
	Wed, 02 Sep 2026 04:02:59 +0000
Date: Wed, 02 Sep 2026 12:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/test/cache 14/14] fs/f2fs/cache_test.c:280:27:
 error: implicit declaration of function 'f2fs_cache_test_and_set_referenced';
 did you mean 'f2fs_cache_test_and_clear_referenced'?
Message-ID: <202609021227.BGM2MWwj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/test/cache
head:   80184bf033f71e094078e92116db41b8329e136a
commit: 80184bf033f71e094078e92116db41b8329e136a [14/14] f2fs: cache: introduce KUnit test suite
config: sh-randconfig-r062-20260901 (https://download.01.org/0day-ci/archive/20260902/202609021227.BGM2MWwj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021227.BGM2MWwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021227.BGM2MWwj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from fs/f2fs/cache_test.c:9:
   fs/f2fs/cache_test.c: In function 'test_cache_block_states_and_bitlocks':
>> fs/f2fs/cache_test.c:280:27: error: implicit declaration of function 'f2fs_cache_test_and_set_referenced'; did you mean 'f2fs_cache_test_and_clear_referenced'? [-Werror=implicit-function-declaration]
     280 |  KUNIT_EXPECT_FALSE(test, f2fs_cache_test_and_set_referenced(entry));
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
      76 | # define likely(x) __builtin_expect(!!(x), 1)
         |                                        ^
   include/kunit/test.h:810:2: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     810 |  KUNIT_UNARY_ASSERTION(test,            \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1017:2: note: in expansion of macro 'KUNIT_FALSE_MSG_ASSERTION'
    1017 |  KUNIT_FALSE_MSG_ASSERTION(test,            \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1014:2: note: in expansion of macro 'KUNIT_EXPECT_FALSE_MSG'
    1014 |  KUNIT_EXPECT_FALSE_MSG(test, condition, NULL)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/cache_test.c:280:2: note: in expansion of macro 'KUNIT_EXPECT_FALSE'
     280 |  KUNIT_EXPECT_FALSE(test, f2fs_cache_test_and_set_referenced(entry));
         |  ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +280 fs/f2fs/cache_test.c

   241	
   242	/* Module 5: F2FS_BLOCK_* block states and bit-locks */
   243	static void test_cache_block_states_and_bitlocks(struct kunit *test)
   244	{
   245		struct f2fs_cache_test_ctx *ctx = test->priv;
   246		struct f2fs_cached_block_list *cache = META_CACHE(&ctx->sbi);
   247		struct f2fs_cached_block *entry;
   248	
   249		entry = f2fs_grab_cache(cache, 1, F2FS_CACHE_CREATE);
   250		KUNIT_ASSERT_FALSE(test, IS_ERR(entry));
   251	
   252		/* Lock / Trylock / Unlock */
   253		KUNIT_EXPECT_TRUE(test, f2fs_trylock_cache(entry));
   254		KUNIT_EXPECT_TRUE(test, f2fs_cache_test_locked(entry));
   255		KUNIT_EXPECT_FALSE(test, f2fs_trylock_cache(entry));
   256		f2fs_unlock_cache(entry);
   257		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_locked(entry));
   258	
   259		/* Uptodate */
   260		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_uptodate(entry));
   261		f2fs_cache_set_uptodate(entry);
   262		KUNIT_EXPECT_TRUE(test, f2fs_cache_test_uptodate(entry));
   263		f2fs_cache_clear_uptodate(entry);
   264		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_uptodate(entry));
   265	
   266		/* Dirty */
   267		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_dirty(entry));
   268		f2fs_mark_cache_dirty(entry);
   269		KUNIT_EXPECT_TRUE(test, f2fs_cache_test_dirty(entry));
   270		KUNIT_EXPECT_TRUE(test, f2fs_cache_test_and_clear_dirty(entry));
   271		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_dirty(entry));
   272	
   273		/* Inline */
   274		f2fs_cache_set_inline(entry);
   275		KUNIT_EXPECT_TRUE(test, f2fs_cache_test_inline(entry));
   276		f2fs_cache_clear_inline(entry);
   277		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_inline(entry));
   278	
   279		/* Referenced */
 > 280		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_and_set_referenced(entry));
   281		KUNIT_EXPECT_TRUE(test, f2fs_cache_test_and_set_referenced(entry));
   282		KUNIT_EXPECT_TRUE(test, f2fs_cache_test_and_clear_referenced(entry));
   283		KUNIT_EXPECT_FALSE(test, f2fs_cache_test_and_clear_referenced(entry));
   284	}
   285	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
