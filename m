Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83901482ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782132; cv=none; b=XHxWHKQM6PIzjlJcJO/uiC+al7fxtduCSGNJqwYIDOH7TnlkkkhYNeCAxzkb6YlYUsZiYsNzKLu9YGh7J2tOXOAAm0rDIQkNJj5zhwPO3jTfUwXFtrUuvxXwjfhjrqNTWRNr1F0X6mJ1NcoSnnpxe9rc623RRPX/XPpeRrb/kHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782132; c=relaxed/simple;
	bh=spZkgQ6bToWunJUCcR8lrAq9++3+YchvMW9aRDkOqfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aSyH48aMekjt10a4HEEO6kvNGKh25diZWGz6CygwzKHzmj+nMVjKB1OoyCgKsaYjOyQefGF20av9xNPvfOz8iGI5q3I3mMitvDNzZV1x2eZ51xrZoN522IkgsMKd76j7NtsywCEgf7UieG2v4WkDn3cLqhKz1n0nLcoRdYAAs9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKuBVk2o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKuBVk2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732782131; x=1764318131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spZkgQ6bToWunJUCcR8lrAq9++3+YchvMW9aRDkOqfk=;
  b=XKuBVk2opZoKdXopwx53ms38FfF2+Qc5YXtetezR9q7OFu0G/S06GIBa
   bC4lbD4jKjhTQZKs6ix8nu4snOavquiEjLmNPwSNxP7zd7qtmfgTd7u/J
   US0V5zG9eVI+fXmf5xHjAZwHwR9LxpwRVt0SmISKJc2DG10Nv3x0ZphGH
   JXrlnJlhWtNLQ3eWsy7ci4pqpEJv3mh4KvXw5M+PMuxeKIjemPTgCJyhW
   GcwTXPPNUanxbthujsm3Y3zKKYtVhRPh35rHj6fCDzaa2qeMAcxNGpjtJ
   cWYm/+eJ9ZHR5DS24MDmI+hlhU3DNVICRBJwYZB4VS1JGw/zHChN3Z9jS
   g==;
X-CSE-ConnectionGUID: 1WSRUzOjSTm7sCI92r3H2w==
X-CSE-MsgGUID: s5J7NqXyRKq4rNRJ+MPcDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32941171"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="32941171"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 00:22:10 -0800
X-CSE-ConnectionGUID: vh0MA4EmRyWMV86R862EVw==
X-CSE-MsgGUID: rUqWzUbrRgSblerJIL48ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97261002"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 00:22:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGZmo-0009L3-2A;
	Thu, 28 Nov 2024 08:22:06 +0000
Date: Thu, 28 Nov 2024 16:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540]
 drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:527:13: warning: no previous
 prototype for 'virtcca_smmu_gerror_handler'
Message-ID: <202411281610.h9QxfChh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f63ebb23914c3b2e597112d96eba6edb440e907
commit: ed007ade0cef81fb47328683b8a7eec5edfa8494 [1540/1540] virtcca feature: secure smmu init
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281610.h9QxfChh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281610.h9QxfChh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281610.h9QxfChh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:509:13: warning: no previous prototype for 'virtcca_smmu_evtq_thread' [-Wmissing-prototypes]
     509 | irqreturn_t virtcca_smmu_evtq_thread(int irq, void *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:527:13: warning: no previous prototype for 'virtcca_smmu_gerror_handler' [-Wmissing-prototypes]
     527 | irqreturn_t virtcca_smmu_gerror_handler(int irq, void *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtcca_smmu_gerror_handler +527 drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c

   518	
   519	/**
   520	 * The secure gerror handler
   521	 * @irq: Irq index
   522	 * @dev: Smmu device
   523	 *
   524	 * Returns:
   525	 * %IRQ_NONE no errors pending
   526	 */
 > 527	irqreturn_t virtcca_smmu_gerror_handler(int irq, void *dev)
   528	{
   529		u64 gerror, gerrorn, active;
   530		u64 ret;
   531		struct arm_smmu_device *smmu = dev;
   532	
   533		ret = tmi_smmu_read(smmu->ioaddr, ARM_SMMU_S_GERROR, ARM_S_SMMU_REG_32_BIT);
   534		if (ret >> ARM_S_SMMU_REG_32_BIT) {
   535			dev_err(smmu->dev, "S_SMMU: get arm_smmu_s_gerror register failed\n");
   536			return IRQ_NONE;
   537		}
   538		gerror = ret & ARM_S_SMMU_MASK_UPPER_32_BIT;
   539	
   540		ret = tmi_smmu_read(smmu->ioaddr, ARM_SMMU_S_GERRORN, ARM_S_SMMU_REG_32_BIT);
   541		if (ret >> ARM_S_SMMU_REG_32_BIT) {
   542			dev_err(smmu->dev, "S_SMMU: get arm_smmu_s_gerror register failed\n");
   543			return IRQ_NONE;
   544		}
   545		gerrorn = ret & ARM_S_SMMU_MASK_UPPER_32_BIT;
   546	
   547		active = gerror ^ gerrorn;
   548		if (!(active & GERROR_ERR_MASK))
   549			return IRQ_NONE; /* No errors pending */
   550	
   551		dev_warn(smmu->dev,
   552			 "S_SMMU: unexpected secure global error reported, this could be serious, active %llx\n",
   553			 active);
   554	
   555		if (active & GERROR_SFM_ERR) {
   556			dev_err(smmu->dev, "S_SMMU: device has entered service failure mode!\n");
   557			virtcca_smmu_device_disable(smmu);
   558		}
   559	
   560		if (active & GERROR_MSI_GERROR_ABT_ERR)
   561			dev_warn(smmu->dev, "S_SMMU: gerror msi write aborted\n");
   562	
   563		if (active & GERROR_MSI_PRIQ_ABT_ERR)
   564			dev_warn(smmu->dev, "S_SMMU: priq msi write aborted\n");
   565	
   566		if (active & GERROR_MSI_EVTQ_ABT_ERR)
   567			dev_warn(smmu->dev, "S_SMMU: evtq msi write aborted\n");
   568	
   569		if (active & GERROR_MSI_CMDQ_ABT_ERR)
   570			dev_warn(smmu->dev, "S_SMMU: cmdq msi write aborted\n");
   571	
   572		if (active & GERROR_PRIQ_ABT_ERR)
   573			dev_err(smmu->dev, "S_SMMU: priq write aborted -- events may have been lost\n");
   574	
   575		if (active & GERROR_EVTQ_ABT_ERR)
   576			dev_err(smmu->dev, "S_SMMU: evtq write aborted -- events may have been lost\n");
   577	
   578		if (active & GERROR_CMDQ_ERR)
   579			dev_warn(smmu->dev, "S_SMMU: cmdq err\n");
   580	
   581		if (tmi_smmu_write(smmu->ioaddr, ARM_SMMU_S_GERRORN, gerror, ARM_S_SMMU_REG_32_BIT)) {
   582			dev_err(smmu->dev, "S_SMMU: write arm_smmu_s_gerrorn failed\n");
   583			return IRQ_NONE;
   584		}
   585	
   586		return IRQ_HANDLED;
   587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
