Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857052FD7B1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 17:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784396400; cv=none; b=Z8hTibTha1g0pcsXRE0cpWKuFjBgunxUQtl/avtuKLdEeAPwwdLfA+misK8FPeFt0jbkE7SLoF0lQLZl0KiYWnT+k3tLJB8MmGlBEDnM3b7s+8sesMEiLw4aWIAEEqbDcn/rGJ0OLuUHlv0vE/IqhqEDv/EeysVFUHoNM49bKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784396400; c=relaxed/simple;
	bh=hJiHpsVWaLQH8Daq1UGZWNRfOp8WKKaT1A1DND/lPDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJugWWHD+YmEAqetz2+4PxhFk9Jn8XlqInVs3H8657DhbCdPcxXtyKmj3qAs0K1MzvY2UPgETr0CDwAV0K7/3/PrxVtNxQziFQKux8CzMjCxAp6Aqd0gKtPKuH5NwSYZmMX5KhWN0ronuT6x3I2CPYA1wY1xtko/101WHAS8Pcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gm6DeFfX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gm6DeFfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784396398; x=1815932398;
  h=date:from:to:cc:subject:message-id;
  bh=hJiHpsVWaLQH8Daq1UGZWNRfOp8WKKaT1A1DND/lPDI=;
  b=Gm6DeFfX7ul8t9i0k/gFSHEjjAaBFBZ30Zwgq4duBwHx+V3ZdECZVe0u
   7EitqG1ncp4FtfYgqaqhKynuhYz3fLUqKV1I0szoHytDBp4Gnv4Ls8qBp
   evHMRoJEg97frcNTS6Aegl46mnvti3G0tyK1R60d0dI0jMWTdf38hP5GJ
   TgBvm7/4HCurdhqh5wwyA5fk20jMsUYaQWp3yZ45VGeqaJc3ykhYWb7Ki
   3HdjyFrPf0T2xGH6MDERoJqLsAF5MXRK/AsiJX8vopyXMa4jvd0o1AVBB
   MR80pFHWG0X3CzOmnM2dvn7O7K36rSZWL+e4jwMgJ4M1QXKnDi2UnO5mo
   Q==;
X-CSE-ConnectionGUID: fR5oP2g5TKyG67geJE4BPg==
X-CSE-MsgGUID: JcJBsYeNQV2IWkDCRcd/XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="96402361"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96402361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 10:39:57 -0700
X-CSE-ConnectionGUID: HxVWdZzAQnuw1lyUpkElyw==
X-CSE-MsgGUID: wykkB1UWRAWwStNFwTV1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="257140853"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2026 10:39:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl90y-00000000Uyu-3waf;
	Sat, 18 Jul 2026 17:39:52 +0000
Date: Sun, 19 Jul 2026 01:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12] mm/cma.c:196: warning:
 Function parameter or struct member 'gcma' not described in
 'cma_init_reserved_mem'
Message-ID: <202607190105.jYUZ5Vc7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: 0dad457899d7c4f28855dfadf6c71a1ff8d751ff [12/12] ANDROID: integrate GCMA with CMA using dt-bindings
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260719/202607190105.jYUZ5Vc7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190105.jYUZ5Vc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190105.jYUZ5Vc7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/cma.c:196: warning: Function parameter or struct member 'gcma' not described in 'cma_init_reserved_mem'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


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
