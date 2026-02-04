Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78163242DE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770236198; cv=none; b=oiEIrmuKXA7avGt8EKYH01wk57VVLj5h0g1I+LesnwErDdLIvIfAR3HsPSCl8H6FNP7pj/QbMS+CtG+e1yw+rYjUF0pGssBAMWoNWARG0BQ7sEfaf+npQSHprDjbDXsqwaRaPsU+kFRkFLGJINWTTf9IXDkC+5kMfdPYDNy0pTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770236198; c=relaxed/simple;
	bh=12AuCJjZSMO7wbodmuH1bL/X9g2sgeNkuwFUCNz+SKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZS0X8ykAzEhAenS8KpC3o0m2iiZ0M4Qcjz2o6V6k5iBBGvkECNjFmfkKpBAWrKfLkOlBelqWz7A2uH0Cfp+SuDl4VHnDTWOysBxyDe1Zu5YfYp+yqGzbDZ97JNFM2MqPI2+7RKq9eyFVXDYjHDL0K73PlTHUzY6A2n2U9dI9gA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvBhALvB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvBhALvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770236197; x=1801772197;
  h=date:from:to:cc:subject:message-id;
  bh=12AuCJjZSMO7wbodmuH1bL/X9g2sgeNkuwFUCNz+SKQ=;
  b=YvBhALvBlniHDAMOSXI7RXDhXf8zr+sQAkAWGUGkNIJssvzluRLYG2vE
   xIpO9klqSAxT2aQomYpkMOd7E5XWiPKK/A5mWuyvk/snQFB3dt+R5ZBOx
   A+KWHPpK1oVv9/hHHCuK5nQm7a+E+LEXAJAGRDabIBELi65FNczFn4EVA
   ok8e11A5UHlQ7nE52xN+Wi+w1rtma5wrw/nNzzM/qK+t7ajjtfXxcWC1J
   jHDNQikrQdEa2m3Viik16fNHK2ODNBll9LPhTnduHynk7EAbb10s3MkAE
   agvhpwLkOEIHhCDguw81CRmBxohYcTflvFznTOkbM/jJCP5xnmzUXKOsD
   w==;
X-CSE-ConnectionGUID: pXqaRL1UQuulzGUEpmIk2Q==
X-CSE-MsgGUID: 57yA9MbxR/6383RIKlNWdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75285164"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="75285164"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 12:16:36 -0800
X-CSE-ConnectionGUID: 3hi/j1lDRfynCRs0jE/Y/g==
X-CSE-MsgGUID: NDXcfXw6QgioyS1Rm/PqfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214442038"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Feb 2026 12:16:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnjIe-00000000j9M-2GwW;
	Wed, 04 Feb 2026 20:16:32 +0000
Date: Thu, 05 Feb 2026 04:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for
 '__pviommu_selftest'
Message-ID: <202602050411.C9M9mwwz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8f60c9387a776ba5eb6f81394cac00de069250a9
commit: e516a71a453c76bb298c8a5f53027c7a943f1132 [4/4] ANDROID: drivers: iommu: pviommu: Add selftest
config: arm64-randconfig-002-20260205 (https://download.01.org/0day-ci/archive/20260205/202602050411.C9M9mwwz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050411.C9M9mwwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050411.C9M9mwwz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for '__pviommu_selftest' [-Wmissing-prototypes]
     461 | int __init __pviommu_selftest(void)
         |            ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
