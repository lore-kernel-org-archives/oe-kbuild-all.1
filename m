Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313812E4A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 04:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713243405; cv=none; b=hp6aWgF8KNMofbV9Foba+JZv9BzQ45kh+ZfQenqsUZwMy0cGcRF7cVLKEGFfJsd1hN4llTErs0sUzAOJ7O2hn02raJInXZ0WnfgxEg35JbDPj6NIwykzx79TmjXL6TPcEL/lpG6lpZPrp+5gSfEV7cA2ItpUHAZUvqKDQmHc+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713243405; c=relaxed/simple;
	bh=CdehPQPrivY71lSUqVtGXO3S/r2cfwKehwytxUmoS+Q=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PBEFD5NIl8xYpoWXg43G3uFzSyMNSfjXwzvJRT5kpsjuQuyRFs7q2Y+Phh/D8nOCYWbkO2gpwv3nDbCFWrfO7FlWEizX+eP1REkX9JKX8sCB7sbrTmwQnZnJqME/1a4OQzQ1mRbc93igFnCCXjSDfTYp7ZKOFDpPHPQoT2QRR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdCYxPNt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdCYxPNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713243403; x=1744779403;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CdehPQPrivY71lSUqVtGXO3S/r2cfwKehwytxUmoS+Q=;
  b=gdCYxPNtS81aFKjoUqcDZ43HZVW/Fzf2WBSJ2DWe+dnImFQ7q6CtrZy9
   KacProLUJv6CyXEnnwTGgK165KKPJ9J2loJZ/66VV2Zq0Ts234RpU++XR
   3FeZsUBJs94pr4UqZrPWAIUnfdXo6wAmvu0EDD5ttHII5k7TojYgVn9Lu
   HVwD5Dpw8e5rGHuZY4zPI3f0hHg5qV3v4DbjCGcfQfqpsod12SPC32ieS
   pLMfumxqYj74JIWBW7OWuDqFdy1MSW6wI2Zbs8RZa/Jr2hQgGWhd1OK9b
   Sl/6HlAv5EfhiZJBmFfkrNxnP0IgwSsi7RSGVxzwtzFgR0hFtutGME4Ya
   g==;
X-CSE-ConnectionGUID: C4R2Q+swQXG6/lAv8RtgUQ==
X-CSE-MsgGUID: uLoYD/vJR1WBgyFAxxI+GQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19809382"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="19809382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 21:56:43 -0700
X-CSE-ConnectionGUID: tcG2/Ms9Rxixqs+HnW3rZg==
X-CSE-MsgGUID: tySIUhAVTj+Zv+VZeYKAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22206661"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Apr 2024 21:56:42 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwas4-0004xw-1R
	for oe-kbuild-all@lists.linux.dev;
	Tue, 16 Apr 2024 04:56:40 +0000
Date: Tue, 16 Apr 2024 12:56:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 12307/30000] kernel/dma/removed.c:146:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404161202.1Jpfjs9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   71b63f21a8292ca960a4c363d69d5e95c0265597
commit: c9a574054dbbc299aac39781a1d19a36fe0bc35a [12307/30000] ANDROID: GKI: drivers: Add dma removed ops
config: mips-randconfig-r133-20240406 (https://download.01.org/0day-ci/archive/20240416/202404161202.1Jpfjs9E-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404161202.1Jpfjs9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161202.1Jpfjs9E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/dma/removed.c:107:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void * @@
   kernel/dma/removed.c:107:30: sparse:     expected void [noderef] <asn:2> *addr
   kernel/dma/removed.c:107:30: sparse:     got void *
   kernel/dma/removed.c:119:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *[assigned] addr @@     got void * @@
   kernel/dma/removed.c:119:38: sparse:     expected void [noderef] <asn:2> *[assigned] addr
   kernel/dma/removed.c:119:38: sparse:     got void *
   kernel/dma/removed.c:127:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] <asn:2> *[assigned] addr @@
   kernel/dma/removed.c:127:16: sparse:     expected void *
   kernel/dma/removed.c:127:16: sparse:     got void [noderef] <asn:2> *[assigned] addr
   kernel/dma/removed.c:71:6: sparse: sparse: symbol 'removed_alloc' was not declared. Should it be static?
   kernel/dma/removed.c:131:5: sparse: sparse: symbol 'removed_mmap' was not declared. Should it be static?
>> kernel/dma/removed.c:146:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void *cpu_addr @@
   kernel/dma/removed.c:146:25: sparse:     expected void const volatile [noderef] <asn:2> *addr
   kernel/dma/removed.c:146:25: sparse:     got void *cpu_addr
   kernel/dma/removed.c:138:6: sparse: sparse: symbol 'removed_free' was not declared. Should it be static?
   kernel/dma/removed.c:187:6: sparse: sparse: symbol 'removed_sync_single_for_device' was not declared. Should it be static?
   kernel/dma/removed.c:193:6: sparse: sparse: symbol 'removed_sync_sg_for_cpu' was not declared. Should it be static?
   kernel/dma/removed.c:199:6: sparse: sparse: symbol 'removed_sync_sg_for_device' was not declared. Should it be static?
