Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC9117DFE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758070825; cv=none; b=jbzbGTGi0H6OiJzCobqeYibxPPmBl1Ni8BCeRVHDIXDU94y6Mv8B/HdVhbsIezOb1TqNunQmeqBe5oiv/49WLEXEdT/Obv00WSkpMW7iMIHWKmTb0CNLBQwxV14oKiLp3wkOk9mt8cUoqUECO5Ry3b+wUjtgY5a5TpnPKQsaTGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758070825; c=relaxed/simple;
	bh=VrW1hNA6E4LigLMvdmAKfdp/yKrlQMMD92UP+LvmNQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdmbCfEP3ez0FwaGOyxIcn4HSQ4cmNngtgDAcWn+ry5fj4pD6J820gXLPZ7V0uVPLVYcsXjfqla7+uocurw+w9YUaf5/JuwlqTouBl+iQpCo3X/n73s1lxTyTKrBrEBed1rr66sQrQnPfrhogT6IKu0RqRQIydKFKp6q6yXkZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7bT46/T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7bT46/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758070824; x=1789606824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VrW1hNA6E4LigLMvdmAKfdp/yKrlQMMD92UP+LvmNQY=;
  b=Q7bT46/TassYoY7XO26d7A+D3nf6UpqVTnbXaKiiKZXJL+SSZ3jYjtQJ
   kJqwKCAUR9mtFn1iEj2CquVHjXoJe25c2gi+lOoIU0E9aDRNwrsQ3Ys9G
   9/aWTQQ4aB+12iTx5Lni+nF5aRMaeYkcC+L6NaYfmciI9r/fPUSWGH3vI
   GCOfOqGmk+e53coyRVHO2DRzfBBjLjFa3kKlnM9IguC4DwaWgudlDoEXa
   h1LqQBO4597PtCiaqmP71BKi5qXtgS8X7SxMDhpqGqVAORbtXS+9nyCyl
   DGds1Fb9wO5rMCYgcpF4jptOLuj4nbtA9C1UHxzXhWcl2fa/N1DF6N+3C
   w==;
X-CSE-ConnectionGUID: OJW2iAnWQE2ty0ejuHefcw==
X-CSE-MsgGUID: /BULP9RSQaaqW3cehShpVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="85805917"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="85805917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:00:22 -0700
X-CSE-ConnectionGUID: O9gZHci4SzmmkvSCLzR0Vg==
X-CSE-MsgGUID: /c9MAlMlTyO25Svxuxr12g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="174659743"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2025 18:00:21 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uygWv-0000vT-3D;
	Wed, 17 Sep 2025 01:00:17 +0000
Date: Wed, 17 Sep 2025 09:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 31/42] arch/arm/mm/dma-mapping.c:1376:28:
 error: 'phys_addr' undeclared; did you mean 'phys_addr_t'?
Message-ID: <202509170821.3aryKoai-lkp@intel.com>
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
commit: 8e58db0b31a976a7da6f056372a43e17fc413639 [31/42] ARM: dma-mapping: Switch to physical address mapping callbacks
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250917/202509170821.3aryKoai-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170821.3aryKoai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170821.3aryKoai-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mm/dma-mapping.c: In function 'arm_iommu_map_phys':
>> arch/arm/mm/dma-mapping.c:1376:28: error: 'phys_addr' undeclared (first use in this function); did you mean 'phys_addr_t'?
    1376 |         phys_addr_t addr = phys_addr & PAGE_MASK;
         |                            ^~~~~~~~~
         |                            phys_addr_t
   arch/arm/mm/dma-mapping.c:1376:28: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm/mm/dma-mapping.c:1382:59: error: 'offset' undeclared (first use in this function); did you mean 'off_t'?
    1382 |                 __dma_page_cpu_to_dev(phys_to_page(phys), offset, size, dir);
         |                                                           ^~~~~~
         |                                                           off_t


vim +1376 arch/arm/mm/dma-mapping.c

  1360	
  1361	/**
  1362	 * arm_iommu_map_phys
  1363	 * @dev: valid struct device pointer
  1364	 * @phys: physical address that buffer resides in
  1365	 * @size: size of buffer to map
  1366	 * @dir: DMA transfer direction
  1367	 * @attrs: DMA mapping attributes
  1368	 *
  1369	 * IOMMU aware version of arm_dma_map_page()
  1370	 */
  1371	static dma_addr_t arm_iommu_map_phys(struct device *dev, phys_addr_t phys,
  1372		     size_t size, enum dma_data_direction dir, unsigned long attrs)
  1373	{
  1374		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
  1375		int len = PAGE_ALIGN(size + offset_in_page(phys));
> 1376		phys_addr_t addr = phys_addr & PAGE_MASK;
  1377		dma_addr_t dma_addr;
  1378		int ret, prot;
  1379	
  1380		if (!dev->dma_coherent &&
  1381		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
> 1382			__dma_page_cpu_to_dev(phys_to_page(phys), offset, size, dir);
  1383	
  1384		dma_addr = __alloc_iova(mapping, len);
  1385		if (dma_addr == DMA_MAPPING_ERROR)
  1386			return dma_addr;
  1387	
  1388		prot = __dma_info_to_prot(dir, attrs);
  1389	
  1390		ret = iommu_map(mapping->domain, dma_addr, addr, len, prot, GFP_KERNEL);
  1391		if (ret < 0)
  1392			goto fail;
  1393	
  1394		return dma_addr + offset;
  1395	fail:
  1396		__free_iova(mapping, dma_addr, len);
  1397		return DMA_MAPPING_ERROR;
  1398	}
  1399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
