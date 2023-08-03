Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44378BFF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691034834; x=1722570834;
  h=date:from:cc:subject:message-id:mime-version;
  bh=M0RSPalJN9y+9ZfmAKgYDAGmFXo8U9aQQkq9B4Jpjks=;
  b=Z7aY1PqczVQw6PXt+8UhlVsaXr6cVltgkM/Svh+I/ShZtWL//arNaKYF
   ZY5rVPBe8cUOb2MrSzh7/KHon6A7qkkDypLGXteNhVnmSaOi8+FIu0qil
   uYQ4kqm2vkgW6AxaXXTGbK1jqXgCO9+W9dVzfbqVhF6AvEDhoy0jnMOy7
   QJ/UaCgZ25YAf2jYxR8ykZFK9xL6nJ3xZ+6fuOjjDiSVfYNDbkG8Eh//R
   VutgXV0DMrVJyXYbowjxwce44PYGoPzYXvLk1VIYdtzse5sUBw7zK19yL
   +vgQuuNexUrg2FC1aG2a2f3uMXIQsqLHmX39L7NXKjxOWrz9Ht9BDAngn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368661791"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368661791"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 20:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="975926456"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="975926456"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Aug 2023 20:53:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRPPM-0001jJ-1W
	for oe-kbuild-all@lists.linux.dev;
	Thu, 03 Aug 2023 03:53:52 +0000
Date: Thu, 3 Aug 2023 11:53:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 14046/30000] kernel/dma/removed.c:61:12:
 warning: 'dma_assign_removed_region' defined but not used
Message-ID: <202308031152.Uin7c9eq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: c9a574054dbbc299aac39781a1d19a36fe0bc35a [14046/30000] ANDROID: GKI: drivers: Add dma removed ops
config: i386-randconfig-r004-20230801 (https://download.01.org/0day-ci/archive/20230803/202308031152.Uin7c9eq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031152.Uin7c9eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031152.Uin7c9eq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from kernel/dma/removed.c:6:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1171:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1171 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1162:27: note: 'mem_section' declared here
    1162 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   kernel/dma/removed.c: At top level:
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
>> kernel/dma/removed.c:61:12: warning: 'dma_assign_removed_region' defined but not used [-Wunused-function]
      61 | static int dma_assign_removed_region(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/removed.c:33:12: warning: 'dma_init_removed_memory' defined but not used [-Wunused-function]
      33 | static int dma_init_removed_memory(phys_addr_t phys_addr, size_t size,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/dma_assign_removed_region +61 kernel/dma/removed.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
