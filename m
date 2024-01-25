Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC0413AA4F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219305; cv=none; b=o6P78CQJMwRrDJMzgiD48y4AvjeBh8cWjTAqZP3r67eb0brRcmFhtZPA1Jy5x6wYYCACcNj/gOIPJnlrxebsuIjGmKdxwDML5LMCDc2Wo0qleNH19yrBkg2+TfZ8c4Q4nhd9n5XrBTRWFrw+AuIT1PNKkCphLnzmAW+kiI08ows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219305; c=relaxed/simple;
	bh=23OH8vzFU3KU0HSS9v5NAlImML+7xArNAUEQkTdYqLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVulOVhH73442Bd6SDaY3gg5H/NleWq9NP+Z1O+MqwYbcMteLR50toNgLcFFNijWvsI07ojmdsIuYGykNLLh7dMQQIJyTh53nNntcZ3Rs6K/jC2RD1ZTUf+SEBLApFfERSK/JNSvJODPbUr07fnmdyHnrUaki773G+krCJDE/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkluSNeW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkluSNeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706219303; x=1737755303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23OH8vzFU3KU0HSS9v5NAlImML+7xArNAUEQkTdYqLo=;
  b=RkluSNeWw7HSNHy8Qm+Mnl4DnGoTGLWD89lbaVgy0/qP2dg1ngpdi753
   mMpLAzL65MpOMEiKUplS8FmI7PRqUZo+7GzR5hdtYz0gphzsdXs/Ah2P8
   09fMm6tEXwwRfJj52+GaYcs3NGoye5EyXnopPxAPNaDunw/GNCQeT+sk1
   jOT+FFzLhjbeYa/xyOLzqHolJaFPeE76GKqGZc3Si6LfApva+tStOehaB
   +zW7rFQOh3VMjYVlnrv056t9UzmTnw0cqnBzDi9sti0aPVA6zVDaEb+l8
   VaDtrVqBIUXXdU/vevGDMEM08bCjqR+T9cdocCL2c//tqbbepH9CjmPXA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9066435"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9066435"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 13:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="35237572"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2024 13:48:21 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT7a6-0000Qc-11;
	Thu, 25 Jan 2024 21:48:18 +0000
Date: Fri, 26 Jan 2024 05:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/sanitizers 2/83] lib/overflow_kunit.c:274:41:
 error: increment of read-only variable '_a_orig'
