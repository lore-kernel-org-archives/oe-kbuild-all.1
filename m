Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870C30C165
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914086; cv=none; b=PHCa3296id3dGO6gZ/h3ZplPoysZ3DZvJI6jjSYKGirpaJtHqhEOt1SoGO1i6mnG7XMsyxgdnXkZi1BGjwVluomfftf4OTIRMbUDcMe8x3Q7CXQsuBUZIPhpEFImAX8DxCRf1ET8nJigVasHmEiGolAAL8kLxcs9O5t7MouFEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914086; c=relaxed/simple;
	bh=u1lUhqbLuniTfWa3jz6l+DkLRrvZsidnJ3ktcv6yLBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lspbIb0HokrZ1BBhdAXO+UxqXWndYNS6ACWvUm3jtqTLpYLSQq/+nSn2I4ahuk+5tFZwiXxSoFmZjGD3IamJd8pcRwu2gTnNDRHAWASCTcjrdVdzk4G3eRfL0gbNz3GidMDdaKp5HucmUMbErU3FWY2PrwZwEAAsEmr7RnAbwqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfvu8NPI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfvu8NPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787914084; x=1819450084;
  h=date:from:to:cc:subject:message-id;
  bh=u1lUhqbLuniTfWa3jz6l+DkLRrvZsidnJ3ktcv6yLBo=;
  b=Qfvu8NPIbshIYLLipKbQVXVWrd/mo9zcAhwJ/j/kctbhV5lzCimlAwvq
   VfC0VcPgrwOwjHpjvZXIgfm2ICoKNc7n26rlqBLX05gPgPLZoJ0xisAeJ
   JqNdgxkhhAg9TsWIzSf+Ftk6ZAIwpeY6aiYJVg5xiCdbLPNMGPV7SAT5g
   tzb67XEyNsWp0bK1lxP2zxBYYPNl74sAB+TGivCj1gbf/0u1OR5Sor6u9
   VzobLO674crYwx21qh3zWmpMsmLGf3H1RLtjFKKuL7VyQ3/xX/4PzJEmc
   HsSpvPZNxysj06n4tbBmLPosTUprhQyNTJ4TQg8P5K74r8lOczt1BLvpU
   w==;
X-CSE-ConnectionGUID: 31GPEY+iTg+KQVqNZBK0qA==
X-CSE-MsgGUID: uYwrXHf9TxeWzQmn4X3+iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105794688"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105794688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 03:48:04 -0700
X-CSE-ConnectionGUID: te/5/WQfTCy0oXluViMo4Q==
X-CSE-MsgGUID: tlrA70g7S5u1dlMe2wvUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="291610416"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Aug 2026 03:48:01 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzu7r-00000000AtJ-1YbU;
	Fri, 28 Aug 2026 10:47:59 +0000
Date: Fri, 28 Aug 2026 18:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 1/1]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:795:5: warning: no previous
 prototype for function 'kvm_arm_smmu_suspend'
Message-ID: <202608281851.4GxndDSJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   1d405563127e428110b2c97c80e8efb219e5f43c
commit: 1f7c566fe2211514bf377944f1e9964255b2ba75 [1/1] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260828/202608281851.4GxndDSJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281851.4GxndDSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281851.4GxndDSJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:221:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:795:5: warning: no previous prototype for function 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
   int kvm_arm_smmu_suspend(struct device *dev)
       ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:795:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_arm_smmu_suspend(struct device *dev)
   ^
   static 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:805:5: warning: no previous prototype for function 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
   int kvm_arm_smmu_resume(struct device *dev)
       ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_arm_smmu_resume(struct device *dev)
   ^
   static 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:863:5: warning: no previous prototype for function 'smmu_put_device' [-Wmissing-prototypes]
   int smmu_put_device(struct device *dev, void *data)
       ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:863:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_put_device(struct device *dev, void *data)
   ^
   static 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:929:15: warning: no previous prototype for function 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
   pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
                 ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:929:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
   ^
   static 
   5 warnings generated.
--
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:596:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
   int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
       ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:596:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
   ^
   static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:712:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
   int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
       ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
   ^
   static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
   void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
   ^
   static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:739:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
   bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:739:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
   ^
   static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:782:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
   bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
        ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:782:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
   ^
   static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:794:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
   int smmu_suspend(struct kvm_hyp_iommu *iommu)
       ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:794:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_suspend(struct kvm_hyp_iommu *iommu)
   ^
   static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:807:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
   int smmu_resume(struct kvm_hyp_iommu *iommu)
       ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_resume(struct kvm_hyp_iommu *iommu)
   ^
   static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:820:5: warning: no previous prototype for function 'smmu_init_hyp_module' [-Wmissing-prototypes]
   int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
       ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:820:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
   ^
   static 
   8 warnings generated.
