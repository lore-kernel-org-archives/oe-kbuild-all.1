Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB837BE64
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715184; cv=none; b=EtC7G6hr/swp0pzAoBJUeHVO8owIeaHOCbIEeaDnJNK6gFoiEWLISkoArkqD5Y1h8kLY0aGrq7rHBbTYX5QJm/Xwi8/oH+HxRQ/7BKfBX1ToiO6mGfWwTEwwS8vKP4yzw6wFjTOT5SglijHldeJDxehvAiDRRiAsOy3R5xXqMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715184; c=relaxed/simple;
	bh=ogN7oIcqXg8xoxQjY5MiNYMGd6/+va6kCNOcPijMbwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YF2iQQLe1PBBppXPqnGB41arFeFdJFbpA6tgTMHicJWqJ0Mae40HEjxukKzP6V8AzzoMxxg8mOybFiMN+LmegMgyu3sruuSaJ2HYi3SsikkSVS4uUseLrs2fk99O6vJDM4zg9AG5GIpjbKJ32Y7pqIzjoMSXFP/2FvtfeUfK9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecoeCpSH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecoeCpSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776715181; x=1808251181;
  h=date:from:to:cc:subject:message-id;
  bh=ogN7oIcqXg8xoxQjY5MiNYMGd6/+va6kCNOcPijMbwU=;
  b=ecoeCpSHuaE2V0/s3/kuBaJK4Wgt9CXwPxr9sDjYE/h8EpKU19siRqrU
   /GL1Q78nLCf7xByeIYXCt3b9mcZvCIdav7X4xxSFz25csJlKtykAb/xUr
   YOVrVOFkzXWsuNJ4icn0R4ztzX8NipZ4XeqjhduhqctqsrFKTfNwbsaIC
   kwTWrWlDTbduAEBR6e3QlRUgWcrxY9BcPBrd4vdv3okH5CJMQM91M5rJX
   BVDwz/N4yr5KqRC04g7nY4Sn5NcogdDr4vns4vpd86BwlqMvZ+1JAtaLz
   sUZkd25sKXE+lCYRjvausyVOdpDWw3PLK2ySQqj+9Xi8FG5Q0xKsKZj9a
   A==;
X-CSE-ConnectionGUID: gMXZSLxBTA2jWk0AnBNoag==
X-CSE-MsgGUID: AGvhQ3gpQdiPZY8p2MtMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77552741"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="77552741"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 12:59:41 -0700
X-CSE-ConnectionGUID: nWqT4yRoSxSXvtfu90nzUA==
X-CSE-MsgGUID: i7N0FJBPRQCe2zB49IEJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="236804850"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Apr 2026 12:59:40 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEumP-000000002oe-0jsC;
	Mon, 20 Apr 2026 19:59:37 +0000
Date: Tue, 21 Apr 2026 03:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 include/linux/build_bug.h:78:41: error: static assertion failed:
 "VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES == __VDSO_PAGES"
Message-ID: <202604210323.5wB6iQJZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   4840288585a981ed8a4ecf74ab3b52df96ab860e
commit: 4840288585a981ed8a4ecf74ab3b52df96ab860e [2/2] ANDROID: 16K: Align vDSO mappings to 16K on x86
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260421/202604210323.5wB6iQJZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604210323.5wB6iQJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210323.5wB6iQJZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/x86/entry/vdso/vma.c:7:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES == __VDSO_PAGES"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   arch/x86/entry/vdso/vma.c:30:1: note: in expansion of macro 'static_assert'
      30 | static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES == __VDSO_PAGES);
         | ^~~~~~~~~~~~~
--
>> ld:arch/x86/entry/vdso/vdso32/vdso32.lds:640: undefined symbol `__MAX_PAGE_SIZE' referenced in expression


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
