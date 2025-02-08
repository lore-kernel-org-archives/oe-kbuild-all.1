Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE31A3150
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026874; cv=none; b=VNT5vkqMJIrmMYr8+w8H63m0u+bRDZhnkZeqoLuPmJyj7rKH5XPUINDVxffLUXiJtUuTjExuIggS9eTKwC1KrzL3NcUbkoCzJKCzkif/LpoQZSo0cgdhSHLniBm6V3doAv4I9cKVzuaQfHJzavjkIeU2M3HtIKGrSlK3XIC7DrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026874; c=relaxed/simple;
	bh=37Tx7i0DzDkM/JZfMDMtFS0TsxLczoUOLfefzJlWXTM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dn2JHMY7WE69CuOUWYEaUPPlztrbSYibXpRRejJQpEb5bgr2yM/SzRQfYTmmitqT21x7t3mMa2SbH33M7mciIvdtVbKkUksGuXSLgsbXVtrHfZk1QoPkDbXSavZBRGDjcR4hnaoX0aMc4dRsmS/2lptIbyM5G5V3TGmHl3tzGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Djn7fIkt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Djn7fIkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026871; x=1770562871;
  h=date:from:cc:subject:message-id:mime-version;
  bh=37Tx7i0DzDkM/JZfMDMtFS0TsxLczoUOLfefzJlWXTM=;
  b=Djn7fIktGQ3CpkEIEAi7ZSqEB9OXw77B/grFY9vXD4bMJBYz9jPc9dhy
   gIDfbR3SHo95lgHBenyrIQJJ28QTaTi+inESiC2CIdmFEm3GcNswv/f/r
   2IT0+wgR4dBxy7fkVPwIO1gK53oUBC0MOTYwfoCn8ffn+hLEwhT8k/zwV
   nnM82E7nG1QxXELdfYywgvfi7cgJDAQZEdOd7u4kaJeX8agjcCXBkXxJL
   7g5X9+GkPnJvisMCUNLUZakAIdEbFhE8tIAEXrMiDZOQxSJcup1hI4xFo
   M+lXyvLQ/qH77WcCK3lGby6T/UO/sT+oXQmyV6EIoMnDGQqYgc662ilf+
   g==;
X-CSE-ConnectionGUID: wwETpRepQvyONQPpl9+Q4w==
X-CSE-MsgGUID: Ase/9gtPTMqz/R04Lch78Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43420793"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43420793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:01:11 -0800
X-CSE-ConnectionGUID: 90Bs+PZSQZmftuwYcb+weQ==
X-CSE-MsgGUID: xSJ1iv5HSvuUtx+1+8QHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116726459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2025 07:01:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmKQ-00109R-2T
	for oe-kbuild-all@lists.linux.dev;
	Sat, 08 Feb 2025 15:01:06 +0000
Date: Sat, 8 Feb 2025 23:00:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2732/2732] mm/mem_reliable.c:195:45: warning:
 arithmetic between different enumeration types ('enum node_stat_item' and
 'enum lru_list')
