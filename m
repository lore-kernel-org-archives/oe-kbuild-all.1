Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44364A01
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765608555; cv=none; b=I3efEVSe/lwNPGZl52vsKOA6vSw2LT9v5BZjPX/9dg2CF2PEe4a0m+0jVrpZkkbRKOSVksyjcBiFNOb/7DKuMw2Q6H5YhdgcBIgIC9tLsmbXMxV8z5DSnwr/piHm/d1nqgukji8TgeQenG5yBIHFmjkawogCFh84nI5BKwEmoMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765608555; c=relaxed/simple;
	bh=z7lLLPDrwxx8BmQq4KWOKBjtntrtVbAHKJw8/edWmHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpmKwHa8Sge73XDuZ3s/t9HwXHeblGnBfCRkVyLhsi5FplLuZTsO6ig5Xz3KrSvSb1GJad20WVIbBVItz3SD7M32o75wasDnpeS/0GrlL1iqs23TXmhu0FnccyX8kwvktOVXokJupzZtstqWV45PqPwkLv4gvK3e+UDyO1liqe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoURT9yb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoURT9yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765608554; x=1797144554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z7lLLPDrwxx8BmQq4KWOKBjtntrtVbAHKJw8/edWmHI=;
  b=YoURT9ybR+QRtyTYvo60mWSAVH8bEWz3NpmDVZ7/5C9P8t0YYYRWUld3
   dAhGnjGT+ZC/Bb342Nrl6td5Zf4vD1RQ0DHkj9/EXEZxZwAUN2P+l92dy
   qpD8Pu5FdUJfkwmxAzgWHdS7KQV5UzwBwHbhuv/iqcQjwr8BAQf7+YG1j
   DYIzi0u0SDQ8gFQSyuMnVIp8gj2t96WDGJZc93rOQ7fKSdWi/PIV9g4zA
   RARzDxvKKGKu2gslHigferwXxb4iKILBWVwzgMDicWK6s52H3bwkh6EXx
   tSSYnRKi9s/XaiYOkxBhWYvCwHwAUcVH5W55hrZTAEakJzA28BZJvTkmf
   w==;
X-CSE-ConnectionGUID: lcb6srFaRF2Kn7vuI9/rPQ==
X-CSE-MsgGUID: IsYdNqN3TGaM6tqCQrhJAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67485842"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67485842"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:49:10 -0800
X-CSE-ConnectionGUID: lu/P+1y8T7y+N9CffJOEkA==
X-CSE-MsgGUID: wOl09th0QX+9TNFPblnTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197768985"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 22:49:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJRC-000000007CF-3j7q;
	Sat, 13 Dec 2025 06:49:06 +0000
Date: Sat, 13 Dec 2025 14:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype
 for function '__arm_lpae_unmap_pages'
Message-ID: <202512131434.7TnpWhnc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 528a0fb681c600db04e9700fac40c21cc208773e [2/2] ANDROID: iommu/io-pgtable: Add unmap_pages_walk() operation
config: i386-buildonly-randconfig-005-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131434.7TnpWhnc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131434.7TnpWhnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131434.7TnpWhnc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/io-pgtable-arm-common.c:11:
   In file included from include/linux/io-pgtable-arm.h:5:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/iommu/io-pgtable-arm-common.c:143:5: warning: no previous prototype for function '__arm_lpae_map' [-Wmissing-prototypes]
     143 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^
   drivers/iommu/io-pgtable-arm-common.c:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     143 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         | ^
         | static 
   drivers/iommu/io-pgtable-arm-common.c:264:5: warning: no previous prototype for function 'arm_lpae_map_pages' [-Wmissing-prototypes]
     264 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^
   drivers/iommu/io-pgtable-arm-common.c:264:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     264 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
>> drivers/iommu/io-pgtable-arm-common.c:471:8: warning: no previous prototype for function '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
     471 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/io-pgtable-arm-common.c:471:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     471 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
   drivers/iommu/io-pgtable-arm-common.c:493:13: warning: no previous prototype for function 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     493 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^
   drivers/iommu/io-pgtable-arm-common.c:493:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     493 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         | ^
         | static 
   drivers/iommu/io-pgtable-arm-common.c:529:8: warning: no previous prototype for function 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     529 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/io-pgtable-arm-common.c:529:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     529 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
   drivers/iommu/io-pgtable-arm-common.c:536:8: warning: no previous prototype for function 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
     536 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^
   drivers/iommu/io-pgtable-arm-common.c:536:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     536 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         | ^
         | static 
   7 warnings generated.


vim +/__arm_lpae_unmap_pages +471 drivers/iommu/io-pgtable-arm-common.c

   469	
   470	
 > 471	size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
   472				      size_t pgsize, size_t pgcount,
   473				      struct iommu_iotlb_gather *gather,
   474				      struct io_pgtable_walker *walker)
   475	{
   476		struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
   477		struct io_pgtable_cfg *cfg = &data->iop.cfg;
   478		arm_lpae_iopte *ptep = data->pgd;
   479		long iaext = (s64)iova >> cfg->ias;
   480	
   481		if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize || !pgcount))
   482			return 0;
   483	
   484		if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
   485			iaext = ~iaext;
   486		if (WARN_ON(iaext))
   487			return 0;
   488	
   489		return __arm_lpae_unmap(data, gather, iova, pgsize, pgcount,
   490					data->start_level, ptep, walker);
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
