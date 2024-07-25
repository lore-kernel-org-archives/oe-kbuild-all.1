Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6250D13E05F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721948668; cv=none; b=k/WRq6fJvfRR16F1EaidsfufsrUfhaUeXkIFIAhGrRqx8Sb2lXRxnfxXN0UZMCcOc8PdhZrpHEEJX7FVFI6AL3ws79Ssk88EsjeEEl9fTTkmZvCOHCmO8yGWJlo8a8i72XnpFmDfIYlIa/TNBNtdSTuoPM5PaTbvoPyGOwGZiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721948668; c=relaxed/simple;
	bh=4CI2IJGXgjkyNq8gzLaMMdpLra6KZHchCuidiJ8ylWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pzs9wyZUBf5J3CeerNokWyjNFEV7bj0LDEcZMNVhBX6U8bjfqbS8BySMnag9QR7th0oRNVDAe9ei2aWFHljggGEr6YgUgBmf8N0Xos2yY88RP36lDk6QPVJlbAX09JYr8JHDtMJozDfiAvcyKL5oN326FCjGLHgK6FEKB9FFReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0hQiJxr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0hQiJxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721948667; x=1753484667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CI2IJGXgjkyNq8gzLaMMdpLra6KZHchCuidiJ8ylWQ=;
  b=U0hQiJxrb9Wap4KCJPogccba/q+C+XDhN9YGmjRS0RmUXG1LvcihR5k0
   uql2xtrHdIOcZl1E2Z7djU6qCf7fowhHR+BaWyGGdyFCGxZnZf9cLRmy6
   5iP0i+rFDeMGVKrIRmA4V6rgrje13AlNmAK1x33yHDLCCE4ZKNBWiFhwK
   bwWclvyseVTPBVAJmDp3UsduWTcw8qouD7ib2N3vcgqyu/JZh+bxxy9Ym
   liP+a/SirHo1GuonnJAp6CYuITCCS4SIdG3cBE3xcWHeRaKYzpn42ZzHN
   pgeuSKH16w4RHphDAoT8zfyU8c5skfFRLlY3b52IX9QT5QZ0VNfg1OuUp
   A==;
X-CSE-ConnectionGUID: B5VPVCdgQrWqXL5pOIxJHg==
X-CSE-MsgGUID: IFD38jEiRGe4JQyi99GxoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19569598"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="19569598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 16:04:26 -0700
X-CSE-ConnectionGUID: Umk0Qh98T5KL4kDsZIv7Rg==
X-CSE-MsgGUID: 72LhTDF4RSS9p+2hgw260w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="53691886"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jul 2024 16:04:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX7VW-000oX6-1N;
	Thu, 25 Jul 2024 23:04:22 +0000
Date: Fri, 26 Jul 2024 07:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v2 17/23] include/linux/iommu-dma.h:75:16:
 error: 'DMA_MAPPING_ERROR' undeclared
Message-ID: <202407260604.TgOKifGh-lkp@intel.com>
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
commit: b377bab12d9b3533f99ffbe852eaba6cdded196d [17/23] RDMA/umem: Prevent UMEM ODP creation with SWIOTLB
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240726/202407260604.TgOKifGh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407260604.TgOKifGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260604.TgOKifGh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/core/umem_odp.c:45:
   include/linux/iommu-dma.h: In function 'iommu_dma_map_page':
>> include/linux/iommu-dma.h:75:16: error: 'DMA_MAPPING_ERROR' undeclared (first use in this function)
      75 |         return DMA_MAPPING_ERROR;
         |                ^~~~~~~~~~~~~~~~~
   include/linux/iommu-dma.h:75:16: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/iommu-dma.h: In function 'iommu_dma_map_resource':
   include/linux/iommu-dma.h:136:16: error: 'DMA_MAPPING_ERROR' undeclared (first use in this function)
     136 |         return DMA_MAPPING_ERROR;
         |                ^~~~~~~~~~~~~~~~~
   include/linux/iommu-dma.h: In function 'iommu_dma_alloc_iova':
   include/linux/iommu-dma.h:182:16: error: 'DMA_MAPPING_ERROR' undeclared (first use in this function)
     182 |         return DMA_MAPPING_ERROR;
         |                ^~~~~~~~~~~~~~~~~


vim +/DMA_MAPPING_ERROR +75 include/linux/iommu-dma.h

