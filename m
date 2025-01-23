Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8921D432D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737675663; cv=none; b=R+Hed75/RhPiluTWMPcKB8Nr+LXo6AdjqSv4CN8As8XFdTnPHoJeUp+dZOFDqY9By2BBaNQVAjAfUrAlvfjegdk/cmrRYdIIK09Vo3EqjEDlAmyxs7gnXa/87mKdRrBiUtMbDotponRARHnl7ZO9qcc990WwSlJVS2VaWqE/Tls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737675663; c=relaxed/simple;
	bh=eRKUTgD9hdBWONURyA+kpaRbutdzZs9J49EpkWfyAaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J4NoFfwFki6X9+ylwmAV96yFZjEug6v10KuAqVqicvyZTGWyRWc7C02gtMfFYmbVw5+JB1kBjPUeH6pBEehpJoP8ki+obKxcNDOjkX/bhFbI+67MJb6tquCF0bD3YbJJXd1orSnm9gHbRJCEALjvw2eEeDJcP/GLgCEzhOVLbBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VILW9WwG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VILW9WwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737675662; x=1769211662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRKUTgD9hdBWONURyA+kpaRbutdzZs9J49EpkWfyAaM=;
  b=VILW9WwGKyW6GZChO1cXWa8/5S3Jtk5ysnHWl5Tm1tdW8hRhO8ssu9yO
   2fnmxDy3P9qoeHo8JwZMiuldq5vrkevJeC0iknl9kXtoltc4nn5FS0f11
   s6yV6S3ciAT2voBuI4MPeWoP+lOw57CimmUcRjJfmHe37xRp1VhZIFVze
   eIhYTHE6eGz/e/tYeYLSfLkid2YD1azFhX3TRPQNeN2M/fJ+zZH7Ye7OX
   xaxXmXo2jwG9PNjLUt5r9i6SqGDmOJXYZVyJzIW2G4qvBVGsKFT5Am+C6
   LTHv2uQ48rw3rr3n+txXy2hDUWDYK64Zov+xLoNNXoi61Ca0wjOuRejWG
   g==;
X-CSE-ConnectionGUID: 6nx5bIZWScWNNpeOFKn7PA==
X-CSE-MsgGUID: ZRO570DPQ8il+eYbtb14gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41869499"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="41869499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 15:41:01 -0800
X-CSE-ConnectionGUID: gOsOaYzURdSHz9tYovD7Hw==
X-CSE-MsgGUID: iIbTCmsBSlqL2bsI5Zr0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107425746"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 15:41:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb6oj-000brb-0t;
	Thu, 23 Jan 2025 23:40:57 +0000
Date: Fri, 24 Jan 2025 07:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rdma-next 32/59] mm/hmm.c:713: warning: Function
 parameter or struct member 'p2pdma_state' not described in 'hmm_dma_map_pfn'
Message-ID: <202501240728.6Di5qGQN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   f0823ba427463da13d3f812de3efbebc2970858d
commit: 292b7a08c785856f350b6f4fad6b2a4dc1e5be13 [32/59] mm/hmm: provide generic DMA managing logic
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250124/202501240728.6Di5qGQN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240728.6Di5qGQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240728.6Di5qGQN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hmm.c:713: warning: Function parameter or struct member 'p2pdma_state' not described in 'hmm_dma_map_pfn'
>> mm/hmm.c:713: warning: Excess function parameter 'pci_p2pdma_map_state' description in 'hmm_dma_map_pfn'


