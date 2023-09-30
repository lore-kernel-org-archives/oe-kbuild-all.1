Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663858F5F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696068809; x=1727604809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YsXJ/ZDaEZzF3G0cyTl+tsc2JKmY3Has9mgpetsvgPw=;
  b=iMucURP+8y4xUL5ygsJCKNNsX5uh3o+WEp8KxOvCk73MLL/SRBCKtb3t
   qKDSYDlVPhSk4qF25qEdy8epz7Z7wmYPylqKiMXlF0JM4gYOzjSki1aPk
   HZRcmK83fhakHKNvwnte+yYYionK3GmBg+uBPFC+uwdYf0zjydQUy6zdM
   YjPjudG5dHrpL3LjSZLtmfEsRI7w4hQgV/DBNsY8wRr6wte5g9fBk4tw3
   BWxm4aHxa3qjoUAJ4TFtiVo8aAlpYD7vnXsx5WCrl1yZEumJjcU4w8zjH
   GI+kKDB8Bv3UnaG48BhBBGfwuwSJoui1AbxFVb+YQGhCBl3bQH1aFnqea
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386307105"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="386307105"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 03:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="1109073"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2023 03:13:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmWyS-00041N-1V;
	Sat, 30 Sep 2023 10:13:24 +0000
Date: Sat, 30 Sep 2023 18:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: [asahilinux:isp/t602x-v2 1/67]
 drivers/media/platform/apple/isp/isp-iommu.c:55:22: error: implicit
 declaration of function 'vmap'; did you mean 'kmap'?
Message-ID: <202309301838.QafG64l1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/t602x-v2
head:   1c5cf609edca9f5624e2b2dd3439147c2760d716
commit: 3bc6aecad46a90094440296f92eded4336ee4415 [1/67] media: apple: Add Apple ISP driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230930/202309301838.QafG64l1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301838.QafG64l1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301838.QafG64l1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:32,
                    from include/drm/drm_mm.h:51,
                    from drivers/media/platform/apple/isp/isp-drv.h:12,
                    from drivers/media/platform/apple/isp/isp-cam.h:7,
                    from drivers/media/platform/apple/isp/isp-cam.c:6:
   drivers/media/platform/apple/isp/isp-cam.c: In function 'isp_ch_load_setfile':
>> drivers/media/platform/apple/isp/isp-cam.c:378:35: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-cam.c:378:17: note: in expansion of macro 'dev_err'
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-cam.c:378:59: note: format string is defined here
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                                                         ~~^
         |                                                           |
         |                                                           long unsigned int
         |                                                         %x
--
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from include/linux/iommu.h:10,
                    from drivers/media/platform/apple/isp/isp-drv.c:12:
   drivers/media/platform/apple/isp/isp-drv.c: In function 'apple_isp_resv_region':
   drivers/media/platform/apple/isp/isp-drv.h:252:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     252 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:252:9: note: in expansion of macro 'dev_dbg'
     252 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:111:9: note: in expansion of macro 'isp_dbg'
     111 |         isp_dbg(isp, "reserving: %d: phys: 0x%llx size: 0x%llx iova: 0x%llx\n",
         |         ^~~~~~~
>> drivers/media/platform/apple/isp/isp-drv.h:252:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     252 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:252:9: note: in expansion of macro 'dev_dbg'
     252 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:111:9: note: in expansion of macro 'isp_dbg'
     111 |         isp_dbg(isp, "reserving: %d: phys: 0x%llx size: 0x%llx iova: 0x%llx\n",
         |         ^~~~~~~
--
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
>> drivers/media/platform/apple/isp/isp-iommu.c:135:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for COMMON_CLK_APPLE_NCO
   Depends on [n]: COMMON_CLK [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])


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
    72	static void isp_surf_unreserve_iova(struct apple_isp *isp,
    73					    struct isp_surf *surf)
    74	{
    75		if (surf->mm) {
    76			mutex_lock(&isp->iovad_lock);
    77			drm_mm_remove_node(surf->mm);
    78			mutex_unlock(&isp->iovad_lock);
    79			kfree(surf->mm);
    80		}
    81		surf->mm = NULL;
    82	}
    83	
    84	static int isp_surf_reserve_iova(struct apple_isp *isp, struct isp_surf *surf)
    85	{
    86		int err;
    87	
    88		surf->mm = kzalloc(sizeof(*surf->mm), GFP_KERNEL);
    89		if (!surf->mm)
    90			return -ENOMEM;
    91	
    92		mutex_lock(&isp->iovad_lock);
    93		err = drm_mm_insert_node_generic(&isp->iovad, surf->mm,
    94						 ALIGN(surf->size, 1UL << isp->shift),
    95						 1UL << isp->shift, 0, 0);
    96		mutex_unlock(&isp->iovad_lock);
    97		if (err < 0) {
    98			dev_err(isp->dev, "failed to reserve 0x%llx of iova space\n",
    99				surf->size);
   100			goto mm_free;
   101		}
   102	
   103		surf->iova = surf->mm->start;
   104	
   105		return 0;
   106	mm_free:
   107		kfree(surf->mm);
   108		surf->mm = NULL;
   109		return err;
   110	}
   111	
   112	static void isp_surf_iommu_unmap(struct apple_isp *isp, struct isp_surf *surf)
   113	{
   114		iommu_unmap(isp->domain, surf->iova, surf->size);
   115		apple_isp_iommu_invalidate_tlb(isp);
   116		sg_free_table(&surf->sgt);
   117	}
   118	
   119	static int isp_surf_iommu_map(struct apple_isp *isp, struct isp_surf *surf)
   120	{
   121		unsigned long size;
   122		int err;
   123	
   124		err = sg_alloc_table_from_pages(&surf->sgt, surf->pages,
   125						surf->num_pages, 0, surf->size,
   126						GFP_KERNEL);
   127		if (err < 0) {
   128			dev_err(isp->dev, "failed to alloc sgt from pages\n");
   129			return err;
   130		}
   131	
   132		size = iommu_map_sgtable(isp->domain, surf->iova, &surf->sgt,
   133					 IOMMU_READ | IOMMU_WRITE);
   134		if (size < surf->size) {
 > 135			dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
   136				surf->iova);
   137			sg_free_table(&surf->sgt);
   138			return -ENXIO;
   139		}
   140	
   141		return 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
