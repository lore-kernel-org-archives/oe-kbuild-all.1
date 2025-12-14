Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FD139D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765676982; cv=none; b=glQoZl6g2ogt786eLYflCQl/0xVGszD9R+hsJ+Ng5jWxHg4EmLbXeWjUqogfK4lc4DUzuEBynRm0A/yM5k+ZuUsChV9B+FkwYOv4zD+PXUUT32lbdddZVCWXWr4HjAIEHWyCHAhPXdDAgl81EZd/1nxCUDf+TxDE44ebQaaCe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765676982; c=relaxed/simple;
	bh=z0roiZM4ZctiuZ9ft6+wlULwqi/V5dB6vGRWq1L5jS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nU4QuZRiFzDWEKuQqo+gJYNIoT2UDVZyV6P5lSXzjFRi+A0BnsT8tClXL60HNHZXZX45BRDy3gSr9bopZzELSNyE5ti9RFhdAjFZ2/Do8m49PMjkbfBGmyernfLVw+ggRutFuXS27GvAsiCjfTx8rHPjASdPWXfepoNsUHts4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccdR4iHl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccdR4iHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765676980; x=1797212980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z0roiZM4ZctiuZ9ft6+wlULwqi/V5dB6vGRWq1L5jS0=;
  b=ccdR4iHlJoLiFSPxg16wakU/FHP9iNhGmiMoLsqniAsGGeCyIn3FCakQ
   dduCYmpHKglowRfb+mo4tcYZ3SEMo8goPp30vxLMp56tWnuwLIuKlNncr
   nJy0CNftYpERAlnaPkkaekPfZ1iWwq33UfYwMzur17JWT5btns8E6cbPA
   P3S9nI5u3sTAdP34dCbSrm5ZQ+DHgDEAP9Xf9Xv1Pghtj0QAsZ1TbYW3t
   o0QH//d2CDtrpkpa4VsmBGn3o6Cj0/2sfJ4lepMs2YGNvvKgvxwzzU7Wu
   ws+egAIS479lCaPoj4r1kxJcJZOLBkPry+DUxXs6YP6cN0WN0Z+IjIv3W
   Q==;
X-CSE-ConnectionGUID: iCyCMxVCSN2lWTT60OdVxw==
X-CSE-MsgGUID: xGzCBrNARqG1uuR1AaiQSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70209652"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70209652"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 17:49:40 -0800
X-CSE-ConnectionGUID: o5DwiDJcRg2Z6Fw5sdXOGw==
X-CSE-MsgGUID: nhOC8T1lT9iCllJnxNseqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197180544"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 17:49:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbEt-000000008RN-3e4M;
	Sun, 14 Dec 2025 01:49:35 +0000
Date: Sun, 14 Dec 2025 09:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/iommu/arm-smmu-v3-context.c:591:5: warning: no previous prototype
 for 'arm_smmu_get_cd_mpam'
Message-ID: <202512140917.x1FlS27Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xingang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 2b7032bc021bef1eeca51dac8213fd3abce61dc4 [1942/1942] iommu/arm-smmu-v3: Add support to get SMMU mpam configuration
config: arm64-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140917.x1FlS27Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140917.x1FlS27Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140917.x1FlS27Y-lkp@intel.com/

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
   drivers/iommu/arm-smmu-v3.c:4340: warning: Function parameter or member 's1mpam' not described in 'arm_smmu_get_dev_mpam'


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
