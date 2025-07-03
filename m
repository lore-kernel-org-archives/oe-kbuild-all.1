Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223132D77E3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534762; cv=none; b=CHWAMM9vmupUhBBCJFT7ZyA/dqQX/v283fTSufFogxSxMLxOVc7lEke8Yh9l2aMYoKdHd6xO2JnCysIVN0JSFzBeOcyKhQuy5il/gqss5iaHkgr2bX4WTARwrVGRhZF81BuGaK2/qIZJs1SPvrxAn2LJ1+JVVcq9jgQP+bTdpm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534762; c=relaxed/simple;
	bh=Z5cEeS66j5GOqMJGvmdyxMfxqlIKrTAE8iYx6kRXRtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecuSyjbvYKMPFg+RwnpqJR4Xk6LxaOqfBCyBDA/4Y1zfvEz9eI6uiwg7IlwYf2IcwMj8SwgS/fDxYOdS9JqFee4TnEolcVxRTrL4fSfS66oqPI+uHycgO74Nq/zoF53u8Mr+47V8RKdo2QqpYfbFJB8hImYcm2yOR3LMl176miw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAZ2LnP7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAZ2LnP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751534760; x=1783070760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5cEeS66j5GOqMJGvmdyxMfxqlIKrTAE8iYx6kRXRtM=;
  b=TAZ2LnP7JyLWkDvGEQp0Qi8vluZ+EfKVk3CBl+zgpLqOt9adeA4IJxEU
   3Zb0oqY3JKs/oVQedil9CoucBhbSSIAe9/y4UIxVfibHuPq6OJBJomO9X
   ZLJJX6L6mINgXPXLISA1ANSTvAVI0R5+EUmYBoqycqB6fDyIjrAKXcVfa
   c0SiKQ0krHag2E/W70QGQne07pGKqCdANCtnUmvAp5Ie1gedfr46CECCr
   87TH8ywxna2ksT0jSWoZLaUlKc34lgWWAIc7om3Vpt4Q7ruyA6alCP6p6
   UqKPXVoVYGECaU1kSL3y6JtDvx9rDq0brs3H8tqFhGJqEi9O/azdUgIWu
   g==;
X-CSE-ConnectionGUID: +ei0mSMASqO8gTPJOA6IoA==
X-CSE-MsgGUID: 1pZgh64kRwScq+71wdg6OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65307927"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="65307927"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 02:25:59 -0700
X-CSE-ConnectionGUID: WvkB1W+PTqKO5u7rI5y+ig==
X-CSE-MsgGUID: z/JJPfshSjamot8Oohq7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="155064498"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2025 02:25:58 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXGCa-0000Re-1p;
	Thu, 03 Jul 2025 09:25:56 +0000
Date: Thu, 3 Jul 2025 11:25:00 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] mm/hugetlb.c:1370:6:
 warning: no previous prototype for function
 'free_huge_page_to_dhugetlb_pool'
Message-ID: <202507031140.U5GKFBc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fc7fe8d28044724c4f29058aeb93f2e492585380
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1605/1605] dhugetlb: backport dynamic hugetlb feature
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250703/202507031140.U5GKFBc9-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031140.U5GKFBc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507031140.U5GKFBc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:1370:6: warning: no previous prototype for function 'free_huge_page_to_dhugetlb_pool' [-Wmissing-prototypes]
    1370 | void free_huge_page_to_dhugetlb_pool(struct page *page, bool restore_reserve)
         |      ^
   mm/hugetlb.c:1370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1370 | void free_huge_page_to_dhugetlb_pool(struct page *page, bool restore_reserve)
         | ^
         | static 
   In file included from mm/hugetlb.c:14:
   include/linux/mempolicy.h:329:13: warning: unused function '__do_mbind' [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   2 warnings generated.


vim +/free_huge_page_to_dhugetlb_pool +1370 mm/hugetlb.c

  1324	
  1325	#ifdef CONFIG_DYNAMIC_HUGETLB
  1326	static void free_huge_page_to_dhugetlb_pool(struct page *page,
  1327						    bool restore_reserve)
  1328	{
  1329		struct hstate *h = page_hstate(page);
  1330		struct dhugetlb_pool *hpool;
  1331	
  1332		hpool = get_dhugetlb_pool_from_dhugetlb_pagelist(page);
  1333		if (unlikely(!hpool)) {
  1334			pr_err("dhugetlb: free error: get hpool failed\n");
  1335			return;
  1336		}
  1337	
  1338		spin_lock(&hpool->lock);
  1339		ClearPagePool(page);
  1340		set_compound_page_dtor(page, NULL_COMPOUND_DTOR);
  1341		if (!hstate_is_gigantic(h)) {
  1342			list_add(&page->lru, &hpool->dhugetlb_2M_freelists);
  1343			hpool->free_reserved_2M++;
  1344			hpool->used_2M--;
  1345			if (restore_reserve) {
  1346				hpool->mmap_reserved_2M++;
  1347				trace_dhugetlb_acct_memory(hpool,
  1348							   hpool->mmap_reserved_2M,
  1349							   DHUGETLB_RESV_2M);
  1350			}
  1351			trace_dhugetlb_alloc_free(hpool, page, hpool->free_reserved_2M,
  1352						  DHUGETLB_FREE_2M);
  1353		} else {
  1354			list_add(&page->lru, &hpool->dhugetlb_1G_freelists);
  1355			hpool->free_reserved_1G++;
  1356			hpool->used_1G--;
  1357			if (restore_reserve) {
  1358				hpool->mmap_reserved_1G++;
  1359				trace_dhugetlb_acct_memory(hpool,
  1360							   hpool->mmap_reserved_1G,
  1361							   DHUGETLB_RESV_1G);
  1362			}
  1363			trace_dhugetlb_alloc_free(hpool, page, hpool->free_reserved_1G,
  1364						  DHUGETLB_FREE_1G);
  1365		}
  1366		spin_unlock(&hpool->lock);
  1367		dhugetlb_pool_put(hpool);
  1368	}
  1369	#else
> 1370	void free_huge_page_to_dhugetlb_pool(struct page *page, bool restore_reserve)
  1371	{
  1372	}
  1373	#endif
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
