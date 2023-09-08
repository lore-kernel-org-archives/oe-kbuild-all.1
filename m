Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23189136F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694150033; x=1725686033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bB2Fv/lY6YYKKpTzd21epljZECaBPdMVkhEfhxLo5Dc=;
  b=fHMaWio16MOOBfOvpFWhV8o++F2s8PhbT/G4982FvvmcLjOYK5xzWrsZ
   j3ZHjpn9Qf+jqQ7TqgJ36/r569lZD6NKo+VybOSshRc4kdbC6PZqAyeUy
   N+/bsWO86kzh+TG7fzBzEOdTNUfJmq8hxSyF0hWgpj/CXvRmzImO4bmyi
   nPzpHc06V4yq2XlmZwHri5FsaXN/Ghe3T37jXGo57NnLfjjdTMBX0a5cY
   sR8V4Wb6JAopOi9Q/gv20wSK/l+pJXCq7ZNiCgjXESG2i9u7w74gjpiCj
   lXqTweBoNfDTdMBy4I+U51AFUqDYGfQcrrtm3BcHvAOVN2ZGOXeav9FYv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376469849"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="376469849"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 22:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777411285"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="777411285"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 22:13:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeToS-0001wZ-0W;
	Fri, 08 Sep 2023 05:13:48 +0000
Date: Fri, 8 Sep 2023 13:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:isp/heap-alloc 109/132]
 drivers/media/platform/apple/isp/isp-iommu.c:55:22: error: implicit
 declaration of function 'vmap'; did you mean 'kmap'?
Message-ID: <202309081355.55R3lERr-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309081355.55R3lERr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081355.55R3lERr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081355.55R3lERr-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for COMMON_CLK_APPLE_NCO
   Depends on [n]: COMMON_CLK [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


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
