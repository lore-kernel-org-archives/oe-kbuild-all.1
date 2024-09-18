Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0AB139D09
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726642867; cv=none; b=NTsdKGpP7sICQRWnPuJWvgzEo2MS89cX5zf93KkGcN8yl24pXZj1Uwf9Fce6yN1A2LDZ1yiWaveyPmA/lfoo5zZcyI9PAGtWLXw2QbYJUPevVJpnFyD05T70cLDoTYoaueBVHqAyCkRJu84C1bnE5YJQidtKo7A9abhJ5VWzFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726642867; c=relaxed/simple;
	bh=n57QlslVL28SJzg1f8WPep/O/fj0fxoagyq8ou4HS28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSgG1qYEEeuHcd3zNyp6/0siQUTZQ4PPGr82r+96+O5jOxIkLCpZDgi5+zY/Pfre1254YiPxZrIZhEi3z/2Du8ViXojU40tfyCYj3LSZWzZlBrSJtq4WeN4OBf8CwKOa+JuvSe1wZbMP36k3C68oX8h028KuB0B2lCURumv8Grg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPsIGF9I; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPsIGF9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726642866; x=1758178866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n57QlslVL28SJzg1f8WPep/O/fj0fxoagyq8ou4HS28=;
  b=BPsIGF9IWP6ZgPmeYtISnhcbjx1DZHoSNpvZx5UIbHMLkAJjLA3uT3s7
   nNt5AruXr27x1esdQueVg4SVi0nmHfjjJ8pTqDVsqUx7n5Fxga/V4APUY
   QDCWZoDW5wIIB7y4qY43nLP0Zd4YpIEHamSe3tEiznllL+NSuO3T4Ajx1
   Ej7266RS3YF2IcY7yhx0/da96nE8tyqoe6w7yNdFREf2gDJDZ5otuY1pi
   1OF9YXUITdS9t/NOvWciSDsLgYawS+mdOyZINcO3tCcXKfvxElEGfeCfy
   8ssDeOH0NgdAzVYVAzFnl6Nlwfu9q9hidi8U6yH/G8BxP0aE7oSuSQ5On
   Q==;
X-CSE-ConnectionGUID: U4zCA0VqTxqLIePPEn7R1g==
X-CSE-MsgGUID: 4hE2eQMfTVG3Nup5q9ohyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36913700"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36913700"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 00:01:03 -0700
X-CSE-ConnectionGUID: Ko1sVWwkTX61YnC8rR4/pw==
X-CSE-MsgGUID: typZgVmcRL2Vqxth1ihyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="106915592"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Sep 2024 00:01:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqogL-000BwB-2g;
	Wed, 18 Sep 2024 07:00:57 +0000
Date: Wed, 18 Sep 2024 15:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:smmuv3_nesting 17/21]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1699:46: sparse: sparse:
 restricted __le64 degrades to integer
Message-ID: <202409181435.4W1hYCca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   f877814753bee37493de05928d0c4f78bbf1a9dc
commit: b263d240f7a6cb7d4e44ebf6e80b55003ef8c1e7 [17/21] iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
config: arm64-randconfig-r132-20240918 (https://download.01.org/0day-ci/archive/20240918/202409181435.4W1hYCca-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181435.4W1hYCca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181435.4W1hYCca-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1699:46: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:27: sparse: sparse: restricted __le64 degrades to integer
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:25: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:25: sparse:     got unsigned long long
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3263:23: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1699 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1688	
  1689	static void arm_smmu_make_nested_cd_table_ste(
  1690		struct arm_smmu_ste *target, struct arm_smmu_master *master,
  1691		struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
  1692	{
  1693		arm_smmu_make_s2_domain_ste(target, master, nested_domain->s2_parent,
  1694					    ats_enabled);
  1695	
> 1696		target->data[0] = cpu_to_le64(STRTAB_STE_0_V |
  1697					      FIELD_PREP(STRTAB_STE_0_CFG,
  1698							 STRTAB_STE_0_CFG_NESTED)) |
> 1699				  (nested_domain->ste[0] & ~STRTAB_STE_0_CFG);
  1700		target->data[1] |= nested_domain->ste[1];
  1701	}
  1702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
