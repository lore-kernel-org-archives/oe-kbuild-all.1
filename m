Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C110FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721350203; cv=none; b=nKvU3tawpHDzEGsbxZ1DoE7Z3uQP/5Vn9YvmF5BkcTTLxPfiyqez+6Rh8VeGrwo7Q4wcyOd73dqTFaA28M7nqByWg2Jn9UAtB2GzviC+aEduWCQUYcev1yWImhS04kiwg+5opa9By/nxZQl8T2dDs0PfLItw28C3s7O5Z3i26uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721350203; c=relaxed/simple;
	bh=Dzcl+I7G2Surcc6Af9Fk2KgoPOjZovC0YVWUXnPcvZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXrI4XGdwRFc+WfxwGToS2s45lD6pnuN7b3cAOStdXpu8d8TUY78PCPN/iriT2DVClGQCOvf2CLabm/t4MRHPwUw51iBDZ3nfSiC6/YcSkxqbAYKXwPNwySAJ3wsqhSVEGO44kvS/LxujJSmtSnVW9okomn6shO/3cUKdVZe5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDZQeowr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDZQeowr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721350201; x=1752886201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dzcl+I7G2Surcc6Af9Fk2KgoPOjZovC0YVWUXnPcvZo=;
  b=DDZQeowrJKwjiIhBdYuQTC6+Tb3g3dkY0rXPOBvgmItQQQG14OT0v5QF
   8VnuvR/ibToa5jvC1v7II8gd2XWFpZNZXkPbGAakDcVPP0Z9hUnx1ZKXy
   DtMSaeQ6T/sjFpczNCRJGC1+n8X2MQDDIXz1GyZlLwhucf9V3tGalmad+
   WgNNL53f694pZjOh3FBAQyvPB1F1eBhCsPB/Sxq3IJOp/CJVmXbKzXdD4
   d1HVAuOYaWOVt7PHthvUT8deJooXdRQlEPlGYBCGrFmlJ/6gjZiF597EX
   gHRiGAfuFQAD2qN+o9jmDngAdfY3CGsR9WH/uxpzxFPPe+tt+a6skS552
   A==;
X-CSE-ConnectionGUID: Vg+IFSC+TfmockY2vxZC6w==
X-CSE-MsgGUID: 1F8lyLUGRWCMG8MXsg7o1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18759507"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="18759507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 17:49:58 -0700
X-CSE-ConnectionGUID: UNOMO6m5S1aKyAahWa4oiw==
X-CSE-MsgGUID: Sg195UvYRdiCH8fSG+YUnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="81989072"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2024 17:49:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUboo-000hhu-33;
	Fri, 19 Jul 2024 00:49:54 +0000
Date: Fri, 19 Jul 2024 08:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:54:5: sparse: sparse:
 symbol 'kvm_arm_io_pgtable_init' was not declared. Should it be static?
Message-ID: <202407190840.0Hdo1DDB-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   485f58484dd83e1f0ab5a620a88a0120bf605cdd
commit: 09de45521bacc85848722d3b15c846e584e51846 [1/1] ANDROID: KVM: arm64: Fix build issue without CONFIG_ARM64_LSE_ATOMICS
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240719/202407190840.0Hdo1DDB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240719/202407190840.0Hdo1DDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407190840.0Hdo1DDB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c:54:5: sparse: sparse: symbol 'kvm_arm_io_pgtable_init' was not declared. Should it be static?
--
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:198:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:198:25: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:198:25: sparse:     got restricted __le64 [usertype]
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:690:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:690:20: sparse:     expected void [noderef] __iomem *base
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:690:20: sparse:     got void *
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:741:5: sparse: sparse: symbol 'smmu_domain_config_s2' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:787:15: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:823:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:823:21: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:823:21: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:825:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:825:21: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:825:21: sparse:     got restricted __le64 [usertype]
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:840:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long volatile @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:840:9: sparse:     expected unsigned long long volatile
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:840:9: sparse:     got restricted __le64 [usertype]
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:773:5: sparse: sparse: symbol 'smmu_domain_config_s1' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:847:5: sparse: sparse: symbol 'smmu_domain_finalise' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:918:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:918:24: sparse:     expected unsigned long long [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:918:24: sparse:     got restricted __le64 [usertype]
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:924:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long volatile @@     got restricted __le64 [usertype] @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:924:9: sparse:     expected unsigned long long volatile
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:924:9: sparse:     got restricted __le64 [usertype]
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:994:5: sparse: sparse: symbol 'smmu_alloc_domain' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1011:6: sparse: sparse: symbol 'smmu_free_domain' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1023:6: sparse: sparse: symbol 'smmu_dabt_device' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1066:6: sparse: sparse: symbol 'smmu_dabt_handler' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1078:5: sparse: sparse: symbol 'smmu_suspend' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1091:5: sparse: sparse: symbol 'smmu_resume' was not declared. Should it be static?

vim +/kvm_arm_io_pgtable_init +54 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c

cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  53  
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23 @54  int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  55  			    struct arm_lpae_io_pgtable *data)
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  56  {
27175bfef08dd78 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c Mostafa Saleh         2023-08-12  57  	int ret = -EINVAL;
27175bfef08dd78 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c Mostafa Saleh         2023-08-12  58  
27175bfef08dd78 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c Mostafa Saleh         2023-08-12  59  	if (cfg->fmt == ARM_64_LPAE_S2)
27175bfef08dd78 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c Mostafa Saleh         2023-08-12  60  		ret = arm_lpae_init_pgtable_s2(cfg, data);
27175bfef08dd78 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c Mostafa Saleh         2023-08-12  61  	else if (cfg->fmt == ARM_64_LPAE_S1)
27175bfef08dd78 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c Mostafa Saleh         2023-08-12  62  		ret = arm_lpae_init_pgtable_s1(cfg, data);
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  63  
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  64  	if (ret)
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  65  		return ret;
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  66  
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  67  	data->iop.cfg = *cfg;
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  68  	data->iop.fmt	= cfg->fmt;
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  69  
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  70  	return 0;
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  71  }
cc07183cc836e2c arch/arm64/kvm/hyp/nvhe/iommu/io-pgtable-arm.c      Jean-Philippe Brucker 2022-11-23  72  

:::::: The code at line 54 was first introduced by commit
:::::: cc07183cc836e2c8e29a55ae6e8e2aa431d59170 BACKPORT: FROMLIST: KVM: arm64: smmu-v3: Support io-pgtable

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
