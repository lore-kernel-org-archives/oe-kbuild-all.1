Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78A619E83C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 01:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758070828; cv=none; b=juCq85AURVDcvKJ4ESBJlXNmE48XFoMFqRpsXXz23QqhsmVgNC8Jds1SJyIetQXplqWshz/TtuGbO03xlhtIOjIHwtOAWWfJnmnp56mJ6EX/SQ0QIjkmkIRW4+rvR2L/ADs0qQkAMTKw7sLPOhDpMviRdsRgQxpZALkxwyBKLPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758070828; c=relaxed/simple;
	bh=W+BGnre+YDIAAMhJjZ49O+YTnrCbegGFGVO5kNrube4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTw/k+VBKc5Zx4Z6uh6c41bh5tAT+PEc8qr7CdM+nBBfjJVW6MunLtbx3v+Hj4h1gGBo3oUJ4J84dDdG6TClEX+xrHtl75jpEVZMDFEpIqOIGuea67i0YDtu9MDROj3LTCVDZVXxp/vXZ93ApKoRJsmN7ccOeW4+vFUH5Zhbk64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=An7wPtjc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="An7wPtjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758070826; x=1789606826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+BGnre+YDIAAMhJjZ49O+YTnrCbegGFGVO5kNrube4=;
  b=An7wPtjcjMjvHlPO68NtmRUsKvd4c5t3i9VGGHXcrr91/j6tTTEMrMwG
   g4wyCtplJGCc4nxjDe3QYaxmrOSAQ9m/diz9Le7mVxYvo5t4gbt3wkREl
   +FLDhKHmPzElPbvW5+OjrU/Ut2Ytnn/xvZlu+wxqEk2UYbbJ6PMrRdtSm
   /0DDeE2XAtNjGXLhSuBrZL+arJ2oy2DGOw7ZgSuXwJ21CG0kr5UJVLWZz
   9R9EAri+HQinY4iiVq7ASxIPUk6w2ANWw814zJLYHlAOcEpZJ0fiNK2uL
   8yRmC3uUXSIcwzt2Cqg7YD8ccnx8HlHGxJV9rTeyVZdWw0jL0TFCqRBXg
   g==;
X-CSE-ConnectionGUID: 781XZXiJRsaL+tF8G5gAyA==
X-CSE-MsgGUID: 5SzQ+2EFQeaBH3xkEYDmxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="85805918"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="85805918"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:00:22 -0700
X-CSE-ConnectionGUID: vdMyQDUGQAiOXIYTReMXlQ==
X-CSE-MsgGUID: 6kU9FEZwT/WT8f4D9bALCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="174659744"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2025 18:00:21 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uygWw-0000vV-02;
	Wed, 17 Sep 2025 01:00:18 +0000
Date: Wed, 17 Sep 2025 09:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 38/42] arch/sparc/mm/iommu.c:195:13: error:
 'attrs' undeclared
Message-ID: <202509170848.fBGiFykQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   887b59804850b679831fda6eba707cc1b1b077e0
commit: ea58d5c1de6355a98e58cad814b5f77271e9032e [38/42] sparc64: Use physical address DMA mapping
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20250917/202509170848.fBGiFykQ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170848.fBGiFykQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170848.fBGiFykQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/mm/iommu.c: In function '__sbus_iommu_map_phys':
>> arch/sparc/mm/iommu.c:195:13: error: 'attrs' undeclared (first use in this function)
     195 |         if (attrs & DMA_ATTR_MMIO)
         |             ^~~~~
   arch/sparc/mm/iommu.c:195:13: note: each undeclared identifier is reported only once for each function it appears in
>> arch/sparc/mm/iommu.c:210:23: error: assignment to 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     210 |                 vaddr = phys_to_virt(paddr);
         |                       ^


vim +/attrs +195 arch/sparc/mm/iommu.c

   183	
   184	static dma_addr_t __sbus_iommu_map_phys(struct device *dev, phys_addr_t paddr,
   185			size_t len, bool per_page_flush)
   186	{
   187		struct iommu_struct *iommu = dev->archdata.iommu;
   188		unsigned long off = offset_in_page(paddr);
   189		unsigned long npages = (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
   190		unsigned long pfn = __phys_to_pfn(paddr);
   191		unsigned int busa, busa0;
   192		iopte_t *iopte, *iopte0;
   193		int ioptex, i;
   194	
 > 195		if (attrs & DMA_ATTR_MMIO)
   196			return DMA_MAPPING_ERROR;
   197	
   198		/* XXX So what is maxphys for us and how do drivers know it? */
   199		if (!len || len > 256 * 1024)
   200			return DMA_MAPPING_ERROR;
   201	
   202		/*
   203		 * We expect unmapped highmem pages to be not in the cache.
   204		 * XXX Is this a good assumption?
   205		 * XXX What if someone else unmaps it here and races us?
   206		 */
   207		if (per_page_flush && !PhysHighMem(paddr)) {
   208			unsigned long vaddr, p;
   209	
 > 210			vaddr = phys_to_virt(paddr);
   211			for (p = vaddr & PAGE_MASK; p < vaddr + len; p += PAGE_SIZE)
   212				flush_page_for_dma(p);
   213		}
   214	
   215		/* page color = pfn of page */
   216		ioptex = bit_map_string_get(&iommu->usemap, npages, pfn);
   217		if (ioptex < 0)
   218			panic("iommu out");
   219		busa0 = iommu->start + (ioptex << PAGE_SHIFT);
   220		iopte0 = &iommu->page_table[ioptex];
   221	
   222		busa = busa0;
   223		iopte = iopte0;
   224		for (i = 0; i < npages; i++) {
   225			iopte_val(*iopte) = MKIOPTE(pfn, IOPERM);
   226			iommu_invalidate_page(iommu->regs, busa);
   227			busa += PAGE_SIZE;
   228			iopte++;
   229			pfn++;
   230		}
   231	
   232		iommu_flush_iotlb(iopte0, npages);
   233		return busa0 + off;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
