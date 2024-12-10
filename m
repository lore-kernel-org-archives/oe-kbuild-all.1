Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457E19E833
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 03:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733799755; cv=none; b=Ug0jRUmwieeAw1ZFG06+tVcMwp9vTfMVjSBRx5LWSb61jPMZPHNpyjI9PEqtgrrYzQ+eybPRcU8mziDCihPK9LPPf+gSaboVUALg+yGWzUqtGM1rmBFS7jbGzC3Lw5k3CiodAeqR8LJflI1KyGDzwstsWA5IN5snlfmA8+oLUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733799755; c=relaxed/simple;
	bh=yaCNwTOJ0zHGnIsj/fV2ElonnyTis2IKag7oMhK+cPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AncaxXSCavntCVoVsThIbzXVzEmGF8NV9nYKiGcHwe01fHHllz8pWscV0zQ4SU4arxJXsnCsUl1Q0YWVeoMgwRj5nUQsjMd/1tWzo3bP61XnhkWXUbgC32EmqiF52DlNR1saOJWAlShWz8ujqg3b8j7jpqTizcYgZMcG6cCh970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyKvGqCv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyKvGqCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733799753; x=1765335753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yaCNwTOJ0zHGnIsj/fV2ElonnyTis2IKag7oMhK+cPk=;
  b=IyKvGqCvxx0tuQ5DYfyLXS1vJI//NLU5sw6C91Y3EUDSo9XfxAtVnpVi
   qxNvFWV07tqRE3HayJiwwV8W1BOFllS2rr9h/xHSQnGpj8RhDG1zY3DUJ
   YxuTwMHqdJhEQK1dfkKUFllmb+TWAqvQhaAjnlxa7XpBpuaW/jPi6cuwY
   0f8ei5gcgwQ5nMwMKdnmqEZ51wD5awgkLna57hIjupIzkpmSBFaGa1Zsq
   NkxQlUaMLpx9N6pOqBGQ+YxiO6eIUfrSWKOTFA4F1oqwsBgyiqIrmGhTm
   4hTjKhuipccnf7Mj6wIeZGn2GWxiCP2/7LXrHk4YhCXAsd2cD3Plvk9sT
   w==;
X-CSE-ConnectionGUID: vGUABc7GQGGPNo6jbXmH+g==
X-CSE-MsgGUID: pgLW7yE0S1WqIMwlmbBxng==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="38056743"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="38056743"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 19:02:33 -0800
X-CSE-ConnectionGUID: F7KeN+gkQyi+v0WZ22tNtw==
X-CSE-MsgGUID: AP9/RMKISCukmaZKf4+01Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95080843"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2024 19:02:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKqW4-00052r-32;
	Tue, 10 Dec 2024 03:02:28 +0000
Date: Tue, 10 Dec 2024 10:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1610/1610]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:3: error: a
 randomized struct can only be initialized with a designated initializer
Message-ID: <202412101054.7uczAWCS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shuai,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [1610/1610] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241210/202412101054.7uczAWCS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101054.7uczAWCS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101054.7uczAWCS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:3: error: a randomized struct can only be initialized with a designated initializer
     371 |         {check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:3: error: a randomized struct can only be initialized with a designated initializer
     372 |         {check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:3: error: a randomized struct can only be initialized with a designated initializer
     376 |         {check_use_non_vram, cqm_buf_free_page_common}
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:382:25: error: invalid application of 'sizeof' to an incomplete type 'const struct malloc_memory[]'
     382 |         u32 malloc_funcs_num = ARRAY_SIZE(g_malloc_funcs);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:399:23: error: invalid application of 'sizeof' to an incomplete type 'const struct free_memory[]'
     399 |         u32 free_funcs_num = ARRAY_SIZE(g_free_funcs);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   5 warnings and 5 errors generated.


vim +371 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c

   369	
   370	static const struct malloc_memory g_malloc_funcs[] = {
 > 371		{check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
   372		{check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
   373	};
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