vim +713 mm/hmm.c

   694	
   695	/**
   696	 * hmm_dma_map_pfn - Map a physical HMM page to DMA address
   697	 * @dev: Device to map the page for
   698	 * @map: HMM map
   699	 * @idx: Index into the PFN and dma address arrays
   700	 * @pci_p2pdma_map_state: PCI P2P state.
   701	 *
   702	 * dma_alloc_iova() allocates IOVA based on the size specified by their use in
   703	 * iova->size. Call this function after IOVA allocation to link whole @page
   704	 * to get the DMA address. Note that very first call to this function
   705	 * will have @offset set to 0 in the IOVA space allocated from
   706	 * dma_alloc_iova(). For subsequent calls to this function on same @iova,
   707	 * @offset needs to be advanced by the caller with the size of previous
   708	 * page that was linked + DMA address returned for the previous page that was
   709	 * linked by this function.
   710	 */
   711	dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
   712				   size_t idx, struct pci_p2pdma_map_state *p2pdma_state)
 > 713	{
   714		struct dma_iova_state *state = &map->state;
   715		dma_addr_t *dma_addrs = map->dma_list;
   716		unsigned long *pfns = map->pfn_list;
   717		struct page *page = hmm_pfn_to_page(pfns[idx]);
   718		phys_addr_t paddr = hmm_pfn_to_phys(pfns[idx]);
   719		size_t offset = idx * map->dma_entry_size;
   720		unsigned long attrs = 0;
   721		dma_addr_t dma_addr;
   722		int ret;
   723	
   724		if ((pfns[idx] & HMM_PFN_DMA_MAPPED) &&
   725		    !(pfns[idx] & HMM_PFN_P2PDMA_BUS)) {
   726			/*
   727			 * We are in this flow when there is a need to resync flags,
   728			 * for example when page was already linked in prefetch call
   729			 * with READ flag and now we need to add WRITE flag
   730			 *
   731			 * This page was already programmed to HW and we don't want/need
   732			 * to unlink and link it again just to resync flags.
   733			 */
   734			if (dma_use_iova(state))
   735				return state->addr + offset;
   736	
   737			/*
   738			 * Without dma_need_unmap, the dma_addrs array is NULL, thus we
   739			 * need to regenerate the address below even if there already
   740			 * was a mapping. But !dma_need_unmap implies that the
   741			 * mapping stateless, so this is fine.
   742			 */
   743			if (dma_need_unmap(dev))
   744				return dma_addrs[idx];
   745	
   746			/* Continue to remapping */
   747		}
   748	
   749		switch (pci_p2pdma_state(p2pdma_state, dev, page)) {
   750		case PCI_P2PDMA_MAP_NONE:
   751			break;
   752		case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
   753			attrs |= DMA_ATTR_SKIP_CPU_SYNC;
   754			pfns[idx] |= HMM_PFN_P2PDMA;
   755			break;
   756		case PCI_P2PDMA_MAP_BUS_ADDR:
   757			pfns[idx] |= HMM_PFN_P2PDMA_BUS | HMM_PFN_DMA_MAPPED;
   758			return pci_p2pdma_bus_addr_map(p2pdma_state, paddr);
   759		default:
   760			return DMA_MAPPING_ERROR;
   761		}
   762	
   763		if (dma_use_iova(state)) {
   764			ret = dma_iova_link(dev, state, paddr, offset,
   765					    map->dma_entry_size, DMA_BIDIRECTIONAL,
   766					    attrs);
   767			if (ret)
   768				goto error;
   769	
   770			ret = dma_iova_sync(dev, state, offset, map->dma_entry_size);
   771			if (ret) {
   772				dma_iova_unlink(dev, state, offset, map->dma_entry_size,
   773						DMA_BIDIRECTIONAL, attrs);
   774				goto error;
   775			}
   776	
   777			dma_addr = state->addr + offset;
   778		} else {
   779			if (WARN_ON_ONCE(dma_need_unmap(dev) && !dma_addrs))
   780				goto error;
   781	
   782			dma_addr = dma_map_page(dev, page, 0, map->dma_entry_size,
   783						DMA_BIDIRECTIONAL);
   784			if (dma_mapping_error(dev, dma_addr))
   785				goto error;
   786	
   787			if (dma_need_unmap(dev))
   788				dma_addrs[idx] = dma_addr;
   789		}
   790		pfns[idx] |= HMM_PFN_DMA_MAPPED;
   791		return dma_addr;
   792	error:
   793		pfns[idx] &= ~HMM_PFN_P2PDMA;
   794		return DMA_MAPPING_ERROR;
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
