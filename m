Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466B199FC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 02:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744079050; cv=none; b=d5JT9ofnbaboJzYEP2pfXB1NPlRVGqqkWjyM0XFZ1rmmeTwrS2X3hcF55wC32V/hohFhfvGXdoAhPUfFGLbeSdlXqSms2qz/TpdwQtL8uISL9gZhrsvYMlL7KbgNii3PpFk6pL/mmyv9Rd4Il+Tal1Z9JI5FnUm35yul7lTMgDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744079050; c=relaxed/simple;
	bh=Q4JLtjFHGtA01QZjAPysMFsuXS5hA7aMSm8hYx7E1GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5Kz73f6Bv0VLvnWQF0O0/J0B9Lknd+2e1ihd5YAg8U5p7SbMvG5Za0lAGYbToeJSD1ByAPuhJ1Rkcl9jaOLezzSk/+2r8XOPC6v0yKJTtouV125c15A/s50aRg342yHmCOX2WmfeQ684k8x0OOHQh2mdE6yw1KvnQS6YL6zpoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6ylHLWA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6ylHLWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744079049; x=1775615049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4JLtjFHGtA01QZjAPysMFsuXS5hA7aMSm8hYx7E1GQ=;
  b=d6ylHLWAYpiZe46HD3hXkiQUEe6KSFnl0NzlZ/mnxhHCMLR81qidUFyx
   xf/iCdo2rZPIeJhwrFu/fcWhwqThM25fQL+he4eS9uyw4nv4aivmRbvzc
   FQu19hdygFrEeuf58FIpsdhRYU7tnWcnCcce0WANR9Hbn1IoLJjieOU5l
   deRqvn11yf6YZxTntwikgtNLo08DSUVaV+BbAo6IVjb87AxtnjGXLHHr3
   thUJzMPbKoIsAnC+QBvYfRxcDtP6hq76GpAovJe1EVAdWoRCI2tAXUpkH
   ePpDGMX13CSxy1/CchD5GgrRs3bHAq9hdDwpqH6ETcxNwTVdPcITD9sBU
   w==;
X-CSE-ConnectionGUID: pUuMUsh/R9WYoLhD0yCJ4Q==
X-CSE-MsgGUID: M5v0nf75TGSZAe4ux+aBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45207502"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="45207502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:24:09 -0700
X-CSE-ConnectionGUID: 965k+N1ZSMOZ/aiACaUiAA==
X-CSE-MsgGUID: lCdV3uyDRbWJpqkb/LBtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128119285"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Apr 2025 19:24:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1ydB-000416-0r;
	Tue, 08 Apr 2025 02:24:05 +0000
Date: Tue, 8 Apr 2025 10:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/hugetlb.c:1370:6:
 warning: no previous prototype for function
 'free_huge_page_to_dhugetlb_pool'
Message-ID: <202504081022.SWpK2BGS-lkp@intel.com>
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
head:   3191c9e4e7c581bfe0a40ee198ffcbd5c3dea53e
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1418/1418] dhugetlb: backport dynamic hugetlb feature
config: x86_64-buildonly-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250408/202504081022.SWpK2BGS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081022.SWpK2BGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081022.SWpK2BGS-lkp@intel.com/

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
