Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FED256F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 11:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676286677; x=1707822677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XaGs5rBIxy7TerjuvDBGRYqQhfD7WqxbsdKR5xBD7Qo=;
  b=CVq6uWBi8xSSbe2WIS8OwTnB4CwaxoFd1pRWyg9JBIg4HahDGwlYwlQT
   SCvksJaf9seQN1iSy47/wolgqjPIhvso0TUIATWtLvgAgysejrmi9qtQP
   sYrAwDLrTHsI1Bmx8WySjt+jU/Csju+9hlNGTUJcGNvy2DQTp3wpu6YNm
   7I2rio3hkZQVN1Z6eK9N63rV7qhLzH7SgqCjWaHJ2h/YIJSI/7IGvs6Ay
   yVLh+Mp4BRHHjw53O/xONe4pQWFrI9xs0p8Hjbq8Nsu5OrvP9v1DGslVE
   DSpnyXtc9u9Oxiyo/w7Xxxssyk1eOARgO7WWo1Gei/RXYUAZTisy8VAq+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332176295"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="332176295"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 03:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="668775603"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="668775603"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Feb 2023 03:11:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRWjq-0007hp-2z;
	Mon, 13 Feb 2023 11:11:14 +0000
Date: Mon, 13 Feb 2023 19:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 183/193]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:642:71: error: passing
 argument 3 of 'dma_alloc_coherent' from incompatible pointer type
Message-ID: <202302131936.us5WXjuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   ab3448c2873e0fbcf1fd710cccb52dc548bdf449
commit: e5a4b3a2f16e4dac606a44ae4a3ab43240c0fca8 [183/193] drm/nouveau/gsp/tu102-: add support for booting GSP-RM
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302131936.us5WXjuQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout e5a4b3a2f16e4dac606a44ae4a3ab43240c0fca8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131936.us5WXjuQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c: In function 'nvkm_gsp_mem_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:642:71: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     642 |         mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
         |                                                                       ^~~~~~~~~~
         |                                                                       |
         |                                                                       u64 * {aka long long unsigned int *}
   In file included from include/linux/pci.h:2477,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:22:
   include/linux/dma-mapping.h:421:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     421 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c: In function 'r525_gsp_oneinit':
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:1107:58: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1107 |                                                          &gsp->radix3[i].addr, GFP_KERNEL);
         |                                                          ^~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          u64 * {aka long long unsigned int *}
   In file included from include/linux/pci.h:2477,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c:22:
   include/linux/dma-mapping.h:421:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     421 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_alloc_coherent +642 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r525.c

   637	
   638	static int
   639	nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
   640	{
   641		mem->size = size;
 > 642		mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
   643		if (WARN_ON(!mem->data))
   644			return -ENOMEM;
   645	
   646		return 0;
   647	}
   648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
