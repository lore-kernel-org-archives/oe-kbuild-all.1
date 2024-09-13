Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746184DFE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 18:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726252638; cv=none; b=lejBIdR/1NIBJmUmu8NZRVrfq8cWO8eAuSDeSmTxmCdtH/RZLSBJCF1GRwMFIRNDGe4aLab8SPC3XUShoCN9B0fyQJDLlDn7FuJHCQFuH2J5M0Ah1ZQKDHekwZx+47dmq1CnHueDEd6tWXIhn5O+eAXwch8a9xns48aGvBbHg3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726252638; c=relaxed/simple;
	bh=w75W6LoQKWWmq23o0WQLoCGreylViWdMKt2YDKpB+kI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5EhYnQnpCPT+nZn/acYIOzD1gkhBkOS5/Rkh7zAdvmZ77gNvEbJbTU3f0G1FyMpUYjid1rkTIuG20GNw0YcyecH/ukyJ9WgZaqxuzfrJpaESs16+WDBfuMAdLROVvJFHAos+2ng9rkVkk5Qa5xoMIr8iZQ4efslk5qDZrHUlXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntPXr0oq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntPXr0oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726252637; x=1757788637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w75W6LoQKWWmq23o0WQLoCGreylViWdMKt2YDKpB+kI=;
  b=ntPXr0oqYwzcjHl5J+VZpfVvetC3HhNzblxLmAbG1Zsu/wpVaGJa9ao6
   fkAXLFiUdLOd1EPloICPZr3yrAKvyxVeruRkeVDqg2o9BTp6j69NjSupQ
   uFocZ2i9QgFCGmNPtxyPqHVCcMDkRr1+QBk/j1LIxe+DNqsxeLH9qXNDy
   +6JbF5obY5zsv8hJJSwN2tn7j53oQLEx6tR1iUGwUaXAAi2QufArsfJtn
   1JKUVtPf6EWGtWWRfe0SFES1ebPb+gPjzL/ddslbNv/Jv+TxLKDGC9Ryf
   m/qQTqPo9EJo/0jYSN+/Yw7oalOH/RwH2Tt39DhDGbI11tcNgBmYgEgNK
   g==;
X-CSE-ConnectionGUID: 7MzOJy70SkyK5y6HJh/Amg==
X-CSE-MsgGUID: 0h7gFUm2Sw6GVAB8zKlVqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25262069"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25262069"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:37:16 -0700
X-CSE-ConnectionGUID: 3P0VMUhCScOX/NE/B5u8gA==
X-CSE-MsgGUID: J3PEmiDTQkSbFbFlPyaz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="72525768"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 11:37:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spBAO-0006pe-1g;
	Fri, 13 Sep 2024 18:37:12 +0000
Date: Sat, 14 Sep 2024 02:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenhuiying <chenhuiying4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 11160/30000]
 drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:145:18: error: implicit
 declaration of function 'acpi_evaluate_integer'; did you mean
 'acpi_evaluate_object'?
Message-ID: <202409140251.mPlaSy6Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: 3bf501c87ffe1f045f86af89e8958fed62c02c94 [11160/30000] ascend agent smmu: an implementation of ARM SMMUv3 ATOS feature
config: arm64-randconfig-002-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140251.mPlaSy6Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140251.mPlaSy6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140251.mPlaSy6Z-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:71:20: warning: no previous prototype for 'agent_smmu_unlocked_find' [-Wmissing-prototypes]
      71 | struct agent_smmu *agent_smmu_unlocked_find(u64 device_id)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c: In function 'agent_smmu_platform_probe':
>> drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:145:18: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
     145 |         status = acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev), METHOD_NAME__UID,
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  acpi_evaluate_object
   drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c: At top level:
>> drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:420:36: warning: 'agent_smmu_acpi_match' defined but not used [-Wunused-const-variable=]
     420 | static const struct acpi_device_id agent_smmu_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +145 drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c

    70	
  > 71	struct agent_smmu *agent_smmu_unlocked_find(u64 device_id)
    72	{
    73		struct agent_smmu *temp = NULL;
    74	
    75		list_for_each_entry(temp, &agent_smmu_list, list) {
    76			if (temp->device_id == device_id) {
    77				return temp;
    78			}
    79		}
    80		return NULL;
    81	}
    82	
    83	static int agent_smmu_register(struct agent_smmu *agent)
    84	{
    85		struct device *dev = agent->dev;
    86	
    87		spin_lock(&agent_smmu_lock);
    88		if (agent_smmu_unlocked_find(agent->device_id)) {
    89			dev_err(dev, "already added for %lld.\n", agent->device_id);
    90			spin_unlock(&agent_smmu_lock);
    91			return -EFAULT;
    92		}
    93		list_add_tail(&agent->list, &agent_smmu_list);
    94		spin_unlock(&agent_smmu_lock);
    95	
    96		return 0;
    97	}
    98	
    99	static void agent_smmu_unregister(struct agent_smmu *agent)
   100	{
   101		spin_lock(&agent_smmu_lock);
   102		list_del(&agent->list);
   103		spin_unlock(&agent_smmu_lock);
   104	}
   105	
   106	static int agent_smmu_platform_probe(struct platform_device *pdev)
   107	{
   108		struct agent_smmu *agent = NULL;
   109		struct device *dev = &pdev->dev;
   110		struct resource *res = NULL;
   111		u32 reg = 0;
   112		int ret = 0;
   113		acpi_status status = AE_OK;
   114	
   115		agent = devm_kzalloc(dev, sizeof(*agent), GFP_KERNEL);
   116		if (!agent) {
   117			dev_err(dev, "failed to allocate agent smmu.\n");
   118			return -ENOMEM;
   119		}
   120	
   121		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   122		if (!res || resource_size(res) + 1 < ENHANCED_ATOS_UNIT_ADDR +
   123		    ENHANCED_ATOS_UNIT_SIZE * MAX_REGISTERS) {
   124			dev_err(dev, "MMIO region is null or too small, check it.\n");
   125			ret = -EINVAL;
   126			goto err_free;
   127		}
   128	
   129		// agent smmu may probe as smmu in device, so keep using ioreamp
   130		agent->base = ioremap(res->start, resource_size(res));
   131		if (!agent->base) {
   132			dev_err(dev, "unable to map agent smmu.\n");
   133			ret = -ENOMEM;
   134			goto err_free;
   135		}
   136	
   137		/* check agent smmu is enabled */
   138		reg = readl_relaxed(agent->base + AGENT_SMMU_CR0);
   139		if (!(reg & CR0_SMMUEN)) {
   140			dev_err(dev, "agent smmu is not enabled, check it.\n");
   141			ret = -EPERM;
   142			goto err_iounmap;
   143		}
   144	
 > 145		status = acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev), METHOD_NAME__UID,
   146					       NULL, &agent->device_id);
   147		if (ACPI_FAILURE(status)) {
   148			dev_err(dev, "Unable to get agent smmu _UID.\n");
   149			ret = -ENODEV;
   150			goto err_iounmap;
   151		}
   152	
   153		if (agent_smmu_register(agent)) {
   154			ret = -EINVAL;
   155			goto err_iounmap;
   156		}
   157	
   158		reg = readl_relaxed(agent->base + AGENT_SMMU_IDR1);
   159		agent->max_sid = (1U << FIELD_GET(IDR1_SIDSIZE, reg)) - 1;
   160		agent->max_ssid = (1U << FIELD_GET(IDR1_SSIDSIZE, reg)) - 1;
   161		bitmap_zero(agent->regs, MAX_REGISTERS);
   162		rwlock_init(&agent->rw_lock);
   163		agent->dev = dev;
   164		platform_set_drvdata(pdev, agent);
   165	
   166		dev_info(dev, "agent smmu 0x%llx probed successfully.\n", agent->device_id);
   167		return ret;
   168	err_iounmap:
   169		iounmap(agent->base);
   170		agent->base = NULL;
   171	err_free:
   172		devm_kfree(dev, agent);
   173		return ret;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
