Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE517F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 05:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guFTYk1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702186284; x=1733722284;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/et48asKp74h3zJiv1JSiMibmejI9/AruJWjyN7fAaY=;
  b=guFTYk1dBKlXfGQ+4Pb9MkCJWPXKoigA61ieuJBw0FL5IJVNY7sRBi92
   HFvwc4oRN0j0pufuWJ0cKXlAuDaTozoEL1L22ld1k+0/dblxXdxJyzPXC
   +rT9oy2BEuugNgnwWw8FZkf54bbGlpecCVTptjddVfxWvG6VhtL0JI3Do
   XCQC+5H1SUY6x2TZHanuwBLs1QVdolVFDKCQC0aGG+cHzAvEn96md4JGU
   Wpd9yoy5xBJxzmyxekFBOMaDFh4U6og1diFcd0xNXEzRpWMtpIm0h16Lv
   +CHZueW5eqgijpMajFMRbbsnVrbJJAy1mZf5C63Zvc6CeDsbE1ame20pL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="391708944"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="391708944"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 21:31:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="945854149"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="945854149"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Dec 2023 21:31:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCCPQ-000GR1-1z
	for oe-kbuild-all@lists.linux.dev;
	Sun, 10 Dec 2023 05:31:20 +0000
Date: Sun, 10 Dec 2023 13:31:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 12784/30000] kernel/dma/removed.c:107:30:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202312101332.3eRGgwv3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   a45f8ae6659a25c2743eb4a9bc5ee7954a00d784
commit: c9a574054dbbc299aac39781a1d19a36fe0bc35a [12784/30000] ANDROID: GKI: drivers: Add dma removed ops
config: i386-randconfig-062-20231209 (https://download.01.org/0day-ci/archive/20231210/202312101332.3eRGgwv3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101332.3eRGgwv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101332.3eRGgwv3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/dma/removed.c:107:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   kernel/dma/removed.c:107:30: sparse:     expected void [noderef] __iomem *addr
   kernel/dma/removed.c:107:30: sparse:     got void *
>> kernel/dma/removed.c:119:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *[assigned] addr @@     got void * @@
   kernel/dma/removed.c:119:38: sparse:     expected void [noderef] __iomem *[assigned] addr
   kernel/dma/removed.c:119:38: sparse:     got void *
>> kernel/dma/removed.c:127:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem *[assigned] addr @@
   kernel/dma/removed.c:127:16: sparse:     expected void *
   kernel/dma/removed.c:127:16: sparse:     got void [noderef] __iomem *[assigned] addr
   kernel/dma/removed.c:71:6: sparse: sparse: symbol 'removed_alloc' was not declared. Should it be static?
   kernel/dma/removed.c:131:5: sparse: sparse: symbol 'removed_mmap' was not declared. Should it be static?
>> kernel/dma/removed.c:146:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *cpu_addr @@
   kernel/dma/removed.c:146:25: sparse:     expected void volatile [noderef] __iomem *addr
   kernel/dma/removed.c:146:25: sparse:     got void *cpu_addr
   kernel/dma/removed.c:138:6: sparse: sparse: symbol 'removed_free' was not declared. Should it be static?
   kernel/dma/removed.c:187:6: sparse: sparse: symbol 'removed_sync_single_for_device' was not declared. Should it be static?
   kernel/dma/removed.c:193:6: sparse: sparse: symbol 'removed_sync_sg_for_cpu' was not declared. Should it be static?
   kernel/dma/removed.c:199:6: sparse: sparse: symbol 'removed_sync_sg_for_device' was not declared. Should it be static?
>> kernel/dma/removed.c:213:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *remapped_address @@
   kernel/dma/removed.c:213:17: sparse:     expected void volatile [noderef] __iomem *addr
   kernel/dma/removed.c:213:17: sparse:     got void *remapped_address
   kernel/dma/removed.c:211:6: sparse: sparse: symbol 'removed_unremap' was not declared. Should it be static?
>> kernel/dma/removed.c:228:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *( *remap )( ... ) @@     got void [noderef] __iomem *( * )( ... ) @@
   kernel/dma/removed.c:228:35: sparse:     expected void *( *remap )( ... )
   kernel/dma/removed.c:228:35: sparse:     got void [noderef] __iomem *( * )( ... )
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

vim +107 kernel/dma/removed.c

    70	
    71	void *removed_alloc(struct device *dev, size_t size, dma_addr_t *handle,
    72			    gfp_t gfp, unsigned long attrs)
    73	{
    74		bool no_kernel_mapping = attrs & DMA_ATTR_NO_KERNEL_MAPPING;
    75		bool skip_zeroing = attrs & DMA_ATTR_SKIP_ZEROING;
    76		int pageno;
    77		unsigned long order;
    78		void __iomem *addr = NULL;
    79		struct removed_region *dma_mem = dev->removed_mem;
    80		int nbits;
    81		unsigned int align;
    82	
    83		if (!gfpflags_allow_blocking(gfp))
    84			return NULL;
    85	
    86		size = PAGE_ALIGN(size);
    87		nbits = size >> PAGE_SHIFT;
    88		order = get_order(size);
    89	
    90		if (order > get_order(SZ_1M))
    91			order = get_order(SZ_1M);
    92	
    93		align = (1 << order) - 1;
    94	
    95	
    96		mutex_lock(&dma_mem->lock);
    97		pageno = bitmap_find_next_zero_area(dma_mem->bitmap, dma_mem->nr_pages,
    98							0, nbits, align);
    99	
   100		if (pageno < dma_mem->nr_pages) {
   101			phys_addr_t base = dma_mem->base + pageno * PAGE_SIZE;
   102			*handle = base;
   103	
   104			bitmap_set(dma_mem->bitmap, pageno, nbits);
   105	
   106			if (no_kernel_mapping && skip_zeroing) {
 > 107				addr = (void *)NO_KERNEL_MAPPING_DUMMY;
   108				goto out;
   109			}
   110	
   111			addr = ioremap_wc(base, size);
   112			if (WARN_ON(!addr)) {
   113				bitmap_clear(dma_mem->bitmap, pageno, nbits);
   114			} else {
   115				if (!skip_zeroing)
   116					memset_io(addr, 0, size);
   117				if (no_kernel_mapping) {
   118					iounmap(addr);
 > 119					addr = (void *)NO_KERNEL_MAPPING_DUMMY;
   120				}
   121				*handle = base;
   122			}
   123		}
   124	
   125	out:
   126		mutex_unlock(&dma_mem->lock);
 > 127		return addr;
   128	}
   129	
   130	
   131	int removed_mmap(struct device *dev, struct vm_area_struct *vma,
   132			 void *cpu_addr, dma_addr_t dma_addr, size_t size,
   133			 unsigned long attrs)
   134	{
   135		return -ENXIO;
   136	}
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
   216	const struct dma_map_ops removed_dma_ops = {
   217		.alloc			= removed_alloc,
   218		.free			= removed_free,
   219		.mmap			= removed_mmap,
   220		.map_page		= removed_map_page,
   221		.unmap_page		= removed_unmap_page,
   222		.map_sg			= removed_map_sg,
   223		.unmap_sg		= removed_unmap_sg,
   224		.sync_single_for_cpu	= removed_sync_single_for_cpu,
   225		.sync_single_for_device	= removed_sync_single_for_device,
   226		.sync_sg_for_cpu	= removed_sync_sg_for_cpu,
   227		.sync_sg_for_device	= removed_sync_sg_for_device,
 > 228		.remap			= removed_remap,
   229		.unremap		= removed_unremap,
   230	};
   231	EXPORT_SYMBOL(removed_dma_ops);
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
