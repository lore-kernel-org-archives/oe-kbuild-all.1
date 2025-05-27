Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A395F2080C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748377591; cv=none; b=BopR1b145iVgEKp4CFShj2X6ebkAkjFJpYVof2+kGg1Z99by6iHzav4YM0Z/LnxpnY+DtFduregn/hSowBEEhP5xTNoDKyXQF+i799qVXn8s1RbWf8dQ5eN4I6flYKd33nFsxTwnHajhFkOqrZPoZUMWClkpmKISClFhKTxhTl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748377591; c=relaxed/simple;
	bh=8CG+PHQEh4c2/EpbZEOK9m4qbKKFSHvQq+O93/wgoi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QiCTlfN7DxQ31aKmmdQ3AdI9+KEVbPfGt1gHfPMHwPprDgCdctsJuc425zuTG8HeZ8NSeVG9u0MscUZ1PqtT30gukPxNXHjL9UumCa4GMXp0R6u3lUw5N6UZiaMJJgkpG6igP3In1GvyKKO83F2DvbReSLoSIj40POtuKKeMH0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4PJpSWA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4PJpSWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748377589; x=1779913589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8CG+PHQEh4c2/EpbZEOK9m4qbKKFSHvQq+O93/wgoi4=;
  b=d4PJpSWACJXaWZWJpvSsXOVZtKjIEU8It149kqqVrniUZzIV04q7YSqw
   5vdk/7lxWMYBe4XRFLQ/SqJ3cfbD0C5uoiDZP3/NsMTceqnh4JizwIQ4X
   5sn8i09Jc+6JRCNtQscp3PKRn9ZrVgJQxnda8K6CXCE4jn1fDMQi1CTSw
   X55ZB/8EFyN8+4GaLQveoJrZkaXeka7TBAjxHad5WhkphvFZ4ha/WiCPb
   r2J/6rxN1gOHO16acMSH0wq+gSsqbmhYmVetSbyBbtPWhTyNgHHdLeR5r
   KpANc1cP2gz1S+/dLIigIrF3kLJdok2e56a/8y8SEMEPm4GQ78sFAsYUO
   g==;
X-CSE-ConnectionGUID: 2am4hN6tTyqRmUvNTFrmPQ==
X-CSE-MsgGUID: W/CdGC/WSKKJGgb1FHgqIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61014331"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61014331"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 13:26:29 -0700
X-CSE-ConnectionGUID: W+58IVUCSmWFluVniI8dRA==
X-CSE-MsgGUID: fukAo+GoS46j2LhbRu5cEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143579816"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 May 2025 13:26:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK0sT-000Uz8-1V;
	Tue, 27 May 2025 20:26:25 +0000
Date: Wed, 28 May 2025 04:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2304/2304] mm/share_pool.c:1468:7: warning:
 variable 'is_hugepage' set but not used
