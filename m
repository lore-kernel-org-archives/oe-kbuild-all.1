Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE482EC5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730521880; cv=none; b=SLwpPWlb8ND6CPnBhqXWf46O8/5ihO1F243M5bCKdMY475+wHmVazd9e5a/cj5k1tUAocZ1bf8lp/M3xxII6Rho8pWHbsDI3h4z4LbPAosW5yLQ973CG76DhJMc2oabew9RyRVTHoVTZWBLDScoEuYCeqZqCHmYPAoaamKDuBDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730521880; c=relaxed/simple;
	bh=R8FyDv5rv8rJtgbYzUd8A0iaxqWlGCbWLy7vw3Jb3WA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fASzUqmX2Hh+5i4V86WkJcuTuxcEh4rWNkzP4pn+OKAqEm+8dcOvZZjmhXXtSEIfVtkwtCxNWBvfWxvchR8KUsHcMsC4K/rBBmUNBb9l/zwEDdk/fPbgHSofrLOy2qPCughcB6wZU6iManrsydYE2RdL4YlMcRqxGq3ZBHOFWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8bLwUZX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8bLwUZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730521878; x=1762057878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8FyDv5rv8rJtgbYzUd8A0iaxqWlGCbWLy7vw3Jb3WA=;
  b=Z8bLwUZXSOrziTODqK/nEg4EbNKHfXdcxkjq2/bXkPK681/C0gmLMgti
   zXIo4ktmsTN9fd/svBlIyF1ATt+pSUWL7edIP1WJEnIr4w3wy8bHwxZi/
   6xY6hsWK/+JhRFVCrb3LGzOFTIboVv0qESkPFves93aaUOyGIC3XCwKkV
   f1I5fwRl/c46qSmMWgPSQ3/Aq7MJ5nRFda0COuD1uUwCAHpXzjwHaaIDH
   HnKJcrE3sAOO3vQ6ww+juQOZ0kJ6PIvsH+ehy7AYGrp8/sbaGvIBcPZKW
   /6gP7+wBq5JwEX5QDRJ0qAjMVORpo7lI+/8lN3b3c4bzzvfQFSeHjY/zK
   A==;
X-CSE-ConnectionGUID: oMaMhOocQGi6f5j9EGZykw==
X-CSE-MsgGUID: 8bm5yZLcT5K6SNx/zP/NGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="34080906"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="34080906"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 21:31:16 -0700
X-CSE-ConnectionGUID: 7IPtyrvURpa8UB9iPwSfrw==
X-CSE-MsgGUID: ec1I+s6OTpKN1ttdNLpfhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87912511"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 21:31:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t75n6-000iPd-37;
	Sat, 02 Nov 2024 04:31:12 +0000
Date: Sat, 2 Nov 2024 12:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241101 2/57]
 fork.c:(.text+0xf88): multiple definition of
 `iommu_paging_domain_alloc_flags';
 arch/arm/mm/dma-mapping.o:dma-mapping.c:(.text+0x7ec): first defined here
Message-ID: <202411021229.6cL0SsTR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241101
head:   96a6bacf52e9104ff2ad3f9fd356325a88efe276
commit: da9c8ba14267921a8fdce17e19d349faed4405af [2/57] iommu: Introduce iommu_paging_domain_alloc_flags()
config: arm-sama7_defconfig (https://download.01.org/0day-ci/archive/20241102/202411021229.6cL0SsTR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021229.6cL0SsTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021229.6cL0SsTR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/fork.o: in function `iommu_paging_domain_alloc_flags':
>> fork.c:(.text+0xf88): multiple definition of `iommu_paging_domain_alloc_flags'; arch/arm/mm/dma-mapping.o:dma-mapping.c:(.text+0x7ec): first defined here
   arm-linux-gnueabi-ld: mm/init-mm.o: in function `iommu_paging_domain_alloc_flags':
   init-mm.c:(.text+0x0): multiple definition of `iommu_paging_domain_alloc_flags'; arch/arm/mm/dma-mapping.o:dma-mapping.c:(.text+0x7ec): first defined here
   arm-linux-gnueabi-ld: drivers/base/platform.o: in function `iommu_paging_domain_alloc_flags':
   platform.c:(.text+0x1414): multiple definition of `iommu_paging_domain_alloc_flags'; arch/arm/mm/dma-mapping.o:dma-mapping.c:(.text+0x7ec): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
