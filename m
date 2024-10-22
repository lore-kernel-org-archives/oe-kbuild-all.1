Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB9377111
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729556703; cv=none; b=stG8+Nhj7y6HCFBOiY6P2yw5Epyta+NRdi91JMfLj6Gp2SFwguBV2AlV7MQa5/Y1J7My/dXUISd7egPQiA/3qgPf6LAfuUyeEFZlmPVlcEd2aRyPonwES3cB3k1nzTygCymZg0GWXt87O3qslOo8YnA+PZiAGYTWMQhViVkAkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729556703; c=relaxed/simple;
	bh=3cOzTuu3Z0fS1MMmJ2H31i3sQhNW9Ynbt7xdLbyVJB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojA8qnQ6ZYjENRyBUy+QdKxzAw9lSpr64qMRciiJyfjEwTGL8cL2mbSanVTn2HSd+AdzNuboNLHJPZYHr42x21wMcVe1+U7lrbxYYYX2flYM87dRX/M089RVahiXJpb3/dfN9gVUJmbUWKUcDAb2KqtWm99EcnoLt4g8ybDHKoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khpQFmsk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khpQFmsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729556702; x=1761092702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3cOzTuu3Z0fS1MMmJ2H31i3sQhNW9Ynbt7xdLbyVJB4=;
  b=khpQFmskHFR6WH1nqYGSIwKnpIl6AlGEDsGhDqRki8rldUhzJ5Ae8Wxu
   mFlVv1wRjO048MEaj0uuSwizoihTZyZYfrDL6oUsktHONz/uwlr8afuid
   LyRrq67wtb0rCTZd6TlCMVMY1bkHzTLKtlDnZNwtIzR5YhwbLxLFVK9Ql
   y45/9+MtY732V/jNgK7qWEIqJTXq3wD6ITUdlyOUjVQh64C6ATa6pNDEy
   GNDU3/Z2N7FBeh6Ih865OQq4QDPa+dzlXs68gdCTrorOy+ByGXXY/i2xC
   6xPEwhZNMo1qKQ2uRNsD+tGcyNL0Ijb6QQaDSYN8Hd6H7sLp1WaGutIRs
   g==;
X-CSE-ConnectionGUID: B3k4WULbTCe/KK75/YRcZg==
X-CSE-MsgGUID: iEpyEXbgTK+dVb5sjS/eGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46535623"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46535623"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 17:25:01 -0700
X-CSE-ConnectionGUID: mdB2ohHOSYaI9ZFL/oSmsw==
X-CSE-MsgGUID: i+dDgrNUT/CQ/kRYHVUv8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79771904"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 17:24:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t32hl-000SoW-1f;
	Tue, 22 Oct 2024 00:24:57 +0000
Date: Tue, 22 Oct 2024 08:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rdma-next 35/48] mm/hmm.c:672:1: warning: label 'out'
 defined but not used
Message-ID: <202410220841.p1Rv4P8w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   859f601251f808a6c69644e46160abb68d436aa0
commit: fba365ff43629dcda22c75471c9ddc50d938c846 [35/48] mm/hmm: provide callbacks to map/unmap HMM PFNs
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241022/202410220841.p1Rv4P8w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220841.p1Rv4P8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220841.p1Rv4P8w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_dma_map_pfn':
>> mm/hmm.c:672:1: warning: label 'out' defined but not used [-Wunused-label]
     672 | out:
         | ^~~


vim +/out +672 mm/hmm.c

   618	
   619	/**
   620	 * hmm_dma_map_pfn - Map a physical HMM page to DMA address
   621	 * @dev: Device to map the page for
   622	 * @state: IOVA state
   623	 * @pfn: HMM PFN
   624	 * @offset: IOVA offset to which this page needs to be linked
   625	 * @addr: DMA address in case it is not IOVA path
   626	 *
   627	 * dma_alloc_iova() allocates IOVA based on the size specified by their use in
   628	 * iova->size. Call this function after IOVA allocation to link whole @page
   629	 * to get the DMA address. Note that very first call to this function
   630	 * will have @offset set to 0 in the IOVA space allocated from
   631	 * dma_alloc_iova(). For subsequent calls to this function on same @iova,
   632	 * @offset needs to be advanced by the caller with the size of previous
   633	 * page that was linked + DMA address returned for the previous page that was
   634	 * linked by this function.
   635	 */
   636	dma_addr_t hmm_dma_map_pfn(struct device *dev, struct dma_iova_state *state,
   637				   unsigned long *pfn, size_t offset, dma_addr_t addr)
   638	{
   639		dma_addr_t dma_addr;
   640		int ret;
   641	
   642		if (*pfn & HMM_PFN_DMA_MAPPED) {
   643			/*
   644			 * We are in this flow when there is a need to resync flags,
   645			 * for example when page was already linked in prefetch call
   646			 * with READ flag and now we need to add WRITE flag
   647			 *
   648			 * This page was already programmed to HW and we don't want/need
   649			 * to unlink and link it again just to resync flags.
   650			 */
   651			if (dma_can_use_iova(state))
   652				return state->addr + offset;
   653	
   654			WARN_ON_ONCE(addr == DMA_MAPPING_ERROR);
   655			return addr;
   656		}
   657	
   658		if (dma_can_use_iova(state)) {
   659			ret = dma_iova_link(dev, state, hmm_pfn_to_phys(*pfn), offset,
   660					    PAGE_SIZE, DMA_BIDIRECTIONAL, 0);
   661			if (ret)
   662				return DMA_MAPPING_ERROR;
   663	
   664			dma_addr = state->addr + offset;
   665		} else {
   666			dma_addr = dma_map_page(dev, hmm_pfn_to_page(*pfn), 0,
   667						PAGE_SIZE, DMA_BIDIRECTIONAL);
   668			if (dma_mapping_error(dev, dma_addr))
   669				return DMA_MAPPING_ERROR;
   670		}
   671	
 > 672	out:
   673		*pfn |= HMM_PFN_DMA_MAPPED;
   674		return dma_addr;
   675	}
   676	EXPORT_SYMBOL_GPL(hmm_dma_map_pfn);
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
