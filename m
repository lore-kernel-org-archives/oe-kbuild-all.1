Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED5484221
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Sep 2026 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282296; cv=none; b=CVVq5bV+5Gw4ZIyfa4yaA2bOyAfDzRXYKtNtCA/XzLEFPNzs1/opC/qwcIDSfvayFfuU3j3nXc7FCc5jpGs1E0zjVHHu5qTJRAQvAu8LT6VNEP4cn1m3pNrcFJMrhi1UaLcB76yc1iuMNKEjhcRNCpcbZdx0HPgx8wUhZ5bSXs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282296; c=relaxed/simple;
	bh=2eDYEZ64+6me1nJIoAJqyiG7JrHteb1EEGrjhmP2oN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HY0tCUWy8bwvQ1jvPKwguH2kF+YlVb8UZAGXLYmvZA1NqAnlZ2A5urtklj2lpucaJ2PAvOZ2H5d6cfmbMcPMvOrLJ/JxeKTmyAtUS1N14YPOW5Nay2L1C02xsw8wmqObpJO4u5iDfV9xvw9okVIjEQTPGUDtdgJ74K6fADgERKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8tpAYX+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8tpAYX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788282295; x=1819818295;
  h=date:from:to:cc:subject:message-id;
  bh=2eDYEZ64+6me1nJIoAJqyiG7JrHteb1EEGrjhmP2oN4=;
  b=c8tpAYX+3lE9wlJ8goXeI3SXEz6AubTRgtlOKYdCCT2wbvAMZvhesrUn
   F2KlEzaLnJu9fOaIKeI+IN3dTJAE0ThfnHrTbbSQjoKCf161HYXJLppRu
   /FC+usqpz4RIZ0rzMzb0SBwe/uaHMjiL23XuSQIHluvPPfbV7R+HjvuG/
   DZ80I/7OBsipCcg9EeutY688vUBMu3RRZfycsL+6ZgwduvC+VLM5e+y37
   +976JEC7/A1YzDy/Yqe0MmY+u/W6X0QoU9reZD7h8mWSoIdBWtA8rTP0l
   3acFTn6/N4ZsablOY9/FoO7Eev5Ap0ZXFw8j3W/WsI4EBOhTbTbSanDS+
   g==;
X-CSE-ConnectionGUID: LZIz9aa1Ss+cCii1rj4Zhw==
X-CSE-MsgGUID: pWKxThKuReqk9SFj5l4Cng==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99319781"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="99319781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 10:04:54 -0700
X-CSE-ConnectionGUID: J2iPcWkKQwSMXIupvjiimQ==
X-CSE-MsgGUID: aBcR8cyFRwKMVWUhXDz1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="292671220"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2026 10:04:53 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1Ruk-000000001Cv-2GrT;
	Tue, 01 Sep 2026 17:04:50 +0000
Date: Wed, 02 Sep 2026 01:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/test/cache 14/14] fs/f2fs/cache_test.c:280:27:
 error: call to undeclared function 'f2fs_cache_test_and_set_referenced'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <202609020045.LjDZWJ8q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/test/cache
head:   80184bf033f71e094078e92116db41b8329e136a
commit: 80184bf033f71e094078e92116db41b8329e136a [14/14] f2fs: cache: introduce KUnit test suite
config: powerpc-randconfig-r071-20260901 (https://download.01.org/0day-ci/archive/20260902/202609020045.LjDZWJ8q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020045.LjDZWJ8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020045.LjDZWJ8q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/cache_test.c:280:27: error: call to undeclared function 'f2fs_cache_test_and_set_referenced'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     280 |         KUNIT_EXPECT_FALSE(test, f2fs_cache_test_and_set_referenced(entry));
         |                                  ^
   fs/f2fs/cache_test.c:280:27: note: did you mean 'f2fs_cache_test_and_clear_referenced'?
   fs/f2fs/cache.h:146:1: note: 'f2fs_cache_test_and_clear_referenced' declared here
     146 | F2FS_CACHE_FLAG_TEST_AND_CLEAR_FUNC(referenced, REFERENCED);
         | ^
   fs/f2fs/cache.h:116:20: note: expanded from macro 'F2FS_CACHE_FLAG_TEST_AND_CLEAR_FUNC'
     116 | static inline bool f2fs_cache_test_and_clear_##name(                    \
         |                    ^
   <scratch space>:143:1: note: expanded from here
     143 | f2fs_cache_test_and_clear_referenced
         | ^
   fs/f2fs/cache_test.c:281:26: error: call to undeclared function 'f2fs_cache_test_and_set_referenced'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         KUNIT_EXPECT_TRUE(test, f2fs_cache_test_and_set_referenced(entry));
         |                                 ^
   2 errors generated.


vim +/f2fs_cache_test_and_set_referenced +280 fs/f2fs/cache_test.c

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
