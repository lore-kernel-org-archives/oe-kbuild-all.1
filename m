Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DE3D1CAA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136110; cv=none; b=EPiOsQvp+vutsGHdA3lzHoEwroSHO+11SNxraTDG+yVITjSqIbQDWfrT7AAbvshkNkhN6epKA+UM2EEicVEOPY+5kZobcsQAjdDRyByQxzp80XggY7ZBqGpnLOXu7LnE8Oosk2oXauZP+E/QvDyonUUOkbcugzjhm6O6OMZjEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136110; c=relaxed/simple;
	bh=g5pd+jLCMsy5FPeIV7swUZIp+JESazvhGDwclbIZKyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xjx/goIlThm1saOYYxwMb017Wc6/+6z4syk6FHemfu1iaKbQwBy7k9MRwPSM2v0ROj+BUSRIKhAVYyGt0O7zeUnR9ndgd/y5XQt68OpHrUFj+vUPuhXnjGXJCKJn4GDJcTrDID4WRBSBgWAsP1rdKWSBnMU7lxV2yADLzckmLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpEDQO/K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpEDQO/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770136109; x=1801672109;
  h=date:from:to:cc:subject:message-id;
  bh=g5pd+jLCMsy5FPeIV7swUZIp+JESazvhGDwclbIZKyE=;
  b=YpEDQO/KjUUH4GEQsSFuANxpuNsDTehQtz6gmNEyACwr0kddc/0+qDgv
   HuW0JnXVxXhp2SJraUb/tT6wld5gGFl+NbU/td0oN40k6llCAV4xK3ZFo
   gMo5odZQF1+wQIVh7VD2MzDit+gZyBsb02kMeS+JAHwTXzTMA7B0VPW3d
   WtnugOGcUbFoOj+U41u3zXbSrRM0NXnLXPP2fyu0weKhAL7Jbp2xBPy7C
   jobHL+SoaupyMuz2z00bCajRtqMGxdZgZI6LyQhnKbpZE7zeVmVH2Mhlv
   Ykge7kCEgINuh7KzrJf0O+GZjgjB+1kQkvPCfM/TGdIct0UyjUBl4ggxB
   g==;
X-CSE-ConnectionGUID: xHBwDUOaQJeRBLNg5QqzcQ==
X-CSE-MsgGUID: DA3G54fJR86ojXyjdH31tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73910553"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="73910553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:28:28 -0800
X-CSE-ConnectionGUID: AC90CuapRHm2hMnsNs/bYA==
X-CSE-MsgGUID: Q5WYN3xFTwixaX/EU5PcBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209182659"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 08:28:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnJGK-00000000gqS-0O0m;
	Tue, 03 Feb 2026 16:28:24 +0000
Date: Wed, 04 Feb 2026 00:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] ld.lld: error: undefined
 symbol: iommu_free_pages
Message-ID: <202602040025.dNDWTwwv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   367aa148ad18ea2d6d56373b83d5895390195cdd
commit: 6ace5be5937cc205a98e4738d000581686a7c3d9 [2/2] ANDROID: KVM: arm64: iommu: Implement IOMMU subsystem accounting
config: arm64-randconfig-003-20260203 (https://download.01.org/0day-ci/archive/20260204/202602040025.dNDWTwwv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040025.dNDWTwwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040025.dNDWTwwv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iommu_free_pages
   >>> referenced by iommu.c
   >>>               arch/arm64/kvm/iommu.o:(__pkvm_free_iommu_hyp_memcache) in archive vmlinux.a
   >>> referenced by iommu.c
   >>>               arch/arm64/kvm/iommu.o:(__free_hyp_memcache) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: iommu_alloc_pages_node_sz
   >>> referenced by iommu.c
   >>>               arch/arm64/kvm/iommu.o:(__pkvm_topup_hyp_iommu) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
