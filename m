Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6181991B0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537222; cv=none; b=KDgZCEtOrWontkD8qy17t0D2MPyN0J3617RtrO6XEq9wWuWXjT+wH+0uKT6X3vpdMiRCiOVuicZ5fK1KgPKBbqQiaRoLTQfxqzesujW/UHLhtAexVA7NcZlssFsw6xw2z9PTYQ1Lb+EDexKQQiMwZYr6F3Evq7MvuDjUJkIERcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537222; c=relaxed/simple;
	bh=y2IK+HEcBB/ZWqPaVkHAlLN6h8/RBN3tp0brL+cgAcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O2TwOGXy4+Jfo1+TCwAwb1M/giXCQcadOO08OcW5F7vHXaFz8+7As0Np3UNyGuHLJegM/pGSkkawnuCL8eNdiKhpWB7w4DX75jLhMLc8u+xSeY2hMDEye7mEhwyKlhiAnFCWFA19bqF1KMwPdCuU9xj5Dl5zzwGRccB0imSotZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/7kuzp6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/7kuzp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725537220; x=1757073220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y2IK+HEcBB/ZWqPaVkHAlLN6h8/RBN3tp0brL+cgAcc=;
  b=J/7kuzp6WPGlD64WPczpWw13I9RjJTpWQgD+K3C5z5ei4RFYdwgmXuou
   1HylQbMsX4t6fbOaSsduF9qX3swF3E9VrcYEJRKFD8WxWjBZttQeI/Qvn
   7bU3tyfPKzE1zhmc7K4O9iRlOtgBPdPXolgHUSsYvwXxw87CYO08ryKxp
   aLZh+v8S2DNgfyAsKq1v1EggHGBAbRYqHZ/P1UtgCLNcKhHuEL3ObRPuG
   kQkhn63de/HbmxIN+yxe7bpB6LIPnSHJCjpO0v7/MmBS2jSPmFLQMA160
   iRiv/CU+DHqDhlGywjjilsdtsPf+FdkslYKAhyaqkB4w866/skCVKzLpO
   Q==;
X-CSE-ConnectionGUID: ZCujvwDpRICes3iu9RW6Ww==
X-CSE-MsgGUID: lTp2/KJFTK6UNb3rjLF4qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35633464"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="35633464"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 04:53:39 -0700
X-CSE-ConnectionGUID: duvvsZ+BR6ew3ciPJuhNmA==
X-CSE-MsgGUID: ZhKTczjBTJSpA0tHd4SEcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65611132"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Sep 2024 04:53:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smB3Q-0009nB-1K;
	Thu, 05 Sep 2024 11:53:36 +0000
Date: Thu, 5 Sep 2024 19:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13795/13866] mm/shmem.c:1641:57: error: call to
 '__compiletime_assert_745' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202409051939.TTEs2Xg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   552667f6edabe9e4bc2c86f990f53749bebfcbed
commit: c7fcbe1041758d0dedc32502609a73a22884d7b8 [13795/13866] mm: shmem: Merge shmem_alloc_hugefolio() with shmem_alloc_folio()
config: x86_64-randconfig-014-20240905 (https://download.01.org/0day-ci/archive/20240905/202409051939.TTEs2Xg7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051939.TTEs2Xg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051939.TTEs2Xg7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/shmem.c:1660:6: warning: variable 'folio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1660 |         if (!shmem_prepare_alloc(&gfp))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1688:7: note: uninitialized use occurs here
    1688 |         if (!folio)
         |              ^~~~~
   mm/shmem.c:1660:2: note: remove the 'if' if its condition is always false
    1660 |         if (!shmem_prepare_alloc(&gfp))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1661 |                 goto no_mem;
         |                 ~~~~~~~~~~~
   mm/shmem.c:1653:21: note: initialize the variable 'folio' to silence this warning
    1653 |         struct folio *folio;
         |                            ^
         |                             = NULL
>> mm/shmem.c:1641:57: error: call to '__compiletime_assert_745' declared with 'error' attribute: BUILD_BUG failed
    1641 |         folio = vma_alloc_folio(gfp, order, &pvma, 0, order == HPAGE_PMD_ORDER);
         |                                                                ^
   include/linux/huge_mm.h:110:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     110 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:106:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     106 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:439:2: note: expanded from macro '_compiletime_assert'
     439 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:432:4: note: expanded from macro '__compiletime_assert'
     432 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:61:1: note: expanded from here
      61 | __compiletime_assert_745
         | ^
>> mm/shmem.c:1641:57: error: call to '__compiletime_assert_745' declared with 'error' attribute: BUILD_BUG failed
   include/linux/huge_mm.h:110:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     110 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:106:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     106 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:439:2: note: expanded from macro '_compiletime_assert'
     439 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:432:4: note: expanded from macro '__compiletime_assert'
     432 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:61:1: note: expanded from here
      61 | __compiletime_assert_745
         | ^
   1 warning and 2 errors generated.


vim +1641 mm/shmem.c

  1633	
  1634	static struct folio *shmem_alloc_folio(gfp_t gfp, int order,
  1635			struct shmem_inode_info *info, pgoff_t index)
  1636	{
  1637		struct vm_area_struct pvma;
  1638		struct folio *folio;
  1639	
  1640		shmem_pseudo_vma_init(&pvma, info, index);
> 1641		folio = vma_alloc_folio(gfp, order, &pvma, 0, order == HPAGE_PMD_ORDER);
  1642		shmem_pseudo_vma_destroy(&pvma);
  1643	
  1644		return folio;
  1645	}
  1646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
