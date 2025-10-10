Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA522727F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760119152; cv=none; b=ZDi+8I+BoKuMKW1kactLLwGa7JqMlWkPQNjIMVrRf55SNMfZrlj52QH10ggWPHBpJ+MWIXtVrfjwTyHr/4A5If7cO9mt88zUQpW4rGq8U0P720yKi6YwcthF8z0o8Me4HuyDmPKaKh2wi2xMJIxt2miJEGi7PCqr0+YJbUXh+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760119152; c=relaxed/simple;
	bh=zmz343QDgyVQoeUlyQ2Z7cIzp7nDf4m1DX/rIjSSlUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rW6gDHxmZX4NIu5T0CRxnYRwm9VJtl7xUGCQosfFwu2NcX/yNHRKzqG6hrfjfPilhWwlmVGB71OD1A99O4xGcTn7xiJz7Iu+fZ5bme7wJYYzMvpJEISvSKBWYUjXXBcM31djhw8BA20rSaz/5dKH+/gcoW23a/d/ncVs3ltzi2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtWgpIzJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtWgpIzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760119151; x=1791655151;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zmz343QDgyVQoeUlyQ2Z7cIzp7nDf4m1DX/rIjSSlUI=;
  b=XtWgpIzJ/QZNqPzTVIc3QMj9Xp7BRnKVA8ZEVbsBhC7gSwFMiYw/Ii/N
   /qAGrEHSUTGfPZUWN/YY9t2t3Htfd3DLEWeUwjxViXwfU2CZ7+oXaV6AZ
   zw+7GH5wHsKcnjv07JHmCmg7rmwDZjz50AsHSl/hyblw7qB7C+GDbalhf
   L81Fqjv4x1w1tSW+3TEStxi2vmgRz/JG7DVw1sEmMvgbNBoN5aUQIoMZ2
   R7ldneuUNiWN57GLqkh0+mnogg89rgTs6NmpsXyat0nz3IGLQcUhAQy8E
   ZDmkkAGlY/xpwFl0OxfY5DA4VwIyY15DXQK3nR11qWCmHvnu9K2doLImQ
   w==;
X-CSE-ConnectionGUID: 1633wKqHTYe52vj+VQPMlg==
X-CSE-MsgGUID: FQ6Oy3OZQ7Oimq60CUI5tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62045270"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="62045270"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 10:59:10 -0700
X-CSE-ConnectionGUID: VrDmIOUYTBGnzZa43Q5bpw==
X-CSE-MsgGUID: 2y12Q+FnQKWC1AU8FjDc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="185290925"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Oct 2025 10:59:09 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7HOU-00032V-0b;
	Fri, 10 Oct 2025 17:59:06 +0000
Date: Sat, 11 Oct 2025 01:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 110/125] include/kunit/test.h:856:20: warning:
 initialization of 'long long int' from 'struct pid * const' makes integer
 from pointer without a cast
Message-ID: <202510110139.QxBWTjZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   5a0a5c1e0bffb2e9e03585bc8dc55d9f92cae922
commit: 5ec355855dbc2d67587b6a10fef52c6cd3b1716e [110/125] mm/damon/tests/core-kunit: check target fields one by one
config: sparc-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110139.QxBWTjZO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110139.QxBWTjZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110139.QxBWTjZO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/tests/core-kunit.h:15,
                    from mm/damon/core.c:3165:
   mm/damon/tests/core-kunit.h: In function 'damon_test_commit_ctx_ensure_target_committed':
