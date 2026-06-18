Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138C33120C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762908; cv=none; b=Y64RPnd4U14Lc7rvG5wnqVN8wOw67Pm8UKTutnraLlamA35YOiLVgAf91NAK0/bEYw8WgUtiOrD2po7iC0cF4e2UO23ypeIF6kpRmf0RcYhisDR04mB7KVuvvXzUNYsqi3vUNoHJqmwLGU5Qz+ApTLKsD1YReZBlM2z+3l7qPkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762908; c=relaxed/simple;
	bh=wPDPTMH3RLp6eO/I2qdyzQ36kW1FBwJOSXh8A4j0W6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aB3DieFyaS8qp1T3m6KxQEeb/ixNn4jyg724KTDDbowWywz8L53cXgh3FuFM2V/dtWdD2NyHsc2awnVQ2UCyGHfzbUN5l4PfklFgX2ew6nok9ORlIK6eWtMYU5qf4Pld8KiXdz1OYAtWAVSToTQmGfUjOlN4ZGkFTszClekzR8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErpyVQkV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErpyVQkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781762907; x=1813298907;
  h=date:from:to:cc:subject:message-id;
  bh=wPDPTMH3RLp6eO/I2qdyzQ36kW1FBwJOSXh8A4j0W6g=;
  b=ErpyVQkVk7tcGznNB8/wzOfcWwxPENId7gHzoYDclfsqUNfCfj03WFjl
   DNIYJAVtR72W2mBhn+x3x098BJoJxIWbw28ydmZO64lvNUOHMmzR1gI4n
   0NH+R+mz1irY7pj4nmeqKZ0VZa6KB6oyXpDB/6huZI5sbpo53Kmxkr6Yj
   sAle2JksNF+jQVgoT1g4++DnfLU33lw0UMz+o4Eqwo5n+kVzSEG433q1w
   1V7JSxLRQRruFdAU9v4zf+9ofjVrSWOdqCCFW+AhfS9JhSkCJVyHXGb2J
   QJTc79gupAhWbQI0R1waJNgfzjliTW0Ke0rJBcVRl6IZRDJTdz7SmV6Id
   A==;
X-CSE-ConnectionGUID: laPkrApcQZOW4e/qeedP2A==
X-CSE-MsgGUID: KkMgmBqxTOK+ydxkg3HbWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82681351"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82681351"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:08:25 -0700
X-CSE-ConnectionGUID: fqToUVqlTY2TEXojI2F2nA==
X-CSE-MsgGUID: cMORzB4PRPyHEK2xXchnzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="252172601"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jun 2026 23:08:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5vI-00000000VHw-3W7H;
	Thu, 18 Jun 2026 06:08:20 +0000
Date: Thu, 18 Jun 2026 14:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 2/2]
 drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for
 '__pviommu_selftest'
Message-ID: <202606181359.vLcV5y9h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   bc0d575e7c2d11165b91b071084bcd44a4f212e6
commit: e516a71a453c76bb298c8a5f53027c7a943f1132 [2/2] ANDROID: drivers: iommu: pviommu: Add selftest
config: arm64-randconfig-001-20260618 (https://download.01.org/0day-ci/archive/20260618/202606181359.vLcV5y9h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181359.vLcV5y9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181359.vLcV5y9h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for '__pviommu_selftest' [-Wmissing-prototypes]
     461 | int __init __pviommu_selftest(void)
         |            ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
