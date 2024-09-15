Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0221DFEF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726423739; cv=none; b=OmJeHo1bSd8Uqr5fGPdVbM7a9v9RiSe3v1I9zLCZC8Ph5VK3VjZiTnyG0Su5o6rQGh128Kgx2L540vovsJGyP1TyHxiwrnvDfGUPMPeWauevoNXK7mLQxh5L8cxtDZjNktpmQ0UrBCTtJgjhsxNl8FlU9mUwDxB65IvOK0hWhVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726423739; c=relaxed/simple;
	bh=Q96YA3EGzMJmBLb0/w6wrw1COZaZ6lE/L4pUqz1pIXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVoIdoYL5nCS7qNULPKbD87ijjYl9UHIc+UWx9p9JpBRhG4QxM+squhZQsOcuaCu+Pnu86HHLbxzciRPelIKqOkk/+xFTGfsn+/FY+BTyy0+7ycYvxWunP8dpDL3M73QMV4QVRp5X28eJg7gQuAcpjihA1dSJA+BWSSagmm2eUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+XWGFXu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+XWGFXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726423736; x=1757959736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q96YA3EGzMJmBLb0/w6wrw1COZaZ6lE/L4pUqz1pIXc=;
  b=F+XWGFXuiynxO2WgqotQjlr05qHnqFZ2YhN/rwHUnGzdsIx0h3wWrpNq
   owc8ydtOkHDIkxOKMmXqQ+MhYIY5wjVvrp8Dm9Rr++ekVhpkpoPvs3mv+
   wg2AJuQnt6zAdKST8oE8LoR5EVeSTUtfX9Y0cjZzOSzd6tuthNqO+sHRD
   uiihkh3YxB1tZeSuYsM1o+uxvu8qiznr+RkP80K/BZZrK6OGGGkGo/y8H
   RErwX2fn/pw9b/0Zs4wUA+sr79oXf1yyCxHJIgEXXzLtHnqIaNI5hzD3Y
   Rur3ftITJpO8732BsWXLK+a6xhOvlKMKOTZuYpoZX7z8OHrDgcob2Cxmu
   Q==;
X-CSE-ConnectionGUID: e8cw06IwTmyQE9J8/tLIEg==
X-CSE-MsgGUID: 4SK+k+/VTzCEbjbfEZl+xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25413558"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25413558"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 11:08:56 -0700
X-CSE-ConnectionGUID: ZO+DjFh8QFCh87Hj/KbRgA==
X-CSE-MsgGUID: D6nj7XiNQgmUXKLdcHPR5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="72765437"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2024 11:08:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sptg3-0008tu-2X;
	Sun, 15 Sep 2024 18:08:51 +0000
Date: Mon, 16 Sep 2024 02:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: include/linux/compiler_types.h:328:45: error: call to
 '__compiletime_assert_315' declared with attribute error: BUILD_BUG_ON
 failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
Message-ID: <202409160223.xydgucbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vineet,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98f7e32f20d28ec452afb208f9cffc08448a2652
commit: d9820ff76f95fa26d33e412254a89cd65b23142d ARC: mm: switch pgtable_t back to struct page *
date:   3 years, 1 month ago
config: arc-randconfig-r064-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160223.xydgucbY-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160223.xydgucbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160223.xydgucbY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arc/mm/init.c:35:13: warning: no previous prototype for 'arc_get_mem_sz' [-Wmissing-prototypes]
      35 | long __init arc_get_mem_sz(void)
         |             ^~~~~~~~~~~~~~
   arch/arc/mm/init.c:88:13: warning: no previous prototype for 'setup_arch_memory' [-Wmissing-prototypes]
      88 | void __init setup_arch_memory(void)
         |             ^~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/arc/mm/init.c: In function 'mem_init':
>> include/linux/compiler_types.h:328:45: error: call to '__compiletime_assert_315' declared with attribute error: BUILD_BUG_ON failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:309:25: note: in definition of macro '__compiletime_assert'
     309 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:328:9: note: in expansion of macro '_compiletime_assert'
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/arc/mm/init.c:194:9: note: in expansion of macro 'BUILD_BUG_ON'
     194 |         BUILD_BUG_ON((PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_315 +328 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  314  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  315  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  316  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  317  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  318  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  319   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  320   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  321   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  322   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  323   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  324   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  325   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  326   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  327  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @328  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  329  

:::::: The code at line 328 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
