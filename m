Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24883FCC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765660659; cv=none; b=QzDZTX32kaH5Ut7fHlLXdnPg4fsQwIWWZtKeHM70o10oBJJkb9RPLx3Dz0whys726yfDc3WuZRMhY7mnZSLJGJGVLykGELAQU4kpLtzK8RdC5fL83tM7l69H20RbJr044v+Toy74gLi7nAWKYtxrWis+ojxXHR9RuGhfwboMwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765660659; c=relaxed/simple;
	bh=anUHfnY1Bl50uNsyE/Wd55/Emg7f1Lk7ZoTm4L7z7xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AhOEooaw7n6F/U0yvRWLI8XtRfr2ogutfCCtnF3ZJVKwb0Yjp1rqcbHC5Nh1FgFcz3AKlbldXoFZj9iZ+o04KXUqXnvXI/VAsafmrPFGfVaKZo5brhY4O6t2uJrdzd9mrmlB78FflljXySIQ8kVo0aFMisxbqnOvrKv9O8k4f1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPgQVJ7/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPgQVJ7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765660658; x=1797196658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anUHfnY1Bl50uNsyE/Wd55/Emg7f1Lk7ZoTm4L7z7xg=;
  b=lPgQVJ7/POsJv2RSTZtHr9I7p7y51d2/0s8HZ6Rb3MdWH7JGeKI+d+gX
   h4ZNKgW2nZ1IGuIFHUPK8CWfvbzsCwwMgkk5iy7hWxj9sjkousj1h9LdZ
   4pATGdAoGeQaf/b+JE7YKuz2afgVVHADQHV5Wf/+4x8vuCu9fCP3iIDMp
   8WLBbyS1GdWqdBM43yBnuZ/u05MxgKbJp6SDDfpToI0zcXFkoVc0vb7IP
   WAYjFrwrDAyRc8DT1gjPLF9FNkKFYypVeApUbOD1m5N0nlQhDb+R4/zKQ
   Sc4BauLATS9DG6YCeA1q44BQEWitxCI+9aRPWV1oxuIqCUrYLO9TmfuiL
   g==;
X-CSE-ConnectionGUID: i6wBKZTJRBSQC3YX+Efpww==
X-CSE-MsgGUID: HTLOhutYRZWoqpD+Zzp4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67582921"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67582921"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 13:17:38 -0800
X-CSE-ConnectionGUID: +Gpou0CRSlSdUVaCOTtjew==
X-CSE-MsgGUID: wGwnq4+jRAeoAkFzi/Er+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201560539"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 13:17:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUWzd-000000002BE-2ufP;
	Sat, 13 Dec 2025 21:17:33 +0000
Date: Sat, 13 Dec 2025 22:16:34 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] mm/hugetlb.c:1370:6:
 warning: no previous prototype for 'free_huge_page_to_dhugetlb_pool'
Message-ID: <202512132206.SiQCfPUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1941/1941] dhugetlb: backport dynamic hugetlb feature
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512132206.SiQCfPUr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132206.SiQCfPUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132206.SiQCfPUr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:1370:6: warning: no previous prototype for 'free_huge_page_to_dhugetlb_pool' [-Wmissing-prototypes]
    1370 | void free_huge_page_to_dhugetlb_pool(struct page *page, bool restore_reserve)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> mm/memcontrol.c:5008:6: warning: no previous prototype for 'dhugetlb_pool_is_free' [-Wmissing-prototypes]
    5008 | bool dhugetlb_pool_is_free(struct cgroup_subsys_state *css)
         |      ^~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6718: warning: bad line:                | 0, otherwise.


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
