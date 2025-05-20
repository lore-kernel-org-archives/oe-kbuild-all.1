Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EC721D3F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739852; cv=none; b=seUpXWhTWyQDjhQlgiTdtwlG1lOg3lg7EEk5O2Sj2fksPl5CsfUdoQLbMlYo1hRA5wio0IrDAgPiEvXBoFTlq1Jd6e/czv6lv+Og+ya1RJfRvYTOPoJR+efhCdhszA+rf00grWQCIoXztzCF6ym+6L+Bhuq8AivQm9Nf+HBLpzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739852; c=relaxed/simple;
	bh=Hh8DF8r6jRRdQ/y85b9Lhx0fYeMebOQAAXyN9k6clFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8S2URwa4qgO+tx9z2qtMsMKg6vSnMvcoPHXRFUACIK6HjRIFfZZBhgvHboE/xFytzMOkmQ4O0z0qBocFD77FKFqxRupg0mqlvY4T9/BZVfz81GZO7YyXRFkAkCt4egP3sq608kCxJDRiuTsOp3TiRzh+YbCgaN7TeEp+vCQ0jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCK+QYHV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCK+QYHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747739848; x=1779275848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hh8DF8r6jRRdQ/y85b9Lhx0fYeMebOQAAXyN9k6clFI=;
  b=QCK+QYHVcbSViwbVZea2QZ55d1D/M1RcW1MgpAYINVFzmcfvGQEjlvr7
   bPM+0CspE8TO1FHgtHv297E9zpbZVE+XP8FvhfiXHRbIuqnyTBh/yRUNQ
   Ty6mJBjq5vIGjjtIi9VQWzFa42SOqxag96c9qgQoxxkWB0nbVIvVt3wVN
   C4YnIH99AGacq/mbxR4Hxe3yPfGwk1xYCUmL8u96ENz/GoMNZpL9XCu5X
   2iJB0nPedY4ffr3rBTdD517GeavkHQOpFbu3tWOGW4NXcijIlQSIeJLWO
   zozC7GIxlQak0/+LBM4qK3ILqygwvoPCKfmhnvYDZ4qaK7cBD9mqZjXne
   g==;
X-CSE-ConnectionGUID: oIUFt8OYQxuUpXf9iFibqA==
X-CSE-MsgGUID: ARLAXlOWRYKH94rFX9HCXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60327250"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60327250"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:17:27 -0700
X-CSE-ConnectionGUID: 2Mww6cFWRhK83Lop1mbOXw==
X-CSE-MsgGUID: /puFDGnOTAGtZbHkD8YVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="170671796"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2025 04:17:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHKyK-000MVG-1K;
	Tue, 20 May 2025 11:17:24 +0000
Date: Tue, 20 May 2025 19:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1646/1646] mm/hugetlb.c:1370:6:
 warning: no previous prototype for 'free_huge_page_to_dhugetlb_pool'
Message-ID: <202505201910.3QGTFYPj-lkp@intel.com>
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
head:   2eb609d2f89b2d85d89cb018c3f97050989807e2
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1646/1646] dhugetlb: backport dynamic hugetlb feature
config: arm64-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201910.3QGTFYPj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201910.3QGTFYPj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201910.3QGTFYPj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:1370:6: warning: no previous prototype for 'free_huge_page_to_dhugetlb_pool' [-Wmissing-prototypes]
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
