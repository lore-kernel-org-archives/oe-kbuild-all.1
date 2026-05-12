Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BAF3C456D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617449; cv=none; b=GLM+L/JZFNukOh66ZZXeTW+LIhsse1Y/OUf1giAHKmeM1xRAx6elaD5/nI2xG0qDIw5oF95hT1izdbjP5wtTzM/pUNX5cD3VObHtz0Bkt23Old6ac6A/GqwoXNasCbJ6NHXC4mi+iTNCEp7Vqod2dq3r1avVleDOetQqwuW4244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617449; c=relaxed/simple;
	bh=W0jtGU3MzwRn6H0MumoxqLJPu5FKYIOXKfd/WESc4GA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XF2ThG4h+Snyh26CcK/fT17ietbMThMPR0AB6K6BqPNkbhK/9ZC5fqC2T4p20J19ZR+Ugk5Z1JFYXT4CzAsM8yEn4a8juoj7ZMcr3KKv2ybcThAtkzNhGRVS+Hcq0kn+tgEaB6P25U3M0PtSetr84jrLZuj5TXwXmUP+DvrXrDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeFRSyDz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeFRSyDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778617446; x=1810153446;
  h=date:from:to:cc:subject:message-id;
  bh=W0jtGU3MzwRn6H0MumoxqLJPu5FKYIOXKfd/WESc4GA=;
  b=aeFRSyDzN2F7sRmhLRBx+n6UeVMo9YMEnznAvA6Yrml1NrBALTDph2oI
   esgQ0hsQSeCciWp+AsmJsd+k+rUXQ5z2eLmRNslJR0jKBTJwLWGiY1ZDs
   oyYa5/g6RyhnhsEGPhKXBLNp1DHOUoMmRp9E1kWDpGjJpbEsQUpgDIUd6
   +4o+9Ehk2mxgHM0cbPWaaBXoLAuXiQQDE3d8w34AsMS7RlxdgZJ0HdpTr
   tvCwx6YKU8RYxqQfPRZFVCoBdrAyC5p+khPahi35LEn46neRhA4D8iSWz
   pxZUyv4BifL3CCcv27h3g5o7QxFPcPXaP7yOefUZP2MOEC+kCkcgTIsg7
   g==;
X-CSE-ConnectionGUID: 0ixBO6r5QtiGoGH1LOdZ0g==
X-CSE-MsgGUID: Q9gL8J4lRhuDnKiPad5f/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90921494"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="90921494"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:24:05 -0700
X-CSE-ConnectionGUID: sFRbNo2TRq67lXk0yHzwhg==
X-CSE-MsgGUID: fjQ1+BRHT/GvjWpznTlg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242224539"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2026 13:24:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMte4-000000002l9-2vtP;
	Tue, 12 May 2026 20:24:00 +0000
Date: Wed, 13 May 2026 04:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 5/5]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:797:5: warning: no previous
 prototype for 'kvm_arm_smmu_suspend'
