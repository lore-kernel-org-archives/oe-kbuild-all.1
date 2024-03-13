Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0BE47A7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710336595; cv=none; b=MpvrCRXPA2+Pe/astTG7H2eF/Wo2gad2bWUjtcHlh4JKnAUwbSehkwU0ApHaVYqkotzXdRUoD8WEBY6d0j0WJH8UCSrKu1tfzKLxMY6ztUS4sXC9wE+4Kl/npKJcXSAQDOJ5tSVXeuerkffaq4OvfViF5cc/uPnfqdYcChUROPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710336595; c=relaxed/simple;
	bh=tqirwa3fKgy/J1P9cZOw9qPd7zlcng21I+KTx9DQuyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBBOhX4wSofxc15tfa4KpsBrs+4gnSKP8gXdQ3dP76OR20T2E1cPdkIUUlji3DwPKN+Oisj6ZDETsSXAFykUgxSNVaG1Z5NQhUpWoUKEvr39n9mGTqdaIawU67TDtJlGJS7v1G2iOdbAaisndq2Ll2pIb1nVLLmX++bkJgahRb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUHWLZHe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUHWLZHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710336593; x=1741872593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqirwa3fKgy/J1P9cZOw9qPd7zlcng21I+KTx9DQuyc=;
  b=LUHWLZHeWgtoRtLLWY0j3Mt+ClugEKrnG1Blg4MUzcsYufXumcK5USKJ
   KbiGT6eQYQ4YK+Mcu+QgVlandVh46wmraWRyJ8JiYOvj1ccXrqnaK+8gd
   hqnbSJcSgK10NbbJd+0DdE0svr7oyecXbLxp4A0qM0SJ/YtZEp71JPwWw
   /xHx8OnukP8zhqIZVhDg8+rBaUwRO1YxMVUaJdQLL8AA71cxlQeE7yvRB
   B5GGWJJbXhXq6JoPTxE4JzOMZqNJuIDK5ac3fVScuwL5368eDJ93TAPGK
   +Fhh5+sIK02qOq3j6aQi4zGQvXbjAnQ2qMT7C5ptjV5cxOTvG26r74BKn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5280070"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5280070"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 06:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="16649693"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Mar 2024 06:29:49 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkOfy-000CPL-2s;
	Wed, 13 Mar 2024 13:29:46 +0000
Date: Wed, 13 Mar 2024 21:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/xen/swiotlb-xen.c:450:3: error: implicit declaration of
 function 'swiotlb_tbl_sync_single'
Message-ID: <202403132128.fvqwx6Qo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: ee07aa625dbf249381b702591b4722e8308daf59 swiotlb: split swiotlb_tbl_sync_single
date:   9 months ago
config: x86_64-randconfig-001-20240305 (https://download.01.org/0day-ci/archive/20240313/202403132128.fvqwx6Qo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132128.fvqwx6Qo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132128.fvqwx6Qo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/xen/swiotlb-xen.c:407:5: error: too many arguments to function call, expected 5, have 6
     406 |                 swiotlb_tbl_unmap_single(dev, map, size, size, dir,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
     407 |                                 attrs | DMA_ATTR_SKIP_CPU_SYNC);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swiotlb.h:48:13: note: 'swiotlb_tbl_unmap_single' declared here
      48 | extern void swiotlb_tbl_unmap_single(struct device *hwdev,
         |             ^                        ~~~~~~~~~~~~~~~~~~~~~
      49 |                                      phys_addr_t tlb_addr,
         |                                      ~~~~~~~~~~~~~~~~~~~~~
      50 |                                      size_t mapping_size,
         |                                      ~~~~~~~~~~~~~~~~~~~~
      51 |                                      enum dma_data_direction dir,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                                      unsigned long attrs);
         |                                      ~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:437:59: error: too many arguments to function call, expected 5, have 6
     437 |                 swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~                                ^~~~~
   include/linux/swiotlb.h:48:13: note: 'swiotlb_tbl_unmap_single' declared here
      48 | extern void swiotlb_tbl_unmap_single(struct device *hwdev,
         |             ^                        ~~~~~~~~~~~~~~~~~~~~~
      49 |                                      phys_addr_t tlb_addr,
         |                                      ~~~~~~~~~~~~~~~~~~~~~
      50 |                                      size_t mapping_size,
         |                                      ~~~~~~~~~~~~~~~~~~~~
      51 |                                      enum dma_data_direction dir,
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                                      unsigned long attrs);
         |                                      ~~~~~~~~~~~~~~~~~~~
>> drivers/xen/swiotlb-xen.c:450:3: error: implicit declaration of function 'swiotlb_tbl_sync_single' [-Werror,-Wimplicit-function-declaration]
     450 |                 swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
         |                 ^
   drivers/xen/swiotlb-xen.c:450:3: note: did you mean 'swiotlb_tbl_map_single'?
   include/linux/swiotlb.h:44:13: note: 'swiotlb_tbl_map_single' declared here
      44 | phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
         |             ^
>> drivers/xen/swiotlb-xen.c:450:50: error: use of undeclared identifier 'SYNC_FOR_CPU'
     450 |                 swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
         |                                                                ^
   drivers/xen/swiotlb-xen.c:460:3: error: implicit declaration of function 'swiotlb_tbl_sync_single' [-Werror,-Wimplicit-function-declaration]
     460 |                 swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
         |                 ^
>> drivers/xen/swiotlb-xen.c:460:50: error: use of undeclared identifier 'SYNC_FOR_DEVICE'
     460 |                 swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
         |                                                                ^
   6 errors generated.


vim +/swiotlb_tbl_sync_single +450 drivers/xen/swiotlb-xen.c

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
