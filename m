Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD8820F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 05:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678082336; x=1709618336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4nhKizCOmdvTi/eAvroSwoszblCF4U3CNA95Z02sMI=;
  b=Dcn8gRmu2zL4UKVTAPSDiOkejoTLfe9Elrjt6mnQ5x7O4iThDMr8/SwF
   4/P18z+o9/rVYAPlVQoUDjXpcK3yoioD72NP/l3mPKDG834E/Id7u5hoo
   nboEEg3KITpowXfOmhbGdhdqsgodOkB2HsoTexNHJRD4vRMVmn18V05cv
   nGNI8Eipe7nrjV1dL4Uukdy7k0yMQq18hoV5R8S+kYm9k7588ond0/cyJ
   a8UQ6EPwCczWCYSI3+5zJ2FChwttlMgrRVfolAd/vOW/1E3LvIOLqLrlT
   Dewz18DvlPKzYql9OX1vq0ZypZ4vfxe/nCbRYIKoB4l0pSi5dLrl7Qfki
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421754021"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="421754021"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 21:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="1005265445"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="1005265445"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Mar 2023 21:58:50 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ3s1-000053-10;
	Mon, 06 Mar 2023 05:58:49 +0000
Date: Mon, 6 Mar 2023 13:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 2/3]
 drivers/iommu/intel/iommu.c:4823:3: error: field designator 'driver_type'
 does not refer to any field in type 'const struct iommu_ops'
Message-ID: <202303061326.R5OYEpBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
head:   1deb6b0bd8550875925ed23c0d294ed44599cf43
commit: c8061fe1dee28f79e1c01de0f4b3da33a5958702 [2/3] Additional change to
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061326.R5OYEpBr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/c8061fe1dee28f79e1c01de0f4b3da33a5958702
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout c8061fe1dee28f79e1c01de0f4b3da33a5958702
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/intel/ drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061326.R5OYEpBr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:4823:3: error: field designator 'driver_type' does not refer to any field in type 'const struct iommu_ops'
           .driver_type            = IOMMU_DEVICE_DATA_INTEL_VTD,
            ^
   1 error generated.
--
>> drivers/iommu/iommufd/device.c:309:30: error: no member named 'driver_type' in 'struct iommu_ops'
           cmd->out_device_type = ops->driver_type;
                                  ~~~  ^
   drivers/iommu/iommufd/device.c:312:11: error: no member named 'driver_type' in 'struct iommu_ops'
           if (ops->driver_type != IOMMU_DEVICE_DATA_SELFTEST)
               ~~~  ^
   drivers/iommu/iommufd/device.c:313:67: error: no member named 'driver_type' in 'struct iommu_ops'
                   cmd->out_pgtbl_type_bitmap = iommufd_supported_pgtbl_types[ops->driver_type];
                                                                              ~~~  ^
   3 errors generated.
--
>> drivers/iommu/iommufd/hw_pagetable.c:208:21: error: no member named 'driver_type' in 'struct iommu_ops'
           driver_type = ops->driver_type;
                         ~~~  ^
   1 error generated.
--
>> drivers/iommu/iommufd/selftest.c:338:3: error: field designator 'driver_type' does not refer to any field in type 'const struct iommu_ops'
           .driver_type = IOMMU_DEVICE_DATA_SELFTEST,
            ^
   1 error generated.


vim +4823 drivers/iommu/intel/iommu.c

