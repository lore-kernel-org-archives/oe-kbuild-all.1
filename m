Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E86A95E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 16:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137373; cv=none; b=Dv78lfJik7sZ1EUGrRMcuL4VFp4MZ0xEN0zWnRAB4xtSfsVzolQEo++sEW9RrgUNUHQql3ezmvFYJ9b/g7uUSoEFYNHtAqkdH/BMmeojXWWSf1Anh0A6QVOsShG6+/VaXesAU21KI37iLjX13pVeEfzTiUIXKzWdAhV+1aovEsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137373; c=relaxed/simple;
	bh=hgXUTTiGkLC8bpfQnKBIEY8p174+LmL1Ne7EhjhULD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p3WTMP5j0Boxb/sV87PwlaKMcdpoDDFgPZ23ZBQ/wnKWCXaokRYAwtLfEzFHvVBv6qOymD5oC4pTZbraA4K2iwrTiy/h77fsPIFdkvXqFXXVArSshZ/Lml9LoWB/4L2bATOhbzB3v3c1T1LBKX18deAjqKGdLspD+AD70bVEMBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjWoQDDV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjWoQDDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770137370; x=1801673370;
  h=date:from:to:cc:subject:message-id;
  bh=hgXUTTiGkLC8bpfQnKBIEY8p174+LmL1Ne7EhjhULD8=;
  b=fjWoQDDVNj17zZUyiax+UZpFvJqbWVOSvH4LQfGzRegBROsoYyuEQ6eY
   EYavTtwLb4xn/Gs/JSDXyDpsLKha+jqwC6cHI4ezVrQmqczxoXnOTacXt
   EuBvK3CLsviBF7ikHo+H9S16+VF2HjisMQmlaU9XMt4i5HVJGTVmy+3Au
   ep0fVkbMjFTdLkVTLDR+q1mMALGAOqUfZ2fIbxNF8AG01J5CZwrTrJ9jK
   MEFpTFAo7+Vx7yTmair4AjYs7UFCUqGDxR1Cu1kwDpEpxBpUXfcgkbstZ
   +rUespPIlJWMgBBDlCS9gJpVkqi35Pihc5RMO6a/G6/0xvilzxU8z/x8k
   g==;
X-CSE-ConnectionGUID: dPwqT/75R1KXkLnOL6LeLA==
X-CSE-MsgGUID: gUs9YSOlRmyD9XYdDzbQow==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88736523"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="88736523"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:49:30 -0800
X-CSE-ConnectionGUID: jqF9N+zqRE2ofuC+sRkbsg==
X-CSE-MsgGUID: 011boViAQy6VBmkvD9wZhw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2026 08:49:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnJaf-00000000gs4-1Sob;
	Tue, 03 Feb 2026 16:49:25 +0000
Date: Wed, 04 Feb 2026 00:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 1/4]
 include/linux/rcupdate.h:510:9: error: dereferencing pointer to incomplete
 type 'struct revocable_provider'
