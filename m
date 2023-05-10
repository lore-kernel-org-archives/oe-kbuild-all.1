Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894716426
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683738043; x=1715274043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2iW9p0c5wR9so+DXJLWNJ7nWOk7iRpgaL0ZLXQ69h58=;
  b=OSt1TW3f46jH/kYnBbCV1UspNyfAmaWy8ge1bcOmWK0/rDW7T67AEyMx
   4ZFG392uTSTWaehG+q7SKap1Fhg0PNg6AS+RXvY+tO1j9HX8JItv3FAaN
   Giiqy5YHClputQqNKkn3TxiWlI+INbf8s1Gr4NWFfKfPo5JKoJ6UHdjBw
   Zqids35807Z8mxAPGNp6b2csk6a38Cee3UfQ3c7bOqaX/exnct+O6I0PF
   RHhwNpgfr4eO/6B4LdEv1Yh2ZDbed1gdT2wJHwo0bPBDzL45NgcSlc2Au
   Qu6JJUWen/S5sdfRvdbtkYpDfvaPccOIucSLt72ghgCWHuz4kk711dV+u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="349102690"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="349102690"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="676910091"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="676910091"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2023 10:00:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwnB9-0003Rw-1o;
	Wed, 10 May 2023 17:00:39 +0000
Date: Thu, 11 May 2023 01:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-05102023-yi-no-bitmap 41/46]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2987:1: error: expected
 expression before '}' token
Message-ID: <202305110034.w9iXK6xy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-05102023-yi-no-bitmap
head:   1f8fcc5026dcf27335898350f990901be3308d88
commit: 51c768449eb592ff60d66965d125048932272733 [41/46] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
config: arm64-randconfig-r006-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110034.w9iXK6xy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/51c768449eb592ff60d66965d125048932272733
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-05102023-yi-no-bitmap
        git checkout 51c768449eb592ff60d66965d125048932272733
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iommu/arm/arm-smmu-v3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110034.w9iXK6xy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_domain_user_data_len':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2987:1: error: expected expression before '}' token
    2987 | };
         | ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2986:52: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    2986 |         return sizeof(struct iommu_hwpt_arm_smmuv3),
         |                                                    ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2987:1: error: control reaches end of non-void function [-Werror=return-type]
    2987 | };
         | ^
   cc1: some warnings being treated as errors


vim +2987 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  2981	
  2982	static int arm_smmu_domain_user_data_len(u32 hwpt_type)
  2983	{
  2984		if (hwpt_type != IOMMU_HWPT_TYPE_ARM_SMMUV3)
  2985			return -EOPNOTSUPP;
  2986		return sizeof(struct iommu_hwpt_arm_smmuv3),
> 2987	};
  2988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
