Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47DEEEB3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768123594; cv=none; b=BI3v5Yv9TwHRHNQ742pxTv/2Vb9pA9TliaaVcTY8nU7UGDoHdDcIpcijfjcNyDmfAb8BSGgxMtuRMZSlFoMNfsPhnAZiKahrTCadBGFn7yrilcqw51/uKg4K12ZkDrkJLS1ltXil+69qzJL2NeN6nk2NbXUzSvlNGSGZ+VRc8hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768123594; c=relaxed/simple;
	bh=IrxKKKkmv9Fpr59p1vUTtIZcflv9pIa73d6fGoRcWkA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=awbK4FiClhXBG3f8oVoyr/Ct5SVoQPMpSJaSZ8MTBdw3roex0/SvaZRS9V1HeH2a//31iLAGIl83X/7JY2P4SgnzhBzU7uKpDZzkI09H89I855tkya2KQ2AkQ31EWeEbQxb9yCsDaD00XG6TPJdP5ZBTfQGlESJb1trQYhdh56g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRUFqMq+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRUFqMq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768123592; x=1799659592;
  h=date:from:to:cc:subject:message-id;
  bh=IrxKKKkmv9Fpr59p1vUTtIZcflv9pIa73d6fGoRcWkA=;
  b=lRUFqMq+bvV86QU/Cdmhie+GcsQq6GQQXOnWXlBQoLGNHsxRobyyIBpW
   a4wAzODDURDhNCE8m90QQRg3PqrudgOGMAUG7k51PMIZ973fHJ2nGSAvA
   W/zaWJMm57m+Zne7aWQZQHCD3Q2L7VyCkqpTAcZ9AfirQSP2pNps77G+9
   A89pXsq0ff0qf1GeA5GYapQ+oGOV6EiP0XaiLRVu5dbT+mbJu7l2hYZxT
   m63D/iSpQG+ewvUDCXHFKwPbKxN1dE4wJBaHis7bZi7OHT9zMjeGOJKYn
   eO2hBgHHrc+ZEScccLL1WHWWHQJu9Pwq0b/Lx3H4EXWMgkRKp+VnVLP5u
   A==;
X-CSE-ConnectionGUID: uHoPdfMxQ8eAaHqyPo24Dw==
X-CSE-MsgGUID: TP4Kjc04QiKduqu6ROB19A==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69506812"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="69506812"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 01:26:31 -0800
X-CSE-ConnectionGUID: LcMuzGg5Sk61lANUDWEKmw==
X-CSE-MsgGUID: FzjG2XtNSGuDcxJqQfxnUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="208367234"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2026 01:26:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veriN-000000009rQ-2OPE;
	Sun, 11 Jan 2026 09:26:27 +0000
Date: Sun, 11 Jan 2026 17:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/iommu/pkvm-pviommu.c:461:12: sparse: sparse: symbol
 '__pviommu_selftest' was not declared. Should it be static?
Message-ID: <202601111738.MLgCfznJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f0901290e6c40511483b1976cf7abae6d0623b08
commit: e516a71a453c76bb298c8a5f53027c7a943f1132 [2/2] ANDROID: drivers: iommu: pviommu: Add selftest
config: arm64-randconfig-r123-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111738.MLgCfznJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111738.MLgCfznJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111738.MLgCfznJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/pkvm-pviommu.c:461:12: sparse: sparse: symbol '__pviommu_selftest' was not declared. Should it be static?

vim +/__pviommu_selftest +461 drivers/iommu/pkvm-pviommu.c

   458	
   459	#if IS_ENABLED(CONFIG_PKVM_PVIOMMU_SELFTEST) && !defined(MODULE)
   460	/* Mainly test iova_to_phys and not hypervisor interface. */
 > 461	int __init __pviommu_selftest(void)
   462	{
   463		struct pviommu_domain domain;
   464	
   465		pr_info("pviommu selftest starting\n");
   466	
   467		mt_init(&domain.mappings);
   468	
   469		pviommu_domain_insert_map(&domain, 0x10000, 0xFEFFF, 0xE0000, GFP_KERNEL);
   470		pviommu_domain_insert_map(&domain, 0xFFF0000, 0x1EDBFFFF, 0xDEAD0000, GFP_KERNEL);
   471		ASSERT(pviommu_domain_find(&domain, 0x10000) == 0xE0000);
   472		ASSERT(pviommu_domain_find(&domain, 0x10F00) == 0xE0F00);
   473		ASSERT(pviommu_domain_find(&domain, 0x1EDBFFFF) == 0xED89FFFF);
   474		ASSERT(pviommu_domain_find(&domain, 0x10000000) == 0xDEAE0000);
   475		ASSERT(pviommu_domain_find(&domain, 0x1FF000) == 0);
   476		pviommu_domain_remove_map(&domain, 0x12000, 0x19FFF);
   477		ASSERT(pviommu_domain_find(&domain, 0x11000) == 0xE1000);
   478		ASSERT(pviommu_domain_find(&domain, 0x1B000) == 0xEB000);
   479		ASSERT(pviommu_domain_find(&domain, 0x14000) == 0);
   480	
   481		pviommu_domain_insert_map(&domain, 0xC00000, 0xCFFFFF, 0xABCD000, GFP_KERNEL);
   482		pviommu_domain_insert_map(&domain, 0xD00000, 0xDFFFFF, 0x1000, GFP_KERNEL);
   483		pviommu_domain_insert_map(&domain, 0xE00000, 0xEFFFFF, 0xC0FE00000, GFP_KERNEL);
   484		ASSERT(pviommu_domain_find(&domain, 0xD00000) == 0x1000);
   485		pviommu_domain_remove_map(&domain, 0xC50000, 0xE5FFFF);
   486		ASSERT(pviommu_domain_find(&domain, 0xC50000) == 0);
   487		ASSERT(pviommu_domain_find(&domain, 0xD10000) == 0);
   488		ASSERT(pviommu_domain_find(&domain, 0xE60000) == 0xC0FE60000);
   489		ASSERT(pviommu_domain_find(&domain, 0xC10000) == 0xABDD000);
   490	
   491		mtree_destroy(&domain.mappings);
   492		return 0;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
