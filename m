Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE036FBE7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 05:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706764448; cv=none; b=QblK6lgRQDHc2a+DyKG2wh5ntpuHenmgDICP1XijqiPpP5KYYeK2/skW6rq1lKP6yYXJgzh1bdpBiPaqWke7bf/hUzzdj8fPPUnPNEePwCwe2EuSXjwcq0N1Guq+5x8Uj6+hDKAuiWRVk9kalomL4Rg2+Ids75/DhGV9JItGdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706764448; c=relaxed/simple;
	bh=HCfjwX5puFC/gkXuVHpQkqUSf0tUlJ6ckQ2QRMkx1r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KLzpUM4aGAfF0EgE7cT5XFnpKZh+cHXHJwU+8EFbJ84jNYoNFwaCKXVPf9G3PFNGbGbmMpuew1czRCgW6FPX7bbzsINDFFAyYEgzkcfDxfZvc3CA+juXieKJRFeBipCilW8Uf8Ysr+4NnghTVzrqCQ6QMAkK0apk3U+xnT+aReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6dJ/iu2; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6dJ/iu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706764445; x=1738300445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HCfjwX5puFC/gkXuVHpQkqUSf0tUlJ6ckQ2QRMkx1r4=;
  b=H6dJ/iu29WgKrM2TxXtDyciWcPw3u6Wt/+GubPs8iHwBJTjcDBaxIFRx
   I3/d5swlRRG9RIArGyISxW49c52ouj5QHkzf3xdDvMoZmZJjk+a9fth4z
   rNUwWzIV4uHYjyq420W2xA4/od+rQukUKCMEC7/Z97VOMzealE18urDEh
   Jyt+a/r7MwzzfMR5HXV52pDoLdtY0Dop9bJv7GFfbG9uYZcXG7nTm7jNQ
   Q12vmwje6ZckCBE7O0t5/HYGatrTLRheLqD+6gPQAUYo8fq2qfumb5owX
   lNVwzxQKCz1e4avn4R+ohEDFwMm8gyJrGbrKBNgFCAU081hZjwFNL3E3b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434975998"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="434975998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 21:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4284631"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 31 Jan 2024 21:14:03 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVPOi-0002OI-13;
	Thu, 01 Feb 2024 05:14:00 +0000
Date: Thu, 1 Feb 2024 13:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/helpers-only 4/5] lib/overflow_kunit.c:283:10:
 error: assignment of read-only variable '_a_orig'
