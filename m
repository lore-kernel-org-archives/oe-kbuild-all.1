Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5E143C4B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722892430; cv=none; b=qFzYKyjjz+vjsk11YJvL//YjLI7cUsactOJ3sj62LvSYJL5ed9wNGUQgEEUyJDMsfA+NVsDYdV3LjFFU/I5RD8s8zRxzGju59g6WQh9bST0O0GYYsPM9oLsQE4SSCAQo+EsTGB6OH++9MbxTA00NspJl41L16Ml6RKByVL4MIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722892430; c=relaxed/simple;
	bh=vQfs1kq73QQJ5lKDx6gump94wiso0MP4KI86IabIlZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKu8xhjqOVUB1anreBjB3wR4u+IDQov9s5PMuMt1M0t4LhHftw3eSM7YhFFqAU3DLx1IdSDO1u9CtEUNuzDJoT5QtxQAmO0oGkkiHFikieOYhFtBXno3AZxdMvTXOc/yrTBvXaS2DP8NcQ+Y9gwDc2Ob+uKakeqwM/SMEpdaM8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHehLk8R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHehLk8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722892428; x=1754428428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQfs1kq73QQJ5lKDx6gump94wiso0MP4KI86IabIlZs=;
  b=FHehLk8RJLC5PYDrrd6JjiHY58UtqSMhpLvP9SDPtBxF8psp6AG9dabG
   crzRjAxp7JNZmJKCZrw0aoJyw2k1BFAwlm9TuXeuXupjQR98TkCHVVVEf
   4YXsvN8KTZ8/RLeHQIMJq/n4jOyyoY4wTDxU9Xd2ovslT/D71eJ0MF8Qs
   nOWCymF91q3N5ICWtB+Uz0ik+LBBJZPZdUSEKpZfmKzVKB+yS2YxINh5w
   YH7oAjWHtlK7wbZpeZJr5NNrFBdcAWXzLvlQUpCm/XTbr+SZmdht2xjHq
   Sw5ikV4mVH7RdWy2oZ72FBZyUzCAi6lFnnG9fBCvZQhjQYM91CwdUCgGL
   Q==;
X-CSE-ConnectionGUID: VIo6mkOlTcGtidF8et/qgg==
X-CSE-MsgGUID: gSkMWXadTh6uVkJS9mJbtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="43407365"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="43407365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 14:13:46 -0700
X-CSE-ConnectionGUID: ZK5qzWdHSqWcYFbSzn4u7g==
X-CSE-MsgGUID: L6jFa0n1TwGMIdEsvf5/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56381094"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2024 14:13:44 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb51S-0003jY-08;
	Mon, 05 Aug 2024 21:13:42 +0000
Date: Tue, 6 Aug 2024 05:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [akpm-mm:mm-unstable 173/179] include/vdso/limits.h:16:25: warning:
 conversion from 'long long unsigned int' to 'phys_addr_t' {aka 'unsigned
 int'} changes value from '18446744073709551615' to '4294967295'
Message-ID: <202408060544.tPGLwEsC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   2b820b576dfc4aa9b65f18b68f468cb5b38ece84
commit: 79776ac67c17335deeaa3e34fb52ef5250730193 [173/179] arch_numa: switch over to numa_memblks
config: riscv-buildonly-randconfig-r001-20230222 (https://download.01.org/0day-ci/archive/20240806/202408060544.tPGLwEsC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060544.tPGLwEsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060544.tPGLwEsC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/numa_memblks.c:5:
   mm/numa_memblks.c: In function 'numa_register_meminfo':
   include/linux/kern_levels.h:5:25: warning: format '%Lu' expects argument of type 'long long unsigned int', but argument 2 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/numa_memblks.c:408:25: note: in expansion of macro 'pr_warn'
     408 |                         pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
         |                         ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%Lu' expects argument of type 'long long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/numa_memblks.c:408:25: note: in expansion of macro 'pr_warn'
     408 |                         pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
         |                         ^~~~~~~
   In file included from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/memblock.h:12,
                    from mm/numa_memblks.c:6:
   mm/numa_memblks.c: In function 'numa_memblks_init':
>> include/vdso/limits.h:16:25: warning: conversion from 'long long unsigned int' to 'phys_addr_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      16 | #define ULLONG_MAX      (~0ULL)
         |                         ^~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/numa_memblks.c:427:38: note: in expansion of macro 'ULLONG_MAX'
     427 |         WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
         |                                      ^~~~~~~~~~
>> include/vdso/limits.h:16:25: warning: conversion from 'long long unsigned int' to 'phys_addr_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      16 | #define ULLONG_MAX      (~0ULL)
         |                         ^~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/numa_memblks.c:429:38: note: in expansion of macro 'ULLONG_MAX'
     429 |         WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
         |                                      ^~~~~~~~~~
>> include/vdso/limits.h:16:25: warning: conversion from 'long long unsigned int' to 'phys_addr_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      16 | #define ULLONG_MAX      (~0ULL)
         |                         ^~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/numa_memblks.c:432:43: note: in expansion of macro 'ULLONG_MAX'
     432 |         WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
         |                                           ^~~~~~~~~~


vim +16 include/vdso/limits.h

3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   4  
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   5  #define USHRT_MAX	((unsigned short)~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   6  #define SHRT_MAX	((short)(USHRT_MAX >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   7  #define SHRT_MIN	((short)(-SHRT_MAX - 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   8  #define INT_MAX		((int)(~0U >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   9  #define INT_MIN		(-INT_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  10  #define UINT_MAX	(~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  11  #define LONG_MAX	((long)(~0UL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  12  #define LONG_MIN	(-LONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  13  #define ULONG_MAX	(~0UL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  14  #define LLONG_MAX	((long long)(~0ULL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  15  #define LLONG_MIN	(-LLONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20 @16  #define ULLONG_MAX	(~0ULL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  17  #define UINTPTR_MAX	ULONG_MAX
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  18  

:::::: The code at line 16 was first introduced by commit
:::::: 3e0e9f8c6e3ca92154a74edc23a8872da921d2b6 linux/limits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
