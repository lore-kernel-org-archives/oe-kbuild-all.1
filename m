Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473112E093A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774092083; cv=none; b=EEsatRbnn016gFL+hcaTySyP6tvNvrFsIWzMzCv/zEoIG6F4JQjDesmRlJTRb7L2sHRRDKbmO+Kw3Kk0uxuMyem9zyry815uzpmaQk600XJFlPyceOWwKXMFrTZNpxMEvEtCXecVUIXrPBorqDC4UnFHS1tpmg/4X0Aoqfy6tmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774092083; c=relaxed/simple;
	bh=+FOgGq9FVyKYIO/0XSLpqsHvKJQex7/s4kstHwaKGvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=meh5Z+PPBwmgJbAsFwwuA0yCcU9c1KYVm5BJGlysVWcwun0YaNXt5o8sOoCshqx14affTEqJmnh+u+ZjweKZ1j2GdA1w5x8ux6+7O83FOO9nwasOdMxvG17yJw2OnjuxQ4h7gu9DoCHTfTvOMVZ15ykkaTzG+8DXLoGKvpm7ZPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjDrdVBV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjDrdVBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774092081; x=1805628081;
  h=date:from:to:cc:subject:message-id;
  bh=+FOgGq9FVyKYIO/0XSLpqsHvKJQex7/s4kstHwaKGvM=;
  b=OjDrdVBVswzt0ueMbLXa0bcLI4/GMZwV0D17l4kj3flor7knRy0xZp1i
   ySirXgA8I3r/+r3+hGgrNvv8lwWYdZoeIQe7iSD0LcUckzQaWfzG8exr9
   fTCk2b8jW4+5fx94ckxCoX3OY0rEAuAZu9fepYStZKucjiwymfHfrm0ch
   gNykHSMRtuBOd/29bna23kQF9lCEYN5Hy01PvQKT3x+J8b7PuPUqCXz0W
   3B4fRBFRaFUzAtH6nk+VuVn/3cVFcSY2HsS1PufW0DMIFwrVBJYWeyOs/
   fyXIrsSMBx9nNUT1xMeRP9svyBNMrc8qFXHKSeccZOLYSpM0X1yGJyJ8u
   g==;
X-CSE-ConnectionGUID: 1H2MXR8KT5Wdujy7BL65Rw==
X-CSE-MsgGUID: e5Rj2Wv+TAy4NJfnc+oCng==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77770260"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="77770260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 04:21:21 -0700
X-CSE-ConnectionGUID: c3iOi+fhS4uRTJpmC0r8mQ==
X-CSE-MsgGUID: UONrYFenTeGYsfyIXJ39rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="228033578"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Mar 2026 04:21:19 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3uOK-000000000ej-3Tpr;
	Sat, 21 Mar 2026 11:21:16 +0000
Date: Sat, 21 Mar 2026 19:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:libcrypto-pending 38/50]
 include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct sha1_ctx) == sizeof(struct sha1_state)"
Message-ID: <202603211913.2Rvm5Nlj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-pending
head:   68eff526dd94e97b9b25a9c01865062bc99264b0
commit: 06e5e9868540eb7be8630b1466d1571b52f3c82f [38/50] lib/crypto: sha1: Explicitly specify alignment of sha1_ctx::buf
config: i386-randconfig-011-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211913.2Rvm5Nlj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211913.2Rvm5Nlj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211913.2Rvm5Nlj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/algapi.h:13,
                    from include/crypto/internal/hash.h:11,
                    from crypto/sha1.c:10:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct sha1_ctx) == sizeof(struct sha1_state)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   crypto/sha1.c:23:1: note: in expansion of macro 'static_assert'
      23 | static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
         | ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   crypto/sha1.c:26:1: note: in expansion of macro 'static_assert'
      26 | static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
         | ^~~~~~~~~~~~~
--
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/algapi.h:13,
                    from include/crypto/internal/hash.h:11,
                    from sha1.c:10:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct sha1_ctx) == sizeof(struct sha1_state)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   sha1.c:23:1: note: in expansion of macro 'static_assert'
      23 | static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
         | ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   sha1.c:26:1: note: in expansion of macro 'static_assert'
      26 | static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
