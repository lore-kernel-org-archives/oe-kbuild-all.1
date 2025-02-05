Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1AD22AE59
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751305; cv=none; b=imvNrMuMv6GoGGpdj27qpH1vteUky2ejm3cAfMmIrqYK+95ubLPO93Eg7Dp2ndHUdJNrSYxVsiX8f8xlMoqI/ndc03R8HOz8v7n9Exy/trdCs6nQNi2wvATDWQ3b0yRjt51b95mIQjPBz2b+jj1vaTC89JZ708vXn0vs+ENdkzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751305; c=relaxed/simple;
	bh=rxLMQlQBZdivfT3FD1/fnlsV1eigCclp/9C5NFYmIjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jPaBNu+UxQ7VDKdxsRRJoO63GpTqcKxhdPj1WzFbMLF6Lr3eEpsGakaECVCN7sXgbr1nefYHQaY1QwcapG6JOz8xL7T50waBMhRp1Ou6q10SNlKDBHFpuLt7GDiTRzd5fDkz8UelROFcqXdoIvLWsM2HmTJToTRWGlb/mWhBkrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mev/oFar; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mev/oFar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738751304; x=1770287304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rxLMQlQBZdivfT3FD1/fnlsV1eigCclp/9C5NFYmIjM=;
  b=Mev/oFarOA+13Wc9p/u5BPU0cUa+ab8GC0Ni/4t3fmoTmtH1aMl/l6q3
   V+COME/Ac/zfFiF81oIa/7fxkZwzOKIxp6A4We2KKUqzdZst+K4fF2Uhh
   w+V4UvwV5FahIWB4KMPX3/+L+v7eiALyt7ZpPgHY3D8WbAD9CRmwrti4V
   y+EjhfrE3sL/FLsXE27B6Wpni13Ri4HDmeEsMiyg5MAlZaVdeTwjSbtN4
   xuzuCd9eQ5C8Drk+F3dGgMWEqg1lTghGYx5RmkGq/k4a9gsO9Z84QiHsA
   YD6uUK1T3/Nnb9AlfZRQgJNUQczGAOpFqW6T3uiNkPcYf0MhxjSlVJR6G
   A==;
X-CSE-ConnectionGUID: edGD2BuiRUuvYj8nVt2jtA==
X-CSE-MsgGUID: K5TQWFbATHOFfkR2OlyESg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42973216"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="42973216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:28:23 -0800
X-CSE-ConnectionGUID: CcjSPeOORFWJJQoCdILWTA==
X-CSE-MsgGUID: jXCAn8STSQauaGpuNshKBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111397338"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Feb 2025 02:28:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfcdm-000tl5-1R;
	Wed, 05 Feb 2025 10:28:18 +0000
Date: Wed, 5 Feb 2025 18:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2722/2722]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:417:21: error: 'struct
 iommu_iotlb_gather' has no member named 'start'
Message-ID: <202502051858.byDv5m4A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   630e9af0966732abe6cd6abe26c09a26f5771a43
commit: 3302f7f978fd408550824b3b33cb7b9922a8331a [2722/2722] net: hns3: add sync command to sync io-pgtable
config: arm64-randconfig-004-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051858.byDv5m4A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051858.byDv5m4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051858.byDv5m4A-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c: In function 'hns3_dma_map_sync':
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:417:21: error: 'struct iommu_iotlb_gather' has no member named 'start'
     417 |         iotlb_gather.start = iova;
         |                     ^
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:418:21: error: 'struct iommu_iotlb_gather' has no member named 'end'
     418 |         iotlb_gather.end = iova + granule - 1;
         |                     ^
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:419:21: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     419 |         iotlb_gather.pgsize = granule;
         |                     ^
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c: In function 'hns3_client_init':
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:5895:1: warning: label 'out_dbg_init' defined but not used [-Wunused-label]
    5895 | out_dbg_init:
         | ^~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c: In function 'hns3_reset_notify_init_enet':
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:6207:1: warning: label 'err_init_guid_fail' defined but not used [-Wunused-label]
    6207 | err_init_guid_fail:
         | ^~~~~~~~~~~~~~~~~~


vim +417 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

   402	
   403	#define HNS3_INVALID_PTYPE \
   404			ARRAY_SIZE(hns3_rx_ptype_tbl)
   405	
   406	static void hns3_dma_map_sync(struct device *dev, unsigned long iova)
   407	{
   408		struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
   409		struct iommu_iotlb_gather iotlb_gather;
   410		size_t granule;
   411	
   412		if (!domain || domain->type != IOMMU_DOMAIN_DMA)
   413			return;
   414	
   415		granule = 1 << __ffs(domain->pgsize_bitmap);
   416		iova = ALIGN_DOWN(iova, granule);
 > 417		iotlb_gather.start = iova;
 > 418		iotlb_gather.end = iova + granule - 1;
 > 419		iotlb_gather.pgsize = granule;
   420	
   421		iommu_iotlb_sync(domain, &iotlb_gather);
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
