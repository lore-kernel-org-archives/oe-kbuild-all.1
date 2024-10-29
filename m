Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3201922FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730220324; cv=none; b=r6KO11XxWu3XSHM3c39NbAHdf3V1/GoxxY+pq4/kE2V6axOKt7YIhEvzNlP9q3JnC4gHL9NjLF2NKP2g/e6xc/JkHqY5S077m1I2H7YmuVBxzKVrHOc1whFzzQp6Q/O3I8L/bI+jW6HF1e+bp2m3CRJdeJqnm6as6Hq4JZsF1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730220324; c=relaxed/simple;
	bh=3irfHkvHkXOQpLdNnNWaQVftzhtNLXsttqyWNNzB0LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1W5m7kc7wwGCAxZX3D10t9ZNo4lzD4JzAHOJm6oTZ8HlYzj/5NN8W6PeyAxjJ5jaSB/gYYld8lGR2t0A2Cz2gfvhgwnWjeHJl0uhMs31QzMrZBfAEIcTDVJTns+uz/P2LuP29aINhsiWzfILONkv1/RDwvSHxMAvLd7JAQSU/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YX3/uLci; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YX3/uLci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730220322; x=1761756322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3irfHkvHkXOQpLdNnNWaQVftzhtNLXsttqyWNNzB0LQ=;
  b=YX3/uLcif/cc0w9aLk6ZTJMgz7o/skk/hA+Jdr2jxrkKzJev9F7QBCNf
   7/rPyJ/gQV1L1GHUbfYMEGijNNRUXSbYCzZbDooK2tSEPYmufMESzGtuc
   sLYYPiDuw03TnOANGqi6wZVsCzSbt+1GYbkhCfW/cSOPTTaAsVAicX6jk
   b1ShBiYXPH8ba19XozQ68jb4qjV6ei0F13elUFnDTsQSF5bznq3KSeTPp
   Bx2AVq9TUJFsf50jfiHlH6p2avTfr/kIkwlkSJyZDnGA9ESywL8alH81y
   x1cWqeouXHhh8BL3IQM94iKpTcvXhWHa7iV4PWDDaeSveBcd/sr26rQFs
   w==;
X-CSE-ConnectionGUID: bHWBh5IvQ2anBgH7D54Ihg==
X-CSE-MsgGUID: Fkm6x1xETmqyC2LpfLG7Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40975629"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40975629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 09:45:22 -0700
X-CSE-ConnectionGUID: Zeoxrp/AQOm3Wlz33k756Q==
X-CSE-MsgGUID: G5poxBjoSgSAl1FvvUyWGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81574627"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2024 09:45:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5pLH-000duL-1w;
	Tue, 29 Oct 2024 16:45:15 +0000
Date: Wed, 30 Oct 2024 00:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1423/2444]
 drivers/xen/swiotlb-xen.c:450:17: error: implicit declaration of function
 'swiotlb_tbl_sync_single'; did you mean 'swiotlb_tbl_map_single'?
