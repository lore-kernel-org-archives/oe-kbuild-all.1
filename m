Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08146B3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709251978; cv=none; b=D751s99S4SETldBA5UWh5Xfw5aHeByPnX9xWzu10U1sGsyEhoy1uMeVtRUKBW0v04LgI660cVcNzu+Xr1M/v1G1ysNs52Z/+n6d+cj0QE0LgMM+OmR1nzyANXmjhkEcKt79tLuYkQ7OPQYDAt2dNkEUQEPEALJR3orlyRjIiER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709251978; c=relaxed/simple;
	bh=ILxh08KIJ4Xf+W7gzsIPoYHgmLg4p9N6EWKBKH0tP5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTzvfTfR7QOegFh45AFatSnzNfBIFMZW/y2WKPjNaVGhyh919nfEn0/FYVnEC6VpjL+Smc4p2BDLAb3a+kgasjpxKp2qEQoLPdYFQmor93ZIEkzsFTPtDtRqXgjnsBG2ieuo1tjstXTFLMw43wZlUVaRzZm01rYrcAJLy29LnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyim5vcH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyim5vcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709251975; x=1740787975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILxh08KIJ4Xf+W7gzsIPoYHgmLg4p9N6EWKBKH0tP5g=;
  b=dyim5vcHn/YE7TZg40swJXWF2pECQF41R5LIu5ajX50DFkRgTbeoeNsj
   LJWonf/ysFWY8fAeDlEjP6ra63n5xyOQCGNO0Q/kEoO1qN+kC+BSZBvEJ
   9r4TNSVB+pqkkwNU4bgdNqnRb+WGuaBf3wAyYrYHbpN7Rhy0D37JafjZy
   h0mB8WuDXe/+1cO09mqchoh0/eEcroek1o8u5JwFX+EzvkIOe6uY2D9Lr
   E40Gvi7HYxnkGzMMyzcC9Moad9/BoZ9kf8M8Fc9kY2TCUX0JFyaOat0h2
   dH/dBOuLSf5/dBUL7axpUWexViV1jqEwPDOneiEmB/n6xcxouqVvvPXJs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3621898"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3621898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 16:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12554853"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Feb 2024 16:12:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfqW1-000DNP-24;
	Fri, 01 Mar 2024 00:12:48 +0000
Date: Fri, 1 Mar 2024 08:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2409/3684] mm/mem_reliable.c:159:45: warning:
 arithmetic between different enumeration types ('enum node_stat_item' and
 'enum lru_list')
Message-ID: <202403010836.kBJY9HM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3016126ef302b602feaa8a7b99e4f85987536d65
commit: e1767ef2184b4a3d188596e2217e62fe757f07b3 [2409/3684] mm: mem_reliable: Show reliable meminfo
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010836.kBJY9HM4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010836.kBJY9HM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010836.kBJY9HM4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mem_reliable.c:5:
   In file included from include/linux/mm.h:2181:
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
>> mm/mem_reliable.c:159:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     159 |                 num += global_node_page_state(NR_LRU_BASE + LRU_ACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   mm/mem_reliable.c:160:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     160 |                 num += global_node_page_state(NR_LRU_BASE + LRU_INACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +159 mm/mem_reliable.c

   133	
   134	void reliable_report_meminfo(struct seq_file *m)
   135	{
   136		if (!mem_reliable_is_enabled())
   137			return;
   138	
   139		seq_printf(m, "ReliableTotal:    %8lu kB\n",
   140			   PAGES_TO_KB(total_reliable_pages()));
   141		seq_printf(m, "ReliableUsed:     %8lu kB\n",
   142			   PAGES_TO_KB(used_reliable_pages()));
   143		seq_printf(m, "ReliableTaskUsed: %8lu kB\n",
   144			   PAGES_TO_KB(task_reliable_used_pages()));
   145		seq_printf(m, "ReliableBuddyMem: %8lu kB\n",
   146			   PAGES_TO_KB(free_reliable_pages()));
   147	
   148		if (shmem_reliable_is_enabled()) {
   149			unsigned long shmem_pages = (unsigned long)percpu_counter_sum(
   150				&shmem_reliable_pages);
   151			seq_printf(m, "ReliableShmem:    %8lu kB\n",
   152				   PAGES_TO_KB(shmem_pages));
   153		}
   154	
   155		if (filemap_reliable_is_enabled()) {
   156			unsigned long nr_reliable_pages = 0;
   157			unsigned long num = 0;
   158	
 > 159			num += global_node_page_state(NR_LRU_BASE + LRU_ACTIVE_FILE);
   160			num += global_node_page_state(NR_LRU_BASE + LRU_INACTIVE_FILE);
   161			seq_printf(m, "FileCache:        %8lu kB\n", PAGES_TO_KB(num));
   162	
   163			nr_reliable_pages =
   164				percpu_counter_sum_positive(&pagecache_reliable_pages);
   165			seq_printf(m, "ReliableFileCache: %8lu kB\n",
   166				   PAGES_TO_KB(nr_reliable_pages));
   167		}
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
