Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834320F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678086054; x=1709622054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34h+IQE5Us39Lv90GS7FlDCervLEDHET7z3SsrXyPCE=;
  b=kQtMYYHYJnyZFUioy6qDTBj0X1O7Qvs/zqu9UqZ31o6sHwZLJUeuY8RH
   vKY3OfJZ7nYRP0sJU4Zw8RnP8JDjc6TCusiRkhqjZNq7F7rL5Y0J31xlA
   LZo9HWhauFm3xiFGom4FBCKUJkvj+Iqy+MfyKrnXi7CgSR8o9rmeqSbkA
   vsvgFv0hJWxGNV5XWQLOGG+1dManMJZYG/sC1wv44I/Jpq951M1cvx60n
   RlCUwMc7FseHv/zwytFwYt/VECBDXhABtHkJTSSeSucHIyTkuQCVt4CcI
   /6Lk6pSf8DG906J4Fbf1kLrfxHiuLLp3E9NCX+y7o5oaUldoabBnrE4HP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="335507591"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="335507591"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 23:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="819202596"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="819202596"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2023 23:00:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ4q3-00007L-1H;
	Mon, 06 Mar 2023 07:00:51 +0000
Date: Mon, 6 Mar 2023 15:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 2/3]
 drivers/iommu/iommufd/iommufd_test.h:108:49: warning: initialization of
 'struct module *' from 'unsigned int' makes pointer from integer without a
 cast
Message-ID: <202303061422.Qe85cfc0-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230306/202303061422.Qe85cfc0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/c8061fe1dee28f79e1c01de0f4b3da33a5958702
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout c8061fe1dee28f79e1c01de0f4b3da33a5958702
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061422.Qe85cfc0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommufd/selftest.c:338:10: error: 'const struct iommu_ops' has no member named 'driver_type'
     338 |         .driver_type = IOMMU_DEVICE_DATA_SELFTEST,
         |          ^~~~~~~~~~~
   In file included from drivers/iommu/iommufd/selftest.c:16:
>> drivers/iommu/iommufd/iommufd_test.h:108:49: warning: initialization of 'struct module *' from 'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     108 | #define IOMMU_DEVICE_DATA_SELFTEST              0xfeedbeef
         |                                                 ^~~~~~~~~~
   drivers/iommu/iommufd/selftest.c:338:24: note: in expansion of macro 'IOMMU_DEVICE_DATA_SELFTEST'
     338 |         .driver_type = IOMMU_DEVICE_DATA_SELFTEST,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/iommufd_test.h:108:49: note: (near initialization for 'mock_ops.owner')
     108 | #define IOMMU_DEVICE_DATA_SELFTEST              0xfeedbeef
         |                                                 ^~~~~~~~~~
   drivers/iommu/iommufd/selftest.c:338:24: note: in expansion of macro 'IOMMU_DEVICE_DATA_SELFTEST'
     338 |         .driver_type = IOMMU_DEVICE_DATA_SELFTEST,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/iommufd_test.h:108:49: warning: initialized field overwritten [-Woverride-init]
     108 | #define IOMMU_DEVICE_DATA_SELFTEST              0xfeedbeef
         |                                                 ^~~~~~~~~~
   drivers/iommu/iommufd/selftest.c:338:24: note: in expansion of macro 'IOMMU_DEVICE_DATA_SELFTEST'
     338 |         .driver_type = IOMMU_DEVICE_DATA_SELFTEST,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/iommufd_test.h:108:49: note: (near initialization for 'mock_ops.owner')
     108 | #define IOMMU_DEVICE_DATA_SELFTEST              0xfeedbeef
         |                                                 ^~~~~~~~~~
   drivers/iommu/iommufd/selftest.c:338:24: note: in expansion of macro 'IOMMU_DEVICE_DATA_SELFTEST'
     338 |         .driver_type = IOMMU_DEVICE_DATA_SELFTEST,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +108 drivers/iommu/iommufd/iommufd_test.h

f4b20bb34c83dc Jason Gunthorpe 2022-11-29  106  
e4e70ffa9538c0 Nicolin Chen    2022-12-14  107  /* Mock structs for IOMMU_DEVICE_GET_INFO ioctl */
e4e70ffa9538c0 Nicolin Chen    2022-12-14 @108  #define IOMMU_DEVICE_DATA_SELFTEST		0xfeedbeef
e4e70ffa9538c0 Nicolin Chen    2022-12-14  109  #define IOMMU_DEVICE_INFO_SELFTEST_REGVAL	0xdeadbeef
e4e70ffa9538c0 Nicolin Chen    2022-12-14  110  

:::::: The code at line 108 was first introduced by commit
:::::: e4e70ffa9538c03e4b9a724ade6434e53f18caba iommufd/selftest: Add coverage for IOMMU_DEVICE_GET_INFO ioctl

:::::: TO: Nicolin Chen <nicolinc@nvidia.com>
:::::: CC: Nicolin Chen <nicolinc@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
