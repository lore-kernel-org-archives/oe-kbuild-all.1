Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16B91B85E6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 23:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725752015; cv=none; b=HW3qqqheOnAhuNwuBBKqzV9+QrA+fqYmviD15F/5ILWGuXYZUoWQBSG70LYWwCZyEqLgJf7dHYFSiW4M3lOAugHujLfosIiyDJWWkh3iia+FVtBMM2FLMwnTxdpA7duTk3LHmsr6gTvAVW6YZBWbh/zbNRLLnf78R25pwWOyGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725752015; c=relaxed/simple;
	bh=tZqNvb88m+n0OGHyrJrIlGNCXBpyLFtxVLV4/+FgghM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJqABmVz+JdYfDCzpVTa+11UlOGlcBYZz3KN49hwRIOnDedEaJivN93JR+AgcHZwtcuQ/yyDJP3M4BeHg9CozUv4BhBvUHV8WeWGCNHHa+l577KIH8OnH3jcMSfID5mkIpfzhM2x09ef2U+VM4VJUVJiCP/OgKp23HRGU2ZEEug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Txj3FXr+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Txj3FXr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725752013; x=1757288013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZqNvb88m+n0OGHyrJrIlGNCXBpyLFtxVLV4/+FgghM=;
  b=Txj3FXr+HJCtHeqd9GvVKJ46BV6AjBRvj4/stPTBYWh6HuVh0SgjN56Y
   hD6BfxmSmmy8YRoiRk8yyJb5rlhj1ciJEvADVZEgc8v5DAJ6G4aC6JOpt
   z5aEFq1u/UjuF9Bj9wKt7TrOGvFR8vM1YdaHUj3bZ5Ip51EljI2wBB/rm
   qUrKghLJtPsn30hT8F/7Wtrzo+xX4UhZXzWBFAsQ4N5u5OY6FYBOUKIJU
   PouhJWPuxyeJFUatVpUmeGCP8haMHzQbHTKZR1SOyN6lXAiEtbSVaYVEn
   aF8/kpfTGjUQzqh0rDLWMsMP9JHgsPNCgoah9kZUJgFFImDLzc8905kBt
   Q==;
X-CSE-ConnectionGUID: f6xWl+UyTWG4pOp3sYwUWA==
X-CSE-MsgGUID: uuexmVJJQNe5u+zuBr706Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="28219589"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="28219589"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 16:33:32 -0700
X-CSE-ConnectionGUID: CJCnVVxnQIalF0NDjMA/5w==
X-CSE-MsgGUID: AeLnrj9dTzaSisYF76D2rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="70418417"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 16:33:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn4vp-000D6p-0N;
	Sat, 07 Sep 2024 23:33:29 +0000
Date: Sun, 8 Sep 2024 07:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 5427/5476]
 lib/fortify_kunit.c:260:1: warning: stack frame size (8632) exceeds limit
 (8192) in 'fortify_test_alloc_size_kmalloc_const'
Message-ID: <202409080745.iHvbJKUw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   9cfeb6de5d2169b2f27360ea8f565b13ae64d5b3
commit: 5677cab2b2a8016c85c8ca5863517afd7dd7f42e [5427/5476] ANDROID: Add padding to kunit structures exposed on the KMI
config: x86_64-randconfig-015-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080745.iHvbJKUw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080745.iHvbJKUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080745.iHvbJKUw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/fortify_kunit.c:260:1: warning: stack frame size (8632) exceeds limit (8192) in 'fortify_test_alloc_size_kmalloc_const' [-Wframe-larger-than]
     260 | DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
         | ^
   lib/fortify_kunit.c:193:13: note: expanded from macro 'DEFINE_ALLOC_SIZE_TEST_PAIR'
     193 | static void fortify_test_alloc_size_##allocator##_const(struct kunit *test) \
         |             ^
   <scratch space>:82:1: note: expanded from here
      82 | fortify_test_alloc_size_kmalloc_const
         | ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]


vim +/fortify_test_alloc_size_kmalloc_const +260 lib/fortify_kunit.c

