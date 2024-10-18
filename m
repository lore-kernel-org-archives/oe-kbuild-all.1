Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F91202F90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248572; cv=none; b=edfZ/JublcLSvaUhEE21riMhicMfmLbzQhpJvV9n7w64kkuhnc0AGvx1ou0cxB++RJVT+0xRI8eOdA+fZa3iXdUxr7ftq3syFJphckMOeUzIzqCrOLFEVJCPxT6kZNKFqZhl6h3lXpsoPCqDFE27R/oKkU7VMr+OSrEcPTJ1sF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248572; c=relaxed/simple;
	bh=O01K1bg9ZWzfZhYqZ/2SiKYa9azO7b//8vJ3YWyW/Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ct1xL7AKJUilbKhRwljNsOZNUPaduVEoNEvvKjOKcIEHAQeZxN/uJDB3eXF/ywIINEG6YWEYMTrbun1BffNLAy/FhFV6a79dF/MiEGrcK+x3ZDtgWfWqCW2kxaRhFVfLWDfA757Ut8Mhy1JjtGe1xcQeQ9mpN4QrWGv6EFrnoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1iMxVoA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1iMxVoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729248570; x=1760784570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O01K1bg9ZWzfZhYqZ/2SiKYa9azO7b//8vJ3YWyW/Ug=;
  b=S1iMxVoAfAdKpR+X69P4p7EcCoze8iPDstyXjKu0gqnZsL5G2oqFdZvr
   Sn2b1ZDS6j4OCbVRPtROIiBcRMslO1hBZT6/F4bvITFZFUQLquIuzetu9
   RWdSrLSM9mHP99j0U9UmCmN5AgwCNnq0IOkEdgnDCMTFBCC+Xc0RAzi6k
   faoX9nFeA03b+klW2JstqmDndx414r0VtVu7+op3Q6rBZgbH3pRGpxt07
   BTVSgYEUYUQH8+dM4gwEYB/9jyGYMze+yjJ+VDxserASeZOxtYYw2S+wz
   EQkbVTQwOnPayFGgWw85WVYQqg0XZAxNqTiKmBnxs589e2QerU0zKG8Gc
   g==;
X-CSE-ConnectionGUID: 6hxqKVW1Sh65JQeAJu4WmQ==
X-CSE-MsgGUID: +KYkLmioSkWgUw6xg5ORMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46232393"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46232393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 03:49:30 -0700
X-CSE-ConnectionGUID: 45yTh3boSS6rLVI0BMyI2Q==
X-CSE-MsgGUID: WcFzdOpIS6644rrgG2w36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="79256871"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 03:49:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1kXu-000Ngn-2e;
	Fri, 18 Oct 2024 10:49:26 +0000
Date: Fri, 18 Oct 2024 18:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-split-wip 5/5] mm/hmm.c:643: warning: Function
 parameter or struct member 'p2pdma_state' not described in 'hmm_dma_map_pfn'
Message-ID: <202410181847.xbUEIMWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-split-wip
head:   5b94586723e2dad11627312e515af6d4451b6921
commit: 5b94586723e2dad11627312e515af6d4451b6921 [5/5] FOLD: implement P2P mappings in hmm_dma_map_pfn
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241018/202410181847.xbUEIMWs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181847.xbUEIMWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181847.xbUEIMWs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hmm.c:643: warning: Function parameter or struct member 'p2pdma_state' not described in 'hmm_dma_map_pfn'
>> mm/hmm.c:643: warning: Excess function parameter 'pci_p2pdma_map_state' description in 'hmm_dma_map_pfn'


vim +643 mm/hmm.c