--
>> drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:54:5: warning: no previous prototype for function 'kvm_arm_io_pgtable_init' [-Wmissing-prototypes]
   int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
       ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
   ^
   static 
   1 warning generated.


vim +/kvm_arm_smmu_suspend +795 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

d4519820851b1db Jean-Philippe Brucker 2022-02-09  794  
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11 @795  int kvm_arm_smmu_suspend(struct device *dev)
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  796  {
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  797  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  798  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  799  
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  800  	if (host_smmu->hvc_pd)
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  801  		return pkvm_iommu_suspend(dev);
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  802  	return 0;
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  803  }
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  804  
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11 @805  int kvm_arm_smmu_resume(struct device *dev)
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  806  {
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  807  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  808  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  809  
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  810  	if (host_smmu->hvc_pd)
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  811  		return pkvm_iommu_resume(dev);
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  812  	return 0;
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  813  }
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  814  
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  815  static const struct dev_pm_ops kvm_arm_smmu_pm_ops = {
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  816  	SET_RUNTIME_PM_OPS(kvm_arm_smmu_suspend, kvm_arm_smmu_resume, NULL)
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  817  };
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  818  
d4519820851b1db Jean-Philippe Brucker 2022-02-09  819  static const struct of_device_id arm_smmu_of_match[] = {
d4519820851b1db Jean-Philippe Brucker 2022-02-09  820  	{ .compatible = "arm,smmu-v3", },
d4519820851b1db Jean-Philippe Brucker 2022-02-09  821  	{ },
d4519820851b1db Jean-Philippe Brucker 2022-02-09  822  };
d4519820851b1db Jean-Philippe Brucker 2022-02-09  823  
d4519820851b1db Jean-Philippe Brucker 2022-02-09  824  static struct platform_driver kvm_arm_smmu_driver = {
d4519820851b1db Jean-Philippe Brucker 2022-02-09  825  	.driver = {
d4519820851b1db Jean-Philippe Brucker 2022-02-09  826  		.name = "kvm-arm-smmu-v3",
d4519820851b1db Jean-Philippe Brucker 2022-02-09  827  		.of_match_table = arm_smmu_of_match,
94d1b3e12c96365 Jean-Philippe Brucker 2022-10-11  828  		.pm = &kvm_arm_smmu_pm_ops,
d4519820851b1db Jean-Philippe Brucker 2022-02-09  829  	},
d4519820851b1db Jean-Philippe Brucker 2022-02-09  830  	.remove = kvm_arm_smmu_remove,
d4519820851b1db Jean-Philippe Brucker 2022-02-09  831  };
d4519820851b1db Jean-Philippe Brucker 2022-02-09  832  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  833  static int kvm_arm_smmu_array_alloc(void)
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  834  {
be3195fe7b08b04 Mostafa Saleh         2023-10-17  835  	int smmu_order;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  836  	struct device_node *np;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  837  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  838  	kvm_arm_smmu_count = 0;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  839  	for_each_compatible_node(np, NULL, "arm,smmu-v3")
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  840  		kvm_arm_smmu_count++;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  841  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  842  	if (!kvm_arm_smmu_count)
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  843  		return 0;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  844  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  845  	/* Allocate the parameter list shared with the hypervisor */
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  846  	smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  847  	kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  848  						      smmu_order);
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  849  	if (!kvm_arm_smmu_array)
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  850  		return -ENOMEM;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  851  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  852  	return 0;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  853  }
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  854  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  855  static void kvm_arm_smmu_array_free(void)
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  856  {
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  857  	int order;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  858  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  859  	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  860  	free_pages((unsigned long)kvm_arm_smmu_array, order);
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  861  }
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  862  
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10 @863  int smmu_put_device(struct device *dev, void *data)
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  864  {
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  865  	pm_runtime_put_noidle(dev);
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  866  	return 0;
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  867  }
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  868  
d4519820851b1db Jean-Philippe Brucker 2022-02-09  869  /**
d4519820851b1db Jean-Philippe Brucker 2022-02-09  870   * kvm_arm_smmu_v3_init() - Reserve the SMMUv3 for KVM
d4519820851b1db Jean-Philippe Brucker 2022-02-09  871   * Return 0 if all present SMMUv3 were probed successfully, or an error.
d4519820851b1db Jean-Philippe Brucker 2022-02-09  872   *   If no SMMU was found, return 0, with a count of 0.
d4519820851b1db Jean-Philippe Brucker 2022-02-09  873   */
5d6af2ce0093f6b Mostafa Saleh         2023-05-01  874  static int kvm_arm_smmu_v3_init(void)
d4519820851b1db Jean-Philippe Brucker 2022-02-09  875  {
d4519820851b1db Jean-Philippe Brucker 2022-02-09  876  	int ret;
d4519820851b1db Jean-Philippe Brucker 2022-02-09  877  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  878  	/*
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  879  	 * Check whether any device owned by the host is behind an SMMU.
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  880  	 */
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  881  	ret = kvm_arm_smmu_array_alloc();
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  882  	if (ret || !kvm_arm_smmu_count)
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  883  		return ret;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  884  
d4519820851b1db Jean-Philippe Brucker 2022-02-09  885  	ret = platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
d4519820851b1db Jean-Philippe Brucker 2022-02-09  886  	if (ret)
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  887  		goto err_free;
d4519820851b1db Jean-Philippe Brucker 2022-02-09  888  
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  889  	if (kvm_arm_smmu_cur != kvm_arm_smmu_count) {
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  890  		/* A device exists but failed to probe */
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  891  		ret = -EUNATCH;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  892  		goto err_free;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  893  	}
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  894  
fcc9e477aaee84d Mostafa Saleh         2023-08-17  895  #ifdef MODULE
fcc9e477aaee84d Mostafa Saleh         2023-08-17  896  	ret = pkvm_load_el2_module(kvm_nvhe_sym(smmu_init_hyp_module),
fcc9e477aaee84d Mostafa Saleh         2023-08-17  897  				   &pkvm_module_token);
fcc9e477aaee84d Mostafa Saleh         2023-08-17  898  
fcc9e477aaee84d Mostafa Saleh         2023-08-17  899  	if (ret) {
fcc9e477aaee84d Mostafa Saleh         2023-08-17  900  		pr_err("Failed to load SMMUv3 IOMMU EL2 module: %d\n", ret);
fcc9e477aaee84d Mostafa Saleh         2023-08-17  901  		return ret;
fcc9e477aaee84d Mostafa Saleh         2023-08-17  902  	}
fcc9e477aaee84d Mostafa Saleh         2023-08-17  903  #endif
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  904  	/*
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  905  	 * These variables are stored in the nVHE image, and won't be accessible
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  906  	 * after KVM initialization. Ownership of kvm_arm_smmu_array will be
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  907  	 * transferred to the hypervisor as well.
f6758993ba0dc87 Jean-Philippe Brucker 2022-11-23  908  	 *
f6758993ba0dc87 Jean-Philippe Brucker 2022-11-23  909  	 * kvm_arm_smmu_memcache is shared between hypervisor and host.
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  910  	 */
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  911  	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  912  	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_count;
bb65953ff665bb3 David Brazdil         2023-08-09  913  
fcc9e477aaee84d Mostafa Saleh         2023-08-17  914  	ret = kvm_iommu_init_hyp(ksym_ref_addr_nvhe(smmu_ops), 0);
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  915  
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  916  	WARN_ON(driver_for_each_device(&kvm_arm_smmu_driver.driver, NULL,
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  917  				       NULL, smmu_put_device));
842ddd77ef926ee Jean-Philippe Brucker 2022-10-10  918  	return ret;
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  919  err_free:
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  920  	kvm_arm_smmu_array_free();
58d165ce27ff4bc Jean-Philippe Brucker 2022-02-09  921  	return ret;
d4519820851b1db Jean-Philippe Brucker 2022-02-09  922  }
d4519820851b1db Jean-Philippe Brucker 2022-02-09  923  
5d6af2ce0093f6b Mostafa Saleh         2023-05-01  924  static void kvm_arm_smmu_v3_remove(void)
d4519820851b1db Jean-Philippe Brucker 2022-02-09  925  {
d4519820851b1db Jean-Philippe Brucker 2022-02-09  926  	platform_driver_unregister(&kvm_arm_smmu_driver);
d4519820851b1db Jean-Philippe Brucker 2022-02-09  927  }
5d6af2ce0093f6b Mostafa Saleh         2023-05-01  928  
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19 @929  pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19  930  {
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19  931  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19  932  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19  933  
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19  934  	return host_smmu->id;
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19  935  }
9d5e57d93b40eb3 Mostafa Saleh         2023-08-19  936  

:::::: The code at line 795 was first introduced by commit
:::::: 94d1b3e12c96365344527059d9fc1570856dc06e ANDROID: iommu/arm-smmu-v3-kvm: Use HOST_HVC PD if possible

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
