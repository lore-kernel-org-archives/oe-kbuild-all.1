Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A287D3EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721317727; cv=none; b=bNTjNuFZfqQSnGiVcChJB8uEsF5bv1xuJNaL4qMxAph2KGUM07GgkkRSBBBIqUfwOdEi0gJEMR6CzB+gPI1lBJnK8LZP3xhdtiDz6/z3BXYUH+HxZZinQ1iUZNFS8Y9vmabgKuCMqq8fnqhBxLmQOkjCHb9aP67ME9Tpf5/qya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721317727; c=relaxed/simple;
	bh=WWGMrDEj6zt2zEOZ5plHcvR0WnXA5kXlfev+H1XjEsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E6BCjLEaWByBArSsNVFcwx8UWa1Rliy11x2wi/qgO+Asfs01B45NxIpG0+bPz9P/2xaLHfRhYt5qCbjwwGCwNpYMxoeuN3sJE7/6mNFrr0ld/Km5Nw+QXkRMfKlVdmHTdvY9ZBY8/PabQYQLVaU/6CgQ6YO36tZt+GJs6Bxy7rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjCB2Hee; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjCB2Hee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721317726; x=1752853726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWGMrDEj6zt2zEOZ5plHcvR0WnXA5kXlfev+H1XjEsw=;
  b=OjCB2HeeunT3X2AHK9Cml7VOBzdaQI5neR8QuE7IskZGOC1AXb+XuGON
   UAZhpIM6iw38YgHn7DMTpBUVkg3YrdvMzvlgFwUYxE+QTt3Yq7/dP+3WE
   KrPFNBiQzwjhUADPIm27Ftmgs6ESouAFWv4xYqlmG4uz4pxUsi7X46Vi7
   VE9ZAPlZfT062mqrvz/MUmqPt3q6YGe8wBEQp5rJI2YopqkCpGxaiksYJ
   BLdGIQTPvO6p9iuAzFHd1n3xyEYFISSfGHFlF97/PuiCbcVXRXQ7B1D7P
   6yoWODZNDZjNYt4Tm9BR7tD5MlOpKnh7W2+n7DoD/0h4htXCk4GXhrVTa
   g==;
X-CSE-ConnectionGUID: oqyvde0eSYCOX98alyhcLA==
X-CSE-MsgGUID: 4f/DRLlPQ02cYk4G2W9qxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18516038"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="18516038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 08:48:45 -0700
X-CSE-ConnectionGUID: W5SmQ7NVQL6qt0JSsBDNWw==
X-CSE-MsgGUID: N0gvXdz6Tnm8Ky4UVxwc6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="88295273"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2024 08:48:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUTN3-000hOE-1s;
	Thu, 18 Jul 2024 15:48:41 +0000
Date: Thu, 18 Jul 2024 23:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 10078/13790]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:795:5: sparse: sparse:
 symbol 'kvm_arm_smmu_suspend' was not declared. Should it be static?
Message-ID: <202407182325.5vbh18kF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   16fd47ba32e2ea1f779645a25ccac2ea07911bd9
commit: 1f7c566fe2211514bf377944f1e9964255b2ba75 [10078/13790] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240718/202407182325.5vbh18kF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240718/202407182325.5vbh18kF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407182325.5vbh18kF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:795:5: sparse: sparse: symbol 'kvm_arm_smmu_suspend' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:805:5: sparse: sparse: symbol 'kvm_arm_smmu_resume' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:863:5: sparse: sparse: symbol 'smmu_put_device' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:929:15: sparse: sparse: symbol 'kvm_arm_smmu_v3_id' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:937:25: sparse: sparse: symbol 'kvm_smmu_v3_ops' was not declared. Should it be static?

vim +/kvm_arm_smmu_suspend +795 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

