Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D471E7C38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 23:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753571017; cv=none; b=LZ7RqPNtGHt/Ayb6augsbMbv5PyRAyR5Oy7nLt92/7L3cVvJWGj3eAp6Iyc7U7YyYk7w5CBEzr5P4qUT+i7lurBYfo0oRA6z+exfwA+fFfQhqNouRlR+/FQLboD8iT8HLncTTsaDB57BRRveGgjTPur0W/fGm7yA4VZFBi/v4w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753571017; c=relaxed/simple;
	bh=jHnqzh2Qx3ZRStrhG1F4fqc5vAdEdySEae0gvo0ZDpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VmXLcWh7+FPTqH+78wjSscTV9KayKGu/l+/zSPySLatGKg5MWpbnHL9xqJOhPvAHjBqOP3a68kcjZ97WJLcepedk1eajeZJsUq1HM1mzek4Y1gmgyrwG7P6zDD+9hg3k588/o5nzbr+ArghUcONtURzVV6gOBcA1KTjotvNbAK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D94rQdfD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D94rQdfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753571015; x=1785107015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jHnqzh2Qx3ZRStrhG1F4fqc5vAdEdySEae0gvo0ZDpU=;
  b=D94rQdfDLs6o/xv+xo4nzSL7v0ZOM4en0UP9rsUNzL4JSpeRyoikwCda
   dwUt/FKWtc6yYXANyV4MbQJnPA7JC2fRrhYW/S83LPDHGcmMQsBDRlk8C
   9PPaLSxmDHSLNKeIvQUAanioCq2zRuahWpFEC9hap8SYA5kaMT8i5Dz0V
   3kKrSvcH9AnziCqSyngv15YoKpvDqw5n/4Z0cfogYTAgKiiWwfTo7f4DP
   2VI5vIsTsE4kJ2oWdngdoUljv+bnNLfyOOQMQf/GvWQeMjarQwB8pL5yi
   pY3y6oWa1yKxrYqWJCVL9ejLSvxt1E++MgRdBJMSWscL5JFidF9jiwkYU
   w==;
X-CSE-ConnectionGUID: QXMGGCdMQ+2yEcnk1DVjyA==
X-CSE-MsgGUID: 8FMCEg0hQruOaOGWfyg3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66131014"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66131014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 16:03:35 -0700
X-CSE-ConnectionGUID: NNfcEQ+GRUS0wXsFFR8rNg==
X-CSE-MsgGUID: ipCZDbGzSjupidBozBzyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192718070"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2025 16:03:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufnvP-000MKR-0c;
	Sat, 26 Jul 2025 23:03:31 +0000
Date: Sun, 27 Jul 2025 07:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for
 '__pviommu_selftest'
Message-ID: <202507270640.VpQIXidx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e9bbc29c066a63a4c4dd6e328c43e04f61be700e
commit: e516a71a453c76bb298c8a5f53027c7a943f1132 [2/2] ANDROID: drivers: iommu: pviommu: Add selftest
config: arm64-randconfig-001-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270640.VpQIXidx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270640.VpQIXidx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270640.VpQIXidx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for '__pviommu_selftest' [-Wmissing-prototypes]
     461 | int __init __pviommu_selftest(void)
         |            ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
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
