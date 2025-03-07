Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0812A18DB15
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 04:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323275; cv=none; b=sYafRUM83S7pt8GvHqtYAsgkyTPkMfDA04/CY9V3WgpxOxjlJSqSUeZNTBEWZNIDr9D8Xxl1JI7yONF+JEgNmR184nXg46KPQiSBRdSIYVgvbymWi8GoYDjWNGwLFyEplWtPV3KQJGGgbYDAZjTyt8VzQHJ21ikgf7M/GOHx+3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323275; c=relaxed/simple;
	bh=ZDKZa9psjvyJS+4/jq/CE2MGPAMzCLTTtrlP0q1neXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUnFjJp+X7nLiw1DwcYZKcXPCIUl7gI5FGsmL5zXaP+5G+QuYnimX40D/YUeNGomFRSEhKluS0uGHNu15Ceb0sGc8O+CzvEkZuoaCJtLCfPJ6ZlJEYhjO/05dxRAQg3FyIBxbzV2WiwufkHV2oh9QsfcUKWNsUqQv1lPnk7qIhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlCr94rJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlCr94rJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741323273; x=1772859273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZDKZa9psjvyJS+4/jq/CE2MGPAMzCLTTtrlP0q1neXM=;
  b=VlCr94rJMKDl1JjEQZqd6aYLOrbRVJxye22QO8fEflH8OpM25Fg+qVPT
   SwRuu35OJwf6Yqa4bsONdmExRIGxwEIxGLiPONFaY38yd7uqwCeJ/6Hi6
   OmwDabKL1aLQ6Th0XiaQjhMS9RR1XqqDu/wIZ5Fl1YvxFeQT43zo1DVVT
   kQhzkHCgAaG9PzPhKX7j3MVGebBsy6BoWSH1qgtrkGDAAlKbogsDPEjER
   jNDEb4Jj0yqcLntkr59HSgwbguYEJFYKmd4yCqRQwGV5CLMPhv3Rb2ApZ
   wHvim8Wthsrl/2rVLP0PNDi4sqCZWqRfqryz7oz3dXyUWRZg5lWTKQIAj
   g==;
X-CSE-ConnectionGUID: nxItrVI9T8ChKtR20+yZCA==
X-CSE-MsgGUID: qPe6BC27TDmvHremd3abFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42503869"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="42503869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 20:54:32 -0800
X-CSE-ConnectionGUID: luHWSvm4T+ODIsKdJ6QRYg==
X-CSE-MsgGUID: ttTSUrsuQXeKUEzLqNkxyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124253761"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2025 20:54:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqPjB-000OXC-0q;
	Fri, 07 Mar 2025 04:54:29 +0000
Date: Fri, 7 Mar 2025 12:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:77:13: sparse: sparse:
 symbol '__topup_virt_to_phys' was not declared. Should it be static?
Message-ID: <202503071251.7qlaCVoh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   43c2ae7ca209a795366bd886aa15a4a272abdd2c
commit: d35c7ab234a86fb5a529297c4c340daf8081d6e9 [2/2] ANDROID: iommu/arm-smmu-v3-kvm: CMA donations to the hypervisor
config: arm64-randconfig-r122-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071251.7qlaCVoh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250307/202503071251.7qlaCVoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071251.7qlaCVoh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:77:13: sparse: sparse: symbol '__topup_virt_to_phys' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:964:5: sparse: sparse: symbol 'kvm_arm_smmu_suspend' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:974:5: sparse: sparse: symbol 'kvm_arm_smmu_resume' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1024:5: sparse: sparse: symbol 'smmu_put_device' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1030:5: sparse: sparse: symbol 'smmu_unregister_smmu' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1159:15: sparse: sparse: symbol 'kvm_arm_smmu_v3_id' was not declared. Should it be static?
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1167:25: sparse: sparse: symbol 'kvm_smmu_v3_ops' was not declared. Should it be static?

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
