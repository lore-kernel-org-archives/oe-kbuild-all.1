Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E98194080
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499169; cv=none; b=E462KsS62SULzBhiaJB3aSnsDC9M0qIGi2MfKqsKvTGlKNPyyqGP0oHnPUmAEfq0L2FA0oJnRZ1ak50L9F8Sttk62mou5JCwEh45p3PZ6fySK9BecNjVOzjxm5gWtRPLyXBHrgfmd930dLTvG7OvoquE9z7UeExcYAelEM/qcU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499169; c=relaxed/simple;
	bh=I63E1YBhN5toye/WTgKKCieJLqMvHBpGoYSpNnG06Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/ZZCZikwG6Ru1ieJ6CS+JvwQVwMbaoRrYqP0LVOHZg8HJjGcvJjvTcQwbHA1qu6OBp9dy+3dC+Wa2CImI9BSw8WBz4vE0v4Q9HJdqQGkBYjMaaWhJRQIe5mcURngD07ZY9pOVk53F99cCNs2DNaOor2aJx+nQgxWSTPBa/9iZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqwkKVJ1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqwkKVJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743499168; x=1775035168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I63E1YBhN5toye/WTgKKCieJLqMvHBpGoYSpNnG06Wc=;
  b=XqwkKVJ1a+/rxH5Akt7cE2AJCpFefN6g+6+s6rys2JZ2HYJ8VTGQFEAV
   BgyHUT02oeZqJDV9asQ+HWOzypFyOGE2otbJsu9FukeojaPMR7+a85P39
   VE6gtFxmlMRz3j4dSnUDiMt4y5jE+i9/eoOstH9YbNYz38nkDOZb/eyUA
   dmKPSM9fVWEc8odfuUtClhxJQceWHH6+Yg5lnzePJVk79sTyioPrSMkZ2
   vmnK5nKy7KsFx2diRAf8dd2Ih9tsgyqbdz8ezmGzwsy3z7/325IRLvIgd
   4kfli09QkZd8/dITmcL+cY+MDWRVRXRW+SjJFqt2qz0JKDXrR/+c+qlOn
   A==;
X-CSE-ConnectionGUID: capXmn+0TaCGABUq1tovLg==
X-CSE-MsgGUID: 5KLImyxSTueSNHvQIandOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55472267"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="55472267"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:19:27 -0700
X-CSE-ConnectionGUID: wQ50jNTnTL+QZEN/tHpeSQ==
X-CSE-MsgGUID: nND3DnzAQP69zf1ramQzlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126852688"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2025 02:19:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzXlt-0009kO-2l;
	Tue, 01 Apr 2025 09:19:06 +0000
Date: Tue, 1 Apr 2025 17:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1544/1544] mm/share_pool.c:2263:24:
 error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you
 mean 'vmalloc_hugepage'?
Message-ID: <202504011702.UDJZ2vxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54ad6c4559d2bcbb5d7a03050b2f417a326a1ce2
commit: 4a280fac30d27ae2aff096f9f99aa12d50f83426 [1544/1544] ascend: share_pool: support share pool features for ascend platform
config: arm64-randconfig-r131-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011702.UDJZ2vxB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250401/202504011702.UDJZ2vxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011702.UDJZ2vxB-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c:55:5: sparse: sparse: symbol 'enable_mdc_default_group' was not declared. Should it be static?
   mm/share_pool.c:172:6: sparse: sparse: symbol 'host_svm_sp_enable' was not declared. Should it be static?
   mm/share_pool.c:1542:21: sparse: sparse: undefined identifier 'huge_ptep_get'
   mm/share_pool.c:1542:34: sparse: sparse: invalid initializer
   mm/share_pool.c:2263:24: sparse: sparse: undefined identifier 'hugetlb_alloc_hugepage'
   mm/share_pool.c:236:28: sparse: sparse: context imbalance in 'spa_dec_usage' - unexpected unlock
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1542:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1542 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:1542:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_alloc_pages':
>> mm/share_pool.c:2263:24: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        vmalloc_hugepage
>> mm/share_pool.c:2263:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   mm/share_pool.c:2263:61: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2266:1: warning: control reaches end of non-void function [-Wreturn-type]
    2266 | }
         | ^
   cc1: some warnings being treated as errors

sparse warnings: (new ones prefixed by >>)
   mm/share_pool.c:55:5: sparse: sparse: symbol 'enable_mdc_default_group' was not declared. Should it be static?
   mm/share_pool.c:172:6: sparse: sparse: symbol 'host_svm_sp_enable' was not declared. Should it be static?
   mm/share_pool.c:1542:21: sparse: sparse: undefined identifier 'huge_ptep_get'
>> mm/share_pool.c:1542:34: sparse: sparse: invalid initializer
   mm/share_pool.c:2263:24: sparse: sparse: undefined identifier 'hugetlb_alloc_hugepage'
   mm/share_pool.c:236:28: sparse: sparse: context imbalance in 'spa_dec_usage' - unexpected unlock
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1542:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1542 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:1542:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:2263:24: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        vmalloc_hugepage
   mm/share_pool.c:2263:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   mm/share_pool.c:2263:61: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2266:1: warning: control reaches end of non-void function [-Wreturn-type]
    2266 | }
         | ^
   cc1: some warnings being treated as errors

vim +2263 mm/share_pool.c

  2257	
  2258	
  2259	struct page *sp_alloc_pages(struct vm_struct *area, gfp_t mask,
  2260						  unsigned int page_order, int node)
  2261	{
  2262		if (area->flags & VM_HUGE_PAGES)
> 2263			return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
  2264		else
  2265			return alloc_pages_node(node, mask, page_order);
  2266	}
  2267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
