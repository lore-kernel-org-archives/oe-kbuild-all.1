Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB96AB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729729229; cv=none; b=UPPuUGSEK2k2sFQCdGmaPVL42kCRnOPTgE7e7zjENy7hDc6xQka3Lk9Y8RRM+tlwiQsgm21pxXoyRqYmrw1c2tkC3GgXwm+6LOdRU1VciOgIoX+l8zG5zpuVG0nREGlDApOWAX/rKlflnBUQLESsSs0hux3ZZc9rILSHoOwIoKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729729229; c=relaxed/simple;
	bh=5M0xIl/byOcRslEj5kd0V+VeFsRWi9vWcaGEZR8B/Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgODsNWpLfgRCNYDuWtetJ6SrQ9LPF4T3pUzkRUSbnm5iyM3tQI5v/5PfhEzzs8Wk+pGGMqn94uvqFsDuq2ne8cJPJS+AhAeL17qqY2sDeu5G0akGNdbyvw++RMS5+H4XcftN1J4dRsSkE972qSCpXU6rK/e6kn4v+/1hnGyOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgtAu6uD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgtAu6uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729729227; x=1761265227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5M0xIl/byOcRslEj5kd0V+VeFsRWi9vWcaGEZR8B/Kg=;
  b=bgtAu6uDifDeutW9uA1Nccz4TqUN0MoOgt6qXvPVvYHuuzUnFNOLfxRw
   +QyuE+miWhgmrmIYHLWFoFifTy4rDPK7BsFzXwmH50qJ2PJm4eG49DtZK
   XUCim+LCbEIRBJcqOFtL4p59iNDgjcRPawFY8GBQVFBiDnhYoe+KAylg4
   8Y8hoivgwmlwV0VGlPJzMzIAmD8IeP5vFIGveGEnlq/PUJE8CdIFtwTd5
   KAYePyUVX8cfxJQ8mQRcVXvJwWF13fLvqwFot1smhgKabb59GoSwLR8eu
   mP2MICBMNyupH3y0gcgEiQwgMORbuemvYdDI75Pm9NFLrHQDR7HXltyiN
   Q==;
X-CSE-ConnectionGUID: sp9HGGoCQE27BfEMXijOqg==
X-CSE-MsgGUID: nGiPkLGMTrWvtKvo4YUWIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="54744091"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="54744091"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:20:24 -0700
X-CSE-ConnectionGUID: Zrpzc1BPRJCK9Ppfn5sIXw==
X-CSE-MsgGUID: YWxamyeHRD6h0j6naBWp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80739705"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 17:20:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3laP-000Vjs-10;
	Thu, 24 Oct 2024 00:20:21 +0000
Date: Thu, 24 Oct 2024 08:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-split-wip 8/26] drivers/iommu/dma-iommu.c:2052:17:
 error: implicit declaration of function '__iommu_dma_free_iova'; did you
 mean 'iommu_dma_free_iova'?
Message-ID: <202410240842.w646wuxY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-split-wip
head:   6a0b0963ff9e2d8940218c63f0a3ff794bcd09d3
commit: d35bb33120e529c39ab215445ba649c32985ab29 [8/26] dma-mapping: Implement link/unlink ranges API
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241024/202410240842.w646wuxY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240842.w646wuxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240842.w646wuxY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/dma-iommu.c: In function '__iommu_dma_iova_unlink':
>> drivers/iommu/dma-iommu.c:2052:17: error: implicit declaration of function '__iommu_dma_free_iova'; did you mean 'iommu_dma_free_iova'? [-Werror=implicit-function-declaration]
    2052 |                 __iommu_dma_free_iova(cookie, addr, size, &iotlb_gather);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 iommu_dma_free_iova
   cc1: some warnings being treated as errors


vim +2052 drivers/iommu/dma-iommu.c

  2023	
  2024	static void __iommu_dma_iova_unlink(struct device *dev,
  2025			struct dma_iova_state *state, size_t offset, size_t size,
  2026			enum dma_data_direction dir, unsigned long attrs,
  2027			bool free_iova)
  2028	{
  2029		struct iommu_domain *domain = iommu_get_dma_domain(dev);
  2030		struct iommu_dma_cookie *cookie = domain->iova_cookie;
  2031		struct iova_domain *iovad = &cookie->iovad;
  2032		dma_addr_t addr = state->addr + offset;
  2033		size_t iova_start_pad = iova_offset(iovad, addr);
  2034		struct iommu_iotlb_gather iotlb_gather;
  2035		size_t unmapped;
  2036	
  2037		if ((state->__size & DMA_IOVA_USE_SWIOTLB) ||
  2038		    (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)))
  2039			iommu_dma_iova_unlink_range_slow(dev, addr, size, dir, attrs);
  2040	
  2041		iommu_iotlb_gather_init(&iotlb_gather);
  2042		iotlb_gather.queued = free_iova && READ_ONCE(cookie->fq_domain);
  2043	
  2044		size = iova_align(iovad, size + iova_start_pad);
  2045		addr -= iova_start_pad;
  2046		unmapped = iommu_unmap_fast(domain, addr, size, &iotlb_gather);
  2047		WARN_ON(unmapped != size);
  2048	
  2049		if (!iotlb_gather.queued)
  2050			iommu_iotlb_sync(domain, &iotlb_gather);
  2051		if (free_iova)
> 2052			__iommu_dma_free_iova(cookie, addr, size, &iotlb_gather);
  2053	}
  2054	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
