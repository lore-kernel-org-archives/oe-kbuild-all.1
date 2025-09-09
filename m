Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990161CAA79
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422924; cv=none; b=Ztv3ZkFGgrV+zoSSUB9G+wEEWztjWrdxkxIMupaFuBP2A5w04mrw5ZnPJ7WwxxTk9IDy1u6uqm6R1kfTBa1pUP+PF0+5wFs62mS8jOSD1961I7tWgRD5Hlp9HSVIyIcVTcUZmn7t6WLpYRs6U58JSv8RhlM2TjQ3/7wDDECY7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422924; c=relaxed/simple;
	bh=ECUmmBkMNhW9Kui5tnzp3rUaxKUI+wEtTo6vFyXIdbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FwkRPiptGd1b1KuFg/AGK0zO+MdxYxDdjuzhP+I6oXSay1dySBFixHDi8WM4cEoWdPQbxGCgjjziQoNSWXd5vzIUceIGa8TAXDimX+iUHji7jkJJ944YmRMR9GP6wBgiGWh7uPiDuJ8SkbxbjSZTem7Z4HJxwqQhjUUIfQpvqfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faF9iguV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faF9iguV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757422923; x=1788958923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ECUmmBkMNhW9Kui5tnzp3rUaxKUI+wEtTo6vFyXIdbY=;
  b=faF9iguVZ0Ro7sWDJSJNT7SrUIDStY/Znlbcmf+NKjns8pG5jAc+Q8QK
   Igx8kMHY7V0+soxIFaS5nRiBwQM1OAo+DiSdZmUp1eJrpzaipX4KSl+Ru
   pmJA6Et08dL/i4aVDuu8VjE26Di0/Uahu0jIKWO/H0d88+3yaUjbFawfQ
   himFwsaoWBB7wsF5+IOikaU4z1zgBTrzVE3vvj5r69hJIkzd7toBO/FOz
   CNsuapiIIB0BtTYLQEvgd1zo0UoiYWaEj9logXGt6pXxQzHGKTIMv69G+
   wGACQcEIoQDIi5GAeCzdXgEVMBGt7vmMvWyMrR8M+5WVAAGY0o/jDHv6u
   g==;
X-CSE-ConnectionGUID: FbB5Z1cISTCfNwzKcB1Bvw==
X-CSE-MsgGUID: uobMf5MbTieZIscV0bk0rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62332696"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="62332696"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:02:02 -0700
X-CSE-ConnectionGUID: tIhqM16eTE6mqOgBuzGxcQ==
X-CSE-MsgGUID: eQvrEjbQQkKeBJ15jWKKyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172250943"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2025 06:02:00 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvxyw-0004s1-1s;
	Tue, 09 Sep 2025 13:01:58 +0000
Date: Tue, 9 Sep 2025 21:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] mm/cma.c:196: warning:
 Function parameter or struct member 'gcma' not described in
 'cma_init_reserved_mem'
Message-ID: <202509092029.PAi09kG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1e52d3ba33c0625899a7ffff58c7eb6d4bbb10d8
commit: 0dad457899d7c4f28855dfadf6c71a1ff8d751ff [1/1] ANDROID: integrate GCMA with CMA using dt-bindings
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20250909/202509092029.PAi09kG1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092029.PAi09kG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092029.PAi09kG1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/cma.c:196: warning: Function parameter or struct member 'gcma' not described in 'cma_init_reserved_mem'


vim +196 mm/cma.c

