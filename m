Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174724;
	b=03ITWSp83RVuZRkkiDKWUlcxWPyTtU3OwV82QKpag4YfG2lEoDHDj5qLlL1U2EmPCaKD
	 4ijb9hXGZPAXqK5L9uCWJKeT4IfjrFEhY1LGuC5NrAly2zQ/4II2flrGRx55szt8rEZov
	 1ZQIqdr8x245d0EtJn3+/xHnY7gXZqw6X7OgAByxEM9yu+1UAAdYf3x2ygRIvOvnrLQha
	 fBr7qF4Vy6GHUUa/tmi3vR0oG89TKInB9qee3mWKAsX3ui83ajo7sseUPYvSGAH31qeFV
	 JhCkVUIX1HCAXyx3/rfGYr3I7frDSv6XhRyNbXC+hzXIpcZkC1eSvG9k4O7iYHMbyGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174724;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GEv6zpYJKNhmX0ty6ytCsUT9IQ3Un8FkVcCrz5+LSAQ=;
	b=Cf7pT0rJq2dsV8Tgb1f3nAYxnck9Q3IQhW9WRoTbJkKrU3GqfqWG8A/hCUNgqN0OM8XH
	 yfl2uGmMhbCFcH8FCW/IwNZ1f2PArivfr+o0tWgPLmhUXmsAhSNRJSIL1jkRmhpIkfjFB
	 HDEoQJV/DIFA479Lz9gegjpogvLaXAtsdZ9Xn/4Z9d1vfmRIJQJbxgy2OgdV5oPtBf9tQ
	 QGLucmN0/QlYL5b0Ld2LmNEeAHh2/ykYPP84jmrPgfj7Wid1Qxt176w12d6XAzZbcT1G1
	 7VURwQvPtzrVGTr6FRPMTpuP52ugOxg+eBTwKOCYdd5j4ehpH0UkMLZvVHnOiZTijcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H46uEi9h;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0D606A330
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 11:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C0D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H46uEi9h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795174724; x=1826710724;
  h=date:from:to:cc:subject:message-id;
  bh=t9W6/DQAEH71HeN0LIJba5jHfWwd7x3tP+VbTPE/cs8=;
  b=H46uEi9h46DbdJtqvIf2aZAAlqqKgFjsz+Hk/8U2e1TWuqrl5oumoAPx
   Sv9ib9d2RNsViw62YAQidCOqIgHgDoFlczJ+OfbDD6cf8eXQzn9/SZO9D
   lNovld2T+b90rSzDLwZeFXraU9/vLN62u/fPZt4lYK1+L2ZjSZfjzencZ
   tWn0tZ3YGcfT2dnsVyMtUP2A5lDaHyCR9u2UPNjZqE8q3XiqdQoFvk0o/
   Q1GYmB5j0wWeZg3eKgPVPsbP6n25R7zizpba8m3zeAq+z0i/l9xfK/1qC
   Uw0IL0Ag4c/zlJcItgNul7nfnEHhmZh2dce8blpfoD0Jry5Ogkj6GDcpH
   A==;
X-CSE-ConnectionGUID: pXsu6gznQWayl0Z2KyTSKQ==
X-CSE-MsgGUID: mB9Q8HVyQcGh8pfECj1ueA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4083361"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4083361"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:38:43 -0800
X-CSE-ConnectionGUID: RP039PkJT1KwJ54y3rdp/A==
X-CSE-MsgGUID: 9WzWK+vcQbO1kE6ABUuLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11043006"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2026 03:38:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUMwx-0000000041t-1hjR;
	Fri, 20 Nov 2026 11:38:39 +0000
Date: Fri, 20 Nov 2026 12:38:36 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 159/159]
 drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for
 function '__pviommu_selftest'
Message-ID: <20261120123209.Lp8lAlsk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   2a67ba2424dff807d035f8a1484b68a365c633e6
commit: e516a71a453c76bb298c8a5f53027c7a943f1132 [159/159] ANDROID: drivers: iommu: pviommu: Add selftest
config: arm64-randconfig-r2108-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120123209.Lp8lAlsk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120123209.Lp8lAlsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120123209.Lp8lAlsk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:373:9: note: previous definition is here
     373 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for function '__pviommu_selftest' [-Wmissing-prototypes]
     461 | int __init __pviommu_selftest(void)
         |            ^
   drivers/iommu/pkvm-pviommu.c:461:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     461 | int __init __pviommu_selftest(void)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


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
