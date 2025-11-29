Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D7248166
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764441808; cv=none; b=HFyhh8HMoxq0SEUFNOpQBA3C2AIvZiQymRTl7ljwL7OLwXQgAR5/UTlOE6zjwl9/48Uqw48LSgFo5h3DE7EP/46+sDHnZm0D8L3G4IqdaCrGLrRRdb1hJHGCjw4HH8xDBCg7FKzshYRBJq1lbliqsia77elqbgJ3LssM6Ad686s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764441808; c=relaxed/simple;
	bh=oV3YLw9AkGTqn7FIx5qQVjoOILJCg7BtBberrQc9+OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWjDJBjUMzrdKQOFqD2uR6IHKPA+eKDUzrsN/MPHYw3uP2jcefbOj4M8OliAZK9lpEK7hq83xW9MyeoZdBoF2/brnT4e+lywtOuolAPqaNdxOeLa6Ap6OyXyYaFAYBBVlMLAq+9l4HqKObm/R7ZntoKLg+cb5scYx1eTnzn6UHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B83vaukT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B83vaukT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764441806; x=1795977806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oV3YLw9AkGTqn7FIx5qQVjoOILJCg7BtBberrQc9+OQ=;
  b=B83vaukTsFGs9xk9mRnixUgdCFySfEQ4sbXggpdlyiLCzdKGG0aEYfEj
   Ivu4DRk1fpOTvpCMKXN/5pQGH5eXkq3z4LNtEo3CI3J9yMyUjN27DH+hk
   UuPgu2X0x5G0DQ9lqt71aYQ2X/uV825D1YhFqP11UsyDO4IycQhVOl5tU
   S/r2qpya25T6bPGd8Umfb4cyMH3xIxEjGt4HAyF0vpYQOxgCD1iXDUTnO
   d8VwOs0XfEk676TXm7Tu1SipLmKowNjKZMDhWJfnlT/25qaVGxeBrPLq1
   YeKGHDqDM0mhmT7c7iNs0DQWOVanLKvU08p1qj2cmGQWgY3tNRDu0QvBl
   g==;
X-CSE-ConnectionGUID: AoPooI0fSE+CqOzKJ8UegA==
X-CSE-MsgGUID: /ZFg9W/jS32+qAxCyVGs0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66389828"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="66389828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 10:43:25 -0800
X-CSE-ConnectionGUID: TlAEn98lSvOPcxdEii9fyA==
X-CSE-MsgGUID: E7cUoXVLRdCQNevbNpsY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="193366818"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Nov 2025 10:43:24 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPPuk-000000007T3-0yh9;
	Sat, 29 Nov 2025 18:43:22 +0000
Date: Sun, 30 Nov 2025 02:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/hugetlb.c:1370:6:
 warning: no previous prototype for function
 'free_huge_page_to_dhugetlb_pool'
Message-ID: <202511300245.MJmB71tp-lkp@intel.com>
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
head:   d495515f012a96ae472e8ee75c66680fbdabaddb
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1418/1418] dhugetlb: backport dynamic hugetlb feature
config: x86_64-buildonly-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20251130/202511300245.MJmB71tp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511300245.MJmB71tp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511300245.MJmB71tp-lkp@intel.com/

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
