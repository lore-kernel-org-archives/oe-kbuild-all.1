Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F0200DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 06:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138655; cv=none; b=bf04Qmtwc66+QO89qWeuDSrutBLycZ+geGiL1f9b/lUzEhfI94seg1/age3ddSN/tXFYU2mVtLgptigMWK3WAYagDKVYYcbMBwwQxFYQKdcuGSAdnVRPOQbrXg4KOzYkNFxaaS7uY/q8FVBBe1ZR07iEPp66Q62mdyAo/5twBZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138655; c=relaxed/simple;
	bh=B63u1lYrgDrbzglwjAgfVZf6gvaiexHcWU1s6eIHfYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c18v+04kE/cxFOlyMh6+CNdJnzCtHNOIQecbYwR17wYDW6KCjT7nsIM1ht5gsYTccKKuUPwjCpSw82HgLHLIxi3qSKOGwzrtycOO3fiG6KPEjzIpRbFb7eDY2s7jG1CGtugX4hFE/LC7s0LueqM81CRbDjPFwxQNMBBHGr4FRpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9JwFnKp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9JwFnKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717138654; x=1748674654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B63u1lYrgDrbzglwjAgfVZf6gvaiexHcWU1s6eIHfYE=;
  b=J9JwFnKpxelMWMNWGLzJfcg4SEec5WjhkpVqvyr8JmhIf7W9aruvZHeP
   1X/Emco2/fQFRbx/bN/VcLVh6x70cXFdTiYiH/bgo1yDumsoc14CaKU96
   2OAR3Q+GYA23JayOKESCjTaWiIcM86qozrSqQ9J2idjwl5SaPi2yk+IwN
   OubEc3l5ZtnrOu9VP4sDFqrZp1DIXQM+hZv0bhBPMZoj3yIRvSsTsBNH8
   pGMhcLPToVBuOwm+1ERrzOYsCQQVN2iuG+V7g7+iyxR8JN/9D3XHFC291
   vdIls+cUvFkw8JN2Xef3NVQA6H5S8hZ30YwFGXPUxHt1BPXdw2KKtJqw4
   A==;
X-CSE-ConnectionGUID: JPbJ+a9AQsyx0DNnSWA/4w==
X-CSE-MsgGUID: uw8efsM4TIWuwGRJww5X6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17498780"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="17498780"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 23:57:33 -0700
X-CSE-ConnectionGUID: tvL9ai0RSDm4l83qYsEyfQ==
X-CSE-MsgGUID: x0JYnwf/QjGnws2/uBkTdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36173100"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2024 23:57:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCwCf-000GdN-1o;
	Fri, 31 May 2024 06:57:29 +0000
Date: Fri, 31 May 2024 14:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9623/9796]
 arch/x86/kernel/zhaoxin_kh40000.c:322:26: sparse: sparse: symbol
 'kh40000_dma_iommu_ops' was not declared. Should it be static?
Message-ID: <202405311417.Uc6n3wMh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a4c1bb6d259c5f07d1cf526fcb8c10d67c43a825
commit: ef20808db09987137fba30519fb94a6b12b63ee7 [9623/9796] Add kh40000_iommu_dma_ops for KH-40000 platform
config: x86_64-randconfig-123-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311417.Uc6n3wMh-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311417.Uc6n3wMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311417.Uc6n3wMh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/zhaoxin_kh40000.c:35:15: sparse: sparse: symbol 'zhaoxin_patch_code' was not declared. Should it be static?
>> arch/x86/kernel/zhaoxin_kh40000.c:322:26: sparse: sparse: symbol 'kh40000_dma_iommu_ops' was not declared. Should it be static?

vim +/kh40000_dma_iommu_ops +322 arch/x86/kernel/zhaoxin_kh40000.c

   321	
 > 322	const struct dma_map_ops kh40000_dma_iommu_ops = {
   323		.flags			= DMA_F_PCI_P2PDMA_SUPPORTED,
   324		.alloc			= kh40000_iommu_dma_alloc,
   325		.free			= kh40000_iommu_dma_free,
   326		.unmap_page		= kh40000_iommu_dma_unmap_page,
   327		.alloc_pages		= kh40000_dma_common_alloc_pages,
   328		.free_pages		= kh40000_dma_common_free_pages,
   329		.alloc_noncontiguous	= kh40000_iommu_dma_alloc_noncontiguous,
   330		.free_noncontiguous	= kh40000_iommu_dma_free_noncontiguous,
   331		.mmap			= kh40000_iommu_dma_mmap,
   332		.get_sgtable		= kh40000_iommu_dma_get_sgtable,
   333		.map_page		= kh40000_iommu_dma_map_page,
   334		.map_sg			= kh40000_iommu_dma_map_sg,
   335		.unmap_sg		= kh40000_iommu_dma_unmap_sg,
   336		.sync_single_for_cpu	= kh40000_iommu_dma_sync_single_for_cpu,
   337		.sync_single_for_device	= kh40000_iommu_dma_sync_single_for_device,
   338		.sync_sg_for_cpu	= kh40000_iommu_dma_sync_sg_for_cpu,
   339		.sync_sg_for_device	= kh40000_iommu_dma_sync_sg_for_device,
   340		.map_resource		= kh40000_iommu_dma_map_resource,
   341		.unmap_resource		= kh40000_iommu_dma_unmap_resource,
   342		.get_merge_boundary	= kh40000_iommu_dma_get_merge_boundary,
   343		.opt_mapping_size	= kh40000_iommu_dma_opt_mapping_size,
   344	};
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
