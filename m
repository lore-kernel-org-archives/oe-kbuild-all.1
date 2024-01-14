Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E502100
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdG5BL6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705238977; x=1736774977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nX35/pz5VOUyLW/CCJo/sToiMJP3ByMYZq3qHxz66rI=;
  b=mdG5BL6mbbpIkbpHFOo+kOR4UOVrtVOMhmjv8e6t9UfEpXEFFZpDK9R0
   6KvDVR47hWHwOPPjgRcjm+YM5A6Yu5DtaV6z8uwvX7upDKumWWUCCEOWN
   /6nYnjM51gKG6eAcjSFouh05B8EwCWPJV6ol9loUkWgSelDiDi6tO0HAM
   HZDm4zbNJZ5pQBVAgkAiLAneQMa8Mq9vENnvxTCUQm2P4S8NpUtVYelM/
   G3XRxXrP1DDTdY7bDYAuksHKGV/idTVU6MZZVfKoqki2aZs/jCWLlxHVC
   8Cafqaw12JpStgVauZB5rGSMiKriEfq/3qFCUYs1RCyM+vKw8t0UrKN6k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6181232"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="6181232"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 05:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="776484045"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="776484045"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jan 2024 05:29:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP0YO-000BXQ-0T;
	Sun, 14 Jan 2024 13:29:32 +0000
Date: Sun, 14 Jan 2024 21:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18111/21544]
 drivers/iommu/arm-smmu-v3-context.c:569:5: warning: no previous prototype
 for 'arm_smmu_set_cd_mpam'
Message-ID: <202401142150.OlphT3oj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 7c01a111ee8606b0c1986bb624808769d4236742 [18111/21544] iommu/arm-smmu-v3: Add support to configure mpam in STE/CD context
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240114/202401142150.OlphT3oj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401142150.OlphT3oj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401142150.OlphT3oj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm-smmu-v3-context.c:569:5: warning: no previous prototype for 'arm_smmu_set_cd_mpam' [-Wmissing-prototypes]
     569 | int arm_smmu_set_cd_mpam(struct iommu_pasid_table_ops *ops,
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/iommu/arm-smmu-v3.c:4267:5: warning: no previous prototype for 'arm_smmu_set_dev_mpam' [-Wmissing-prototypes]
    4267 | int arm_smmu_set_dev_mpam(struct device *dev, int ssid, int partid, int pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'dev' not described in 'arm_smmu_set_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'ssid' not described in 'arm_smmu_set_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'partid' not described in 'arm_smmu_set_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'pmg' not described in 'arm_smmu_set_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 's1mpam' not described in 'arm_smmu_set_dev_mpam'


vim +/arm_smmu_set_cd_mpam +569 drivers/iommu/arm-smmu-v3-context.c

   568	
 > 569	int arm_smmu_set_cd_mpam(struct iommu_pasid_table_ops *ops,
   570				 int ssid, int partid, int pmg)
   571	{
   572		struct arm_smmu_cd_tables *tbl = pasid_ops_to_tables(ops);
   573		u64 val;
   574		__le64 *cdptr = arm_smmu_get_cd_ptr(tbl, ssid);
   575	
   576		if (!cdptr)
   577			return -ENOMEM;
   578	
   579		val = le64_to_cpu(cdptr[5]);
   580		val &= ~CTXDESC_CD_5_PARTID_MASK;
   581		val |= FIELD_PREP(CTXDESC_CD_5_PARTID_MASK, partid);
   582		val &= ~CTXDESC_CD_5_PMG_MASK;
   583		val |= FIELD_PREP(CTXDESC_CD_5_PMG_MASK, pmg);
   584		WRITE_ONCE(cdptr[5], cpu_to_le64(val));
   585	
   586		iommu_pasid_flush(&tbl->pasid, ssid, true);
   587	
   588		return 0;
   589	}
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
