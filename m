Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C5134D6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694106320; x=1725642320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SffN8TSnWIdzeI1SrSXFNcUU6v83Cayml7LHeRQvcxQ=;
  b=W4LGmrVfExFhjbfDWq2pVDARi2k55uSBnsW1gd/F/7LT84ABnfBWchSJ
   36vRbbPiBcJt1HdXSU3oM6pim3KH6QgrTe+hGktoy2I4E6yjlMRSeA+0q
   t1geqFyoyn3E6pXI52guLaPmJKg50tmOlyjg26KKrhDFIRT4eRMVI0NyD
   ijGt1bQ1B+dPA6U4sP9jZR/s1tWjZZDTfUtjZMllLgPRFJNBdhK8/OCad
   tKGXXOvlxA937Co3praZD6o3TeEopq0ZxtEx1//FEnldXHhVdUb+ppdvI
   K0n8yFQUCtCvPY4TUKJ8LK5eXBL6Uy5xW5+P91qTwxhrYj1/KWBmmvX6q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="377327463"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="377327463"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="812232440"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="812232440"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2023 10:05:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIRP-0001Ph-19;
	Thu, 07 Sep 2023 17:05:15 +0000
Date: Fri, 8 Sep 2023 01:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_09072023-yi 57/63]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2069:29: warning:
 'arm_smmu_domain_alloc' defined but not used
Message-ID: <202309080041.lnhiYreB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_09072023-yi
head:   460a16348f1eeb401a169d0ad1815f8ac4d8c3b2
commit: 8edfc9bba9237d52efb488511659a6a534d4d0e6 [57/63] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080041.lnhiYreB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080041.lnhiYreB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080041.lnhiYreB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3000:29: error: redefinition of 'arm_smmu_domain_alloc'
    3000 | static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
         |                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2069:29: note: previous definition of 'arm_smmu_domain_alloc' with type 'struct iommu_domain *(unsigned int)'
    2069 | static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
         |                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3036:35: error: initialization of 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  u32,  struct iommu_domain *, const struct iommu_user_data *)' {aka 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  unsigned int,  struct iommu_domain *, const struct iommu_user_data *)'} from incompatible pointer type 'struct iommu_domain * (*)(struct device *, enum iommu_hwpt_type,  struct iommu_domain *, const struct iommu_user_data *)' [-Werror=incompatible-pointer-types]
    3036 |         .domain_alloc_user      = arm_smmu_domain_alloc_user,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3036:35: note: (near initialization for 'arm_smmu_ops.domain_alloc_user')
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2069:29: warning: 'arm_smmu_domain_alloc' defined but not used [-Wunused-function]
    2069 | static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
         |                             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/arm_smmu_domain_alloc +2069 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

49b157a777b54b drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Nicolin Chen          2022-09-22  2068  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27 @2069  static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2070  {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2071  	struct arm_smmu_domain *smmu_domain;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2072  
386fa64fd52baa drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Lu Baolu              2022-10-31  2073  	if (type == IOMMU_DOMAIN_SVA)
386fa64fd52baa drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Lu Baolu              2022-10-31  2074  		return arm_smmu_sva_domain_alloc();
386fa64fd52baa drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Lu Baolu              2022-10-31  2075  
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2017-01-06  2076  	if (type != IOMMU_DOMAIN_UNMANAGED &&
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2017-01-06  2077  	    type != IOMMU_DOMAIN_DMA &&
beb3c6a066bff1 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2017-01-06  2078  	    type != IOMMU_DOMAIN_IDENTITY)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2079  		return NULL;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2080  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2081  	/*
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2082  	 * Allocate the domain and initialise some of its data structures.
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2083  	 * We can't really do anything meaningful until we've added a
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2084  	 * master.
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2085  	 */
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2086  	smmu_domain = kzalloc(sizeof(*smmu_domain), GFP_KERNEL);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2087  	if (!smmu_domain)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2088  		return NULL;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2089  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2090  	mutex_init(&smmu_domain->init_mutex);
2a7e62f51696ad drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2091  	INIT_LIST_HEAD(&smmu_domain->devices);
2a7e62f51696ad drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2092  	spin_lock_init(&smmu_domain->devices_lock);
32784a9562fb05 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2020-11-06  2093  	INIT_LIST_HEAD(&smmu_domain->mmu_notifiers);
2a7e62f51696ad drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2094  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2095  	return &smmu_domain->domain;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2096  }
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  2097  

:::::: The code at line 2069 was first introduced by commit
:::::: 48ec83bcbcf5090fcdf74a6168f161d247492979 iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