>> kernel/dma/removed.c:213:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void *remapped_address @@
   kernel/dma/removed.c:213:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   kernel/dma/removed.c:213:17: sparse:     got void *remapped_address
   kernel/dma/removed.c:211:6: sparse: sparse: symbol 'removed_unremap' was not declared. Should it be static?
   kernel/dma/removed.c:228:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *( *remap )( ... ) @@     got void [noderef] <asn:2> *( * )( ... ) @@
   kernel/dma/removed.c:228:35: sparse:     expected void *( *remap )( ... )
   kernel/dma/removed.c:228:35: sparse:     got void [noderef] <asn:2> *( * )( ... )
   kernel/dma/removed.c:71:7: warning: no previous prototype for 'removed_alloc' [-Wmissing-prototypes]
      71 | void *removed_alloc(struct device *dev, size_t size, dma_addr_t *handle,
         |       ^~~~~~~~~~~~~
   kernel/dma/removed.c:131:5: warning: no previous prototype for 'removed_mmap' [-Wmissing-prototypes]
     131 | int removed_mmap(struct device *dev, struct vm_area_struct *vma,
         |     ^~~~~~~~~~~~
   kernel/dma/removed.c:138:6: warning: no previous prototype for 'removed_free' [-Wmissing-prototypes]
     138 | void removed_free(struct device *dev, size_t size, void *cpu_addr,
         |      ^~~~~~~~~~~~
   kernel/dma/removed.c:187:6: warning: no previous prototype for 'removed_sync_single_for_device' [-Wmissing-prototypes]
     187 | void removed_sync_single_for_device(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/removed.c:193:6: warning: no previous prototype for 'removed_sync_sg_for_cpu' [-Wmissing-prototypes]
     193 | void removed_sync_sg_for_cpu(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/removed.c:199:6: warning: no previous prototype for 'removed_sync_sg_for_device' [-Wmissing-prototypes]
     199 | void removed_sync_sg_for_device(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/removed.c:211:6: warning: no previous prototype for 'removed_unremap' [-Wmissing-prototypes]
     211 | void removed_unremap(struct device *dev, void *remapped_address, size_t size)
         |      ^~~~~~~~~~~~~~~
   kernel/dma/removed.c:61:12: warning: 'dma_assign_removed_region' defined but not used [-Wunused-function]
      61 | static int dma_assign_removed_region(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/removed.c:33:12: warning: 'dma_init_removed_memory' defined but not used [-Wunused-function]
      33 | static int dma_init_removed_memory(phys_addr_t phys_addr, size_t size,
         |            ^~~~~~~~~~~~~~~~~~~~~~~

vim +146 kernel/dma/removed.c

   137	
   138	void removed_free(struct device *dev, size_t size, void *cpu_addr,
   139			  dma_addr_t handle, unsigned long attrs)
   140	{
   141		bool no_kernel_mapping = attrs & DMA_ATTR_NO_KERNEL_MAPPING;
   142		struct removed_region *dma_mem = dev->removed_mem;
   143	
   144		size = PAGE_ALIGN(size);
   145		if (!no_kernel_mapping)
 > 146			iounmap(cpu_addr);
   147		mutex_lock(&dma_mem->lock);
   148		bitmap_clear(dma_mem->bitmap, (handle - dma_mem->base) >> PAGE_SHIFT,
   149					size >> PAGE_SHIFT);
   150		mutex_unlock(&dma_mem->lock);
   151	}
   152	
   153	static dma_addr_t removed_map_page(struct device *dev, struct page *page,
   154				unsigned long offset, size_t size,
   155				enum dma_data_direction dir,
   156				unsigned long attrs)
   157	{
   158		return ~(dma_addr_t)0;
   159	}
   160	
   161	static void removed_unmap_page(struct device *dev, dma_addr_t dma_handle,
   162			size_t size, enum dma_data_direction dir,
   163			unsigned long attrs)
   164	{
   165	}
   166	
   167	static int removed_map_sg(struct device *dev, struct scatterlist *sg,
   168				int nents, enum dma_data_direction dir,
   169				unsigned long attrs)
   170	{
   171		return 0;
   172	}
   173	
   174	static void removed_unmap_sg(struct device *dev,
   175				struct scatterlist *sg, int nents,
   176				enum dma_data_direction dir,
   177				unsigned long attrs)
   178	{
   179	}
   180	
   181	static void removed_sync_single_for_cpu(struct device *dev,
   182				dma_addr_t dma_handle, size_t size,
   183				enum dma_data_direction dir)
   184	{
   185	}
   186	
   187	void removed_sync_single_for_device(struct device *dev,
   188				dma_addr_t dma_handle, size_t size,
   189				enum dma_data_direction dir)
   190	{
   191	}
   192	
   193	void removed_sync_sg_for_cpu(struct device *dev,
   194				struct scatterlist *sg, int nents,
   195				enum dma_data_direction dir)
   196	{
   197	}
   198	
   199	void removed_sync_sg_for_device(struct device *dev,
   200				struct scatterlist *sg, int nents,
   201				enum dma_data_direction dir)
   202	{
   203	}
   204	
   205	static void __iomem *removed_remap(struct device *dev, void *cpu_addr,
   206				dma_addr_t handle, size_t size, unsigned long attrs)
   207	{
   208		return ioremap_wc(handle, size);
   209	}
   210	
   211	void removed_unremap(struct device *dev, void *remapped_address, size_t size)
   212	{
 > 213		iounmap(remapped_address);
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
