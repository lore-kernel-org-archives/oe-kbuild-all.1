Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631BF15B560
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751028; cv=none; b=i7ke7yoa80goktOjiDUujFJqbkJ0jGSPpRD+OoPR+Tpyek8hlQTBDc21L3hfHPY2gF8XhiJc4wqZz5H7bemovXACM7m2z9icH2PQv7pIBozcBlKxDNS/vOaYzrNQ4E4JZwAiL54UTd50U5d4sodX32fOYF0yDjUkoqA3MqC/Tp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751028; c=relaxed/simple;
	bh=Z1IOXgFLxmibdj0KMZVMIV3nmi5mYVWUXSXbrMUn/M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkU1Yxi4rOmad71WjSoAvqQwceiP5BoB90mV4oeZItnmq2jmWiDuuwOmCbsS/I5vlL1XjwCdTY8NsS/vGHRg1FKnuzXHCefhTNEQpBggHIcLOj64rjXBtYN+hYkh4ApSaA6/pEdFTOeWsLHaqRMMUsi9pcQHNvcb3IO4rKOmghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsSRXm4L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsSRXm4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717751026; x=1749287026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z1IOXgFLxmibdj0KMZVMIV3nmi5mYVWUXSXbrMUn/M4=;
  b=hsSRXm4Lrtz2QqO/s+qVyo6bNElyTZNFNfv/C8viVcMdGGUHuz6aDgvo
   nOEAGOpbX/ljJ4JCcP0WTwREMyNlg4bfnNojWb1DlZZRkjpiXc78/YrVc
   eqCpiL+GhS6SFmeIbq2fXvJhOUNto2yb8mOC84VHCUq3ubQ9rxg7pZSoC
   papMYeo4k1431+xjAWU++NhWeVyQ8CxUUlnxvuD8nwEKBgijnp2J8NVAK
   5TamI8ms0XUtvI99+WBnZoLRJrz48SwrAPDhiOSIrg3YcAaZ7E7aHKUQw
   jkyE60xYEZmpQMpK/YB9fTwJoSlFoeocBdo7IBYDOYoq6zd+oM16TSz/y
   A==;
X-CSE-ConnectionGUID: tmXmOf41SeSJ0B8d/xF16Q==
X-CSE-MsgGUID: 0n748u3pQVG5Ec93tN+qnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="31956372"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="31956372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 02:03:46 -0700
X-CSE-ConnectionGUID: v4XLjFqMQYuXIjEeP25zsA==
X-CSE-MsgGUID: t5z+DbVyR2GEOE+307g54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="75739707"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Jun 2024 02:03:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFVVe-0004KB-2l;
	Fri, 07 Jun 2024 09:03:42 +0000
