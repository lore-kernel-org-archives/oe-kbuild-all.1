Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C231891AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525091; cv=none; b=aIqB/FzCNL17jSWdQf+8MYiuVETpbY9tqlczq9ravjTDG+M8zHZ5LFTgxbtb1JT5+QgIM7CqTagSEnQjsObMpJ9VMR58F8dm/0zNDDvGL7lwUBPL9Sg8k0E7CYu4f/0eGfqIOZEWkLvLPg2OfKbWYYhd1QlCYFnGWejmU89snwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525091; c=relaxed/simple;
	bh=Pvi930AZ6oBPCePzVufo1FwPbkKSPrG6jiu5fJuc9XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i7EcU+j4CnkWDIuv3FVId/0DTqMXYJctYxx8HrmkkrqSBoQNSYRmKc2Pqo8ZDBvAfhuJzAJD/Kqeqf7+NTjhSHYyLM2ihC2e+aTAyNB6sSSHkr73Za487JFLqoYo1uNP9SDBUtwzvI7tds1Nze9kY+JxiS6mga/Y13ryJkaKh/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/1dUH4j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/1dUH4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745525090; x=1777061090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pvi930AZ6oBPCePzVufo1FwPbkKSPrG6jiu5fJuc9XU=;
  b=N/1dUH4jnwmts0V2ryj2iILafE9KjhBKPJjlAvf2O68YWo56X1yIhMHO
   NLlawMF5sVlhSASIR5pkYlhuFXbPCoeSrVApaJLqQV2zIMUzFMZHRdSh+
   LkEuFBmngetjOLTjxB+1q4XywOPuRKyF6U5oM8PZE3OSEZ+y23O7FDJLx
   R8AdABsW8Q8bEIdfId0ToY8te+7Ive4GOnADUZQdqybhBLZt88MDtHQLu
   jqVh04BOO4wz9Ri0DBaHTTUtzd+4kU5t1J5IFmwSi3yPsmIi5WdM861Vp
   uQ6fycje0Wc9pHS3TXnpjN353ZSXDZRFL6T/8CAswFMk+/XVXEo7ahX5y
   Q==;
X-CSE-ConnectionGUID: qMN4zsEqT9e/IRiayn9QeQ==
X-CSE-MsgGUID: 9Iz9zNDZRFC7lp/NOw28hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50842772"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="50842772"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:04:49 -0700
X-CSE-ConnectionGUID: EenYqvU9RKmhpCw7tzHUAA==
X-CSE-MsgGUID: Fqbhl7rxQFKDLoqufGAFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="132700397"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2025 13:04:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u82oP-0004Wv-15;
	Thu, 24 Apr 2025 20:04:45 +0000
Date: Fri, 25 Apr 2025 04:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] mm/cma.c:196: warning: Function
 parameter or struct member 'gcma' not described in 'cma_init_reserved_mem'
Message-ID: <202504250316.eNAgcbGC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b01e71951e32bcf55e252da941d55692247d1a5c
commit: 0dad457899d7c4f28855dfadf6c71a1ff8d751ff [3/3] ANDROID: integrate GCMA with CMA using dt-bindings
config: i386-buildonly-randconfig-006-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250316.eNAgcbGC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250316.eNAgcbGC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250316.eNAgcbGC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/cma.c:196: warning: Function parameter or struct member 'gcma' not described in 'cma_init_reserved_mem'


vim +196 mm/cma.c

