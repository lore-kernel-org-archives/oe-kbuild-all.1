Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3AE156F20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727380956; cv=none; b=dhGC0PkBW3hCjXS6p0RRfuA/2hHoObw+93vrSMyirhP8VSI7b6WFDyC9VHMmuxnlt6ZISQsW/g3ryW+ZpkeGsQvVfqB1sTRd2Zy4qQax3pnTeI55IpU920hdSxrhl1a0MmKrpzlu9tCqh0xOMnJ636umMnUqacXd8vEV8ncV13Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727380956; c=relaxed/simple;
	bh=L0bJX1PeJw4X1SokTB0Vi+domhox1kOn9GZCdiHQp+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2OaX1PD2+qIEdnmqV6R1la+XgCylL8a8h907RU42bZ7ijZOzj85y5YlMwBtUPWyMPR3ujfJ3lxOdeDha15XmiLVUSo+ZWufsxiM94Dij+bFNSB3g7q5ldtQRVSXfB/7hQoD1A/B4wTAtE3wYfyqos3OXHHdsh7zGvp3ejTXjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMdfCTPS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMdfCTPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727380955; x=1758916955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0bJX1PeJw4X1SokTB0Vi+domhox1kOn9GZCdiHQp+c=;
  b=XMdfCTPScgdfXYvx8kxwFvoeKbNhSLDpn3HK8FLVM1jdLD1YXjO61KHn
   qcdmyJ6VhgS7cY5a6GgIFeu9bTe7AlC5Y4GgxN6mnTmX5Mzk9Ej07NRhP
   KCwYxYB3sj2H1yWhaDfimcVHUVKIPf59vyP5vJ7g5HZ7Vt7l2pr2WXRqk
   DutXJub2s4gtdaYI+DKXwdJjIaAX1QoXt4zFJ0szuzZj72xRTT5fvdlhE
   reCOdvXfrK1FRElXk9m76tg0NlnTbWiIXoBDCYdOBhjMd60YNmDubpSU9
   GiSpMSRThAvk5rr7cWRkyQcV7RbQZ10H0ICK7RffJFlDdFgAbPhMpcNLp
   Q==;
X-CSE-ConnectionGUID: xJK9mAhGQf2IIRYCgKal+g==
X-CSE-MsgGUID: moN9+i3NRtabrgIhDBf2kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26639965"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26639965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 13:01:43 -0700
X-CSE-ConnectionGUID: JbRhzteVQ3OKOkTyN7zxng==
X-CSE-MsgGUID: fU8m2qchTdmS+HuqSAV0kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="103092606"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2024 13:01:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stugF-000L9r-0D;
	Thu, 26 Sep 2024 20:01:39 +0000
Date: Fri, 27 Sep 2024 04:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20217/23779] mm/hugetlb.c:1370:6:
 sparse: sparse: symbol 'free_huge_page_to_dhugetlb_pool' was not declared.
 Should it be static?
Message-ID: <202409270316.mecxJZQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b1d54e6f06c518a52f83edade0da2b959e1c9a4e
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [20217/23779] dhugetlb: backport dynamic hugetlb feature
config: x86_64-randconfig-123-20240926 (https://download.01.org/0day-ci/archive/20240927/202409270316.mecxJZQM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270316.mecxJZQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270316.mecxJZQM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/hugetlb.c:1370:6: sparse: sparse: symbol 'free_huge_page_to_dhugetlb_pool' was not declared. Should it be static?
   mm/hugetlb.c:4438:58: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] <asn:1> * @@     got void *buffer @@
   mm/hugetlb.c:4438:58: sparse:     expected void [noderef] <asn:1> *
   mm/hugetlb.c:4438:58: sparse:     got void *buffer
   mm/hugetlb.c:4452:60: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] <asn:1> *buffer @@
   mm/hugetlb.c:4452:60: sparse:     expected void *buffer
   mm/hugetlb.c:4452:60: sparse:     got void [noderef] <asn:1> *buffer
   mm/hugetlb.c:4510:60: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] <asn:1> *buffer @@
   mm/hugetlb.c:4510:60: sparse:     expected void *buffer
   mm/hugetlb.c:4510:60: sparse:     got void [noderef] <asn:1> *buffer
   mm/hugetlb.c:2018:20: sparse: sparse: context imbalance in 'gather_surplus_pages' - unexpected unlock
   mm/hugetlb.c:5168:17: sparse: sparse: context imbalance in 'hugetlb_cow' - unexpected unlock
   mm/hugetlb.c:5881:25: sparse: sparse: context imbalance in 'follow_hugetlb_page' - different lock contexts for basic block
   mm/hugetlb.c:1370:6: warning: no previous prototype for 'free_huge_page_to_dhugetlb_pool' [-Wmissing-prototypes]
    1370 | void free_huge_page_to_dhugetlb_pool(struct page *page, bool restore_reserve)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/hugetlb.c:14:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~

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
