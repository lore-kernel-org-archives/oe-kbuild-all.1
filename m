Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E70168C33
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720716035; cv=none; b=QvO8W7vQjY49mF5rh1/uzh37IRlBVTNDICEG646PlHx+kI9ocmgAzshpDIoOMG8WXQqBef/H4un5gkhsgXHE+Ch90NbdOmQ3IEuNowSBXhSMd4wYJsNgBPaCSSTsrt+rCJXa8nelcIrbNxtQ6/hXbwNUn9cB83EEoICv2M/DGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720716035; c=relaxed/simple;
	bh=zSsGKr6p/hv8mfUPW0a0EU/tHxIMWTWSxRI2UyzlpqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxPsifvI6w42sVY8/wHrKuk6xb8C3mQtGpOUgu1RcDfWvU2V9IWMny1am6ai6MwzH26UDSBRgt3LcQLYMwLm4mVBT8dTAUjd6ST+SOVISu6HDf4MDd2lHvRhISYuSia2zvIu0boz2NOnxrGRbICPUxkTsOgTHBI4/BPf1m3A/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOZGkXHI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOZGkXHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720716034; x=1752252034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zSsGKr6p/hv8mfUPW0a0EU/tHxIMWTWSxRI2UyzlpqE=;
  b=QOZGkXHI1SGU7cBtSOg0QJfRZdfmO/pfMh4roAhfSvDpbFBbIoHsPKs5
   9Ziqn7tO61p4tURwNGIl0IJ39XmC2KJD9UfDPW3ZvwlEjyhx5gs0y/4zf
   JuP+nGgnB4L+EgFoZuDXuGvJqI7ALGYokYAO9DvvESovwgqPDk9VAn+ky
   wCF6Lv5Ko0Zpeh+0A5niTJ8CUD/7UpOSl/b6MKiwRgZsD4ee/2jiWIxnd
   VjeiNIQR8c7QvG3DyT+NJIuAVpQRsSVoGnZdWYx/YvQjRskWm4kwqqo/8
   1ICNowLjF9I+pBPFWO1gNjRLE5n2bwazSx37c7nMtFXzuPmI6f0UkoqTu
   A==;
X-CSE-ConnectionGUID: 5gOPnCq5QSmo+qqhr20i7Q==
X-CSE-MsgGUID: DDg1AoDzQXS+Px/IKavZyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28720084"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="28720084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 09:40:33 -0700
X-CSE-ConnectionGUID: e3/Qcdk1TCun9HDSk+glyQ==
X-CSE-MsgGUID: WHuTmpaeRK6y6vjCZfLUtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48689854"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2024 09:40:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRwqM-000ZVk-1M;
	Thu, 11 Jul 2024 16:40:30 +0000
Date: Fri, 12 Jul 2024 00:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-static-calls 2/2] kernel/dma/iommu.h:50:undefined
 reference to `iommu_dma_map_sg'
Message-ID: <202407120024.nzUYXMVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-static-calls
head:   f2b699aea8fff5589a674da2a567fd593ed2d386
commit: f2b699aea8fff5589a674da2a567fd593ed2d386 [2/2] dma: Add IOMMU static calls with clear default ops
config: i386-randconfig-004-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120024.nzUYXMVQ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120024.nzUYXMVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120024.nzUYXMVQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/dma/mapping.o: in function `dma_iommu_map_sg':
>> kernel/dma/iommu.h:50:(.text+0x171): undefined reference to `iommu_dma_map_sg'
   ld: kernel/dma/mapping.o: in function `dma_iommu_unmap_sg':
>> kernel/dma/iommu.h:65:(.text+0xf01): undefined reference to `iommu_dma_unmap_sg'
   ld: kernel/dma/mapping.o: in function `dma_iommu_map_page':
>> kernel/dma/iommu.h:23:(.text+0x1591): undefined reference to `iommu_dma_map_page'
   ld: kernel/dma/mapping.o: in function `dma_iommu_unmap_page':
>> kernel/dma/iommu.h:38:(.text+0x186d): undefined reference to `iommu_dma_unmap_page'


vim +50 kernel/dma/iommu.h

    11	
    12	static inline dma_addr_t dma_iommu_map_page(struct device *dev,
    13						    struct page *page, size_t offset,
    14						    size_t size,
    15						    enum dma_data_direction dir,
    16						    unsigned long attrs)
    17	{
    18		const struct dma_map_ops *ops = get_dma_ops(dev);
    19	
    20		if (ops->map_page)
    21			return ops->map_page(dev, page, offset, size, dir, attrs);
    22	
  > 23		return iommu_dma_map_page(dev, page, offset, size, dir, attrs);
    24	}
    25	
    26	static inline void dma_iommu_unmap_page(struct device *dev, dma_addr_t addr,
    27						size_t size,
    28						enum dma_data_direction dir,
    29						unsigned long attrs)
    30	{
    31		const struct dma_map_ops *ops = get_dma_ops(dev);
    32	
    33		if (ops->unmap_page) {
    34			ops->unmap_page(dev, addr, size, dir, attrs);
    35			return;
    36		}
    37	
  > 38		iommu_dma_unmap_page(dev, addr, size, dir, attrs);
    39	}
    40	
    41	static inline int dma_iommu_map_sg(struct device *dev, struct scatterlist *sg,
    42					   int nents, enum dma_data_direction dir,
    43					   unsigned long attrs)
    44	{
    45		const struct dma_map_ops *ops = get_dma_ops(dev);
    46	
    47		if (ops->map_sg)
    48			return ops->map_sg(dev, sg, nents, dir, attrs);
    49	
  > 50		return iommu_dma_map_sg(dev, sg, nents, dir, attrs);
    51	}
    52	
    53	static inline void dma_iommu_unmap_sg(struct device *dev,
    54					      struct scatterlist *sg, int nents,
    55					      enum dma_data_direction dir,
    56					      unsigned long attrs)
    57	{
    58		const struct dma_map_ops *ops = get_dma_ops(dev);
    59	
    60		if (ops->unmap_sg) {
    61			ops->unmap_sg(dev, sg, nents, dir, attrs);
    62			return;
    63		}
    64	
  > 65		iommu_dma_unmap_sg(dev, sg, nents, dir, attrs);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