Date: Fri, 7 Jun 2024 17:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: mhkelley58@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <202406071641.Brak00PZ-lkp@intel.com>
References: <20240607031421.182589-1-mhklinux@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607031421.182589-1-mhklinux@outlook.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on joro-iommu/next]
[also build test ERROR on linus/master v6.10-rc2 next-20240607]
[cannot apply to xen-tip/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mhkelley58-gmail-com/swiotlb-Reduce-calls-to-swiotlb_find_pool/20240607-114732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
patch link:    https://lore.kernel.org/r/20240607031421.182589-1-mhklinux%40outlook.com
patch subject: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406071641.Brak00PZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071641.Brak00PZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071641.Brak00PZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/dma/mapping.c:18:
   kernel/dma/direct.h: In function 'dma_direct_sync_single_for_device':
>> kernel/dma/direct.h:64:17: error: implicit declaration of function 'swiotlb_sync_single_for_device'; did you mean 'dma_sync_single_for_device'? [-Werror=implicit-function-declaration]
      64 |                 swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 dma_sync_single_for_device
   kernel/dma/direct.h: In function 'dma_direct_sync_single_for_cpu':
>> kernel/dma/direct.h:83:17: error: implicit declaration of function 'swiotlb_sync_single_for_cpu'; did you mean 'dma_sync_single_for_cpu'? [-Werror=implicit-function-declaration]
      83 |                 swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 dma_sync_single_for_cpu
   kernel/dma/direct.h: In function 'dma_direct_map_page':
>> kernel/dma/direct.h:99:24: error: implicit declaration of function 'swiotlb_map'; did you mean 'swiotlb_free'? [-Werror=implicit-function-declaration]
      99 |                 return swiotlb_map(dev, phys, size, dir, attrs);
         |                        ^~~~~~~~~~~
         |                        swiotlb_free
   kernel/dma/direct.h: In function 'dma_direct_unmap_page':
>> kernel/dma/direct.h:131:17: error: implicit declaration of function 'swiotlb_tbl_unmap_single' [-Werror=implicit-function-declaration]
     131 |                 swiotlb_tbl_unmap_single(dev, phys, size, dir,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +64 kernel/dma/direct.h

    55	
    56	static inline void dma_direct_sync_single_for_device(struct device *dev,
    57			dma_addr_t addr, size_t size, enum dma_data_direction dir)
    58	{
    59		phys_addr_t paddr = dma_to_phys(dev, addr);
    60		struct io_tlb_pool *pool;
    61	
    62		pool = is_swiotlb_buffer(dev, paddr);
    63		if (unlikely(pool))
  > 64			swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
    65	
    66		if (!dev_is_dma_coherent(dev))
    67			arch_sync_dma_for_device(paddr, size, dir);
    68	}
    69	
    70	static inline void dma_direct_sync_single_for_cpu(struct device *dev,
    71			dma_addr_t addr, size_t size, enum dma_data_direction dir)
    72	{
    73		phys_addr_t paddr = dma_to_phys(dev, addr);
    74		struct io_tlb_pool *pool;
    75	
    76		if (!dev_is_dma_coherent(dev)) {
    77			arch_sync_dma_for_cpu(paddr, size, dir);
    78			arch_sync_dma_for_cpu_all();
    79		}
    80	
    81		pool = is_swiotlb_buffer(dev, paddr);
    82		if (unlikely(pool))
  > 83			swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
    84	
    85		if (dir == DMA_FROM_DEVICE)
    86			arch_dma_mark_clean(paddr, size);
    87	}
    88	
    89	static inline dma_addr_t dma_direct_map_page(struct device *dev,
    90			struct page *page, unsigned long offset, size_t size,
    91			enum dma_data_direction dir, unsigned long attrs)
    92	{
    93		phys_addr_t phys = page_to_phys(page) + offset;
    94		dma_addr_t dma_addr = phys_to_dma(dev, phys);
    95	
    96		if (is_swiotlb_force_bounce(dev)) {
    97			if (is_pci_p2pdma_page(page))
    98				return DMA_MAPPING_ERROR;
  > 99			return swiotlb_map(dev, phys, size, dir, attrs);
   100		}
   101	
   102		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
   103		    dma_kmalloc_needs_bounce(dev, size, dir)) {
   104			if (is_pci_p2pdma_page(page))
   105				return DMA_MAPPING_ERROR;
   106			if (is_swiotlb_active(dev))
   107				return swiotlb_map(dev, phys, size, dir, attrs);
   108	
   109			dev_WARN_ONCE(dev, 1,
   110				     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
   111				     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
   112			return DMA_MAPPING_ERROR;
   113		}
   114	
   115		if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
   116			arch_sync_dma_for_device(phys, size, dir);
   117		return dma_addr;
   118	}
   119	
   120	static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
   121			size_t size, enum dma_data_direction dir, unsigned long attrs)
   122	{
   123		phys_addr_t phys = dma_to_phys(dev, addr);
   124		struct io_tlb_pool *pool;
   125	
   126		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
   127			dma_direct_sync_single_for_cpu(dev, addr, size, dir);
   128	
   129		pool = is_swiotlb_buffer(dev, phys);
   130		if (unlikely(pool))
 > 131			swiotlb_tbl_unmap_single(dev, phys, size, dir,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
