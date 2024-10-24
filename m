Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C8A4C7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 00:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729731096; cv=none; b=E871CXP0YwBCE5FoF8P16TkjYGNgV+vsLfBuVqhhPIJmNzjTQNxw84FWUbItJBLqhYfle4lhEr+Ucmr/YfTCvc2hWBHmikBk4381OXhI9pkXkJQ1lytpRwoCvXiGMKijjyAckQ4qHNeMeIQGZktaWacg6C/MvYpCr89Tb+sE4qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729731096; c=relaxed/simple;
	bh=5vLXSIrcndBZm+yPOiB7pHnOPT4cbR0bvF2+J/RxhR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9c2OyElYBBzBe4mKYeq5C9+pDDKpbJPDuvY7DWzpbjCW/m+Hb4gKLzmCsXRvzkdDuZJig5n5qeFsxojPbakNWYcyOHUaYrWeeDQKAuyMRC/bplZwWr0FfZnzJEvD0X9bPIPTh42VTXB44StOhCp1TzF5EvhowGUIugH80Uai2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUQI8xZx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUQI8xZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729731094; x=1761267094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vLXSIrcndBZm+yPOiB7pHnOPT4cbR0bvF2+J/RxhR4=;
  b=hUQI8xZxyQGoLTWfMts5jZftN+yfKvdH88riMbOaz8APM7KUbussFtzI
   nopSph7Dtj4VjskI+YYHir0w8cLiPskzNC9aXrXMwsSFj6OlKiKgSgojK
   w/60AK8jP/dlgYgq7acwt/BQB0tZ4fI6QtkKB+VGgEOjh2TX6LDAnCViL
   ySQ5lyiwtZ6Y0gnulz/8eWKODGtTZ7pXXFnpYvXY8d9Z95Ts1DPNKxV9B
   vtcT4Xf+Jtjpi5sL7ShiMIvc9lNt812L/taOky/c6JQmnde0VlukwO4g1
   JsYA/e4u04MYugAQx6Ix0xC4VSA4WY294cULc7pWFDLzMpqsNkS+fPCzr
   Q==;
X-CSE-ConnectionGUID: e8udiVvKTHynRFmqsMX2YA==
X-CSE-MsgGUID: GxhaDaZkRNqrAztPGlRROw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28806838"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="28806838"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:51:31 -0700
X-CSE-ConnectionGUID: TO5brBt6TK6+VP3syRuASg==
X-CSE-MsgGUID: b3apz7VJRSSCEuW1y7eaJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="85039796"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2024 17:51:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3m4T-000VlS-1r;
	Thu, 24 Oct 2024 00:51:25 +0000
Date: Thu, 24 Oct 2024 08:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1421/2444]
 drivers/xen/swiotlb-xen.c:406:17: error: too many arguments to function
 'swiotlb_tbl_unmap_single'
Message-ID: <202410240857.Jjb6qKJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: c7e40421dde68ff33b73cd415d944efef8cfef61 [1421/2444] swiotlb: remove the alloc_size parameter to swiotlb_tbl_unmap_single
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241024/202410240857.Jjb6qKJX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240857.Jjb6qKJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240857.Jjb6qKJX-lkp@intel.com/

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

b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  362  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  363  /*
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  364   * Map a single buffer of the indicated size for DMA in streaming mode.  The
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  365   * physical address to use is returned.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  366   *
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  367   * Once the device is given the dma address, the device owns this memory until
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  368   * either xen_swiotlb_unmap_page or xen_swiotlb_dma_sync_single is performed.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  369   */
dceb1a6819ab2c8 Christoph Hellwig     2017-05-21  370  static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  371  				unsigned long offset, size_t size,
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  372  				enum dma_data_direction dir,
00085f1efa387a8 Krzysztof Kozlowski   2016-08-03  373  				unsigned long attrs)
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  374  {
e05ed4d1fad9e73 Alexander Duyck       2012-10-15  375  	phys_addr_t map, phys = page_to_phys(page) + offset;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  376  	dma_addr_t dev_addr = xen_phys_to_bus(phys);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  377  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  378  	BUG_ON(dir == DMA_NONE);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  379  	/*
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  380  	 * If the address happens to be in the device's DMA window,
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  381  	 * we can safely return the device addr and not worry about bounce
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  382  	 * buffering it.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  383  	 */
09c2bd36f1c2d8d Christoph Hellwig     2019-11-19  384  	if (dma_capable(dev, dev_addr, size, true) &&
a4dba1308912710 Stefano Stabellini    2014-11-21  385  	    !range_straddles_page_boundary(phys, size) &&
291be10fd751110 Julien Grall          2015-09-09  386  		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
063b8271ec8f706 Christoph Hellwig     2019-04-11  387  		swiotlb_force != SWIOTLB_FORCE)
063b8271ec8f706 Christoph Hellwig     2019-04-11  388  		goto done;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  389  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  390  	/*
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  391  	 * Oh well, have to allocate and map a bounce buffer.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  392  	 */
2b2b614dd24e4e6 Zoltan Kiss           2013-09-04  393  	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
2b2b614dd24e4e6 Zoltan Kiss           2013-09-04  394  
48c5d3c955de4f1 Christoph Hellwig     2020-02-03  395  	map = swiotlb_tbl_map_single(dev, phys, size, size, dir, attrs);
9c106119f6538f6 Arnd Bergmann         2019-06-17  396  	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
a4abe0ad10654b1 Christoph Hellwig     2018-11-21  397  		return DMA_MAPPING_ERROR;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  398  
b4dca1512941aa8 Christoph Hellwig     2019-09-05  399  	phys = map;
f1225ee4c8fcf09 Stefano Stabellini    2017-01-19  400  	dev_addr = xen_phys_to_bus(map);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  401  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  402  	/*
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  403  	 * Ensure that the address returned is DMA'ble
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  404  	 */
09c2bd36f1c2d8d Christoph Hellwig     2019-11-19  405  	if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
3fc1ca00653db63 Lu Baolu              2019-09-06 @406  		swiotlb_tbl_unmap_single(dev, map, size, size, dir,
063b8271ec8f706 Christoph Hellwig     2019-04-11  407  				attrs | DMA_ATTR_SKIP_CPU_SYNC);
a4abe0ad10654b1 Christoph Hellwig     2018-11-21  408  		return DMA_MAPPING_ERROR;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  409  	}
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  410  
063b8271ec8f706 Christoph Hellwig     2019-04-11  411  done:
b4dca1512941aa8 Christoph Hellwig     2019-09-05  412  	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
09c789996bc487d Christoph Hellwig     2019-11-07  413  		xen_dma_sync_for_device(dev_addr, phys, size, dir);
063b8271ec8f706 Christoph Hellwig     2019-04-11  414  	return dev_addr;
063b8271ec8f706 Christoph Hellwig     2019-04-11  415  }
063b8271ec8f706 Christoph Hellwig     2019-04-11  416  

:::::: The code at line 406 was first introduced by commit
:::::: 3fc1ca00653db6371585e3c21c4b873b2f20e60a swiotlb: Split size parameter to map/unmap APIs

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
