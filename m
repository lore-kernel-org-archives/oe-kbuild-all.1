Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36E27D784
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758127131; cv=none; b=D05FDddYUCVKfZEBcPaunm6xYxT1P6aEk9l+RtP45Xg1V8f08XYLf0O72ICtuOvCt83NFSuKGTD8WoSBVJO7p9bpuIXVdBHibPcsaVFMv4R6jTF+bB02UBJ0PvTxUakyM+iREpWmX2tJ5d/pL1VJ2ZwBwwbLOX5vcFtC/LBBqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758127131; c=relaxed/simple;
	bh=3/7Pfy41d0JTZHY8MMX+0huMErR4lNu5siq7dzTKSK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/2/qhHDJmY68nPZpiZdQlBZ0Gjaiq50AVdIMbKxO6eR71aOn6oK8t0ArB8wAgOzAqP4lVsz5sQyXYD5sLPq9zaSNj0+Oyr4WF4Fgok9yYzZuGqW+v8D9gUATvqzXJIncv3YQh04FMX8PJbvqcgOk3aOEJBnRs9xgfv2F9WaeAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqIIqfWN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqIIqfWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758127129; x=1789663129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/7Pfy41d0JTZHY8MMX+0huMErR4lNu5siq7dzTKSK4=;
  b=lqIIqfWNlA+3c++3nI4SIOoADX76L56OLBQfvvJRzYO8FrHZ/rY6lOeq
   wb4ZPQ0KFgNbtLKiSeyDd3e58IClubF9RqJ9DEJrTrYObQYxkKdVBZXGE
   uz5w+wSc3G/ANIAlqGcYoB5auHg3jizREQWlVYkKqgGRFivdeoaPCANxT
   TU105L8HsIb9nzaQ5HmV5qUrfVf3diC+1mqyyoYtnNja38jNso9camjBw
   JQJpuL/u/qqx8EzJEw/Vs9M+eTV+MnUu1Rob7z8HI9m1Zl21dO/wPVTJN
   w/kUZMeEq8cAfOh8X9RpArd521h5nMMoDWu8MkPxk13+wxKNIEdrNo6j2
   g==;
X-CSE-ConnectionGUID: c7lM175XRd2Q62sAzaRjUg==
X-CSE-MsgGUID: LrH6KDZLQ2eSqCEwkUUvGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85881710"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="85881710"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 09:38:49 -0700
X-CSE-ConnectionGUID: 6lYTYC0qRoCx4vkcP7WanQ==
X-CSE-MsgGUID: CSUl5YAiTJazRfLB1p2BrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="179701787"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2025 09:38:47 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyvB7-0002DX-0s;
	Wed, 17 Sep 2025 16:38:45 +0000
Date: Thu, 18 Sep 2025 00:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 40/44] arch/sparc/mm/iommu.c:210:9: warning:
 assignment to 'long unsigned int' from 'void *' makes integer from pointer
 without a cast
Message-ID: <202509180015.Qlz009Ve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   57071a1a9f3f6f004dec73178d285c47dc503655
commit: cd9d1bc985fe78bf150400d89184d41054810e8e [40/44] sparc64: Use physical address DMA mapping
config: sparc-randconfig-001-20250917 (https://download.01.org/0day-ci/archive/20250918/202509180015.Qlz009Ve-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180015.Qlz009Ve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180015.Qlz009Ve-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/mm/iommu.c: In function '__sbus_iommu_map_phys':
>> arch/sparc/mm/iommu.c:210:9: warning: assignment to 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      vaddr = phys_to_virt(paddr);
            ^


vim +210 arch/sparc/mm/iommu.c

   183	
   184	static dma_addr_t __sbus_iommu_map_phys(struct device *dev, phys_addr_t paddr,
   185			size_t len, bool per_page_flush, unsigned long attrs)
   186	{
   187		struct iommu_struct *iommu = dev->archdata.iommu;
   188		unsigned long off = offset_in_page(paddr);
   189		unsigned long npages = (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
   190		unsigned long pfn = __phys_to_pfn(paddr);
   191		unsigned int busa, busa0;
   192		iopte_t *iopte, *iopte0;
   193		int ioptex, i;
   194	
   195		if (attrs & DMA_ATTR_MMIO)
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