Message-ID: <202502082204.WShjoZst-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   263072f655dcd6fd63f7d5dd1f9c5553134982fa
commit: 714b582e1796fefd9d81f83fdc12a56390af1a99 [2732/2732] mm: Enable reliable memory for x86 platform
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250208/202502082204.WShjoZst-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082204.WShjoZst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082204.WShjoZst-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mem_reliable.c:5:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
>> mm/mem_reliable.c:195:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     195 |                 num += global_node_page_state(NR_LRU_BASE + LRU_ACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   mm/mem_reliable.c:196:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     196 |                 num += global_node_page_state(NR_LRU_BASE + LRU_INACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:461:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     461 |                 num += global_node_page_state(NR_LRU_BASE + LRU_ACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   mm/mem_reliable.c:462:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     462 |                 num += global_node_page_state(NR_LRU_BASE + LRU_INACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   9 warnings generated.


vim +195 mm/mem_reliable.c

5baa7afdb688fc Ma Wupeng     2022-11-11  174  
9e47d0cc01a313 Ma Wupeng     2022-02-23  175  void reliable_report_meminfo(struct seq_file *m)
9e47d0cc01a313 Ma Wupeng     2022-02-23  176  {
9e47d0cc01a313 Ma Wupeng     2022-02-23  177  	if (!mem_reliable_is_enabled())
9e47d0cc01a313 Ma Wupeng     2022-02-23  178  		return;
9e47d0cc01a313 Ma Wupeng     2022-02-23  179  
4623cc86dab254 Ma Wupeng     2022-11-11  180  	show_val_kb(m, "ReliableTotal:    ", total_reliable_pages());
4623cc86dab254 Ma Wupeng     2022-11-11  181  	show_val_kb(m, "ReliableUsed:     ", used_reliable_pages());
d81e9624de2104 Peng Wu       2022-11-11  182  	show_val_kb(m, "ReliableTaskUsed: ", task_reliable_used_pages());
4623cc86dab254 Ma Wupeng     2022-11-11  183  	show_val_kb(m, "ReliableBuddyMem: ", free_reliable_pages());
ccad5e7a0a77cd Chen Wandun   2022-11-11  184  
32be46d7e9d4a8 Zhou Guanghui 2022-11-11  185  	if (shmem_reliable_is_enabled()) {
32be46d7e9d4a8 Zhou Guanghui 2022-11-11  186  		unsigned long shmem_pages = (unsigned long)percpu_counter_sum(
32be46d7e9d4a8 Zhou Guanghui 2022-11-11  187  			&reliable_shmem_used_nr_page);
32be46d7e9d4a8 Zhou Guanghui 2022-11-11  188  		show_val_kb(m, "ReliableShmem:    ", shmem_pages);
32be46d7e9d4a8 Zhou Guanghui 2022-11-11  189  	}
32be46d7e9d4a8 Zhou Guanghui 2022-11-11  190  
ccad5e7a0a77cd Chen Wandun   2022-11-11  191  	if (pagecache_reliable_is_enabled()) {
6e6cf0d7d67425 Chen Wandun   2022-11-11  192  		s64 nr_pagecache_pages = 0;
ccad5e7a0a77cd Chen Wandun   2022-11-11  193  		unsigned long num = 0;
ccad5e7a0a77cd Chen Wandun   2022-11-11  194  
ccad5e7a0a77cd Chen Wandun   2022-11-11 @195  		num += global_node_page_state(NR_LRU_BASE + LRU_ACTIVE_FILE);
ccad5e7a0a77cd Chen Wandun   2022-11-11  196  		num += global_node_page_state(NR_LRU_BASE + LRU_INACTIVE_FILE);
ccad5e7a0a77cd Chen Wandun   2022-11-11  197  		show_val_kb(m, "FileCache:        ", num);
6e6cf0d7d67425 Chen Wandun   2022-11-11  198  
6e6cf0d7d67425 Chen Wandun   2022-11-11  199  		nr_pagecache_pages =
6e6cf0d7d67425 Chen Wandun   2022-11-11  200  			percpu_counter_sum_positive(&pagecache_reliable_pages);
6e6cf0d7d67425 Chen Wandun   2022-11-11  201  		seq_printf(m, "ReliableFileCache: %8llu kB\n",
6e6cf0d7d67425 Chen Wandun   2022-11-11  202  			   nr_pagecache_pages << (PAGE_SHIFT - 10));
6e6cf0d7d67425 Chen Wandun   2022-11-11  203  	}
ccad5e7a0a77cd Chen Wandun   2022-11-11  204  }
6e6cf0d7d67425 Chen Wandun   2022-11-11  205  

:::::: The code at line 195 was first introduced by commit
:::::: ccad5e7a0a77cd30b08dc5d232674d5a68966889 proc/meminfo: Add "FileCache" item in /proc/meminfo

:::::: TO: Chen Wandun <chenwandun@huawei.com>
:::::: CC: Wang Wensheng <wangwensheng4@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