fe7bde11fc710b drivers/iommu/intel/iommu.c Lu Baolu           2022-08-31  4806  
b0119e870837dc drivers/iommu/intel-iommu.c Joerg Roedel       2017-02-01  4807  const struct iommu_ops intel_iommu_ops = {
5d587b8de56eec drivers/iommu/intel-iommu.c Joerg Roedel       2014-09-05  4808  	.capable		= intel_iommu_capable,
fe7bde11fc710b drivers/iommu/intel/iommu.c Lu Baolu           2022-08-31  4809  	.hw_info		= intel_iommu_hw_info,
00a77deb0f2f2c drivers/iommu/intel-iommu.c Joerg Roedel       2015-03-26  4810  	.domain_alloc		= intel_iommu_domain_alloc,
4ecc098deecbd6 drivers/iommu/intel/iommu.c Lu Baolu           2022-12-27  4811  	.domain_alloc_user	= intel_iommu_domain_alloc_user,
e5d1841f18b240 drivers/iommu/intel-iommu.c Joerg Roedel       2020-04-29  4812  	.probe_device		= intel_iommu_probe_device,
6fc7020cf298aa drivers/iommu/intel-iommu.c Lu Baolu           2020-05-06  4813  	.probe_finalize		= intel_iommu_probe_finalize,
e5d1841f18b240 drivers/iommu/intel-iommu.c Joerg Roedel       2020-04-29  4814  	.release_device		= intel_iommu_release_device,
0659b8dc45a6b1 drivers/iommu/intel-iommu.c Eric Auger         2017-01-19  4815  	.get_resv_regions	= intel_iommu_get_resv_regions,
4a350a0ee5b0a1 drivers/iommu/intel-iommu.c Patrick Steinhardt 2019-12-27  4816  	.device_group		= intel_iommu_device_group,
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu           2019-03-25  4817  	.dev_enable_feat	= intel_iommu_dev_enable_feat,
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu           2019-03-25  4818  	.dev_disable_feat	= intel_iommu_dev_disable_feat,
8af46c784ecfe8 drivers/iommu/intel-iommu.c Lu Baolu           2019-05-25  4819  	.is_attach_deferred	= intel_iommu_is_attach_deferred,
7039d11b3e4af7 drivers/iommu/intel-iommu.c Joerg Roedel       2020-04-29  4820  	.def_domain_type	= device_def_domain_type,
eaca8889a1ef50 drivers/iommu/intel/iommu.c Lu Baolu           2022-10-31  4821  	.remove_dev_pasid	= intel_iommu_remove_dev_pasid,
a886d5a7e67bc4 drivers/iommu/intel/iommu.c Lu Baolu           2021-07-20  4822  	.pgsize_bitmap		= SZ_4K,
fe7bde11fc710b drivers/iommu/intel/iommu.c Lu Baolu           2022-08-31 @4823  	.driver_type		= IOMMU_DEVICE_DATA_INTEL_VTD,
56722a4398a306 drivers/iommu/intel-iommu.c Jacob Pan          2020-05-16  4824  #ifdef CONFIG_INTEL_IOMMU_SVM
8b73712115ebd6 drivers/iommu/intel/iommu.c Lu Baolu           2020-07-24  4825  	.page_response		= intel_svm_page_response,
56722a4398a306 drivers/iommu/intel-iommu.c Jacob Pan          2020-05-16  4826  #endif
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4827  	.default_domain_ops = &(const struct iommu_domain_ops) {
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4828  		.attach_dev		= intel_iommu_attach_device,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4829  		.map_pages		= intel_iommu_map_pages,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4830  		.unmap_pages		= intel_iommu_unmap_pages,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4831  		.iotlb_sync_map		= intel_iommu_iotlb_sync_map,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4832  		.flush_iotlb_all        = intel_flush_iotlb_all,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4833  		.iotlb_sync		= intel_iommu_tlb_sync,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4834  		.iova_to_phys		= intel_iommu_iova_to_phys,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4835  		.free			= intel_iommu_domain_free,
6043257b1de069 drivers/iommu/intel/iommu.c Jason Gunthorpe    2022-04-11  4836  		.enforce_cache_coherency = intel_iommu_enforce_cache_coherency,
9a630a4b41a263 drivers/iommu/intel/iommu.c Lu Baolu           2022-02-16  4837  	}
a8bcbb0de4a52f drivers/pci/intel-iommu.c   Joerg Roedel       2008-12-03  4838  };
9af88143b277f5 drivers/pci/intel-iommu.c   David Woodhouse    2009-02-13  4839  

:::::: The code at line 4823 was first introduced by commit
:::::: fe7bde11fc710b9fb7dadbf62ac5256a961217ee iommu/vt-d: Implement hw_info for iommu capability query

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Nicolin Chen <nicolinc@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