Message-ID: <202505280443.W5j7eO4Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   35c5792a71f249ce79eba3cbb546d1ece7c4f3ee
commit: eaafc4a2a3fd023a99c44286895074dd5712706f [2304/2304] mm/sharepool: Implement mg_sp_unshare_kva
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280443.W5j7eO4Y-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280443.W5j7eO4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280443.W5j7eO4Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/share_pool.c:21:
   In file included from include/linux/share_pool.h:5:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2174:
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
>> mm/share_pool.c:1468:7: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    1468 |         bool is_hugepage = true;
         |              ^
   mm/share_pool.c:73:12: warning: unused variable 'system_group_count' [-Wunused-variable]
      73 | static int system_group_count;
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:76:19: warning: unused variable 'sp_group_idr' [-Wunused-variable]
      76 | static DEFINE_IDR(sp_group_idr);
         |                   ^~~~~~~~~~~~
   include/linux/idr.h:56:37: note: expanded from macro 'DEFINE_IDR'
      56 | #define DEFINE_IDR(name)        struct idr name = IDR_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:223:20: warning: unused function 'sp_add_group_master' [-Wunused-function]
     223 | static inline void sp_add_group_master(struct sp_group_master *master)
         |                    ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:230:20: warning: unused function 'sp_del_group_master' [-Wunused-function]
     230 | static inline void sp_del_group_master(struct sp_group_master *master)
         |                    ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:237:13: warning: unused function 'meminfo_init' [-Wunused-function]
     237 | static void meminfo_init(struct sp_meminfo *meminfo)
         |             ^~~~~~~~~~~~
   mm/share_pool.c:274:20: warning: unused function 'meminfo_alloc_sum_byKB' [-Wunused-function]
     274 | static inline long meminfo_alloc_sum_byKB(struct sp_meminfo *meminfo)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:279:20: warning: unused function 'meminfo_k2u_size' [-Wunused-function]
     279 | static inline long meminfo_k2u_size(struct sp_meminfo *meminfo)
         |                    ^~~~~~~~~~~~~~~~
   mm/share_pool.c:284:25: warning: unused function 'meminfo_total_size' [-Wunused-function]
     284 | static inline long long meminfo_total_size(struct sp_meminfo *meminfo)
         |                         ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:380:13: warning: unused function 'sp_mapping_detach' [-Wunused-function]
     380 | static void sp_mapping_detach(struct sp_group *spg, struct sp_mapping *spm)
         |             ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:438:12: warning: unused function 'sp_group_setup_mapping_normal' [-Wunused-function]
     438 | static int sp_group_setup_mapping_normal(struct mm_struct *mm, struct sp_group *spg)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:485:13: warning: unused function 'update_mem_usage_alloc' [-Wunused-function]
     485 | static void update_mem_usage_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:497:13: warning: unused function 'update_mem_usage_k2u' [-Wunused-function]
     497 | static void update_mem_usage_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:582:22: warning: unused function 'spa_size' [-Wunused-function]
     582 | static unsigned long spa_size(struct sp_area *spa)
         |                      ^~~~~~~~
   mm/share_pool.c:587:21: warning: unused function 'spa_file' [-Wunused-function]
     587 | static struct file *spa_file(struct sp_area *spa)
         |                     ^~~~~~~~
   mm/share_pool.c:791:24: warning: unused function 'sp_area_alloc' [-Wunused-function]
     791 | static struct sp_area *sp_area_alloc(unsigned long size, unsigned long flags,
         |                        ^~~~~~~~~~~~~
   mm/share_pool.c:944:24: warning: unused function 'sp_area_get' [-Wunused-function]
     944 | static struct sp_area *sp_area_get(struct sp_group *spg,
         |                        ^~~~~~~~~~~
   mm/share_pool.c:1005:13: warning: unused function 'sp_area_put_locked' [-Wunused-function]
    1005 | static void sp_area_put_locked(struct sp_area *spa)
         |             ^~~~~~~~~~~~~~~~~~
   23 warnings generated.


vim +/is_hugepage +1468 mm/share_pool.c

  1460	
  1461	/* No possible concurrent protection, take care when use */
  1462	static int sp_unshare_kva(unsigned long kva, unsigned long size)
  1463	{
  1464		unsigned long addr, kva_aligned;
  1465		struct page *page;
  1466		unsigned long size_aligned;
  1467		unsigned long step;
> 1468		bool is_hugepage = true;
  1469		int ret;
  1470	
  1471		ret = is_vmap_hugepage(kva);
  1472		if (ret > 0) {
  1473			kva_aligned = ALIGN_DOWN(kva, PMD_SIZE);
  1474			size_aligned = ALIGN(kva + size, PMD_SIZE) - kva_aligned;
  1475			step = PMD_SIZE;
  1476		} else if (ret == 0) {
  1477			kva_aligned = ALIGN_DOWN(kva, PAGE_SIZE);
  1478			size_aligned = ALIGN(kva + size, PAGE_SIZE) - kva_aligned;
  1479			step = PAGE_SIZE;
  1480			is_hugepage = false;
  1481		} else {
  1482			pr_err_ratelimited("check vmap hugepage failed %d\n", ret);
  1483			return -EINVAL;
  1484		}
  1485	
  1486		if (kva_aligned + size_aligned < kva_aligned) {
  1487			pr_err_ratelimited("overflow happened in unshare kva\n");
  1488			return -EINVAL;
  1489		}
  1490	
  1491		for (addr = kva_aligned; addr < (kva_aligned + size_aligned); addr += step) {
  1492			page = vmalloc_to_page((void *)addr);
  1493			if (page)
  1494				put_page(page);
  1495			else
  1496				WARN(1, "vmalloc %pK to page/hugepage failed\n",
  1497				       (void *)addr);
  1498		}
  1499	
  1500		vunmap((void *)kva_aligned);
  1501	
  1502		return 0;
  1503	}
  1504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
