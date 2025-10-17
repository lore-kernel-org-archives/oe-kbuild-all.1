Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A2307487
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722741; cv=none; b=u6IK2jf0pzPAdqOalaY46O0Zk93eTck/8h/SYZPzm6+P4zO4OseGcnnPMoaUac1WCb+TYAMWqXB3Gjux9P5booG2vXU/0sYvTjEwgbpuhLBMzjO7WE3pRcn8m4Uj63rSABEihj5bX4LJHW8Op5cPeHCjIynzAm6fN797xH9hUws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722741; c=relaxed/simple;
	bh=3tmX5VOulogZQOYvsCjmOKwtzYBRz4wShEgz+3h4J3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2OA9crVtQ3Or/hiGmP92MYDTy99I07NYRDYbrcEalQF6iXQltyu6zx72SinzUzdlJSjKFHwWkU8a7TXQCAmlGGt2pPcGtqe1gu0Fu0HiTKtFta8uUQb28nlIKdcUcr5MtXIQ4bPCm8nf+P37pRE9QanVut+PRvOT7aiD5VllJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiCtUvIM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiCtUvIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760722739; x=1792258739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3tmX5VOulogZQOYvsCjmOKwtzYBRz4wShEgz+3h4J3w=;
  b=GiCtUvIM4stW5GUvh2F6Zg3K2pj5c6H3mJBBsS8N0qGeLCoZuPd4lRlS
   0xCdeO2ofPaFN59NwqtNIVKQRC0CABZnQC3JoJ4W4fJRFe52D3hViC6mN
   +k7pu7iSeAe3KYHTTeSCMtkcEklV1CrgD9WodZi4pbUjtP5BQDN3RPtSw
   0OO3vKu51wzmAFZIKxHPMaEjxQVyo9QpL/JS/iOm+qGMJbC6avPubKoNc
   rklkuTg8IKaRymO76eIwSKsRwYs/3E53jHo7s3zJ7aQHnp1WGQ+ugUfP1
   ifCjK5bvyAsetHr4zhtcS/2CB1GchvZPab7EDg3Z2PfF6syQ1G65UjXCq
   Q==;
X-CSE-ConnectionGUID: QUnjohZuRvyzyyTptT28gw==
X-CSE-MsgGUID: 8jQsNP1yQ2SRrYzRmovYNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74054306"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="74054306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 10:38:59 -0700
X-CSE-ConnectionGUID: m2znDkMnTTmzfytOTQ+vkA==
X-CSE-MsgGUID: 1C7vaGuRSmaTbslwqYSXxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="213762047"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2025 10:38:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9oPe-0007c7-2N;
	Fri, 17 Oct 2025 17:38:49 +0000
Date: Sat, 18 Oct 2025 01:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/hugetlb.c:1370:6:
 warning: no previous prototype for function
 'free_huge_page_to_dhugetlb_pool'
Message-ID: <202510180108.ZfB8paeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   045418106c25769e424b67183bab8f2333dc6278
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1418/1418] dhugetlb: backport dynamic hugetlb feature
config: x86_64-buildonly-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20251018/202510180108.ZfB8paeW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180108.ZfB8paeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180108.ZfB8paeW-lkp@intel.com/

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