Message-ID: <202402011304.eUJzceQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/helpers-only
head:   5cec0b3a613b7def5bea427f84c9a35aab90a141
commit: b199023a5f46c5aca356dfa779f52384d4d22e07 [4/5] overflow: Introduce add_wrap(), sub_wrap(), and mul_wrap()
config: i386-buildonly-randconfig-002-20240201 (https://download.01.org/0day-ci/archive/20240201/202402011304.eUJzceQJ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011304.eUJzceQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011304.eUJzceQJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |                                         ^~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |                         ^~~~~~~~
   include/linux/overflow.h:104:26: note: in expansion of macro '__filter_integral'
     104 |   __builtin_add_overflow(__filter_integral(a), b,  \
         |                          ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     383 |  (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |                         ^~~~~~~~
   include/linux/overflow.h:104:26: note: in expansion of macro '__filter_integral'
     104 |   __builtin_add_overflow(__filter_integral(a), b,  \
         |                          ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:11,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from include/kunit/device.h:16,
                    from lib/overflow_kunit.c:9:
   lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |                                         ^~
   include/linux/overflow.h:56:39: note: in definition of macro '__filter_integral'
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |                                       ^
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:56:2: error: first argument to '__builtin_choose_expr' not a constant
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:104:26: note: in expansion of macro '__filter_integral'
     104 |   __builtin_add_overflow(__filter_integral(a), b,  \
         |                          ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:102:24: error: first argument to '__builtin_choose_expr' not a constant
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                        ^~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:283:10: error: assignment of read-only variable '_a_orig'
     283 |  _a_orig = a;       \
         |          ^
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   lib/overflow_kunit.c:285:29: error: increment of read-only variable '_a_orig'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |                             ^~
   include/linux/compiler_types.h:376:63: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:29: error: increment of read-only variable '_a_orig'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |                             ^~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:383:27: note: in expansion of macro '__is_ptr_or_array'
     383 |  (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:29: error: increment of read-only variable '_a_orig'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |                             ^~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:377:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     377 | DEFINE_TEST_PTR_FUNC_TYPED(void_int__void, void *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     383 |  (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
--
   lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |                                         ^~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |                         ^~~~~~~~
   include/linux/overflow.h:104:26: note: in expansion of macro '__filter_integral'
     104 |   __builtin_add_overflow(__filter_integral(a), b,  \
         |                          ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     383 |  (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:56:25: note: in expansion of macro '__is_ptr'
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |                         ^~~~~~~~
   include/linux/overflow.h:104:26: note: in expansion of macro '__filter_integral'
     104 |   __builtin_add_overflow(__filter_integral(a), b,  \
         |                          ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:11,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from include/kunit/device.h:16,
                    from lib/overflow_kunit.c:9:
   lib/overflow_kunit.c:274:41: error: increment of read-only variable '_a_orig'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |                                         ^~
   include/linux/overflow.h:56:39: note: in definition of macro '__filter_integral'
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |                                       ^
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:56:2: error: first argument to '__builtin_choose_expr' not a constant
      56 |  __builtin_choose_expr(!__is_ptr(x), (x), 0)
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:104:26: note: in expansion of macro '__filter_integral'
     104 |   __builtin_add_overflow(__filter_integral(a), b,  \
         |                          ^~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:102:24: error: first argument to '__builtin_choose_expr' not a constant
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                        ^~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:274:8: note: in expansion of macro 'check_add_overflow'
     274 |  _of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r); \
         |        ^~~~~~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/overflow_kunit.c:283:10: error: assignment of read-only variable '_a_orig'
     283 |  _a_orig = a;       \
         |          ^
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   lib/overflow_kunit.c:285:29: error: increment of read-only variable '_a_orig'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |                             ^~
   include/linux/compiler_types.h:376:63: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:29: error: increment of read-only variable '_a_orig'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |                             ^~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:383:27: note: in expansion of macro '__is_ptr_or_array'
     383 |  (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:29: error: increment of read-only variable '_a_orig'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |                             ^~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
     358 |  check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);\
         |  ^~~~~~~~~~~~
   lib/overflow_kunit.c:393:1: note: in expansion of macro 'DEFINE_TEST_PTR_FUNC_TYPED'
     393 | DEFINE_TEST_PTR_FUNC_TYPED(sized_int__sized, struct _sized *, "%lx");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:383:5: error: first argument to '__builtin_choose_expr' not a constant
     383 |  (&*__builtin_choose_expr(__is_ptr_or_array(p), p, NULL))
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:376:74: note: in definition of macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler_types.h:386:37: note: in expansion of macro '__decay'
     386 | #define __is_ptr(p)  __same_type(p, __decay(p))
         |                                     ^~~~~~~
   include/linux/overflow.h:102:46: note: in expansion of macro '__is_ptr'
     102 |  __must_check_overflow(__builtin_choose_expr(__is_ptr(a), \
         |                                              ^~~~~~~~
   include/linux/overflow.h:135:7: note: in expansion of macro 'check_add_overflow'
     135 |   if (check_add_overflow(a, b, &__val)) { \
         |       ^~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:285:7: note: in expansion of macro 'add_wrap'
     285 |  _r = op ## _wrap(t, _a_orig++, _b_orig++);   \
         |       ^~
   lib/overflow_kunit.c:358:2: note: in expansion of macro 'check_one_op'
..


vim +/_a_orig +283 lib/overflow_kunit.c

   257	
   258	#define check_one_op(t, fmt, op, sym, a, b, r, of) do {			\
   259		typeof(a + 0) _a_orig = a;					\
   260		typeof(a + 0) _a_bump = a + 1;					\
   261		typeof(b + 0) _b_orig = b;					\
   262		typeof(b + 0) _b_bump = b + 1;					\
   263		bool _of;							\
   264		t _r;								\
   265										\
   266		_of = check_ ## op ## _overflow(a, b, &_r);			\
   267		KUNIT_EXPECT_EQ_MSG(test, _of, of,				\
   268			"expected "fmt" "sym" "fmt" to%s overflow (type %s)\n",	\
   269			a, b, of ? "" : " not", #t);				\
   270		KUNIT_EXPECT_TRUE_MSG(test, _r == r,				\
   271			"expected "fmt" "sym" "fmt" == "fmt", got "fmt" (type %s)\n", \
   272			a, b, r, _r, #t);					\
   273		/* Check for internal macro side-effects. */			\
   274		_of = check_ ## op ## _overflow(_a_orig++, _b_orig++, &_r);	\
   275		KUNIT_EXPECT_TRUE_MSG(test, _a_orig == _a_bump, "Unexpected " #op " macro side-effect!\n"); \
   276		KUNIT_EXPECT_TRUE_MSG(test, _b_orig == _b_bump, "Unexpected " #op " macro side-effect!\n"); \
   277										\
   278		_r = op ## _wrap(t, a, b);					\
   279		KUNIT_EXPECT_TRUE_MSG(test, _r == r,				\
   280			"expected "fmt" "sym" "fmt" == "fmt", got "fmt" (type %s)\n", \
   281			a, b, r, _r, #t);					\
   282		/* Check for internal macro side-effects. */			\
 > 283		_a_orig = a;							\
   284		_b_orig = b;							\
   285		_r = op ## _wrap(t, _a_orig++, _b_orig++);			\
   286		KUNIT_EXPECT_TRUE_MSG(test, _a_orig == _a_bump, "Unexpected " #op " macro side-effect!\n"); \
   287		KUNIT_EXPECT_TRUE_MSG(test, _b_orig == _b_bump, "Unexpected " #op " macro side-effect!\n"); \
   288	} while (0)
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
