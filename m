Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2833290B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766437995; cv=none; b=U8xwYL4yhWHxT9QPvWjpGLxwuyLRUlKkEZDm0MEhK6e58o8O7WJpphGNlHp8cqoZThWNt0j2v/zpc3vTBr4Ozohe4FBf8qpr/qBt37E0QjvvdReFiYGzaYqJXKHlgZvoCGlBEE/RYf8YKh9EjjYo13s9kOhUhLzV403S4SHLzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766437995; c=relaxed/simple;
	bh=cmOEXUCSTIuc4gc7f8F6EjncWp8HFRySTs8GKyFb0rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=imup5ELYTfjxR4LJMIiljgSG7fSAoIyNcns08uW609+KYB+75OlyM7v6RT/gfjLmXei9BbL0/gnGY6No+jDcwMTzMjz4uf5X5F5uZ0oVSbpj8exIHTWhoLjdKMnjTIBLYxdqLxaFakiTc1LIZ4lVCCRVdG86KwOjc/5WJFqC13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdZeU7Z+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdZeU7Z+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766437993; x=1797973993;
  h=date:from:to:cc:subject:message-id;
  bh=cmOEXUCSTIuc4gc7f8F6EjncWp8HFRySTs8GKyFb0rg=;
  b=CdZeU7Z+WkPSViLG6MVp/vRoePvQABXR0+NLhCerNXwP1afc/qs2UFf+
   CILgBv9rd6FBjrzgNGd6HCRtrSLvnc3slsbfuDozb3DlJHP0BCp4OQfsl
   Nu8Rb9WtLHBtINmG2O0gSxNFHlv22HT1qgrG/EH88SaTZMch0D0wtkHsw
   6JNH9NMp+8jqWSKylVOIovaF2SjgW9e7f17LFxUEfKwUWuUHxyPX98AAo
   BgCARVdK/O1id6uD+tXfcpP/EenPct6Ovemq38qKAC/xoubQP8TYTzPlv
   nGLIvGxnMJXwOt4F+jqmViz42K7VaeTxo2jY3A99uA8PZkKTuS1h2SNoo
   Q==;
X-CSE-ConnectionGUID: //7XWnUzTamaHThJEIkuAQ==
X-CSE-MsgGUID: Lbk5R8hJTPCaJhqgwTbw6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78611118"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="78611118"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:13:12 -0800
X-CSE-ConnectionGUID: w44MwuErQaCE2rtf7rkQpg==
X-CSE-MsgGUID: nzdJfPpLT02kMwYDBE7/pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199608077"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2025 13:13:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnDD-0000000017X-2W7w;
	Mon, 22 Dec 2025 21:13:04 +0000
Date: Tue, 23 Dec 2025 05:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/2] mm/cma.c:196:
 warning: Function parameter or struct member 'gcma' not described in
 'cma_init_reserved_mem'
Message-ID: <202512230500.ZwIE9cg0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   a2bc6533e6cc289203eaf3d879c1b485dce2cbef
commit: 0dad457899d7c4f28855dfadf6c71a1ff8d751ff [0/2] ANDROID: integrate GCMA with CMA using dt-bindings
config: i386-randconfig-012-20251221 (https://download.01.org/0day-ci/archive/20251223/202512230500.ZwIE9cg0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230500.ZwIE9cg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230500.ZwIE9cg0-lkp@intel.com/

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
