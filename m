Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856949442
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2PNbmA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700948238; x=1732484238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGjg8z5rAqYqac7UXg5GINpUk29XnTEBlDw1E7Evijk=;
  b=e2PNbmA69OZc5aIJnrAiJcI8MEq/rfPhARhE0TkNPyCRLfOZb68pHDln
   G5AT1L67c4XCEteMFDWZ3CcwuyYDIhzZFW4b0cszSaJLD/tXCxXYBP2zR
   bez8t17BKi6a94eXqCNisv2CFxUOlB2ye/KowMzMuiu9jYLm2kGX82nxx
   SyGNG+n/k+nBK2oQyK9cdhhSNrruE7uYP/gfh0fykPaUWXrTODX1Zc8vG
   8cgIniWk/zcV1BqreYsdV0TbYQjfA0XVREjJMnucN3U2/hvLb0nabNbH7
   VCqvRwBOL7otagnK2IFVrSZl1unOZNhE+Sgdjyc7katWEGirNSA8odNQv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="389689952"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="389689952"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 13:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="838351893"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="838351893"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2023 13:37:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r70Kw-0004S6-15;
	Sat, 25 Nov 2023 21:37:14 +0000
Date: Sun, 26 Nov 2023 05:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 18/41] drivers/iommu/virtio-iommu.c:944:
 undefined reference to `of_iommu_get_resv_regions'
Message-ID: <202311260549.mf8K1RM9-lkp@intel.com>
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
commit: 76d215d5fde4889841fc85d21211f08fc7623380 [18/41] iommu/of: Call of_iommu_get_resv_regions() directly
config: x86_64-randconfig-003-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260549.mf8K1RM9-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260549.mf8K1RM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260549.mf8K1RM9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/dma-iommu.o: in function `iommu_dma_get_resv_regions':
   drivers/iommu/dma-iommu.c:478: undefined reference to `of_iommu_get_resv_regions'
   ld: drivers/iommu/virtio-iommu.o: in function `viommu_get_resv_regions':
>> drivers/iommu/virtio-iommu.c:944: undefined reference to `of_iommu_get_resv_regions'


vim +944 drivers/iommu/virtio-iommu.c

   913	
   914	static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
   915	{
   916		struct iommu_resv_region *entry, *new_entry, *msi = NULL;
   917		struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
   918		int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
   919	
   920		list_for_each_entry(entry, &vdev->resv_regions, list) {
   921			if (entry->type == IOMMU_RESV_MSI)
   922				msi = entry;
   923	
   924			new_entry = kmemdup(entry, sizeof(*entry), GFP_KERNEL);
   925			if (!new_entry)
   926				return;
   927			list_add_tail(&new_entry->list, head);
   928		}
   929	
   930		/*
   931		 * If the device didn't register any bypass MSI window, add a
   932		 * software-mapped region.
   933		 */
   934		if (!msi) {
   935			msi = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
   936						      prot, IOMMU_RESV_SW_MSI,
   937						      GFP_KERNEL);
   938			if (!msi)
   939				return;
   940	
   941			list_add_tail(&msi->list, head);
   942		}
   943	
 > 944		of_iommu_get_resv_regions(dev, head);
   945	}
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
