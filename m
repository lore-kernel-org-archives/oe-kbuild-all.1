Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10F91EEA5D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273647; cv=none; b=IaqaBXx4uSvMNufXqwPD1o0g5t4GpGuuOZYCiMXoM8UOR0Pbm67CmhWYv8dzF2NdQd1QO9qC4U2XcJOfc5vy1z9hVK5GTyGyTtRIA+Gukwwu0777zJdjrIuWZfylAlG5VzqvyoMZ/ZEKeT9ZOKBO/VJBoGQrjreenZE608E3zsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273647; c=relaxed/simple;
	bh=oWlzhH46mCtFJHXHCbB8mIRneWEZNAzrdQA96iXYriU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oEJKWvaD9BJ4La37Ccue7Vrt/YuAyYFxADQW1+XgAL2WPguR+tYwdmED8DSzNW6qkcaPFujBoEEFevo/HEU3k+VgTekyMPyMEsJUCiuLgqTgTWxMENU3dXuOKNrO1e5afePTEAPNYA/9/UiRPNqhLUCRMqx52Yh8/8yx7ueNj4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzoHCAvp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzoHCAvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744273643; x=1775809643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWlzhH46mCtFJHXHCbB8mIRneWEZNAzrdQA96iXYriU=;
  b=QzoHCAvp9/oTvUJEPkZKb+fjB7ggR5evzLd+ufpmkktaqmN/1rCoz14S
   XPlsLd5l6kzch3kppCE/zkkW/Us/xappqkvsKjZrlT+m9BXnmclvRIRAL
   bI+bULjrRGy97ORuisB+0sGApXU2xQ1D9sEqRO4fpamwnUjvB6q2xLyrc
   k7RbORGtzAbg6hmn18tqNe3961TN1QZAQ/oJ6OpQA6ejrUJYl02GBdgh/
   OlDyVxEuSMGS5AVV23PdEToU51Tqc2lYABpagn3mMSaKHFQxKzkcQ7sv6
   DbsE3f41CzvWVDXRWrldq9RqGeXR0yCMIwL1b2/AO3jD3CHh4U+oCqgQ4
   Q==;
X-CSE-ConnectionGUID: u+P9fCnWQ7GRNIO3vy6/EQ==
X-CSE-MsgGUID: DmB+howwSICv299Gtn+k8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="63321430"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="63321430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 01:27:23 -0700
X-CSE-ConnectionGUID: X07iJyvVSEKQZLYa8eS2wA==
X-CSE-MsgGUID: OxttEQJOQDm3nJqu8ZHKNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="132966740"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2025 01:27:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2nFo-0009od-12;
	Thu, 10 Apr 2025 08:27:20 +0000
Date: Thu, 10 Apr 2025 16:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1575/1575] mm/hugetlb.c:1370:6: sparse:
 sparse: symbol 'free_huge_page_to_dhugetlb_pool' was not declared. Should it
 be static?
Message-ID: <202504101655.g80FSsl7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   db05731a881772a1e8f532c2541b334d822596f2
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1575/1575] dhugetlb: backport dynamic hugetlb feature
config: arm64-randconfig-r122-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101655.g80FSsl7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250410/202504101655.g80FSsl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101655.g80FSsl7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/hugetlb.c:1370:6: sparse: sparse: symbol 'free_huge_page_to_dhugetlb_pool' was not declared. Should it be static?
   mm/hugetlb.c:2018:20: sparse: sparse: context imbalance in 'gather_surplus_pages' - unexpected unlock
   mm/hugetlb.c:5168:17: sparse: sparse: context imbalance in 'hugetlb_cow' - unexpected unlock
   mm/hugetlb.c:5881:25: sparse: sparse: context imbalance in 'follow_hugetlb_page' - different lock contexts for basic block
   mm/hugetlb.c:1370:6: warning: no previous prototype for 'free_huge_page_to_dhugetlb_pool' [-Wmissing-prototypes]
    1370 | void free_huge_page_to_dhugetlb_pool(struct page *page, bool restore_reserve)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
