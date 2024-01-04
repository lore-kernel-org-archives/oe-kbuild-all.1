Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F221EB25
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rj3GQe4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704349592; x=1735885592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VlfhND6bMRH8YF9Z1HHP288mJWL5yibU/yhdHulwA8w=;
  b=Rj3GQe4gOLJL6wYQU2WeM40NkGsWRrr7sZ5Grec1n2SYZjoeSbq9DOCG
   5KSRdLPQgf42cj9BEONWZYxl8/qE97p/l7R2EX+QI6hxHtyxqLnvmDfH7
   X16Url/Lft6dsxiIuVCN5DdDPC0Tai5C3tT05ySTewqcoYlcCbhY/7jzj
   H1lun9nnFNtmeFyoO7aS/GJH9o+VRBy7qkN9gniGzc3Q2J49PVk8ZegHu
   fctUfuBed94Esgk9BksX6/SvHVq5KcWuF6Zy+Y5IrN2MPsZVI9UvU1AdR
   bhUt827nGYUuZFCkCpey9T7DccmHJoxxDoPkHW+NHVRvzEexctHepq4ei
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4487046"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4487046"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 22:26:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="1111607093"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="1111607093"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jan 2024 22:26:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLHBS-000MyJ-0T;
	Thu, 04 Jan 2024 06:26:26 +0000
Date: Thu, 4 Jan 2024 14:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, "Song, Youquan" <youquan.song@intel.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Chen Zhuo <sagazchen@tencent.com>,
	Xinghui Li <korantli@tencent.com>
Subject: drivers/xen/swiotlb-xen.c:406:17: error: too many arguments to
 function 'swiotlb_tbl_unmap_single'
