Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836815573A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109162; cv=none; b=LPXtqCF4UV9mPc8r6BlLBX8UYvRtZHrIS9Qhnp3vEgjfeC5MMDFLtcROgRchwVFDgNYepLA8qBBZA/4iofq528B9Mu26qpEkXDxPEvoaL7IouenpYpaxoipHUM4lZQLYiI7CXsMkcGQwCJVz71H02a8Q5R7R6fytwVaTtc5xbcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109162; c=relaxed/simple;
	bh=eBCX1aLqb57x7oka3yLW4PEVfIZ0vD7A0B8MGT+HrEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCMvdXeYwHy3BRNwLLDzcTfGRPKn5ffdyMNWcrPYidOH7mvUuX4saS0biEHKAMDnLrtai47KCISjzPiQkWbIYjM+DTckIWMphs4phLU420hsO5NaEwo8j8DwZqqpDKI8akXcaeqYrkKcVw8zsJ/qafbO7PdRQmVFEkvJAVY2CwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtWgtJPH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtWgtJPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734109161; x=1765645161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBCX1aLqb57x7oka3yLW4PEVfIZ0vD7A0B8MGT+HrEs=;
  b=FtWgtJPHQeUV686uL/J3GDl4PXngfG2Z9xj2PWwGNNJkxKqsorNWoZJr
   ePGNb28rNb60IF6qNyaRK8iV+3fzZOXyNdmu9fVY0KYpxk0X/NABsUpn6
   1pbEo3yREkEb7JL3F6RrRANF1JAB73JikK1dT1w260FLgBtST+Bp5EadA
   gEuP91SnBSuIaKn34ah5sc1Riznc6E/1EzkeXUkto7w+z1/eWmWoPD14G
   doYuWdgagGOQ2oHODRA0eWcHjF7UHLNqwPKV8kC9v1EU7ua8UkUmIlTxE
   ZngXUaJl0gLM3mpPhy+mAkeD8TAxrJVWP2bLQ8M3L4UfiQWG2TNzPgGRf
   Q==;
X-CSE-ConnectionGUID: x5wqSPLOQG+T2uCqneX6gA==
X-CSE-MsgGUID: 5hMYput5Q3yNOm+2MQKxKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34614455"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="34614455"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 08:59:19 -0800
X-CSE-ConnectionGUID: 4mU6N31bQQmGW+ENNC0UZg==
X-CSE-MsgGUID: YI5unhccQGuTt4FO8xgypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101160520"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2024 08:59:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM90V-000CFd-0a;
	Fri, 13 Dec 2024 16:59:15 +0000
Date: Sat, 14 Dec 2024 00:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 10395/30000]
 kernel/dma/removed.c:71:7: warning: no previous prototype for
 'removed_alloc'
Message-ID: <202412140004.uMoWoq4H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laura,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: c9a574054dbbc299aac39781a1d19a36fe0bc35a [10395/30000] ANDROID: GKI: drivers: Add dma removed ops
config: i386-buildonly-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241214/202412140004.uMoWoq4H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140004.uMoWoq4H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140004.uMoWoq4H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/removed.c:71:7: warning: no previous prototype for 'removed_alloc' [-Wmissing-prototypes]
      71 | void *removed_alloc(struct device *dev, size_t size, dma_addr_t *handle,
         |       ^~~~~~~~~~~~~
>> kernel/dma/removed.c:131:5: warning: no previous prototype for 'removed_mmap' [-Wmissing-prototypes]
     131 | int removed_mmap(struct device *dev, struct vm_area_struct *vma,
         |     ^~~~~~~~~~~~
>> kernel/dma/removed.c:138:6: warning: no previous prototype for 'removed_free' [-Wmissing-prototypes]
     138 | void removed_free(struct device *dev, size_t size, void *cpu_addr,
         |      ^~~~~~~~~~~~
>> kernel/dma/removed.c:187:6: warning: no previous prototype for 'removed_sync_single_for_device' [-Wmissing-prototypes]
     187 | void removed_sync_single_for_device(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/removed.c:193:6: warning: no previous prototype for 'removed_sync_sg_for_cpu' [-Wmissing-prototypes]
     193 | void removed_sync_sg_for_cpu(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/removed.c:199:6: warning: no previous prototype for 'removed_sync_sg_for_device' [-Wmissing-prototypes]
     199 | void removed_sync_sg_for_device(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/removed.c:211:6: warning: no previous prototype for 'removed_unremap' [-Wmissing-prototypes]
     211 | void removed_unremap(struct device *dev, void *remapped_address, size_t size)
         |      ^~~~~~~~~~~~~~~
>> kernel/dma/removed.c:61:12: warning: 'dma_assign_removed_region' defined but not used [-Wunused-function]
      61 | static int dma_assign_removed_region(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/removed.c:33:12: warning: 'dma_init_removed_memory' defined but not used [-Wunused-function]
      33 | static int dma_init_removed_memory(phys_addr_t phys_addr, size_t size,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/removed_alloc +71 kernel/dma/removed.c

    32	
  > 33	static int dma_init_removed_memory(phys_addr_t phys_addr, size_t size,
    34					struct removed_region **mem)
    35	{
    36		struct removed_region *dma_mem = NULL;
    37		int pages = size >> PAGE_SHIFT;
    38		int bitmap_size = BITS_TO_LONGS(pages) * sizeof(long);
    39	
    40		dma_mem = kzalloc(sizeof(struct removed_region), GFP_KERNEL);
    41		if (!dma_mem)
    42			goto out;
    43		dma_mem->bitmap = kzalloc(bitmap_size, GFP_KERNEL);
    44		if (!dma_mem->bitmap)
    45			goto free1_out;
    46	
    47		dma_mem->base = phys_addr;
    48		dma_mem->nr_pages = pages;
    49		mutex_init(&dma_mem->lock);
    50	
    51		*mem = dma_mem;
    52	
    53		return 0;
    54	
    55	free1_out:
    56		kfree(dma_mem);
    57	out:
    58		return -ENOMEM;
    59	}
    60	
  > 61	static int dma_assign_removed_region(struct device *dev,
    62						struct removed_region *mem)
    63	{
    64		if (dev->removed_mem)
    65			return -EBUSY;
    66	
    67		dev->removed_mem = mem;
    68		return 0;
    69	}
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
   107				addr = (void *)NO_KERNEL_MAPPING_DUMMY;
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
   119					addr = (void *)NO_KERNEL_MAPPING_DUMMY;
   120				}
   121				*handle = base;
   122			}
   123		}
   124	
   125	out:
   126		mutex_unlock(&dma_mem->lock);
   127		return addr;
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
   146			iounmap(cpu_addr);
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
   213		iounmap(remapped_address);
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