c101823fb37c66 Leon Romanovsky   2024-01-29  619  
c101823fb37c66 Leon Romanovsky   2024-01-29  620  /**
c101823fb37c66 Leon Romanovsky   2024-01-29  621   * hmm_dma_map_pfn - Map a physical HMM page to DMA address
c101823fb37c66 Leon Romanovsky   2024-01-29  622   * @dev: Device to map the page for
c101823fb37c66 Leon Romanovsky   2024-01-29  623   * @state: IOVA state
c101823fb37c66 Leon Romanovsky   2024-01-29  624   * @pfns: HMM PFNs
c101823fb37c66 Leon Romanovsky   2024-01-29  625   * @dma_addrs: Array of dma addresses for each PFN
c101823fb37c66 Leon Romanovsky   2024-01-29  626   * @idx: Index into the PFN and dma address arrays
c101823fb37c66 Leon Romanovsky   2024-01-29  627   * @entry_size: Size of each entry in @pfns and @dma_addrs
5b94586723e2da Christoph Hellwig 2024-10-17  628   * @pci_p2pdma_map_state: PCI P2P state.
c101823fb37c66 Leon Romanovsky   2024-01-29  629   *
c101823fb37c66 Leon Romanovsky   2024-01-29  630   * dma_alloc_iova() allocates IOVA based on the size specified by their use in
c101823fb37c66 Leon Romanovsky   2024-01-29  631   * iova->size. Call this function after IOVA allocation to link whole @page
c101823fb37c66 Leon Romanovsky   2024-01-29  632   * to get the DMA address. Note that very first call to this function
c101823fb37c66 Leon Romanovsky   2024-01-29  633   * will have @offset set to 0 in the IOVA space allocated from
c101823fb37c66 Leon Romanovsky   2024-01-29  634   * dma_alloc_iova(). For subsequent calls to this function on same @iova,
c101823fb37c66 Leon Romanovsky   2024-01-29  635   * @offset needs to be advanced by the caller with the size of previous
c101823fb37c66 Leon Romanovsky   2024-01-29  636   * page that was linked + DMA address returned for the previous page that was
c101823fb37c66 Leon Romanovsky   2024-01-29  637   * linked by this function.
c101823fb37c66 Leon Romanovsky   2024-01-29  638   */
c101823fb37c66 Leon Romanovsky   2024-01-29  639  dma_addr_t hmm_dma_map_pfn(struct device *dev, struct dma_iova_state *state,
c101823fb37c66 Leon Romanovsky   2024-01-29  640  			   unsigned long pfns[], dma_addr_t dma_addrs[],
5b94586723e2da Christoph Hellwig 2024-10-17  641  			   size_t idx, size_t entry_size,
5b94586723e2da Christoph Hellwig 2024-10-17  642  			   struct pci_p2pdma_map_state *p2pdma_state)
c101823fb37c66 Leon Romanovsky   2024-01-29 @643  {
c101823fb37c66 Leon Romanovsky   2024-01-29  644  	size_t offset = idx * entry_size;
5b94586723e2da Christoph Hellwig 2024-10-17  645  	struct page *page = hmm_pfn_to_page(pfns[idx]);
5b94586723e2da Christoph Hellwig 2024-10-17  646  	phys_addr_t paddr = hmm_pfn_to_phys(pfns[idx]);
c101823fb37c66 Leon Romanovsky   2024-01-29  647  	dma_addr_t dma_addr;
c101823fb37c66 Leon Romanovsky   2024-01-29  648  	int ret;
c101823fb37c66 Leon Romanovsky   2024-01-29  649  
5b94586723e2da Christoph Hellwig 2024-10-17  650  	if ((pfns[idx] & HMM_PFN_DMA_MAPPED) &&
5b94586723e2da Christoph Hellwig 2024-10-17  651  	    !(pfns[idx] & HMM_PFN_P2PDMA_BUS)) {
c101823fb37c66 Leon Romanovsky   2024-01-29  652  		/*
c101823fb37c66 Leon Romanovsky   2024-01-29  653  		 * We are in this flow when there is a need to resync flags,
c101823fb37c66 Leon Romanovsky   2024-01-29  654  		 * for example when page was already linked in prefetch call
c101823fb37c66 Leon Romanovsky   2024-01-29  655  		 * with READ flag and now we need to add WRITE flag
c101823fb37c66 Leon Romanovsky   2024-01-29  656  		 *
c101823fb37c66 Leon Romanovsky   2024-01-29  657  		 * This page was already programmed to HW and we don't want/need
c101823fb37c66 Leon Romanovsky   2024-01-29  658  		 * to unlink and link it again just to resync flags.
c101823fb37c66 Leon Romanovsky   2024-01-29  659  		 */
c101823fb37c66 Leon Romanovsky   2024-01-29  660  		if (dma_can_use_iova(state))
c101823fb37c66 Leon Romanovsky   2024-01-29  661  			return state->addr + offset;
c101823fb37c66 Leon Romanovsky   2024-01-29  662  
c101823fb37c66 Leon Romanovsky   2024-01-29  663  		/*
c101823fb37c66 Leon Romanovsky   2024-01-29  664  		 * Without dma_need_unmap, the dma_addrs array is NULL, thus we
c101823fb37c66 Leon Romanovsky   2024-01-29  665  		 * need to regenerate the address below even if there already
c101823fb37c66 Leon Romanovsky   2024-01-29  666  		 * was a mapping.  But !dma_need_unmap implies that the
c101823fb37c66 Leon Romanovsky   2024-01-29  667  		 * mapping stateless, so this is fine.
c101823fb37c66 Leon Romanovsky   2024-01-29  668  		 */
c101823fb37c66 Leon Romanovsky   2024-01-29  669  		if (dma_need_unmap(dev))
c101823fb37c66 Leon Romanovsky   2024-01-29  670  			return dma_addrs[idx];
5b94586723e2da Christoph Hellwig 2024-10-17  671  
5b94586723e2da Christoph Hellwig 2024-10-17  672  		/* Fall through to remapping */
5b94586723e2da Christoph Hellwig 2024-10-17  673  	}
5b94586723e2da Christoph Hellwig 2024-10-17  674  
5b94586723e2da Christoph Hellwig 2024-10-17  675  	switch (pci_p2pdma_state(p2pdma_state, dev, page)) {
5b94586723e2da Christoph Hellwig 2024-10-17  676  	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
5b94586723e2da Christoph Hellwig 2024-10-17  677  	case PCI_P2PDMA_MAP_NONE:
5b94586723e2da Christoph Hellwig 2024-10-17  678  		break;
5b94586723e2da Christoph Hellwig 2024-10-17  679  	case PCI_P2PDMA_MAP_BUS_ADDR:
5b94586723e2da Christoph Hellwig 2024-10-17  680  		dma_addr = pci_p2pdma_bus_addr_map(p2pdma_state, paddr);
5b94586723e2da Christoph Hellwig 2024-10-17  681  		pfns[idx] |= HMM_PFN_P2PDMA_BUS;
5b94586723e2da Christoph Hellwig 2024-10-17  682  		goto done;
5b94586723e2da Christoph Hellwig 2024-10-17  683  	default:
5b94586723e2da Christoph Hellwig 2024-10-17  684  		return -EREMOTEIO;
c101823fb37c66 Leon Romanovsky   2024-01-29  685  	}
c101823fb37c66 Leon Romanovsky   2024-01-29  686  
c101823fb37c66 Leon Romanovsky   2024-01-29  687  	if (dma_can_use_iova(state)) {
5b94586723e2da Christoph Hellwig 2024-10-17  688  		ret = dma_iova_link(dev, state, paddr, offset, PAGE_SIZE,
5b94586723e2da Christoph Hellwig 2024-10-17  689  				    DMA_BIDIRECTIONAL, 0);
c101823fb37c66 Leon Romanovsky   2024-01-29  690  		if (ret)
c101823fb37c66 Leon Romanovsky   2024-01-29  691  			return DMA_MAPPING_ERROR;
c101823fb37c66 Leon Romanovsky   2024-01-29  692  
c101823fb37c66 Leon Romanovsky   2024-01-29  693  		dma_addr = state->addr + offset;
c101823fb37c66 Leon Romanovsky   2024-01-29  694  	} else {
c101823fb37c66 Leon Romanovsky   2024-01-29  695  		if (WARN_ON_ONCE(dma_need_unmap(dev) && !dma_addrs))
c101823fb37c66 Leon Romanovsky   2024-01-29  696  			return DMA_MAPPING_ERROR;
c101823fb37c66 Leon Romanovsky   2024-01-29  697  
5b94586723e2da Christoph Hellwig 2024-10-17  698  		dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE,
5b94586723e2da Christoph Hellwig 2024-10-17  699  					DMA_BIDIRECTIONAL);
c101823fb37c66 Leon Romanovsky   2024-01-29  700  		if (dma_mapping_error(dev, dma_addr))
c101823fb37c66 Leon Romanovsky   2024-01-29  701  			return DMA_MAPPING_ERROR;
c101823fb37c66 Leon Romanovsky   2024-01-29  702  
c101823fb37c66 Leon Romanovsky   2024-01-29  703  		if (dma_need_unmap(dev))
c101823fb37c66 Leon Romanovsky   2024-01-29  704  			dma_addrs[idx] = dma_addr;
c101823fb37c66 Leon Romanovsky   2024-01-29  705  	}
c101823fb37c66 Leon Romanovsky   2024-01-29  706  
5b94586723e2da Christoph Hellwig 2024-10-17  707  done:
c101823fb37c66 Leon Romanovsky   2024-01-29  708  	pfns[idx] |= HMM_PFN_DMA_MAPPED;
c101823fb37c66 Leon Romanovsky   2024-01-29  709  	return dma_addr;
c101823fb37c66 Leon Romanovsky   2024-01-29  710  }
c101823fb37c66 Leon Romanovsky   2024-01-29  711  EXPORT_SYMBOL_GPL(hmm_dma_map_pfn);
c101823fb37c66 Leon Romanovsky   2024-01-29  712  

:::::: The code at line 643 was first introduced by commit
:::::: c101823fb37c66a8b3f755a76856904ebcebf5d7 mm/hmm: provide callbacks to map/unmap HMM PFNs

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
