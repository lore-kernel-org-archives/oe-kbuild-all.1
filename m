Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8B210F2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayhswlyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704365518; x=1735901518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cepOlT5SfluGHlMlhapA0rfILiQASgnY/2g2Y8eSR9I=;
  b=ayhswlyfRyo1yMVgI3IZLQbX2X+I++Wsij973ULMLSkUgqzn4fbSpquu
   qFxxQP2ErdYHrOQpPd0k0eB63OCK2GBZX2FFTEjhtGU/fd1jF6e3dulvA
   z8l2nTGnGWt7C/6UDgnDhH5V9TVk2ao24rpZ6wdxXeYiky77FVSC+1at8
   y+JSb4jOkCOVdt9xDLAQGlGI39k/Bluu6DT6WaSDFjijgI8j6BqYmNh3n
   m0rJUi3n+By266u64V7oChnJiXNlU6yMfI1ZGJ2MP5o8Br6clV3uh+CWR
   aBQLJsAHcfd2PVPXDYUhHDNYuXeSYtbr67x1YSgqDfW2G0dIOm6tsI7H8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="428366337"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="428366337"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 02:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899245950"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="899245950"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jan 2024 02:51:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLLKL-000NBY-2s;
	Thu, 04 Jan 2024 10:51:53 +0000
Date: Thu, 4 Jan 2024 18:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, "Song, Youquan" <youquan.song@intel.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Chen Zhuo <sagazchen@tencent.com>,
	Xinghui Li <korantli@tencent.com>
Subject: drivers/xen/swiotlb-xen.c:450:17: error: implicit declaration of
 function 'swiotlb_tbl_sync_single'; did you mean 'swiotlb_tbl_map_single'?
Message-ID: <202401041825.x8JqxMf6-lkp@intel.com>
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
commit: ee07aa625dbf249381b702591b4722e8308daf59 swiotlb: split swiotlb_tbl_sync_single
date:   7 months ago
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240104/202401041825.x8JqxMf6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401041825.x8JqxMf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041825.x8JqxMf6-lkp@intel.com/

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

^590eaf1fec755 Kaixu Xia         2021-03-16  439  
^590eaf1fec755 Kaixu Xia         2021-03-16  440  static void
^590eaf1fec755 Kaixu Xia         2021-03-16  441  xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
^590eaf1fec755 Kaixu Xia         2021-03-16  442  		size_t size, enum dma_data_direction dir)
^590eaf1fec755 Kaixu Xia         2021-03-16  443  {
^590eaf1fec755 Kaixu Xia         2021-03-16  444  	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
^590eaf1fec755 Kaixu Xia         2021-03-16  445  
^590eaf1fec755 Kaixu Xia         2021-03-16  446  	if (!dev_is_dma_coherent(dev))
c3fd7ea8b7a5d9 Christoph Hellwig 2019-11-07  447  		xen_dma_sync_for_cpu(dma_addr, paddr, size, dir);
^590eaf1fec755 Kaixu Xia         2021-03-16  448  
^590eaf1fec755 Kaixu Xia         2021-03-16  449  	if (is_xen_swiotlb_buffer(dma_addr))
^590eaf1fec755 Kaixu Xia         2021-03-16 @450  		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
^590eaf1fec755 Kaixu Xia         2021-03-16  451  }
^590eaf1fec755 Kaixu Xia         2021-03-16  452  
^590eaf1fec755 Kaixu Xia         2021-03-16  453  static void
^590eaf1fec755 Kaixu Xia         2021-03-16  454  xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
^590eaf1fec755 Kaixu Xia         2021-03-16  455  		size_t size, enum dma_data_direction dir)
^590eaf1fec755 Kaixu Xia         2021-03-16  456  {
^590eaf1fec755 Kaixu Xia         2021-03-16  457  	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
^590eaf1fec755 Kaixu Xia         2021-03-16  458  
^590eaf1fec755 Kaixu Xia         2021-03-16  459  	if (is_xen_swiotlb_buffer(dma_addr))
^590eaf1fec755 Kaixu Xia         2021-03-16 @460  		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
^590eaf1fec755 Kaixu Xia         2021-03-16  461  
^590eaf1fec755 Kaixu Xia         2021-03-16  462  	if (!dev_is_dma_coherent(dev))
c3fd7ea8b7a5d9 Christoph Hellwig 2019-11-07  463  		xen_dma_sync_for_device(dma_addr, paddr, size, dir);
^590eaf1fec755 Kaixu Xia         2021-03-16  464  }
^590eaf1fec755 Kaixu Xia         2021-03-16  465  

:::::: The code at line 450 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
