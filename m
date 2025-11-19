Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A262E8B8D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559476; cv=none; b=ii8GMjn2vB1STb6yAoHYCJ+oQWlZVKnClsaCquHVVw8Qheg5p/PXW1wSg7pjmA8E0t2sTxdvswnRT2M3FYSnt6tx2wOrXd5o9JNhSPH8ChYvS9w6Kzm4Vj0GgCnX1Uzc8idqFREtC/Xo7AgOj9TWgvIafZwiT7EYVaOOtuyE0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559476; c=relaxed/simple;
	bh=3qEcXvmQ26Sw5i3VyNucdGE8RNkfVJYQpWde9qcDMdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2w/ZrIkuhPurAVGj1x7WDBYAHFEpbUsYrwj1L9z0PDmKXrr0zlwMxfe9MZFgkbV/pRd5Uht7QKirK+LOZs0Gsd3cHsiwZIHgtoGfMMHldn83togMAEi7ejq7VxH+3Cut74oE+veNYQwM74BHg5g6c9i2Q6CBev3cM1AnM8U1c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXEauI0k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXEauI0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763559475; x=1795095475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qEcXvmQ26Sw5i3VyNucdGE8RNkfVJYQpWde9qcDMdw=;
  b=GXEauI0kAVXtkJ5DmmMuFevpP018vkkmCcNl1+DdMSjktTMofsPwpWMY
   zvGT8xoNo69aVMJJU60kFdlL+20xceSo8UwmpDoDRojLCgejH5BfnJhLl
   tdG82kQVVFBqU5hFqO+9UXlLoiWnrV5QH0oqIsYRuo5Dx2e98CBoMvKAn
   HcXScSr0pAUUyE+a62afpXFCb2yzsgX/oIIS3Oeu1vk85dY0wyz9c9Sxz
   sdbZImWbwmbISGQxnErulPouIq3PD0GbmWtcp6G1Yee+ICfDqzHJCinsp
   g0U13HdfAypI32pqlhNTFvEmQpMOiG0eWDOK+Zug3iZ6m2gNypKcvUFjo
   Q==;
X-CSE-ConnectionGUID: 3vZBN6uZTli0VEuCRajAPA==
X-CSE-MsgGUID: 734hfgJBQzGsFB3hUBf5Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76704928"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76704928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:37:53 -0800
X-CSE-ConnectionGUID: 4dg7A1DASgK3rSZZBERFBw==
X-CSE-MsgGUID: B2O1QVptS/qv+fJaBL8K7Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2025 05:37:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLiNZ-0002vr-1e;
	Wed, 19 Nov 2025 13:37:49 +0000
Date: Wed, 19 Nov 2025 21:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1935/1935] mm/share_pool.c:1043:2:
 error: implicit declaration of function 'sysctl_compaction_handler'; did you
 mean 'compaction_failed'?
Message-ID: <202511192140.dgf3lMX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6c5657aecca1857be6ea39f789159c9acfde2f9e
commit: d45b33b72c530e64219ad997947a33f6e07d339c [1935/1935] share pool: Try to compact when memory is insufficient
config: arm64-randconfig-r132-20251119 (https://download.01.org/0day-ci/archive/20251119/202511192140.dgf3lMX3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511192140.dgf3lMX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511192140.dgf3lMX3-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c:59:5: sparse: sparse: symbol 'enable_mdc_default_group' was not declared. Should it be static?
   mm/share_pool.c:1043:9: sparse: sparse: undefined identifier 'sysctl_compaction_handler'
   mm/share_pool.c:1772:21: sparse: sparse: undefined identifier 'huge_ptep_get'
   mm/share_pool.c:1772:34: sparse: sparse: invalid initializer
   mm/share_pool.c:2524:30: sparse: sparse: undefined identifier 'huge_pte_none'
   mm/share_pool.c:2537:23: sparse: sparse: undefined identifier 'huge_add_to_page_cache'
   mm/share_pool.c:2553:14: sparse: sparse: undefined identifier 'huge_pte_none'
   mm/share_pool.c:2559:9: sparse: sparse: undefined identifier 'set_huge_pte_at'
   mm/share_pool.c:2561:9: sparse: sparse: undefined identifier 'hugetlb_count_add'
   mm/share_pool.c:2597:24: sparse: sparse: undefined identifier 'hugetlb_alloc_hugepage'
   mm/share_pool.c: In function 'sp_compact_nodes':
>> mm/share_pool.c:1043:2: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'compaction_failed'? [-Werror=implicit-function-declaration]
     sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
     compaction_failed
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1772:14: error: implicit declaration of function 'huge_ptep_get'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
     pte_t pte = huge_ptep_get(ptep);
                 ^~~~~~~~~~~~~
                 huge_pte_lock
   mm/share_pool.c:1772:14: error: invalid initializer
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:2524:9: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
       if (!huge_pte_none(huge_ptep_get(ptep))) {
            ^~~~~~~~~~~~~
            huge_pte_lock
   mm/share_pool.c:2537:9: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
      err = huge_add_to_page_cache(page, mapping, idx);
            ^~~~~~~~~~~~~~~~~~~~~~
            add_to_page_cache
   mm/share_pool.c:2559:2: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
     set_huge_pte_at(mm, haddr, ptep, new_pte);
     ^~~~~~~~~~~~~~~
     set_huge_swap_pte_at
   mm/share_pool.c:2561:2: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
     hugetlb_count_add(pages_per_huge_page(h), mm);
     ^~~~~~~~~~~~~~~~~
     hugetlb_count_sub
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:2597:10: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
      return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
             ^~~~~~~~~~~~~~~~~~~~~~
             vmalloc_hugepage
   mm/share_pool.c:2597:47: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
      return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
                                                  ^~~~~~~~~~~~~~~~~~
                                                  HUGETLB_ANON_FILE
   mm/share_pool.c:2597:47: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2600:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors
--
   mm/share_pool.c: In function 'sp_compact_nodes':
>> mm/share_pool.c:1043:2: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'compaction_failed'? [-Werror=implicit-function-declaration]
     sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
     compaction_failed
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1772:14: error: implicit declaration of function 'huge_ptep_get'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
     pte_t pte = huge_ptep_get(ptep);
                 ^~~~~~~~~~~~~
                 huge_pte_lock
   mm/share_pool.c:1772:14: error: invalid initializer
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:2524:9: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
       if (!huge_pte_none(huge_ptep_get(ptep))) {
            ^~~~~~~~~~~~~
            huge_pte_lock
   mm/share_pool.c:2537:9: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
      err = huge_add_to_page_cache(page, mapping, idx);
            ^~~~~~~~~~~~~~~~~~~~~~
            add_to_page_cache
   mm/share_pool.c:2559:2: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
     set_huge_pte_at(mm, haddr, ptep, new_pte);
     ^~~~~~~~~~~~~~~
     set_huge_swap_pte_at
   mm/share_pool.c:2561:2: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
     hugetlb_count_add(pages_per_huge_page(h), mm);
     ^~~~~~~~~~~~~~~~~
     hugetlb_count_sub
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:2597:10: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
      return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
             ^~~~~~~~~~~~~~~~~~~~~~
             vmalloc_hugepage
   mm/share_pool.c:2597:47: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
      return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
                                                  ^~~~~~~~~~~~~~~~~~
                                                  HUGETLB_ANON_FILE
   mm/share_pool.c:2597:47: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2600:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +1043 mm/share_pool.c

  1039	
  1040	static unsigned long last_jiffies;
  1041	static void sp_compact_nodes(struct work_struct *work)
  1042	{
> 1043		sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
  1044	
  1045		kfree(work);
  1046	}
  1047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
