Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D392701C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 02:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771556210; cv=none; b=bDJ/8t42MWTJq0XHm4evHW5jUkwomtPFj+KoM/Brx0fdqMOgFcoGkqLkrd4Ik2QE3mPob0tEDN3d5nwni3fcNsRo9Cq3l9XEnC9KOZULNKo24XN/tjxo623JRSKJ57pZ/qEXI69VtweAbyPeLB7WXyMxrH/6xj/76ypF00KRhn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771556210; c=relaxed/simple;
	bh=uwcp675ApRH6r8s78ncZlz6LFGDPmRKi54lgNYPbG3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r7gTKQTDfPpc7L/BPs8bUa46wiSrxrTzLjMwYR0QunHvfLRBkRcf7HD+rScAjBjgF1g+++wWmwE+yYOtHeiQ8bym8kf7hPaA983xDHlWHj9gy6ZAIsQoJJSZsbbWTuqmjO/nIo+uGFI8sGzE8LYu9vIBBwFCQPjKQZT//lW0hVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NM7VD6D/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NM7VD6D/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771556208; x=1803092208;
  h=date:from:to:cc:subject:message-id;
  bh=uwcp675ApRH6r8s78ncZlz6LFGDPmRKi54lgNYPbG3g=;
  b=NM7VD6D/iuSOmor0hba8QqW9gf14mucnQbbqjjHPixg6EVl8T4k1Jhf/
   Of+2h+IiYFdwqBm97CaHNK38UXKV92Jt5IwJ3ZGKW1xthWO4AjXjtcnzx
   QoyNNoWaRcWBMPq8YNdMqsemDxeDCH1AgUAvCSID7E1KLfvbkhtSYh4R+
   M+vXn4Z9L6nnEei+SlMVjXuNqjYPSS4IAblQKle/D8E0EolAab1Uk3pOm
   JkUlHoy7lMEZipNfaVGypv2DNlp74i1pNKYoh+MFsPizrlbYpNYxQRTcH
   TIpJkcB2wD8cRTT85KUuWnz5vmwi0Q5vVte3OlB40DyDZBOzq+6vxot1W
   Q==;
X-CSE-ConnectionGUID: /IDEgTDLR8+tzUxjjlhPGw==
X-CSE-MsgGUID: VFhWXDUFT+unZHtacju4jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="95274085"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="95274085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 18:56:48 -0800
X-CSE-ConnectionGUID: z8uPWIg2TnC3M7gq1YMUHQ==
X-CSE-MsgGUID: GzGxi1cBRD+4lWEhBHGksQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213800301"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2026 18:56:46 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtGhA-0000000047x-25nw;
	Fri, 20 Feb 2026 02:56:44 +0000
Date: Fri, 20 Feb 2026 03:55:49 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 40/42]
 include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct idpf_q_vector) == ((((((136)) + ((__typeof__((136)))(((1 <<
 (6)))) - 1)) & ~((__typeof__((136)))(((1 << (6)))) - 1)) + ((((56 +
 sizeof(struct napi_struct) + 2 * sizeof(struct ...
Message-ID: <202602200325.qKSEmGBN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 24ea46a484fdd8d6ac6a90cfb927c1fa3d07d312 [40/42] hrtimer: Use linked timerqueue
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260220/202602200325.qKSEmGBN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200325.qKSEmGBN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200325.qKSEmGBN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:14,
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == (56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:17:9: note: in expansion of macro 'static_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:62:9: note: in expansion of macro 'libeth_cacheline_group_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:436:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     436 | libeth_cacheline_set_assert(struct idpf_q_vector, 136,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_q_vector) == ((((((136)) + ((__typeof__((136)))(((1 << (6)))) - 1)) & ~((__typeof__((136)))(((1 << (6)))) - 1)) + ((((56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))) + ((__typeof__((56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) & ~((__typeof__((56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) + ((((8)) + ((__typeof__((8)))(((1 << (6)))) - 1)) & ~((__typeof__((8)))(((1 << (6)))) - 1))))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(sizeof(type) == (sz))
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:48:9: note: in expansion of macro '__libeth_cacheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:9: note: in expansion of macro 'libeth_cacheline_struct_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:436:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     436 | libeth_cacheline_set_assert(struct idpf_q_vector, 136,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from idpf.h:14,
                    from idpf_dev.c:4:
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == (56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:17:9: note: in expansion of macro 'static_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:62:9: note: in expansion of macro 'libeth_cacheline_group_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   idpf_txrx.h:436:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     436 | libeth_cacheline_set_assert(struct idpf_q_vector, 136,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_q_vector) == ((((((136)) + ((__typeof__((136)))(((1 << (6)))) - 1)) & ~((__typeof__((136)))(((1 << (6)))) - 1)) + ((((56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))) + ((__typeof__((56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) & ~((__typeof__((56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))))(((1 << (6)))) - 1)) + ((((8)) + ((__typeof__((8)))(((1 << (6)))) - 1)) & ~((__typeof__((8)))(((1 << (6)))) - 1))))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(sizeof(type) == (sz))
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:48:9: note: in expansion of macro '__libeth_cacheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:9: note: in expansion of macro 'libeth_cacheline_struct_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   idpf_txrx.h:436:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     436 | libeth_cacheline_set_assert(struct idpf_q_vector, 136,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


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