Message-ID: <202401260547.7zklgNDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/sanitizers
head:   29197b5aea6c19dfb664a02f67a5715393dc26c8
commit: 38af35e894496f4012f4644423077ac075054ba5 [2/83] overflow: Expand check_add_overflow() for pointer addition
config: i386-buildonly-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240126/202401260547.7zklgNDt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260547.7zklgNDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260547.7zklgNDt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   lib/overflow_kunit.c: In function 'do_ptr_test_void_int__void':
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:63: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                  ^
   include/linux/overflow.h:106:46: note: in expansion of macro '__is_ptr'
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                                                 ^~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:383:27: note: in expansion of macro '__is_ptr_or_array'
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
                              ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:106:46: note: in expansion of macro '__is_ptr'
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                                                 ^~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:106:46: note: in expansion of macro '__is_ptr'
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                                                 ^~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
        ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:106:46: note: in expansion of macro '__is_ptr'
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                                                 ^~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:11:0,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from include/kunit/device.h:16,
                    from lib/overflow_kunit.c:9:
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:10: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
             ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:10: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
             ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/compiler_types.h:383:27: note: in expansion of macro '__is_ptr_or_array'
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
                              ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:10: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
             ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
        ^
   include/linux/overflow.h:82:10: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
             ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:10: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
             ^
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:60:2: error: first argument to '__builtin_choose_expr' not a constant
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
     ^
   include/linux/overflow.h:82:10: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
             ^
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:20: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
                       ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:20: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
                       ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/compiler_types.h:383:27: note: in expansion of macro '__is_ptr_or_array'
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
                              ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:20: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
                       ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
        ^
   include/linux/overflow.h:82:20: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
                       ^
   include/linux/compiler_types.h:386:22: note: in expansion of macro '__same_type'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                         ^~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:60:24: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
                           ^~~~~~~~
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:82:20: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
                       ^
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:60:2: error: first argument to '__builtin_choose_expr' not a constant
     __builtin_choose_expr(__is_ptr(x), (x), NULL)
     ^
   include/linux/overflow.h:82:20: note: in definition of macro '__check_ptr_add_overflow'
      typeof(a) __a = (a);   \
                       ^
   include/linux/overflow.h:107:28: note: in expansion of macro '__filter_ptr'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
                               ^~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/overflow.h:88:46: error: invalid type argument of unary '*' (have 'int')
      __overflow = __builtin_mul_overflow(sizeof(*(__a)), __b, &__bytes); \
                                                 ^~~~~~
   include/linux/overflow.h:107:3: note: in expansion of macro '__check_ptr_add_overflow'
      __check_ptr_add_overflow(__filter_ptr(a), b, d), \
      ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:0:0:
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:63: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                  ^
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(!__is_ptr(x), (x), 0)
                            ^~~~~~~~
   include/linux/overflow.h:108:26: note: in expansion of macro '__filter_integral'
      __builtin_add_overflow(__filter_integral(a), b,  \
                             ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:383:27: note: in expansion of macro '__is_ptr_or_array'
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
                              ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(!__is_ptr(x), (x), 0)
                            ^~~~~~~~
   include/linux/overflow.h:108:26: note: in expansion of macro '__filter_integral'
      __builtin_add_overflow(__filter_integral(a), b,  \
                             ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(!__is_ptr(x), (x), 0)
                            ^~~~~~~~
   include/linux/overflow.h:108:26: note: in expansion of macro '__filter_integral'
      __builtin_add_overflow(__filter_integral(a), b,  \
                             ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
        ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
     __builtin_choose_expr(!__is_ptr(x), (x), 0)
                            ^~~~~~~~
   include/linux/overflow.h:108:26: note: in expansion of macro '__filter_integral'
      __builtin_add_overflow(__filter_integral(a), b,  \
                             ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:11:0,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from include/kunit/device.h:16,
                    from lib/overflow_kunit.c:9:
>> lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/overflow.h:56:39: note: in definition of macro '__filter_integral'
     __builtin_choose_expr(!__is_ptr(x), (x), 0)
                                          ^
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:56:2: error: first argument to '__builtin_choose_expr' not a constant
     __builtin_choose_expr(!__is_ptr(x), (x), 0)
     ^
   include/linux/overflow.h:108:26: note: in expansion of macro '__filter_integral'
      __builtin_add_overflow(__filter_integral(a), b,  \
                             ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:106:24: error: first argument to '__builtin_choose_expr' not a constant
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                           ^
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:366:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:0:0:
   lib/overflow_kunit.c: In function 'do_ptr_test_sized_int__sized':
   lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:63: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                  ^
   include/linux/overflow.h:106:46: note: in expansion of macro '__is_ptr'
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                                                 ^~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:382:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:383:27: note: in expansion of macro '__is_ptr_or_array'
     (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
                              ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:106:46: note: in expansion of macro '__is_ptr'
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                                                 ^~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~
   lib/overflow_kunit.c:347:2: note: in expansion of macro 'check_one_op'
     check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
     ^~~~~~~~~~~~
   lib/overflow_kunit.c:382:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
    DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
                                            ^
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                             ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
    #define __is_ptr(p)  __same_type(p, __decay(p))
                                        ^~~~~~~
   include/linux/overflow.h:106:46: note: in expansion of macro '__is_ptr'
     __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
                                                 ^~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
           ^~~~~~


vim +/_a_orig +274 lib/overflow_kunit.c

455a35a6cdb6f53 lib/test_overflow.c  Rasmus Villemoes 2018-05-08  257  
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  258  #define check_one_op(t, fmt, op, sym, a, b, r, of) do {			\
38af35e894496f4 lib/overflow_kunit.c Kees Cook        2024-01-17  259  	typeof(a + 0) _a_orig = a;					\
38af35e894496f4 lib/overflow_kunit.c Kees Cook        2024-01-17  260  	typeof(a + 0) _a_bump = a + 1;					\
38af35e894496f4 lib/overflow_kunit.c Kees Cook        2024-01-17  261  	typeof(b + 0) _b_orig = b;					\
38af35e894496f4 lib/overflow_kunit.c Kees Cook        2024-01-17  262  	typeof(b + 0) _b_bump = b + 1;					\
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  263  	bool _of;							\
d219d2a9a92e39a lib/overflow_kunit.c Kees Cook        2022-08-29  264  	t _r;								\
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  265  									\
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  266  	_of = check_ ## op ## _overflow(a, b, &_r);			\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook        2022-02-16  267  	KUNIT_EXPECT_EQ_MSG(test, _of, of,				\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook        2022-02-16  268  		"expected "fmt" "sym" "fmt" to%s overflow (type %s)\n",	\
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  269  		a, b, of ? "" : " not", #t);				\
38af35e894496f4 lib/overflow_kunit.c Kees Cook        2024-01-17  270  	KUNIT_EXPECT_TRUE_MSG(test, _r == r,				\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook        2022-02-16  271  		"expected "fmt" "sym" "fmt" == "fmt", got "fmt" (type %s)\n", \
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  272  		a, b, r, _r, #t);					\
d219d2a9a92e39a lib/overflow_kunit.c Kees Cook        2022-08-29  273  	/* Check for internal macro side-effects. */			\
d219d2a9a92e39a lib/overflow_kunit.c Kees Cook        2022-08-29 @274  	_of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r);	\
38af35e894496f4 lib/overflow_kunit.c Kees Cook        2024-01-17  275  	KUNIT_EXPECT_TRUE_MSG(test, _a_orig == _a_bump, "Unexpected " #op " macro side-effect!\n"); \
38af35e894496f4 lib/overflow_kunit.c Kees Cook        2024-01-17  276  	KUNIT_EXPECT_TRUE_MSG(test, _b_orig == _b_bump, "Unexpected " #op " macro side-effect!\n"); \
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  277  } while (0)
6d3344324b5ae49 lib/test_overflow.c  Rasmus Villemoes 2018-06-04  278  

:::::: The code at line 274 was first introduced by commit
:::::: d219d2a9a92e39aa92799efe8f2aa21259b6dd82 overflow: Allow mixed type arguments

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