Message-ID: <202401041403.tF2XTGKw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009.spr
head:   2b05031ac9b7e23091affe1b717425ef76750bd9
commit: ae108dba4c541c0ff557cd6a0e2b93f0aff0b136 swiotlb: remove the alloc_size parameter to swiotlb_tbl_unmap_single
date:   7 months ago
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240104/202401041403.tF2XTGKw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401041403.tF2XTGKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041403.tF2XTGKw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/xen/swiotlb-xen.c: In function 'xen_swiotlb_map_page':
>> drivers/xen/swiotlb-xen.c:406:17: error: too many arguments to function 'swiotlb_tbl_unmap_single'
     406 |                 swiotlb_tbl_unmap_single(dev, map, size, size, dir,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/swiotlb.h:5,
                    from arch/x86/include/asm/dma-mapping.h:13,
                    from include/linux/dma-mapping.h:202,
                    from include/linux/dma-direct.h:9,
                    from drivers/xen/swiotlb-xen.c:30:
   include/linux/swiotlb.h:56:13: note: declared here
      56 | extern void swiotlb_tbl_unmap_single(struct device *hwdev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c: In function 'xen_swiotlb_unmap_page':
   drivers/xen/swiotlb-xen.c:437:17: error: too many arguments to function 'swiotlb_tbl_unmap_single'
     437 |                 swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swiotlb.h:56:13: note: declared here
      56 | extern void swiotlb_tbl_unmap_single(struct device *hwdev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/swiotlb_tbl_unmap_single +406 drivers/xen/swiotlb-xen.c

^590eaf1fec755 Kaixu Xia         2021-03-16  362  
^590eaf1fec755 Kaixu Xia         2021-03-16  363  /*
^590eaf1fec755 Kaixu Xia         2021-03-16  364   * Map a single buffer of the indicated size for DMA in streaming mode.  The
^590eaf1fec755 Kaixu Xia         2021-03-16  365   * physical address to use is returned.
^590eaf1fec755 Kaixu Xia         2021-03-16  366   *
^590eaf1fec755 Kaixu Xia         2021-03-16  367   * Once the device is given the dma address, the device owns this memory until
^590eaf1fec755 Kaixu Xia         2021-03-16  368   * either xen_swiotlb_unmap_page or xen_swiotlb_dma_sync_single is performed.
^590eaf1fec755 Kaixu Xia         2021-03-16  369   */
^590eaf1fec755 Kaixu Xia         2021-03-16  370  static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
^590eaf1fec755 Kaixu Xia         2021-03-16  371  				unsigned long offset, size_t size,
^590eaf1fec755 Kaixu Xia         2021-03-16  372  				enum dma_data_direction dir,
^590eaf1fec755 Kaixu Xia         2021-03-16  373  				unsigned long attrs)
^590eaf1fec755 Kaixu Xia         2021-03-16  374  {
^590eaf1fec755 Kaixu Xia         2021-03-16  375  	phys_addr_t map, phys = page_to_phys(page) + offset;
^590eaf1fec755 Kaixu Xia         2021-03-16  376  	dma_addr_t dev_addr = xen_phys_to_bus(phys);
^590eaf1fec755 Kaixu Xia         2021-03-16  377  
^590eaf1fec755 Kaixu Xia         2021-03-16  378  	BUG_ON(dir == DMA_NONE);
^590eaf1fec755 Kaixu Xia         2021-03-16  379  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  380  	 * If the address happens to be in the device's DMA window,
^590eaf1fec755 Kaixu Xia         2021-03-16  381  	 * we can safely return the device addr and not worry about bounce
^590eaf1fec755 Kaixu Xia         2021-03-16  382  	 * buffering it.
^590eaf1fec755 Kaixu Xia         2021-03-16  383  	 */
e52d4b5480cb99 Christoph Hellwig 2019-11-19  384  	if (dma_capable(dev, dev_addr, size, true) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  385  	    !range_straddles_page_boundary(phys, size) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  386  		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  387  		swiotlb_force != SWIOTLB_FORCE)
^590eaf1fec755 Kaixu Xia         2021-03-16  388  		goto done;
^590eaf1fec755 Kaixu Xia         2021-03-16  389  
^590eaf1fec755 Kaixu Xia         2021-03-16  390  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  391  	 * Oh well, have to allocate and map a bounce buffer.
^590eaf1fec755 Kaixu Xia         2021-03-16  392  	 */
^590eaf1fec755 Kaixu Xia         2021-03-16  393  	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
^590eaf1fec755 Kaixu Xia         2021-03-16  394  
f7ed14d49d8c7b Christoph Hellwig 2020-02-03  395  	map = swiotlb_tbl_map_single(dev, phys, size, size, dir, attrs);
^590eaf1fec755 Kaixu Xia         2021-03-16  396  	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
^590eaf1fec755 Kaixu Xia         2021-03-16  397  		return DMA_MAPPING_ERROR;
^590eaf1fec755 Kaixu Xia         2021-03-16  398  
^590eaf1fec755 Kaixu Xia         2021-03-16  399  	phys = map;
^590eaf1fec755 Kaixu Xia         2021-03-16  400  	dev_addr = xen_phys_to_bus(map);
^590eaf1fec755 Kaixu Xia         2021-03-16  401  
^590eaf1fec755 Kaixu Xia         2021-03-16  402  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  403  	 * Ensure that the address returned is DMA'ble
^590eaf1fec755 Kaixu Xia         2021-03-16  404  	 */
e52d4b5480cb99 Christoph Hellwig 2019-11-19  405  	if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
^590eaf1fec755 Kaixu Xia         2021-03-16 @406  		swiotlb_tbl_unmap_single(dev, map, size, size, dir,
^590eaf1fec755 Kaixu Xia         2021-03-16  407  				attrs | DMA_ATTR_SKIP_CPU_SYNC);
^590eaf1fec755 Kaixu Xia         2021-03-16  408  		return DMA_MAPPING_ERROR;
^590eaf1fec755 Kaixu Xia         2021-03-16  409  	}
^590eaf1fec755 Kaixu Xia         2021-03-16  410  
^590eaf1fec755 Kaixu Xia         2021-03-16  411  done:
^590eaf1fec755 Kaixu Xia         2021-03-16  412  	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
c3fd7ea8b7a5d9 Christoph Hellwig 2019-11-07  413  		xen_dma_sync_for_device(dev_addr, phys, size, dir);
^590eaf1fec755 Kaixu Xia         2021-03-16  414  	return dev_addr;
^590eaf1fec755 Kaixu Xia         2021-03-16  415  }
^590eaf1fec755 Kaixu Xia         2021-03-16  416  

:::::: The code at line 406 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
