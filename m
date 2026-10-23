Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751824;
	b=zsmw9b9CUZRvG9QArUl6YMxLBhCWWByOx53xM/4Rb1qAAEFna3Ko3MFY/IcHebBB7mjN
	 01Dvo0H4O1ONSaXJRj+PcNbpcMYZEYUAojtULl+tofdKkiPunSws3ANQQ8wbhPG24MzlG
	 Fvw6HNqZDKslDcaWVknYSpy2/WrRj7UInPVVxVui+A2Nrefjzhc+2ZIywUCW2ZQ2xzQM6
	 WTcRT4WPCmb3XxwMtvJVc6adiHE/ScIlnX5/9i4kXm66T7m/ubTzbvmLLfJoJWMQRhpk7
	 NRTKUWJVKrXYza7cBon9DOQn59QMeZsd7PPuSWGJE6a0szhjTgNCJc3iBOEmqebJuRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751824;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KhVxE34fovljfW3Dofcrl7nkSibzj1C8a+k+FXz8VQg=;
	b=CxzLZ0QrWDkr/GRIT5kmnEzhJqUHaHsA2ZGzR7/5Tbgy8gK4xHKAwHAslhND+C2LYF4c
	 5DvchSGdLEHcSdtK+zdi7fGbm2iUgZ+GAhI89CypSze0VB+jgo3E1f3c48HMj6jcJsbSq
	 +HysJRdtOjdN0zUvKixleb9wkbh5JR/iC7OR9pqvccXT7Jrrg+GGAcqUFcvUHLmGyjNOo
	 979lAt49bB46BOsLtlTD4St1H0VJNBNUdN9r3XhazEVZXr/MAb87hpi8sYPDid16xEyC6
	 QvEjSzDHEjbI7vnsqVyZ0OTInrtcdOv69Hy/CdVJBt8B8kSk2sbnp670yBi8JczjbYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HiW9txxt;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64832606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 10:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64832606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HiW9txxt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792751822; x=1824287822;
  h=date:from:to:cc:subject:message-id;
  bh=7c8WOQOo5gynbke+BDKR5t0kdT2X+OCPIfW+v9WuiyI=;
  b=HiW9txxtlMYsDWwnXl5An+B1MeCK8vEOXyDl1CTnDcKMrWm4NFLC4seF
   jbcH4GDrersCQ/Xj9GHsSHWLcZ7E3Aw1807CEnDlJ9gIEyvKs+paxHFys
   Da7zIqVubwKlKSICceU5Cc218UvoFNHZNhx4066Zrxu5pVWMLo3ywZ36G
   Agk8lev+5ncZs7/aiLQc9kK0PNVZe5gvXx8H137LsShNV1ur4qXun/ju9
   rgUcmTZ2WapEryqTHNFUPAwd3ScQ8TrhZ39J9qfzXowEU6srCgYBiCGXO
   VkfItgkZb+uNxShn0uAptLLEpTPtEpz+ZriNu+mun80ZS63UjsOWZkvBn
   g==;
X-CSE-ConnectionGUID: SLrvv2yxR0i0IDsymIISbQ==
X-CSE-MsgGUID: PCZjQqXMQWSHrKXSbVCicQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1399511"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1399511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:37:00 -0700
X-CSE-ConnectionGUID: ftIM0nvmT3SP4GHechrwuA==
X-CSE-MsgGUID: BMTgFQBqS/+x375HRGKUcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3993388"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2026 03:36:59 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKCdr-000000000aR-2d2j;
	Fri, 23 Oct 2026 10:36:55 +0000
Date: Fri, 23 Oct 2026 12:36:09 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 2/2]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:820:5: warning: no previous
 prototype for 'smmu_init_hyp_module'
Message-ID: <202610231226.uBY1HHYI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   7ed219d1133d473dd3590c95967761096b8c1b1e
commit: 1f7c566fe2211514bf377944f1e9964255b2ba75 [2/2] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-randconfig-r2201-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231226.uBY1HHYI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231226.uBY1HHYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231226.uBY1HHYI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:596:5: warning: no previous prototype for 'smmu_domain_finalise' [-Wmissing-prototypes]
     596 | int smmu_domain_finalise(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:712:5: warning: no previous prototype for 'smmu_alloc_domain' [-Wmissing-prototypes]
     712 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain)
         |     ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:727:6: warning: no previous prototype for 'smmu_free_domain' [-Wmissing-prototypes]
     727 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:739:6: warning: no previous prototype for 'smmu_dabt_device' [-Wmissing-prototypes]
     739 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:782:6: warning: no previous prototype for 'smmu_dabt_handler' [-Wmissing-prototypes]
     782 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:794:5: warning: no previous prototype for 'smmu_suspend' [-Wmissing-prototypes]
     794 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:807:5: warning: no previous prototype for 'smmu_resume' [-Wmissing-prototypes]
     807 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:820:5: warning: no previous prototype for 'smmu_init_hyp_module' [-Wmissing-prototypes]
     820 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~
--
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
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
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
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/smmu_init_hyp_module +820 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

8af4fb14929c1c arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c      Mostafa Saleh 2023-10-17  818  
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  819  #ifdef MODULE
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17 @820  int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  821  {
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  822  	if (!ops)
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  823  		return -EINVAL;
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  824  
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  825  	mod_ops = ops;
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  826  	return 0;
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  827  }
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  828  #endif
e55c0e59243b6a drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2023-08-17  829  

:::::: The code at line 820 was first introduced by commit
:::::: e55c0e59243b6a553c5b39440251d61cebef0188 ANDROID: iommu/arm-smmu-v3-kvm: Support EL2 compiling as a module

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
