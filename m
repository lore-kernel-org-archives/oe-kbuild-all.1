Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC405EA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 01:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694136651; x=1725672651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ym1wfieIJXs7iXWykYyZi95G17qUWzDDZO6XsBYu/Tw=;
  b=h4wH8vtK/k7tNCJQzXHqVuhr5c7ILQklfD0KgdRtNbxGUPv/EepaZzSl
   lrFxTRisH1R3hBSduJ3u8+gr2spPiNGMW+V6+lAmlKvQT3ZJVCMYzl35Z
   iSdvzev/SprmpqokcllMP7ZR/Ky6q58Qtw6K3yvO7IaOTFXRWmCxNqwE+
   UGdUa11q8U22Hy3e/6LsbLzGGkPsBCYyD8bSFuphAWx+tRola8LU0ZIaY
   vooFlr5X64YKmSavSGsupRe5Hl2TvEmXSoLzklvky/WAtCsZ2rxmJFeDM
   QqHhPchrORqDkpMgTnSLfLgBmkMIW85qovAdpGKtXp6sxnBQedBsKzlB9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="443951865"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="443951865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 18:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771511787"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="771511787"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 18:30:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeQKW-0001mz-1r;
	Fri, 08 Sep 2023 01:30:40 +0000
Date: Fri, 8 Sep 2023 09:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:isp/heap-alloc 109/132]
 drivers/media/platform/apple/isp/isp-cam.c:378:35: warning: format '%lx'
 expects argument of type 'long unsigned int', but argument 3 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202309080946.2i5kzQfL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/heap-alloc
head:   d5548fd857a3ca9087e974c8e73d6f487b11c94b
commit: 4d8c45047d73f6f6d25ffe8c6abcf58c5d4b97a4 [109/132] media: apple: Add Apple ISP driver
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309080946.2i5kzQfL-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080946.2i5kzQfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080946.2i5kzQfL-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
                    from ./arch/microblaze/include/generated/asm/bug.h:1,
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


vim +378 drivers/media/platform/apple/isp/isp-cam.c

   361	
   362	static int isp_ch_load_setfile(struct apple_isp *isp, u32 ch)
   363	{
   364		struct isp_format *fmt = isp_get_format(isp, ch);
   365		const struct isp_setfile *setfile = &isp_setfiles[fmt->id];
   366		const struct firmware *fw;
   367		u32 magic;
   368		int err;
   369	
   370		err = request_firmware(&fw, setfile->path, isp->dev);
   371		if (err) {
   372			dev_err(isp->dev, "failed to request setfile '%s': %d\n",
   373				setfile->path, err);
   374			return err;
   375		}
   376	
   377		if (fw->size < setfile->size) {
 > 378			dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
   379				setfile->size);
   380			release_firmware(fw);
   381			return -EINVAL;
   382		}
   383	
   384		magic = be32_to_cpup((__be32 *)fw->data);
   385		if (magic != setfile->magic) {
   386			dev_err(isp->dev, "setfile '%s' corrupted?\n", setfile->path);
   387			release_firmware(fw);
   388			return -EINVAL;
   389		}
   390	
   391		isp_iowrite(isp, isp->data_surf->iova, (void *)fw->data, setfile->size);
   392		release_firmware(fw);
   393	
   394		return isp_cmd_ch_set_file_load(isp, ch, isp->data_surf->iova,
   395						setfile->size);
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
