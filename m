Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526BECA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 03:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZB8aV+Xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699240451; x=1730776451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xPC1+rlO6qDL5Sw2iWQnA2FPIEEWntOXjBeWdWSw7RE=;
  b=ZB8aV+XfPLfct6B3WZNebRvw+EEMo3SQX+DSPqFnU1mrBfn3+iAhQ5R9
   IjZyOhTQPy1ReBFnQogFQ0btM9Fadi+ykiaKllIuJMhhWxv2dvygv7b5h
   zdgLPO8uEVGwM1eDQxwvahWLgUvPujElOe58yVexAZ1qsqRUpN3j8M4Yf
   fi4G81ji41flMl5ceCGOnUsres6nopnxtxoEgcP+2EVdsTT+8Wc9Yj8Fb
   6H1cJBPHyKI3k4Cyp1Q7S3k0XHOMwZUaxw2Yxxs1ZuyL65lH+KO92Ftq9
   FwzK1y2L2fF42hOFyfo1jJnxInGKFkUhwYH1npQo+bnWUqpHzAs+aiKk4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393097128"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="393097128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 19:14:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3314519"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2023 19:14:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzq3z-00063i-1h;
	Mon, 06 Nov 2023 03:14:07 +0000
Date: Mon, 6 Nov 2023 11:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 9/19] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct folio, _flags_4) ==
 offsetof(struct page, flags) + 4 * sizeof(struct page)"
Message-ID: <202311061023.jLdPBgDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   b13b5da47e6cc2abf6253b7e6436fdc2b363103f
commit: 901bb76320b7528db5ded8e9d007eab34a4affb6 [9/19] mm/rmap_id: track MMs that map a partially-mappable folio using rmap IDs
config: x86_64-randconfig-013-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061023.jLdPBgDV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061023.jLdPBgDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061023.jLdPBgDV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:21:0,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11,
                    from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct folio, _flags_4) == offsetof(struct page, flags) + 4 * sizeof(struct page)"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:448:2: note: in expansion of macro 'static_assert'
     static_assert(offsetof(struct folio, fl) ==   \
     ^~~~~~~~~~~~~
   include/linux/mm_types.h:450:1: note: in expansion of macro 'FOLIO_MATCH'
    FOLIO_MATCH(flags, _flags_4);
    ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct folio, _head_4) == offsetof(struct page, compound_head) + 4 * sizeof(struct page)"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:448:2: note: in expansion of macro 'static_assert'
     static_assert(offsetof(struct folio, fl) ==   \
     ^~~~~~~~~~~~~
   include/linux/mm_types.h:451:1: note: in expansion of macro 'FOLIO_MATCH'
    FOLIO_MATCH(compound_head, _head_4);
    ^~~~~~~~~~~


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
