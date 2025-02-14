Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A0143AB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739541986; cv=none; b=BxPEhi5Ms2uI5VVzXp+WVniaX05WmLZ+e7bOmDwW74xHxeqS+Tu7scz221S/HkU91p2HZEozhxKXcHFoeN6ne/Ioq71rpKutc53EnD+AFzTtc/wBnejjMYKc3kkAtKIL2uSAEPEpSUWiJYbXzY6Br01i+HSPH1yfdad4Pk+m0XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739541986; c=relaxed/simple;
	bh=JfJ/weh2trsLPujvkWU1vNIyXPNr+N50ml4RpS+74hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LnFXDUhuq4a+PgDjWpiPCdLAi0kSEcNRaFrkbgQ87tPeOkN8VBP7nmHOQT0w/jBSahmhqAQwd6QkYZM9AKHsiA19Gs7I06Y/aOzo8gpuOmBsLepwBhNAjpAn3THxTiK4/HZvF3TUClQ35Apsqfu5eoMx9thDpICRNQu/F28TGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2UqgQ2v; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2UqgQ2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739541983; x=1771077983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JfJ/weh2trsLPujvkWU1vNIyXPNr+N50ml4RpS+74hs=;
  b=j2UqgQ2vl0YfnAuRKfxfC2wsuw+Lxom7OyBN0ReXOZ1qV2ztdf6BsP8Q
   cNHnTzoYINsugbMqWnVFZZ910FefSqmw2X9ecQvEc6+9NBlyaTsKMJZIN
   74f0BAzi9QY/4OuhHdUQbY9OO4GVDOP7Hl4wc/8qskcV90mAFi15pxSVS
   YDbvIEbEByhwAvkdbwbkaNKUf8eXCSGQp7wVYNk2VxVve+wZPFH+korcX
   ieAErH5wEFFprUpg8Eh9SFNEioNi7t42cl2N7PrDtBfUirFos7QLmm2eO
   IjB6VDuAgCDlc61ltelluq/cnIDw7HPC8StbDiJsqq5tePVtBUqVw0XRC
   w==;
X-CSE-ConnectionGUID: 3JqO3NW5TJGBCf/cWx3KFQ==
X-CSE-MsgGUID: pgx/b3vLQiyZ46lToTwqvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="43129006"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="43129006"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 06:06:22 -0800
X-CSE-ConnectionGUID: llbsGhgzTCSbpcaHkoWEsA==
X-CSE-MsgGUID: TBli63YqRLKL70SpP8naKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118091044"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2025 06:06:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiwKg-0019dh-37;
	Fri, 14 Feb 2025 14:06:18 +0000
Date: Fri, 14 Feb 2025 22:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1924/1924] mm/page_cache_limit.c:94:5: warning:
 no previous prototype for function 'cache_limit_mbytes_sysctl_handler'
Message-ID: <202502142151.sl3QmAFi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   56197cf035ddc0d25f6d27169455448133fd75dd
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [1924/1924] mm: support pagecache limit
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250214/202502142151.sl3QmAFi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142151.sl3QmAFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142151.sl3QmAFi-lkp@intel.com/

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
