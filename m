Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A07D2673AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765666952; cv=none; b=IIdDwmghGVLz2F683lA5BX5UMv18mtpZ50xcVywMpeLSv8HRdYp/KB7gn1UAH8KkC5Ocbp3r4IiCNQ/yhWvSPB9qwYat3ytUFwJJXDzP3AB0+DxIhXJ4wiWrb878K0HyktzyhK3EK8YccZXoxagSAUWICifJ0AfiMGaCS9qhzEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765666952; c=relaxed/simple;
	bh=YCq6ZMpkFq/+rW01GGquREtGHlcgH/HcBEbZoToMH94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcIpw6eBlhLvPbcCi7WmEYlDoDl21clQ+Epw13DWhr9+ZA/yImx5YCvUfOCNKM/XRcLwxkkb9tes9Dwvv6tlbRTlIMpzkdgtpp1ddXFf1CyrAKWgFnNO5JXvYdRB0T+74pQESexWEuQxbIe4YZ+y3NptOS/1GSroZ35p0Do9+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwfGACHx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwfGACHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765666950; x=1797202950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCq6ZMpkFq/+rW01GGquREtGHlcgH/HcBEbZoToMH94=;
  b=IwfGACHxDx94Aq1igGG8cri+MeSRsFFHnS9es3SFNEwWEyMuaJxHegan
   PJnzTlX/Z/8Kuyy75lkFAKLvGf8vadpv/OSxAw85DnFoj0vJj8IifoIyh
   r7yFQxIUHJ7yIi+fbFozh5EIUpFWJrOntuU6wPkJwXD1WrWmuSTzybTx7
   w5EHE5NoXFxFswM619R+Gl0Mb8UaGF8XAHT/2/7MQUwSbDqi1Ecu4MGkI
   bYqglCtm84j/KNfXvPoo4YIc/brtVN+N8gYmoL1Dg2vX83dye5MNwFq0K
   m6VzshFfsG8shF+kzACml811dAr0Y2hfh8DZcwjSYMS6ES21N3Se1Sg4z
   A==;
X-CSE-ConnectionGUID: zlaAmYi0TMawM7KvdbLr5g==
X-CSE-MsgGUID: +t4+dIuWR5uyhG0QqA2JTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67695234"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67695234"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:02:28 -0800
X-CSE-ConnectionGUID: 4WtlUfPwR42Ah7qb97Hj8g==
X-CSE-MsgGUID: U/n3Sa5CT+i1uaErLorLmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197450884"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 15:02:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYd6-000000008I1-1kbi;
	Sat, 13 Dec 2025 23:02:24 +0000
Date: Sun, 14 Dec 2025 07:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/iommu/arm-smmu-v3-context.c:569:5: warning: no previous prototype
 for 'arm_smmu_set_cd_mpam'
Message-ID: <202512140721.kLxdCMUB-lkp@intel.com>
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
commit: 7c01a111ee8606b0c1986bb624808769d4236742 [1942/1942] iommu/arm-smmu-v3: Add support to configure mpam in STE/CD context
config: arm64-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140721.kLxdCMUB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140721.kLxdCMUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140721.kLxdCMUB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm-smmu-v3-context.c:569:5: warning: no previous prototype for 'arm_smmu_set_cd_mpam' [-Wmissing-prototypes]
     569 | int arm_smmu_set_cd_mpam(struct iommu_pasid_table_ops *ops,
         |     ^~~~~~~~~~~~~~~~~~~~
--
   drivers/iommu/arm-smmu-v3.c:4267:5: warning: no previous prototype for 'arm_smmu_set_dev_mpam' [-Wmissing-prototypes]
    4267 | int arm_smmu_set_dev_mpam(struct device *dev, int ssid, int partid, int pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'dev' not described in 'arm_smmu_set_dev_mpam'
>> drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'ssid' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'partid' not described in 'arm_smmu_set_dev_mpam'
   drivers/iommu/arm-smmu-v3.c:4269: warning: Function parameter or member 'pmg' not described in 'arm_smmu_set_dev_mpam'
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
