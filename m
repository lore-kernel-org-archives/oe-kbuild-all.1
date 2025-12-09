Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857CA279355
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 07:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765265242; cv=none; b=GkmsGyoWpBJBEgr9FLtowES4YwAS+YNhAV3r76stnWZ8jwwoazUrLn460oZyU7Q11pJwCKzPE7uswQKs+3KKqk0Ll76hT9JUcdeEQVixBr8B1BTZehgmvbsQsrh1m6KWviV38O6AaDAW7M8aVPxK29zwrPCT0KW7VsFH2/zgi1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765265242; c=relaxed/simple;
	bh=pHfhA0TxeUk/hkQ++lZrolJO6CLpgbTvYyOXn6Pv4OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YnHgbaIp2XQi5Z5GcIKwUP06QbZQIulk7XNJ449QZquDzIsGxTtEOTK10aerqqX4/iIEzpvW1wuDSaUs0cRnPEYJAwZkG9fUO4W44djv8PWFYroaOmh4NN1rgTY6xeE9FQv33+zMIfvWQHQmpHKTYDTIq7siEz80VkyuNWeaa98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBszt6tq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBszt6tq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765265240; x=1796801240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHfhA0TxeUk/hkQ++lZrolJO6CLpgbTvYyOXn6Pv4OQ=;
  b=aBszt6tqGFoaVnz7uiGgVJlS6uUCj/zjNyr4FhjUEUgxzvYaBxHeN7D7
   IQUnTw1nMQFloQHB37in8X6j/WWSiQdH6MZZRuJqzWYMTd+hDi4KWOF2R
   wkujxXUJ57Nye0T654FALj1gjHsWigy90UxRpXNwbATN4oIthJWNEjIKz
   DrIxle+MTUHK/RuiMRxLmwikFvxyhRw6rVAxht/0RBcoBU1CyJZDzybj6
   8fr53VcBIizk8+6EZENawolTQuANDWcAAPWHGKopzDgDMTqlzpTdRM84X
   vd6/V95Uaw9lEPNhHwrTb2qE/XIcQ11W9cuBAXYShu0XQJPOcnhsGk76s
   g==;
X-CSE-ConnectionGUID: XbbpS9TaSA68te+KF8RpqQ==
X-CSE-MsgGUID: 57jq3b2qSki0PR9BMFg7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78576000"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="78576000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:27:20 -0800
X-CSE-ConnectionGUID: 2LQLjKuRShyN3N5P/GVzKw==
X-CSE-MsgGUID: 8+VvwNXFRlSt7eWhqmqQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196208462"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2025 23:27:18 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSs7v-000000001SX-3kyT;
	Tue, 09 Dec 2025 07:27:15 +0000
Date: Tue, 9 Dec 2025 15:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	"Anirudh Rayabharam (Microsoft)" <anirudh@anirudhrb.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: include/linux/compiler_types.h:597:45: error: call to
 '__compiletime_assert_275' declared with attribute error: BUILD_BUG failed
Message-ID: <202512091539.KxweJWOH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: abceb4297bf88340ce06016895babe292510a262 mshv: Fix huge page handling in memory region traversal
date:   3 days ago
config: x86_64-buildonly-randconfig-002-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091539.KxweJWOH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091539.KxweJWOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091539.KxweJWOH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'mshv_region_process_chunk',
       inlined from 'mshv_region_process_range' at drivers/hv/mshv_regions.c:121:9,
       inlined from 'mshv_region_process_range.constprop' at drivers/hv/mshv_regions.c:100:12:
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_275' declared with attribute error: BUILD_BUG failed
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:578:25: note: in definition of macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^~~~~~~~~
   include/linux/huge_mm.h:117:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
     117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^~~~~~~~~~~~~~~
   drivers/hv/mshv_regions.c:56:41: note: in expansion of macro 'HPAGE_PMD_ORDER'
      56 |         if (page_order && page_order != HPAGE_PMD_ORDER)
         |                                         ^~~~~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'mshv_region_process_chunk',
       inlined from 'mshv_region_process_range' at mshv_regions.c:121:9,
       inlined from 'mshv_region_process_range.constprop' at mshv_regions.c:100:12:
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_275' declared with attribute error: BUILD_BUG failed
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:578:25: note: in definition of macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^~~~~~~~~
   include/linux/huge_mm.h:117:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
     117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^~~~~~~~~~~~~~~
   mshv_regions.c:56:41: note: in expansion of macro 'HPAGE_PMD_ORDER'
      56 |         if (page_order && page_order != HPAGE_PMD_ORDER)
         |                                         ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_275 +597 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  583  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  584  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  585  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  586  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  587  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  588   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  589   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  590   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  591   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  592   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  593   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  594   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  595   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  596  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @597  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  598  

:::::: The code at line 597 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
