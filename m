Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745ED261
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 04:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9a7jodJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696998246; x=1728534246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4j5xGRZ6Tgdzv8C6x0wuRSbHxvIF37fO8WPlLmfkLOY=;
  b=X9a7jodJV9GLwE3F5BpACbNu0VPLok+y/pnR25J8tPPZD/Cs0m7HP5NY
   jLsem2yA9jCnjsbH6gAi+QplLlXFbv2/YFPj7uYdgqDruDyuJq7else67
   BbnFzlCHcl1mku1pC7g2QyzXHyf/nWH5xu8qTs7F2+O4ymchjbtIGeoBy
   VH2PfP1yup+KFMg6iAKzXaBwv5d7jdC8v2ZgfFp3rCLP+11giAzjrGWr8
   fjRIZT0hbG0UTTJyFCtE1m9azQLlt3dxuH/OwXxHGaVCchqvo0DLqIA9u
   vdjcxBy6WE4MZozueZKR0O+C1kWGo5eomchQ/lzL+xI6bYvHCrVJqBtfh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448776594"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="448776594"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 21:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788845992"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788845992"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 21:23:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqQlJ-0001hp-1U;
	Wed, 11 Oct 2023 04:23:57 +0000
Date: Wed, 11 Oct 2023 12:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 1/51]
 drivers/media/platform/apple/isp/isp-iommu.c:55:22: error: implicit
 declaration of function 'vmap'; did you mean 'kmap'?
Message-ID: <202310111247.gCrhJmGz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   bf894fa59f1b5b234b6eda9bd8e161c7269c54a4
commit: f0f1b152058cd2c9ee3a042da1349a1f88663d82 [1/51] media: apple: Add Apple ISP driver
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231011/202310111247.gCrhJmGz-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111247.gCrhJmGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111247.gCrhJmGz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_surf_vmap':
>> drivers/media/platform/apple/isp/isp-iommu.c:55:22: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
      55 |         surf->virt = vmap(surf->pages, surf->num_pages, VM_MAP,
         |                      ^~~~
         |                      kmap
>> drivers/media/platform/apple/isp/isp-iommu.c:55:57: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
      55 |         surf->virt = vmap(surf->pages, surf->num_pages, VM_MAP,
         |                                                         ^~~~~~
         |                                                         VM_MTE
   drivers/media/platform/apple/isp/isp-iommu.c:55:57: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_surf_vunmap':
>> drivers/media/platform/apple/isp/isp-iommu.c:68:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
      68 |                 vunmap(surf->virt);
         |                 ^~~~~~
         |                 kunmap
   In file included from include/linux/device.h:15,
                    from include/linux/iommu.h:11,
                    from drivers/media/platform/apple/isp/isp-iommu.c:4:
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_surf_iommu_map':
   drivers/media/platform/apple/isp/isp-iommu.c:135:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     135 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:135:17: note: in expansion of macro 'dev_err'
     135 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:135:73: note: format string is defined here
     135 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function '__isp_alloc_surface':
   drivers/media/platform/apple/isp/isp-iommu.c:181:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     181 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:180:17: note: in expansion of macro 'dev_err'
     180 |                 dev_err(isp->dev,
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:181:71: note: format string is defined here
     181 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                                                                    ~~~^
         |                                                                       |
         |                                                                       long long unsigned int
         |                                                                    %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_alloc_surface_vmap':
   drivers/media/platform/apple/isp/isp-iommu.c:211:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     211 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:211:17: note: in expansion of macro 'dev_err'
     211 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:211:61: note: format string is defined here
     211 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                                          ~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                          %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'apple_isp_iommu_map_sgt':
   drivers/media/platform/apple/isp/isp-iommu.c:259:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     259 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:259:17: note: in expansion of macro 'dev_err'
     259 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:259:73: note: format string is defined here
     259 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %x
   cc1: some warnings being treated as errors


vim +55 drivers/media/platform/apple/isp/isp-iommu.c

    52	
    53	int isp_surf_vmap(struct apple_isp *isp, struct isp_surf *surf)
    54	{
  > 55		surf->virt = vmap(surf->pages, surf->num_pages, VM_MAP,
    56				  pgprot_writecombine(PAGE_KERNEL));
    57		if (surf->virt == NULL) {
    58			dev_err(isp->dev, "failed to vmap size 0x%llx\n", surf->size);
    59			return -EINVAL;
    60		}
    61	
    62		return 0;
    63	}
    64	
    65	static void isp_surf_vunmap(struct apple_isp *isp, struct isp_surf *surf)
    66	{
    67		if (surf->virt)
  > 68			vunmap(surf->virt);
    69		surf->virt = NULL;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
