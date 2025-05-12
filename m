Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F7F79D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 23:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747093299; cv=none; b=MtdNOoCPXwHvKVBzgERmV7aIaEHK9c2xBcYFo/aLaainIOhpRlMwgxQnJqNKxUpKGSTzDBONI144Yc+A6TBw6krRCuR9RKFgVX3sp3WMUcn1FiCMpFyB6yf9OHQOhwK/Y1gKxdVvjy6YLNrxSlGPSQK90JpZ4XhkAnGehqg7g2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747093299; c=relaxed/simple;
	bh=o13VuwZM4U0qKc5YAu6gx6K6N65Alg9eQ7J/ybDKNDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INRNWWBP1SHQQCWlq8rRMZyZnoFSGlZeFywSm4XXDDfYUsWGCSiIcOalVkYfKBnCY8M3T96GAVniL3sjh03TdOESrzvJ0S57BqkMFDXKlQ8S6jyRMcVPPLMFeuCEuewGbZGIHyQkfVWqH7jXZwc40KPxb0zqGD4vDQ2iehabchs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ke/52vdb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ke/52vdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747093297; x=1778629297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o13VuwZM4U0qKc5YAu6gx6K6N65Alg9eQ7J/ybDKNDU=;
  b=ke/52vdb3tX4h0xCP3aWW5jj6T/Muf6DE4tDKmhuMzaIwRLlYnsZ03YF
   EPHvem06VcGOFf3IMwELEEzlndlPOvGjHPD2oqBZ+pGO0MZsruz6wxC5j
   ehdY71fX+YKNnR6i0/Q4YxlwhVqx4tzlJdzIw0D+OXdpaJLDZyxoe22BU
   S7gGzk+8cnfMlW/U38nglOx+4kJj0nn1wkg5P914sf61D700mU3o+D++b
   9VlB/Yl6EYhDvCv55DGft9+aP/F3eCCOxhag5uLusXcbtKbp7mDZg5O85
   rzPXXpLuiMNFdrt3+ddUS0qdflzDs/UQaYyWorm7Mcer1nskWzvZH39Ti
   g==;
X-CSE-ConnectionGUID: 1rmQIIivR9q/G7AL29eURg==
X-CSE-MsgGUID: 6ng77O2pQF6L2ku7it0FmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48843864"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="48843864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 16:41:36 -0700
X-CSE-ConnectionGUID: /YRKo9xSTMecwq6HvtwRgA==
X-CSE-MsgGUID: /81i98ZUSJGFT8h0xrag9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137237449"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 May 2025 16:41:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEcm4-000FWb-3B;
	Mon, 12 May 2025 23:41:32 +0000
Date: Tue, 13 May 2025 07:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for
 function '__pviommu_selftest'
Message-ID: <202505130753.ohriiZ7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c206f26b288d8d4a3f3c41866ee1b75d8657117f
commit: e516a71a453c76bb298c8a5f53027c7a943f1132 [1/1] ANDROID: drivers: iommu: pviommu: Add selftest
config: arm64-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130753.ohriiZ7B-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130753.ohriiZ7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130753.ohriiZ7B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/pkvm-pviommu.c:461:12: warning: no previous prototype for function '__pviommu_selftest' [-Wmissing-prototypes]
     461 | int __init __pviommu_selftest(void)
         |            ^
   drivers/iommu/pkvm-pviommu.c:461:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     461 | int __init __pviommu_selftest(void)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
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
