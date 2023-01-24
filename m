Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9580D28FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674593964; x=1706129964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0w3wPetlfzUhc7bLqSvTZCcigi8Pur7aOcAQg//ruc=;
  b=nM8g4VKnrRZTTWjcTS2CXQqygo6gUSlD1clbUEEpgsJiapEDDHqG/YeF
   re2eNDVZCsk98KRhK5OMymody8acRAw8Sjov05QTFxfV4oteprW1AJygh
   ssaFiotgLWhWO+KtcxYBiZ3wU2vAsS2t0mZBRgOChZ3zExQb7+wEiRZB1
   R/8uLzX/zYi/7yoTbquu+ZdZSjOxfFnISRK6AD/OblEfRKnxYyrQSFFdN
   eMSMuc2kdMr5ls3AuFV+RSX8Vrauhg0070cR08MIfliLAgCev5OO+mxX5
   MK9zeh+jbcVNBdnFdAie2G8qQ3/vinx/AitHz0gsOchSgw8lK59oWqSWA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="388749638"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="388749638"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 12:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991023498"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="991023498"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2023 12:59:20 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKQNz-0006mK-1c;
	Tue, 24 Jan 2023 20:59:19 +0000
Date: Wed, 25 Jan 2023 04:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14351/28673]
 kernel/dma/removed.c:107:30: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202301250442.Rev83MwD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   70227f90ffc09449645ed1a61e4e3482d9e6816b
commit: c9a574054dbbc299aac39781a1d19a36fe0bc35a [14351/28673] ANDROID: GKI: drivers: Add dma removed ops
config: i386-randconfig-s002-20230123 (https://download.01.org/0day-ci/archive/20230125/202301250442.Rev83MwD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout c9a574054dbbc299aac39781a1d19a36fe0bc35a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash kernel/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> kernel/dma/removed.c:107:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void * @@
   kernel/dma/removed.c:107:30: sparse:     expected void [noderef] <asn:2> *addr
   kernel/dma/removed.c:107:30: sparse:     got void *
>> kernel/dma/removed.c:119:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *[assigned] addr @@     got void * @@
   kernel/dma/removed.c:119:38: sparse:     expected void [noderef] <asn:2> *[assigned] addr
   kernel/dma/removed.c:119:38: sparse:     got void *
>> kernel/dma/removed.c:127:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] <asn:2> *[assigned] addr @@
   kernel/dma/removed.c:127:16: sparse:     expected void *
   kernel/dma/removed.c:127:16: sparse:     got void [noderef] <asn:2> *[assigned] addr
>> kernel/dma/removed.c:71:6: sparse: sparse: symbol 'removed_alloc' was not declared. Should it be static?
>> kernel/dma/removed.c:131:5: sparse: sparse: symbol 'removed_mmap' was not declared. Should it be static?
>> kernel/dma/removed.c:146:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *cpu_addr @@
   kernel/dma/removed.c:146:25: sparse:     expected void volatile [noderef] <asn:2> *addr
   kernel/dma/removed.c:146:25: sparse:     got void *cpu_addr
>> kernel/dma/removed.c:138:6: sparse: sparse: symbol 'removed_free' was not declared. Should it be static?
>> kernel/dma/removed.c:187:6: sparse: sparse: symbol 'removed_sync_single_for_device' was not declared. Should it be static?
>> kernel/dma/removed.c:193:6: sparse: sparse: symbol 'removed_sync_sg_for_cpu' was not declared. Should it be static?
>> kernel/dma/removed.c:199:6: sparse: sparse: symbol 'removed_sync_sg_for_device' was not declared. Should it be static?
>> kernel/dma/removed.c:213:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *remapped_address @@
   kernel/dma/removed.c:213:17: sparse:     expected void volatile [noderef] <asn:2> *addr
   kernel/dma/removed.c:213:17: sparse:     got void *remapped_address
>> kernel/dma/removed.c:211:6: sparse: sparse: symbol 'removed_unremap' was not declared. Should it be static?
>> kernel/dma/removed.c:228:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *( *remap )( ... ) @@     got void [noderef] <asn:2> *( * )( ... ) @@
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

vim +107 kernel/dma/removed.c

    70	
  > 71	void *removed_alloc(struct device *dev, size_t size, dma_addr_t *handle,
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
 > 131	int removed_mmap(struct device *dev, struct vm_area_struct *vma,
   132			 void *cpu_addr, dma_addr_t dma_addr, size_t size,
   133			 unsigned long attrs)
   134	{
   135		return -ENXIO;
   136	}
   137	
 > 138	void removed_free(struct device *dev, size_t size, void *cpu_addr,
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
 > 187	void removed_sync_single_for_device(struct device *dev,
   188				dma_addr_t dma_handle, size_t size,
   189				enum dma_data_direction dir)
   190	{
   191	}
   192	
 > 193	void removed_sync_sg_for_cpu(struct device *dev,
   194				struct scatterlist *sg, int nents,
   195				enum dma_data_direction dir)
   196	{
   197	}
   198	
 > 199	void removed_sync_sg_for_device(struct device *dev,
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
 > 211	void removed_unremap(struct device *dev, void *remapped_address, size_t size)
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
https://github.com/intel/lkp-tests
