Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C3733F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744441726; cv=none; b=qpNBBEmUD0VLhfiLe6JuHREpv4dufnfEZvMFASGANdtY+mZcRjfdxb0uL2rSrIY25ItqdFZ1Pfexsssbyk0XZni+bKQFadXaEfRnAVBu2sOAGdDp80Rp9yQ6E0n1Tp+kximPfUFdzI3vQCTc3IQy5w/4985doT+LgCnQkjXmIjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744441726; c=relaxed/simple;
	bh=4Vv5LXhz5q8WuAbQ2ykpxZOA9vORxAFndXIR+o2f84Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gu8lNUaXFo0zR6s9Q3uhiqE1H7BXe610hJXN1yhskT/39iPYdsEm0Ckjpdf9kODbJZApZGDJ85O/9mqZ4vrEbGxK7TG6HM8FR27L+je12T/Gn6o4AJHYodcG4x8PLUCkb5aEtnwsz+T7pbNsO4B/vYMsu5QeWadEXuhchLSbRpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPWSMsUi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPWSMsUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744441724; x=1775977724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Vv5LXhz5q8WuAbQ2ykpxZOA9vORxAFndXIR+o2f84Y=;
  b=MPWSMsUiF8eUgn1L+6gdeXQGkAWFD+PCvzFOFw20cwZ7JXAJrvMq7MxA
   7PQMS2y0Qhcx8dFTZyD3PKWWtJ4HSPpTXdZ+3cA0r0Ys53G6GKBoeVTRB
   nkCdtE/MKgIh+c9nz8EI4pjKBfiq+mDnatYw02PXBYxYR5sEwpcjXfxtM
   HkXUUHqWb0LI/hneub0yVCnp4c8DaKUf/sWJnKSEGS0i9TAmueODArY4X
   QMrS73HevNGrAzYSPC3poPzEHxtBYhaCL04UfgT/6A2EcuJpt33avn/Yr
   r8zgh/xwMXRJgaGRYTZNFu04l5zBoKsWQozU1sRyG0PSFozbwzPKQP2og
   Q==;
X-CSE-ConnectionGUID: /0uLXKOpSP+mGdeBBdczlA==
X-CSE-MsgGUID: NQIEpxbiQxSn6w9U6znOow==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46079025"
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="46079025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 00:08:43 -0700
X-CSE-ConnectionGUID: HGZI+mATSoOKT2xIhNfPQw==
X-CSE-MsgGUID: p+/B++eCQH+yaV5kejd1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="134540467"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2025 00:08:41 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Uyl-000BdG-16;
	Sat, 12 Apr 2025 07:08:39 +0000
Date: Sat, 12 Apr 2025 15:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/2]
 lib/tests/fortify_kunit.c:277:1: warning: stack frame size (8632) exceeds
 limit (8192) in 'fortify_test_alloc_size_kmalloc_const'
Message-ID: <202504121425.xGJQkRC9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   9cb0db5e6c5e307476f66da623a3e905553794fe
commit: 72603f76c56b31ce9258b5be441d9cd894832961 [0/2] Merge fc13a78e1f68 ("Merge tag 'hardening-v6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux") into android-mainline
config: x86_64-randconfig-104-20250412 (https://download.01.org/0day-ci/archive/20250412/202504121425.xGJQkRC9-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121425.xGJQkRC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121425.xGJQkRC9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/tests/fortify_kunit.c:277:1: warning: stack frame size (8632) exceeds limit (8192) in 'fortify_test_alloc_size_kmalloc_const' [-Wframe-larger-than]
     277 | DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
         | ^
   lib/tests/fortify_kunit.c:210:13: note: expanded from macro 'DEFINE_ALLOC_SIZE_TEST_PAIR'
     210 | static void fortify_test_alloc_size_##allocator##_const(struct kunit *test) \
         |             ^
   <scratch space>:63:1: note: expanded from here
      63 | fortify_test_alloc_size_kmalloc_const
         | ^
   1 warning generated.


vim +/fortify_test_alloc_size_kmalloc_const +277 lib/tests/fortify_kunit.c

9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  218  
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  219  #define TEST_kmalloc(checker, expected_size, alloc_size)	do {	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  220  	gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  221  	void *orig;							\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  222  	size_t len;							\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  223  									\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  224  	checker(expected_size, kmalloc(alloc_size, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  225  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  226  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  227  		kmalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  228  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  229  	checker(expected_size, kzalloc(alloc_size, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  230  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  231  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  232  		kzalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  233  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  234  	checker(expected_size, kcalloc(1, alloc_size, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  235  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  236  	checker(expected_size, kcalloc(alloc_size, 1, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  237  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  238  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  239  		kcalloc_node(1, alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  240  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  241  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  242  		kcalloc_node(alloc_size, 1, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  243  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  244  	checker(expected_size, kmalloc_array(1, alloc_size, gfp),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  245  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  246  	checker(expected_size, kmalloc_array(alloc_size, 1, gfp),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  247  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  248  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  249  		kmalloc_array_node(1, alloc_size, gfp, NUMA_NO_NODE),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  250  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  251  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  252  		kmalloc_array_node(alloc_size, 1, gfp, NUMA_NO_NODE),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  253  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  254  									\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  255  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  256  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  257  	checker((expected_size) * 2,					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  258  		krealloc(orig, (alloc_size) * 2, gfp),			\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  259  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  260  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  261  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  262  	checker((expected_size) * 2,					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  263  		krealloc_array(orig, 1, (alloc_size) * 2, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  264  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  265  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  266  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  267  	checker((expected_size) * 2,					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  268  		krealloc_array(orig, (alloc_size) * 2, 1, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  269  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  270  									\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  271  	len = 11;							\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  272  	/* Using memdup() with fixed size, so force unknown length. */	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  273  	if (!__builtin_constant_p(expected_size))			\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  274  		len += zero_size;					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  275  	checker(len, kmemdup("hello there", len, gfp), kfree(p));	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  276  } while (0)
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29 @277  DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  278  

:::::: The code at line 277 was first introduced by commit
:::::: 9124a26401483bf2b13a99cb4317dce3f677060f kunit/fortify: Validate __alloc_size attribute results

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
