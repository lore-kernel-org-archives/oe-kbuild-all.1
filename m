Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D474513D28F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712742817; cv=none; b=BDGfKRBQfM+V/BnO1bzAGsMUxcEwkmkzwX2jej2Hn3Q10SdRQMLXYNMtm3JeDtx3fRlLxijhqZpw7IIBZ/O1GWP1jDjqSRryXTrh1WoQQuGiAbXlZ1bh3vu7NfWyA16iJ/BF4z6pW7gKYkcVC4K4kdya0cVSbJuNwWFNHqH6nMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712742817; c=relaxed/simple;
	bh=ThxxCYM/dKC+f1lDT+ErfqEni338JkIfC99ADVI+y1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjKdT74WF5V9CRbG2NtJgiVc0iLgCyGdZljsj18KZ8rQt/lE9ZpH/0oYQxC4V/tVGUQjLBIJLr8TmREk0yul4YcAE+ivzuXSjq+ZOvxeqPD2HbuDXr/xT177TLbZjVK5cIYl5rvy/9TZvQk3JA/v7mHilj9/0BQ3XUM5nV8H7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHtAL+DP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHtAL+DP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712742814; x=1744278814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ThxxCYM/dKC+f1lDT+ErfqEni338JkIfC99ADVI+y1s=;
  b=oHtAL+DPcTPlI5L4O6QUhJea9eOiWRBDyyhJnKwp1BjV7hxkQmDl7WG7
   cG4X8FyKysYS/I0zQPQ4vxK2n8U/0HnKFLIInsxGt7jbm740IgIhCv1Mc
   cDPgd1YTlhsSsKv13GaNhTvSvSKEwkSeVt4JB6+AXHLZx9fKKezBty67B
   klxAFkEWLe1sbyHyDdNrTfmmvZVPgMFf3G0/K5/7OBYPghRHfSXF7DMOE
   3rN/ZMFKwEF2zSDzVH/f/jH8CDvUK+lzNvC/p5ZVHzqbSYFP9JtALDop1
   +PO1sg21/K7ceozGOogvcoyrJYfaVphhitaPB8PDUZ+i8b6KYBuVCQDMI
   g==;
X-CSE-ConnectionGUID: q+Uk4qsDRLWCHKEIkNdBOg==
X-CSE-MsgGUID: H37Fas2YT5Or2gkaCE1vJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11061697"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11061697"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 02:53:34 -0700
X-CSE-ConnectionGUID: eQXulBEYQsWU4ARGgohU+g==
X-CSE-MsgGUID: LZRP6T7NT1yNHM1SiyHf4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20985388"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2024 02:53:33 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruUe2-0007BY-1q;
	Wed, 10 Apr 2024 09:53:30 +0000
Date: Wed, 10 Apr 2024 17:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/5] include/linux/build_bug.h:78:41:
 error: static assertion failed: "2 * HUGE_MAX_HSTATE >= __MCT_MAX"
Message-ID: <202404101731.SxbqEUf6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   3495060dfd68a14db35e29e08714cb4d8fd4035f
commit: d34a387d279e79b7210825fcebe279b2790d36d2 [4/5] mm: memcg: merge multiple page_counters into a single structure
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101731.SxbqEUf6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101731.SxbqEUf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101731.SxbqEUf6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from mm/hugetlb_cgroup.c:20:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "2 * HUGE_MAX_HSTATE >= __MCT_MAX"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   mm/hugetlb_cgroup.c:39:1: note: in expansion of macro 'static_assert'
      39 | static_assert(2 * HUGE_MAX_HSTATE >= __MCT_MAX);
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
