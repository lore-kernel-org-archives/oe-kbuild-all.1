Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F57242D88
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714925; cv=none; b=S0zJjKM1VO2UuOBuwfis/ZAYT+TQm8qToVajF+R/RoysIT/dkMancDVuAN8LKncbR9muAtF2Mml2gR8qo3NRhTUIizbfc2a/8PeZPyuLcFt5A95+shcpkkXhFrSBZiXcfFY00uTfvBBKzHgCXNeGL3s1lBnc0iCnlP3zvSJ7BGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714925; c=relaxed/simple;
	bh=MTVZT7OPd6cpZpeKVgU0Me0dTdPoFySGDwJNCikvHIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5P5Jexo4E7IvqS1EQEPbdu8z5SKPwJSn0d0aSmH/AHFCCFIPw2yWAIQt1g6ccJjXaJX2aCb7bfPk7/J/+RUj/JKv47o+sIEyax6z8b/CFIoJGLu2QNwA+TwQNkTxjaRG/dCM64s7HTyU22kI9E/5OJiiU7KIMl6Cr28d+N/nXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyD7p4VD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyD7p4VD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778714923; x=1810250923;
  h=date:from:to:cc:subject:message-id;
  bh=MTVZT7OPd6cpZpeKVgU0Me0dTdPoFySGDwJNCikvHIY=;
  b=NyD7p4VDkQiltceqjWsTXMuwcsxssY/7UfxBV7etVzaym6/T+LDW3UrX
   iGQZ+CJhAqLfeXdEysaFKcxFvDuVxtejgU1Fw3U1nMbXH7S2fLLJT1T0c
   3IyAg+FxKHsDgB3RaQJCLCym6I9GJq6/IzIwRx/z0jWyjqVsaGF2E0Gby
   sKwSkO5u9dnBcuFQ9ICijFRM0IUnKVPleD12T1+pgFOL+jZameDNx89sr
   dRGZPVTeXIhxNcEpQGp2zPogWdpOqhqnxK95Wd8Pr7WdOXNjDihfFNU7S
   hiMi23eWOuqELwIm2qXZPslN8M6gllboGAmkszqpEQgFcbc90l0ACHkKn
   g==;
X-CSE-ConnectionGUID: z400QZG3Tb6rLa/MYlT/mg==
X-CSE-MsgGUID: M49dkd1PQVW89oC0cFZ3cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79367559"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79367559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 16:28:43 -0700
X-CSE-ConnectionGUID: EowOrGwuQ+6eo7j9gATCaQ==
X-CSE-MsgGUID: b1TYd2XlRgO43NxeOgnoyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="276315688"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2026 16:28:42 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNJ0J-000000005IF-0JOx;
	Wed, 13 May 2026 23:28:39 +0000
Date: Thu, 14 May 2026 07:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: sparse: sparse: symbol
 'kvm_iommu_refill' was not declared. Should it be static?
Message-ID: <202605140712.RAcxOZDr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5346453405bf12d7ed6003f45dd47b71744fe1be
commit: be3195fe7b08b042aca453d795a8d0afede4d2a4 [2/2] ANDROID: KVM: arm64: iommu: Use unified allocator interface
config: arm64-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140712.RAcxOZDr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140712.RAcxOZDr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140712.RAcxOZDr-lkp@intel.com/

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
