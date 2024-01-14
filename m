Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FD10958
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 18:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEjt/0n7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705256882; x=1736792882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kwjOuigHqXZxdUVIErqqFxiQl0Vu2rxkuaxsBwCc1o=;
  b=WEjt/0n7aSRToF3lZuSCXaW9+oRjm6OmmyalXyYDS4dtqpRDq6ycLeJN
   Q3ZatWmh7SnmG2lqo9Px0NIOjYXANFOuiJ1INSw1+AafRZt9g8OVn5jL/
   KgezG/vsuXKOj+r44u4045CMXdhgX9grYydaHBm/hAY5e4YVKtgSYK/CZ
   +a7QXcc9jr4viyr1GhdGWAcWPnskcMWvasncUAN+kcIQ8PwgtSDTv+udn
   /gmSzK3G3FKcx3+TvU8ZqZD9G/yboJZo0swJvCNEehfH09AmW1LWL4eTN
   vSMIDfNPTAw7ds3yHsO6vaOWyEtWjGBrgNl5zlEFiUZPXoqqTKk9r9ftk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="485648062"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="485648062"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 10:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="906841325"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="906841325"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Jan 2024 10:27:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP5DA-000BkG-0I;
	Sun, 14 Jan 2024 18:27:56 +0000
Date: Mon, 15 Jan 2024 02:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18112/21544]
 drivers/iommu/arm-smmu-v3-context.c:591:5: warning: no previous prototype
 for 'arm_smmu_get_cd_mpam'
Message-ID: <202401150234.kkcdLRso-lkp@intel.com>
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
commit: 2b7032bc021bef1eeca51dac8213fd3abce61dc4 [18112/21544] iommu/arm-smmu-v3: Add support to get SMMU mpam configuration
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240115/202401150234.kkcdLRso-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150234.kkcdLRso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150234.kkcdLRso-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm-smmu-v3-context.c:569:5: warning: no previous prototype for 'arm_smmu_set_cd_mpam' [-Wmissing-prototypes]
     569 | int arm_smmu_set_cd_mpam(struct iommu_pasid_table_ops *ops,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu-v3-context.c:591:5: warning: no previous prototype for 'arm_smmu_get_cd_mpam' [-Wmissing-prototypes]
     591 | int arm_smmu_get_cd_mpam(struct iommu_pasid_table_ops *ops,
         |     ^~~~~~~~~~~~~~~~~~~~
--
   drivers/iommu/arm-smmu-v3.c:4296:5: warning: no previous prototype for 'arm_smmu_set_dev_mpam' [-Wmissing-prototypes]
    4296 | int arm_smmu_set_dev_mpam(struct device *dev, int ssid, int partid, int pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu-v3.c:4338:5: warning: no previous prototype for 'arm_smmu_get_dev_mpam' [-Wmissing-prototypes]
    4338 | int arm_smmu_get_dev_mpam(struct device *dev, int ssid, int *partid, int *pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4298: warning: Function parameter or member 'dev' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4298: warning: Function parameter or member 'ssid' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4298: warning: Function parameter or member 'partid' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4298: warning: Function parameter or member 'pmg' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4298: warning: Function parameter or member 's1mpam' not described in 'arm_smmu_set_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4340: warning: Function parameter or member 'ssid' not described in 'arm_smmu_get_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4340: warning: Function parameter or member 'partid' not described in 'arm_smmu_get_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4340: warning: Function parameter or member 'pmg' not described in 'arm_smmu_get_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4340: warning: Function parameter or member 's1mpam' not described in 'arm_smmu_get_dev_mpam'


vim +/arm_smmu_get_cd_mpam +591 drivers/iommu/arm-smmu-v3-context.c

   590	
 > 591	int arm_smmu_get_cd_mpam(struct iommu_pasid_table_ops *ops,
   592			int ssid, int *partid, int *pmg)
   593	{
   594		struct arm_smmu_cd_tables *tbl = pasid_ops_to_tables(ops);
   595		u64 val;
   596		__le64 *cdptr = arm_smmu_get_cd_ptr(tbl, ssid);
   597	
   598		if (!cdptr)
   599			return -ENOMEM;
   600	
   601		val = le64_to_cpu(cdptr[5]);
   602		*partid = FIELD_GET(CTXDESC_CD_5_PARTID_MASK, val);
   603		*pmg = FIELD_GET(CTXDESC_CD_5_PMG_MASK, val);
   604	
   605		return 0;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
