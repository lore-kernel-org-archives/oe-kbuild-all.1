Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E32EC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 00:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729729227; cv=none; b=sQj9ziwaub1N0k31Tl3w+sBZjjNWk/riD8YF/VnYr5D+JVcdYYi6OZwZcsBn6XD8WdfItgtNt3tMkn1uIZFQVBK1XJPiIywhw+3bVFtFkUr/WlPZ8PT9BWEF9OEg28bvHBkUm09jpyH3HkQbGnI7YSGgkdyasALfrlq03NBe6C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729729227; c=relaxed/simple;
	bh=vUXG/JUw/GP63LPiB8NCIqM83Yu0VcPXMC4a7kQaZVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pdcw5f2dwQnBjLVramwCHrNGcEEF6kFbJBJDo1nQCTdCOMpXb1/LGUNwokzbQFJkWXLjNjRW0gQLUfQ5vEfUiIDoxhZzruzcQXKOE1p2c7AQa3Q+D5LO4GtEFgbG6n56kLPCFHNS++8xrL107ZJpugHmSTrBfTr/M4gn5thEUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lESFL9d6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lESFL9d6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729729226; x=1761265226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vUXG/JUw/GP63LPiB8NCIqM83Yu0VcPXMC4a7kQaZVU=;
  b=lESFL9d62nitVJqeg25YpYlWG7HAvB1Lev3rUnWoD33iCMV9X5uHLo7j
   6mw6mmXvPDZYBNrLxg/NrES+Iuvq6GINYlUDDbZzyuBy6TJoPcv7tT+qd
   MY2PG+WoWecMDpvTE4ArbyF/Zbi0/RWcGk4fjLZ2yoBihSk5kHkTxrrtR
   uBqUHNxY1m2PxhG+jH7hqcCmKrG8hootpcBvQUOI1yhTHlxaCdIS1tHUA
   4S1WjmG2hf4gqx9MtRmGcxcTuotd5i7sFFbhB9Rp/Oqu6k25xKKatKP5k
   unDepD378rYxLfsVZOgBrD5z9WFwXm8MZVJpl4I8XJKRaqTTg0wedaQV/
   Q==;
X-CSE-ConnectionGUID: dA4h3NklRfa7mA/cTRHuUw==
X-CSE-MsgGUID: EbR4TcwjRXOWzmA/z2K9jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39888894"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39888894"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:20:25 -0700
X-CSE-ConnectionGUID: MxSzK9/9TouAl/cSxxN0jg==
X-CSE-MsgGUID: CS7VFi38RkafBPrHdx00Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80092844"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2024 17:20:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3laP-000Vjw-17;
	Thu, 24 Oct 2024 00:20:21 +0000
Date: Thu, 24 Oct 2024 08:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9626/15255]
 arch/x86/kernel/zhaoxin_kh40000.c:87:47: error: implicit declaration of
 function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'?
Message-ID: <202410240848.VbEcgWD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e7bc79687a034a22f94328123d5cf8c4d4436c35
commit: 4332dbb07181359cccca3ba757ef54e434fb1296 [9626/15255] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-001-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240848.VbEcgWD6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240848.VbEcgWD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240848.VbEcgWD6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c: In function 'kh40000_sync_single_dma_for_cpu':
>> arch/x86/kernel/zhaoxin_kh40000.c:87:47: error: implicit declaration of function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'? [-Werror=implicit-function-declaration]
      87 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                               ^~~~~~~~~~~~~~~~~~~~
         |                                               iommu_is_dma_domain
   arch/x86/kernel/zhaoxin_kh40000.c:87:47: warning: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +87 arch/x86/kernel/zhaoxin_kh40000.c

    64	
    65	static void kh40000_sync_single_dma_for_cpu(struct device *dev, dma_addr_t paddr,
    66			enum dma_data_direction dir, bool is_iommu)
    67	{
    68		u8 vid;
    69		struct pci_dev *pci;
    70		u64 dma_mask = *dev->dma_mask;
    71	
    72		/* check direction */
    73		if ((dir != DMA_FROM_DEVICE) && (dir != DMA_BIDIRECTIONAL))
    74			return;
    75	
    76		/* check dma capability */
    77		if (dma_mask <= DMA_BIT_MASK(32))
    78			return;
    79	
    80		/* check device type */
    81		pci = kh40000_get_pci_dev(dev);
    82		if (pci == NULL)
    83			return;
    84	
    85		/* get real physical address */
    86		if (is_iommu) {
  > 87			struct iommu_domain *domain = iommu_get_dma_domain(dev);
    88	
    89			paddr = iommu_iova_to_phys(domain, paddr);
    90			if (!paddr)
    91				return;
    92		}
    93	
    94		/* check node or not */
    95		if ((zhaoxin_patch_code & ZHAOXIN_P2CW_NODE_CHECK)
    96		   && pfn_to_nid(PFN_DOWN(paddr)) == dev_to_node(dev))
    97			return;
    98	
    99		/* flush data by one pci read cycle */
   100		pci_read_config_byte(pci, PCI_VENDOR_ID, &vid);
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
