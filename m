Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180362;
	b=27HSPE230n/7wXqsRK48gc/oh/1/7qWC8nJ83DKLiiWmsSQsUhAHjSZkEsVlVQkKYaJi
	 44EFsMa5jyNNST9LsrzTJSzEIOsoE8MqMi6vVVNRk9oV3TovUffwL2jbnzuLE9oKRYhXn
	 uvuJuIbMIFenH4LsVMgHG9TzfpuBHusVSLnqxYLXo81J9rUeZN3ITik48plrWX5+gPuxM
	 CAw8rjvXs1FKC/1lfZ6TAF4mzoMJj7lUeUkOux8olcfkzE6s4Ipbz5StYL4H7Yqbi0S8Z
	 MWCcXwpf706ehPvsRbFlGquNXF55XyIXttKEUWVh69k5fKiuRytLTy0XDoBvTvfpNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=l1tagEQZtt8LCdpTPeXz5POo+RT7kzUsva0JCEL5PPc=;
	b=yrpLypCJ6Rbi88+rtSWXS/pFj4XIAQ/BoHTvZeCJgToy/taCuAtNnp8MkB+OVliVusu+
	 bpeVZGxigorkWrfkrpblUve9uWkL3H+zHw5O2A3+BOYlDKzjUnfKPIiKfHtb01e/6k9b2
	 uELuUd9f36/cpOJE2+EUPoiDAlQR5w7z2DiZhThZZpw65PIHswZTVUDrx1lI04jI3hnWd
	 tX1kv2OvR2vXXWGt7XbW69u+SYzs8dCiv8mqJdWkmn97CJk61Q/4keS+V+k6drhxXcn5X
	 iTEF41P53DBpA0Mhne8s3Y5k4VrRTXZe+Zht8FEvlH3ZgCpxGc+8O5CrLe2VJJcn01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="cWqlqhq/";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37F5606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 09:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWqlqhq/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793180361; x=1824716361;
  h=date:from:to:cc:subject:message-id;
  bh=ypxz9mFiqijy3TwbAArpd6yErFgrEpl4yrDWRjeZ3xY=;
  b=cWqlqhq/rPxAOtlRdDMLMv51S1zrp5TVEczecqWnD9dd1/6wHaSynmoa
   ynX4Tc5ndh+QFulplYEPMXV2feRCs9R12xjbLKNUAOBBqc5AiU8cjja/r
   FSjId+mGJvXJAKVI2m3MfsIfUVKdReCqmt3+c5ZxEhPzoNIWJEqtXbUBg
   MH6UkRJIDd2oQ4lvpNdQsaDsna4UNttJV7xSshBCyjk5XwmC7XMpSWSaH
   ILIwuyaaFpkNMRUF9qdHXnQQGW7UHK98TulMimc2oYOpOh2y5GPMozPew
   icrySh7wgm5HWr0I79aApNUIAPfRHbozbXfZHShQtfpwDsQQFDju+RQOB
   Q==;
X-CSE-ConnectionGUID: 4kdm19C+QJ2jRdtVgoV7wg==
X-CSE-MsgGUID: 5f34P2niQkGUa5iOv0T3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1778254"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1778254"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:39:21 -0700
X-CSE-ConnectionGUID: U2b/V86CRu63nsyYMz2WWA==
X-CSE-MsgGUID: euN7XqBOTQOoe8ZoDSJCTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4931821"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2026 02:39:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM07p-00000000YXo-1qoL;
	Wed, 28 Oct 2026 09:39:17 +0000
Date: Wed, 28 Oct 2026 17:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/9] mm/cma.c:196: warning:
 Function parameter or struct member 'gcma' not described in
 'cma_init_reserved_mem'
Message-ID: <202610281747.jubguq3K-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: 0dad457899d7c4f28855dfadf6c71a1ff8d751ff [0/9] ANDROID: integrate GCMA with CMA using dt-bindings
config: i386-randconfig-1003-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281747.jubguq3K-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281747.jubguq3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281747.jubguq3K-lkp@intel.com/

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
