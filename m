Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9832D739B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769200166; cv=none; b=LisPXjYYQaXD8JUvLckkU9gVm0Lc8gEsO00xHAf0/oX4coffnCA0hAgY44CJIqfDuk+fv879npHe9TtEEgRY3LJ4U7GX8piCVmfJZcZjr3wMhcr2Yack9cFxvWWBR4rNuyPPxkGfIaOnig9y/Yud48c4Rxp26IXkUr1PuNRaghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769200166; c=relaxed/simple;
	bh=vOc/Zoka9Ymz7tzO3k14Ksu5+9P410R1+UPLRvofQVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ng5TtQE7pM+zTlI73hznX1Zmj93x3eA4oe8E0SYqBYTKF8oFdVKlLVjLJ+d/ejd+L32cyHgq6bQ8HzFZtcbIn6CH6R4LsE3olawQPLcLaD2pWbvjCxsrZteuEwAt5HgPjBHQk9ikYxbPjILUe9/CU9j0ZGV73k7/rZXHgnYMMNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWzC4Ymj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWzC4Ymj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769200165; x=1800736165;
  h=date:from:to:cc:subject:message-id;
  bh=vOc/Zoka9Ymz7tzO3k14Ksu5+9P410R1+UPLRvofQVM=;
  b=YWzC4Ymja4jlPzgmjbGkZhU8CI3P9ZMEkQplLJoXw5CsETJ748/6suay
   154PMGqJ7OP5NkzmuSlsFP2evwtJqNIXTGRTP+pB8voN9ugJ4ZL045abg
   lOd2hj4/lvNoG3akaJvoSFgloPbKs5hXsHDqA5pAmRXcE1E0qSnAz1611
   WSp9YrM16LjoYWTMeRRE8E3XTMumXnJ+umHPFwAQDxba6oMiMRQsgKGyj
   MOTIqEJKMcVUvqYpbIqWm6BY2IzPZTCu5n4TGC2G9ZQYscCsgbdN82jNe
   SWGNBmHGt5WLIuQLSmwNMWP2f2KIr9hIvhR4k94khNVpT8cjerEI33Q+N
   w==;
X-CSE-ConnectionGUID: Upu0qh64Qlu76l2b5+xZiA==
X-CSE-MsgGUID: P0MR6f8FSYGIbU8F+jZR5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="73046313"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="73046313"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 12:29:25 -0800
X-CSE-ConnectionGUID: +D2YCxtHRCe2RlGYvzE8jg==
X-CSE-MsgGUID: h/HOYLbEQFKwnWrbGB7juQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237768859"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 12:29:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjNmR-00000000UQy-2WpR;
	Fri, 23 Jan 2026 20:29:19 +0000
Date: Sat, 24 Jan 2026 04:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Raghavendra K T <raghavendra.kt@amd.com>
Subject: [linux-next:master 7919/9290]
 include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_639' declared with attribute error: clamp() low limit
 pg.start greater than high limit pg.end
Message-ID: <202601240453.QCjgGdJa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
commit: 93552c9a3350fff06543da18e4c80d3e804191ca [7919/9290] mm: folio_zero_user: cache neighbouring pages
config: riscv-randconfig-002-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240453.QCjgGdJa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240453.QCjgGdJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240453.QCjgGdJa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:18,
                    from arch/riscv/include/asm/sections.h:9,
                    from include/linux/interrupt.h:22,
                    from include/linux/kernel_stat.h:8,
                    from mm/memory.c:42:
   mm/memory.c: In function 'folio_zero_user':
>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_639' declared with attribute error: clamp() low limit pg.start greater than high limit pg.end
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/range.h:46:11: note: in definition of macro 'DEFINE_RANGE'
      .end = (_end),   \
              ^~~~
   include/linux/compiler_types.h:619:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
     __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
     ^~~~~~~~~~~~
   include/linux/minmax.h:218:36: note: in expansion of macro '__careful_clamp'
    #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
                                       ^~~~~~~~~~~~~~~
   mm/memory.c:7296:8: note: in expansion of macro 'clamp_t'
           clamp_t(s64, fault_idx + radius, pg.start, pg.end));
           ^~~~~~~


vim +/__compiletime_assert_639 +631 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  630  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @631  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  632  

:::::: The code at line 631 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
