Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7321F5840
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776361; cv=none; b=oa0SzKb5iGYu5+uGE37zOrfA46f77MH0peZIKWdILgAa1e3Iz8OPJPAZg34dIIF1gy/pSiKWCFfcYy8rUfPoJ1LNmeye2fYpppzyTKpLgKxz2EA3jo8BgGT5VZPMKk648i9hTbIu9c/kXtPp/KP7Zy7EmrZLnpRm7KRTeaHTjQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776361; c=relaxed/simple;
	bh=XnqlRCerxxwP4vgZPEmg2zPUXO8ea2gC9AmaNi2FBKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENis8meM3+fsp295V1DBY0AHCwnvgZ/E5QafKFiDkQdOowwKBTpd44ZlVyAaMkDzccuFnDBmFQb+HgxHy7sDGosPhGvSwF6s2NmuV0VMtqr+8yCRN5nUiEUwY4i5vEIxwLcBCGIbj0wigxwAj8LrOoMxAxKP+exMsF1KeDgVnVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cghh7QXj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cghh7QXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729776357; x=1761312357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XnqlRCerxxwP4vgZPEmg2zPUXO8ea2gC9AmaNi2FBKM=;
  b=Cghh7QXjGypPolzc9LQoRchCS9yIoy2owiG4pYhrjZFmerKP4tcyOXQa
   i09S/dwVXnJu/BdI28KKPK0mOiY+UtbL3H0Uvy9gV+5tIEQVIpWhoCOQO
   Z5cNm3yI8DjLTpVEL8MQYQ17mHU2J/W1JGlnnrAux5vNpGDl7rIEEnxbS
   QEsaDbLE3nSkFdvzgkvxMSws7x6NQ+mL++XOVU3+vRL9YKGA/9n1lFNZg
   ubiw64QpfrGdt0x5+uO89GdFLy146/lt2yLnHdz3w0rKxZxdVM5zf6szJ
   bNS292+3cmaLUSK6SLT+eLZma+wqocb8+dhKKK4F4Tapvzj4U82K4zhJS
   Q==;
X-CSE-ConnectionGUID: lzaTgfTDSv+pqe9jAIhkEw==
X-CSE-MsgGUID: VTA+/lJpSYeAT2+78CZcWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33308045"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33308045"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 06:25:56 -0700
X-CSE-ConnectionGUID: sKeZhEgWQleg1oWBdS2hkw==
X-CSE-MsgGUID: IWIdkYSLSYm2yTz+Wjt9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="81406258"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 06:25:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3xqb-000WTC-0E;
	Thu, 24 Oct 2024 13:25:53 +0000
Date: Thu, 24 Oct 2024 21:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-07 10079/13848]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:795:5: warning: no previous
 prototype for 'kvm_arm_smmu_suspend'
Message-ID: <202410242151.J4idNZrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-07
head:   47851c83277ae8ea5a6a92402c1cc058408d9601
commit: 1f7c566fe2211514bf377944f1e9964255b2ba75 [10079/13848] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-randconfig-r053-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242151.J4idNZrC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242151.J4idNZrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242151.J4idNZrC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: In function 'kvm_arm_smmu_domain_free':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:221:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     221 |         int ret;
         |             ^~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: At top level:
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:795:5: warning: no previous prototype for 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     795 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:805:5: warning: no previous prototype for 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     805 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:863:5: warning: no previous prototype for 'smmu_put_device' [-Wmissing-prototypes]
     863 | int smmu_put_device(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:929:15: warning: no previous prototype for 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
     929 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from include/linux/io-pgtable-arm.h:167,
                    from arch/arm64/kvm/hyp/include/nvhe/iommu.h:9,
                    from drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:11:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c: At top level:
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:596:5: warning: no previous prototype for 'smmu_domain_finalise' [-Wmissing-prototypes]
     596 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:712:5: warning: no previous prototype for 'smmu_alloc_domain' [-Wmissing-prototypes]
     712 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:6: warning: no previous prototype for 'smmu_free_domain' [-Wmissing-prototypes]
     727 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:739:6: warning: no previous prototype for 'smmu_dabt_device' [-Wmissing-prototypes]
     739 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:782:6: warning: no previous prototype for 'smmu_dabt_handler' [-Wmissing-prototypes]
     782 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:794:5: warning: no previous prototype for 'smmu_suspend' [-Wmissing-prototypes]
     794 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:807:5: warning: no previous prototype for 'smmu_resume' [-Wmissing-prototypes]
     807 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:820:5: warning: no previous prototype for 'smmu_init_hyp_module' [-Wmissing-prototypes]
     820 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from include/linux/io-pgtable-arm.h:167,
                    from drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:11:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c: At top level:
>> drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:54:5: warning: no previous prototype for 'kvm_arm_io_pgtable_init' [-Wmissing-prototypes]
      54 | int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from include/linux/io-pgtable-arm.h:167,
                    from drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:11:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c: At top level:
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:145:5: warning: no previous prototype for '__arm_lpae_map' [-Wmissing-prototypes]
     145 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:266:5: warning: no previous prototype for 'arm_lpae_map_pages' [-Wmissing-prototypes]
     266 | int arm_lpae_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:470:8: warning: no previous prototype for '__arm_lpae_unmap_pages' [-Wmissing-prototypes]
     470 | size_t __arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:492:13: warning: no previous prototype for 'arm_lpae_iova_to_phys' [-Wmissing-prototypes]
     492 | phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:528:8: warning: no previous prototype for 'arm_lpae_unmap_pages' [-Wmissing-prototypes]
     528 | size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/../../../io-pgtable-arm-common.c:535:8: warning: no previous prototype for 'arm_lpae_unmap_pages_walk' [-Wmissing-prototypes]
     535 | size_t arm_lpae_unmap_pages_walk(struct io_pgtable_ops *ops, unsigned long iova,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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

:::::: The code at line 795 was first introduced by commit
:::::: 94d1b3e12c96365344527059d9fc1570856dc06e ANDROID: iommu/arm-smmu-v3-kvm: Use HOST_HVC PD if possible

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
