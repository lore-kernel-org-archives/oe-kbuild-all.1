Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D991514C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726935298; cv=none; b=YZbpGh/kCQ3mzOl2xIvJVlMstuwjSGAN0jm1+CZx1PUs+vv1S4m71i9HsmA7DUaCvW0bkoHG9oc9RxlVmGUFkbj0VAEpna+59yPbH/ptu0AGawDlA0X0dyxD25Tr4T9LRG1cEEfGCrlEwAaPNZilJLrcS3PdyDgkIQA+yAKfetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726935298; c=relaxed/simple;
	bh=8jv70iyW/sgjDWBQWWPOk7GodlGTd6Lp8E8LCo1DaLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjBVpi2i1MzTvN7nsX/2oVe/tQNJTCKz8NooCjfM/HlAV7c+a5JPFhRddTyrTU3NKfH85UfILAbQ1Z1H4Z8D9hEZT8BiVpWn1PTjbC8dlrsociJXoF7amv+CtIVmHrI8Nddj3khZj9iOgsTa5kUJD7wJ4ziTJ7rLwfE8R49krrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4FwTyVe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4FwTyVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726935296; x=1758471296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jv70iyW/sgjDWBQWWPOk7GodlGTd6Lp8E8LCo1DaLE=;
  b=i4FwTyVeenuTXCTsmGS0fpYPFb3eIcvafzYmKjzHnmbzmwphjIqPsbjN
   dxIuG1bDL+pzrHYrOgEYHnnysYcm3tVjLpm+rW77aZInqgQs4x072W/cL
   lIpxCP1ZNzji3xtHX9bdCz4KYX+6piZD21eLSqBmjcM3TBfrda5TtzeNU
   nJ2VoBk+jj3nFkSSyKZ62R5mrdzeCy0pArrNjHBAKmWUC85N0vB0z5ZX9
   DMzM0vW4csHfJzJO/ldfo3AedNjM3ssAXZfFDPm0RXs6HqE7kmE7Ur+Qa
   Zc54Lx0jgdAUDcqvQg/35x5MQusQo3YYKVxkkwy4NEFk+eveY6xmDYh7q
   Q==;
X-CSE-ConnectionGUID: X2AyWojPSDiUi/b0Voo3kg==
X-CSE-MsgGUID: GQZ2+x9nQ+mfPYPMGZymrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29717454"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="29717454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 09:14:55 -0700
X-CSE-ConnectionGUID: JRzVMFFVQqCrY9GexuFyMQ==
X-CSE-MsgGUID: zpUIGLHHTWGyZ4/QFSyrzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="75173452"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2024 09:14:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss2l2-000FZr-12;
	Sat, 21 Sep 2024 16:14:52 +0000
Date: Sun, 22 Sep 2024 00:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5337/5398]
 lib/fortify_kunit.c:260:1: warning: stack frame size (8696) exceeds limit
 (8192) in 'fortify_test_alloc_size_kmalloc_const'
Message-ID: <202409220047.ZCvQeyVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sid,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   0ea1cc7084ff501255e69375865a3c40c4b58a75
commit: 5677cab2b2a8016c85c8ca5863517afd7dd7f42e [5337/5398] ANDROID: Add padding to kunit structures exposed on the KMI
config: x86_64-randconfig-161-20240921 (https://download.01.org/0day-ci/archive/20240922/202409220047.ZCvQeyVB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220047.ZCvQeyVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220047.ZCvQeyVB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/fortify_kunit.c:260:1: warning: stack frame size (8696) exceeds limit (8192) in 'fortify_test_alloc_size_kmalloc_const' [-Wframe-larger-than]
     260 | DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
         | ^
   lib/fortify_kunit.c:193:13: note: expanded from macro 'DEFINE_ALLOC_SIZE_TEST_PAIR'
     193 | static void fortify_test_alloc_size_##allocator##_const(struct kunit *test) \
         |             ^
   <scratch space>:144:1: note: expanded from here
     144 | fortify_test_alloc_size_kmalloc_const
         | ^
   1 warning generated.


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
