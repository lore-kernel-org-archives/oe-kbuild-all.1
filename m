Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D723B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681814799; x=1713350799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Lc7ckMEXWGuEzWnd4Ve5C3ryQSlGtes0BIQ9EnJ+kg=;
  b=lHPGSsoO/7r0hgbxV/pzJM9JtXPxfRwGKnlGZr3+eXnPVgmTosI4crWD
   NuGp5WHhsZdmco0NSjjN1QnX3dAvLD+sNBtlo95NHdXfKWsSGG2Gaz49u
   kgIh28QB57d75bAPIV1lGKFyh18W9eRR7Tzge6CuMMgfFpPdPHOjhR1mm
   Y+gkuTDF2bdifRCKffWInN7MdiiHCwlcjWHTL4ioW/9ptkq7NlijFxXhN
   Cbg+lHfpyvsmV0PaKKhf41XCiDdTilRQqxj2TA4PEIQyWnduVrm+QFbx0
   duVQyXh6bJh7FTQ2RjY1FdAF3gKctlJ40TpktgmT/JqPa7SYTwgX/pZtM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325474035"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="325474035"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 03:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="760313945"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="760313945"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2023 03:46:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poir4-000dHP-04;
	Tue, 18 Apr 2023 10:46:34 +0000
Date: Tue, 18 Apr 2023 18:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14351/29414]
 kernel/dma/removed.c:71:7: warning: no previous prototype for
 'removed_alloc'
Message-ID: <202304181822.RQM5dZ0Y-lkp@intel.com>
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
head:   9b68392a2b5860995364db295d0d869b413fdfdf
commit: c9a574054dbbc299aac39781a1d19a36fe0bc35a [14351/29414] ANDROID: GKI: drivers: Add dma removed ops
config: arm-randconfig-r046-20230416 (https://download.01.org/0day-ci/archive/20230418/202304181822.RQM5dZ0Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout c9a574054dbbc299aac39781a1d19a36fe0bc35a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash M=kernel/dma

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181822.RQM5dZ0Y-lkp@intel.com/

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


vim +/removed_alloc +71 kernel/dma/removed.c

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
https://github.com/intel/lkp-tests