Message-ID: <202605130409.nbOK3pt0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   317c633c9669eeff859125a5264b2c06501862bd
commit: aea998ed10e7eb8357e2902a1c5e0b58154c2e96 [5/5] ANDROID: KVM: arm64: Remove HYP_SPIN_LOCK from generated code
config: arm64-randconfig-003-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130409.nbOK3pt0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130409.nbOK3pt0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130409.nbOK3pt0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm64/kvm/: No such file or directory [-Wmissing-include-dirs]
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: In function 'kvm_arm_smmu_domain_free':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:210:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     210 |         int ret;
         |             ^~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: At top level:
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:797:5: warning: no previous prototype for 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     797 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:807:5: warning: no previous prototype for 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     807 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:865:5: warning: no previous prototype for 'smmu_put_device' [-Wmissing-prototypes]
     865 | int smmu_put_device(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:922:15: warning: no previous prototype for 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
     922 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/kvm_arm_smmu_suspend +797 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

d4519820851b1d Jean-Philippe Brucker 2022-02-09  796  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11 @797  int kvm_arm_smmu_suspend(struct device *dev)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  798  {
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  799  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  800  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  801  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  802  	if (host_smmu->hvc_pd)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  803  		return pkvm_iommu_suspend(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  804  	return 0;
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  805  }
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  806  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11 @807  int kvm_arm_smmu_resume(struct device *dev)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  808  {
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  809  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  810  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  811  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  812  	if (host_smmu->hvc_pd)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  813  		return pkvm_iommu_resume(dev);
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  814  	return 0;
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  815  }
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  816  
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  817  static const struct dev_pm_ops kvm_arm_smmu_pm_ops = {
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  818  	SET_RUNTIME_PM_OPS(kvm_arm_smmu_suspend, kvm_arm_smmu_resume, NULL)
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  819  };
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  820  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  821  static const struct of_device_id arm_smmu_of_match[] = {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  822  	{ .compatible = "arm,smmu-v3", },
d4519820851b1d Jean-Philippe Brucker 2022-02-09  823  	{ },
d4519820851b1d Jean-Philippe Brucker 2022-02-09  824  };
d4519820851b1d Jean-Philippe Brucker 2022-02-09  825  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  826  static struct platform_driver kvm_arm_smmu_driver = {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  827  	.driver = {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  828  		.name = "kvm-arm-smmu-v3",
d4519820851b1d Jean-Philippe Brucker 2022-02-09  829  		.of_match_table = arm_smmu_of_match,
94d1b3e12c9636 Jean-Philippe Brucker 2022-10-11  830  		.pm = &kvm_arm_smmu_pm_ops,
d4519820851b1d Jean-Philippe Brucker 2022-02-09  831  	},
d4519820851b1d Jean-Philippe Brucker 2022-02-09  832  	.remove = kvm_arm_smmu_remove,
d4519820851b1d Jean-Philippe Brucker 2022-02-09  833  };
d4519820851b1d Jean-Philippe Brucker 2022-02-09  834  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  835  static int kvm_arm_smmu_array_alloc(void)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  836  {
be3195fe7b08b0 Mostafa Saleh         2023-10-17  837  	int smmu_order;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  838  	struct device_node *np;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  839  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  840  	kvm_arm_smmu_count = 0;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  841  	for_each_compatible_node(np, NULL, "arm,smmu-v3")
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  842  		kvm_arm_smmu_count++;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  843  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  844  	if (!kvm_arm_smmu_count)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  845  		return 0;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  846  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  847  	/* Allocate the parameter list shared with the hypervisor */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  848  	smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  849  	kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  850  						      smmu_order);
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  851  	if (!kvm_arm_smmu_array)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  852  		return -ENOMEM;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  853  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  854  	return 0;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  855  }
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  856  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  857  static void kvm_arm_smmu_array_free(void)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  858  {
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  859  	int order;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  860  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  861  	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  862  	free_pages((unsigned long)kvm_arm_smmu_array, order);
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  863  }
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  864  
842ddd77ef926e Jean-Philippe Brucker 2022-10-10 @865  int smmu_put_device(struct device *dev, void *data)
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  866  {
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  867  	pm_runtime_put_noidle(dev);
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  868  	return 0;
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  869  }
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  870  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  871  /**
d4519820851b1d Jean-Philippe Brucker 2022-02-09  872   * kvm_arm_smmu_v3_init() - Reserve the SMMUv3 for KVM
d4519820851b1d Jean-Philippe Brucker 2022-02-09  873   * Return 0 if all present SMMUv3 were probed successfully, or an error.
d4519820851b1d Jean-Philippe Brucker 2022-02-09  874   *   If no SMMU was found, return 0, with a count of 0.
d4519820851b1d Jean-Philippe Brucker 2022-02-09  875   */
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  876  static int kvm_arm_smmu_v3_init(void)
d4519820851b1d Jean-Philippe Brucker 2022-02-09  877  {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  878  	int ret;
d4519820851b1d Jean-Philippe Brucker 2022-02-09  879  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  880  	/*
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  881  	 * Check whether any device owned by the host is behind an SMMU.
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  882  	 */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  883  	ret = kvm_arm_smmu_array_alloc();
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  884  	if (ret || !kvm_arm_smmu_count)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  885  		return ret;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  886  
d4519820851b1d Jean-Philippe Brucker 2022-02-09  887  	ret = platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
d4519820851b1d Jean-Philippe Brucker 2022-02-09  888  	if (ret)
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  889  		goto err_free;
d4519820851b1d Jean-Philippe Brucker 2022-02-09  890  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  891  	if (kvm_arm_smmu_cur != kvm_arm_smmu_count) {
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  892  		/* A device exists but failed to probe */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  893  		ret = -EUNATCH;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  894  		goto err_free;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  895  	}
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  896  
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  897  	/*
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  898  	 * These variables are stored in the nVHE image, and won't be accessible
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  899  	 * after KVM initialization. Ownership of kvm_arm_smmu_array will be
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  900  	 * transferred to the hypervisor as well.
f6758993ba0dc8 Jean-Philippe Brucker 2022-11-23  901  	 *
f6758993ba0dc8 Jean-Philippe Brucker 2022-11-23  902  	 * kvm_arm_smmu_memcache is shared between hypervisor and host.
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  903  	 */
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  904  	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  905  	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_count;
bb65953ff665bb David Brazdil         2023-08-09  906  
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  907  	ret = kvm_iommu_init_hyp(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))), 0);
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  908  
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  909  	WARN_ON(driver_for_each_device(&kvm_arm_smmu_driver.driver, NULL,
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  910  				       NULL, smmu_put_device));
842ddd77ef926e Jean-Philippe Brucker 2022-10-10  911  	return ret;
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  912  err_free:
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  913  	kvm_arm_smmu_array_free();
58d165ce27ff4b Jean-Philippe Brucker 2022-02-09  914  	return ret;
d4519820851b1d Jean-Philippe Brucker 2022-02-09  915  }
d4519820851b1d Jean-Philippe Brucker 2022-02-09  916  
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  917  static void kvm_arm_smmu_v3_remove(void)
d4519820851b1d Jean-Philippe Brucker 2022-02-09  918  {
d4519820851b1d Jean-Philippe Brucker 2022-02-09  919  	platform_driver_unregister(&kvm_arm_smmu_driver);
d4519820851b1d Jean-Philippe Brucker 2022-02-09  920  }
5d6af2ce0093f6 Mostafa Saleh         2023-05-01  921  
9d5e57d93b40eb Mostafa Saleh         2023-08-19 @922  pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
9d5e57d93b40eb Mostafa Saleh         2023-08-19  923  {
9d5e57d93b40eb Mostafa Saleh         2023-08-19  924  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
9d5e57d93b40eb Mostafa Saleh         2023-08-19  925  	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
9d5e57d93b40eb Mostafa Saleh         2023-08-19  926  
9d5e57d93b40eb Mostafa Saleh         2023-08-19  927  	return host_smmu->id;
9d5e57d93b40eb Mostafa Saleh         2023-08-19  928  }
9d5e57d93b40eb Mostafa Saleh         2023-08-19  929  

:::::: The code at line 797 was first introduced by commit
:::::: 94d1b3e12c96365344527059d9fc1570856dc06e ANDROID: iommu/arm-smmu-v3-kvm: Use HOST_HVC PD if possible

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