Message-ID: <202602040048.R81E8WaK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   988357628c2c84e891f5992c4f5cfb31fb3bd27b
commit: 4d7dc4d1a62dbb22b1178dddeeb7a22d0272df77 [1/4] revocable: Fix races in revocable_alloc() using RCU
config: sparc-randconfig-001-20260203 (https://download.01.org/0day-ci/archive/20260204/202602040048.R81E8WaK-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040048.R81E8WaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040048.R81E8WaK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/base/revocable_test.c:19:
   drivers/base/revocable_test.c: In function 'revocable_test_basic':
>> include/linux/rcupdate.h:510:9: error: dereferencing pointer to incomplete type 'struct revocable_provider'
     typeof(*p) *local = (typeof(*p) *__force)(p);   \
   include/kunit/test.h:839:15: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     const typeof(left) __left = (left);           \
                  ^~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:40:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:521:26: note: in expansion of macro '__unrcu_pointer'
    #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
                             ^~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:40:28: note: in expansion of macro 'unrcu_pointer'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
                               ^~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from drivers/base/revocable_test.c:19:
>> include/kunit/test.h:1058:14: warning: comparison between pointer and integer
           left, ==, right,          \
                 ^~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:40:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/base/revocable_test.c:19:
>> include/kunit/test.h:856:20: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:40:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:856:20: note: (near initialization for '__assertion.left_value')
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:40:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from drivers/base/revocable_test.c:19:
   drivers/base/revocable_test.c: In function 'revocable_test_revocation':
>> include/kunit/test.h:1058:14: warning: comparison between pointer and integer
           left, ==, right,          \
                 ^~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:60:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/base/revocable_test.c:19:
>> include/kunit/test.h:856:20: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:60:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:856:20: note: (near initialization for '__assertion.left_value')
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:60:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from drivers/base/revocable_test.c:19:
   drivers/base/revocable_test.c: In function 'revocable_test_try_access_macro':
>> include/kunit/test.h:1058:14: warning: comparison between pointer and integer
           left, ==, right,          \
                 ^~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:87:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/base/revocable_test.c:19:
>> include/kunit/test.h:856:20: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:87:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:856:20: note: (near initialization for '__assertion.left_value')
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:87:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from drivers/base/revocable_test.c:19:
   drivers/base/revocable_test.c: In function 'revocable_test_try_access_macro2':
>> include/kunit/test.h:1058:14: warning: comparison between pointer and integer
           left, ==, right,          \
                 ^~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:118:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/base/revocable_test.c:19:
>> include/kunit/test.h:856:20: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:118:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:856:20: note: (near initialization for '__assertion.left_value')
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
     KUNIT_BINARY_PTR_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
     KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/revocable_test.c:118:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
     KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
     ^~~~~~~~~~~~~~~~~~~


vim +510 include/linux/rcupdate.h

53ecfba259f54b Paul E. McKenney 2010-09-13  507  
24ba53017e188e Chun-Hung Tseng  2021-09-15  508  #define __unrcu_pointer(p, local)					\
24ba53017e188e Chun-Hung Tseng  2021-09-15  509  ({									\
24ba53017e188e Chun-Hung Tseng  2021-09-15 @510  	typeof(*p) *local = (typeof(*p) *__force)(p);			\
24ba53017e188e Chun-Hung Tseng  2021-09-15  511  	rcu_check_sparse(p, __rcu);					\
24ba53017e188e Chun-Hung Tseng  2021-09-15  512  	((typeof(*p) __force __kernel *)(local)); 			\
24ba53017e188e Chun-Hung Tseng  2021-09-15  513  })
76c8eaafe4f061 Paul E. McKenney 2021-04-21  514  /**
76c8eaafe4f061 Paul E. McKenney 2021-04-21  515   * unrcu_pointer - mark a pointer as not being RCU protected
76c8eaafe4f061 Paul E. McKenney 2021-04-21  516   * @p: pointer needing to lose its __rcu property
76c8eaafe4f061 Paul E. McKenney 2021-04-21  517   *
76c8eaafe4f061 Paul E. McKenney 2021-04-21  518   * Converts @p from an __rcu pointer to a __kernel pointer.
76c8eaafe4f061 Paul E. McKenney 2021-04-21  519   * This allows an __rcu pointer to be used with xchg() and friends.
76c8eaafe4f061 Paul E. McKenney 2021-04-21  520   */
24ba53017e188e Chun-Hung Tseng  2021-09-15  521  #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
76c8eaafe4f061 Paul E. McKenney 2021-04-21  522  

:::::: The code at line 510 was first introduced by commit
:::::: 24ba53017e188e031f9cb8b290286fad52d2af00 rcu: Replace ________p1 and _________p1 with __UNIQUE_ID(rcu)

:::::: TO: Chun-Hung Tseng <henrybear327@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
