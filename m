Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557B208D1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 05:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725686063; cv=none; b=c4Gp4gA347tc53ZSLy6/dQEi9vGXDVslBs7rhW4nL+AF+PqnOY9b5AF8cXr0pZ33HUpPVcu07BL+88V6mJ+bG0kt+ldg1em26RNfMJKjySDTIpD3j8cFpj2He7Gjbvfl4733ABi/hOiksLqCTvt7QmB2T6tGlZo2wGaBqplqTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725686063; c=relaxed/simple;
	bh=dZxDuBicAxgvgmn4wHFSZCYA1KCdN7DlmbppagXZoZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kaq3P1FMcZ5Ura8uVsnJN/z2yakBib7Z9CpiW7NuIMnsElv2uRdBp4322SxdYtZApfY0V5UlLtyBIVvJISYepkr8WEJauQoc9uj5IMgeDkpx+5/obMHv17E4P5EcWpkxc1zo7xG7pz+i0hxf9R9ovhVOOa7xcRUTlPFsoVCZ33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GL9ZKfjQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL9ZKfjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725686061; x=1757222061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZxDuBicAxgvgmn4wHFSZCYA1KCdN7DlmbppagXZoZ0=;
  b=GL9ZKfjQEsh9KOsF9wOrUiEAhjR/NKsKBLNlYaQPRGuURsodfWVTyA8k
   6yMPJ1vkgW1wHYqFcYJBPMTK/HvXSaVWDruiCSe6+EfhO2bAUYZHha0vB
   wr0EVO2Aeny6MACcEXyhZtRqhkVFERfrGc0SCedMsMYHp5x8xijeXr+Bu
   MYCNWEvoVGdE6tWSyZbSF4OBL8tNhRn63/JBl6rQSYI/f/RTRf7bxcp1J
   BG61/0u3jsVOxdGFIFKLrDco4IowUgjzmca6Gn/qsuPEgdxgFX0dnnJ3j
   1NQ+Ef41yJxy8U9u6T9MlOfQgr/ZOAiykgi7wZtApJtiqHWBnwOjDIsa4
   w==;
X-CSE-ConnectionGUID: w0YlqIkWT8CvKqlKiBpeTQ==
X-CSE-MsgGUID: rb6T7P3XTlGh0ob9n6C7mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24561845"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="24561845"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 22:14:21 -0700
X-CSE-ConnectionGUID: u0lgZIUcQ26OZfk/4odYdA==
X-CSE-MsgGUID: AWtbBfRHTNqhmE8pSzVI/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70555306"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Sep 2024 22:14:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smnm5-000C8l-1V;
	Sat, 07 Sep 2024 05:14:17 +0000
Date: Sat, 7 Sep 2024 13:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13801/13880]
 include/linux/compiler_types.h:451:45: error: call to
 '__compiletime_assert_465' declared with attribute error: BUILD_BUG failed
Message-ID: <202409071355.c5MmsI6J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   10e0ea7796b38b1d35a6969966016d7a42d77b7f
commit: c7fcbe1041758d0dedc32502609a73a22884d7b8 [13801/13880] mm: shmem: Merge shmem_alloc_hugefolio() with shmem_alloc_folio()
config: arm64-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071355.c5MmsI6J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071355.c5MmsI6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071355.c5MmsI6J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/shmem.c: In function 'shmem_alloc_folio.constprop.isra':
>> include/linux/compiler_types.h:451:45: error: call to '__compiletime_assert_465' declared with attribute error: BUILD_BUG failed
     451 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:432:25: note: in definition of macro '__compiletime_assert'
     432 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:451:9: note: in expansion of macro '_compiletime_assert'
     451 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:106:28: note: in expansion of macro 'BUILD_BUG'
     106 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^~~~~~~~~
   include/linux/huge_mm.h:110:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
     110 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^~~~~~~~~~~~~~~
   mm/shmem.c:1641:64: note: in expansion of macro 'HPAGE_PMD_ORDER'
    1641 |         folio = vma_alloc_folio(gfp, order, &pvma, 0, order == HPAGE_PMD_ORDER);
         |                                                                ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_465 +451 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  437  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  438  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  439  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  440  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  441  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  442   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  443   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  444   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  445   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  446   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  447   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  448   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  449   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  450  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @451  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  452  

:::::: The code at line 451 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
