Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029B1553AB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729727967; cv=none; b=tkKfPfagr9ybGPobVHnLF1kzbQBT6mr03oT0lXXeUbgZal7QR8N7krGxVAnLmdS0/w/na859KR2cC/555qP37PZW7tr/r7dJ5EKHsAt8DBa6LOg0UaoQ/BscIp5BqW23df+suFZM16TfKALj6x5zXFQJjIkG/0e60k1il3+lVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729727967; c=relaxed/simple;
	bh=VBGce5OnJLMW+mTNNeh6DdUZuWmw5dnJpVoUZHKMWq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OA4roS/y6hQEWMavY1wcH3WHyn8F1hBE65i6UXK9JYKCZKwXNbGKborGAwYnWefkGad5Dq9Br7KiQ3f5Fy607+JGDqzfaptnWGyqIL/dqJ7kAgI6S7b8UnK8vSLEsVy+wRfhGK2VbaCCC2rO/cDWssB8V9nsTcTfJvwt5Dx33oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHti5Rwi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHti5Rwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729727965; x=1761263965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VBGce5OnJLMW+mTNNeh6DdUZuWmw5dnJpVoUZHKMWq8=;
  b=OHti5RwiPneEiYDJHcsgjaBpQWcyl2ouGaNkVM6QpBJOuIWgdiZV+xfZ
   Dzz5Z2LYV3m+qZZOek3eOfh2nz7maEZ78KTfwty3gBu5ceXo/eNDq7yxG
   icaVanE+G2Hn5wUh3cLAa9QLYClqrYm3K73+rthNYScyF4AVjlkUaG7P0
   i8Wb+U8PMJf6kX4nneNSGEQC0eXgGpIMP76aicc7jopwvJkNE1CPsi/GM
   1Q8+y1UVCKjIdKi7tKUhIm/ogY4Ko1F/avUpzvrz0GrmzxPT9phl5WIHP
   NB3Ho30gXYqjuDdnp3BguABsS5tp8xsjdrOjAEqsUF5IZGHZ2u9OzSTBe
   g==;
X-CSE-ConnectionGUID: 8zNLYq5qS4qHayZeU/ALxQ==
X-CSE-MsgGUID: 0n2Bu16fT5WT8nb+LSAMFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29462514"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29462514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 16:59:25 -0700
X-CSE-ConnectionGUID: xMlBiPFiQ/ehN8Zu9WypxA==
X-CSE-MsgGUID: lBtzYXOSSFWRMu4pY13yIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="85209896"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 16:59:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3lG4-000Vj4-38;
	Wed, 23 Oct 2024 23:59:20 +0000
Date: Thu, 24 Oct 2024 07:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-split-wip 8/26] drivers/iommu/dma-iommu.c:2052:3:
 error: call to undeclared function '__iommu_dma_free_iova'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202410240716.I77qQFr3-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241024/202410240716.I77qQFr3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240716.I77qQFr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240716.I77qQFr3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:2052:3: error: call to undeclared function '__iommu_dma_free_iova'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2052 |                 __iommu_dma_free_iova(cookie, addr, size, &iotlb_gather);
         |                 ^
   drivers/iommu/dma-iommu.c:2052:3: note: did you mean 'iommu_dma_free_iova'?
   drivers/iommu/dma-iommu.c:809:13: note: 'iommu_dma_free_iova' declared here
     809 | static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
         |             ^
   1 error generated.


vim +/__iommu_dma_free_iova +2052 drivers/iommu/dma-iommu.c

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
