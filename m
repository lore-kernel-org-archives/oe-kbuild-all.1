Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910AA1C774
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683803946; x=1715339946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/WmiKyGabNZD1Aq3ULmEC9inSlnDyLHMKq94t3Ra40=;
  b=m2YP0S8w33e5OS5hIG4xfhXyHgX7YWQLcLaaH5MfIQb9M8DrVM8jt5Wz
   z0u03V3w+IuBjltgTFSNDNz36pViiNisw95IG5weFoHwBuKtxotEGQ68g
   NcE8h4Ulj3gYjweCgXOCxJm0mhmfPxLyMVc+bN/kmNn9/420puxoYeMlD
   zgXhnGp9k+NCwc+jiGGQ9Ylq7cOpus3n5SdExTXPmCw3215dN+i5wMCa6
   8WSshiRNiYgUIN1dmHzf/fJj/rCnGJkV2vvWQWjRzHYPI4fGEmbUd1OIL
   uA77LCqaQyu06tcy7GHwxS6GABNT4yJyBfNh9ujMs9rI8jaRaHe29i0/a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330827819"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="330827819"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 04:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="702693200"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="702693200"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 May 2023 04:19:05 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px4K8-0003z2-1c;
	Thu, 11 May 2023 11:19:04 +0000
Date: Thu, 11 May 2023 19:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-05102023-yi-has-bitmap 43/48]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2986:45: error: expected ';'
 after return statement
Message-ID: <202305111917.Rb3QmYMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-05102023-yi-has-bitmap
head:   2281c410bf6525b4d677b69ba969edb2627b57f4
commit: c7decd948d43dfa09e243ccf0c7f3ae7c2789881 [43/48] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
config: arm64-buildonly-randconfig-r005-20230511 (https://download.01.org/0day-ci/archive/20230511/202305111917.Rb3QmYMD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/c7decd948d43dfa09e243ccf0c7f3ae7c2789881
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-05102023-yi-has-bitmap
        git checkout c7decd948d43dfa09e243ccf0c7f3ae7c2789881
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iommu/arm/arm-smmu-v3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111917.Rb3QmYMD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2986:45: error: expected ';' after return statement
           return sizeof(struct iommu_hwpt_arm_smmuv3),
                                                      ^
                                                      ;
   1 error generated.


vim +2986 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  2981	
  2982	static int arm_smmu_domain_user_data_len(u32 hwpt_type)
  2983	{
  2984		if (hwpt_type != IOMMU_HWPT_TYPE_ARM_SMMUV3)
  2985			return -EOPNOTSUPP;
> 2986		return sizeof(struct iommu_hwpt_arm_smmuv3),
  2987	};
  2988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
