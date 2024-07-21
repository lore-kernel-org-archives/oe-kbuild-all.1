Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB910E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 01:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721524682; cv=none; b=VViyk55+dDBccasgiW9R3xXzpDJBfoP6qYn3nIcBn9nD84QcRG2f8qZAvtC2w/MV9jQ0VVu4cxVXBkYYiPFj9VxIrkbwqyhWVn9yEr65K1HtNNoW6GdakvuOl4OZ3cmVRjOboHqKCIgVQInbx2lCR/uV+eYmAwfZy5YSTb6641Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721524682; c=relaxed/simple;
	bh=GbguudNO05Odx6iYp36sqCWf4SDhvznV9tqKDj4YoRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YoY42l5GZAXckeW7SscY/xYMOcV2iCbVNIc437yp2+mcHm3vmTefVe2aUisE6oauTQLI6W08BF5wKygRf8NYhOp6ZBRMzKuw/AFZpxX11AgaNYGhTQUhpyNI0E9ZlCwdDlZWZpCToGNkp6B+j7YygIRKJN7uUBnWGGlnBmyfKzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPJOh5uV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPJOh5uV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721524679; x=1753060679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GbguudNO05Odx6iYp36sqCWf4SDhvznV9tqKDj4YoRQ=;
  b=dPJOh5uVY7mCw8xvlhCcNfzONnxaLBlUTiQuWZcfXGoY9s5ZyRGdoEUk
   lZx7Mi6+Subub+xd9fmTNI6xRZ7ZEZEmIlQWf6+7p+MDldXCXnadpwbKE
   rJfggHy4fpSwtwoW0WcIa74FbUU+Nvb73qPeFR/VnHleG3hROd2W7DpWl
   Xc87mqaKUz3KLhGjSZgeDrahE3k5YlAaAwroM4/ELDSWCUvWnqnEUOtRo
   NlK5bPoBXYf40GXp2Y5ZKw0QpGBNIkS4wL8cXyBE0afvrdtR3evZ6NwXF
   I3MoQozbVetJBrOcqpF3XJwj6OQ5QtTIc9QzKxjSvXWsUa9XMnHBqDhR2
   A==;
X-CSE-ConnectionGUID: y1J2hoO3RaOMmegtQIbcDw==
X-CSE-MsgGUID: 3uuJj3wBSlCyebK/hwtrXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="29735103"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="29735103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 18:17:59 -0700
X-CSE-ConnectionGUID: Rc4+pDRxTDKsQVXytQ1Z2Q==
X-CSE-MsgGUID: 4wPv2uoLQBGKCGEx8k0zhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="55769786"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jul 2024 18:17:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVLD1-000jmA-2d;
	Sun, 21 Jul 2024 01:17:55 +0000
Date: Sun, 21 Jul 2024 09:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 12152/13790]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:951:5: sparse: sparse:
 symbol 'smmu_unregister_smmu' was not declared. Should it be static?
Message-ID: <202407210933.IYfq9LCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   16fd47ba32e2ea1f779645a25ccac2ea07911bd9
commit: 3957c33199557d04f41b0be930f941bcc6b06ee6 [12152/13790] ANDROID: KVM: arm64: Cleanup fail path
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240721/202407210933.IYfq9LCI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240721/202407210933.IYfq9LCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210933.IYfq9LCI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:885:5: sparse: sparse: symbol 'kvm_arm_smmu_suspend' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:895:5: sparse: sparse: symbol 'kvm_arm_smmu_resume' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:945:5: sparse: sparse: symbol 'smmu_put_device' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:951:5: sparse: sparse: symbol 'smmu_unregister_smmu' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1069:15: sparse: sparse: symbol 'kvm_arm_smmu_v3_id' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1077:25: sparse: sparse: symbol 'kvm_smmu_v3_ops' was not declared. Should it be static?

vim +/smmu_unregister_smmu +951 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

   884	
 > 885	int kvm_arm_smmu_suspend(struct device *dev)
   886	{
   887		struct arm_smmu_device *smmu = dev_get_drvdata(dev);
   888		struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
   889	
   890		if (host_smmu->hvc_pd)
   891			return pkvm_iommu_suspend(dev);
   892		return 0;
   893	}
   894	
   895	int kvm_arm_smmu_resume(struct device *dev)
   896	{
   897		struct arm_smmu_device *smmu = dev_get_drvdata(dev);
   898		struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
   899	
   900		if (host_smmu->hvc_pd)
   901			return pkvm_iommu_resume(dev);
   902		return 0;
   903	}
   904	
   905	static const struct dev_pm_ops kvm_arm_smmu_pm_ops = {
   906		SET_RUNTIME_PM_OPS(kvm_arm_smmu_suspend, kvm_arm_smmu_resume, NULL)
   907	};
   908	
   909	static const struct of_device_id arm_smmu_of_match[] = {
   910		{ .compatible = "arm,smmu-v3", },
   911		{ },
   912	};
   913	
   914	static struct platform_driver kvm_arm_smmu_driver = {
   915		.driver = {
   916			.name = "kvm-arm-smmu-v3",
   917			.of_match_table = arm_smmu_of_match,
   918			.pm = &kvm_arm_smmu_pm_ops,
   919		},
   920		.remove = kvm_arm_smmu_remove,
   921	};
   922	
   923	static int kvm_arm_smmu_array_alloc(void)
   924	{
   925		int smmu_order;
   926		struct device_node *np;
   927	
   928		kvm_arm_smmu_count = 0;
   929		for_each_compatible_node(np, NULL, "arm,smmu-v3")
   930			kvm_arm_smmu_count++;
   931	
   932		if (!kvm_arm_smmu_count)
   933			return 0;
   934	
   935		/* Allocate the parameter list shared with the hypervisor */
   936		smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
   937		kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
   938							      smmu_order);
   939		if (!kvm_arm_smmu_array)
   940			return -ENOMEM;
   941	
   942		return 0;
   943	}
   944	
   945	int smmu_put_device(struct device *dev, void *data)
   946	{
   947		pm_runtime_put_noidle(dev);
   948		return 0;
   949	}
   950	
 > 951	int smmu_unregister_smmu(struct device *dev, void *data)
   952	{
   953		struct arm_smmu_device *smmu = dev_get_drvdata(dev);
   954	
   955		arm_smmu_unregister_iommu(smmu);
   956		return 0;
   957	}
   958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
