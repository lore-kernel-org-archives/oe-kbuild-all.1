Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD643BBC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 23:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721951789; cv=none; b=rpkO1n1VkfTHv5tRznJ163+9MLPLT0tPMFk3dH96KCAEJPuceFedJtzGeHOd8KNYW0MSWlsvTEWsK24U7+Es6Opy6kqiU0Ac9PZIHUWJw/kK7kfNgBYjAeiikH23B3AM11G9JjKYprc0BHnaeB4DfUwGSeHWseXsQLdg3tBeGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721951789; c=relaxed/simple;
	bh=7APbs7A1k6DYad3c5ElJ7F+x7ch9w6GLTlgZMgoD8qY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMSjFOrHVcmzmNqypc8YzZQD1k1YfIW/CeEQgFGWg2GJNjPLldH/ydsqeDMkvet18aEjRr55VuxG/KmELpfBUmGCqLl2gJbuHwcvLKQ3Fy7m01MeqI+fmEsfBsGzMs3Vw8rzDRvc3cAhPnJGs22MI/UQWszexbvG1ZOmhU8CMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXTdihEq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXTdihEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721951788; x=1753487788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7APbs7A1k6DYad3c5ElJ7F+x7ch9w6GLTlgZMgoD8qY=;
  b=DXTdihEqHk2bJd6yxgQnjA3uJAWS6oSAHv3HjaxZAhbwwPb+crkLngnM
   Nu9WxhxKkGRgTLEUK4QrBJcI+ImzqqOawCg+Jl5FqA5F9OthWqDstiXji
   t+O9axyWnW5Edhectd4jr975+hUl/Yie9z0R4CXSFFWgJbdrbDLAvH4IO
   mm0mUIg/0iIPIhYHi2ERKXwzVKEaH6xoDiRErB/yfSPfs7M8XhqKU7y/k
   y88If5SodJAQWrTg6AkM6EpQ33xZwLUW6c/ZNrDwtqn6I4Z4jZJl3rTL9
   LZqi9cFwK6HeM7GDo9Xe/u6GikzC6N/Z8YzCtaPNFoqp5x3Wy+DyUIXXj
   w==;
X-CSE-ConnectionGUID: cABM1AOHS++Y1n/3ATAlOg==
X-CSE-MsgGUID: pbqDawvuSi6O251bRXr32A==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30876891"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="30876891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 16:56:27 -0700
X-CSE-ConnectionGUID: +Dvn5sAGTU252NF+76XZRQ==
X-CSE-MsgGUID: TAjPfP8FT9am/TtpvnfEEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="90570078"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jul 2024 16:56:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX8Jr-000oYO-34;
	Thu, 25 Jul 2024 23:56:23 +0000
Date: Fri, 26 Jul 2024 07:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v2 7/23] drivers/iommu/dma-iommu.c:1829:13:
 error: implicit declaration of function 'cc_platform_has'
Message-ID: <202407260725.nzXMUidn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v2
head:   b957d69a55716514597d798fb534c7df6a7619f5
commit: 5d7d3730d83d48c6ae1c71882b9cabd4126edcff [7/23] iommu/dma: Add check if IOVA can be used
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240726/202407260725.nzXMUidn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407260725.nzXMUidn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260725.nzXMUidn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/dma-iommu.c: In function 'iommu_can_use_iova':
>> drivers/iommu/dma-iommu.c:1829:13: error: implicit declaration of function 'cc_platform_has' [-Wimplicit-function-declaration]
    1829 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
         |             ^~~~~~~~~~~~~~~
>> drivers/iommu/dma-iommu.c:1829:29: error: 'CC_ATTR_MEM_ENCRYPT' undeclared (first use in this function)
    1829 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
         |                             ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:1829:29: note: each undeclared identifier is reported only once for each function it appears in


vim +/cc_platform_has +1829 drivers/iommu/dma-iommu.c

  1819	
  1820	bool iommu_can_use_iova(struct device *dev, struct page *page, size_t size,
  1821				enum dma_data_direction dir)
  1822	{
  1823		enum pci_p2pdma_map_type map;
  1824	
  1825		if (is_swiotlb_force_bounce(dev) || dev_use_swiotlb(dev, size, dir))
  1826			return false;
  1827	
  1828		/* TODO: Rewrite this check to rely on specific struct page flags */
> 1829		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
  1830			return false;
  1831	
  1832		if (page && is_pci_p2pdma_page(page)) {
  1833			map = pci_p2pdma_map_type(page->pgmap, dev);
  1834			return map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE;
  1835		}
  1836	
  1837		return true;
  1838	}
  1839	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
