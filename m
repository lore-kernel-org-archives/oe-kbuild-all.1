Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3C4756D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 12:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153262; cv=none; b=RBnGclMTDwSXguWzpH4dkOyXH9pi0Ua/YpznSRlodeVeaVKzGzhOmjUmljo27qoNpnvTER+a9OuTN6oSU7fVcg10NuNSCNr/fkJPLHhDI2bt4rVSx5lq2Mr4rFC15gh/lBmw1iJrDyg7GZ/A0fE2mOrsbHdIr0gcKOIRxXBiEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153262; c=relaxed/simple;
	bh=UbkCQ0KL/9sxaABWA9FIGA5ipWmcpTarkK7lw2puJcs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OGZQy2BVc0TTWfMOWmuNGa+M6UHmRFRxDO2fwGrMgRpdakKcpb4YBlYvVlusyUGgYeXCPeRQZ3RJsqTbuebLrQ78UaZhOwHzpyoXxqBptnloMX3rU8pE7Nqm3Y37NpoLdXhh4pZDTQhMnaZXVtImzn5+fWSaFyN0oR8RLApQIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8vO5psY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8vO5psY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792153260; x=1823689260;
  h=date:from:to:cc:subject:message-id;
  bh=UbkCQ0KL/9sxaABWA9FIGA5ipWmcpTarkK7lw2puJcs=;
  b=b8vO5psYP4ZPbs7Qv/ipBn0//KOc5fJLduutGy2I0qwv+w6wkzzaa9B4
   RZHzdlQJ7ZHXgxy2Zly3LGKtz1N32ek3O/u/FEfwtMujqCjgXpQMYa6+5
   RXUWHqk+vB/Cqrno0s1CqKFaiw9FK/aGDVudejQ0mM/sy/TiITxx/ipE/
   ISC0SNfPF0Tasd6QDADVBSF7LJ8ZnV18k8QgUph7sro6UNi5XuPvNSuR5
   TfRw/C9EF6aJPZvwQR+j6TTkTOH+0lk403O83K+5liH+5Ea1n3jycHNcT
   I+9y8TGMjf5UYFugGI4nnLMORr3JS1kWctr6bAJ5IhS+KxyCpELC+1D16
   A==;
X-CSE-ConnectionGUID: PEIEVkToR9eVsO89HYBtwQ==
X-CSE-MsgGUID: y1mxjzUJQrGNclFzMoKiRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="834698"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="834698"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 05:21:00 -0700
X-CSE-ConnectionGUID: tSgggzmKTu+RG0+eXQ/rJA==
X-CSE-MsgGUID: izZj3174Sz2hse8Ye00pWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1906438"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2026 05:20:59 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHgvg-00000000CE3-49ZX;
	Fri, 16 Oct 2026 12:20:56 +0000
Date: Fri, 16 Oct 2026 14:20:32 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 27/27]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4649:34: sparse: sparse: symbol
 'arm_smmu_aux_table' was not declared. Should it be static?
Message-ID: <202610161453.WF6iuaID-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   b4108abbd0e1cb0df40452dee77291f106e1d711
commit: 0bab644878595feedb839a62812e5116bb7acaa1 [27/27] FROMLIST: iommu/arm-smmu-v3: Support probing KVM emulated devices
config: arm64-randconfig-r2302-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161453.WF6iuaID-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161453.WF6iuaID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161453.WF6iuaID-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4649:34: sparse: sparse: symbol 'arm_smmu_aux_table' was not declared. Should it be static?
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:4654:25: sparse: sparse: symbol 'arm_smmu_driver_emu' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +/arm_smmu_aux_table +4649 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  4648	
> 4649	const struct auxiliary_device_id arm_smmu_aux_table[] = {
  4650		{ .name = "protected_kvm.smmu_v3_emu" },
  4651		{ },
  4652	};
  4653	
> 4654	struct auxiliary_driver arm_smmu_driver_emu = {
  4655		.name = "arm-smmu-v3-emu",
  4656		.id_table = arm_smmu_aux_table,
  4657		.probe = arm_smmu_device_probe_emu,
  4658		.shutdown = arm_smmu_device_shutdown_emu,
  4659	};
  4660	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
