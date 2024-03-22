Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2D1D6AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711150726; cv=none; b=nIsmuJoyZxLgjd0NBOE0fHzADneeie4L8nR5UkexXIPTE5/G++CCjXrwTkFYIfvND91Y8YBNsRDtwKQ28LVf5xqNtnMHWP9q88OfesFWCv1PcaxF9Pwhdgi9VMjv408/JGAZ7ZCAe+vZJhdtzly+CMmDsTECKo23ddFYVG8XzDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711150726; c=relaxed/simple;
	bh=obZGDdJOEhjiNGS8ahBwHmT86Vw3DEICS9okC+PhGxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQ+EdQpDPHsnuVpPt7o/8QMa/wCCmpCXFGS/y4An0vHY4uPH9IQgSxQmZDtSQ+0kFOHrY5pQG9SzG+yFesNd2WwpvlAhvlNC4ttBHRLwMNsvaTYdgT+Ii2mRQhHjilyoMk2NzhG3Lky81oFVM+syFkOOjsnsZgWHytx94a9LH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKicay7y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKicay7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711150724; x=1742686724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obZGDdJOEhjiNGS8ahBwHmT86Vw3DEICS9okC+PhGxU=;
  b=KKicay7ywzP0sFHCw7g33+ha0d60htVw01n8UVKvOZKjlfUKDurGOrF9
   BeP2fcf/U9HWvFvi1CCLvkS5YWZy30MIixWdL8lNORZuSKpGDw1yZKZG1
   KdmpUfikK48GS+CAulPOLTCv41OHLIWPAS0P7Jx7rd0kHqT422xYqVsYH
   fvsK18UyRH8OGKXbZCoxHwcUPIkyGZFuopeSygc3HigawCjz8ftLbMN3l
   dfR+8bN9MacJZrd+srn0H19b0nM9lhlREDqWpswaruzVwj4XuTL8RR71d
   nQlJCBGPmDQX0lX62L5eQQ8mJIxMCRnFxQsZ3UuunZ9f68k7qRQjpTIi4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="9169521"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="9169521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 16:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="15739073"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2024 16:38:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnoT9-000KhT-0n;
	Fri, 22 Mar 2024 23:38:39 +0000
Date: Sat, 23 Mar 2024 07:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 31/69] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_rx_queue,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue,
 __cacheline_group_begin__read_write) <= ALIGN(80, __LIBETH_LARGEST_ALIGN)"
Message-ID: <202403230719.kuHT3obM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b336f2db592517d25e745924c92e8604eeea0502
commit: 1f36eeccb1b5f9e58d371a6d75eb77821fb16aa2 [31/69] idpf: strictly assert cachelines of queue and queue vector structures
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240323/202403230719.kuHT3obM-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230719.kuHT3obM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230719.kuHT3obM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/microblaze/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_write) <= ALIGN(80, __LIBETH_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:28:9: note: in expansion of macro 'static_assert'
      28 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:36:9: note: in expansion of macro '__libeth_cacheline_group_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:706:1: note: in expansion of macro '__libeth_cacheline_set_assert'
     706 | __libeth_cacheline_set_assert(struct idpf_rx_queue, 64, 80, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) <= ALIGN(96, __LIBETH_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:28:9: note: in expansion of macro 'static_assert'
      28 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:36:9: note: in expansion of macro '__libeth_cacheline_group_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:823:1: note: in expansion of macro '__libeth_cacheline_set_assert'
     823 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
