Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE63B4E8A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823759; cv=none; b=RqXvfjQ/g5DCuUMYX4T0a3UE35eAFfQTQh0Kop9FYIKsE5X7dOQOWbFOXsNKmPY8YZnVaM2U8AfPhHTLl8Hqrkz1yQpTKabXPAqZdMsROcQeOQ/N4zWA2GqM5YAI7584eAx2eA7cuKd6aydfhoFXdgj1fU+TH9/yYGF8p+ASTuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823759; c=relaxed/simple;
	bh=xNfeEe1QZJyjd+M9lWdhljum1Yqsz2sTpyK4TKbmoPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ka3D+7oRuRBqcfT8pB97ox1oE0izBIPYSeToUguius9zaH84odgWgRp6q16uTK+AU6N0Kt1kzYgDAliXWJu+wRLSczZTxiry8QVzEf6V+oM9icHFS152urqH2rdOuwtWgkNgouPja1BmuE6mnMFrStJRaizbDp+hmD0mnValoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD9FMUO4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD9FMUO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775823758; x=1807359758;
  h=date:from:to:cc:subject:message-id;
  bh=xNfeEe1QZJyjd+M9lWdhljum1Yqsz2sTpyK4TKbmoPk=;
  b=PD9FMUO4VtEQtrYhXBsed4R7epSDmor4DkhkGHCtJuEhfuKsOtvsSmuV
   KK6Asd0rkkhye1f722Km/hwUWWqOB3JPUceX4kGVA4nD58nbTwYGI9KIA
   FnC+RpniSlgGhYh5pIdku05qs6uBsqZOWtDIXY8vTAbS5VRo5u1xmwhsn
   3tfTah3rRrqk024OEA45l8RhtDGFLbajukz3zVIWOOkoMIpwHF22an4Tx
   WT1MCXafw5nslg5/Rwck/ztHxJbo+pB9vLTB5aP4nw5112CN5HZT6mIab
   uIvwlXVCV9+VywUqWg92t+1dDn7uZ8SQGDVlLBfh0bninCwxYLtp39Yt/
   w==;
X-CSE-ConnectionGUID: NtQCWnOsTh+oUFI1Mx6RKw==
X-CSE-MsgGUID: ORi5spi0T26zozmjRLbFqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76557702"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76557702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 05:22:38 -0700
X-CSE-ConnectionGUID: wUgQ5EwjRh2E3TVzS5FZLg==
X-CSE-MsgGUID: +67Ygv6CTMmIFT/XfxSiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="267034601"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Apr 2026 05:22:37 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBAsc-000000003in-0MEV;
	Fri, 10 Apr 2026 12:22:34 +0000
Date: Fri, 10 Apr 2026 20:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4647:34: sparse: sparse: symbol
 'arm_smmu_aux_table' was not declared. Should it be static?
Message-ID: <202604102007.Eba7XZwO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   08e21ebff803243bccd5e6cd4a8253ffebf74c64
commit: 5e05ef6d02e170f7200fb3a5b56acd2993b20633 [1/1] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-randconfig-r133-20260408 (https://download.01.org/0day-ci/archive/20260410/202604102007.Eba7XZwO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102007.Eba7XZwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102007.Eba7XZwO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4647:34: sparse: sparse: symbol 'arm_smmu_aux_table' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4652:25: sparse: sparse: symbol 'arm_smmu_driver_emu' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
--
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:35:16: sparse: sparse: not a function list_add_valid_or_report
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:40:16: sparse: sparse: not a function list_del_entry_valid_or_report
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: cast to restricted __le64
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:426:22: sparse: sparse: invalid assignment: |=
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:428:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:438:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:440:22: sparse: sparse: invalid assignment: |=
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:456:40: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:459:25: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:612:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@

vim +/arm_smmu_aux_table +4647 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

0bab644878595f Mostafa Saleh 2025-11-17  4646  
0bab644878595f Mostafa Saleh 2025-11-17 @4647  const struct auxiliary_device_id arm_smmu_aux_table[] = {
0bab644878595f Mostafa Saleh 2025-11-17  4648  	{ .name = "protected_kvm.smmu_v3_emu" },
0bab644878595f Mostafa Saleh 2025-11-17  4649  	{ },
0bab644878595f Mostafa Saleh 2025-11-17  4650  };
0bab644878595f Mostafa Saleh 2025-11-17  4651  
0bab644878595f Mostafa Saleh 2025-11-17 @4652  struct auxiliary_driver arm_smmu_driver_emu = {
0bab644878595f Mostafa Saleh 2025-11-17  4653  	.name = "arm-smmu-v3-emu",
0bab644878595f Mostafa Saleh 2025-11-17  4654  	.id_table = arm_smmu_aux_table,
0bab644878595f Mostafa Saleh 2025-11-17  4655  	.probe = arm_smmu_device_probe_emu,
0bab644878595f Mostafa Saleh 2025-11-17  4656  	.shutdown = arm_smmu_device_shutdown_emu,
0bab644878595f Mostafa Saleh 2025-11-17  4657  };
70c9e958ffbf36 Mostafa Saleh 2023-08-17  4658  #endif
0bab644878595f Mostafa Saleh 2025-11-17  4659  

:::::: The code at line 4647 was first introduced by commit
:::::: 0bab644878595feedb839a62812e5116bb7acaa1 FROMLIST: iommu/arm-smmu-v3: Support probing KVM emulated devices

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
