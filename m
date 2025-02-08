Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24321991BF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026275; cv=none; b=N96RRV7kYSfC6Uv2E9811qn7qNavs5kiOqlRhL8m36zc6JuVHSSF/6aiUkt1XuFfAAuuvpxmKDNpc9ynxF7YduY1G6LjnDzH54xS/Pp6yORVxY6pmbvYptK9CASSumUOafWbY11Q04pOPqA5Q11NOwGa1vNP/pCvnPAvVWxZmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026275; c=relaxed/simple;
	bh=LATVPWHylZL5H9vPiOqPV2pxoWJnTLYQFDQzmGpEvB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbNIaLNL6W0jgq607n1T/dhDy+7c873DmPLzjxpz0UUdwJkljazvyKpzheZJffvNmqZdltIqnngcrk+7gSWjLpt6/CqslDKTvkE47fkv8VB4YWyDLHOXzitd/GfWvWuEak2d3AbcVkusyOsjwnu+uS/UVnC+KsZFRiCo6WPAAoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Di+w6IrM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Di+w6IrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026274; x=1770562274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LATVPWHylZL5H9vPiOqPV2pxoWJnTLYQFDQzmGpEvB8=;
  b=Di+w6IrMqkKD8rjOEaodJ1vbwthcIw3e7lB2kZkiwnMneXRt9lcUN6Bw
   Gv/SEvEvqh6hL58BaKnYxxAZqSmpTmqBuFhzSXlpLriYAhKxptPVBdw+/
   xCZZSjuQ390brmeoUnTOLDrhWdl/aW3b4t1q5bn4E4yiggL65LeLeWCgI
   Tlipaybzf4lePGtKpp6KL1pJ0JruotZb2GRBniQ/ow5o8Q29eTKWLniCD
   /xSB6aMLG6Gafo/n5EE197ttejj6Oaf4DwJQhUwNDNTF/hEYV7MpOvSfc
   TjUIMHLoIsZnhiRkil4sTyPRSO4PdMZ+YroNusjK1hPP8uXqc/PfssmWQ
   w==;
X-CSE-ConnectionGUID: QQ3xgNbLQVK6NI18gkM6Aw==
X-CSE-MsgGUID: TQEQx+zcSpSPvybYvlSUjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39548048"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39548048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 06:51:09 -0800
X-CSE-ConnectionGUID: E3oaHpPFREWhGy12lx7HFA==
X-CSE-MsgGUID: G7Ef3vxoQyGuue0h2zSqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111616102"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 06:51:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmAj-001085-0z;
	Sat, 08 Feb 2025 14:51:05 +0000
Date: Sat, 8 Feb 2025 22:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/hugetlb.c:1370:6:
 warning: no previous prototype for function
 'free_huge_page_to_dhugetlb_pool'
Message-ID: <202502082245.oXwKH6sI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1418/1418] dhugetlb: backport dynamic hugetlb feature
config: x86_64-buildonly-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082245.oXwKH6sI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082245.oXwKH6sI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082245.oXwKH6sI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/hugetlb.c:13:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/hugetlb.c:35:
   include/linux/mm_inline.h:33:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      33 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:35:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      35 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
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
   5 warnings generated.


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
