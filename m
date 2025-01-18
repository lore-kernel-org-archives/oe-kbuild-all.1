Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023A8634F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 11:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737199623; cv=none; b=g2dEvZ9jmrw8JAB41v5Ski0YKBZsnNxf5+D+Vt9ivM3EFwomSr6F4LG2KJN5JFr463znx+ASsKKKUZMEIbkSET7FUfmntMiYVA+1J8RjvEJUeLDz5iqMv6i+4nx7GZitmf7GVhaOpWZ+sRTCdWCYvwiYsUyqIT2LwqibT+D8fX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737199623; c=relaxed/simple;
	bh=uM0gBGCWpY2VDbdRbfD+FhkTbKLTUrRFfk9TAMe5bZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npEiwiTi4F1H2g2qMKKmicA5K4WhPMKf9MXqhnnzyGe6nJl9WUkVpCpfJx9tguNu9fF8Mc7bQigfe+tJ3dOx7KHMEORtvYeK4hyKus7T7dB0t39jnXZUjgDIkwiqtpro16YxAxCbPsZd0NYsqVUrw9v2jGhJkzIZSxPq1jK1e0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQ3LlL+A; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQ3LlL+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737199621; x=1768735621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uM0gBGCWpY2VDbdRbfD+FhkTbKLTUrRFfk9TAMe5bZg=;
  b=XQ3LlL+AveQcqXQEGkkLOwVhmzulCM0VJ6HAV21nbctGind004ii1aqB
   oiZ2TtJimZr9fQ+97dv0WiAZWBlTvS8b7MDVhOqdHuxlycZiY5SCPI6Rg
   ryVskRLlAuMp8Pm1agN8ymSj+pYQYjJNEdsFpQ6xqLYqS4lNQO2b+nMwL
   zII7pjhpnJobDB8fnvtSFyTzuNwCCWNkr3EBs7y31VlnX2x4CzaoGTa26
   NJAPHLXFyCRd2MrzuIvxQrg4E/j0FGkDNDYGbIJpN11QAFpT8lIxkxMGW
   XME/aBm7vxYNj8CprXh4XK3m08HO9lkXBG0UyZhsxwhjjc9JdMH/TjaCI
   w==;
X-CSE-ConnectionGUID: /Qit0wv3RgqC2S6hb20GbA==
X-CSE-MsgGUID: d4PXyJRrQOOgNKoj/U2Qdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41558119"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="41558119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 03:27:00 -0800
X-CSE-ConnectionGUID: rcKIs0akR0eAl3ynGRYgHA==
X-CSE-MsgGUID: IUyifBWGTLCHYzAJuQQYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="105849518"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jan 2025 03:27:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ6yf-000ULf-0k;
	Sat, 18 Jan 2025 11:26:57 +0000
Date: Sat, 18 Jan 2025 19:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:77:13: warning: no previous
 prototype for function '__topup_virt_to_phys'
Message-ID: <202501181958.8jGggFhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b7e7f27a0d8c205d665797cbe7db6a640417f73c
commit: d35c7ab234a86fb5a529297c4c340daf8081d6e9 [1/1] ANDROID: iommu/arm-smmu-v3-kvm: CMA donations to the hypervisor
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501181958.8jGggFhu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181958.8jGggFhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181958.8jGggFhu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:77:13: warning: no previous prototype for function '__topup_virt_to_phys' [-Wmissing-prototypes]
      77 | phys_addr_t __topup_virt_to_phys(void *virt)
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | phys_addr_t __topup_virt_to_phys(void *virt)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:309:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     309 |         int ret;
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:964:5: warning: no previous prototype for function 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     964 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:964:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     964 | int kvm_arm_smmu_suspend(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:974:5: warning: no previous prototype for function 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     974 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:974:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     974 | int kvm_arm_smmu_resume(struct device *dev)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1024:5: warning: no previous prototype for function 'smmu_put_device' [-Wmissing-prototypes]
    1024 | int smmu_put_device(struct device *dev, void *data)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1024:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1024 | int smmu_put_device(struct device *dev, void *data)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1030:5: warning: no previous prototype for function 'smmu_unregister_smmu' [-Wmissing-prototypes]
    1030 | int smmu_unregister_smmu(struct device *dev, void *data)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1030:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1030 | int smmu_unregister_smmu(struct device *dev, void *data)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1159:15: warning: no previous prototype for function 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
    1159 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1159 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         | ^
         | static 
   7 warnings generated.


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