>> include/kunit/test.h:856:20: warning: initialization of 'long long int' from 'struct pid * const' makes integer from pointer without a cast [-Wint-conversion]
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:869:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1035:2: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     KUNIT_BINARY_INT_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:2: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~
   mm/damon/tests/core-kunit.h:877:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      KUNIT_EXPECT_EQ(test, dst_target->pid, src_target->pid);
      ^~~~~~~~~~~~~~~
   include/kunit/test.h:856:20: note: (near initialization for '__assertion.left_value')
         .left_value = __left,         \
                       ^~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:869:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1035:2: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     KUNIT_BINARY_INT_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:2: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~
   mm/damon/tests/core-kunit.h:877:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      KUNIT_EXPECT_EQ(test, dst_target->pid, src_target->pid);
      ^~~~~~~~~~~~~~~
   include/kunit/test.h:857:21: warning: initialization of 'long long int' from 'struct pid * const' makes integer from pointer without a cast [-Wint-conversion]
         .right_value = __right),        \
                        ^~~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:869:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1035:2: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     KUNIT_BINARY_INT_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:2: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~
   mm/damon/tests/core-kunit.h:877:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      KUNIT_EXPECT_EQ(test, dst_target->pid, src_target->pid);
      ^~~~~~~~~~~~~~~
   include/kunit/test.h:857:21: note: (near initialization for '__assertion.right_value')
         .right_value = __right),        \
                        ^~~~~~~
   include/kunit/test.h:734:42: note: in definition of macro '_KUNIT_FAILED'
     const struct assert_class __assertion = INITIALIZER;         \
                                             ^~~~~~~~~~~
   include/kunit/test.h:855:9: note: in expansion of macro 'KUNIT_INIT_ASSERT'
            KUNIT_INIT_ASSERT(.text = &__text,         \
            ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:869:2: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     KUNIT_BASE_BINARY_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1035:2: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     KUNIT_BINARY_INT_ASSERTION(test,           \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:2: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
     ^~~~~~~~~~~~~~~~~~~
   mm/damon/tests/core-kunit.h:877:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      KUNIT_EXPECT_EQ(test, dst_target->pid, src_target->pid);
      ^~~~~~~~~~~~~~~


vim +856 include/kunit/test.h

73cda7bb8bfb1d Brendan Higgins 2019-09-23  798  
73cda7bb8bfb1d Brendan Higgins 2019-09-23  799  #define KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, fmt, ...)       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  800  	KUNIT_UNARY_ASSERTION(test,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  801  			      assert_type,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  802  			      condition,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  803  			      true,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  804  			      fmt,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  805  			      ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins 2019-09-23  806  
73cda7bb8bfb1d Brendan Higgins 2019-09-23  807  #define KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, fmt, ...)      \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  808  	KUNIT_UNARY_ASSERTION(test,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  809  			      assert_type,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  810  			      condition,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  811  			      false,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  812  			      fmt,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  813  			      ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins 2019-09-23  814  
73cda7bb8bfb1d Brendan Higgins 2019-09-23  815  /*
73cda7bb8bfb1d Brendan Higgins 2019-09-23  816   * A factory macro for defining the assertions and expectations for the basic
73cda7bb8bfb1d Brendan Higgins 2019-09-23  817   * comparisons defined for the built in types.
73cda7bb8bfb1d Brendan Higgins 2019-09-23  818   *
73cda7bb8bfb1d Brendan Higgins 2019-09-23  819   * Unfortunately, there is no common type that all types can be promoted to for
73cda7bb8bfb1d Brendan Higgins 2019-09-23  820   * which all the binary operators behave the same way as for the actual types
73cda7bb8bfb1d Brendan Higgins 2019-09-23  821   * (for example, there is no type that long long and unsigned long long can
73cda7bb8bfb1d Brendan Higgins 2019-09-23  822   * both be cast to where the comparison result is preserved for all values). So
73cda7bb8bfb1d Brendan Higgins 2019-09-23  823   * the best we can do is do the comparison in the original types and then coerce
73cda7bb8bfb1d Brendan Higgins 2019-09-23  824   * everything to long long for printing; this way, the comparison behaves
73cda7bb8bfb1d Brendan Higgins 2019-09-23  825   * correctly and the printed out value usually makes sense without
73cda7bb8bfb1d Brendan Higgins 2019-09-23  826   * interpretation, but can always be interpreted to figure out the actual
73cda7bb8bfb1d Brendan Higgins 2019-09-23  827   * value.
73cda7bb8bfb1d Brendan Higgins 2019-09-23  828   */
73cda7bb8bfb1d Brendan Higgins 2019-09-23  829  #define KUNIT_BASE_BINARY_ASSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  830  				    assert_class,			       \
064ff292aca500 Daniel Latypov  2022-01-25  831  				    format_func,			       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  832  				    assert_type,			       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  833  				    left,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  834  				    op,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  835  				    right,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  836  				    fmt,				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  837  				    ...)				       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  838  do {									       \
c2741453478bad Daniel Latypov  2022-01-27  839  	const typeof(left) __left = (left);				       \
c2741453478bad Daniel Latypov  2022-01-27  840  	const typeof(right) __right = (right);				       \
2b6861e2372bac Daniel Latypov  2022-01-25  841  	static const struct kunit_binary_assert_text __text = {		       \
2b6861e2372bac Daniel Latypov  2022-01-25  842  		.operation = #op,					       \
2b6861e2372bac Daniel Latypov  2022-01-25  843  		.left_text = #left,					       \
2b6861e2372bac Daniel Latypov  2022-01-25  844  		.right_text = #right,					       \
2b6861e2372bac Daniel Latypov  2022-01-25  845  	};								       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  846  									       \
8bd5d74babc925 Mickaël Salaün  2024-04-08  847  	_KUNIT_SAVE_LOC(test);						       \
97d453bc4007d4 Daniel Latypov  2022-09-30  848  	if (likely(__left op __right))					       \
97d453bc4007d4 Daniel Latypov  2022-09-30  849  		break;							       \
97d453bc4007d4 Daniel Latypov  2022-09-30  850  									       \
97d453bc4007d4 Daniel Latypov  2022-09-30  851  	_KUNIT_FAILED(test,						       \
21957f90b28f6b Daniel Latypov  2022-01-13  852  		      assert_type,					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  853  		      assert_class,					       \
a8495ad8e973cb Daniel Latypov  2022-09-30  854  		      format_func,					       \
697365c0867913 Daniel Latypov  2022-09-30  855  		      KUNIT_INIT_ASSERT(.text = &__text,		       \
697365c0867913 Daniel Latypov  2022-09-30 @856  					.left_value = __left,		       \
697365c0867913 Daniel Latypov  2022-09-30  857  					.right_value = __right),	       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  858  		      fmt,						       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  859  		      ##__VA_ARGS__);					       \
73cda7bb8bfb1d Brendan Higgins 2019-09-23  860  } while (0)
73cda7bb8bfb1d Brendan Higgins 2019-09-23  861  

:::::: The code at line 856 was first introduced by commit
:::::: 697365c086791372945037557f99bc164e2db855 kunit: eliminate KUNIT_INIT_*_ASSERT_STRUCT macros

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
