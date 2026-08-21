Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F269C46F4B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308660; cv=none; b=iy7SstYq8zEba+JJ7pD/GGw9JWnb9rWuOO0BnlOAavtgZHdmoi8uzVLjIfDksp0bdLE8hciu+T3WeKEn1zxkzFys65GFtYDe+pe1bX3XN4Yt6Z4LzRJAWSFcVlW8WHJvhBBlzb7rcV5WGnRaiTt+wFmWnodFSeAb4VmAAhWZtYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308660; c=relaxed/simple;
	bh=pPWehGHx6M1GIeLL0t1J7orna/9EbO5l7dlSmJJ5asU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f0QANVDq8/pFVcXPZjPSDqDeinJ06rec5XTnsIWOUF2AKZLQITaXc98QqEF4JsdBmPqBT01mwgv0LFNt4Cnr1AnXMegYoveRw6XFbUKOItT+tWPq4MCKZQz5Jl3g65o6bhExyzbtYRjMD1YO4YCwdHruEDbQkme5/v1YXagpd4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maNRFyzm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maNRFyzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787308656; x=1818844656;
  h=date:from:to:cc:subject:message-id;
  bh=pPWehGHx6M1GIeLL0t1J7orna/9EbO5l7dlSmJJ5asU=;
  b=maNRFyzmKkjPxXcbqdxarLOhYVX8kyG1yBXbqpWHjtcAfA/PIwnexc8J
   ViJHolLv8cuRg1ll3EEPjHeB+CQDSK9WQnJgjKkWwH+52BXkPhEyI1O2m
   vqj3LfKYaVoiKZOSu9sipBaW8X3GQhZRDBuBfkk+3BF8k4Te/rGr70UbS
   +y4UIPBn6Y6P9JIHEKrfX4kEvgfJsOFaFzLQPEzHBEUYskLZHyJ9zJeQi
   0KyvVf8KrmWLUP01MBuSJfJLYt+DFZWmu8YIb3Sn0Bbf/9jvlfEOdsJLz
   wDTeFzC6FBm2sD7K39ZADwHYJLXrF97dgT0zpYDMyqyh8Z89KxvsUb5C5
   Q==;
X-CSE-ConnectionGUID: ROiu26FIRTWvC7U5xOKBZQ==
X-CSE-MsgGUID: ewLtvHhUT0SUB+1cVgtKYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91668676"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="91668676"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 03:37:31 -0700
X-CSE-ConnectionGUID: EgLQCAoaRYWxUG5Qx/4KGg==
X-CSE-MsgGUID: e/39AJQJQS2gb0uZTyk/0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="304509326"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 03:37:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxMco-00000000plP-3EPy;
	Fri, 21 Aug 2026 10:37:26 +0000
Date: Fri, 21 Aug 2026 18:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Francois Dugast <francois.dugast@intel.com>,
 Balbir Singh <balbirs@nvidia.com>
Subject: include/linux/compiler_types.h:706:45: error: call to
 '__compiletime_assert_468' declared with attribute error: BUILD_BUG failed
Message-ID: <202608211818.EouTM76p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 drm/pagemap: Correct cpages calculation for migrate_vma_setup
date:   5 months ago
config: x86_64-randconfig-071-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211818.EouTM76p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211818.EouTM76p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate_vma_setup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211818.EouTM76p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'drm_pagemap_cpages',
       inlined from 'drm_pagemap_migrate_to_devmem' at drivers/gpu/drm/drm_pagemap.c:593:6:
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_468' declared with attribute error: BUILD_BUG failed
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


vim +/__compiletime_assert_468 +706 include/linux/compiler_types.h

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
