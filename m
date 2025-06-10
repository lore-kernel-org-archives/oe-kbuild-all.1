Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3B288C03
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547253; cv=none; b=bshTKt1pjBFQEm+k+A4YCi437jggN1K+4xaJQayUgFtIheWJLSRmgT/A7HpGVqh3L2V1kH3uGUYh5sVm5rP6QReyoq333TfFEbbGj1/yWsofOqCpngaTOMq7TmcCFBf64CtPjV5jCgxWgvb8uE1XUiq91rh0uc0hz6c5akcBxCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547253; c=relaxed/simple;
	bh=5KIJvuIkR8XSd5gYoy/sRUVk3/PVb8ydlM+HXQMHrDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2+EoVhE+pSoN5nysHor66AsAUvZWlPntP/vUS4bsHRXfXgM1NmxFborqh8JMvGxqygvYwV1SDaF4iUGreoJwMg2aok28DlbCnfF6BPHBsPUi22L7dixpBNIvQovfF9wP3UqRe9f4/gDGlU67S4JuGr/xnMUWgqSALPC5pyxHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxSKyGaL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxSKyGaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749547252; x=1781083252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5KIJvuIkR8XSd5gYoy/sRUVk3/PVb8ydlM+HXQMHrDc=;
  b=MxSKyGaLwjKMTucpb4/7OKFaqnVAQO0CvAxrgbV/wdZSEwLEIPs7PR0w
   wJS516i/rjik5JXVzbCffUqEt++T7BVYTo24Kgp8jDz9F+7MTokvQVcI7
   UqnnVR/6nq2Xq3Msu5AK7JqSdTRM4bSbEDd19Ew9icLFhiAdE9ZXmeXQl
   6M/yTAyUTbA45ahotUqZ7TByH/NuRGtvlS5onX4uxKHCeapBD63IeJ22a
   TJfsNP/1VmG1fZAS0eqhD4cu2C6O2cubbUV4c8ozfMCnAHIxMxOxrEEMS
   oLXBW4oi5NlxGAsgMIvgRqu669aRDRfUPLHhTKhoOmRVb3ycKNd6uopA+
   Q==;
X-CSE-ConnectionGUID: SZ4dWIL4T1mcujF7yrzXdg==
X-CSE-MsgGUID: cIH/np9zQGOxS3X05LtWZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77049553"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="77049553"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:20:51 -0700
X-CSE-ConnectionGUID: aRrHDKx6QjiWUUzwreadyA==
X-CSE-MsgGUID: U01+kJDnSeq5VOpD/zoCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151657505"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2025 02:20:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOvA0-000821-1G;
	Tue, 10 Jun 2025 09:20:48 +0000
Date: Tue, 10 Jun 2025 17:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 32/40] drivers/iommu/iommu-pages.h:129:45:
 warning: cast from pointer to integer of different size
Message-ID: <202506101725.ZGOeUtos-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   282698ed3a69e2f70fd682b369cf39c972c0bb2b
commit: ad56432cfa24006650b9487a6d476854af83321b [32/40] iommu/pages: Add support for a incoherent IOMMU page walker
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250610/202506101725.ZGOeUtos-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101725.ZGOeUtos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101725.ZGOeUtos-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-pages.c:6:
   drivers/iommu/iommu-pages.h: In function 'iommu_pages_flush_incoherent':
>> drivers/iommu/iommu-pages.h:129:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     129 |         dma_sync_single_for_device(dma_dev, (dma_addr_t)virt + offset, len,
         |                                             ^
--
   In file included from drivers/iommu/iommufd/selftest.c:16:
   drivers/iommu/iommufd/../iommu-pages.h: In function 'iommu_pages_flush_incoherent':
>> drivers/iommu/iommufd/../iommu-pages.h:129:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     129 |         dma_sync_single_for_device(dma_dev, (dma_addr_t)virt + offset, len,
         |                                             ^
--
   In file included from drivers/iommu/generic_pt/fmt/../iommu_pt.h:15,
                    from drivers/iommu/generic_pt/fmt/iommu_template.h:40,
                    from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
   drivers/iommu/generic_pt/fmt/../../iommu-pages.h: In function 'iommu_pages_flush_incoherent':
>> drivers/iommu/generic_pt/fmt/../../iommu-pages.h:129:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     129 |         dma_sync_single_for_device(dma_dev, (dma_addr_t)virt + offset, len,
         |                                             ^


vim +129 drivers/iommu/iommu-pages.h

   124	
   125	static inline void iommu_pages_flush_incoherent(struct device *dma_dev,
   126							void *virt, size_t offset,
   127							size_t len)
   128	{
 > 129		dma_sync_single_for_device(dma_dev, (dma_addr_t)virt + offset, len,
   130					   DMA_TO_DEVICE);
   131	}
   132	void iommu_pages_stop_incoherent_list(struct iommu_pages_list *list,
   133	                                      struct device *dma_dev);
   134	#endif
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