d4519820851b1d Jean-Philippe Brucker 2022-02-09  794  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11 @795  int kvm_arm_smmu_suspend(struct device *dev)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  796  {
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  797  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  798  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  799  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  800  	if (host_smmu->hvc_pd)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  801  		return pkvm_iommu_suspend(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  802  	return 0;
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  803  }
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  804  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11 @805  int kvm_arm_smmu_resume(struct device *dev)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  806  {
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  807  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  808  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  809  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  810  	if (host_smmu->hvc_pd)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  811  		return pkvm_iommu_resume(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  812  	return 0;
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  813  }
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  814  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  815  static const struct dev_pm_ops kvm_arm_smmu_pm_ops = {
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  816  	SET_RUNTIME_PM_OPS(kvm_arm_smmu_suspend, kvm_arm_smmu_resume, NULL)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  817  };
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  818  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  819  static const struct of_device_id arm_smmu_of_match[] = {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  820  	{ .compatible = "arm,smmu-v3", },
d4519820851b1d Jean-Philippe Brucker 2022-02-09  821  	{ },
d4519820851b1d Jean-Philippe Brucker 2022-02-09  822  };
d4519820851b1d Jean-Philippe Brucker 2022-02-09  823  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  824  static struct platform_driver kvm_arm_smmu_driver = {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  825  	.driver = {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  826  		.name = "kvm-arm-smmu-v3",
d4519820851b1d Jean-Philippe Brucker 2022-02-09  827  		.of_match_table = arm_smmu_of_match,
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  828  		.pm = &kvm_arm_smmu_pm_ops,
d4519820851b1d Jean-Philippe Brucker 2022-02-09  829  	},
d4519820851b1d Jean-Philippe Brucker 2022-02-09  830  	.remove = kvm_arm_smmu_remove,
d4519820851b1d Jean-Philippe Brucker 2022-02-09  831  };
d4519820851b1d Jean-Philippe Brucker 2022-02-09  832  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  833  static int kvm_arm_smmu_array_alloc(void)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  834  {
be3195fe7b08b0 Mostafa Saleh         2023-10-17  835  	int smmu_order;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  836  	struct device_node *np;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  837  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  838  	kvm_arm_smmu_count = 0;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  839  	for_each_compatible_node(np, NULL, "arm,smmu-v3")
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  840  		kvm_arm_smmu_count++;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  841  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  842  	if (!kvm_arm_smmu_count)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  843  		return 0;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  844  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  845  	/* Allocate the parameter list shared with the hypervisor */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  846  	smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  847  	kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  848  						      smmu_order);
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  849  	if (!kvm_arm_smmu_array)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  850  		return -ENOMEM;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  851  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  852  	return 0;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  853  }
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  854  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  855  static void kvm_arm_smmu_array_free(void)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  856  {
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  857  	int order;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  858  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  859  	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  860  	free_pages((unsigned long)kvm_arm_smmu_array, order);
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  861  }
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  862  
842ddd77ef926e Jean-Philippe Brucker 2022-10-10 @863  int smmu_put_device(struct device *dev, void *data)
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  864  {
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  865  	pm_runtime_put_noidle(dev);
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  866  	return 0;
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  867  }
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  868  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  869  /**
d4519820851b1d Jean-Philippe Brucker 2022-02-09  870   * kvm_arm_smmu_v3_init() - Reserve the SMMUv3 for KVM
d4519820851b1d Jean-Philippe Brucker 2022-02-09  871   * Return 0 if all present SMMUv3 were probed successfully, or an error.
d4519820851b1d Jean-Philippe Brucker 2022-02-09  872   *   If no SMMU was found, return 0, with a count of 0.
d4519820851b1d Jean-Philippe Brucker 2022-02-09  873   */
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  874  static int kvm_arm_smmu_v3_init(void)
d4519820851b1d Jean-Philippe Brucker 2022-02-09  875  {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  876  	int ret;
d4519820851b1d Jean-Philippe Brucker 2022-02-09  877  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  878  	/*
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  879  	 * Check whether any device owned by the host is behind an SMMU.
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  880  	 */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  881  	ret = kvm_arm_smmu_array_alloc();
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  882  	if (ret || !kvm_arm_smmu_count)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  883  		return ret;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  884  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  885  	ret = platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
d4519820851b1d Jean-Philippe Brucker 2022-02-09  886  	if (ret)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  887  		goto err_free;
d4519820851b1d Jean-Philippe Brucker 2022-02-09  888  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  889  	if (kvm_arm_smmu_cur != kvm_arm_smmu_count) {
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  890  		/* A device exists but failed to probe */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  891  		ret = -EUNATCH;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  892  		goto err_free;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  893  	}
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  894  
fcc9e477aaee84 Mostafa Saleh         2023-08-17  895  #ifdef MODULE
fcc9e477aaee84 Mostafa Saleh         2023-08-17  896  	ret = pkvm_load_el2_module(kvm_nvhe_sym(smmu_init_hyp_module),
fcc9e477aaee84 Mostafa Saleh         2023-08-17  897  				   &pkvm_module_token);
fcc9e477aaee84 Mostafa Saleh         2023-08-17  898  
fcc9e477aaee84 Mostafa Saleh         2023-08-17  899  	if (ret) {
fcc9e477aaee84 Mostafa Saleh         2023-08-17  900  		pr_err("Failed to load SMMUv3 IOMMU EL2 module: %d\n", ret);
fcc9e477aaee84 Mostafa Saleh         2023-08-17  901  		return ret;
fcc9e477aaee84 Mostafa Saleh         2023-08-17  902  	}
fcc9e477aaee84 Mostafa Saleh         2023-08-17  903  #endif
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  904  	/*
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  905  	 * These variables are stored in the nVHE image, and won't be accessible
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  906  	 * after KVM initialization. Ownership of kvm_arm_smmu_array will be
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  907  	 * transferred to the hypervisor as well.
f6758993ba0dc8 Jean-Philippe Brucker 2022-11-23  908  	 *
f6758993ba0dc8 Jean-Philippe Brucker 2022-11-23  909  	 * kvm_arm_smmu_memcache is shared between hypervisor and host.
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  910  	 */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  911  	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  912  	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_count;
bb65953ff665bb David Brazdil         2023-08-09  913  
fcc9e477aaee84 Mostafa Saleh         2023-08-17  914  	ret = kvm_iommu_init_hyp(ksym_ref_addr_nvhe(smmu_ops), 0);
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  915  
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  916  	WARN_ON(driver_for_each_device(&kvm_arm_smmu_driver.driver, NULL,
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  917  				       NULL, smmu_put_device));
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  918  	return ret;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  919  err_free:
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  920  	kvm_arm_smmu_array_free();
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  921  	return ret;
d4519820851b1d Jean-Philippe Brucker 2022-02-09  922  }
d4519820851b1d Jean-Philippe Brucker 2022-02-09  923  
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  924  static void kvm_arm_smmu_v3_remove(void)
d4519820851b1d Jean-Philippe Brucker 2022-02-09  925  {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  926  	platform_driver_unregister(&kvm_arm_smmu_driver);
d4519820851b1d Jean-Philippe Brucker 2022-02-09  927  }
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  928  
9d5e57d93b40eb Mostafa Saleh         2023-08-19 @929  pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
9d5e57d93b40eb Mostafa Saleh         2023-08-19  930  {
9d5e57d93b40eb Mostafa Saleh         2023-08-19  931  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
9d5e57d93b40eb Mostafa Saleh         2023-08-19  932  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
9d5e57d93b40eb Mostafa Saleh         2023-08-19  933  
9d5e57d93b40eb Mostafa Saleh         2023-08-19  934  	return host_smmu->id;
9d5e57d93b40eb Mostafa Saleh         2023-08-19  935  }
9d5e57d93b40eb Mostafa Saleh         2023-08-19  936  
5d6af2ce0093f6 Mostafa Saleh         2023-05-01 @937  struct kvm_iommu_driver kvm_smmu_v3_ops = {
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  938  	.init_driver = kvm_arm_smmu_v3_init,
9d5e57d93b40eb Mostafa Saleh         2023-08-19  939  	.remove_driver = kvm_arm_smmu_v3_remove,
9d5e57d93b40eb Mostafa Saleh         2023-08-19  940  	.get_iommu_id = kvm_arm_smmu_v3_id,
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  941  };
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  942  

:::::: The code at line 795 was first introduced by commit
:::::: 94d1b3e12c96365344527059d9fc1570856dc06e ANDROID: iommu/arm-smmu-v3-kvm: Use HOST_HVC PD if possible

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
