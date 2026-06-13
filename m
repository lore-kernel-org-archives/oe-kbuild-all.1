Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94636344DA2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 05:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328158; cv=none; b=I6NoQlQsQBOoENolt+vflxee0njPDjkLReHy5kLTrnFBQHxtWSgUzvjRPEkh4g08tpW4kmLnaMJ5gYCKubFUwkr6mjiZdcGhh5oQ5rwRkbCa9HA8+24twzfum2evOZfAzMFO6vwCtX88QMpJRWV/dfvkFnH0Nrn5pgeGeqXV9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328158; c=relaxed/simple;
	bh=jWFSqC4wOVskrnhj84b3c7+0OiriRJ4pHFgw1xEqOxk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q36FKb2ktz5tiDCUba3PcqP2fVw2n3VrF/l+18odAwPaWkLSufTqo3KrLp/QmYwQK03X71w+xzUSG3ioslS95+uPhCYBI7t8UR+0IaJ6nDywGSKRE0fA/YjvNP4cXQZVAD+MN5Lx2fE+GS2f1H57YaENQ4KDQWP1OSnO9/tHE6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY99SSuS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY99SSuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781328154; x=1812864154;
  h=date:from:to:cc:subject:message-id;
  bh=jWFSqC4wOVskrnhj84b3c7+0OiriRJ4pHFgw1xEqOxk=;
  b=kY99SSuShtn46QvMj5PHLpYzsSYw07iTfwce49NXyAXauHaSTXWL+EwR
   n2hmIR9rg7uQThkKUF4sjoUk7KmJFMrmEYNJQF+8Z1NHsRhCU9wf7kRgk
   t0f0VtSnPRXAw7OCTzhXeHfAeXcSspqPeGNXyVz//pKofNbNAjT0YAu47
   /mG8cvvrjdTx7LUOfTpzHzzbQJ3szFM/wetljUXIKvsreFodT1OK6qFS0
   PlkTRkgeG91bXI6cHKyIIATYUnzJlSHkerUV/rPHUizTPYFLzEHmAQzyb
   /fxq9kMkefg5gm1RVS2dwlQwIbq8BUtIg1mTSTNeBqoJxNHyi5drkxlwa
   A==;
X-CSE-ConnectionGUID: mwFa43MBTg+JcGRoZt+r9g==
X-CSE-MsgGUID: 83f3KDg4RLSmoDhWLXz9yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82347398"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82347398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 22:22:34 -0700
X-CSE-ConnectionGUID: h4LQ5FawSdWfQb9I/ZB9Jg==
X-CSE-MsgGUID: TZOE4lp4RZi4F1NsfCVscg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="285102310"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2026 22:22:32 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYGpB-00000000PhZ-0Y5S;
	Sat, 13 Jun 2026 05:22:29 +0000
Date: Sat, 13 Jun 2026 13:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Francois Dugast <francois.dugast@intel.com>,
 Balbir Singh <balbirs@nvidia.com>
Subject: include/linux/compiler_types.h:706:45: error: call to
 '__compiletime_assert_756' declared with attribute error: BUILD_BUG failed
Message-ID: <202606131321.k8HAYMJH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   062871f1371b2e02a272ff5279c6479aff0a37ef
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 drm/pagemap: Correct cpages calculation for migrate_vma_setup
date:   3 months ago
config: arm64-randconfig-001-20260612 (https://download.01.org/0day-ci/archive/20260613/202606131321.k8HAYMJH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131321.k8HAYMJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate_vma_setup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131321.k8HAYMJH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/drm_pagemap.c: In function 'drm_pagemap_cpages':
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_756' declared with attribute error: BUILD_BUG failed
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drivers/gpu/drm/drm_pagemap.c:480:33: note: in expansion of macro 'HPAGE_PMD_ORDER'
     480 |                         order = HPAGE_PMD_ORDER;
         |                                 ^~~~~~~~~~~~~~~
--
   In file included from <command-line>:
   drm_pagemap.c: In function 'drm_pagemap_cpages':
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_756' declared with attribute error: BUILD_BUG failed
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drm_pagemap.c:480:33: note: in expansion of macro 'HPAGE_PMD_ORDER'
     480 |                         order = HPAGE_PMD_ORDER;
         |                                 ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_756 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
