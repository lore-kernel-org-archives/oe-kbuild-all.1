Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F32F7AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610947; cv=none; b=mx7lG9lI8LaVpxTeRDUtGD+FcMaTOJuJOkquyXIntxomoJMAUdd6g54S07SchAgoZ8thTBsRTIvifAPLKXrXEc6LDyLpDSFPJmQqGmWEV6y8Z5LXd4rWAzGIT/aPnHQWs9uju6O3waKpJ/rLSDBW55ESMO84ST0MsSFPLMbXDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610947; c=relaxed/simple;
	bh=TIS6+NCNSxuYcHnex6jqVW17k9Gykj+1BMu7IWrxzNs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vGYKu9PZsSQmmXfxVNq1g4OVkH8bKPFxO+LCEGmINqrVrCObPchEC7SB+a17QN5OZHc4BmV3TJoJx7UiYnqVDciwhiCsgHdm4yaRO2fI8eoYsnzX+Km8dOVbthp5fv3KovwD87ekRzNxL8djMC6t4KiD1XE/JKFF9QmRXzTfmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtnIaX5s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtnIaX5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769610945; x=1801146945;
  h=date:from:to:cc:subject:message-id;
  bh=TIS6+NCNSxuYcHnex6jqVW17k9Gykj+1BMu7IWrxzNs=;
  b=VtnIaX5sQuuZlY5RU8lMeg5fk/21Uvk+/9xak47W3xte9rYqPUZMTCBK
   BUMupzONANZ0RaStHy8l79ouF32rbl6FKzYzUFh/3X2WhKnskrvaKSdsY
   hwaODVTfPR9PzXxKYcHyRtKsMa3+qhO+Nf/gq57cfFuIIkPfMVnmMa5GO
   S/+7FXtSAk6lwlZ6v5iuBH1U1x1MZZuaTVNAI/caCklEgeCOwgzftAf0z
   Jpt5uwT3HYYNOsSeME1aJUsRz5YW8meMPskVgOYPryHJamCZrtClOMn2J
   ZBJyMmjrHcGQlsDnTgI/aksE4GnEGSITGYqvuv8Rbiz42nbSCps+1JjRR
   w==;
X-CSE-ConnectionGUID: 18FeuYIGQY2ozdkmn2Ddug==
X-CSE-MsgGUID: VL/akx4rS2eqijQ6bEDKIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="58403390"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="58403390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 06:35:44 -0800
X-CSE-ConnectionGUID: n/NkcCFCT8urbtU9vmOkJA==
X-CSE-MsgGUID: HQ5b2m+kQByV8Uyb+RYjew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208297103"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 06:35:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl6dw-00000000Zl6-3R0i;
	Wed, 28 Jan 2026 14:35:40 +0000
Date: Wed, 28 Jan 2026 22:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8/8]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: sparse: sparse: symbol
 'kvm_iommu_refill' was not declared. Should it be static?
Message-ID: <202601282254.vbKuzkDF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5a8f9765bd232fdc77183cca9f99196fa87b1bcc
commit: be3195fe7b08b042aca453d795a8d0afede4d2a4 [8/8] ANDROID: KVM: arm64: iommu: Use unified allocator interface
config: arm64-randconfig-r131-20260128 (https://download.01.org/0day-ci/archive/20260128/202601282254.vbKuzkDF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282254.vbKuzkDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282254.vbKuzkDF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: sparse: sparse: symbol 'kvm_iommu_refill' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:60:6: sparse: sparse: symbol 'kvm_iommu_reclaim' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:65:5: sparse: sparse: symbol 'kvm_iommu_reclaimable' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:99:21: sparse: sparse: Using plain integer as NULL pointer

vim +/kvm_iommu_refill +55 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    54	
  > 55	int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
    56	{
    57		return refill_hyp_pool(&iommu_host_pool, host_mc);
    58	}
    59	
  > 60	void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
    61	{
    62		reclaim_hyp_pool(&iommu_host_pool, host_mc, target);
    63	}
    64	
  > 65	int kvm_iommu_reclaimable(void)
    66	{
    67		return hyp_pool_free_pages(&iommu_host_pool);
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
