Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3FB10780
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 23:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677800024; x=1709336024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1+6LIIgd1sk8l0loW13/orps0kMhimux4IIjDo1FA4=;
  b=WGUK2m3otGUijmItRVRKoZCgEtGay6bgdsdeYP7kxUhuO9SevCZEzjuR
   26uuOZso/98PIyceu3wEPpXRAYZG2V33+M7Slr1QXNL/14QbqtRiaH+0K
   Kh2cAtgO/q+lcFWGa5OK+35rEwofaUBkjIwSFfyPKt20KJ7EBapnx/+gy
   GuLLw6si7j2hOJo1gwiS8pZrdq+9rlxhc2B7/1SN0WEv7PTxpOJR3wXIW
   TYFMfTYl4yk5s7eZDsOGOsYib09d9d5HPawaMOKBjmv4vTFdO0rI56Ecy
   dXIbGDF76JIx+oESAVhmlLBRMYRk4BkPeMMGtAG0IDq/fdWDQTO6WKOMD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362482268"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="362482268"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 15:33:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="785042543"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="785042543"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2023 15:33:40 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXsQe-0000zM-0K;
	Thu, 02 Mar 2023 23:33:40 +0000
Date: Fri, 3 Mar 2023 07:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:iommu-map 2/2] drivers/iommu/dma-iommu.c:1544:33:
 warning: 'iommu_dma_ops' defined but not used
Message-ID: <202303030711.mclaZLq4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git iommu-map
head:   e2620c92a19b9e64162ce85e924a6adc5af285e2
commit: e2620c92a19b9e64162ce85e924a6adc5af285e2 [2/2] dma-mapping: Replace indirect functions calls to improve performance
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230303/202303030711.mclaZLq4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=e2620c92a19b9e64162ce85e924a6adc5af285e2
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc iommu-map
        git checkout e2620c92a19b9e64162ce85e924a6adc5af285e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030711.mclaZLq4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:1544:33: warning: 'iommu_dma_ops' defined but not used [-Wunused-const-variable=]
    1544 | static const struct dma_map_ops iommu_dma_ops = {
         |                                 ^~~~~~~~~~~~~


vim +/iommu_dma_ops +1544 drivers/iommu/dma-iommu.c

6d9870b7e5def2 John Garry        2022-07-14  1543  
06d60728ff5c01 Christoph Hellwig 2019-05-20 @1544  static const struct dma_map_ops iommu_dma_ops = {
30280eee2db10e Logan Gunthorpe   2022-07-08  1545  	.flags			= DMA_F_PCI_P2PDMA_SUPPORTED,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1546  	.alloc			= iommu_dma_alloc,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1547  	.free			= iommu_dma_free,
efa70f2fdc842e Christoph Hellwig 2020-09-01  1548  	.alloc_pages		= dma_common_alloc_pages,
efa70f2fdc842e Christoph Hellwig 2020-09-01  1549  	.free_pages		= dma_common_free_pages,
e817ee5f2f95ca Christoph Hellwig 2021-01-28  1550  	.alloc_noncontiguous	= iommu_dma_alloc_noncontiguous,
e817ee5f2f95ca Christoph Hellwig 2021-01-28  1551  	.free_noncontiguous	= iommu_dma_free_noncontiguous,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1552  	.mmap			= iommu_dma_mmap,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1553  	.get_sgtable		= iommu_dma_get_sgtable,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1554  	.map_page		= iommu_dma_map_page,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1555  	.unmap_page		= iommu_dma_unmap_page,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1556  	.map_sg			= iommu_dma_map_sg,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1557  	.unmap_sg		= iommu_dma_unmap_sg,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1558  	.sync_single_for_cpu	= iommu_dma_sync_single_for_cpu,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1559  	.sync_single_for_device	= iommu_dma_sync_single_for_device,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1560  	.sync_sg_for_cpu	= iommu_dma_sync_sg_for_cpu,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1561  	.sync_sg_for_device	= iommu_dma_sync_sg_for_device,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1562  	.map_resource		= iommu_dma_map_resource,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1563  	.unmap_resource		= iommu_dma_unmap_resource,
158a6d3ce3bcfc Yoshihiro Shimoda 2019-08-28  1564  	.get_merge_boundary	= iommu_dma_get_merge_boundary,
6d9870b7e5def2 John Garry        2022-07-14  1565  	.opt_mapping_size	= iommu_dma_opt_mapping_size,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1566  };
06d60728ff5c01 Christoph Hellwig 2019-05-20  1567  

:::::: The code at line 1544 was first introduced by commit
:::::: 06d60728ff5c01795ac0bad66a5c42e3e78dcb6b iommu/dma: move the arm64 wrappers to common code

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