9124a26401483b Kees Cook 2022-09-29  201  
9124a26401483b Kees Cook 2022-09-29  202  #define TEST_kmalloc(checker, expected_size, alloc_size)	do {	\
9124a26401483b Kees Cook 2022-09-29  203  	gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;				\
9124a26401483b Kees Cook 2022-09-29  204  	void *orig;							\
9124a26401483b Kees Cook 2022-09-29  205  	size_t len;							\
9124a26401483b Kees Cook 2022-09-29  206  									\
9124a26401483b Kees Cook 2022-09-29  207  	checker(expected_size, kmalloc(alloc_size, gfp),		\
9124a26401483b Kees Cook 2022-09-29  208  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  209  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  210  		kmalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  211  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  212  	checker(expected_size, kzalloc(alloc_size, gfp),		\
9124a26401483b Kees Cook 2022-09-29  213  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  214  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  215  		kzalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  216  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  217  	checker(expected_size, kcalloc(1, alloc_size, gfp),		\
9124a26401483b Kees Cook 2022-09-29  218  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  219  	checker(expected_size, kcalloc(alloc_size, 1, gfp),		\
9124a26401483b Kees Cook 2022-09-29  220  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  221  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  222  		kcalloc_node(1, alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  223  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  224  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  225  		kcalloc_node(alloc_size, 1, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  226  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  227  	checker(expected_size, kmalloc_array(1, alloc_size, gfp),	\
9124a26401483b Kees Cook 2022-09-29  228  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  229  	checker(expected_size, kmalloc_array(alloc_size, 1, gfp),	\
9124a26401483b Kees Cook 2022-09-29  230  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  231  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  232  		kmalloc_array_node(1, alloc_size, gfp, NUMA_NO_NODE),	\
9124a26401483b Kees Cook 2022-09-29  233  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  234  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  235  		kmalloc_array_node(alloc_size, 1, gfp, NUMA_NO_NODE),	\
9124a26401483b Kees Cook 2022-09-29  236  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  237  									\
9124a26401483b Kees Cook 2022-09-29  238  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b Kees Cook 2022-09-29  239  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b Kees Cook 2022-09-29  240  	checker((expected_size) * 2,					\
9124a26401483b Kees Cook 2022-09-29  241  		krealloc(orig, (alloc_size) * 2, gfp),			\
9124a26401483b Kees Cook 2022-09-29  242  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  243  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b Kees Cook 2022-09-29  244  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b Kees Cook 2022-09-29  245  	checker((expected_size) * 2,					\
9124a26401483b Kees Cook 2022-09-29  246  		krealloc_array(orig, 1, (alloc_size) * 2, gfp),		\
9124a26401483b Kees Cook 2022-09-29  247  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  248  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b Kees Cook 2022-09-29  249  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b Kees Cook 2022-09-29  250  	checker((expected_size) * 2,					\
9124a26401483b Kees Cook 2022-09-29  251  		krealloc_array(orig, (alloc_size) * 2, 1, gfp),		\
9124a26401483b Kees Cook 2022-09-29  252  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  253  									\
9124a26401483b Kees Cook 2022-09-29  254  	len = 11;							\
9124a26401483b Kees Cook 2022-09-29  255  	/* Using memdup() with fixed size, so force unknown length. */	\
9124a26401483b Kees Cook 2022-09-29  256  	if (!__builtin_constant_p(expected_size))			\
9124a26401483b Kees Cook 2022-09-29  257  		len += zero_size;					\
9124a26401483b Kees Cook 2022-09-29  258  	checker(len, kmemdup("hello there", len, gfp), kfree(p));	\
9124a26401483b Kees Cook 2022-09-29  259  } while (0)
9124a26401483b Kees Cook 2022-09-29 @260  DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
9124a26401483b Kees Cook 2022-09-29  261  

:::::: The code at line 260 was first introduced by commit
:::::: 9124a26401483bf2b13a99cb4317dce3f677060f kunit/fortify: Validate __alloc_size attribute results

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