Message-ID: <202410300027.KeOEXbRZ-lkp@intel.com>
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
commit: 87e67752254e20f1a1d6e1b928cba07916e739a9 [1423/2444] swiotlb: split swiotlb_tbl_sync_single
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241030/202410300027.KeOEXbRZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300027.KeOEXbRZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300027.KeOEXbRZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/xen/swiotlb-xen.c: In function 'xen_swiotlb_map_page':
   drivers/xen/swiotlb-xen.c:406:17: error: too many arguments to function 'swiotlb_tbl_unmap_single'
     406 |                 swiotlb_tbl_unmap_single(dev, map, size, size, dir,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/swiotlb.h:5,
                    from arch/x86/include/asm/dma-mapping.h:13,
                    from include/linux/dma-mapping.h:202,
                    from include/linux/dma-direct.h:9,
                    from drivers/xen/swiotlb-xen.c:30:
   include/linux/swiotlb.h:48:13: note: declared here
      48 | extern void swiotlb_tbl_unmap_single(struct device *hwdev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c: In function 'xen_swiotlb_unmap_page':
   drivers/xen/swiotlb-xen.c:437:17: error: too many arguments to function 'swiotlb_tbl_unmap_single'
     437 |                 swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swiotlb.h:48:13: note: declared here
      48 | extern void swiotlb_tbl_unmap_single(struct device *hwdev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c: In function 'xen_swiotlb_sync_single_for_cpu':
>> drivers/xen/swiotlb-xen.c:450:17: error: implicit declaration of function 'swiotlb_tbl_sync_single'; did you mean 'swiotlb_tbl_map_single'? [-Werror=implicit-function-declaration]
     450 |                 swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 swiotlb_tbl_map_single
>> drivers/xen/swiotlb-xen.c:450:64: error: 'SYNC_FOR_CPU' undeclared (first use in this function)
     450 |                 swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
         |                                                                ^~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:450:64: note: each undeclared identifier is reported only once for each function it appears in
   drivers/xen/swiotlb-xen.c: In function 'xen_swiotlb_sync_single_for_device':
>> drivers/xen/swiotlb-xen.c:460:64: error: 'SYNC_FOR_DEVICE' undeclared (first use in this function)
     460 |                 swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
         |                                                                ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +450 drivers/xen/swiotlb-xen.c

063b8271ec8f706 Christoph Hellwig     2019-04-11  416  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  417  /*
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  418   * Unmap a single streaming mode DMA translation.  The dma_addr and size must
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  419   * match what was provided for in a previous xen_swiotlb_map_page call.  All
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  420   * other usages are undefined.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  421   *
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  422   * After this call, reads by the cpu to the buffer are guaranteed to see
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  423   * whatever the device wrote there.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  424   */
bf7954e797cded8 Christoph Hellwig     2019-07-24  425  static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
bf7954e797cded8 Christoph Hellwig     2019-07-24  426  		size_t size, enum dma_data_direction dir, unsigned long attrs)
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  427  {
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  428  	phys_addr_t paddr = xen_bus_to_phys(dev_addr);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  429  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  430  	BUG_ON(dir == DMA_NONE);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  431  
b4dca1512941aa8 Christoph Hellwig     2019-09-05  432  	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
09c789996bc487d Christoph Hellwig     2019-11-07  433  		xen_dma_sync_for_cpu(dev_addr, paddr, size, dir);
6cf054636261ca5 Stefano Stabellini    2013-10-25  434  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  435  	/* NOTE: We use dev_addr here, not paddr! */
68c608345cc569b Christoph Hellwig     2018-12-06  436  	if (is_xen_swiotlb_buffer(dev_addr))
3fc1ca00653db63 Lu Baolu              2019-09-06 @437  		swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  438  }
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  439  
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  440  static void
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  441  xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  442  		size_t size, enum dma_data_direction dir)
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  443  {
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  444  	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  445  
b4dca1512941aa8 Christoph Hellwig     2019-09-05  446  	if (!dev_is_dma_coherent(dev))
09c789996bc487d Christoph Hellwig     2019-11-07  447  		xen_dma_sync_for_cpu(dma_addr, paddr, size, dir);
6cf054636261ca5 Stefano Stabellini    2013-10-25  448  
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  449  	if (is_xen_swiotlb_buffer(dma_addr))
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11 @450  		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  451  }
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  452  
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  453  static void
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  454  xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  455  		size_t size, enum dma_data_direction dir)
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  456  {
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  457  	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  458  
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  459  	if (is_xen_swiotlb_buffer(dma_addr))
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11 @460  		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
2e12dceef3d3fb8 Christoph Hellwig     2019-04-11  461  
b4dca1512941aa8 Christoph Hellwig     2019-09-05  462  	if (!dev_is_dma_coherent(dev))
09c789996bc487d Christoph Hellwig     2019-11-07  463  		xen_dma_sync_for_device(dma_addr, paddr, size, dir);
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  464  }
dceb1a6819ab2c8 Christoph Hellwig     2017-05-21  465  

:::::: The code at line 450 was first introduced by commit
:::::: 2e12dceef3d3fb8d796e384aa242062d1643cad4 swiotlb-xen: simplify the DMA sync method implementations

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
