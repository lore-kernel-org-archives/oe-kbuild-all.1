Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D140F2106
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRUhih0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700902090; x=1732438090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gMlO80YvbjlhKMIeB3F3OmCV53W0Tz2DKtDoD4NXx0I=;
  b=hRUhih0aYmQHC4Au/SX58Zeyzjb0IJ6lxUXQJKEh+Y9zpB2DcAFWY10Q
   aW96BCsqv+xJ474ZPsRrTtb8NJY9I5jnJ+MkhEVjLOSDGHTVAMtIgb/Fu
   Pmibx8DdaXS9Ldjh5y0O+0IeFNFCEKypQOWeGDQqHDE33KKsnFK9FWr6a
   cV0S3zmox73tyVsnpTss8yYDZABuc46Y2o/15AmXJy5fioCbIUKUOR3so
   GFAzsc5Q2m72UmOJNIIbA8ISmqkBo1o+vfue8VGQELu489K3sdX/+RiJv
   UEVPnR2oNnmKeX4VasmQCellDG3HyIf7b9ZaG8CQ+8rnYZs+60uBYUBOQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="396408290"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="396408290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 00:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="15825264"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2023 00:48:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6oKc-0003oI-0z;
	Sat, 25 Nov 2023 08:48:06 +0000
Date: Sat, 25 Nov 2023 16:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 32/41] drivers/iommu/mtk_iommu_v1.c:555:27:
 error: initialization of 'struct iommu_device * (*)(struct device *)' from
 incompatible pointer type 'struct iommu_device * (*)(struct iommu_probe_info
 *)'
Message-ID: <202311251529.ACflK7hu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: ae32e27c6ead4c84fab6cc3781197ec115c3dda9 [32/41] iommu/mtk_v1: Move to iommu_fw_alloc_per_device_ids()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311251529.ACflK7hu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251529.ACflK7hu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251529.ACflK7hu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/mtk_iommu_v1.c:555:27: error: initialization of 'struct iommu_device * (*)(struct device *)' from incompatible pointer type 'struct iommu_device * (*)(struct iommu_probe_info *)' [-Werror=incompatible-pointer-types]
     555 |         .probe_device   = mtk_iommu_v1_probe_device,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:555:27: note: (near initialization for 'mtk_iommu_v1_ops.probe_device')
   cc1: some warnings being treated as errors


vim +555 drivers/iommu/mtk_iommu_v1.c

b17336c55d8928 Honghui Zhang   2016-06-08  551  
ad9b10e533f6fb Yong Wu         2022-05-03  552  static const struct iommu_ops mtk_iommu_v1_ops = {
90057dc095dca0 Jason Gunthorpe 2023-09-13  553  	.identity_domain = &mtk_iommu_v1_identity_domain,
4efd98d41ea718 Jason Gunthorpe 2023-09-13  554  	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
ad9b10e533f6fb Yong Wu         2022-05-03 @555  	.probe_device	= mtk_iommu_v1_probe_device,
ad9b10e533f6fb Yong Wu         2022-05-03  556  	.probe_finalize = mtk_iommu_v1_probe_finalize,
ad9b10e533f6fb Yong Wu         2022-05-03  557  	.release_device	= mtk_iommu_v1_release_device,
57dbf81f50c82a Joerg Roedel    2020-04-29  558  	.device_group	= generic_device_group,
b577f7e679b763 Robin Murphy    2022-11-15  559  	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
8de000cf0265ea Yong Wu         2021-03-26  560  	.owner          = THIS_MODULE,
9a630a4b41a263 Lu Baolu        2022-02-16  561  	.default_domain_ops = &(const struct iommu_domain_ops) {
ad9b10e533f6fb Yong Wu         2022-05-03  562  		.attach_dev	= mtk_iommu_v1_attach_device,
b577f7e679b763 Robin Murphy    2022-11-15  563  		.map_pages	= mtk_iommu_v1_map,
b577f7e679b763 Robin Murphy    2022-11-15  564  		.unmap_pages	= mtk_iommu_v1_unmap,
ad9b10e533f6fb Yong Wu         2022-05-03  565  		.iova_to_phys	= mtk_iommu_v1_iova_to_phys,
ad9b10e533f6fb Yong Wu         2022-05-03  566  		.free		= mtk_iommu_v1_domain_free,
9a630a4b41a263 Lu Baolu        2022-02-16  567  	}
b17336c55d8928 Honghui Zhang   2016-06-08  568  };
b17336c55d8928 Honghui Zhang   2016-06-08  569  

:::::: The code at line 555 was first introduced by commit
:::::: ad9b10e533f6fb3fa74afdc2341774b1305c176f iommu/mediatek-v1: Just rename mtk_iommu to mtk_iommu_v1

:::::: TO: Yong Wu <yong.wu@mediatek.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
