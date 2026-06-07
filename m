Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F71A08AF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jun 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780809918; cv=none; b=kLCMm3uKvYDTj6m3OmICM+dY4EVoh6abXzKODNQac4SKIswPBsyCKIyARV9aK6PpHw/hGZgzAzkQdxfZew/J2KiI7f6yL2fJY2I9B0XgPvhxwqJ4HcLBQz9sV/UhouTMvUF5bj5N9lVDdzrA0ABmWPS/gALszBaXKDROWqIM1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780809918; c=relaxed/simple;
	bh=4cTJUuOfeBFzLKB3C9APZxC3Z+wKioGat9GALu9y1LA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ov9sYq4Yln/zJ4GXA+vOKtvtSy9k29yHWu5Kmo+Cz9ifXBNONJva0DSOhykKLfX16HnpoZllbohT74fYH7Vz8QyXU+xoLyAi93XlGNJNDwwrozWIY0UYS5g5GK85xtetV04A714Mv8jhlUcg0Xq8XWZqstv34ovTnu4HpCElqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMJajq27; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMJajq27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780809916; x=1812345916;
  h=date:from:to:cc:subject:message-id;
  bh=4cTJUuOfeBFzLKB3C9APZxC3Z+wKioGat9GALu9y1LA=;
  b=EMJajq27NGbsFxpQaPRC/Pg8Xky0/BuFAHYK0ocG6ygtHPzpGXS/Ta1A
   5bxmmu6QXmjxlJDkLeQUryiKgWHem5QyopMtwf7aqMLo1hKFQtWeWhEpJ
   iWSWGSXSnDFMJbfgpjuKitaxSbdNS16QcDhkg9fobwI79CR5LEkYoQAjk
   SPZRnMVxg307eUfo/a+tWWm7NztSdVjIDqb1MgrlGxoonivTT42IH1sXj
   NPIhaFEshrXxG5YUDOX4aDPASTmf6zlwK3xx3GsjNQWP5IZJqu2rk3Lca
   SmnzkeWCEe/TKBWotCOC6QQI2XQ3UIr3J1SCd9tvvYmdtMIG0UV9s6jAE
   Q==;
X-CSE-ConnectionGUID: lkDoV4N+SX+JXIOjyfomTg==
X-CSE-MsgGUID: lVEsVyqHQ9aIGefNGGxK4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="85468163"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="85468163"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 22:25:15 -0700
X-CSE-ConnectionGUID: ExkMd5XZSiSHWrJBxCBHvA==
X-CSE-MsgGUID: UUAOA2hVQZqVfP1+gEOFIg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jun 2026 22:25:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW60V-00000000HdS-1VFS;
	Sun, 07 Jun 2026 05:25:11 +0000
Date: Sun, 07 Jun 2026 13:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/iommu/pkvm-pviommu.c:461:12: sparse: sparse: symbol
 '__pviommu_selftest' was not declared. Should it be static?
Message-ID: <202606071304.Rf8BRseN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   468e09dd6f52610d73a09cbbb28a2e7d4b940431
commit: e516a71a453c76bb298c8a5f53027c7a943f1132 [2/2] ANDROID: drivers: iommu: pviommu: Add selftest
config: arm64-randconfig-r113-20260607 (https://download.01.org/0day-ci/archive/20260607/202606071304.Rf8BRseN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606071304.Rf8BRseN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606071304.Rf8BRseN-lkp@intel.com/

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
