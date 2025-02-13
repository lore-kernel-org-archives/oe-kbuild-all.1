Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C51714B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739483136; cv=none; b=iJiN5JhsZIzIpDesqOv3km4B+p3oTwX+sOZaIsZOEPrCJgi1XspsyJWVq7aKbRPxW3Vw8g6dUToFB19tRe4vAjfTZzAgRpZTXAI+rcH7UyCnKiw0cTvFefjrX+MGDQSpCLBaBpkcxSNtshroEapzjyh443fD2jthyFbbxctV7Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739483136; c=relaxed/simple;
	bh=PX500ZA/FphlJsZ4rnlh4L64mNskmwK+pshaL0VdabI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6prECywDBU1+7NkJ8D+9OIJuNCpCX7/XhKVM5mF4MABqAEoQBYGYKudAWJ8snKlKuD043DTj/0xrtavE+j6bQhMdWfawKg+wSTM1Q2XPt7fBt1iL3soMABgAXQQ73iaMkeoHFGcfzaYfSCUEHOGDV0mj1QNNMakl0e38FXnBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft7V+LGC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft7V+LGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739483135; x=1771019135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PX500ZA/FphlJsZ4rnlh4L64mNskmwK+pshaL0VdabI=;
  b=Ft7V+LGC2Fwxp56L3090+35qurF8sfcJvx/dtafApuTzSTWgvFqaABHM
   w3tJ7yshbb9RkI5FhTYYUiN6J6cpZ3LBTyrbeQvKzfF+DgLCKLJEY4m3K
   cnyjacCJZRcedwQMbbRNEqSDYCIC6Uqm7Fm6FInJ0B4v+4Ms8pDNI3B8o
   lwiq63mI7f8/mJUh0392A9qN1DrD+0AwZE86F7CUb836FkVTmLWSwyPvM
   OlAOQ/g5SM6jsstwBpuh3SlUz8+hIAK3Aujsi2HCDrk2Pq6rsy5gSQjzO
   trZ3749b27KfU5YLf9R7OXNpOITH/7w4EX3mm9xduo917rUUT+Ctheiak
   g==;
X-CSE-ConnectionGUID: SjSho7MFQ6mdPM7HGiewug==
X-CSE-MsgGUID: RJu0oTK2QYCkWOml3/Kk7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="27815010"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="27815010"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 13:45:34 -0800
X-CSE-ConnectionGUID: 2wLBQLHmRbCWN6JPHCBaUQ==
X-CSE-MsgGUID: doqLk6bBTkKEBdUD2b+0qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150442588"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 13:45:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tih1W-0018jX-2E;
	Thu, 13 Feb 2025 21:45:30 +0000
Date: Fri, 14 Feb 2025 05:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:77:13: warning: no previous
 prototype for '__topup_virt_to_phys'
Message-ID: <202502140502.v8ctzYdt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e782b793c4430c06006ea850440b03ef71d262c8
commit: d35c7ab234a86fb5a529297c4c340daf8081d6e9 [3/3] ANDROID: iommu/arm-smmu-v3-kvm: CMA donations to the hypervisor
config: arm64-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502140502.v8ctzYdt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502140502.v8ctzYdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140502.v8ctzYdt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm64/kvm/: No such file or directory [-Wmissing-include-dirs]
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:77:13: warning: no previous prototype for '__topup_virt_to_phys' [-Wmissing-prototypes]
      77 | phys_addr_t __topup_virt_to_phys(void *virt)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: In function 'kvm_arm_smmu_domain_free':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:309:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     309 |         int ret;
         |             ^~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: At top level:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:964:5: warning: no previous prototype for 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     964 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:974:5: warning: no previous prototype for 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     974 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1024:5: warning: no previous prototype for 'smmu_put_device' [-Wmissing-prototypes]
    1024 | int smmu_put_device(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1030:5: warning: no previous prototype for 'smmu_unregister_smmu' [-Wmissing-prototypes]
    1030 | int smmu_unregister_smmu(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1159:15: warning: no previous prototype for 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
    1159 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


vim +/__topup_virt_to_phys +77 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

    76	
  > 77	phys_addr_t __topup_virt_to_phys(void *virt)
    78	{
    79		return __pa(virt);
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