27d121d0ec6d604 Hari Bathini       2022-03-22  179  
de9e14eebf33a60 Marek Szyprowski   2014-10-13  180  /**
de9e14eebf33a60 Marek Szyprowski   2014-10-13  181   * cma_init_reserved_mem() - create custom contiguous area from reserved memory
de9e14eebf33a60 Marek Szyprowski   2014-10-13  182   * @base: Base address of the reserved area
de9e14eebf33a60 Marek Szyprowski   2014-10-13  183   * @size: Size of the reserved area (in bytes),
de9e14eebf33a60 Marek Szyprowski   2014-10-13  184   * @order_per_bit: Order of pages represented by one bit on bitmap.
e8b098fc5747a7c Mike Rapoport      2018-04-05  185   * @name: The name of the area. If this parameter is NULL, the name of
e8b098fc5747a7c Mike Rapoport      2018-04-05  186   *        the area will be set to "cmaN", where N is a running counter of
e8b098fc5747a7c Mike Rapoport      2018-04-05  187   *        used areas.
de9e14eebf33a60 Marek Szyprowski   2014-10-13  188   * @res_cma: Pointer to store the created cma region.
de9e14eebf33a60 Marek Szyprowski   2014-10-13  189   *
de9e14eebf33a60 Marek Szyprowski   2014-10-13  190   * This function creates custom contiguous area from already reserved memory.
de9e14eebf33a60 Marek Szyprowski   2014-10-13  191   */
de9e14eebf33a60 Marek Szyprowski   2014-10-13  192  int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
ac173824959adeb Sasha Levin        2015-04-14  193  				 unsigned int order_per_bit,
f318dd083c8128c Laura Abbott       2017-04-18  194  				 const char *name,
0dad457899d7c4f Suren Baghdasaryan 2025-02-28  195  				 struct cma **res_cma, bool gcma)
de9e14eebf33a60 Marek Szyprowski   2014-10-13 @196  {
de9e14eebf33a60 Marek Szyprowski   2014-10-13  197  	struct cma *cma;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  198  
de9e14eebf33a60 Marek Szyprowski   2014-10-13  199  	/* Sanity checks */
de9e14eebf33a60 Marek Szyprowski   2014-10-13  200  	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
de9e14eebf33a60 Marek Szyprowski   2014-10-13  201  		pr_err("Not enough slots for CMA reserved regions!\n");
de9e14eebf33a60 Marek Szyprowski   2014-10-13  202  		return -ENOSPC;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  203  	}
de9e14eebf33a60 Marek Szyprowski   2014-10-13  204  
de9e14eebf33a60 Marek Szyprowski   2014-10-13  205  	if (!size || !memblock_is_region_reserved(base, size))
de9e14eebf33a60 Marek Szyprowski   2014-10-13  206  		return -EINVAL;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  207  
e16faf26780fc0c David Hildenbrand  2022-03-22  208  	/* ensure minimal alignment required by mm core */
e16faf26780fc0c David Hildenbrand  2022-03-22  209  	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
de9e14eebf33a60 Marek Szyprowski   2014-10-13  210  		return -EINVAL;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  211  
de9e14eebf33a60 Marek Szyprowski   2014-10-13  212  	/*
de9e14eebf33a60 Marek Szyprowski   2014-10-13  213  	 * Each reserved area must be initialised later, when more kernel
de9e14eebf33a60 Marek Szyprowski   2014-10-13  214  	 * subsystems (like slab allocator) are available.
de9e14eebf33a60 Marek Szyprowski   2014-10-13  215  	 */
de9e14eebf33a60 Marek Szyprowski   2014-10-13  216  	cma = &cma_areas[cma_area_count];
18e98e56f4407b8 Barry Song         2020-08-11  217  
18e98e56f4407b8 Barry Song         2020-08-11  218  	if (name)
18e98e56f4407b8 Barry Song         2020-08-11  219  		snprintf(cma->name, CMA_MAX_NAME, name);
18e98e56f4407b8 Barry Song         2020-08-11  220  	else
0dad457899d7c4f Suren Baghdasaryan 2025-02-28  221  		snprintf(cma->name, CMA_MAX_NAME,
0dad457899d7c4f Suren Baghdasaryan 2025-02-28  222  			 gcma ? "gcma%d\n" : "cma%d\n", cma_area_count);
18e98e56f4407b8 Barry Song         2020-08-11  223  
de9e14eebf33a60 Marek Szyprowski   2014-10-13  224  	cma->base_pfn = PFN_DOWN(base);
de9e14eebf33a60 Marek Szyprowski   2014-10-13  225  	cma->count = size >> PAGE_SHIFT;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  226  	cma->order_per_bit = order_per_bit;
0dad457899d7c4f Suren Baghdasaryan 2025-02-28  227  	cma->gcma = gcma;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  228  	*res_cma = cma;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  229  	cma_area_count++;
5c0532500f102ae Hao Ge             2024-07-29  230  	totalcma_pages += cma->count;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  231  
de9e14eebf33a60 Marek Szyprowski   2014-10-13  232  	return 0;
de9e14eebf33a60 Marek Szyprowski   2014-10-13  233  }
de9e14eebf33a60 Marek Szyprowski   2014-10-13  234  

:::::: The code at line 196 was first introduced by commit
:::::: de9e14eebf33a60712a52a0bc6e08c043c0aba53 drivers: dma-contiguous: add initialization from device tree

:::::: TO: Marek Szyprowski <m.szyprowski@samsung.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
