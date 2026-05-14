Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8853921DF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793834; cv=none; b=XMdn9lSUoHd415AElfWlA3BCYWLE+UaRaPFqKeuVsa/ve68rYevld+j481RQp/ngjrRbfWITM9/c7ruSR5HSFo5TN80aB17B3ZwYqsCeUNNYfxxivs3R/HfeIe3IDztA43GQtwkbvSGAGEMEb4YhWEht5zXD1NdM2fNvBYrUAxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793834; c=relaxed/simple;
	bh=jJrZS7Dy/5reXKn16FDWG5OSi4pcTvqJ4XKOrasHuYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNgIE8ogWBpn+Hg9ruQgSO0rbFsDP5aYQhZUm+nqOJrU1VdO4rR2HDXIjhUroVCZGQYXOJAqw+asHi3VEJSENTeEZUemITVal9YU2QDJ2Oh7EjMX+S7gayvQ7Q5R8/nWbAZTcwmHIwdxOU/lckHe/ZQR2s3zSnTMRyTl84PaMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5UNRU82; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5UNRU82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793832; x=1810329832;
  h=date:from:to:cc:subject:message-id;
  bh=jJrZS7Dy/5reXKn16FDWG5OSi4pcTvqJ4XKOrasHuYA=;
  b=D5UNRU82SFqpHf9m85ZC8dfWBlVOPuD38yWl2Q1GZtUhMATnF4xuqftN
   LfAc3z48dUnP6pRHhBKAx3vsxZdZz4F6Afsi5xBGFekwL2RapANy3T2y6
   UHuAiYsSXNoi9uZMzSZ8InqtOL21gcVJZX5d3o1aHuXEBnmqpVrXVi7DK
   r/HIep/8BgH727l81PLHkCXpVnHv1LoCDEKor8EITdAe1Ux/JO0u+9mUi
   jVYaLN9fx4EoPebaQ4YdZhErpbnRoIiIqLYC9bkLiqm28+UPkU37YfHEb
   gyYazmT2aGtAbQ6SyZoSqKwfpOJH8+KdBkXeShiotkKFyvsIz6TYrLH2y
   w==;
X-CSE-ConnectionGUID: fZZh3xWlRUm3gI6cuJw/7w==
X-CSE-MsgGUID: EOS6TQ/JSoGtUIkul6QGSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603398"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603398"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:52 -0700
X-CSE-ConnectionGUID: yhfJHs/iQVOpb6HJKmRLtw==
X-CSE-MsgGUID: Y/6oFPOvRz+EFf2+X43DuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458948"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:50 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX2-0000000001D-2290;
	Thu, 14 May 2026 21:23:48 +0000
Date: Fri, 15 May 2026 04:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: sparse: sparse: symbol
 'kvm_iommu_refill' was not declared. Should it be static?
Message-ID: <202605150409.YEebTGdM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5346453405bf12d7ed6003f45dd47b71744fe1be
commit: be3195fe7b08b042aca453d795a8d0afede4d2a4 [2/2] ANDROID: KVM: arm64: iommu: Use unified allocator interface
config: arm64-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150409.YEebTGdM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150409.YEebTGdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150409.YEebTGdM-lkp@intel.com/

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
