Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0540F15C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 04:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705725751; cv=none; b=IoNNjNQ/2F7eLNlWSIW9i5BwtRvVBX+yS3qvfNAzmzLPPCDzZVKZvwnWPe9f5CqrMKX8e3qRWdm3115TgL5tvr7qsuNB6fdZ+00oJ38tPOQKpe0hHNbLQd4pGjdes7ZCQfb/qRihIULQbTjCseWuMzP7t+HZmvJ2h/9qQDKvtzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705725751; c=relaxed/simple;
	bh=ELQntkvpbcSBIa3K6nO0QQ8CMqAOZM2dZfVI36JH59E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dWBgCtPruZQeB6liBnB5TCIYH8NnH2hZKxxddYIMCZNeX3VuzGc9rMH6V+pv6r2XFq1skMLAVWHidJwGMYqZRq0fyqNaTCvVpgNEgDZnHq9Klg9b7hkHGpt0adSSoadrjj8w0sBqGrxqOd5RZ9Z3d/3urbVdshqL+HrhsHDqNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQGuNh8w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQGuNh8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705725749; x=1737261749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ELQntkvpbcSBIa3K6nO0QQ8CMqAOZM2dZfVI36JH59E=;
  b=PQGuNh8wXSWlMApNDNS0zxNOonzGnmyFWCr7QOw794XRAzUmhk/U6ttv
   Oc2wwTxaRIIAzX9O4bTkODN6kdyzTdXpvM5jGyZwswPZXF5oTCRPXvC89
   sDesIsYB3PUPZb+goEIE6TsB/E7p/onW4LTI+afgoWmIOg5/Ha3WaQD0+
   wcxiZx6SKqHCXW8HygEbC9ZVkMfnwhfM9EvEJW8Bn2zYcYMAbX+WXdSJR
   3+HU1Q2/W1FkzKMjaM4HHG5CqrHzn2GfSwHAY3GF047pnZH/CdhvF2F+2
   SmYjAEtQFIHm8l4wCgcfBq80oQbDTCtVImLEfdgicgwVaE58x5CqcTsmW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="820547"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="820547"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="908493553"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="908493553"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2024 20:42:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR3BY-0004l2-2D;
	Sat, 20 Jan 2024 04:42:24 +0000
Date: Sat, 20 Jan 2024 12:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/sanitizers 1/84] lib/overflow_kunit.c:366:1:
 warning: variable '_r' is used uninitialized whenever '&&' condition is
 false
Message-ID: <202401201245.jLXGWfLM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/sanitizers
head:   87079890a6277ce39553c391b994c4f5c10e70e0
commit: 69781cb9dde8f92cf632fb6b423bc91aa2afa59b [1/84] overflow: Expand check_add_overflow() for pointer addition
config: x86_64-randconfig-101-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201245.jLXGWfLM-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201245.jLXGWfLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201245.jLXGWfLM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/overflow_kunit.c:366:1: warning: variable '_r' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     366 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:347:2: note: expanded from macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     347 |         check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:266:8: note: expanded from macro 'check_one_op'
     266 |         _of = check_ ## op ## _overflow(a, b, &_r);                     \
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:191:1: note: expanded from here
     191 | check_add_overflow
         | ^
   include/linux/overflow.h:104:3: note: expanded from macro 'check_add_overflow'
     104 |                 __check_ptr_add_overflow(__filter_ptr(a), b, d),        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:86:5: note: expanded from macro '__check_ptr_add_overflow'
      86 |                 !(!__builtin_mul_overflow(sizeof(*(__a)), __b, &__bytes) && \
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: uninitialized use occurs here
     366 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:347:2: note: expanded from macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     347 |         check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:270:30: note: expanded from macro 'check_one_op'
     270 |         KUNIT_EXPECT_TRUE_MSG(test, _r == r,                            \
         |                                     ^~
   include/kunit/test.h:847:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     847 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:656:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     656 |                               condition,                                       \
         |                               ^~~~~~~~~
   include/kunit/test.h:640:16: note: expanded from macro 'KUNIT_UNARY_ASSERTION'
     640 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |                       ^~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   lib/overflow_kunit.c:366:1: note: remove the '&&' if its condition is always true
   lib/overflow_kunit.c:347:2: note: expanded from macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     347 |         check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |         ^
   lib/overflow_kunit.c:266:8: note: expanded from macro 'check_one_op'
     266 |         _of = check_ ## op ## _overflow(a, b, &_r);                     \
         |               ^
   <scratch space>:191:1: note: expanded from here
     191 | check_add_overflow
         | ^
   include/linux/overflow.h:104:3: note: expanded from macro 'check_add_overflow'
     104 |                 __check_ptr_add_overflow(__filter_ptr(a), b, d),        \
         |                 ^
   include/linux/overflow.h:86:5: note: expanded from macro '__check_ptr_add_overflow'
      86 |                 !(!__builtin_mul_overflow(sizeof(*(__a)), __b, &__bytes) && \
         |                   ^
   lib/overflow_kunit.c:366:44: note: variable '_r' is declared here
     366 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         |                                            ^
   lib/overflow_kunit.c:382:1: warning: variable '_r' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     382 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:347:2: note: expanded from macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     347 |         check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:266:8: note: expanded from macro 'check_one_op'
     266 |         _of = check_ ## op ## _overflow(a, b, &_r);                     \
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:231:1: note: expanded from here
     231 | check_add_overflow
         | ^
   include/linux/overflow.h:104:3: note: expanded from macro 'check_add_overflow'
     104 |                 __check_ptr_add_overflow(__filter_ptr(a), b, d),        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:86:5: note: expanded from macro '__check_ptr_add_overflow'
      86 |                 !(!__builtin_mul_overflow(sizeof(*(__a)), __b, &__bytes) && \
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:382:1: note: uninitialized use occurs here
     382 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:347:2: note: expanded from macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     347 |         check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:270:30: note: expanded from macro 'check_one_op'
     270 |         KUNIT_EXPECT_TRUE_MSG(test, _r == r,                            \
         |                                     ^~
   include/kunit/test.h:847:6: note: expanded from macro 'KUNIT_EXPECT_TRUE_MSG'
     847 |                                  condition,                                    \
         |                                  ^~~~~~~~~
   include/kunit/test.h:656:10: note: expanded from macro 'KUNIT_TRUE_MSG_ASSERTION'
     656 |                               condition,                                       \
         |                               ^~~~~~~~~
   include/kunit/test.h:640:16: note: expanded from macro 'KUNIT_UNARY_ASSERTION'
     640 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |                       ^~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   lib/overflow_kunit.c:382:1: note: remove the '&&' if its condition is always true
   lib/overflow_kunit.c:347:2: note: expanded from macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     347 |         check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |         ^


vim +366 lib/overflow_kunit.c

   358	
   359	DEFINE_TEST_ARRAY_NAMED_TYPED(void, int, void, void *, int, void *) = {
   360		{NULL, 0, NULL, NULL, NULL, false, false, false},
   361		{(void *)0x30, 0x10, (void *)0x40, NULL, NULL, false, false, false},
   362		{(void *)ULONG_MAX, 0, (void *)ULONG_MAX, NULL, NULL, false, false, false},
   363		{(void *)ULONG_MAX, 1, NULL, NULL, NULL, true, false, false},
   364		{(void *)ULONG_MAX, INT_MAX, (void *)(INT_MAX - 1), NULL, NULL, true, false, false},
   365	};
 > 366	DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
