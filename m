Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FEA33C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 18:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727375329; cv=none; b=YzULA4nUK2NUDqH94kIoCECmzkOMTLsFOT4NEN13mSBzn4pLh2SkrC+4t/1itCLXrcVDlXuENdgpR0rw5pxpG017OOY8m5Y/QbqF3Ai5a6Vs/zXuhTiXOwH51jAgeykH/J3LcjecjaZDEBmoOk0grJ+KEPAzbpPSYye7aaBTaFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727375329; c=relaxed/simple;
	bh=l2RNowvxkpp/R1fPswa+6FFL1d6XbYFvYvouUJgLX74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6ctGzwDAfjtdCT4sA+1ORgqD/qv+jY+si+2zo19wdFKx/O943Lip53HyxpHNYd7IteMhSqhKb54J+jhnajPfNJEPHby9v2isp5iJJ8IYXZiPVtaln77kR76MTNr0waouzQiV7rcB4jdw3HUtz5pVY4++Dn9fSGeIOajk+6HJPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVHc1Syg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVHc1Syg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727375327; x=1758911327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2RNowvxkpp/R1fPswa+6FFL1d6XbYFvYvouUJgLX74=;
  b=eVHc1Syg4Q5Qge3W2ij4jeHWi5SkWT4q4t7poGDQr1iYhspGpwipOQmP
   LyNnp7yUmVrlniUTRjz6uvtNIff0oSMXccnQVGnbPPyny3wzeULrogKNr
   mUgqMByyqocH3baXCSXz3URdpeuySy0l8U8MBAmjyK00tsB9fcyiRn38Q
   1+gyEIHhZGHI+1m7CpxK1OpqZfplugskgrlmfoW8EajciIu3dSf4F1r/e
   3kXyLZzWK43kx+czeTAIS9C+x5q/i1kVd94aa18QOsgeKsJrVrcdrOtQe
   U5RueIPPwSUbBus1ihoQdqHr3Y0Xlgt5pFXtPrgNEdiMGqVekjHDx9Jh7
   Q==;
X-CSE-ConnectionGUID: +I/cSSQlQIufJuyyeD0k1Q==
X-CSE-MsgGUID: rdUGE62WRaiUF2RGMsO7uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26662709"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26662709"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 11:28:40 -0700
X-CSE-ConnectionGUID: 2MDPlUvDSYmLOcuew+C80Q==
X-CSE-MsgGUID: S6F7gNP4Qy+9hKmYr+8hqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="72343031"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2024 11:28:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sttED-000L6V-0A;
	Thu, 26 Sep 2024 18:28:37 +0000
Date: Fri, 27 Sep 2024 02:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <chenhao418@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14067/14172]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:403:15: error: no member
 named 'start' in 'struct iommu_iotlb_gather'
Message-ID: <202409270232.uDTz2n2f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2e95e7bae9486cc775ed2aa319bf323f6ba2677b
commit: e4a624e3e991f56f3783c5fafe8fd075a2be861b [14067/14172] net: hns3: add sync command to sync io-pgtable
config: arm64-randconfig-r123-20240926 (https://download.01.org/0day-ci/archive/20240927/202409270232.uDTz2n2f-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409270232.uDTz2n2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270232.uDTz2n2f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:403:15: error: no member named 'start' in 'struct iommu_iotlb_gather'
           iotlb_gather.start = iova;
           ~~~~~~~~~~~~ ^
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:404:15: error: no member named 'end' in 'struct iommu_iotlb_gather'
           iotlb_gather.end = iova + granule - 1;
           ~~~~~~~~~~~~ ^
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:405:15: error: no member named 'pgsize' in 'struct iommu_iotlb_gather'
           iotlb_gather.pgsize = granule;
           ~~~~~~~~~~~~ ^
   3 errors generated.


vim +403 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

   388	
   389	#define HNS3_INVALID_PTYPE \
   390			ARRAY_SIZE(hns3_rx_ptype_tbl)
   391	
   392	static void hns3_dma_map_sync(struct device *dev, unsigned long iova)
   393	{
   394		struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
   395		struct iommu_iotlb_gather iotlb_gather;
   396		size_t granule;
   397	
   398		if (!domain || domain->type != IOMMU_DOMAIN_DMA)
   399			return;
   400	
   401		granule = 1 << __ffs(domain->pgsize_bitmap);
   402		iova = ALIGN_DOWN(iova, granule);
 > 403		iotlb_gather.start = iova;
 > 404		iotlb_gather.end = iova + granule - 1;
 > 405		iotlb_gather.pgsize = granule;
   406	
   407		iommu_iotlb_sync(domain, &iotlb_gather);
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