27d121d0ec6d60 Hari Bathini       2022-03-22  179  
de9e14eebf33a6 Marek Szyprowski   2014-10-13  180  /**
de9e14eebf33a6 Marek Szyprowski   2014-10-13  181   * cma_init_reserved_mem() - create custom contiguous area from reserved memory
de9e14eebf33a6 Marek Szyprowski   2014-10-13  182   * @base: Base address of the reserved area
de9e14eebf33a6 Marek Szyprowski   2014-10-13  183   * @size: Size of the reserved area (in bytes),
de9e14eebf33a6 Marek Szyprowski   2014-10-13  184   * @order_per_bit: Order of pages represented by one bit on bitmap.
e8b098fc5747a7 Mike Rapoport      2018-04-05  185   * @name: The name of the area. If this parameter is NULL, the name of
e8b098fc5747a7 Mike Rapoport      2018-04-05  186   *        the area will be set to "cmaN", where N is a running counter of
e8b098fc5747a7 Mike Rapoport      2018-04-05  187   *        used areas.
de9e14eebf33a6 Marek Szyprowski   2014-10-13  188   * @res_cma: Pointer to store the created cma region.
de9e14eebf33a6 Marek Szyprowski   2014-10-13  189   *
de9e14eebf33a6 Marek Szyprowski   2014-10-13  190   * This function creates custom contiguous area from already reserved memory.
de9e14eebf33a6 Marek Szyprowski   2014-10-13  191   */
de9e14eebf33a6 Marek Szyprowski   2014-10-13  192  int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
ac173824959ade Sasha Levin        2015-04-14  193  				 unsigned int order_per_bit,
f318dd083c8128 Laura Abbott       2017-04-18  194  				 const char *name,
0dad457899d7c4 Suren Baghdasaryan 2025-02-28  195  				 struct cma **res_cma, bool gcma)
de9e14eebf33a6 Marek Szyprowski   2014-10-13 @196  {
de9e14eebf33a6 Marek Szyprowski   2014-10-13  197  	struct cma *cma;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  198  
de9e14eebf33a6 Marek Szyprowski   2014-10-13  199  	/* Sanity checks */
de9e14eebf33a6 Marek Szyprowski   2014-10-13  200  	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
de9e14eebf33a6 Marek Szyprowski   2014-10-13  201  		pr_err("Not enough slots for CMA reserved regions!\n");
de9e14eebf33a6 Marek Szyprowski   2014-10-13  202  		return -ENOSPC;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  203  	}
de9e14eebf33a6 Marek Szyprowski   2014-10-13  204  
de9e14eebf33a6 Marek Szyprowski   2014-10-13  205  	if (!size || !memblock_is_region_reserved(base, size))
de9e14eebf33a6 Marek Szyprowski   2014-10-13  206  		return -EINVAL;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  207  
e16faf26780fc0 David Hildenbrand  2022-03-22  208  	/* ensure minimal alignment required by mm core */
e16faf26780fc0 David Hildenbrand  2022-03-22  209  	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
de9e14eebf33a6 Marek Szyprowski   2014-10-13  210  		return -EINVAL;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  211  
de9e14eebf33a6 Marek Szyprowski   2014-10-13  212  	/*
de9e14eebf33a6 Marek Szyprowski   2014-10-13  213  	 * Each reserved area must be initialised later, when more kernel
de9e14eebf33a6 Marek Szyprowski   2014-10-13  214  	 * subsystems (like slab allocator) are available.
de9e14eebf33a6 Marek Szyprowski   2014-10-13  215  	 */
de9e14eebf33a6 Marek Szyprowski   2014-10-13  216  	cma = &cma_areas[cma_area_count];
18e98e56f4407b Barry Song         2020-08-11  217  
18e98e56f4407b Barry Song         2020-08-11  218  	if (name)
18e98e56f4407b Barry Song         2020-08-11  219  		snprintf(cma->name, CMA_MAX_NAME, name);
18e98e56f4407b Barry Song         2020-08-11  220  	else
0dad457899d7c4 Suren Baghdasaryan 2025-02-28  221  		snprintf(cma->name, CMA_MAX_NAME,
0dad457899d7c4 Suren Baghdasaryan 2025-02-28  222  			 gcma ? "gcma%d\n" : "cma%d\n", cma_area_count);
18e98e56f4407b Barry Song         2020-08-11  223  
de9e14eebf33a6 Marek Szyprowski   2014-10-13  224  	cma->base_pfn = PFN_DOWN(base);
de9e14eebf33a6 Marek Szyprowski   2014-10-13  225  	cma->count = size >> PAGE_SHIFT;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  226  	cma->order_per_bit = order_per_bit;
0dad457899d7c4 Suren Baghdasaryan 2025-02-28  227  	cma->gcma = gcma;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  228  	*res_cma = cma;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  229  	cma_area_count++;
5c0532500f102a Hao Ge             2024-07-29  230  	totalcma_pages += cma->count;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  231  
de9e14eebf33a6 Marek Szyprowski   2014-10-13  232  	return 0;
de9e14eebf33a6 Marek Szyprowski   2014-10-13  233  }
de9e14eebf33a6 Marek Szyprowski   2014-10-13  234  

:::::: The code at line 196 was first introduced by commit
:::::: de9e14eebf33a60712a52a0bc6e08c043c0aba53 drivers: dma-contiguous: add initialization from device tree

:::::: TO: Marek Szyprowski <m.szyprowski@samsung.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
