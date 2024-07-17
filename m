Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A06469D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721184938; cv=none; b=M9CKAvNmDLWeEdcg0KqRBtWcoFk6+x0MXfaruhpD1/Ro3ZBILutP3pVf4Pf+8PXFaYmeWgYGKkDf5otCDPihjHC1Zg7MT3FdPL3XO0xOHQpI6v+dlVWSktc+syakWFs7qHQz2chihR+sz9AFkxLzVs5Q2y0njDuLQDUvtP1u4/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721184938; c=relaxed/simple;
	bh=EqdWaHXPuW0vaMgmaHXdH5lWp0c3j9OMC5D1D/59Ulo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpg9kQfP68MzXhrlRuhKxxNhmLjsSzaERMDADgG+FtFqse1euE87p7pX5HPaLiH0HATHKoTZBGYoYQoarmGRciukfkIPXRI+5Cs+wfBU9q31l2BeGJ0AO8yMLwkTXw3UnMrKt6XVouwkfkkSznaDyDI0AKg2HyC1WCyOZZYwLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+3toZ0g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+3toZ0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721184937; x=1752720937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EqdWaHXPuW0vaMgmaHXdH5lWp0c3j9OMC5D1D/59Ulo=;
  b=E+3toZ0gGHWMHPt++pgeTTIZCJukHOHlq27NPe65tGfDlQtlekElfrlL
   +8ftCHs2txlolxPgydz46meNhm+7D0GFo1k+t/0Pybz4nLxGs1jYBqr6Y
   DKH2WF0e6cpQj5Cnk/qbQAmGpl7/y5kLwtmYrn/enXsDcqUmOGd01fUh+
   Fkiie54rK7vTvxgqe8d2h2p6CaQN4VosHju5EtGMs1yP3i0yfcE5EgoJW
   G/keCkoSVMZWBI7JX3UOvTrr8A91DuHLqCeg9cBkRxbegCO7IT885BkUe
   pFEV9nyMSlksTp571Wz3oxQW9kg2si57SPIWWmPQ99u8nG70g2QU8fq6p
   A==;
X-CSE-ConnectionGUID: oqigbEt6RLqfDeJM6w2jcg==
X-CSE-MsgGUID: qK01r6z6SU6MKGT0TusgDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18774799"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="18774799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 19:55:35 -0700
X-CSE-ConnectionGUID: zmNayKjoRX2eZNRwkPgnmw==
X-CSE-MsgGUID: eJaGo87SRAGdOnqZnaO8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="50577425"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jul 2024 19:55:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTupH-000fuc-1E;
	Wed, 17 Jul 2024 02:55:31 +0000
Date: Wed, 17 Jul 2024 10:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6] include/linux/build_bug.h:78:41:
 error: static assertion failed: "MCT_HUGETLB_MAX < MCT_NR_ITEMS"
Message-ID: <202407171023.rEJjvyDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   d6bf778b60334cf45ee3171369a6a3b371e2f384
commit: 2063d04d44d1df3bc8c7b60f831a98365d4703ec [4/6] mm: memcg: merge multiple page_counters into a single structure
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240717/202407171023.rEJjvyDC-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407171023.rEJjvyDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407171023.rEJjvyDC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/rhashtable-types.h:12,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "MCT_HUGETLB_MAX < MCT_NR_ITEMS"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/page_counter.h:70:1: note: in expansion of macro 'static_assert'
      70 | static_assert(MCT_HUGETLB_MAX < MCT_NR_ITEMS);
         | ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


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
