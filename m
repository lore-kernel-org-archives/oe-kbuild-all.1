Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A92220F29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766657174; cv=none; b=ofWiYZCCaA5WT45Nusk/f4YllxOLwNZI7UHOflNNTgxDLWta+AERrRe35SLEOr1Z9msHVSYxRRl00Vi6HP7XUHgKkBJ1YTZdda4va9aUwkDjhlA6a7F0jgVTaLsLWxx8fuUJZeGfxXjKinaMVyL3rHyzXsjfnfKfG7tg6Hv1nxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766657174; c=relaxed/simple;
	bh=H0NygtXnq+bniv8ZdhTozUo6vuQ3HnfVdPixLMRBiE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DFBe9GMWOdVIQRuB/KMHv6eUOjTql/8uQu90QGM85ZD78/5/q+bQV3ICpc4dm5TjciNmsozh7RzVx7O4MyMHdVsuWyV5AZxfrafIpxFIamrHxHakd4VJ9ByyToC8H5Up6UYqyHnAe8wH6foJWtCt9BOZWivW3uO4kZ10kUvwpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzY36vUQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzY36vUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766657172; x=1798193172;
  h=date:from:to:cc:subject:message-id;
  bh=H0NygtXnq+bniv8ZdhTozUo6vuQ3HnfVdPixLMRBiE4=;
  b=FzY36vUQk4KSB14th0/apu6O2bJlIBMsRQDpNR6cgXp1Hp3ULwcRVaiX
   p+m6vT1DxbnzWUvgLD8ZnaPkx286CyLKdThD/zDFgj3xqWdG+/C/ynViH
   CrV1BB97h6LDygPnBn5BjPSslyOrHHNdxD9Ij0liAyxibzYFruR8weTcH
   yS/kBUPI/O0+BWTxMjH8JDmGSHZo5+Yu5tmT/HIfdWhIAGCQPSxVNyxhD
   Ef76ieK8WcqUHIFA8NJvjT5zTBf9ckFJAMMIBxa3qWOUZoVXKcicC+8lu
   0dBogryCUNLN1yJ7G0CrC3LInEa51haUxgv24Ew5PESCRu76gWkOoszuW
   g==;
X-CSE-ConnectionGUID: 9aj/+gEBRgmeVFNJnb7sYg==
X-CSE-MsgGUID: CtXZTgBXQSe4uyGSlJi6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68347605"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68347605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 02:06:10 -0800
X-CSE-ConnectionGUID: S+8xDWAmRZqW7kW+aBZCrA==
X-CSE-MsgGUID: u89QrCtNSAKVA9UKoLOYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="199940658"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Dec 2025 02:06:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYiEL-000000003y5-2ZwS;
	Thu, 25 Dec 2025 10:06:03 +0000
Date: Thu, 25 Dec 2025 18:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10/10] mm/page_cache_limit.c:94:5:
 warning: no previous prototype for function
 'cache_limit_mbytes_sysctl_handler'
Message-ID: <202512251734.Tln5GDz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   610575a82bdf3c3be06ce9559609d5bfa65472e8
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [10/10] mm: support pagecache limit
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251225/202512251734.Tln5GDz4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251734.Tln5GDz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251734.Tln5GDz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_cache_limit.c:6:
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
   mm/page_cache_limit.c:61:5: warning: no previous prototype for function 'cache_reclaim_enable_handler' [-Wmissing-prototypes]
      61 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      61 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         | ^
         | static 
   mm/page_cache_limit.c:77:5: warning: no previous prototype for function 'cache_reclaim_sysctl_handler' [-Wmissing-prototypes]
      77 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         | ^
         | static 
>> mm/page_cache_limit.c:94:5: warning: no previous prototype for function 'cache_limit_mbytes_sysctl_handler' [-Wmissing-prototypes]
      94 | int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:94:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      94 | int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
         | ^
         | static 
   8 warnings generated.


vim +/cache_limit_mbytes_sysctl_handler +94 mm/page_cache_limit.c

    93	
  > 94	int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
    95			void __user *buffer, size_t *length, loff_t *ppos)
    96	{
    97		int ret;
    98		unsigned long vm_cache_limit_mbytes_max;
    99		unsigned long origin_mbytes = vm_cache_limit_mbytes;
   100		int nr_retries = MAX_RECLAIM_RETRIES;
   101	
   102		vm_cache_limit_mbytes_max = totalram_pages() >> (20 - PAGE_SHIFT);
   103		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   104		if (ret || !write)
   105			return ret;
   106	
   107		if (vm_cache_limit_mbytes > vm_cache_limit_mbytes_max) {
   108			vm_cache_limit_mbytes = origin_mbytes;
   109			return -EINVAL;
   110		}
   111	
   112		if (write) {
   113			while (should_reclaim_page_cache() && page_cache_over_limit() &&
   114					nr_retries--) {
   115				if (signal_pending(current))
   116					return -EINTR;
   117	
   118				shrink_memory(node_reclaim_num(), false);
   119			}
   120		}
   121	
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
