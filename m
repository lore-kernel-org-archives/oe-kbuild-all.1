Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD927725
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689164816; x=1720700816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7ZaJnP58lB4iUCf5rYJccQnvTwV2uQ8K8NAEi1wHXc=;
  b=Ezc0tdWSS1z8nbjDH8Tie/5knlL+P0QhqP9ybGAqbf0OffI6ShPO6A0u
   j7Qgfh+RB9HYHUcXP2Mgbn4D7QeBFo8RgbDk8wOAFm8eayflZeCHzQm2D
   eMgRkfmV/zKZYTQwHg84di3EIhIxJn/CdOwqjel7+kQA+m28Rmaknhs4t
   /4cVlCLUQ0fBjaOXd/DcHcKtMRHxAJVCvrnS5aVDk1Gc/GQS6bx3YFEPJ
   q0aqPhU6Ct9rJI8z5w+WpOWZMlxvjW0QFtcizlJZ9aESrkGfXLvXw/5+7
   wPAcO262AXxIt75WbSsNZVLYgW4A7EelKBfjo9044xGUP6zxGCu1Jhoip
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431008807"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="431008807"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 05:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="721492651"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="721492651"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jul 2023 05:26:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJYvl-0005gB-1u;
	Wed, 12 Jul 2023 12:26:53 +0000
Date: Wed, 12 Jul 2023 20:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 70/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:678:71: error: passing
 argument 3 of 'dma_alloc_coherent' from incompatible pointer type
Message-ID: <202307122032.xxclFvZZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3f6fc48703e02597683babc04c512ca13bb95e19
commit: f96cac9d383d166bb0a7d85437ed2d87ee8610e9 [70/83] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: powerpc-randconfig-r003-20230712 (https://download.01.org/0day-ci/archive/20230712/202307122032.xxclFvZZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122032.xxclFvZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122032.xxclFvZZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'nvkm_gsp_mem_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:678:71: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     678 |         mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
         |                                                                       ^~~~~~~~~~
         |                                                                       |
         |                                                                       u64 * {aka long long unsigned int *}
   In file included from include/linux/dma-map-ops.h:9,
                    from arch/powerpc/include/asm/pci.h:12,
                    from include/linux/pci.h:2007,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:22:
   include/linux/dma-mapping.h:421:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     421 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'nvkm_gsp_radix3_sg':
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1007:55: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1007 |                                                       &rx3->mem[i].addr, GFP_KERNEL);
         |                                                       ^~~~~~~~~~~~~~~~~
         |                                                       |
         |                                                       u64 * {aka long long unsigned int *}
   include/linux/dma-mapping.h:421:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     421 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_alloc_coherent +678 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

   673	
   674	static int
   675	nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
   676	{
   677		mem->size = size;
 > 678		mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
   679		if (WARN_ON(!mem->data))
   680			return -ENOMEM;
   681	
   682		return 0;
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