01383b9db929a6 Leon Romanovsky 2024-07-08  12  
01383b9db929a6 Leon Romanovsky 2024-07-08  13  #ifdef CONFIG_IOMMU_DMA
01383b9db929a6 Leon Romanovsky 2024-07-08  14  dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
01383b9db929a6 Leon Romanovsky 2024-07-08  15  			      unsigned long offset, size_t size,
01383b9db929a6 Leon Romanovsky 2024-07-08  16  			      enum dma_data_direction dir, unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  17  void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
01383b9db929a6 Leon Romanovsky 2024-07-08  18  			  size_t size, enum dma_data_direction dir,
01383b9db929a6 Leon Romanovsky 2024-07-08  19  			  unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  20  int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
01383b9db929a6 Leon Romanovsky 2024-07-08  21  		     enum dma_data_direction dir, unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  22  void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
01383b9db929a6 Leon Romanovsky 2024-07-08  23  			enum dma_data_direction dir, unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  24  void *iommu_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
01383b9db929a6 Leon Romanovsky 2024-07-08  25  		      gfp_t gfp, unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  26  int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
01383b9db929a6 Leon Romanovsky 2024-07-08  27  		   void *cpu_addr, dma_addr_t dma_addr,
01383b9db929a6 Leon Romanovsky 2024-07-08  28  		   size_t size, unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  29  int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
01383b9db929a6 Leon Romanovsky 2024-07-08  30  			  void *cpu_addr, dma_addr_t dma_addr, size_t size,
01383b9db929a6 Leon Romanovsky 2024-07-08  31  			  unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  32  unsigned long iommu_dma_get_merge_boundary(struct device *dev);
01383b9db929a6 Leon Romanovsky 2024-07-08  33  size_t iommu_dma_opt_mapping_size(void);
01383b9db929a6 Leon Romanovsky 2024-07-08  34  size_t iommu_dma_max_mapping_size(struct device *dev);
01383b9db929a6 Leon Romanovsky 2024-07-08  35  void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
01383b9db929a6 Leon Romanovsky 2024-07-08  36  		    dma_addr_t handle, unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  37  dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
01383b9db929a6 Leon Romanovsky 2024-07-08  38  				  size_t size, enum dma_data_direction dir,
01383b9db929a6 Leon Romanovsky 2024-07-08  39  				  unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  40  void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
01383b9db929a6 Leon Romanovsky 2024-07-08  41  			      size_t size, enum dma_data_direction dir,
01383b9db929a6 Leon Romanovsky 2024-07-08  42  			      unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  43  struct sg_table *iommu_dma_alloc_noncontiguous(struct device *dev, size_t size,
01383b9db929a6 Leon Romanovsky 2024-07-08  44  					       enum dma_data_direction dir,
01383b9db929a6 Leon Romanovsky 2024-07-08  45  					       gfp_t gfp, unsigned long attrs);
01383b9db929a6 Leon Romanovsky 2024-07-08  46  void iommu_dma_free_noncontiguous(struct device *dev, size_t size,
01383b9db929a6 Leon Romanovsky 2024-07-08  47  				  struct sg_table *sgt,
01383b9db929a6 Leon Romanovsky 2024-07-08  48  				  enum dma_data_direction dir);
01383b9db929a6 Leon Romanovsky 2024-07-08  49  void iommu_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
01383b9db929a6 Leon Romanovsky 2024-07-08  50  				   size_t size, enum dma_data_direction dir);
01383b9db929a6 Leon Romanovsky 2024-07-08  51  void iommu_dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle,
01383b9db929a6 Leon Romanovsky 2024-07-08  52  				      size_t size, enum dma_data_direction dir);
01383b9db929a6 Leon Romanovsky 2024-07-08  53  void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
01383b9db929a6 Leon Romanovsky 2024-07-08  54  			       int nelems, enum dma_data_direction dir);
01383b9db929a6 Leon Romanovsky 2024-07-08  55  void iommu_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
01383b9db929a6 Leon Romanovsky 2024-07-08  56  				  int nelems, enum dma_data_direction dir);
1ff837e186d1fb Leon Romanovsky 2023-10-29  57  dma_addr_t iommu_dma_alloc_iova(struct device *dev, size_t size);
1ff837e186d1fb Leon Romanovsky 2023-10-29  58  void iommu_dma_free_iova(struct device *dev, dma_addr_t iova, size_t size);
71d04fe28663f4 Leon Romanovsky 2023-10-30  59  int iommu_dma_start_range(struct device *dev);
71d04fe28663f4 Leon Romanovsky 2023-10-30  60  void iommu_dma_end_range(struct device *dev);
71d04fe28663f4 Leon Romanovsky 2023-10-30  61  int iommu_dma_link_range(struct device *dev, phys_addr_t phys, dma_addr_t addr,
71d04fe28663f4 Leon Romanovsky 2023-10-30  62  			 size_t size, enum dma_data_direction dir,
71d04fe28663f4 Leon Romanovsky 2023-10-30  63  			 unsigned long attrs);
71d04fe28663f4 Leon Romanovsky 2023-10-30  64  void iommu_dma_unlink_range(struct device *dev, dma_addr_t start, size_t size,
71d04fe28663f4 Leon Romanovsky 2023-10-30  65  			    enum dma_data_direction dir, unsigned long attrs);
5d7d3730d83d48 Leon Romanovsky 2024-07-18  66  bool iommu_can_use_iova(struct device *dev, struct page *page, size_t size,
5d7d3730d83d48 Leon Romanovsky 2024-07-18  67  			enum dma_data_direction dir);
01383b9db929a6 Leon Romanovsky 2024-07-08  68  #else
01383b9db929a6 Leon Romanovsky 2024-07-08  69  static inline dma_addr_t iommu_dma_map_page(struct device *dev,
01383b9db929a6 Leon Romanovsky 2024-07-08  70  					    struct page *page,
01383b9db929a6 Leon Romanovsky 2024-07-08  71  					    unsigned long offset, size_t size,
01383b9db929a6 Leon Romanovsky 2024-07-08  72  					    enum dma_data_direction dir,
01383b9db929a6 Leon Romanovsky 2024-07-08  73  					    unsigned long attrs)
01383b9db929a6 Leon Romanovsky 2024-07-08  74  {
01383b9db929a6 Leon Romanovsky 2024-07-08 @75  	return DMA_MAPPING_ERROR;

:::::: The code at line 75 was first introduced by commit
:::::: 01383b9db929a6617cd4fb023ad3b0667501e46b dma: add IOMMU static calls with clear default ops

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
