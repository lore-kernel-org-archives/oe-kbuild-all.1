Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172E397686
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545109; cv=none; b=qwgLyWksi1Dp4OygJ3Il57/GGHtlUzNkWRWJ9oip6z19L5riv/BbPIQodClu4qId3r5lTwTFSiWLEI7Fwo+L568ItpUgshtugM0SHP6N3m1O3QtrnYXAYchBrI5blc8K6oNO4VzjTXXSLgAWs3IkQRJpzXwO2xSG4ikAjDbsF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545109; c=relaxed/simple;
	bh=Phi+mx13/njSzuu/4J8T6hCd/6MMQYuWUWnThUXVFVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AFQ4N3AyH+sBxDEjMISZAImg7JkIb4ZBbSq/9vPrUcMZVeuUlZeEey4PW4EuAWdtGdIDm1HBpMfdP5cAOCpYzxj53lXjSnYmN6VaKMzS+UJNofjau9qxNWxmlnGhl0KbqvgBCiQeV7KcomSZoGUs86MpIE2sSBp/9yuOa7Z3LbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcQx4DUu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcQx4DUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774545107; x=1806081107;
  h=date:from:to:cc:subject:message-id;
  bh=Phi+mx13/njSzuu/4J8T6hCd/6MMQYuWUWnThUXVFVY=;
  b=DcQx4DUuC7efqaz1idpqMxNh5lWtigoWtkzGWgs8M0EgIP2jNwfIrMkD
   J6u0TeG2Tj5ABFoYGFjs4wLSe01yTy5p2RL97HZcqPnWg2KctQTp8hJND
   MwF+WYJ9eFgQkEO2zsTk7Y7+6PT03tgIP3ElFWcKjDN6urJbuEaAj0vSL
   0s/TfR2qgpTrTfcgurBIxotSdJ7Mut8MKOdGpYUKPjn3FvYGTMFXtOxaT
   VnBH5HiTavX9dxz5jBUyqKriRVq5uNIfY8d1FQHXipK/Wl7ZiRwKcQVaF
   6bTluHbPywMs+1enrR/ozS1tAwdFWT8/+A29UpIY5KK3J2tlvLmiM6rfr
   g==;
X-CSE-ConnectionGUID: AeuKpOCJTO6eOLSnU4US7w==
X-CSE-MsgGUID: Ib+fF0B7Tb6uO+6MoBzW7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78207623"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="78207623"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 10:11:46 -0700
X-CSE-ConnectionGUID: k2CDM5NdRW6jZE7n1MFuPg==
X-CSE-MsgGUID: WGyhj+ZXTvmBmM2f4QDQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="230009063"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2026 10:11:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5oFC-0000000096f-0jT5;
	Thu, 26 Mar 2026 17:11:42 +0000
Date: Fri, 27 Mar 2026 01:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:252:6: warning: variable
 'ret' set but not used
Message-ID: <202603270130.EhJPI60i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d73a8ddf419e5ee819fff624cf35bfedd85b5609
commit: e0abda8b771ca9dd97fd815b4be3bc9711fa3a5c [1/1] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270130.EhJPI60i-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270130.EhJPI60i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270130.EhJPI60i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:252:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     252 |         int ret;
         |             ^
   1 warning generated.
--
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1360:5: warning: no previous prototype for function 'smmu_init_hyp_module' [-Wmissing-prototypes]
    1360 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1360:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1360 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/ret +252 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  249  
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  250  static void kvm_arm_smmu_domain_free(struct iommu_domain *domain)
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  251  {
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12 @252  	int ret;
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  253  	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  254  	struct arm_smmu_device *smmu = kvm_smmu_domain->smmu;
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  255  
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  256  	if (smmu) {
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  257  		ret = kvm_call_hyp_nvhe(__pkvm_host_iommu_free_domain, kvm_smmu_domain->id);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  258  		ida_free(&kvm_arm_smmu_domain_ida, kvm_smmu_domain->id);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  259  	}
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  260  	kfree(kvm_smmu_domain);
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  261  }
6cb3ecc7be2f63 Mostafa Saleh 2024-12-12  262  

:::::: The code at line 252 was first introduced by commit
:::::: 6cb3ecc7be2f6315e496f59b1966a2b515dfc776 BACKPORT: FROMLIST: iommu/arm-smmu-v3-kvm: Add IOMMU ops

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
