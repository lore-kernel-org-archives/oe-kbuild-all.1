Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A44F182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9NoCo9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700957641; x=1732493641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TDVYqArMOOFIbpfZHi/QnmGjc9RXlrAdEGlqydcDcVk=;
  b=h9NoCo9MZULHUwCb4unAVMatCmT58GoEZhNxwLU0Mhr+wooETmCVtpBd
   ySHLlcADHSGMRaiqOVBu+BoMI7ZhHclLP4XPsZgGLh3nZBpkAhoZKJ8ZD
   TpN9jCS2BbNZii+juBpe5Z4p8qWRj0WPBuOnyVL1z3DyucCYRsjYD42TF
   ZjSzL+bM1K0LCQepP2Nj8ul5Yi7DeDa8fCvg7ccOaz0p42CL2mCAw0uEw
   ocazmTe16iR0WNhtaoOwXUatvjSOXDMdj0FedapIaouaYq4sGJJw9qgmM
   MVIa7ymGHlJMB9kWuIROHF96gDM9EwUmAGT0/wli1TIouiww6WzIOxV0X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="389694556"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="389694556"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 16:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="16269542"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2023 16:13:59 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r72mb-0004ag-1c;
	Sun, 26 Nov 2023 00:13:57 +0000
Date: Sun, 26 Nov 2023 08:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 35/41] include/linux/iommu-driver.h:134:
 undefined reference to `iommu_fw_get_u32_ids'
Message-ID: <202311260745.Hx7ARiG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   49c7574491cc9c8e8f21a8e8acb635b0e0bdfd61
commit: d0a141235082defd318c48bb011795daa8610d51 [35/41] iommu/virtio: Move to iommu_fw_alloc_per_device_ids()
config: x86_64-randconfig-003-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260745.Hx7ARiG0-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260745.Hx7ARiG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260745.Hx7ARiG0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/dma-iommu.o: in function `iommu_dma_get_resv_regions':
   drivers/iommu/dma-iommu.c:478: undefined reference to `of_iommu_get_resv_regions'
   ld: drivers/iommu/virtio-iommu.o: in function `viommu_get_resv_regions':
   drivers/iommu/virtio-iommu.c:941: undefined reference to `of_iommu_get_resv_regions'
   ld: drivers/iommu/virtio-iommu.o: in function `__iommu_fw_alloc_per_device_ids':
>> include/linux/iommu-driver.h:134: undefined reference to `iommu_fw_get_u32_ids'


vim +134 include/linux/iommu-driver.h

11c0ab049c38f5 Jason Gunthorpe 2023-11-23  123  
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  124  static inline void *
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  125  __iommu_fw_alloc_per_device_ids(struct iommu_probe_info *pinf, void *mem,
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  126  				unsigned int num_ids, unsigned int *num_ids_p,
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  127  				u32 *ids_p)
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  128  {
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  129  	int ret;
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  130  
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  131  	if (!mem)
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  132  		return ERR_PTR(-ENOMEM);
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  133  
11c0ab049c38f5 Jason Gunthorpe 2023-11-23 @134  	ret = iommu_fw_get_u32_ids(pinf, ids_p);
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  135  	if (ret) {
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  136  		kfree(mem);
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  137  		return ERR_PTR(ret);
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  138  	}
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  139  
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  140  	*num_ids_p = num_ids;
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  141  	return mem;
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  142  }
11c0ab049c38f5 Jason Gunthorpe 2023-11-23  143  

:::::: The code at line 134 was first introduced by commit
:::::: 11c0ab049c38f52835d351a109a049cef437648f iommu: Add iommu_fw_alloc_per_device_ids()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
